#!/bin/bash

if [ $# -ne 1]; then
  echo "Usage: ./export-job-template-survey.sh job-template-id-list-file"
  exit 1
fi

HOST_PORT=YOUR_TOWER_HOST_PORT
USER=TOWER_USERNAME
PASSWORD=TOWER_PASSWORD

OLD_IFS=$IFS
IFS=$'\n' 

for JT_ID in $(cat $1)
do
  echo "Exporting job template: $JT_ID"
  curl -H "Accept: application/json" -H "Content-Type: application/json" --user ${USER}:${PASSWORD} --insecure -X GET https://${HOST_PORT}/api/v2/job_templates/${JT_ID}/ > job_template_${JT_ID}.json
  echo "Exporting survey for job template: $JT_ID"
  curl -H "Accept: application/json" -H "Content-Type: application/json" --user ${USER}:${PASSWORD} --insecure -X GET https://${HOST_PORT}/api/v2/job_templates/${JT_ID}/survey_spec/ > job_template_${JT_ID}_survey.json
  echo "-------------------------------------------------------------------"
done

IFS=$OLD_IFS 
