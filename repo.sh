cd ~/server/12/tools
sh repo-adhoc.sh
sh repo-oca.sh
sh repo-itpp-labs.sh
sh repo-regaby.sh
#sh repo-crumges.sh
cd ~/server/12/sources
find . -name "oca_dependencies.txt" -type f -delete
cd ~/server/12/
sources bin/activate
cd ~/server/12
./maintainer-quality-tools/travis/clone_oca_dependencies sources/ .
cd ~/server/12
rm odoo.conf
cd ~/server/12
odoo/odoo-bin -c odoo.conf -s --stop-after-init --db_host=localhost --db_user=odoo --db_password=odoo
find ~/server/12/sources -mindepth 1 -maxdepth 1 -type d | sort | tr '\n' ','