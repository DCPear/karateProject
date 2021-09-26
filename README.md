# Karate_learn
### Json
#### Json object notation
<p>Json object: {} - key is unique </p>

Simple object
```
{"key1":Value",
   "key2":Value"}
```

Nested object
```
{ 
  "key":{
      "nestedKey:" "nestedValue"
    }
}
```

Nested array
```
{ 
  "key":[
       "value1","value2"
   ]
}
```
Json array: []

```

["value1", "Value2"]
```
Array of objects
```
[
    {"key":"value1"},
    {"key":"value2"}
]
```
Data types
````
String  {"Greeting": "Hello"}
number  {"Age": 86}
Boolean {"isTrue": true, "isFalse": false}
Null {"pet": null}
````

####  Simple Karate syntax 
def anObject
````
define an object 
 def anObject
{
  "FirstName":"Joe",
  "LastName":"Bloggs",
  "Age":23,
  "Skills":["Java", "JavaScripts"],
  "WorkHistory":{
    "2000":"Trainee",
    "2010":"Specialist",
    "2020":"Manager"  
  },
  "Certifications":[
    {"Name":"Cert1",
      "Type": "Azure"
    },
    {"Name":"Cert2",
      "Type": "AWS"
    }
    ]
}
Get
get the lastName = anObject.lastName
get the second skill anObject.Skills[1]

     Note: use https://jsonpathfinder.com/
Update
set anObject.age = "25 " 
set anobject.Certifications[0].Name = "Az-900"

Add (Karate will add an new record)
set anObject.Skills[3] ="Node"

Delete
remove anObject.WorkHistory.2020
````
#### API
API Request
````
API URL - Https link to API. endpoint
Headers- content-Type or Athorization token
Method - GET, POST,PUT,DELETE
Body - Json object with requested data (for POST & PUT)
````
Response
````
Status code - 2xx, 3xx, 4xx (issue is on your side), 5xx (Server error)
````
<p>Contract: <br> valid Request and valid response </p>
<p>Karate/postman: <br> simulate the UI behaviour </p>
<p>Benefits: <br> speed </p>

#### Karate Framework set up /tools
````
1. Java 8 or higher
2. Maven
3. Git
4. Node/yarn
5. Postman
6. IntellijIdea with plugins Cucumber for Java and Gherkin
7. or Visual studio code with plugins Cucumber(Gherkin) Full support, Karate runner, Java Extention pack, material icon
   Theme, Open in default browser. enable auto save
   Karate Runner settings cog > extention settings > tick override Karate Runner
````
[Link sample backend](https://conduit.productionready.io/api/tags)

[Link Karate documentation](https://github.com/intuit/karate)

[Link Karate Quick start](https://github.com/intuit/karate#quickstart)
````
mvn archetype:generate \
-DarchetypeGroupId=com.intuit.karate \
-DarchetypeArtifactId=karate-archetype \
-DarchetypeVersion=1.1.0 \
-DgroupId=com.dcpear \
-DartifactId=karateproject
````
logback-test.xml
````
for full details (default)   <logger name="com.intuit" level="DEBUG"/>
for info only   <logger name="com.intuit" level="INFO"/>
````
Note: Default level is recommended except in an instances where JVM crashes may happen in windows when the response is
large  (mac and linux is okay)
````
Clone Test project https://github.com/gothinkster/angular-realworld-example-app.git
npm install
npm run
** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **

Alternative: this run completely on local https://github.com/cirosantilli/node-express-sequelize-nextjs-realworld-example-app
Clone, npm install (npm install --legacy-peer-deps), 
````
<del>npm run dev </del> npm start

to run tests  ````mvn test````

Runner configuration and Tags
````
Option 1 : Add this to runner
Karate supports JUnit 5 and the advantage is that your can have multiple nethods in a test class
@Karate.Test
class FeatureRunner {
    Karate testTags() {
        return Karate.run("tags").tags("@second").relativeTo(getClass());
    }
  }
    
    To run: mvn test -Dtest=FeatureRunner#testTags
    not the best option
 Option 2: use karate options
  @KarateOptions( tags = {"@debug", "@regression", "@Second"})
  
  run: mvn test "-Dkarate.options=--tags @second"
  
  Ignore unstable tests
  change surefire config
  <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>${maven.surefire.version}</version>
                <configuration>
                    <argLine>-Dfile.encoding=UTF-8</argLine>
                    <systemProperties>
                        <karate.options>--tags @ignore</karate.options>
                    </systemProperties>
                </configuration>
            </plugin>   
  
````

