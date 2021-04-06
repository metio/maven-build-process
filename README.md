# Maven Build Process [![Chat](https://img.shields.io/badge/matrix-%23mbp:matrix.org-brightgreen.svg?style=social&label=Matrix)](https://riot.im/app/#/room/#maven-build-process:matrix.org) [![Mailing List](https://img.shields.io/badge/email-mbp%40metio.groups.io%20-brightgreen.svg?style=social&label=Mail)](https://metio.groups.io/g/maven-build-process/topics)

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

Replace `${version.parent}` with either the latest [prototype](https://search.maven.org/artifact/wtf.metio.maven.parents/maven-parents-java-prototype) or [stable](https://search.maven.org/artifact/wtf.metio.maven.parents/maven-parents-java-stable) version.

Specify SCM, Issue Management, CI Management, and Distribution Management sections of your POM in case you want to deploy into [Maven Central](http://search.maven.org/) or other repositories.

#### Prototype vs Stable

| Feature              | Prototype     | Stable  |
|:--------------------:|:-------------:|:-------:|
| JUnit                | 5             | 5       |
| Attach Source        | ✔             | ✔       |
| Attach JavaDoc       | ✔             | ✔       |
| Java                 | 11            | 11      |
| FindBugs             | ✘             | ✔       |
| PMD                  | ✘             | ✔       |
| Jacoco               | 0 %           | 100 %   |
| Duplicate Finder     | ✔             | ✔       |
| Pitest               | ✘             | ✔       |
| Dependency Scan      | ✔             | ✔       |
| Analyse Dependencies | ✘             | ✔       |
| Dependency Conflicts | ✔             | ✔       |
| Flatten POM          | ✔             | ✔       |

### Maven BOMs

This project defines multiple [Maven BOM](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#importing-dependencies)s. Include them like this:

```xml
<dependencyManagement>
  <dependencies>
    <dependency>
      <groupId>wtf.metio.maven.boms</groupId>
      <artifactId>maven-boms-[TYPE]</artifactId>
      <version>${version.parent}</version>
      <type>pom</type>
      <scope>import</scope>
    </dependency>
  </dependencies>
</dependencyManagement>
```

Pick one or more of the available BOMs and replace `${version.parent}` with the appropriate version. All managed dependencies are using the latest available (released) versions and are **updated once a week**.

## License

```
To the extent possible under law, the author(s) have dedicated all copyright
and related and neighboring rights to this software to the public domain
worldwide. This software is distributed without any warranty.

You should have received a copy of the CC0 Public Domain Dedication along with
this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
```

## Mirrors

- https://github.com/metio/maven-build-process
- https://repo.or.cz/metio-maven-build-process.git (WIP)
- https://codeberg.org/metio.wtf/maven-build-process (WIP)
- https://gitlab.com/metio.wtf/maven-build-process (WIP)
- https://bitbucket.org/metio-wtf/maven-build-process (WIP)
