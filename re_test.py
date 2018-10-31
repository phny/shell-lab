#!/usr/bin/python

import os
import re
import sys

input_file = sys.argv[1]
for line in open(input_file):
	r = re.search('(^.*?),(.*)', line)
	host = r.group(1)
	print (host)
