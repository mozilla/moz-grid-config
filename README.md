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

**node.host**

The host of the node that you want to register with the hub. This is
needed so that the hub can communicate back to the node. This property should
not be set in `project.properties` because it will differ for each host. It's
best placed in the `<HOSTNAME>.project.properties` file.

**node.port**

The port of the node that you want to register with the hub. Along with the
host, this is needed so that the hub can communicate back to the node. A default
port is specified in `project.properties`, however if you intend to register
more than one node from one host then you will need to set this property via the
command line. See the section on **Launching a Selenium RC node** below for
details.

**node.timeout**

If there is no communication from the node before this timeout (in seconds) then
the session will be dropped.

**node.max.concurrent**

The maximum number of browsers to launch on the node at any one time.

**rc.browsers**

The browsers that an RC node will make available. This is in the format of
`-browser browserName="<ENVIRONMENT>",maxInstances=<MAX_INSTANCES>` where
`<ENVIRONMENT>` is a valid environment as listed in `grid_configuration.yml` and
`<MAX_INSTANCES>` is the maximum number of instances of that environment that
should be launched. To support multiple browsers simply repeat the parameters.

Example:
    rc.browsers=-browser browserName="Firefox 3.6 on Mac OS X",maxInstances=5
    -browser browserName='Firefox 4.0 on Mac OS X',maxInstances=5

This property should not be set in `project.properties` because it will differ
for each host. . It's best placed in the `<HOSTNAME>.project.properties` file. 

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

Launching a Selenium RC node
----------------------------

Run the following command from the project's location:

    ant launch-remote-control

Specifying properties on the command line
-----------------------------------------

You can override any of the properties from `project.properties` or
`<HOSTNAME>.project.properties` on the command line by passing them in the
format `-D<PROPERTY>=<VALUE>`. For example, to specify an alternate port for the
hub you would use `ant launch-hub -Dhub.port=4445`
