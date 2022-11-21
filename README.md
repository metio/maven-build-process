<!--
SPDX-FileCopyrightText: The maven-build-process Authors
SPDX-License-Identifier: 0BSD
 -->

# maven-build-process [![Chat](https://img.shields.io/badge/matrix-%23talk.metio:matrix.org-brightgreen.svg?style=social&label=Matrix)](https://matrix.to/#/#talk.metio:matrix.org)

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

|       Feature        | Prototype | Stable |
|:--------------------:|:---------:|:------:|
|        JUnit         |     5     |   5    |
|    Attach Source     |     ✔     |   ✔    |
|    Attach JavaDoc    |     ✔     |   ✔    |
|         Java         |    11     |   11   |
|         PMD          |     ✘     |   ✔    |
|        Jacoco        |    0 %    | 100 %  |
|   Duplicate Finder   |     ✔     |   ✔    |
|        Pitest        |     ✘     |   ✔    |
|   Dependency Scan    |     ✔     |   ✔    |
| Analyse Dependencies |     ✘     |   ✔    |
| Dependency Conflicts |     ✔     |   ✔    |
|     Flatten POM      |     ✔     |   ✔    |

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
Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
```
