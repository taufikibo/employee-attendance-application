required: 
    - php 8 or higher
    - mysql
    - composer

how to install:
    - running command: composer install
    - copy file .env.example to .env and setup db configuration on .env file
    - running command: php artisan migrate, if got error import manual database (taufiq.sql)
    - running command: php artisan serve
    - if you want test API, I provide postman collection which you can import
    - Happy coding :)