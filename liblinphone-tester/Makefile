############################################################################
# Makefile
# Copyright (C) 2014  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
############################################################################

DEVICE?=169.254.0.1
PASSWORD?=1234
DEBUG_TOKEN?=~/.rim/debugtoken1.bar

WORKING_DIR=$(shell pwd)

all: package

clean:
	rm -rf $(WORKING_DIR)/arm

package:
	mkdir -p $(WORKING_DIR)/arm && \
	cp $(WORKING_DIR)/../WORK/bb10-arm/Build/linphone/tester/liblinphone_tester $(WORKING_DIR)/arm/ && \
	blackberry-nativepackager -package -devMode -debugToken $(DEBUG_TOKEN) -configuration Device-Debug liblinphone-tester.bar bar-descriptor.xml

install: package
	blackberry-nativepackager -installApp -device $(DEVICE) -password $(PASSWORD) liblinphone-tester.bar

run: install
	blackberry-nativepackager -launchApp -device $(DEVICE) -password $(PASSWORD) liblinphone-tester.bar
	blackberry-deploy -terminateApp -device $(DEVICE) -password $(PASSWORD) liblinphone-tester.bar
	ssh bb10 'sh -c "cd /accounts/1000/appdata/com.belledonne_communications.liblinphone_tester* && LD_LIBRARY_PATH=app/native/lib app/native/liblinphone_tester --resource-dir app/native/assets/ --writable-dir tmp/ --verbose --disable-leak-detector"'

uninstall:
	blackberry-deploy -uninstallApp -device $(DEVICE) -password $(PASSWORD) liblinphone-tester.bar
