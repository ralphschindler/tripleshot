#!/bin/bash

# Production vs. Development
if [ "$APP_ENV" != "production" ]; then
    # phpdismod -v 7.4 -s ALL newrelic
    phpenmod -v 7.4 -s ALL xdebug
fi

if [ -e /app/.entryscript ]; then
	source /app/.entryscript
fi

exec "$@"