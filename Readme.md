# Testim Failure Analyzer

    This is a fully responsive, interactive, predictive, mobile friendly, emailable, auto generated website that has the ability to analyze failed tests results and provide meaningful insights, create individual testim reports with screenshots & video.

**Disclaimer**: This project is provided "AS IS". It is not officially supported by Testim.

**Table of contents:**</br>
- [Testim Failure Analyzer](#testim-failure-analyzer)
- [Pre-requisite:](#pre-requisite)
  - [Mac:](#mac)
- [Steps to execute:](#steps-to-execute)
- [Analyze Test Runs:](#analyze-test-runs)
  - [Via downloaded Test runs csv:](#via-downloaded-test-runs-csv)
    - [High level analysis:](#high-level-analysis)
    - [In-depth Analysis:](#in-depth-analysis)
  - [Via Testim API:](#via-testim-api)
    - [Analyze based on dates:](#analyze-based-on-dates)
    - [Analyze based on **Execution id/ run id**:](#analyze-based-on-execution-id-run-id)
      - [single:](#single)
      - [multiple:](#multiple)
    - [Analyze based on **Execution name**:](#analyze-based-on-execution-name)
      - [single:](#single-1)
      - [multiple:](#multiple-1)
    - [In-depth Analysis:](#in-depth-analysis-1)
  - [Advanced Customizations:](#advanced-customizations)
- [Generate standalone Individual reports with screenshots & video:](#generate-standalone-individual-reports-with-screenshots--video)
  - [Via downloaded test runs csv (Both Passed & Failed tests)](#via-downloaded-test-runs-csv-both-passed--failed-tests)
  - [Via API: (Only failed tests)](#via-api-only-failed-tests)
    - [based on dates:](#based-on-dates)
    - [single execution name:](#single-execution-name)
    - [single result id:](#single-result-id)
    - [multiple result ids:](#multiple-result-ids)
</br>

# Pre-requisite:
## Mac: 
- Install docker.<br>
- Download/ clone [this](https://github.com/genesisthomas/testim-analyzer) github project. </br>
- Open terminal/cmd prompt, navigate to folder where run.sh is present & run the below command:</br>
```chmod +x ./run.sh``` <br>

# Steps to execute:

- Enter the following commands in terminal/ command prompt & then **choose** your preferred parameters from the following **sections** to **analyze** test runs/ **download** single reports with screenshots & videos.

```
./run.sh "<API_KEY>" "<PROJECT_NAME>" "<PROJECT_ID>"
```

**Notes:**

- 1st argument: Replace `<API_KEY>` with [Testim's API Key](https://help.testim.io/docs/api-access#enabling-api-access).
- 2nd argument: Replace `<PROJECT_NAME>` with your testim project name.
- 3rd argument: Replace `<PROJECT_ID>` with your testim project id.

<p></br>

# Analyze Test Runs:

## Via downloaded Test runs csv:

**Make sure to download the required test runs CSV files to the current working directory.**

</br> 

### High level analysis:
```
 "csvFile=on"
```

### In-depth Analysis:
```
 "csvFile=on|trends=on|email=on|deep_analytics=on|excel=on|showIssues=on"
```

**Notes:**
- 4th argument: csvFile=on will analyze any csv files present in the current working directory. 
- There are other configurable filters/ options to enable advanced analysis.

<p></br>

## Via Testim API:
</br> 

### Analyze based on dates:
```
 "startDate=2022-07-12|endDate=2022-07-12"
```
</br> 

### Analyze based on **Execution id/ run id**:
#### single:
```
 "runId=hKqljO1q6WMi8KJn|startDate=2022-06-23|endDate=2022-06-23"
```

#### multiple:
```
 "runId=Om9t9C4MAXZAuOPE;hKqljO1q6WMi8KJn|startDate=2022-06-23|endDate=2022-06-27"
```
</br> 

### Analyze based on **Execution name**:
#### single:
```
 "executionName=pass, fail & skip|startDate=2022-06-23|endDate=2022-06-23"
```
#### multiple:

```
 "executionName=pass, fail & skip;Testim Booking Smoke Web|startDate=2022-06-23|endDate=2022-06-23"
```
</br> 


### In-depth Analysis:

```
 "executionName=pass, fail & skip|startDate=2022-06-23|endDate=2022-06-23|trends=on|email=on|deep_analytics=on|excel=on|showIssues=on"
```

**Notes:**
- 4th argument: Corresponds to configurable filters/ options to enable advanced analysis.
<p></br>

## Advanced Customizations:

Change the background color, debug with logs, customize logo & custom version number in heading by editing the **run.sh** after -a params with the below **bold** bold text:

    `testim-analyzer:latest -n "${NAME}" -a "${PARAMS}"` **-b white -d true -l www.wikipedia.org -v 1.0**
<p></br>

# Generate standalone Individual reports with screenshots & video:

## Via downloaded test runs csv (Both Passed & Failed tests)
```
 "csvFile=on|singleReport=on"
```
</br>

## Via API: (Only failed tests)

### based on dates:
```
 "singleReport=on|startDate=2022-07-12|endDate=2022-07-12"
```
</br>

### single execution name:
```
 "singleReport=on|executionName=pass, fail & skip|startDate=2022-06-23|endDate=2022-06-23"
```
</br>

### single result id: 
```
 "singleReport=on|resultId=bIXYH4A51vScEg2i|startDate=2022-06-23|endDate=2022-06-23"
```
</br>

### multiple result ids: 
```
 "singleReport=on|resultId=h9QQu5ehaOF0dqyM;DA0kHuTMG204Da16|startDate=2022-06-23|endDate=2022-06-23"
```
</br>