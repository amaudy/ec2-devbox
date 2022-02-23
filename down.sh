#!/bin/bash

if [ -f "devboxkeypair.pem" ]; then
    echo "Delete existing keypair"
    rm devboxkeypair.pem
fi

terraform destroy --auto-approve