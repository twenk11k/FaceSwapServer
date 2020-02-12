virtualenv -p python env
source ./env/bin/activate
pip install -r requirements.txt
deactivate
echo "Virtual Environment Setup!"
