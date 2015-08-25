#!/bin/bash

set -e

service carbon-cache start
service apache2 start
service elasticsearch start


bash
