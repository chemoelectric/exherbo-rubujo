#!/usr/bin/python@@SLOT@@

import os, sys

valid_opts = [ '--prefix', '--exec-prefix', '--includes', '--libs', '--cflags', '--ldflags', '--help' ]

def exit_with_usage(returncode):
	print('Usage: {0} [{1}]'.format(sys.argv[0], output_opts()))
	sys.exit(returncode)

def output_opts():
	return '|'.join(valid_opts)

def exec_pkgconfig_cmd(pkgconfig_arg):
	os.system('PKG_CONFIG_PATH=@@PKG_CONFIG_PATH@@ pkg-config {0} python-@@SLOT@@'.format(pkgconfig_arg))

if len(sys.argv) == 1:
	exit_with_usage(1)
else:
	if sys.argv[1] == '--help':
		exit_with_usage(0)
	elif sys.argv[1] == '--prefix':
		exec_pkgconfig_cmd('--variable=prefix')
	elif sys.argv[1] == '--exec-prefix':
		exec_pkgconfig_cmd('--variable=exec-prefix')
	elif sys.argv[1] == '--includes':
		exec_pkgconfig_cmd('--cflags-only-I')
	elif sys.argv[1] == '--cflags':
		exec_pkgconfig_cmd('--cflags')
	elif sys.argv[1] == '--libs':
		exec_pkgconfig_cmd('--libs-only-l')
	elif sys.argv[1] == '--ldflags':
		exec_pkgconfig_cmd('--libs')
	else:
		print('Unrecognized argument: {0}'.format(sys.argv[1]))
		exit_with_usage(1)
