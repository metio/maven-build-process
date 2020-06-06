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

Replace `${version.parent}` with either the latest [prototype](https://github.com/metio/maven-build-process/packages/239213) or [stable](https://github.com/metio/maven-build-process/packages/239190) version.

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

Pick one or more of the available BOMs and replace `${version.parent}` with the appropriate version. All managed dependencies are using the latest available (released) versions.

<table>
  <tbody>
    <tr>
      <th align="center">BOM</th>
      <th align="center">Artifacts</th>
    </tr>
    <tr>
      <td>maven-boms-database</td>
      <td>
        <ul>
          <li>com.h2database:h2</li>
          <li>org.postgresql:postgresql</li>
          <li>mysql:mysql-connector-java</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-logging</td>
      <td>
        <ul>
          <li>org.apache.logging.log4j:log4j-api</li>
          <li>org.apache.logging.log4j:log4j-core</li>
          <li>org.slf4j:slf4j-api</li>
          <li>org.slf4j:slf4j-ext</li>
          <li>org.slf4j:slf4j-nop</li>
          <li>org.slf4j:slf4j-simple</li>
          <li>org.graylog2:syslog4j</li>
          <li>org.tinylog:tinylog</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-reactive</td>
      <td>
        <ul>
          <li>io.reactivex.rxjava2:rxjava</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-scripting</td>
      <td>
        <ul>
          <li>org.apache.commons:commons-jexl</li>
          <li>de.odysseus.juel:juel-api</li>
          <li>de.odysseus.juel:juel-impl</li>
          <li>org.mvel:mvel2</li>
          <li>ognl:ognl</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-square</td>
      <td>
        <ul>
          <li>com.squareup.okhttp:okhttp</li>
          <li>com.squareup.okhttp:okhttp-apache</li>
          <li>com.squareup.okhttp:okhttp-android-support</li>
          <li>com.squareup.okhttp:okhttp-mockwebserver</li>
          <li>com.squareup.okhttp:okhttp-ws</li>
          <li>com.squareup.okhttp:okhttp-testing-support</li>
          <li>com.squareup.okhttp3:okhttp</li>
          <li>com.squareup.okhttp3:okhttp-apache</li>
          <li>com.squareup.okhttp3:okhttp-android-support</li>
          <li>com.squareup.okhttp3:okhttp-urlconnection</li>
          <li>com.squareup.okhttp3:okhttp-mockwebserver</li>
          <li>com.squareup.okhttp3:okhttp-ws</li>
          <li>com.squareup.okhttp3:okhttp-testing-support</li>
          <li>com.squareup.okhttp3:okcurl</li>
          <li>com.squareup:javapoet</li>
          <li>com.squareup.retrofit2:retrofit</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-templating</td>
      <td>
        <ul>
          <li>com.github.spullara.mustache.java:compiler</li>
          <li>com.samskivert:jmustache</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-testing</td>
      <td>
        <ul>
          <li>junit:junit</li>
          <li>org.junit.platform:junit-platform-commons</li>
          <li>org.junit.platform:junit-platform-console</li>
          <li>org.junit.platform:junit-platform-engine</li>
          <li>org.junit.platform:junit-platform-launcher</li>
          <li>org.junit.platform:junit-platform-runner</li>
          <li>org.junit.jupiter:junit-jupiter-api</li>
          <li>org.junit.jupiter:junit-jupiter-params</li>
          <li>org.junit.jupiter:junit-jupiter-engine</li>
          <li>org.junit.vintage:junit-vintage-engine</li>
          <li>org.hamcrest:hamcrest-all</li>
          <li>org.hamcrest:hamcrest-core</li>
          <li>org.mockito:mockito-core</li>
          <li>org.dbunit:dbunit</li>
          <li>org.assertj:assertj-core</li>
          <li>nl.jqno.equalsverifier:equalsverifier</li>
          <li>org.mock-server:mockserver-netty</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-wikitext</td>
      <td>
        <ul>
          <li>org.fusesource.wikitext:wikitext-core</li>
          <li>org.fusesource.wikitext:textile-core</li>
          <li>org.fusesource.wikitext:twiki-core</li>
          <li>org.fusesource.wikitext:tracwiki-core</li>
          <li>org.fusesource.wikitext:mediawiki-core</li>
          <li>org.fusesource.wikitext:confluence-core</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-xml</td>
      <td>
        <ul>
          <li>com.thoughtworks.xstream:xstream</li>
          <li>xom:xom</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>maven-boms-yaml</td>
      <td>
        <ul>
          <li>org.yaml:snakeyaml</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

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
