########
  Sept 12, 2021
  Evan Pokroy - evanp@omg.lol twitter: @EvSecOps
  Creative Commons 1.0
#######

Having started recently concentraing on incidence management in our cloud environment, I started looking for tools to manage log files and generally facilitate our working with a team to do digital forensics. One of the tools we ran across is Timesketch, from Google <a href=https://github.com/google/timesketch>https://github.com/google/timesketch</a>. 
As we work mostly in AWS I started looking for ways to pull logs from CloudTrail into Timesketch with little success. So I figured might as well get a start on it. 
This is my first quick and dirty attempt. There are some unfortunate limitations on both sides. For one, Timesketch needs data in a very specific format and it isn't conducice to unstructured data. The type of JSON it accepts isn't the same as what CloudTrail exports. I'm working on converting the standard, complex, nested JSON from CloudTrail in to the JSONL format that Timesketch eats, but that's been slow work. With that, it is possible, from the AWS console to export a CSV file that only needs some small tweaks to work with Timesketch. So that's what I've stared with. Hopefully in further iterations I'll get the JSON working so the data can pulled with the aws cli tool, normalized, and pushed directly into Timesketch. But for the time being it's mostly manual.

Usage:
Download CloudTrail events as a csv file into the incoming directory. From a bash prompt in that directoy run ../scripts/formatCloudtrail.sh <file.csv> 
Your normalized data should then be available in the results directory. That file is then ready to be uploaded to Timesketch.

