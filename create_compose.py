#
import argparse


def generate_docker_compose(database_name, db_user, db_pass):
    template = f"""
version: '3'

services:
  db:
    image: postgres:latest
    environment:
      POSTGRES_DB: {database_name}
      POSTGRES_USER: {db_user}
      POSTGRES_PASSWORD: {db_pass}
    volumes:
      - ./db:/docker-entrypoint-initdb.d

  python-app:
    build:
      context: .
      dockerfile: Dockerfile.app
    volumes:
      - ./output:/app/output
    depends_on:
      - db
    environment:
      DB_HOST: db
      DB_NAME: {database_name}
      DB_USER: {db_user}
      DB_PASSWORD: {db_pass}
"""

    with open('docker-compose-gen.yaml', 'w') as f:
        f.write(template)


def main():
    parser = argparse.ArgumentParser(description='Generate docker-compose.yml file with user-provided variables')
    parser.add_argument('--database_name', required=True, help='Name of the database')
    parser.add_argument('--db_user', required=True, help='Database user')
    parser.add_argument('--db_pass', required=True, help='Database password')

    args = parser.parse_args()

    generate_docker_compose(args.database_name, args.db_user, args.db_pass)
    print('docker-compose.yml file generated successfully.')


if __name__ == "__main__":
    main()
