#!/bin/bash -eu

# This script generates a commit that updates our copy of OOjs UI

if [ -n "${2:-}" ]
then
	# Too many parameters
	echo >&2 "Usage: $0 [<version>]"
	exit 1
fi

REPO_DIR=$(cd "$(dirname $0)/.."; pwd) # Root dir of the git repo working tree
TARGET_DIR="lib/oojs-ui" # Destination relative to the root of the repo
NPM_DIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'update-oojs-ui') # e.g. /tmp/update-oojs-ui.rI0I5Vir

# Prepare working tree
cd "$REPO_DIR"
git reset -- $TARGET_DIR
git checkout -- $TARGET_DIR
git fetch origin
git checkout -B upstream-oojs-ui origin/master

# Fetch upstream version
cd $NPM_DIR
if [ -n "${1:-}" ]
then
	npm install "oojs-ui@$1"
else
	npm install oojs-ui
fi

OOJSUI_VERSION=$(node -e 'console.log(require("./node_modules/oojs-ui/package.json").version);')
if [ "$OOJSUI_VERSION" == "" ]
then
	echo 'Could not find OOjs UI version'
	exit 1
fi

# Copy files
# - Exclude the minimised distribution files
# - Support: IE9
#   VE requires SVG support, but IE9 doesn't support the CSS background fallback
#   so ends up using the PNGs. Otherwise they would not be required.
rsync --force --recursive --delete --exclude 'oojs-ui*.min.*' --exclude 'oojs-ui.js' ./node_modules/oojs-ui/dist/ "$REPO_DIR/$TARGET_DIR"

# Clean up temporary area
rm -rf "$NPM_DIR"

# Generate commit
cd $REPO_DIR

COMMITMSG=$(cat <<END
Update OOjs UI to v$OOJSUI_VERSION

Release notes:
 https://phabricator.wikimedia.org/diffusion/GOJU/browse/master/History.md;v$OOJSUI_VERSION
END
)

# Stage deletion, modification and creation of files. Then commit.
git add --update $TARGET_DIR
git add $TARGET_DIR
git commit -m "$COMMITMSG"
