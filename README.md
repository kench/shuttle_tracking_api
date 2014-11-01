# RPI Shuttle Tracking
## Shuttle Tracking API

This is a Grape application implementing the read HTTP APIs and a new location submission API for the RPI Shuttle Tracking website.

This is not currently functional yet.

## Purpose

This application provides a read-only API for route, stop, vehicle, and location data (API-compatible with current shuttles.rpi.edu website) and a single endpoint for recieving shuttle location updates.

It is written in Ruby and uses the [Grape micro-framework](https://github.com/intridea/grape).  Ruby on Rails is a powerful kitchen-sink framework which is great for creating web applications quickly, but requires constant maintainance and a rapid upgrade cycle to address security vulnerabilities due to its large surface area.  Using a microframework reduces the amount of effort needed to maintain the application and reduces the attack surface of the application significantly.

The current Shuttle Tracking Ruby on Rails application performs several functions:

* Rendering the user-facing [RPI Shuttle Track website](http://shuttles.rpi.edu).
* API for route, stop, vehicle, and location data to third-party applications.
* Background job for polling one upstream vendor for shuttle location updates.
* API access for another upstream vendor to update shuttle locations.
* Admin-only CRUD interface for routes, stops, and vehicles.

This API-only application only does the following:

* API for route, stop, vehicle, and location data.
* API endpoint for submitting location updates.  (Directly or using AWS SNS)

It may do the following after the above features are implemented:

* Serve static files for a AJAX application using the HTTP API.