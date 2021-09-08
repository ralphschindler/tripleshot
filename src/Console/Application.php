<?php

namespace Tripleshot\Console;

use Symfony\Component\Console\Application as ConsoleApplication;

class Application
{
    public function run()
    {
        $application = new ConsoleApplication;
        $application->setName('Tripleshot');

        // $application->add

        $application->run();
    }
}

