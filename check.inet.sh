#!/bin/bash
# Creation date: 2013.11.19


# sometimes I don't know if I'm connected or not
# sometimes internet takes a while to come back

until ping -w1 -c1 google.com; do sleep 5; done && echo "--- INET READY ! ---"
