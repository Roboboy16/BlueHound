# Blue Hound Docker
Full automated docker setup for BlueHound (with default settings)
##INFO
Image based on Debian 12, contains: 
* [Neo4j community edition](https://neo4j.com/);
* [BlueHound](https://github.com/zeronetworks/BlueHound);
* [Tool](https://github.com/fox-it/bloodhound-import) for importing data (collected by BloodHound) directly to the Neo4j Database.
 
By default starts Neo4j and BlueHound servers. All requirements already satisfied, you can find the tool for importing in `bloodhound-import` dir

## IMPORTANT
Change default password with `NEO4J_PASS=your-pass`
Default username for neo4j database is `neo4j`

## RUN
You can simply run 
```docker run -p 7474:7474 -p 7687:7687 -p 3000:3000 -e "NEO4J_PASS=YOUR-PASSWORD!!!!" -it deadlessflex/bluehound-docker```
If you want to run it from git repository then, before running command above, run `docker build -t bluehound-docker .`

Before running the import tool you need to activate python venv with `source env/bin/activate`

## KNOWN ISSUES
1) Tried running installed tool for importing as is, but that didn't work for me, so I am suggesting running it as `python3 __init__.py -du USER -dp PASSWORD FILES`.
