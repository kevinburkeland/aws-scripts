#!/bin/bash
aws ec2 run-instances --image-id ami-0892d3c7ee96c0bf7 --count 1 --instance-type t2.micro --key-name kevin-btc --security-group-ids sg-00f8d8391c8ba27dd --user-data file://kickstart.sh