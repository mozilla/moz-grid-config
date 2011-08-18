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

Default properties are set in `project.properties`, and these can be overridden
for an individual machine by providing a `<HOSTNAME>.project.properties` file.
Any properties in this file will override the default. To find out your hostname
run `ant debug` in the location you've checked out this project and look for
something that looks like the following line:

    [echoproperties] env.HOSTNAME=LokiMac.local

In this example the hostname is `LokiMac.local` so your properties file will be
`LokiMac.local.project.properties`

Properties
----------

Below are the properties that can be configured:

**grid.version**

The version number of Selenium Grid to use. This is used to locate the library,
for example a value of `1.0.8` will load the library
`lib/selenium-grid-remote-control-standalone-1.0.8.jar`

**hub.host**

The host that Selenium Grid's hub is running on. This is used for any launching
Selenium RC servers to register with the hub.

**hub.port**

The port that Selenium Grid's hub is running on. Also used when Selenium RC
servers are registering with the hub.

**rc.version**

The version of Selenium server to use. Thhis is used to locate the library, for
example a value of `2.0b3` will load the library
`vendor/selenium-grid-hub-standalone-2.0b3.jar`

**rc.host**

The host of the Selenium RC that you want to register with the Selenium Grid
hub. This is needed so that Selenium Grid can communicate back to the server.
This defaults to `localhost`, which is fine if the server is on the same machine
as the Selenium Grid hub. If these are on different machines then this property
is best set in `<HOSTNAME>.project.properties` file or on the command line. See
the section on **Launching a Selenium RC server** below for details.

**rc.port**

The port of the Selenium RC that you want to register with the Selenium Grid
hub. Along with the host, this is needed so that Selenium Grid can communicate
back to the server. This defaults to `5555`, which is fine for the first server
on a machine, but any subsequent servers need a different port to be specified
via the command line. See the section on **Launching a Selenium RC server**
below for details.

**rc.environment**

The environment to register the launching Selenium RC with in the Selenium Grid
hub. This property should not be set in `project.properties` because it will
differ for each machine, and it should also not be set in
`<HOSTNAME>.project.properties` file as you are likely to want to invoke
multiple servers on each machine with different environment names. The best way
to set this property is via the command line. See the section on **Launching a
Selenium RC server** below for details.

**rc.arguments**

Any additional arguments to pass to Selenium RC server when it's launched. For
example, *-singleWindow* would launch the Selenium and the application under
test in the same window using frames.

**custom.firefox.profile**

The path of a custom Firefox profile to use. If this property is specified but
the value is empty then Selenium will not provide the *-firefoxProfileTemplate*
command line argument and a fresh profile will be generated. Note that the
Firefox profile needs to be located in `firefoxprofiles` directory, and the
value of this property is the relative path within `firefoxprofiles`.

Launching a Selenium Grid hub
-----------------------------

Run the following command from the project's location:

    ant launch-hub

Launching a Selenium RC server
------------------------------

Run the following command from the project's location:

    ant launch-remote-control -Drc.port=<PORT> -Drc.environment=<ENVIRONMENT>

Where `<PORT>` is the port you want to run the Selenium RC server on, and
`<ENVIRONMENT>` is the name of the environment you want to register with
Selenium Grid's hub.

If you have not specified a value for `rc.host` in your
`<HOSTNAME>.project.properties` file then you can also specify this on the
command line by appending `-Drc.host=<HOST>` where `<HOST>` is the host of the
machine.

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
