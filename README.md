Moz-Grid-Config
===============

Configuration and launch scripts for Mozilla's [Selenium Grid] environment.

[Selenium Grid]: http://selenium-grid.seleniumhq.org/

Prerequisites
-------------

  1. [Java Runtime Environment]
  2. [ANT]

[Java Runtime Environment]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
[ANT]: http://ant.apache.org/

Configuration
-------------

Default properties are set in `default.properties`, and these can be overridden
for an individual machine by providing a `<HOSTNAME>.properties` file. Any
properties in this file will override the default. To find out your hostname
run `ant debug` in the location you've checked out this project and look for
something that looks like the following line:

    [echoproperties] env.HOSTNAME=LokiMac.local

In this example the hostname is `LokiMac.local` so your properties file will be
`LokiMac.local.properties`

The hub configuration is stored in `hub_configuration.json`.

Properties
----------

Below are the properties that can be configured:

**selenium.version**

The version number of Selenium to use. This is used to locate the library,
for example a value of `2.0rc2` will load the library
`lib/selenium-server-standalone-2.0rc2.jar`

**hub.host**

The host that the hub is running on. This is used when registering nodes with
the hub.

**hub.port**

The port that the hub is running on. Also used when registering nodes with the
hub.

**node.configuration**

Configuration file for the Selenium node, including browser capabilities.

**rc.arguments**

Any additional arguments to pass to an RC node when it's launched. For
example, *-singleWindow* would launch the Selenium and the application under
test in the same window using frames.

**custom.firefox.profile**

The path of a custom Firefox profile to use. If this property is specified but
the value is empty then Selenium will not provide the *-firefoxProfileTemplate*
command line argument and a fresh profile will be generated. Note that the
Firefox profile needs to be located in `firefoxprofiles` directory, and the
value of this property is the relative path within `firefoxprofiles`.

Launching a Selenium hub
------------------------

Run the following command from the project's location:

    ant launch-hub

Launching a Selenium node
-------------------------

Run the following command from the project's location:

    ant launch-node

Specifying properties on the command line
-----------------------------------------

You can override any of the properties from `default.properties` or
`<HOSTNAME>.properties` on the command line by passing them in the format
`-D<PROPERTY>=<VALUE>`. For example, to specify a custom firefox profile for an
RC node you would use `ant launch-node
-Dcustom.firefox.profile=myProfile`

License
-------
This software is licensed under the [Mozilla Tri-License][MPL]:

    ***** BEGIN LICENSE BLOCK *****
    Version: MPL 1.1/GPL 2.0/LGPL 2.1

    The contents of this file are subject to the Mozilla Public License Version
    1.1 (the "License"); you may not use this file except in compliance with
    the License. You may obtain a copy of the License at
    http://www.mozilla.org/MPL/

    Software distributed under the License is distributed on an "AS IS" basis,
    WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
    for the specific language governing rights and limitations under the
    License.

    The Original Code is Mozilla WebQA.

    The Initial Developer of the Original Code is Mozilla.
    Portions created by the Initial Developer are Copyright (C) 2011
    the Initial Developer. All Rights Reserved.

    Contributor(s):
      Dave Hunt <dhunt@mozilla.com>

    Alternatively, the contents of this file may be used under the terms of
    either the GNU General Public License Version 2 or later (the "GPL"), or
    the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
    in which case the provisions of the GPL or the LGPL are applicable instead
    of those above. If you wish to allow use of your version of this file only
    under the terms of either the GPL or the LGPL, and not to allow others to
    use your version of this file under the terms of the MPL, indicate your
    decision by deleting the provisions above and replace them with the notice
    and other provisions required by the GPL or the LGPL. If you do not delete
    the provisions above, a recipient may use your version of this file under
    the terms of any one of the MPL, the GPL or the LGPL.

    ***** END LICENSE BLOCK *****

[MPL]: http://www.mozilla.org/MPL/
