rm -rf ~/server/11/sources
mkdir ~/server/11/sources
cd ~/server/11/
sh repo-adhoc.sh
sh repo-oca.sh
sh repo-it-labs.sh
cd ~/server/11/sources
find . -name "oca_dependencies.txt" -type f -delete
cd ~/server/11
./maintainer-quality-tools/travis/clone_oca_dependencies sources/ .