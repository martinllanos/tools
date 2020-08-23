# GUIA DE INSTALACIÓN DE ODOO 12 CE CON VIRTUALENV SOBRE UBUNTU 18.04
##
## Actualiza sistema
* `sudo add-apt-repository universe && sudo apt-get update && sudo apt-get upgrade`
## Instalando Herramientas zip unzip mc supervisor
* `sudo apt-get install zip unzip mc supervisor -y`
## Instalando VirtualEnv
* `sudo apt-get install python3.6-dev python3.6-venv python3-pip python3-libxml2 libxml2-dev libxslt1-dev libcups2-dev libmysqlclient-dev libldap2-dev libsasl2-dev libssl-dev swig wkhtmltopdf nodejs node-clean-css node-less`
## Descargamos las fuentes
* `sudo apt-get install xfonts-75dpi`
## Instalamos wkhtmltopdf
* `sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz`
* `sudo tar Jvfx wkhtmltox-0.12.4_linux-generic-amd64.tar.xz`
* `sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz`
* `sudo tar Jvfx wkhtmltox-0.12.4_linux-generic-amd64.tar.xz`
* `echo copiamos en /usr/local/bin/`
* `sudo cp wkhtmltox/bin/wkhtmltopdf /usr/local/bin/`
* `sudo cp wkhtmltox/bin/wkhtmltoimage /usr/local/bin/`
* `sudo cp wkhtmltox/bin/wkhtmltopdf /usr/bin/`
* `sudo cp wkhtmltox/bin/wkhtmltoimage /usr/bin/`
## Instalamos aeroo con docker
* `sudo apt-get install docker.io -y`
* `sudo docker run -p 0.0.0.0:8989:8989 --name="aeroo" --restart=always -d adhoc/aeroo-docs`
## Instalando PostgreSQL
* `sudo apt-get install -y postgresql postgresql-contrib`
## Creando usuario Postgres
* `sudo -u postgres psql -c "CREATE USER odoo WITH PASSWORD 'odoo';"`
* `sudo -u postgres psql -c "ALTER USER odoo WITH PASSWORD 'odoo';"`
* `sudo -u postgres psql -c "ALTER ROLE odoo WITH CREATEDB;"`
## Creamos el usuario Odoo
* `sudo useradd -m -d /home/odoo -U -r -s /bin/bash odoo`
* `sudo usermod -aG sudo,www-data odoo`
* `sudo passwd odoo`
* `sudo su - odoo`
## Creamos ambiente y carpetas
* `python3 -m venv /home/odoo/server/12`
* `cd /home/odoo/server/12`
* `source bin/activate`
## Actualizamos pip, wheel y setuptools
* `pip3 install --upgrade pip && pip3 install --upgrade setuptools && pip3 install wheel phonenumbers`
## Clonando e instalando ODOO 
* `git clone --depth 1 --branch 12.0 --single-branch https://www.github.com/odoo/odoo`
* `pip3 install -r odoo/requirements.txt`
## Herramienta de actualizacion de repositorios
* cd /home/odoo/server/12
* git clone https://github.com/OCA/maintainer-quality-tools.git
* sed -i 's/8.0/12.0/g' ./maintainer-quality-tools/travis/clone_oca_dependencies
## Generando archivo conf
* `odoo/odoo-bin -c odoo.conf -s --stop-after-init --db_host=localhost --db_user=odoo --db_password=odoo`
## Creando estructura para repositorio cliente
* `cd /home/odoo/server/12`
* `git clone -b 12.0 https://github.com/marionumza/tools.git`
* `mkdir clientes`
* `cd /home/odoo/server/12/clientes`
* `git clone -b 12.0 [repositorio del cliente] [nombre del cliente sin el prefijo cli]`
* `cd /home/odoo/server/12/clientes/[repositorio del cliente]/tools/repo.sh`
## Copiar el path en el archivo conf

Una ves terminada la instalación copiar el path que quedo en la terminal, en el archivo conf y luego levantar odoo 
* cd /home/odoo/server/12
* source bin/activate
* odoo/odoo-bin -c odoo.conf
