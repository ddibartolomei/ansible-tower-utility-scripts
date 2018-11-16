# ansible-tower-utility-scripts

- **export-job-template-survey.sh**

  Exports the job template definitions and their surveys inside separated json files.

  Usage:
  
  `./export-job-template-survey.sh job-template-id-list-file`
  
  *job-template-id-list-file* contains a list of job template ids. For example:
  
  ```
  1
  10
  34
  45
  ```
  
  Exported json files are named:
  
  - job\_template\_\<job template id>.json
  - job\_template\_\<job template id>\_survey.json
