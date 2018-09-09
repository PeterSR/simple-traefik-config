# Simple Traefik config for reverse proxy and SSL

This simple [Traefik](https://traefik.io/) config aims to make it easy to set up multiple services on the same server behind a reverse proxy using subdomains. It does not use any of the other awesome features of Traefik like load balancing.

The example in this repository shows how to expose an imaginary web server running locally on port 8000 and an imaginary forum web server on port 8001, such that the former is accessible via example.com and the latter is accessible via forum.example.com.
All services exposed in this way will automatically get SSL certificates from Let's Encrypt with the change of a single line.

To add a new service, simply create a new file or modify an existing in `config` and change names, urls and port.
Don't forget to modify the `acme.domains` in `traefik.toml`.

Because of Traefik's hot-swap feature, it is possible to do these changes live without having to restart the reverse proxy. The Traefik dashboard is accessible on port 8080 with basic authentication already set up (`user:pass`).


## Features

- Simple config without much clutter for this specific task.
- Trivial SSL for all services.
- Dashboard with basic authentication.
- Systemd unit file to easily create a service that starts on boot-up.


## Setup

Modify occurrences of `example.com` to your domain.

To download `traefik` binary and create `traefik.service` unit, run:

```
make
```

Install it (requires root privileges):

```
make install
```

Enable using normal `systemctl` (requires root privileges):

```
systemctl enable traefik
```

It will now start up with the OS.
