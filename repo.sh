rm -rf ~/server/11/sources
mkdir ~/server/11/sources
cd ~/server/11/tools
sh repo-adhoc.sh
sh repo-oca.sh
cd ~/server/11/sources
find . -name "oca_dependencies.txt" -type f -delete
cd ~/server/11
touch oca_dependencies.txt
./maintainer-quality-tools/travis/clone_oca_dependencies sources/ .