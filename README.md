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

Launching a Selenium WebDriver node
-----------------------------------

Run the following command from the project's location:

    ant launch-webdriver

Launching a Selenium RC node
----------------------------

Run the following command from the project's location:

    ant launch-remote-control

Specifying properties on the command line
-----------------------------------------

You can override any of the properties from `default.properties` or
`<HOSTNAME>.properties` on the command line by passing them in the format
`-D<PROPERTY>=<VALUE>`. For example, to specify a custom firefox profile for an
RC node you would use `ant launch-remote-control
-Dcustom.firefox.profile=myProfile`
