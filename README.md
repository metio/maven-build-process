# Maven Build Process

Bunch of POMs that help to set up a [Maven](http://maven.apache.org/) based project.

## Usage

### Maven Parent

Inherit from one of the parents like this:

```xml
  <!-- for early prototypes -->
  <parent>
    <groupId>wtf.metio.maven.parents</groupId>
    <artifactId>maven-parents-java-prototype</artifactId>
    <version>${version.parent}</version>
  </parent>
```

```xml
  <!-- for stable projects -->
  <parent>
    <groupId>wtf.metio.maven.parents</groupId>
    <artifactId>maven-parents-java-stable</artifactId>
    <version>${version.parent}</version>
  </parent>
```

Specify SCM, Issue Management, CI Management, and Distribution Management sections of your POM in case you want to deploy into [Maven Central](http://search.maven.org/).

### Docker Build Environment

The build environment can be used together with docker-compose like this:

```yaml
version: '2'
services:
  verify-project:
    image: sebhoss/maven-build-environment:latest
    container_name: my-verifier
    volumes:
      - "./:/project"
    working_dir: /workspace
    command: bash -c "cp -af /project/. . && mvn clean verify -s /config/local-nexus-mirror.xml -Dmaven.repo.local=/repository"
    networks:
      - nexus
networks:
  nexus:
    external:
      name: nexus_default
```

Execute this by calling `docker-compose run --rm verify-project`. Executing builds directly inside the `/project` directory will most likely cause a permission problem on the host system. Therefore, the above `docker-compose.yml` file copies the project source into the `/workspace` directory first. The `--rm` option makes sure everything gets cleaned up nicely once execution is finished. Specify a *container_name* in case you want to easily reference the running container. The container includes two predefined Maven settings files:

- /config/google-mirror.xml (https://maven-central.storage.googleapis.com)
- /config/local-nexus-mirror.xml (http://local-nexus:8081/content/groups/public/)

Use them together with docker networks like in the above example to run your builds against different Maven repositories. The local `/repository` directory already includes _some_ artifacts. Re-use it in order to cut down on build time.

## License

To the extent possible under law, the author(s) have dedicated all copyright
and related and neighboring rights to this software to the public domain
worldwide. This software is distributed without any warranty.

You should have received a copy of the CC0 Public Domain Dedication along
with this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.

## Mirrors

- https://github.com/sebhoss/{project-name}
- https://bitbucket.org/sebhoss/{project-name}
- https://gitlab.com/sebastian.hoss/{project-name}
- http://v2.pikacode.com/sebhoss/{project-name}
- http://repo.or.cz/{project-name}.git
