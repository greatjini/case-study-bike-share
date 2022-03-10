{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "7bbf1487",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-03-10T14:40:27.101050Z",
     "iopub.status.busy": "2022-03-10T14:40:27.097323Z",
     "iopub.status.idle": "2022-03-10T14:40:28.784882Z",
     "shell.execute_reply": "2022-03-10T14:40:28.783938Z"
    },
    "papermill": {
     "duration": 1.841797,
     "end_time": "2022-03-10T14:40:28.785063",
     "exception": false,
     "start_time": "2022-03-10T14:40:26.943266",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'cyclistic-bike-share'"
      ],
      "text/latex": [
       "'cyclistic-bike-share'"
      ],
      "text/markdown": [
       "'cyclistic-bike-share'"
      ],
      "text/plain": [
       "[1] \"cyclistic-bike-share\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3f9cd064",
   "metadata": {
    "papermill": {
     "duration": 0.144271,
     "end_time": "2022-03-10T14:40:29.079006",
     "exception": false,
     "start_time": "2022-03-10T14:40:28.934735",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Case Study: How Does a Bike-Share Navigate Speedy Success?"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "747e66bb",
   "metadata": {
    "papermill": {
     "duration": 0.143943,
     "end_time": "2022-03-10T14:40:29.366210",
     "exception": false,
     "start_time": "2022-03-10T14:40:29.222267",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This case study is for a fictional company, Cyclistic. I am a junitor data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team need to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "The goal of this report are following:\n",
    "\n",
    "1. A clear statement of the business task (Ask)\n",
    "2. A description of all data sources used (Prepare)\n",
    "3. Documentation of any cleaning or manipulation of data (Process)\n",
    "4. A summary of your analysis (Analyze)\n",
    "5. Supporting visualizations and key findings (Share)\n",
    "6. Your top three recommendations based on your analysis (Act)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "767c216f",
   "metadata": {
    "papermill": {
     "duration": 0.141411,
     "end_time": "2022-03-10T14:40:29.652674",
     "exception": false,
     "start_time": "2022-03-10T14:40:29.511263",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "----------------------------------------------------------------------------------------------------"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0724ab5b",
   "metadata": {
    "papermill": {
     "duration": 0.145401,
     "end_time": "2022-03-10T14:40:29.939927",
     "exception": false,
     "start_time": "2022-03-10T14:40:29.794526",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****1. Ask****\n",
    "\n",
    "a. Identify the business task: \n",
    "  \n",
    "* How do annual members and casual riders use Cyclistic bikes differently?\n",
    "* Why would casual riders buy Cyclistic annual memberships?\n",
    "* How can Cyclistic use digital media to influence casual riders to become members?\n",
    "  \n",
    "  \n",
    "b. Consider key stakeholders: \n",
    "  \n",
    "* Cyclistic's Director: Moreno\n",
    "* Executive team\n",
    "* Cyclistic's Marketing analytics team"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "98d1d4dc",
   "metadata": {
    "papermill": {
     "duration": 0.14688,
     "end_time": "2022-03-10T14:40:30.237310",
     "exception": false,
     "start_time": "2022-03-10T14:40:30.090430",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****2. Prepare****\n",
    "\n",
    "* Download data and store it appropriately: https://divvy-tripdata.s3.amazonaws.com/index.html \n",
    "* Identify how it’s organized: The record is stored by month base and they are structured. The data has been made available by Motivate International Inc. under this license[https://ride.divvybikes.com/data-license-agreement]\n",
    "* Sort and filter the data \n",
    "* Determine the credibility of the data: this dataset is fictional data for this cast study, but it has been well updated monthly and is licensed but it has missing data."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "39a3514e",
   "metadata": {
    "papermill": {
     "duration": 0.147914,
     "end_time": "2022-03-10T14:40:30.527250",
     "exception": false,
     "start_time": "2022-03-10T14:40:30.379336",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****3. Process****\n",
    "\n",
    "* Check the data for errors.\n",
    "* Choose your tools.\n",
    "* Transform the data so you can work with it effectively.\n",
    "* Document the cleaning process."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7bb101d9",
   "metadata": {
    "papermill": {
     "duration": 0.146257,
     "end_time": "2022-03-10T14:40:30.820525",
     "exception": false,
     "start_time": "2022-03-10T14:40:30.674268",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Install the packages and load the libraries to use for this analysis. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "33f70060",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:40:31.150057Z",
     "iopub.status.busy": "2022-03-10T14:40:31.113772Z",
     "iopub.status.idle": "2022-03-10T14:40:31.457747Z",
     "shell.execute_reply": "2022-03-10T14:40:31.455860Z"
    },
    "papermill": {
     "duration": 0.492858,
     "end_time": "2022-03-10T14:40:31.457929",
     "exception": false,
     "start_time": "2022-03-10T14:40:30.965071",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘scales’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    discard\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    col_factor\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# load libraries \n",
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "library(skimr)\n",
    "library(rmarkdown)\n",
    "library(lubridate)\n",
    "library(scales)\n",
    "library(janitor)\n",
    "library(ggplot2)\n",
    "library(anytime)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "39c517e2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:40:31.776673Z",
     "iopub.status.busy": "2022-03-10T14:40:31.774357Z",
     "iopub.status.idle": "2022-03-10T14:41:42.713830Z",
     "shell.execute_reply": "2022-03-10T14:41:42.712468Z"
    },
    "papermill": {
     "duration": 71.097955,
     "end_time": "2022-03-10T14:41:42.714018",
     "exception": false,
     "start_time": "2022-03-10T14:40:31.616063",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# import dataset\n",
    "Q1 <- read.csv(\"../input/cyclistic-bike-share/Divvy_Trips_2020_Q1.csv\")\n",
    "Apr <- read.csv(\"../input/cyclistic-bike-share/202004-divvy-tripdata.csv\")\n",
    "May <- read.csv(\"../input/cyclistic-bike-share/202005-divvy-tripdata.csv\")\n",
    "Jun <- read.csv(\"../input/cyclistic-bike-share/202006-divvy-tripdata.csv\")\n",
    "Jul <- read.csv(\"../input/cyclistic-bike-share/202007-divvy-tripdata.csv\")\n",
    "Aug <- read.csv(\"../input/cyclistic-bike-share/202008-divvy-tripdata.csv\")\n",
    "Sep <- read.csv(\"../input/cyclistic-bike-share/202009-divvy-tripdata.csv\")\n",
    "Oct <- read.csv(\"../input/cyclistic-bike-share/202010-divvy-tripdata.csv\")\n",
    "Nov <- read.csv(\"../input/cyclistic-bike-share/202011-divvy-tripdata.csv\")\n",
    "Dec <- read.csv(\"../input/cyclistic-bike-share/202012-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "3072adb9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:41:43.024293Z",
     "iopub.status.busy": "2022-03-10T14:41:43.022106Z",
     "iopub.status.idle": "2022-03-10T14:41:43.297143Z",
     "shell.execute_reply": "2022-03-10T14:41:43.295483Z"
    },
    "papermill": {
     "duration": 0.43213,
     "end_time": "2022-03-10T14:41:43.297301",
     "exception": false,
     "start_time": "2022-03-10T14:41:42.865171",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t426887 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"EACB19130B0CDA4A\" \"8FED874C809DC021\" \"789F3C21E472CA96\" \"C9A388DAC6ABF313\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : chr  \"2020-01-21 20:06:59\" \"2020-01-30 14:22:39\" \"2020-01-09 19:29:26\" \"2020-01-06 16:17:07\" ...\n",
      " $ ended_at          : chr  \"2020-01-21 20:14:30\" \"2020-01-30 14:26:22\" \"2020-01-09 19:32:17\" \"2020-01-06 16:25:56\" ...\n",
      " $ start_station_name: chr  \"Western Ave & Leland Ave\" \"Clark St & Montrose Ave\" \"Broadway & Belmont Ave\" \"Clark St & Randolph St\" ...\n",
      " $ start_station_id  : int  239 234 296 51 66 212 96 96 212 38 ...\n",
      " $ end_station_name  : chr  \"Clark St & Leland Ave\" \"Southport Ave & Irving Park Rd\" \"Wilton Ave & Belmont Ave\" \"Fairbanks Ct & Grand Ave\" ...\n",
      " $ end_station_id    : int  326 318 117 24 212 96 212 212 96 100 ...\n",
      " $ start_lat         : num  42 42 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  42 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      "'data.frame':\t84776 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"A847FADBBC638E45\" \"5405B80E996FF60D\" \"5DD24A79A4E006F4\" \"2A59BBDF5CDBA725\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : chr  \"2020-04-26 17:45:14\" \"2020-04-17 17:08:54\" \"2020-04-01 17:54:13\" \"2020-04-07 12:50:19\" ...\n",
      " $ ended_at          : chr  \"2020-04-26 18:12:03\" \"2020-04-17 17:17:03\" \"2020-04-01 18:08:36\" \"2020-04-07 13:02:31\" ...\n",
      " $ start_station_name: chr  \"Eckhart Park\" \"Drake Ave & Fullerton Ave\" \"McClurg Ct & Erie St\" \"California Ave & Division St\" ...\n",
      " $ start_station_id  : int  86 503 142 216 125 173 35 434 627 377 ...\n",
      " $ end_station_name  : chr  \"Lincoln Ave & Diversey Pkwy\" \"Kosciuszko Park\" \"Indiana Ave & Roosevelt Rd\" \"Wood St & Augusta Blvd\" ...\n",
      " $ end_station_id    : int  152 499 255 657 323 35 635 382 359 508 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.6 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 42 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      "'data.frame':\t200274 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"02668AD35674B983\" \"7A50CCAF1EDDB28F\" \"2FFCDFDB91FE9A52\" \"58991CF1DB75BA84\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : chr  \"2020-05-27 10:03:52\" \"2020-05-25 10:47:11\" \"2020-05-02 14:11:03\" \"2020-05-02 16:25:36\" ...\n",
      " $ ended_at          : chr  \"2020-05-27 10:16:49\" \"2020-05-25 11:05:40\" \"2020-05-02 15:48:21\" \"2020-05-02 16:39:28\" ...\n",
      " $ start_station_name: chr  \"Franklin St & Jackson Blvd\" \"Clark St & Wrightwood Ave\" \"Kedzie Ave & Milwaukee Ave\" \"Clarendon Ave & Leland Ave\" ...\n",
      " $ start_station_id  : int  36 340 260 251 261 206 261 180 331 219 ...\n",
      " $ end_station_name  : chr  \"Wabash Ave & Grand Ave\" \"Clark St & Leland Ave\" \"Kedzie Ave & Milwaukee Ave\" \"Lake Shore Dr & Wellington Ave\" ...\n",
      " $ end_station_id    : int  199 326 260 157 206 22 261 180 300 305 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 42 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 42 41.9 41.9 41.8 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t343005 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"8CD5DE2C2B6C4CFC\" \"9A191EB2C751D85D\" \"F37D14B0B5659BCF\" \"C41237B506E85FA1\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : chr  \"2020-06-13 23:24:48\" \"2020-06-26 07:26:10\" \"2020-06-23 17:12:41\" \"2020-06-20 01:09:35\" ...\n",
      " $ ended_at          : chr  \"2020-06-13 23:36:55\" \"2020-06-26 07:31:58\" \"2020-06-23 17:21:14\" \"2020-06-20 01:28:24\" ...\n",
      " $ start_station_name: chr  \"Wilton Ave & Belmont Ave\" \"Federal St & Polk St\" \"Daley Center Plaza\" \"Broadway & Cornelia Ave\" ...\n",
      " $ start_station_id  : int  117 41 81 303 327 327 41 115 338 84 ...\n",
      " $ end_station_name  : chr  \"Damen Ave & Clybourn Ave\" \"Daley Center Plaza\" \"State St & Harrison St\" \"Broadway & Berwyn Ave\" ...\n",
      " $ end_station_id    : int  163 81 5 294 117 117 81 303 164 53 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 42 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"casual\" \"member\" \"member\" \"casual\" ...\n",
      "'data.frame':\t551480 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"762198876D69004D\" \"BEC9C9FBA0D4CF1B\" \"D2FD8EA432C77EC1\" \"54AE594E20B35881\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : chr  \"2020-07-09 15:22:02\" \"2020-07-24 23:56:30\" \"2020-07-08 19:49:07\" \"2020-07-17 19:06:42\" ...\n",
      " $ ended_at          : chr  \"2020-07-09 15:25:52\" \"2020-07-25 00:20:17\" \"2020-07-08 19:56:22\" \"2020-07-17 19:27:38\" ...\n",
      " $ start_station_name: chr  \"Ritchie Ct & Banks St\" \"Halsted St & Roscoe St\" \"Lake Shore Dr & Diversey Pkwy\" \"LaSalle St & Illinois St\" ...\n",
      " $ start_station_id  : int  180 299 329 181 268 635 113 211 176 31 ...\n",
      " $ end_station_name  : chr  \"Wells St & Evergreen Ave\" \"Broadway & Ridge Ave\" \"Clark St & Wellington Ave\" \"Clark St & Armitage Ave\" ...\n",
      " $ end_station_id    : int  291 461 156 94 301 289 140 31 191 142 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.6 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t622361 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"322BD23D287743ED\" \"2A3AEF1AB9054D8B\" \"67DC1D133E8B5816\" \"C79FBBD412E578A7\" ...\n",
      " $ rideable_type     : chr  \"docked_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2020-08-20 18:08:14\" \"2020-08-27 18:46:04\" \"2020-08-26 19:44:14\" \"2020-08-27 12:05:41\" ...\n",
      " $ ended_at          : chr  \"2020-08-20 18:17:51\" \"2020-08-27 19:54:51\" \"2020-08-26 21:53:07\" \"2020-08-27 12:53:45\" ...\n",
      " $ start_station_name: chr  \"Lake Shore Dr & Diversey Pkwy\" \"Michigan Ave & 14th St\" \"Columbus Dr & Randolph St\" \"Daley Center Plaza\" ...\n",
      " $ start_station_id  : int  329 168 195 81 658 658 196 67 153 177 ...\n",
      " $ end_station_name  : chr  \"Clark St & Lincoln Ave\" \"Michigan Ave & 14th St\" \"State St & Randolph St\" \"State St & Kinzie St\" ...\n",
      " $ end_station_id    : int  141 168 44 47 658 658 49 229 225 305 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t532958 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"2B22BD5F95FB2629\" \"A7FB70B4AFC6CAF2\" \"86057FA01BAC778E\" \"57F6DC9A153DB98C\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2020-09-17 14:27:11\" \"2020-09-17 15:07:31\" \"2020-09-17 15:09:04\" \"2020-09-17 18:10:46\" ...\n",
      " $ ended_at          : chr  \"2020-09-17 14:44:24\" \"2020-09-17 15:07:45\" \"2020-09-17 15:09:35\" \"2020-09-17 18:35:49\" ...\n",
      " $ start_station_name: chr  \"Michigan Ave & Lake St\" \"W Oakdale Ave & N Broadway\" \"W Oakdale Ave & N Broadway\" \"Ashland Ave & Belle Plaine Ave\" ...\n",
      " $ start_station_id  : int  52 NA NA 246 24 94 291 NA NA NA ...\n",
      " $ end_station_name  : chr  \"Green St & Randolph St\" \"W Oakdale Ave & N Broadway\" \"W Oakdale Ave & N Broadway\" \"Montrose Harbor\" ...\n",
      " $ end_station_id    : int  112 NA NA 249 24 NA 256 NA NA NA ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 42 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 42 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t388653 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"ACB6B40CF5B9044C\" \"DF450C72FD109C01\" \"B6396B54A15AC0DF\" \"44A4AEE261B9E854\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2020-10-31 19:39:43\" \"2020-10-31 23:50:08\" \"2020-10-31 23:00:01\" \"2020-10-31 22:16:43\" ...\n",
      " $ ended_at          : chr  \"2020-10-31 19:57:12\" \"2020-11-01 00:04:16\" \"2020-10-31 23:08:22\" \"2020-10-31 22:19:35\" ...\n",
      " $ start_station_name: chr  \"Lakeview Ave & Fullerton Pkwy\" \"Southport Ave & Waveland Ave\" \"Stony Island Ave & 67th St\" \"Clark St & Grace St\" ...\n",
      " $ start_station_id  : int  313 227 102 165 190 359 313 125 NA 174 ...\n",
      " $ end_station_name  : chr  \"Rush St & Hubbard St\" \"Kedzie Ave & Milwaukee Ave\" \"University Ave & 57th St\" \"Broadway & Sheridan Rd\" ...\n",
      " $ end_station_id    : int  125 260 423 256 185 53 125 313 199 635 ...\n",
      " $ start_lat         : num  41.9 41.9 41.8 42 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.7 -87.6 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.8 42 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t259716 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"BD0A6FF6FFF9B921\" \"96A7A7A4BDE4F82D\" \"C61526D06582BDC5\" \"E533E89C32080B9E\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2020-11-01 13:36:00\" \"2020-11-01 10:03:26\" \"2020-11-01 00:34:05\" \"2020-11-01 00:45:16\" ...\n",
      " $ ended_at          : chr  \"2020-11-01 13:45:40\" \"2020-11-01 10:14:45\" \"2020-11-01 01:03:06\" \"2020-11-01 00:54:31\" ...\n",
      " $ start_station_name: chr  \"Dearborn St & Erie St\" \"Franklin St & Illinois St\" \"Lake Shore Dr & Monroe St\" \"Leavitt St & Chicago Ave\" ...\n",
      " $ start_station_id  : int  110 672 76 659 2 72 76 NA 58 394 ...\n",
      " $ end_station_name  : chr  \"St. Clair St & Erie St\" \"Noble St & Milwaukee Ave\" \"Federal St & Polk St\" \"Stave St & Armitage Ave\" ...\n",
      " $ end_station_id    : int  211 29 41 185 2 76 72 NA 288 273 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t131573 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"70B6A9A437D4C30D\" \"158A465D4E74C54A\" \"5262016E0F1F2F9A\" \"BE119628E44F871E\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2020-12-27 12:44:29\" \"2020-12-18 17:37:15\" \"2020-12-15 15:04:33\" \"2020-12-15 15:54:18\" ...\n",
      " $ ended_at          : chr  \"2020-12-27 12:55:06\" \"2020-12-18 17:44:19\" \"2020-12-15 15:11:28\" \"2020-12-15 16:00:11\" ...\n",
      " $ start_station_name: chr  \"Aberdeen St & Jackson Blvd\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"13157\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"Desplaines St & Kinzie St\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"TA1306000003\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.8 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "# check data structure for merging\n",
    "str(Q1)\n",
    "str(Apr)\n",
    "str(May)\n",
    "str(Jun)\n",
    "str(Jul)\n",
    "str(Aug)\n",
    "str(Sep)\n",
    "str(Oct)\n",
    "str(Nov)\n",
    "str(Dec)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c4fc24c5",
   "metadata": {
    "papermill": {
     "duration": 0.166156,
     "end_time": "2022-03-10T14:41:43.623252",
     "exception": false,
     "start_time": "2022-03-10T14:41:43.457096",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I noticed that Dec start station id and end station id need to be converted to interger"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "eb8be09f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:41:43.949396Z",
     "iopub.status.busy": "2022-03-10T14:41:43.947351Z",
     "iopub.status.idle": "2022-03-10T14:41:44.028028Z",
     "shell.execute_reply": "2022-03-10T14:41:44.026763Z"
    },
    "papermill": {
     "duration": 0.243263,
     "end_time": "2022-03-10T14:41:44.028219",
     "exception": false,
     "start_time": "2022-03-10T14:41:43.784956",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in eval(expr, envir, enclos):\n",
      "“NAs introduced by coercion”\n",
      "Warning message in eval(expr, envir, enclos):\n",
      "“NAs introduced by coercion”\n"
     ]
    }
   ],
   "source": [
    "# change the data class to integer\n",
    "\n",
    "Dec$start_station_id <- as.integer(Dec$start_station_id)\n",
    "Dec$end_station_id <- as.integer(Dec$end_station_id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "adb25ab7",
   "metadata": {
    "papermill": {
     "duration": 0.166251,
     "end_time": "2022-03-10T14:41:44.352829",
     "exception": false,
     "start_time": "2022-03-10T14:41:44.186578",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Now I can combine data to one"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "49dba46a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:41:44.692190Z",
     "iopub.status.busy": "2022-03-10T14:41:44.690136Z",
     "iopub.status.idle": "2022-03-10T14:41:50.701008Z",
     "shell.execute_reply": "2022-03-10T14:41:50.699910Z"
    },
    "papermill": {
     "duration": 6.181523,
     "end_time": "2022-03-10T14:41:50.701454",
     "exception": false,
     "start_time": "2022-03-10T14:41:44.519931",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Merge all files into one Dataframe \n",
    "\n",
    "trip2020 <- bind_rows(Q1, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "7c0149f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:41:51.037835Z",
     "iopub.status.busy": "2022-03-10T14:41:51.035598Z",
     "iopub.status.idle": "2022-03-10T14:41:58.922186Z",
     "shell.execute_reply": "2022-03-10T14:41:58.920877Z"
    },
    "papermill": {
     "duration": 8.059172,
     "end_time": "2022-03-10T14:41:58.922417",
     "exception": false,
     "start_time": "2022-03-10T14:41:50.863245",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:3541683     Length:3541683     Length:3541683     Length:3541683    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id  end_station_name   end_station_id   \n",
       " Length:3541683     Min.   :    2.0   Length:3541683     Min.   :    2.0  \n",
       " Class :character   1st Qu.:   94.0   Class :character   1st Qu.:   95.0  \n",
       " Mode  :character   Median :  196.0   Mode  :character   Median :  196.0  \n",
       "                    Mean   :  406.6                      Mean   :  407.4  \n",
       "                    3rd Qu.:  317.0                      3rd Qu.:  317.0  \n",
       "                    Max.   :20254.0                      Max.   :20254.0  \n",
       "                    NA's   :164182                       NA's   :178878   \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.87   Min.   :41.54   Min.   :-87.89  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.64   Mean   :41.90   Mean   :-87.64  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :42.08   Max.   :-87.52   Max.   :42.16   Max.   :-87.44  \n",
       "                                  NA's   :4255    NA's   :4255    \n",
       " member_casual     \n",
       " Length:3541683    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 3,541,683\n",
      "Columns: 13\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"EACB19130B0CDA4A\", \"8FED874C809DC021\", \"789F3C21E4…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"docked_bike\", \"docked_bike\", \"docked_bike\", \"docke…\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2020-01-21 20:06:59\", \"2020-01-30 14:22:39\", \"2020…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2020-01-21 20:14:30\", \"2020-01-30 14:26:22\", \"2020…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Western Ave & Leland Ave\", \"Clark St & Montrose Av…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 239, 234, 296, 51, 66, 212, 96, 96, 212, 38, 117, 1…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Clark St & Leland Ave\", \"Southport Ave & Irving Pa…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 326, 318, 117, 24, 212, 96, 212, 212, 96, 100, 632,…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.9665, 41.9616, 41.9401, 41.8846, 41.8856, 41.889…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.6884, -87.6660, -87.6455, -87.6319, -87.6418, -…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.9671, 41.9542, 41.9402, 41.8918, 41.8899, 41.884…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.6674, -87.6644, -87.6530, -87.6206, -87.6343, -…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n"
     ]
    }
   ],
   "source": [
    "# View summary of merged dataframe \n",
    "\n",
    "summary(trip2020)\n",
    "glimpse(trip2020)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "9378cfc9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:41:59.269151Z",
     "iopub.status.busy": "2022-03-10T14:41:59.267556Z",
     "iopub.status.idle": "2022-03-10T14:42:47.424187Z",
     "shell.execute_reply": "2022-03-10T14:42:47.425014Z"
    },
    "papermill": {
     "duration": 48.331734,
     "end_time": "2022-03-10T14:42:47.425254",
     "exception": false,
     "start_time": "2022-03-10T14:41:59.093520",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values  \n",
      "Name                       trip2020\n",
      "Number of rows             3541683 \n",
      "Number of columns          13      \n",
      "_______________________            \n",
      "Column type frequency:             \n",
      "  character                7       \n",
      "  numeric                  6       \n",
      "________________________           \n",
      "Group variables            None    \n",
      "\n",
      "── Variable type: character ────────────────────────────────────────────────────\n",
      "  skim_variable      n_missing complete_rate   min   max  empty n_unique\n",
      "1 ride_id                    0             1    16    16      0  3541474\n",
      "2 rideable_type              0             1    11    13      0        3\n",
      "3 started_at                 0             1    19    19      0  3088593\n",
      "4 ended_at                   0             1    19    19      0  3077059\n",
      "5 start_station_name         0             1     0    43  94656      695\n",
      "6 end_station_name           0             1     0    43 110881      695\n",
      "7 member_casual              0             1     6     6      0        2\n",
      "  whitespace\n",
      "1          0\n",
      "2          0\n",
      "3          0\n",
      "4          0\n",
      "5          0\n",
      "6          0\n",
      "7          0\n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean        sd    p0   p25   p50\n",
      "1 start_station_id    164182         0.954 407.  1572.       2    94   196  \n",
      "2 end_station_id      178878         0.949 407.  1572.       2    95   196  \n",
      "3 start_lat                0         1      41.9    0.0429  41.6  41.9  41.9\n",
      "4 start_lng                0         1     -87.6    0.0253 -87.9 -87.7 -87.6\n",
      "5 end_lat               4255         0.999  41.9    0.0430  41.5  41.9  41.9\n",
      "6 end_lng               4255         0.999 -87.6    0.0255 -87.9 -87.7 -87.6\n",
      "    p75    p100 hist \n",
      "1 317   20254   ▇▁▁▁▁\n",
      "2 317   20254   ▇▁▁▁▁\n",
      "3  41.9    42.1 ▁▁▇▆▁\n",
      "4 -87.6   -87.5 ▁▁▂▇▁\n",
      "5  41.9    42.2 ▁▁▇▅▁\n",
      "6 -87.6   -87.4 ▁▁▇▁▁\n"
     ]
    }
   ],
   "source": [
    "# quick investiation to dataset\n",
    "\n",
    "skim(trip2020)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e335e5bb",
   "metadata": {
    "papermill": {
     "duration": 0.172762,
     "end_time": "2022-03-10T14:42:47.768959",
     "exception": false,
     "start_time": "2022-03-10T14:42:47.596197",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There are quite of missing data, will remove them. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "40d2d974",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:42:48.117120Z",
     "iopub.status.busy": "2022-03-10T14:42:48.115617Z",
     "iopub.status.idle": "2022-03-10T14:44:05.475556Z",
     "shell.execute_reply": "2022-03-10T14:44:05.476325Z"
    },
    "papermill": {
     "duration": 77.540679,
     "end_time": "2022-03-10T14:44:05.476596",
     "exception": false,
     "start_time": "2022-03-10T14:42:47.935917",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "351570"
      ],
      "text/latex": [
       "351570"
      ],
      "text/markdown": [
       "351570"
      ],
      "text/plain": [
       "[1] 351570"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values      \n",
      "Name                       trip2020_new\n",
      "Number of rows             3298844     \n",
      "Number of columns          13          \n",
      "_______________________                \n",
      "Column type frequency:                 \n",
      "  character                7           \n",
      "  numeric                  6           \n",
      "________________________               \n",
      "Group variables            None        \n",
      "\n",
      "── Variable type: character ────────────────────────────────────────────────────\n",
      "  skim_variable      n_missing complete_rate   min   max empty n_unique\n",
      "1 ride_id                    0             1    16    16     0  3298800\n",
      "2 rideable_type              0             1    11    13     0        3\n",
      "3 started_at                 0             1    19    19     0  2881239\n",
      "4 ended_at                   0             1    19    19     0  2869918\n",
      "5 start_station_name         0             1     5    43     0      690\n",
      "6 end_station_name           0             1     5    43     0      689\n",
      "7 member_casual              0             1     6     6     0        2\n",
      "  whitespace\n",
      "1          0\n",
      "2          0\n",
      "3          0\n",
      "4          0\n",
      "5          0\n",
      "6          0\n",
      "7          0\n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean        sd    p0   p25   p50\n",
      "1 start_station_id         0             1 309.  1089.       2    94   195  \n",
      "2 end_station_id           0             1 310.  1090.       2    94   195  \n",
      "3 start_lat                0             1  41.9    0.0412  41.6  41.9  41.9\n",
      "4 start_lng                0             1 -87.6    0.0243 -87.8 -87.7 -87.6\n",
      "5 end_lat                  0             1  41.9    0.0414  41.6  41.9  41.9\n",
      "6 end_lng                  0             1 -87.6    0.0244 -87.8 -87.7 -87.6\n",
      "    p75    p100 hist \n",
      "1 312   20254   ▇▁▁▁▁\n",
      "2 313   20254   ▇▁▁▁▁\n",
      "3  41.9    42.1 ▁▁▇▇▁\n",
      "4 -87.6   -87.5 ▁▁▇▃▁\n",
      "5  41.9    42.1 ▁▁▇▇▁\n",
      "6 -87.6   -87.5 ▁▁▇▃▁\n"
     ]
    }
   ],
   "source": [
    "sum(is.na(trip2020)) # we have 351570 rows that contains missing data\n",
    "\n",
    "trip2020_new <- trip2020 %>%\n",
    "  na_if(\"\") %>%\n",
    "  na.omit # remove missing data\n",
    "\n",
    "sum(is.na(trip2020_new)) \n",
    "skim(trip2020_new) # check datase again"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c5378217",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:44:05.839012Z",
     "iopub.status.busy": "2022-03-10T14:44:05.836716Z",
     "iopub.status.idle": "2022-03-10T14:44:27.196751Z",
     "shell.execute_reply": "2022-03-10T14:44:27.194629Z"
    },
    "papermill": {
     "duration": 21.541824,
     "end_time": "2022-03-10T14:44:27.196986",
     "exception": false,
     "start_time": "2022-03-10T14:44:05.655162",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# convert date class to date type from character\n",
    "\n",
    "trip2020_new$started_at <- as.POSIXct(trip2020_new$started_at, \"%Y-%m-%d %H:%M:%S\")\n",
    "trip2020_new$ended_at <- as.POSIXct(trip2020_new$ended_at, \"%Y-%m-%d %H:%M:%S\")\n",
    "\n",
    "attr(trip2020_new$started_at, \"tzone\") <- \"America/New_York\"\n",
    "attr(trip2020_new$ended_at, \"tzone\") <- \"America/New_York\""
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c5b12496",
   "metadata": {
    "papermill": {
     "duration": 0.173393,
     "end_time": "2022-03-10T14:44:27.557831",
     "exception": false,
     "start_time": "2022-03-10T14:44:27.384438",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I need new columns for better analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "da24236b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:44:27.925852Z",
     "iopub.status.busy": "2022-03-10T14:44:27.923836Z",
     "iopub.status.idle": "2022-03-10T14:44:37.513997Z",
     "shell.execute_reply": "2022-03-10T14:44:37.511478Z"
    },
    "papermill": {
     "duration": 9.773142,
     "end_time": "2022-03-10T14:44:37.514183",
     "exception": false,
     "start_time": "2022-03-10T14:44:27.741041",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# New columns for year, month, weekday, and hour of each ride.\n",
    "\n",
    "trip2020_new$year <- format(trip2020_new$started_at,\"%Y\")\n",
    "trip2020_new$month <- format(as.Date(trip2020_new$started_at),\"%B\")\n",
    "trip2020_new$weekday <- strftime(trip2020_new$started_at, \"%A\")\n",
    "trip2020_new$hour <- as.numeric(format(as.POSIXct(trip2020_new$started_at), format = \"%H\"))\n",
    "\n",
    "# Created a column for Ride Length\n",
    "\n",
    "trip2020_new <-mutate(trip2020_new, ride_length = round(difftime(ended_at, started_at, units = \"mins\"), 0))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "fb603b74",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:44:37.873053Z",
     "iopub.status.busy": "2022-03-10T14:44:37.871156Z",
     "iopub.status.idle": "2022-03-10T14:45:26.554672Z",
     "shell.execute_reply": "2022-03-10T14:45:26.555541Z"
    },
    "papermill": {
     "duration": 48.863271,
     "end_time": "2022-03-10T14:45:26.555746",
     "exception": false,
     "start_time": "2022-03-10T14:44:37.692475",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values      \n",
      "Name                       trip2020_new\n",
      "Number of rows             3298844     \n",
      "Number of columns          18          \n",
      "_______________________                \n",
      "Column type frequency:                 \n",
      "  character                8           \n",
      "  difftime                 1           \n",
      "  numeric                  7           \n",
      "  POSIXct                  2           \n",
      "________________________               \n",
      "Group variables            None        \n",
      "\n",
      "── Variable type: character ────────────────────────────────────────────────────\n",
      "  skim_variable      n_missing complete_rate   min   max empty n_unique\n",
      "1 ride_id                    0             1    16    16     0  3298800\n",
      "2 rideable_type              0             1    11    13     0        3\n",
      "3 start_station_name         0             1     5    43     0      690\n",
      "4 end_station_name           0             1     5    43     0      689\n",
      "5 member_casual              0             1     6     6     0        2\n",
      "6 year                       0             1     4     4     0        2\n",
      "7 month                      0             1     3     9     0       12\n",
      "8 weekday                    0             1     6     9     0        7\n",
      "  whitespace\n",
      "1          0\n",
      "2          0\n",
      "3          0\n",
      "4          0\n",
      "5          0\n",
      "6          0\n",
      "7          0\n",
      "8          0\n",
      "\n",
      "── Variable type: difftime ─────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate min         max         median  n_unique\n",
      "1 ride_length           0             1 -29010 mins 156450 mins 14 mins     3062\n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean        sd    p0   p25   p50\n",
      "1 start_station_id         0             1 309.  1089.       2    94   195  \n",
      "2 end_station_id           0             1 310.  1090.       2    94   195  \n",
      "3 start_lat                0             1  41.9    0.0412  41.6  41.9  41.9\n",
      "4 start_lng                0             1 -87.6    0.0243 -87.8 -87.7 -87.6\n",
      "5 end_lat                  0             1  41.9    0.0414  41.6  41.9  41.9\n",
      "6 end_lng                  0             1 -87.6    0.0244 -87.8 -87.7 -87.6\n",
      "7 hour                     0             1  10.5    4.52     0     7    11  \n",
      "    p75    p100 hist \n",
      "1 312   20254   ▇▁▁▁▁\n",
      "2 313   20254   ▇▁▁▁▁\n",
      "3  41.9    42.1 ▁▁▇▇▁\n",
      "4 -87.6   -87.5 ▁▁▇▃▁\n",
      "5  41.9    42.1 ▁▁▇▇▁\n",
      "6 -87.6   -87.5 ▁▁▇▃▁\n",
      "7  14      23   ▃▆▇▆▁\n",
      "\n",
      "── Variable type: POSIXct ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate min                 max                \n",
      "1 started_at            0             1 2019-12-31 19:04:44 2020-12-31 18:59:59\n",
      "2 ended_at              0             1 2019-12-31 19:10:54 2021-01-02 17:03:22\n",
      "  median              n_unique\n",
      "1 2020-08-03 11:26:46  2881239\n",
      "2 2020-08-03 11:52:01  2869918\n"
     ]
    }
   ],
   "source": [
    "# investigate the data frame one more time\n",
    "\n",
    "skim(trip2020_new)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ff875bf1",
   "metadata": {
    "papermill": {
     "duration": 0.176331,
     "end_time": "2022-03-10T14:45:26.908494",
     "exception": false,
     "start_time": "2022-03-10T14:45:26.732163",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There are negative data on trip ride length column, will remove them. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "85b7c3a7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:45:27.257910Z",
     "iopub.status.busy": "2022-03-10T14:45:27.256419Z",
     "iopub.status.idle": "2022-03-10T14:45:27.302277Z",
     "shell.execute_reply": "2022-03-10T14:45:27.300036Z"
    },
    "papermill": {
     "duration": 0.218101,
     "end_time": "2022-03-10T14:45:27.302512",
     "exception": false,
     "start_time": "2022-03-10T14:45:27.084411",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1610</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " n\\\\\n",
       " <int>\\\\\n",
       "\\hline\n",
       "\t 1610\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 1\n",
       "\n",
       "| n &lt;int&gt; |\n",
       "|---|\n",
       "| 1610 |\n",
       "\n"
      ],
      "text/plain": [
       "  n   \n",
       "1 1610"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Total number of rides with negative duration \n",
    "\n",
    "count(trip2020_new[which(trip2020_new$ride_length < 0),]) # total 1610 negative value on ride length"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "c88b80e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:45:27.672705Z",
     "iopub.status.busy": "2022-03-10T14:45:27.669578Z",
     "iopub.status.idle": "2022-03-10T14:45:35.786250Z",
     "shell.execute_reply": "2022-03-10T14:45:35.784148Z"
    },
    "papermill": {
     "duration": 8.302308,
     "end_time": "2022-03-10T14:45:35.786464",
     "exception": false,
     "start_time": "2022-03-10T14:45:27.484156",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# remove the negative value and also remove duplicates\n",
    "\n",
    "trip2020_new = filter(trip2020_new, ride_length >= 0)\n",
    "trip2020_new <- distinct(trip2020_new)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "defd40a9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:45:36.157246Z",
     "iopub.status.busy": "2022-03-10T14:45:36.155282Z",
     "iopub.status.idle": "2022-03-10T14:45:36.323471Z",
     "shell.execute_reply": "2022-03-10T14:45:36.321374Z"
    },
    "papermill": {
     "duration": 0.360369,
     "end_time": "2022-03-10T14:45:36.323660",
     "exception": false,
     "start_time": "2022-03-10T14:45:35.963291",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# set order on days of the week and months of the year for easier analysis. \n",
    "\n",
    "trip2020_new$weekday <- ordered(trip2020_new$weekday, levels=c(\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\",\"Sunday\"))\n",
    "trip2020_new$month <- ordered(trip2020_new$month, levels=c(\"January\", \"February\", \"March\", \"April\", \"May\", \"June\", \"July\", \"August\", \"September\",\"October\", \"November\", \"December\"))\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "2ddecf45",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:45:36.690803Z",
     "iopub.status.busy": "2022-03-10T14:45:36.688424Z",
     "iopub.status.idle": "2022-03-10T14:46:14.687870Z",
     "shell.execute_reply": "2022-03-10T14:46:14.688395Z"
    },
    "papermill": {
     "duration": 38.188657,
     "end_time": "2022-03-10T14:46:14.688570",
     "exception": false,
     "start_time": "2022-03-10T14:45:36.499913",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values      \n",
      "Name                       trip2020_new\n",
      "Number of rows             3297234     \n",
      "Number of columns          18          \n",
      "_______________________                \n",
      "Column type frequency:                 \n",
      "  character                6           \n",
      "  difftime                 1           \n",
      "  factor                   2           \n",
      "  numeric                  7           \n",
      "  POSIXct                  2           \n",
      "________________________               \n",
      "Group variables            None        \n",
      "\n",
      "── Variable type: character ────────────────────────────────────────────────────\n",
      "  skim_variable      n_missing complete_rate   min   max empty n_unique\n",
      "1 ride_id                    0             1    16    16     0  3297234\n",
      "2 rideable_type              0             1    11    13     0        3\n",
      "3 start_station_name         0             1     5    43     0      690\n",
      "4 end_station_name           0             1     5    43     0      689\n",
      "5 member_casual              0             1     6     6     0        2\n",
      "6 year                       0             1     4     4     0        2\n",
      "  whitespace\n",
      "1          0\n",
      "2          0\n",
      "3          0\n",
      "4          0\n",
      "5          0\n",
      "6          0\n",
      "\n",
      "── Variable type: difftime ─────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate min    max         median  n_unique\n",
      "1 ride_length           0             1 0 mins 156450 mins 14 mins     2942\n",
      "\n",
      "── Variable type: factor ───────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate ordered n_unique\n",
      "1 month                 0             1 TRUE          12\n",
      "2 weekday               0             1 TRUE           7\n",
      "  top_counts                                        \n",
      "1 Aug: 608340, Jul: 550216, Sep: 500240, Jun: 342512\n",
      "2 Sat: 588163, Sun: 493791, Fri: 493393, Thu: 454544\n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate  mean        sd    p0   p25   p50\n",
      "1 start_station_id         0             1 308.  1088.       2    94   195  \n",
      "2 end_station_id           0             1 309.  1089.       2    94   195  \n",
      "3 start_lat                0             1  41.9    0.0412  41.6  41.9  41.9\n",
      "4 start_lng                0             1 -87.6    0.0243 -87.8 -87.7 -87.6\n",
      "5 end_lat                  0             1  41.9    0.0414  41.6  41.9  41.9\n",
      "6 end_lng                  0             1 -87.6    0.0244 -87.8 -87.7 -87.6\n",
      "7 hour                     0             1  10.5    4.52     0     7    11  \n",
      "    p75    p100 hist \n",
      "1 312   20254   ▇▁▁▁▁\n",
      "2 313   20254   ▇▁▁▁▁\n",
      "3  41.9    42.1 ▁▁▇▇▁\n",
      "4 -87.6   -87.5 ▁▁▇▃▁\n",
      "5  41.9    42.1 ▁▁▇▇▁\n",
      "6 -87.6   -87.5 ▁▁▇▃▁\n",
      "7  14      23   ▃▆▇▆▁\n",
      "\n",
      "── Variable type: POSIXct ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate min                 max                \n",
      "1 started_at            0             1 2019-12-31 19:04:44 2020-12-31 18:59:59\n",
      "2 ended_at              0             1 2019-12-31 19:10:54 2021-01-02 17:03:22\n",
      "  median              n_unique\n",
      "1 2020-08-03 10:52:32  2880234\n",
      "2 2020-08-03 11:21:47  2868665\n"
     ]
    }
   ],
   "source": [
    "# final check\n",
    "\n",
    "skim(trip2020_new)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8395b203",
   "metadata": {
    "papermill": {
     "duration": 0.186527,
     "end_time": "2022-03-10T14:46:15.060168",
     "exception": false,
     "start_time": "2022-03-10T14:46:14.873641",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****4. Analyse****\n",
    "\n",
    "* Aggregate your data so it’s useful and accessible.\n",
    "* Organize and format your data.\n",
    "* Perform calculations.\n",
    "* Identify trends and relationships.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "880e56bb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:15.433804Z",
     "iopub.status.busy": "2022-03-10T14:46:15.431301Z",
     "iopub.status.idle": "2022-03-10T14:46:18.039173Z",
     "shell.execute_reply": "2022-03-10T14:46:18.036964Z"
    },
    "papermill": {
     "duration": 2.795516,
     "end_time": "2022-03-10T14:46:18.039335",
     "exception": false,
     "start_time": "2022-03-10T14:46:15.243819",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:3297234     Length:3297234     Min.   :2019-12-31 19:04:44  \n",
       " Class :character   Class :character   1st Qu.:2020-06-13 17:56:34  \n",
       " Mode  :character   Mode  :character   Median :2020-08-03 10:52:32  \n",
       "                                       Mean   :2020-07-21 05:22:26  \n",
       "                                       3rd Qu.:2020-09-16 20:19:12  \n",
       "                                       Max.   :2020-12-31 18:59:59  \n",
       "                                                                    \n",
       "    ended_at                   start_station_name start_station_id \n",
       " Min.   :2019-12-31 19:10:54   Length:3297234     Min.   :    2.0  \n",
       " 1st Qu.:2020-06-13 18:39:26   Class :character   1st Qu.:   94.0  \n",
       " Median :2020-08-03 11:21:47   Mode  :character   Median :  195.0  \n",
       " Mean   :2020-07-21 05:50:45                      Mean   :  308.4  \n",
       " 3rd Qu.:2020-09-16 21:14:02                      3rd Qu.:  312.0  \n",
       " Max.   :2021-01-02 17:03:22                      Max.   :20254.0  \n",
       "                                                                   \n",
       " end_station_name   end_station_id      start_lat       start_lng     \n",
       " Length:3297234     Min.   :    2.0   Min.   :41.65   Min.   :-87.77  \n",
       " Class :character   1st Qu.:   94.0   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Median :  195.0   Median :41.90   Median :-87.64  \n",
       "                    Mean   :  309.3   Mean   :41.90   Mean   :-87.64  \n",
       "                    3rd Qu.:  313.0   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                    Max.   :20254.0   Max.   :42.06   Max.   :-87.53  \n",
       "                                                                      \n",
       "    end_lat         end_lng       member_casual          year          \n",
       " Min.   :41.65   Min.   :-87.77   Length:3297234     Length:3297234    \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character   Class :character  \n",
       " Median :41.90   Median :-87.64   Mode  :character   Mode  :character  \n",
       " Mean   :41.90   Mean   :-87.64                                        \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                                        \n",
       " Max.   :42.07   Max.   :-87.53                                        \n",
       "                                                                       \n",
       "       month             weekday            hour       ride_length      \n",
       " August   :608340   Monday   :402899   Min.   : 0.00   Length:3297234   \n",
       " July     :550216   Tuesday  :418632   1st Qu.: 7.00   Class :difftime  \n",
       " September:500240   Wednesday:445812   Median :11.00   Mode  :numeric   \n",
       " June     :342512   Thursday :454544   Mean   :10.54                    \n",
       " October  :338513   Friday   :493393   3rd Qu.:14.00                    \n",
       " November :222620   Saturday :588163   Max.   :23.00                    \n",
       " (Other)  :734793   Sunday   :493791                                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# statistical summary all trip\n",
    "\n",
    "summary(trip2020_new)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "44bcb996",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:18.419373Z",
     "iopub.status.busy": "2022-03-10T14:46:18.416711Z",
     "iopub.status.idle": "2022-03-10T14:46:18.547047Z",
     "shell.execute_reply": "2022-03-10T14:46:18.545160Z"
    },
    "papermill": {
     "duration": 0.320484,
     "end_time": "2022-03-10T14:46:18.547211",
     "exception": false,
     "start_time": "2022-03-10T14:46:18.226727",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>n</th><th scope=col>perc</th><th scope=col>labels</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1281621</td><td>0.3886958</td><td>39%</td></tr>\n",
       "\t<tr><td>member</td><td>2015613</td><td>0.6113042</td><td>61%</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & n & perc & labels\\\\\n",
       " <chr> & <int> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t casual & 1281621 & 0.3886958 & 39\\%\\\\\n",
       "\t member & 2015613 & 0.6113042 & 61\\%\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | n &lt;int&gt; | perc &lt;dbl&gt; | labels &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | 1281621 | 0.3886958 | 39% |\n",
       "| member | 2015613 | 0.6113042 | 61% |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual n       perc      labels\n",
       "1 casual        1281621 0.3886958 39%   \n",
       "2 member        2015613 0.6113042 61%   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# checking the membership distrubution of all rides in 2020\n",
    "\n",
    "percentage <- trip2020_new %>% \n",
    "  group_by(member_casual) %>% # Variable to be transformed\n",
    "  count() %>% \n",
    "  ungroup() %>% \n",
    "  mutate(perc = `n` / sum(`n`)) %>% \n",
    "  arrange(perc) %>%\n",
    "  mutate(labels = scales::percent(perc))\n",
    "View(percentage)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a99a28c1",
   "metadata": {
    "papermill": {
     "duration": 0.185253,
     "end_time": "2022-03-10T14:46:18.916102",
     "exception": false,
     "start_time": "2022-03-10T14:46:18.730849",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Result shows 39% for casual ride, 61% for member rides"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "ad604bf6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:19.300434Z",
     "iopub.status.busy": "2022-03-10T14:46:19.298302Z",
     "iopub.status.idle": "2022-03-10T14:46:20.613803Z",
     "shell.execute_reply": "2022-03-10T14:46:20.612326Z"
    },
    "papermill": {
     "duration": 1.51106,
     "end_time": "2022-03-10T14:46:20.613983",
     "exception": false,
     "start_time": "2022-03-10T14:46:19.102923",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>max_ride_length</th><th scope=col>mean_ride_length</th><th scope=col>median_ride_length</th><th scope=col>min_ride_length</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td> 46165 mins</td><td>47 mins</td><td>21 mins</td><td>0 mins</td><td>132101</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td> 69505 mins</td><td>44 mins</td><td>20 mins</td><td>0 mins</td><td>127727</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td> 74703 mins</td><td>44 mins</td><td>19 mins</td><td>0 mins</td><td>141380</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>156450 mins</td><td>47 mins</td><td>19 mins</td><td>0 mins</td><td>150832</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>117323 mins</td><td>46 mins</td><td>21 mins</td><td>0 mins</td><td>189582</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td> 65662 mins</td><td>49 mins</td><td>24 mins</td><td>0 mins</td><td>297591</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>143937 mins</td><td>55 mins</td><td>26 mins</td><td>0 mins</td><td>242408</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 93794 mins</td><td>15 mins</td><td>10 mins</td><td>0 mins</td><td>270798</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 15105 mins</td><td>14 mins</td><td>11 mins</td><td>0 mins</td><td>290905</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 41271 mins</td><td>15 mins</td><td>11 mins</td><td>0 mins</td><td>304432</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 36156 mins</td><td>15 mins</td><td>11 mins</td><td>0 mins</td><td>303712</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 42956 mins</td><td>15 mins</td><td>11 mins</td><td>0 mins</td><td>303811</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 79218 mins</td><td>18 mins</td><td>13 mins</td><td>0 mins</td><td>290572</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 58720 mins</td><td>18 mins</td><td>13 mins</td><td>0 mins</td><td>251383</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 7\n",
       "\\begin{tabular}{lllllll}\n",
       " member\\_casual & weekday & max\\_ride\\_length & mean\\_ride\\_length & median\\_ride\\_length & min\\_ride\\_length & number\\_of\\_rides\\\\\n",
       " <chr> & <ord> & <drtn> & <drtn> & <drtn> & <drtn> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Monday    &  46165 mins & 47 mins & 21 mins & 0 mins & 132101\\\\\n",
       "\t casual & Tuesday   &  69505 mins & 44 mins & 20 mins & 0 mins & 127727\\\\\n",
       "\t casual & Wednesday &  74703 mins & 44 mins & 19 mins & 0 mins & 141380\\\\\n",
       "\t casual & Thursday  & 156450 mins & 47 mins & 19 mins & 0 mins & 150832\\\\\n",
       "\t casual & Friday    & 117323 mins & 46 mins & 21 mins & 0 mins & 189582\\\\\n",
       "\t casual & Saturday  &  65662 mins & 49 mins & 24 mins & 0 mins & 297591\\\\\n",
       "\t casual & Sunday    & 143937 mins & 55 mins & 26 mins & 0 mins & 242408\\\\\n",
       "\t member & Monday    &  93794 mins & 15 mins & 10 mins & 0 mins & 270798\\\\\n",
       "\t member & Tuesday   &  15105 mins & 14 mins & 11 mins & 0 mins & 290905\\\\\n",
       "\t member & Wednesday &  41271 mins & 15 mins & 11 mins & 0 mins & 304432\\\\\n",
       "\t member & Thursday  &  36156 mins & 15 mins & 11 mins & 0 mins & 303712\\\\\n",
       "\t member & Friday    &  42956 mins & 15 mins & 11 mins & 0 mins & 303811\\\\\n",
       "\t member & Saturday  &  79218 mins & 18 mins & 13 mins & 0 mins & 290572\\\\\n",
       "\t member & Sunday    &  58720 mins & 18 mins & 13 mins & 0 mins & 251383\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 7\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | max_ride_length &lt;drtn&gt; | mean_ride_length &lt;drtn&gt; | median_ride_length &lt;drtn&gt; | min_ride_length &lt;drtn&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| casual | Monday    |  46165 mins | 47 mins | 21 mins | 0 mins | 132101 |\n",
       "| casual | Tuesday   |  69505 mins | 44 mins | 20 mins | 0 mins | 127727 |\n",
       "| casual | Wednesday |  74703 mins | 44 mins | 19 mins | 0 mins | 141380 |\n",
       "| casual | Thursday  | 156450 mins | 47 mins | 19 mins | 0 mins | 150832 |\n",
       "| casual | Friday    | 117323 mins | 46 mins | 21 mins | 0 mins | 189582 |\n",
       "| casual | Saturday  |  65662 mins | 49 mins | 24 mins | 0 mins | 297591 |\n",
       "| casual | Sunday    | 143937 mins | 55 mins | 26 mins | 0 mins | 242408 |\n",
       "| member | Monday    |  93794 mins | 15 mins | 10 mins | 0 mins | 270798 |\n",
       "| member | Tuesday   |  15105 mins | 14 mins | 11 mins | 0 mins | 290905 |\n",
       "| member | Wednesday |  41271 mins | 15 mins | 11 mins | 0 mins | 304432 |\n",
       "| member | Thursday  |  36156 mins | 15 mins | 11 mins | 0 mins | 303712 |\n",
       "| member | Friday    |  42956 mins | 15 mins | 11 mins | 0 mins | 303811 |\n",
       "| member | Saturday  |  79218 mins | 18 mins | 13 mins | 0 mins | 290572 |\n",
       "| member | Sunday    |  58720 mins | 18 mins | 13 mins | 0 mins | 251383 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday   max_ride_length mean_ride_length median_ride_length\n",
       "1  casual        Monday     46165 mins     47 mins          21 mins           \n",
       "2  casual        Tuesday    69505 mins     44 mins          20 mins           \n",
       "3  casual        Wednesday  74703 mins     44 mins          19 mins           \n",
       "4  casual        Thursday  156450 mins     47 mins          19 mins           \n",
       "5  casual        Friday    117323 mins     46 mins          21 mins           \n",
       "6  casual        Saturday   65662 mins     49 mins          24 mins           \n",
       "7  casual        Sunday    143937 mins     55 mins          26 mins           \n",
       "8  member        Monday     93794 mins     15 mins          10 mins           \n",
       "9  member        Tuesday    15105 mins     14 mins          11 mins           \n",
       "10 member        Wednesday  41271 mins     15 mins          11 mins           \n",
       "11 member        Thursday   36156 mins     15 mins          11 mins           \n",
       "12 member        Friday     42956 mins     15 mins          11 mins           \n",
       "13 member        Saturday   79218 mins     18 mins          13 mins           \n",
       "14 member        Sunday     58720 mins     18 mins          13 mins           \n",
       "   min_ride_length number_of_rides\n",
       "1  0 mins          132101         \n",
       "2  0 mins          127727         \n",
       "3  0 mins          141380         \n",
       "4  0 mins          150832         \n",
       "5  0 mins          189582         \n",
       "6  0 mins          297591         \n",
       "7  0 mins          242408         \n",
       "8  0 mins          270798         \n",
       "9  0 mins          290905         \n",
       "10 0 mins          304432         \n",
       "11 0 mins          303712         \n",
       "12 0 mins          303811         \n",
       "13 0 mins          290572         \n",
       "14 0 mins          251383         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Calculate ride lengths and number of rides group by weekday.\n",
    "\n",
    "trip2020_new %>%\n",
    "  group_by(member_casual, weekday) %>%\n",
    "  summarise(max_ride_length = max(ride_length), mean_ride_length = round(mean(ride_length)), median_ride_length = median(ride_length), min_ride_length = min(ride_length), number_of_rides = n())\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a31677f1",
   "metadata": {
    "papermill": {
     "duration": 0.191516,
     "end_time": "2022-03-10T14:46:20.999553",
     "exception": false,
     "start_time": "2022-03-10T14:46:20.808037",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Result shows mean ride and median ride time for casual are longer than member, and number of rides for casual are significantly more on weekend whereas it stays around same for member"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "bb4e5ee3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:21.394191Z",
     "iopub.status.busy": "2022-03-10T14:46:21.391869Z",
     "iopub.status.idle": "2022-03-10T14:46:21.943572Z",
     "shell.execute_reply": "2022-03-10T14:46:21.940949Z"
    },
    "papermill": {
     "duration": 0.748002,
     "end_time": "2022-03-10T14:46:21.943789",
     "exception": false,
     "start_time": "2022-03-10T14:46:21.195787",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 24 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month</th><th scope=col>max_ride_length</th><th scope=col>mean_ride_length</th><th scope=col>median_ride_length</th><th scope=col>min_ride_length</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>January  </td><td>156450 mins</td><td>162 mins</td><td>17 mins</td><td>0 mins</td><td>  7785</td></tr>\n",
       "\t<tr><td>casual</td><td>February </td><td>143937 mins</td><td>128 mins</td><td>21 mins</td><td>0 mins</td><td> 12870</td></tr>\n",
       "\t<tr><td>casual</td><td>March    </td><td> 57250 mins</td><td> 63 mins</td><td>23 mins</td><td>0 mins</td><td> 27821</td></tr>\n",
       "\t<tr><td>casual</td><td>April    </td><td> 55684 mins</td><td> 72 mins</td><td>25 mins</td><td>0 mins</td><td> 23587</td></tr>\n",
       "\t<tr><td>casual</td><td>May      </td><td> 28897 mins</td><td> 51 mins</td><td>27 mins</td><td>0 mins</td><td> 86756</td></tr>\n",
       "\t<tr><td>casual</td><td>June     </td><td> 38537 mins</td><td> 51 mins</td><td>25 mins</td><td>0 mins</td><td>154499</td></tr>\n",
       "\t<tr><td>casual</td><td>July     </td><td> 49965 mins</td><td> 59 mins</td><td>25 mins</td><td>0 mins</td><td>268665</td></tr>\n",
       "\t<tr><td>casual</td><td>August   </td><td> 40846 mins</td><td> 44 mins</td><td>22 mins</td><td>0 mins</td><td>282944</td></tr>\n",
       "\t<tr><td>casual</td><td>September</td><td> 54283 mins</td><td> 38 mins</td><td>19 mins</td><td>0 mins</td><td>215270</td></tr>\n",
       "\t<tr><td>casual</td><td>October  </td><td> 35724 mins</td><td> 31 mins</td><td>16 mins</td><td>0 mins</td><td>122567</td></tr>\n",
       "\t<tr><td>casual</td><td>November </td><td> 35934 mins</td><td> 33 mins</td><td>17 mins</td><td>0 mins</td><td> 72991</td></tr>\n",
       "\t<tr><td>casual</td><td>December </td><td>  6715 mins</td><td> 33 mins</td><td>17 mins</td><td>0 mins</td><td>  5866</td></tr>\n",
       "\t<tr><td>member</td><td>January  </td><td> 10424 mins</td><td> 11 mins</td><td> 8 mins</td><td>0 mins</td><td>136099</td></tr>\n",
       "\t<tr><td>member</td><td>February </td><td> 79218 mins</td><td> 13 mins</td><td> 8 mins</td><td>0 mins</td><td>126715</td></tr>\n",
       "\t<tr><td>member</td><td>March    </td><td> 93794 mins</td><td> 14 mins</td><td>10 mins</td><td>0 mins</td><td>115593</td></tr>\n",
       "\t<tr><td>member</td><td>April    </td><td> 58720 mins</td><td> 21 mins</td><td>14 mins</td><td>0 mins</td><td> 61082</td></tr>\n",
       "\t<tr><td>member</td><td>May      </td><td>  7075 mins</td><td> 20 mins</td><td>15 mins</td><td>0 mins</td><td>113185</td></tr>\n",
       "\t<tr><td>member</td><td>June     </td><td> 41271 mins</td><td> 19 mins</td><td>14 mins</td><td>0 mins</td><td>188013</td></tr>\n",
       "\t<tr><td>member</td><td>July     </td><td> 15105 mins</td><td> 18 mins</td><td>13 mins</td><td>0 mins</td><td>281551</td></tr>\n",
       "\t<tr><td>member</td><td>August   </td><td> 33421 mins</td><td> 16 mins</td><td>12 mins</td><td>0 mins</td><td>325396</td></tr>\n",
       "\t<tr><td>member</td><td>September</td><td> 31170 mins</td><td> 15 mins</td><td>11 mins</td><td>0 mins</td><td>284970</td></tr>\n",
       "\t<tr><td>member</td><td>October  </td><td>  9558 mins</td><td> 14 mins</td><td>10 mins</td><td>0 mins</td><td>215946</td></tr>\n",
       "\t<tr><td>member</td><td>November </td><td>  1500 mins</td><td> 13 mins</td><td>10 mins</td><td>0 mins</td><td>149629</td></tr>\n",
       "\t<tr><td>member</td><td>December </td><td>  1369 mins</td><td> 13 mins</td><td>10 mins</td><td>0 mins</td><td> 17434</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 24 × 7\n",
       "\\begin{tabular}{lllllll}\n",
       " member\\_casual & month & max\\_ride\\_length & mean\\_ride\\_length & median\\_ride\\_length & min\\_ride\\_length & number\\_of\\_rides\\\\\n",
       " <chr> & <ord> & <drtn> & <drtn> & <drtn> & <drtn> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & January   & 156450 mins & 162 mins & 17 mins & 0 mins &   7785\\\\\n",
       "\t casual & February  & 143937 mins & 128 mins & 21 mins & 0 mins &  12870\\\\\n",
       "\t casual & March     &  57250 mins &  63 mins & 23 mins & 0 mins &  27821\\\\\n",
       "\t casual & April     &  55684 mins &  72 mins & 25 mins & 0 mins &  23587\\\\\n",
       "\t casual & May       &  28897 mins &  51 mins & 27 mins & 0 mins &  86756\\\\\n",
       "\t casual & June      &  38537 mins &  51 mins & 25 mins & 0 mins & 154499\\\\\n",
       "\t casual & July      &  49965 mins &  59 mins & 25 mins & 0 mins & 268665\\\\\n",
       "\t casual & August    &  40846 mins &  44 mins & 22 mins & 0 mins & 282944\\\\\n",
       "\t casual & September &  54283 mins &  38 mins & 19 mins & 0 mins & 215270\\\\\n",
       "\t casual & October   &  35724 mins &  31 mins & 16 mins & 0 mins & 122567\\\\\n",
       "\t casual & November  &  35934 mins &  33 mins & 17 mins & 0 mins &  72991\\\\\n",
       "\t casual & December  &   6715 mins &  33 mins & 17 mins & 0 mins &   5866\\\\\n",
       "\t member & January   &  10424 mins &  11 mins &  8 mins & 0 mins & 136099\\\\\n",
       "\t member & February  &  79218 mins &  13 mins &  8 mins & 0 mins & 126715\\\\\n",
       "\t member & March     &  93794 mins &  14 mins & 10 mins & 0 mins & 115593\\\\\n",
       "\t member & April     &  58720 mins &  21 mins & 14 mins & 0 mins &  61082\\\\\n",
       "\t member & May       &   7075 mins &  20 mins & 15 mins & 0 mins & 113185\\\\\n",
       "\t member & June      &  41271 mins &  19 mins & 14 mins & 0 mins & 188013\\\\\n",
       "\t member & July      &  15105 mins &  18 mins & 13 mins & 0 mins & 281551\\\\\n",
       "\t member & August    &  33421 mins &  16 mins & 12 mins & 0 mins & 325396\\\\\n",
       "\t member & September &  31170 mins &  15 mins & 11 mins & 0 mins & 284970\\\\\n",
       "\t member & October   &   9558 mins &  14 mins & 10 mins & 0 mins & 215946\\\\\n",
       "\t member & November  &   1500 mins &  13 mins & 10 mins & 0 mins & 149629\\\\\n",
       "\t member & December  &   1369 mins &  13 mins & 10 mins & 0 mins &  17434\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 24 × 7\n",
       "\n",
       "| member_casual &lt;chr&gt; | month &lt;ord&gt; | max_ride_length &lt;drtn&gt; | mean_ride_length &lt;drtn&gt; | median_ride_length &lt;drtn&gt; | min_ride_length &lt;drtn&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| casual | January   | 156450 mins | 162 mins | 17 mins | 0 mins |   7785 |\n",
       "| casual | February  | 143937 mins | 128 mins | 21 mins | 0 mins |  12870 |\n",
       "| casual | March     |  57250 mins |  63 mins | 23 mins | 0 mins |  27821 |\n",
       "| casual | April     |  55684 mins |  72 mins | 25 mins | 0 mins |  23587 |\n",
       "| casual | May       |  28897 mins |  51 mins | 27 mins | 0 mins |  86756 |\n",
       "| casual | June      |  38537 mins |  51 mins | 25 mins | 0 mins | 154499 |\n",
       "| casual | July      |  49965 mins |  59 mins | 25 mins | 0 mins | 268665 |\n",
       "| casual | August    |  40846 mins |  44 mins | 22 mins | 0 mins | 282944 |\n",
       "| casual | September |  54283 mins |  38 mins | 19 mins | 0 mins | 215270 |\n",
       "| casual | October   |  35724 mins |  31 mins | 16 mins | 0 mins | 122567 |\n",
       "| casual | November  |  35934 mins |  33 mins | 17 mins | 0 mins |  72991 |\n",
       "| casual | December  |   6715 mins |  33 mins | 17 mins | 0 mins |   5866 |\n",
       "| member | January   |  10424 mins |  11 mins |  8 mins | 0 mins | 136099 |\n",
       "| member | February  |  79218 mins |  13 mins |  8 mins | 0 mins | 126715 |\n",
       "| member | March     |  93794 mins |  14 mins | 10 mins | 0 mins | 115593 |\n",
       "| member | April     |  58720 mins |  21 mins | 14 mins | 0 mins |  61082 |\n",
       "| member | May       |   7075 mins |  20 mins | 15 mins | 0 mins | 113185 |\n",
       "| member | June      |  41271 mins |  19 mins | 14 mins | 0 mins | 188013 |\n",
       "| member | July      |  15105 mins |  18 mins | 13 mins | 0 mins | 281551 |\n",
       "| member | August    |  33421 mins |  16 mins | 12 mins | 0 mins | 325396 |\n",
       "| member | September |  31170 mins |  15 mins | 11 mins | 0 mins | 284970 |\n",
       "| member | October   |   9558 mins |  14 mins | 10 mins | 0 mins | 215946 |\n",
       "| member | November  |   1500 mins |  13 mins | 10 mins | 0 mins | 149629 |\n",
       "| member | December  |   1369 mins |  13 mins | 10 mins | 0 mins |  17434 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month     max_ride_length mean_ride_length median_ride_length\n",
       "1  casual        January   156450 mins     162 mins         17 mins           \n",
       "2  casual        February  143937 mins     128 mins         21 mins           \n",
       "3  casual        March      57250 mins      63 mins         23 mins           \n",
       "4  casual        April      55684 mins      72 mins         25 mins           \n",
       "5  casual        May        28897 mins      51 mins         27 mins           \n",
       "6  casual        June       38537 mins      51 mins         25 mins           \n",
       "7  casual        July       49965 mins      59 mins         25 mins           \n",
       "8  casual        August     40846 mins      44 mins         22 mins           \n",
       "9  casual        September  54283 mins      38 mins         19 mins           \n",
       "10 casual        October    35724 mins      31 mins         16 mins           \n",
       "11 casual        November   35934 mins      33 mins         17 mins           \n",
       "12 casual        December    6715 mins      33 mins         17 mins           \n",
       "13 member        January    10424 mins      11 mins          8 mins           \n",
       "14 member        February   79218 mins      13 mins          8 mins           \n",
       "15 member        March      93794 mins      14 mins         10 mins           \n",
       "16 member        April      58720 mins      21 mins         14 mins           \n",
       "17 member        May         7075 mins      20 mins         15 mins           \n",
       "18 member        June       41271 mins      19 mins         14 mins           \n",
       "19 member        July       15105 mins      18 mins         13 mins           \n",
       "20 member        August     33421 mins      16 mins         12 mins           \n",
       "21 member        September  31170 mins      15 mins         11 mins           \n",
       "22 member        October     9558 mins      14 mins         10 mins           \n",
       "23 member        November    1500 mins      13 mins         10 mins           \n",
       "24 member        December    1369 mins      13 mins         10 mins           \n",
       "   min_ride_length number_of_rides\n",
       "1  0 mins            7785         \n",
       "2  0 mins           12870         \n",
       "3  0 mins           27821         \n",
       "4  0 mins           23587         \n",
       "5  0 mins           86756         \n",
       "6  0 mins          154499         \n",
       "7  0 mins          268665         \n",
       "8  0 mins          282944         \n",
       "9  0 mins          215270         \n",
       "10 0 mins          122567         \n",
       "11 0 mins           72991         \n",
       "12 0 mins            5866         \n",
       "13 0 mins          136099         \n",
       "14 0 mins          126715         \n",
       "15 0 mins          115593         \n",
       "16 0 mins           61082         \n",
       "17 0 mins          113185         \n",
       "18 0 mins          188013         \n",
       "19 0 mins          281551         \n",
       "20 0 mins          325396         \n",
       "21 0 mins          284970         \n",
       "22 0 mins          215946         \n",
       "23 0 mins          149629         \n",
       "24 0 mins           17434         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Calculate (max, mean, min ride) lengths  and number of rides per month.\n",
    "\n",
    "bymonth <- trip2020_new %>%\n",
    "  group_by(member_casual, month) %>%\n",
    "  summarise(max_ride_length = max(ride_length), mean_ride_length = round(mean(ride_length)), median_ride_length = median(ride_length), min_ride_length = min(ride_length), number_of_rides = n())\n",
    "View(bymonth)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2ada2733",
   "metadata": {
    "papermill": {
     "duration": 0.20913,
     "end_time": "2022-03-10T14:46:22.383153",
     "exception": false,
     "start_time": "2022-03-10T14:46:22.174023",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For casual rider, number of ride peaks on summer season, but average riding time peaks in winter. \n",
    "\n",
    "For member riders, number of rides distribute evenly but averaging riding time peaks in summer. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "74a067fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:22.773014Z",
     "iopub.status.busy": "2022-03-10T14:46:22.770699Z",
     "iopub.status.idle": "2022-03-10T14:46:23.752176Z",
     "shell.execute_reply": "2022-03-10T14:46:23.749960Z"
    },
    "papermill": {
     "duration": 1.17096,
     "end_time": "2022-03-10T14:46:23.752354",
     "exception": false,
     "start_time": "2022-03-10T14:46:22.581394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rideable_type</th><th scope=col>mean_ride_length</th><th scope=col>max_ride_length</th><th scope=col>min_ride_length</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>classic_bike </td><td>27 mins</td><td>  1284 mins</td><td>0 mins</td><td>   2653</td></tr>\n",
       "\t<tr><td>casual</td><td>docked_bike  </td><td>51 mins</td><td>156450 mins</td><td>0 mins</td><td>1140091</td></tr>\n",
       "\t<tr><td>casual</td><td>electric_bike</td><td>21 mins</td><td>   349 mins</td><td>0 mins</td><td> 138877</td></tr>\n",
       "\t<tr><td>member</td><td>classic_bike </td><td>13 mins</td><td>  1369 mins</td><td>0 mins</td><td>  11338</td></tr>\n",
       "\t<tr><td>member</td><td>docked_bike  </td><td>16 mins</td><td> 93794 mins</td><td>0 mins</td><td>1810435</td></tr>\n",
       "\t<tr><td>member</td><td>electric_bike</td><td>13 mins</td><td>   346 mins</td><td>0 mins</td><td> 193840</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 6 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " member\\_casual & rideable\\_type & mean\\_ride\\_length & max\\_ride\\_length & min\\_ride\\_length & number\\_of\\_rides\\\\\n",
       " <chr> & <chr> & <drtn> & <drtn> & <drtn> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & classic\\_bike  & 27 mins &   1284 mins & 0 mins &    2653\\\\\n",
       "\t casual & docked\\_bike   & 51 mins & 156450 mins & 0 mins & 1140091\\\\\n",
       "\t casual & electric\\_bike & 21 mins &    349 mins & 0 mins &  138877\\\\\n",
       "\t member & classic\\_bike  & 13 mins &   1369 mins & 0 mins &   11338\\\\\n",
       "\t member & docked\\_bike   & 16 mins &  93794 mins & 0 mins & 1810435\\\\\n",
       "\t member & electric\\_bike & 13 mins &    346 mins & 0 mins &  193840\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 6 × 6\n",
       "\n",
       "| member_casual &lt;chr&gt; | rideable_type &lt;chr&gt; | mean_ride_length &lt;drtn&gt; | max_ride_length &lt;drtn&gt; | min_ride_length &lt;drtn&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| casual | classic_bike  | 27 mins |   1284 mins | 0 mins |    2653 |\n",
       "| casual | docked_bike   | 51 mins | 156450 mins | 0 mins | 1140091 |\n",
       "| casual | electric_bike | 21 mins |    349 mins | 0 mins |  138877 |\n",
       "| member | classic_bike  | 13 mins |   1369 mins | 0 mins |   11338 |\n",
       "| member | docked_bike   | 16 mins |  93794 mins | 0 mins | 1810435 |\n",
       "| member | electric_bike | 13 mins |    346 mins | 0 mins |  193840 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rideable_type mean_ride_length max_ride_length min_ride_length\n",
       "1 casual        classic_bike  27 mins            1284 mins     0 mins         \n",
       "2 casual        docked_bike   51 mins          156450 mins     0 mins         \n",
       "3 casual        electric_bike 21 mins             349 mins     0 mins         \n",
       "4 member        classic_bike  13 mins            1369 mins     0 mins         \n",
       "5 member        docked_bike   16 mins           93794 mins     0 mins         \n",
       "6 member        electric_bike 13 mins             346 mins     0 mins         \n",
       "  number_of_rides\n",
       "1    2653        \n",
       "2 1140091        \n",
       "3  138877        \n",
       "4   11338        \n",
       "5 1810435        \n",
       "6  193840        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Calculate (max, mean, min ride) lengths  and number of rides per bike type.\n",
    "\n",
    "trip2020_new%>%\n",
    "  group_by(member_casual, rideable_type)%>%\n",
    "  summarize(mean_ride_length = round(mean(ride_length)), max_ride_length = max(ride_length), min_ride_length = min(ride_length), number_of_rides = n())\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9b293783",
   "metadata": {
    "papermill": {
     "duration": 0.202821,
     "end_time": "2022-03-10T14:46:24.156116",
     "exception": false,
     "start_time": "2022-03-10T14:46:23.953295",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    " The number of rides shows both casual and members prefer docked bike type the most "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "853d57f1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:24.559547Z",
     "iopub.status.busy": "2022-03-10T14:46:24.557205Z",
     "iopub.status.idle": "2022-03-10T14:46:24.891713Z",
     "shell.execute_reply": "2022-03-10T14:46:24.890056Z"
    },
    "papermill": {
     "duration": 0.534806,
     "end_time": "2022-03-10T14:46:24.891892",
     "exception": false,
     "start_time": "2022-03-10T14:46:24.357086",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 48 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>hour</th><th scope=col>mean_length</th><th scope=col>number_of_riders</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td> 0</td><td>115 mins</td><td>  2977</td></tr>\n",
       "\t<tr><td>casual</td><td> 1</td><td> 47 mins</td><td>  5349</td></tr>\n",
       "\t<tr><td>casual</td><td> 2</td><td> 37 mins</td><td> 12393</td></tr>\n",
       "\t<tr><td>casual</td><td> 3</td><td> 36 mins</td><td> 21539</td></tr>\n",
       "\t<tr><td>casual</td><td> 4</td><td> 34 mins</td><td> 29161</td></tr>\n",
       "\t<tr><td>casual</td><td> 5</td><td> 51 mins</td><td> 38822</td></tr>\n",
       "\t<tr><td>casual</td><td> 6</td><td> 45 mins</td><td> 55005</td></tr>\n",
       "\t<tr><td>casual</td><td> 7</td><td> 47 mins</td><td> 74278</td></tr>\n",
       "\t<tr><td>casual</td><td> 8</td><td> 47 mins</td><td> 88753</td></tr>\n",
       "\t<tr><td>casual</td><td> 9</td><td> 46 mins</td><td> 96369</td></tr>\n",
       "\t<tr><td>casual</td><td>10</td><td> 50 mins</td><td>101485</td></tr>\n",
       "\t<tr><td>casual</td><td>11</td><td> 45 mins</td><td>105571</td></tr>\n",
       "\t<tr><td>casual</td><td>12</td><td> 48 mins</td><td>110440</td></tr>\n",
       "\t<tr><td>casual</td><td>13</td><td> 41 mins</td><td>123110</td></tr>\n",
       "\t<tr><td>casual</td><td>14</td><td> 43 mins</td><td>112864</td></tr>\n",
       "\t<tr><td>casual</td><td>15</td><td> 45 mins</td><td> 87266</td></tr>\n",
       "\t<tr><td>casual</td><td>16</td><td> 55 mins</td><td> 61283</td></tr>\n",
       "\t<tr><td>casual</td><td>17</td><td> 53 mins</td><td> 43947</td></tr>\n",
       "\t<tr><td>casual</td><td>18</td><td> 57 mins</td><td> 38445</td></tr>\n",
       "\t<tr><td>casual</td><td>19</td><td> 65 mins</td><td> 30864</td></tr>\n",
       "\t<tr><td>casual</td><td>20</td><td> 74 mins</td><td> 19369</td></tr>\n",
       "\t<tr><td>casual</td><td>21</td><td> 87 mins</td><td> 11963</td></tr>\n",
       "\t<tr><td>casual</td><td>22</td><td> 86 mins</td><td>  6794</td></tr>\n",
       "\t<tr><td>casual</td><td>23</td><td>121 mins</td><td>  3574</td></tr>\n",
       "\t<tr><td>member</td><td> 0</td><td> 11 mins</td><td>  8274</td></tr>\n",
       "\t<tr><td>member</td><td> 1</td><td> 12 mins</td><td> 29759</td></tr>\n",
       "\t<tr><td>member</td><td> 2</td><td> 14 mins</td><td> 78142</td></tr>\n",
       "\t<tr><td>member</td><td> 3</td><td> 13 mins</td><td>114823</td></tr>\n",
       "\t<tr><td>member</td><td> 4</td><td> 14 mins</td><td>101604</td></tr>\n",
       "\t<tr><td>member</td><td> 5</td><td> 15 mins</td><td> 83034</td></tr>\n",
       "\t<tr><td>member</td><td> 6</td><td> 15 mins</td><td> 91100</td></tr>\n",
       "\t<tr><td>member</td><td> 7</td><td> 16 mins</td><td>110999</td></tr>\n",
       "\t<tr><td>member</td><td> 8</td><td> 16 mins</td><td>125429</td></tr>\n",
       "\t<tr><td>member</td><td> 9</td><td> 16 mins</td><td>123422</td></tr>\n",
       "\t<tr><td>member</td><td>10</td><td> 17 mins</td><td>129742</td></tr>\n",
       "\t<tr><td>member</td><td>11</td><td> 16 mins</td><td>157633</td></tr>\n",
       "\t<tr><td>member</td><td>12</td><td> 16 mins</td><td>189481</td></tr>\n",
       "\t<tr><td>member</td><td>13</td><td> 16 mins</td><td>201303</td></tr>\n",
       "\t<tr><td>member</td><td>14</td><td> 17 mins</td><td>169173</td></tr>\n",
       "\t<tr><td>member</td><td>15</td><td> 16 mins</td><td>116918</td></tr>\n",
       "\t<tr><td>member</td><td>16</td><td> 18 mins</td><td> 72622</td></tr>\n",
       "\t<tr><td>member</td><td>17</td><td> 15 mins</td><td> 42911</td></tr>\n",
       "\t<tr><td>member</td><td>18</td><td> 15 mins</td><td> 29158</td></tr>\n",
       "\t<tr><td>member</td><td>19</td><td> 18 mins</td><td> 19055</td></tr>\n",
       "\t<tr><td>member</td><td>20</td><td> 17 mins</td><td>  9775</td></tr>\n",
       "\t<tr><td>member</td><td>21</td><td> 18 mins</td><td>  5510</td></tr>\n",
       "\t<tr><td>member</td><td>22</td><td> 14 mins</td><td>  3001</td></tr>\n",
       "\t<tr><td>member</td><td>23</td><td> 12 mins</td><td>  2745</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 48 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & hour & mean\\_length & number\\_of\\_riders\\\\\n",
       " <chr> & <dbl> & <drtn> & <int>\\\\\n",
       "\\hline\n",
       "\t casual &  0 & 115 mins &   2977\\\\\n",
       "\t casual &  1 &  47 mins &   5349\\\\\n",
       "\t casual &  2 &  37 mins &  12393\\\\\n",
       "\t casual &  3 &  36 mins &  21539\\\\\n",
       "\t casual &  4 &  34 mins &  29161\\\\\n",
       "\t casual &  5 &  51 mins &  38822\\\\\n",
       "\t casual &  6 &  45 mins &  55005\\\\\n",
       "\t casual &  7 &  47 mins &  74278\\\\\n",
       "\t casual &  8 &  47 mins &  88753\\\\\n",
       "\t casual &  9 &  46 mins &  96369\\\\\n",
       "\t casual & 10 &  50 mins & 101485\\\\\n",
       "\t casual & 11 &  45 mins & 105571\\\\\n",
       "\t casual & 12 &  48 mins & 110440\\\\\n",
       "\t casual & 13 &  41 mins & 123110\\\\\n",
       "\t casual & 14 &  43 mins & 112864\\\\\n",
       "\t casual & 15 &  45 mins &  87266\\\\\n",
       "\t casual & 16 &  55 mins &  61283\\\\\n",
       "\t casual & 17 &  53 mins &  43947\\\\\n",
       "\t casual & 18 &  57 mins &  38445\\\\\n",
       "\t casual & 19 &  65 mins &  30864\\\\\n",
       "\t casual & 20 &  74 mins &  19369\\\\\n",
       "\t casual & 21 &  87 mins &  11963\\\\\n",
       "\t casual & 22 &  86 mins &   6794\\\\\n",
       "\t casual & 23 & 121 mins &   3574\\\\\n",
       "\t member &  0 &  11 mins &   8274\\\\\n",
       "\t member &  1 &  12 mins &  29759\\\\\n",
       "\t member &  2 &  14 mins &  78142\\\\\n",
       "\t member &  3 &  13 mins & 114823\\\\\n",
       "\t member &  4 &  14 mins & 101604\\\\\n",
       "\t member &  5 &  15 mins &  83034\\\\\n",
       "\t member &  6 &  15 mins &  91100\\\\\n",
       "\t member &  7 &  16 mins & 110999\\\\\n",
       "\t member &  8 &  16 mins & 125429\\\\\n",
       "\t member &  9 &  16 mins & 123422\\\\\n",
       "\t member & 10 &  17 mins & 129742\\\\\n",
       "\t member & 11 &  16 mins & 157633\\\\\n",
       "\t member & 12 &  16 mins & 189481\\\\\n",
       "\t member & 13 &  16 mins & 201303\\\\\n",
       "\t member & 14 &  17 mins & 169173\\\\\n",
       "\t member & 15 &  16 mins & 116918\\\\\n",
       "\t member & 16 &  18 mins &  72622\\\\\n",
       "\t member & 17 &  15 mins &  42911\\\\\n",
       "\t member & 18 &  15 mins &  29158\\\\\n",
       "\t member & 19 &  18 mins &  19055\\\\\n",
       "\t member & 20 &  17 mins &   9775\\\\\n",
       "\t member & 21 &  18 mins &   5510\\\\\n",
       "\t member & 22 &  14 mins &   3001\\\\\n",
       "\t member & 23 &  12 mins &   2745\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 48 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | hour &lt;dbl&gt; | mean_length &lt;drtn&gt; | number_of_riders &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| casual |  0 | 115 mins |   2977 |\n",
       "| casual |  1 |  47 mins |   5349 |\n",
       "| casual |  2 |  37 mins |  12393 |\n",
       "| casual |  3 |  36 mins |  21539 |\n",
       "| casual |  4 |  34 mins |  29161 |\n",
       "| casual |  5 |  51 mins |  38822 |\n",
       "| casual |  6 |  45 mins |  55005 |\n",
       "| casual |  7 |  47 mins |  74278 |\n",
       "| casual |  8 |  47 mins |  88753 |\n",
       "| casual |  9 |  46 mins |  96369 |\n",
       "| casual | 10 |  50 mins | 101485 |\n",
       "| casual | 11 |  45 mins | 105571 |\n",
       "| casual | 12 |  48 mins | 110440 |\n",
       "| casual | 13 |  41 mins | 123110 |\n",
       "| casual | 14 |  43 mins | 112864 |\n",
       "| casual | 15 |  45 mins |  87266 |\n",
       "| casual | 16 |  55 mins |  61283 |\n",
       "| casual | 17 |  53 mins |  43947 |\n",
       "| casual | 18 |  57 mins |  38445 |\n",
       "| casual | 19 |  65 mins |  30864 |\n",
       "| casual | 20 |  74 mins |  19369 |\n",
       "| casual | 21 |  87 mins |  11963 |\n",
       "| casual | 22 |  86 mins |   6794 |\n",
       "| casual | 23 | 121 mins |   3574 |\n",
       "| member |  0 |  11 mins |   8274 |\n",
       "| member |  1 |  12 mins |  29759 |\n",
       "| member |  2 |  14 mins |  78142 |\n",
       "| member |  3 |  13 mins | 114823 |\n",
       "| member |  4 |  14 mins | 101604 |\n",
       "| member |  5 |  15 mins |  83034 |\n",
       "| member |  6 |  15 mins |  91100 |\n",
       "| member |  7 |  16 mins | 110999 |\n",
       "| member |  8 |  16 mins | 125429 |\n",
       "| member |  9 |  16 mins | 123422 |\n",
       "| member | 10 |  17 mins | 129742 |\n",
       "| member | 11 |  16 mins | 157633 |\n",
       "| member | 12 |  16 mins | 189481 |\n",
       "| member | 13 |  16 mins | 201303 |\n",
       "| member | 14 |  17 mins | 169173 |\n",
       "| member | 15 |  16 mins | 116918 |\n",
       "| member | 16 |  18 mins |  72622 |\n",
       "| member | 17 |  15 mins |  42911 |\n",
       "| member | 18 |  15 mins |  29158 |\n",
       "| member | 19 |  18 mins |  19055 |\n",
       "| member | 20 |  17 mins |   9775 |\n",
       "| member | 21 |  18 mins |   5510 |\n",
       "| member | 22 |  14 mins |   3001 |\n",
       "| member | 23 |  12 mins |   2745 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual hour mean_length number_of_riders\n",
       "1  casual         0   115 mins      2977          \n",
       "2  casual         1    47 mins      5349          \n",
       "3  casual         2    37 mins     12393          \n",
       "4  casual         3    36 mins     21539          \n",
       "5  casual         4    34 mins     29161          \n",
       "6  casual         5    51 mins     38822          \n",
       "7  casual         6    45 mins     55005          \n",
       "8  casual         7    47 mins     74278          \n",
       "9  casual         8    47 mins     88753          \n",
       "10 casual         9    46 mins     96369          \n",
       "11 casual        10    50 mins    101485          \n",
       "12 casual        11    45 mins    105571          \n",
       "13 casual        12    48 mins    110440          \n",
       "14 casual        13    41 mins    123110          \n",
       "15 casual        14    43 mins    112864          \n",
       "16 casual        15    45 mins     87266          \n",
       "17 casual        16    55 mins     61283          \n",
       "18 casual        17    53 mins     43947          \n",
       "19 casual        18    57 mins     38445          \n",
       "20 casual        19    65 mins     30864          \n",
       "21 casual        20    74 mins     19369          \n",
       "22 casual        21    87 mins     11963          \n",
       "23 casual        22    86 mins      6794          \n",
       "24 casual        23   121 mins      3574          \n",
       "25 member         0    11 mins      8274          \n",
       "26 member         1    12 mins     29759          \n",
       "27 member         2    14 mins     78142          \n",
       "28 member         3    13 mins    114823          \n",
       "29 member         4    14 mins    101604          \n",
       "30 member         5    15 mins     83034          \n",
       "31 member         6    15 mins     91100          \n",
       "32 member         7    16 mins    110999          \n",
       "33 member         8    16 mins    125429          \n",
       "34 member         9    16 mins    123422          \n",
       "35 member        10    17 mins    129742          \n",
       "36 member        11    16 mins    157633          \n",
       "37 member        12    16 mins    189481          \n",
       "38 member        13    16 mins    201303          \n",
       "39 member        14    17 mins    169173          \n",
       "40 member        15    16 mins    116918          \n",
       "41 member        16    18 mins     72622          \n",
       "42 member        17    15 mins     42911          \n",
       "43 member        18    15 mins     29158          \n",
       "44 member        19    18 mins     19055          \n",
       "45 member        20    17 mins      9775          \n",
       "46 member        21    18 mins      5510          \n",
       "47 member        22    14 mins      3001          \n",
       "48 member        23    12 mins      2745          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Calculate mean ride lengths and number of rides per hour of the day.\n",
    "\n",
    "byhours <- trip2020_new %>%\n",
    "  group_by(member_casual, hour) %>%\n",
    "  summarize(mean_length = round(mean(ride_length)), number_of_riders = n())\n",
    "View(byhours)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fb468377",
   "metadata": {
    "papermill": {
     "duration": 0.208436,
     "end_time": "2022-03-10T14:46:25.311914",
     "exception": false,
     "start_time": "2022-03-10T14:46:25.103478",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****5. Share****\n",
    "\n",
    "* Determine the best way to share your findings.\n",
    "* Create effective data visualizations.\n",
    "* Present your findings.\n",
    "* Ensure your work is accessible."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "a833bf99",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:25.729969Z",
     "iopub.status.busy": "2022-03-10T14:46:25.727553Z",
     "iopub.status.idle": "2022-03-10T14:46:26.401327Z",
     "shell.execute_reply": "2022-03-10T14:46:26.399736Z"
    },
    "papermill": {
     "duration": 0.888114,
     "end_time": "2022-03-10T14:46:26.401616",
     "exception": false,
     "start_time": "2022-03-10T14:46:25.513502",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nktRpv+eWh3f798gwP1denICIcXe3Cs7ZMTnNpopIefZPs3PKWo94J7jaODKub6yT2a+Gr1KQ\nb93fr9o3ub4xqn+DKnLnzcqxvX5Ju+NThob6i8j6fUVyah9/OHXKlCm7jl2f4ShLnjnl1btu\nunrE0IHtY8MDIjv+64PdVX6kwW96da6sDgBQozruPHEqRxauEJGwbrfU+GxIxwlL92Zu+mv2\n/EVLVq9Zt2n1go0rfn//lacnPPPrvDdq+/PdJ9ClPKZqTchk9hMRk7nWUdm0+o6fcsqdbSaL\nSURUm1p9YtMtv8FM5qCrX5h/1ttBm4vW/pZTfm3Lqq+Sybmnsab4kZWqiabZRcQnoNOkx26s\ncUWtzo52/qPBHwBX3tnrXh86+Zo/vnt1+wtfjtz+ykciMuLd22tZZhWPPNb7i2c2T/on84eR\nrfd9/o6IjH3zvOqzub6xp6n2Ta5vjOrfoKQf3gpt/8TgkBOH6S+5qdNzr2/f+b/1MubaGpdZ\nkb/ooUceNZlM++57WERyt34+dNSDSSX2lt0Hnz9s6MjxE7v16NO3y8qhZ79X+aca+KZX+1a6\nuDoAQI0aVuzU917fLSLnvDDklLOY/IZcMnHIJRNFRCnPWvbr57fc/eLvb131w+OlN0Wf7qC4\n87PKzwk9aQ9NftwKEQk7o9cpfkJExF6eWK+1+IWebTGZKvL/UEQsJz+VtDJTRNr0rd8uumZe\n/sksEyIDNxfbdpfZr5Wqr39IpzNE/spev1mkasVZWukusT4BXaN9LXlq2Rtvvll3h23QB8CV\nd7b9pe8GmP9M/u0F9YtlT/6UZPGNmnZxu6oLOrXudz8jz1y7YvJfsv72D6cmWPxav9m/ZfXZ\n6rexp6H2TT79GF+/E3/GU19UntLzoYdNb9yTtvyBjcWXDw2tYU9n8qy3RSQo5tZuARYReWjc\nY0kl9sd/2PTexBOHm4uSN9Swsvq/6dW/lfVYHQCgmoYcit35+cQv0kt8g/pMr+kXalnWd927\nd+8/7InjUyyBMRff+tzU7hGapi1pjNvJ//x0lRNu1A/+b62InP9Un8pTSzNPWlfqX6e+B3xN\nLAFdb4sNcpTvn/xPZuXpjvJ9T2zNMZn9nuzp0oFjvZZfRYSPWUQOV9RwZlVou8cjfc0FB55b\nknvSK5a3643VhdYTj02+k3uGK7as5zdknbwA9eEBXVu3bj0vt0JO7wPgyjvrPBprLfz7lRVP\nbSy2tRo+tb1/lWJcm8CW19wUE5S99enDWYu/yCiNGfK/yOrHwl3e2NNXxyafXgx7yZb3Dxc/\ne1OXyhODW9/99tAYxZ5zxbgXipSqu40d5Qm3T1ovImc9P1lENKXwl6wyH/8OlWuWiBTtO+l8\nVtff9Nq/lS6uDgBwKvUrdtac/V++eOuQ+2aJyO3fLIyp6RSigIiLCw4d3L1x6ovzTpwWkxO3\n4KWDhSaTz22VzijSlNrO8qlF8pybH56xynkIR3Xkf/bYqPf2FQRGXzrt2FUIztPdNtz38vGb\nnuXHz51w+6Ial1ZLjH9PmSAi08ZesWjP0dPdHKVJz46/4IjV0f7S6UNDa7sK1RVNvfzKnOeA\nZeZbqz9l8W8/c2I3TSm//tzb1h8pdU7M37P4igteqzLnbV/dLyLvXnjRTxvTnVM0pfjbSWM+\n2plkbXH9FVEBUp8PQHV1vrNO170+VETevOpjEbnmg4tdfxGcJt3fU7FlXffM/4nI6P+OPtVs\nrmzs6atzk08nxpE/n/eLnjghsuo8j/w5t1+wb8aa//UYPnH2mvhjZV/ZufzHy/qevbHYFtzq\n0tkP9BIRkyW0c4BFsR3+Mi7/+I9v+vW9C69aICLKsfGWXXnTXflWurg6AMApnepyWeeznXr0\nOq5zu1jnXdJNZv+b3l5WeeYqo4Ssf+Xo79qYbgNGXzhmSP9uZpNJRC585k/nDIo9x99sMpl8\nL7nmxrsfXqodG6xhxNf7qsSoPtyJj3+Hc2MCRcQ/vO2QIX3D/Cwi4hPQaWZ8/vGfshaudQ4k\nFtCyz7irrrtgaN9As8kvpH+/YN/KAytUj1FtgGL1vZv7iYjJZGnX88yRQ/qE+JhFJKzbFZXv\n3e4c8OLc6XuqhO8T5Gvxa13bRcmuLf+0xrE7ZvHItiLS696VzofVByi+vle4M0nbHoMGdGtl\nMpn8w4dOuaO7nDxA8ZynLzr62eg/dMwFw7u2DBAR/7BBiyoNn1HnB6A6F99ZJ3vp7gCzSUT8\nQgaWVx/e42SVhztxKs2c6Yxn9olIs574+eoDFLuysTW++8uv7Cwid+07aUDm1zuFVX4xXd9k\nV2LU+A364Iyo/k9vqvFlyY+fPSzm6OFRvxYtu3TrHBly9LBsaMcxf6adWPK6F0eJiNkSfN7F\nE66/8tIBPWLNlpCJk58REYtf6zseeMg5bF6db7qL30oXV8dwJwBQozqKXWVm36DWHbpfcccT\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Pie chart for representing the distribution of rider percentage\n",
    "\n",
    "ggplot(percentage, aes(x = \"\", y = perc, fill = member_casual)) +\n",
    "  geom_col() +\n",
    "  geom_text(aes(label = paste(labels, \"%\", sep = \"\\n\")),\n",
    "            position = position_stack(vjust = 0.5)) +\n",
    "  coord_polar(theta = \"y\")+\n",
    "  labs(title = \" Distribution of Rides by Member/Casual\") +\n",
    "  theme_void()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85d268f8",
   "metadata": {
    "papermill": {
     "duration": 0.214344,
     "end_time": "2022-03-10T14:46:26.856527",
     "exception": false,
     "start_time": "2022-03-10T14:46:26.642183",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The distribution of riders are 61% of member, 39 % or casual.  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "b80e73b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:27.284523Z",
     "iopub.status.busy": "2022-03-10T14:46:27.281477Z",
     "iopub.status.idle": "2022-03-10T14:46:27.809788Z",
     "shell.execute_reply": "2022-03-10T14:46:27.808394Z"
    },
    "papermill": {
     "duration": 0.746039,
     "end_time": "2022-03-10T14:46:27.809986",
     "exception": false,
     "start_time": "2022-03-10T14:46:27.063947",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3wT9R/H8c9lJ03pZO8leypLBBQE2UumIAoi+gNUBAQUlKU4GbJEUcGNA0Fk\nKShDARmiouwpyCyU0t00yf3+CJZCS5u2SRuP1/MPHsk3d9/73F2SvrnxjaKqqgAAAOC/T1fQ\nBQAAAMA3CHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwe6a\nHU/XUrzQ+Y+ofChmz6sNFEVp9c2Jm01w+fAjnnom7biQ6QQH3m6qKEqtp3f4q8TrPVEyWFGU\nA0nO/FlcLiSe2zCw1e2RdlPRGs/dbJoaQaaMe1ynMwSHFq7XrP2L737vTjfxr8/WVRSl3aYz\nWS93ZsUwRVFWX0720XrcVNyplzIpXm8OL1KuVffHlv12MY/9Rx/s5+kzvMq0m07kTq767zbc\ncCUlj0v00uEPmiuK0vyDw7nuwXFla0Wr8cXfL/mwqjy6cvCXTT8fuqFRdSd0KRLUbcFfBVIS\ngP8Egt01lsgyldKpWKG4iCiKodL1ipv13vepuhO2bNmyfdcpv1Utr3V4OMbJz4dkb2Kz7ot/\n3G2s0qxt88pZT1m0fMX0e7x82ZL6pMu//7zm+Ufvq/XAW/lTba7p9EHpiy9bMiLh0skfl73T\no0G5yd+f9skiYo5M2ZuYeYK/fGTywcRUnyzlZvzxmXqzY4/4mtMm1I1I33hg9YIBHZuWKhph\nNloLl6zS+aExG0/EZ5w39ugPw/u2KV0k1BQUVqVh26kf/pTpIrzsLc2r7dp27D3nhkZFF/TW\nF/2/fbLlT7GOHK4igFuGiptIil4lInpT8bx04ojfLSKFyjyf0xn/eOUOEWm5/PjNJog+NCht\nJzZ6fkvGCfYvuFNEao7YntNF587wEnYR2Z+Ymj+LyzF3ilFRjLZqCS53FlNVtxlF5JMLCTfO\n7bzyxdSunq390pEYT+PFX1csXrx43bnErJc8o0KoiKyKTspL+d6IPfmiiFjDO9zQnnL56Iu9\nq4iIyV4/PsvVz9qlAw+IiKIziEi7ZccznWZ974oiYtQpIvJjTHKul5WFjJ+pQ4ubiUizxYdy\n1+HFPZNE5NVDl9M3fj+xrWd3R1aufVeTeoXtRhHRm0vM3xWVfrILO+YVNupFJKx89Qb1qpt1\niog0evKzGxbhZW9pYg69p1cUe4nhmb3o7B5pK9Pho9ytLADN44jdf5utcB+7Xrfz5XbfXkgq\n6FoCmupOSlVVo62GTafkYnZFX6jnhGXDSthFZMn8qyfIIup3euihh+4tavVloX5gCq3w7Mc/\nlzYbHPG73zqTkMfeQsqP1SvKjvFfZ/Ka6hy3+pS5UJNWoeY8LiU/ze07J6jog2Mqh6a1XD7w\n2n1TvtMZCr287I+oQ3/8tHX3uehTbw6/05Vy5ulW3aKdV0/Iq87oPveNikp1DZy36dKxvTt2\n7z1/cNUdwabts/tO2X0xp72JSGpc1F87Nr7zyuiG9R533fRXvPXTXm54as3gNf4/uQ/gv4hg\n999mjeiyanQ9tzP2kfYv+bxz1ZWY5HD5vNvcUFMupLqzn8zPejYrKiIxe2IKupAc0xkiPWHr\nkjOvO9QU3Hh0meDLB58/nOF6ytiTb+yKc5TpMk0vuUnP13MnJOfH9ZpJl5ZN3hddY+yY9I3b\nnpqrqmrNp1eP61rb06IzFn1yzk8PFwtKufLz6D+uXop3ZuPjP15Ojqzz6vtDm3tWOKRSu6+/\n6CEiswd8mNPeROTd+lVqNbrnsWenH0rI6nR2hb4zDOIYM/m3PK89AA0i2OWFe9PHL3duXrtw\nqN0UFFK+5p1DJy48k3LtD+eSapEme30RiT05VVGUiCqLPO2q68qn00e3alg9IiTIYLIWLn1b\nu35PfnfgSu6KuOvFta3CLVG/vvTIN39nMdm2/1VXFOX+/dddHq66riiKElS4Z1qL5zr0Rw5e\neHds9yL2EJvZYA8r0qzb4zsuJou4Vs8Z3aRaGbvZWCiybLuHn8v4p11V3WvnjmtWvVywxRRW\npFSrHkNW7snkgvS/f/704a53lywSZraFVq7VYOjkBUeuv2bLc+fH8KMx8X+v7tOsut1k++hC\n4s1XLpsdsb5dWZ0hVEQSL36lKEpwySey2FBZcKe4RcRe0e55+vvk22+4ecKdemHh8481uK20\n3WyOLFGh+6Pj/4zJ/FqobLeAiET/terJvm0rFY8wG00hEaWadRy4ZPu53FWuOqN/vJKi6Mw9\nIm0icmJZe0VRynVedcNk++c3VRSl6qCNWfc2cHxttytx9MYb7xr586UPRKTvxHqZzZTNPpK0\n997hy7s+Gl+zVKjdajSYg8rXbjbh7XVp09zsM+URd3Td4G7Ni0YUMlqCytVq+tz877JeERE5\nMHuqqqpP96+YvnHVX5dFpM8Tta+fVvdIm5Iisu+nq7crbX52s4g0ndU//USl7p0XatBF759w\nzuHOUW8i0mzSa3Pnzp07d+7MVx7KomZjUL0RJeyHF4/h0loAmSjgU8EBLNtr7N58sI6IKIpS\ntEKt5k3uCDPqRSSkUue9CVevM/t9xpQxowaKiLlQ03Hjxk2ZvktVVbcz9tGGRUREZwitc0eT\nFnc2KBdm9ixoRdS1q7W8vMYuoupnqqqe+/lZETHZ6x1LcqZNcMM1dlsfryYi3fddTN+J2xkj\nIrbIHmktnsuVqnatIiLl6zTt0r5laatBRIKKd5kzqK6iM9Zs1KrTvU3tep2IFG3yctqMnmvs\nXnq0nogY7UXr1qsSZNCJiM5QaOr3/6Rf6LaZA/SKoihK0XLVmzaqExlkEJGgki1/OH9t9T3F\nD979Xd1CJmvR2+5t3+mbSze9Ri3bHXH4/VfGjRkhIkZblXHjxk2c9s3NurrZNXaqqqqqs08R\nm4g89NNZz/PfJtUXkbYbT199OflE72phaZVULRkiIpbwpg8VDZLrr7HzZgtE/Toj1KATkfAK\nNe5qcVf1ciEiotPbZ++LvlnxN7vGzhH39yv9qolItQGfelpSE/ZadYrRVi3Jdd2UQ0rYRWTe\n6bhM+/dcY1ek7rfJMRt0ihJZe84NE7QKtRiDaqW41Q7hVrn+Grts95H673uv1RsPK4oSVLxS\nq05d7qpfzvM11fHNPz3TZPqZ8sxYc+zzJc16e4nK93bq0qx+mX9n/Otmm8tjeAm7MajWDRce\nLhz/zIgRIw5muGD0s0bFRKTlV8c8TztFWEXki6gbL7L0nLKf9e9m9LK39BIufCIiN7nGTlVV\ndftTNUVk0blM36gAbmkEu5vKOtgdX9pfRMwhDb7ZczUqOeIOjby7uIiU7fhB2mQZL/Q+vaGn\niASX6XEg+uqfPbcz7u2Bt4lIrdE70ibLUbBTVXX2vaVEpMqgZWkT5CXYKYpx7Mc7r26HC9vK\nWQwiojcWfuvHvz2NUb/ONyqKouiPJ1+Nkp5gpyj6R+d+73Crqqq6UqLmDWsiIkZbtZP/Tnbl\n2HyzTjHZa72z/oinxZV68a3hjUUkpNKQtJjhKb5IeXvLZz9NzPJ6fy93RMY1zVTmwc7lOHN4\n17RBd4hIkcYjUv4t54Zgt7x/ZREJqdht0/ErnpZTv3xazWb0JIy0YOflFhhdtpCIPLhwa1oR\n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\nAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Bar Chart for total number of rides per Month\n",
    "\n",
    "options(scipen=10000) #Turn off scientific notation \n",
    "trip2020_new%>%\n",
    "  group_by(member_casual, month)%>%\n",
    "  summarize(number_of_rides = n())%>%\n",
    "  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Total Number of Rides By Month (2021)\", x = \"Month\", y = \"Number of Rides\") + \n",
    "  theme(axis.text.x = element_text(angle = 45, size = 10))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7e627b08",
   "metadata": {
    "papermill": {
     "duration": 0.217167,
     "end_time": "2022-03-10T14:46:28.246177",
     "exception": false,
     "start_time": "2022-03-10T14:46:28.029010",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Casual riders and member riders both tend to use bikes more in the summer season. But in the winter season, member riders bike usage is higher than casual. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "c71bf70c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:28.692424Z",
     "iopub.status.busy": "2022-03-10T14:46:28.690667Z",
     "iopub.status.idle": "2022-03-10T14:46:29.213643Z",
     "shell.execute_reply": "2022-03-10T14:46:29.212986Z"
    },
    "papermill": {
     "duration": 0.749002,
     "end_time": "2022-03-10T14:46:29.213789",
     "exception": false,
     "start_time": "2022-03-10T14:46:28.464787",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nlU3nbhyelRFCOPXaXYfeSlVuLAvpLeeNS393wZrm7EueePnwrA/nhxDaNtSu/PTkuzfOe7rq\n5KzB2SGElhP7Rq/d/9SaK0MIIdzyqTcnLNrx6JMnzl51xZzk+NAQwifnzC0fltc+3bnmI63V\n+/9Y2zH4sycnLvjdI8+cTF0xJPt9/PIAUbFjB4QpK7/Tmjpa+aeO09gXN2zNyv/Yukld/nOi\n+Y2dOxrfvuRb97ZXXQghI7Pkhw98Ld3WsmZ3fcedQfkPrZrV+cilN4wNIbzV2vs2XDIo78Hq\nyzsvJy0cFUI43WbPDuDCCTsgFI685eri3L1Ve0MIIaRrHnx1VHldXtc/Dy3HHwshjK8Y1+XB\nMRUhhNf3NLRfZuZPHZH97mNJZpeT3G6yC0tHZw/q42AA+kLYASGEcNtXJjQermw813b6nz89\ncOLsok2X9RiS7vlUkmSGENLvpP99mdX3FZMk98JeFYD/RNgBIYQwtfrbranGykONf7lzS2be\nxPWTu/+CXW7x50MIr97/9/Nvnq7fFkK4uPzi9+s1AfhvhB0QQgiFI5eXF+Xurdq97v5XRs7+\ncUFG94PRvJLF1w/Pf+mX33iuqaX9TvqdY5uW3pNk5NReM6aPq6R72fUDoN8IO6Bdsv7G8UcP\n3vyHY83X3jGztwEZmx9ZndPy189NmL5sRc2m1bfOv3Tijw43zV71aHlRzv+cPetDWSGEX/3s\nnge2H+zvNwegg7ADOnxi1bJ029nM3HEbPz601wEXlVUfObDt+s8U7vz13bV1W17OnXbbvfue\n2DCnL5NfVHbnNaUfeer2H1Ru2t2vbw3Au5K0oxEAgCjYsQMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiMS/AEui8KSQz8Xh\nAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# bar graphs for average rider per month by member type\n",
    "\n",
    "trip2020_new %>%\n",
    "  group_by(member_casual, month) %>%\n",
    "  summarise(mean_length = round(mean(ride_length))) %>% \n",
    "  ggplot(aes(x = month, y = mean_length, color = member_casual, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs (title = \"Average Ride Duration Per Month\", x = \"Month\", y = \"Average Duration of Ride\") +\n",
    "  theme_minimal()+\n",
    "  theme(axis.text.x = element_text(angle = 45, size = 10))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "67d74532",
   "metadata": {
    "papermill": {
     "duration": 0.219726,
     "end_time": "2022-03-10T14:46:29.650126",
     "exception": false,
     "start_time": "2022-03-10T14:46:29.430400",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For average ride duration, casual riders tend to ride significantly longer time on Jan, Feb where as member riders tend to rides evenly through the year. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "32157a66",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:30.090549Z",
     "iopub.status.busy": "2022-03-10T14:46:30.088912Z",
     "iopub.status.idle": "2022-03-10T14:46:30.695239Z",
     "shell.execute_reply": "2022-03-10T14:46:30.693757Z"
    },
    "papermill": {
     "duration": 0.826939,
     "end_time": "2022-03-10T14:46:30.695485",
     "exception": false,
     "start_time": "2022-03-10T14:46:29.868546",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nam73EiJSbvB/X5AX1vUREZ+Ql/66eW+042s/zGU0iEjyYKexmFSlHuws8ZdO7JnYo6qI5Kk5\nMO5+4SkSzMrOoSLiE9Jq65l7X6sXdi0s5eFi+6ZP+hLNSnlpB7uYm6tExORWzDaYoWCX6Y0S\nf2efiHgXeiepJcVqObOss4iYfaqtOnivkvio4289HSQihZt/nTSVLdiJSO23FiRFh9+mtxAR\n94AX0lwrqQQ7qyXm3LH9n7zZxNZn7w3/2tqzuKOmEH19iYh4BLZJavkgxNfoktugKN7Bw5Ma\ne+bzFJFPL93RXoDG0ZIHu7M/jvE0Glw8w344fjtp1hr3SY3belIpfxEZfuy/lBZ9famIeORu\nbxscXNhbRLrM23H/fcuaUTVEJE/lzx+1DgEgx3osg93MirlFpMWac0ktJxc1FBGv/H2Tj7ap\nawkRqTXjUFLLuR9biEiRFqtsg1/VCRKRflsuPdC7NaFLXk8RmXP5jq3B9n3pkfulFPHl5DcD\nW7ZsOWLDxeSNt08PFpFCz69PahlYyFtEPj0TmXy0X3uVTBHsNBaTqtL3v/NS9VTfj68n/Fd7\n8gSTGHPax2RQDG5rHzzEeH5d9xRfolkpL+1gFxe5U0QUg7ttMEPBLtMbJd1g1yu/l4i8uf1K\n8n4Soo/kNxsVg9tf95fFFuw8AlvHJ89R1lh/F4PRnD+NdaLeD3aPUrfPF0ljZnFHfVgDXzdF\nUf6IjFNV1Wq5k9vF6B82o2MeD4PRy/Y/T0L0MZOiuOaqYslIARpHSwp25395z9tkcHEvseTo\nf6lO+z6pcVufWf68iIS0/69l7zsVRaT6Rwdtg6HuLiJyIua/A7Hxd/aPGTNm4scr01uRAJDj\nPH7BLiHmhJfRYDD5nI5JTGqMj9rrYlBEZE2yc08RZz8QkVzBbyW1fFwmQEQmnrJ9i1iKupmM\nLoGxDx3a2DWgjIjUX3zvqIPt+zKs1/Z0a4sNP/f5wLLJv1cSY8+5KIrZu3aKMW+fGflgsNNa\nTKpswS5v0ZDiyYUUDXA3iYjZt/SM3/8LKMkTTPjx10TEr/hHKTq0Wu4WMCc/npSl8tIOdjE3\n10hmj9hlbqOo6QW7xJjTRkUxuYckPLS8C6vmFZEuf123DdqCXam+O1KMVtrDxegalHZhtmAX\nVOyBrVaiVNl6zTrO/eVYshGzf0dd37aYiLTaclFV1cgLk0Sk+uS/t3QsLiKDT9xSVfXa/m4i\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# bar graphs for average riding time per weekdays group by member type\n",
    "\n",
    "trip2020_new %>%\n",
    "  group_by(member_casual, weekday) %>%\n",
    "  summarise(mean_length = round(mean(ride_length))) %>% \n",
    "  ggplot(aes(x = weekday, y = mean_length, color = member_casual, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs (title = \"Average Ride Duration Per weekdays\", x = \"days\", y = \"Average Duration of Ride\") +\n",
    "  theme_minimal()+\n",
    "  theme(axis.text.x = element_text(angle = 45, size = 10))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "df6167a0",
   "metadata": {
    "papermill": {
     "duration": 0.226372,
     "end_time": "2022-03-10T14:46:31.149037",
     "exception": false,
     "start_time": "2022-03-10T14:46:30.922665",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Both member and casual tend to ride a bit longer on the weekend, but casual riding duration is significantly longer than member overall. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "7919dc2d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:31.600676Z",
     "iopub.status.busy": "2022-03-10T14:46:31.598621Z",
     "iopub.status.idle": "2022-03-10T14:46:32.200652Z",
     "shell.execute_reply": "2022-03-10T14:46:32.200022Z"
    },
    "papermill": {
     "duration": 0.829051,
     "end_time": "2022-03-10T14:46:32.200799",
     "exception": false,
     "start_time": "2022-03-10T14:46:31.371748",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nd0Zs2Pz79dLVK3jaqR8cnjloyoJ1azceOvug3ueje9bJb+li34PoC1u+6Dt227GL548fvu9S\ntnIh7/whwQ9P7Qpf89ufV+5HR97cs+7nWeFnQrqMC87nYeli34ltzrsypiiRR77bcrtS38Yl\nVELYOQa4ntu6besmda6yRXJ6mrY5v27CjjPaHv0Gy/EnLNk8Qlgvgp01ib2yee2ee3WatcyW\nasAmR1DOFat2Pjyz57zyeLchgZT4Gzs2bTz01zXP3HkzueWTfpcghPiu1+C7uZvOndStVJHC\nJcuUvLsj4o5j7rDa5RzVale/sqHFA/MXKdfm8x6hQdksXel7YEi61Kf7Nyklmn83dUSrejVC\nS+YSQuiFU8Wa9bKJqDPHD+7+/dhDnWer3qM/rfrKi0usiJQXPL1G3M2Irr3nZiumelSsdfWc\nj4cbZQ3uZrZ54I0MiOVOrIlHgapCnFi86XqJZk/X3Defzlgry91ooi9sGfZkVd4rInBok/z1\nhk28Nnzgkgm9jj67Kq8sJ3CEPv7ErkdJLSY0dFSpFEPMT8N6HnEpP3VSr/MLhx4s0X9gSZ+s\nBUtkLWjpKt8fm1rJRdjeYj3OWUsW9Vo0fUaib/nromIWU6Pa3qfnuDlBy+aE79y/6HCCV5Y8\nHYd+10iisatXTRqZsmP4yeVffy2Gp15YHkg7BLsMT9HduHzLObu/j7PGwbN65xKLf1w8ZHmO\n/7Wo6G963jwPqXCF17+QdTCtyquUavHzgOYu8ZFaT1/xZFVeiXcJilEnhDAowpTqdiaUmDqp\nl6+9etXey2dv3BIlM/RdJf6T+OtxLv6u8Zfj1GovoxCRlw7N/37WvitKaKNmJR7tXRU+JbxR\n+YbejjKlOunXb0tNH6O3d7dX2/v2mjRVDOi78/cJq0792CTI6/HTKvuqrSQM7iY2cuCNjE+l\nKMq/bwULiTq3Y8zYWReidRpt5hYDxrYsn9Woj5w5fOC2s48+eHbsSo57Dwghrizv239VysKl\n0900KqEY/ohYmmosp6oQQspdglAMg1s1v5O7aSVVhDnVCSEmtG12rczo2b0kGazTxx3r1GHi\nJ3Pnl4pa367PIsXO3qjX5S5dp1uPjoGZHAyJFxq3GFB11uJ+flaZb4y6O9MHTy7Vb1Qlv6c3\nJjbqI3t/3Dk2f5PJqRde3nq2TKvH2S768nFpFl6Ov7W5W7/lrcdO+zC/uxDCqL8/fUDfXTfU\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# bar graphs for total number of rides by weekdays between member type\n",
    "\n",
    "options(scipen=10000) #Turn off scientific notation \n",
    "trip2020_new%>%\n",
    "  group_by(member_casual, weekday)%>%\n",
    "  summarize(number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs(title = \"Total Number Ride Per Weekday (2021)\", x = \"Weekday\", y = \"Number of Rides\") + \n",
    "  theme(axis.text.x = element_text(angle = 45, size = 10))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "40aa19f6",
   "metadata": {
    "papermill": {
     "duration": 0.223765,
     "end_time": "2022-03-10T14:46:32.652072",
     "exception": false,
     "start_time": "2022-03-10T14:46:32.428307",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "number of rides are more for members on the weekdays, and are more for casual on weekend.  \n",
    "combining the result of number of rides and duration per weekdays, we can assume that member rider may use the bikes for commuting purpose. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "de63e10e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:33.897218Z",
     "iopub.status.busy": "2022-03-10T14:46:33.115587Z",
     "iopub.status.idle": "2022-03-10T14:46:34.408471Z",
     "shell.execute_reply": "2022-03-10T14:46:34.407640Z"
    },
    "papermill": {
     "duration": 1.529889,
     "end_time": "2022-03-10T14:46:34.408629",
     "exception": false,
     "start_time": "2022-03-10T14:46:32.878740",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd4AU5f0G8Gd2tper3NHLUaSDgBRpdiMqikZsiTVRk6iJUSPGiomaaGIv0cQY\nk1ij+dkiKmIBCwoCggLSOTrHte1l2u+P4Y4Djru9Y3dnZu/5/HU7tzv73dnl9uGd9/2OoGka\niIiIiMj6bEYXQERERESZwWBHRERElCcY7IiIiIjyBIMdERERUZ5gsCMiIiLKEwx2RERERHmC\nwY6IiIgoTzDYEREREeUJBrv91K37iSAIgiDMXlTV7B2+f3qSIAjDf70oN/Vc2z0gCML3cTk3\nT9cOsV0fX3bCmE5+Z+ehtxzqPkN9TuEgNps9UFQ2asqpdz8zV21y5yW/PVIQhGnzd7T8vA/1\nKxYEYU5dIkOvoyXdXPaDirf5CoqHjj/x1sf/m8xmh+9E3RxBEOyuboe6w7xpvQVBGHvfiiwW\nkVHpfGAO/rTYXf7uFQPP/slv3l5Rk8tqiYgsx250ASZ1/2mXXrfznSK7YHQhZnfnlLOfW1/f\nZfTxJ48b0PI9O1f0C4j7jqcqp2p2bP/ms3e/+ezdlz56cuWLP89ypYera99+Ptve+jUltrVy\n56pFH65a9OHzb96+fu7vHPykpCf9D0zPfv1dDUc1HqrdVbnu9Wf//MZzj13wxzkv/Ob4rBdK\nRGRNDHbNi1e/e8rvFn75u4lGF2JuWuqRDUGHd/CGxfO8tlaizYNfrbiwzLvfo5XQa3+45Nzb\n31j10i/u/f2Ft/QrBNBn5u+fG1TbfVBxFstul2e+/u7UYnfjTTUVmvO3W8++9okt835/0Ts/\nffn0XgbWZhlt+cC8uXzVKJ+j8WZ05+p/PTz7V3969cWbTvD03fTMD/tkt1QiImviqdhmeMvO\n94u2xX+Y9nZV3OhaTE1T45KmObxDW/2SbpYgFsy87fWru/kBvPzkWn1j6ejpl1xyyYmdPZks\nNAtszoLTr37stXP7AvjwlrlGl2MNh/OB8XUd/PP7Xln4xFkA/nXxabsltdWHEBF1QAx2zfCU\nnvnOjaNUOfSTU+/J+M41JRZPKRnfbXtoySoTfDvOnNIZQP2KeqMLaY+jbx4JILbrw8Paizne\niNaZoM4xP//PRZ19UmzVz+duM7YSIiJzYrBr3uS73zuhxL1nyT0/ebOyhbst/PkQQRB+uHq/\nCd2aEhQEwVc2s3HLun9OFQThJ2uqnpl1drm/0Ouy+4vLp5z1s0XVCUCZ89iNRw/u5Xc5Cjr1\nnnbpLesOWiqhaep7j988ZUifgNtZXN7jhHOu/F9zU8grP3vx0hnHdi8vdnmLBgwf+4u7nlof\n229X+sqPazbURyrnnD9liN/p/XdV7NAvTp3//B/OmDqirMjv9BVWDJv4izv/tiO5L5LOm9bb\nZi8CEKt+TRCEQPdrWzhQLVCTKgB/P79+85u7xhyweEKVqv52+1Vjj+jpd7k6det79hW3fluf\nanZXrR4BALXfvfPLC07p37XU5XAWlvaYcvplL3+1q32VA1DieiX7JfVMvxFt1cobh7Q/t6b8\nwIizfjsMwMK79y1g0pTgiw/ceMK4IaWFPrvTU9bziGk/+uX73wcb77D59VMFQehzxjsH7Gv1\nk5MEQRh0+SftqoSIyJQ0aqJ27eUASge9pGnars9+C8DpH7UxLjfeYfVTEwEMu+4r/eYXPxsM\n4OxV1U13osr1ALydzmncsva5KQAGzRgIoGLkpDNPPb6nxw7A1/XMxy4/UrA5ho0/YfqJk/yi\nDUDno//Q+MBruvkB3HPFKAAOf+cjRw302W0AbPaC38/d1vRJFz50sSgIgiB07jNk0viRnXx2\nAL7ux3+4O3ZA8T9d+v6RBU5P5yNOPHX6mzXxQx2KRy4aCUAQhM59h089+qhihwigsP8ZK6OS\nfod1z/7x5puuA+DwDrz55pvvvPfNQ+1qiNcB4IWqaHO/lM8v9wK45NOd+u1ls0cDOOWT7Xt/\nndh83uDixkoGdS8E4C6ZdElnH4B3avfVn84R2LPkwSK7DUBJ36GTj5k8pE8hAJvof3RV7aGK\n1zStq1M84LkaPXV8dwCdhv+1TWWk/0bEa98BIDq7Hqq2D07pBeCoPy5v3NLqG6el/bk16gOj\n/2laGkk1+9v6jTcB8HSa0VB26Ipx5QBs9qKRRx19zMSxfYpd+kF7a8/eYy5FV3psgsM7OK7s\nt6sru/kBPLE9fKhKiIgsh8FuP02DnaZpj57YA8DAy19vvMPhBDtBcMx6frG+JV61sI/bDkB0\nlP3lo0p9454lTzoEQRDETYm9UVIPdoIgXvH43JSqaZqmJPc8cfXRABzewVsa7hbc+KTLJjj9\nw/86b72+RZGq/3LNBACF/a9s/C7Tiy+v8B//2xdjitrCcdj03x8DcBWOfXPF3peWCq+9/tiu\nAHqf/s8WXmmzmg92SmrHuq/vvfwoAOUTrks2lHNAsHvjxwMAFPY7a/6moL5l65cvDvbunVPf\nGLbSPAI39i4AcNHfvmgs4u1bxwMoH/1MC/UfHOxUJV65Ztkjv56ml3HFvG1tKiP9N0IPdoJg\nH3QIvXyOpsEuzTeuTcEu9x+YloNdvOZNAHZ3X/3m9o9nAgj0Ouf72kTDs4SfvuwIAMNvXNT4\nqPsHlwC4ec2+BB/b8xoAb9m5LRdDRGQtDHb7OSDYJYOfd3OJguB4am29vuVwgl23qf9serdX\nR5cDGPrLz5puvLizD8C7DRlCD3a9z3h+/zKVa/oWApj234367X9M7grgF5/s2O9eqnRRZx+A\np3ZGmhbvLTtv/2GLZvy0mx/Arz/f1XSjFFvdzSUKNvc3Dd+4bQp2hzLxZ3/eI+2rqGmwk+Mb\nC+02weaesyfWdIdb3r3sgGCX5hEY4HEAWBffN3aViiybPXv2vX9+o4X69WB3KFOu/HvjPTP+\nRujBrlWNwS7NN65NwS73H5iWg10ytBCAYPPoN9f/+7oZM2b8dt72pvep33gjgF6nfNC4ZdP/\nnQKg37n7tiy5/UgA4/60orUXR0RkJZxj1xJnwcT3/3SCpkk3nXxd6rD70PY656imN0t7+QAM\nv2pQ040DPXYAB0xQP/fPp+2/wXbjw+MALH94FQBA/d3Xe0RHpwendt3vXoL96pl9ALw0f785\nZL3O/GXL77qS2PSPnVG7p9/9R3duut3uGfTn4Z00NfHA+uChHtuCzhX9+jfVr6LUYwew5OVn\nX/5qT7MPCW39U1BWi/r+flqn/RbJ9jj58e6upmEr3SNwVjcfgJPOvm7OwlX6G+rwHXnnnXf+\n9oYzW62/a9/96j9i8LCpp13w9PtrFjx9eVvL0LX6RjRq9VSsLktvnFEfmENRpWoAonPvQe73\n44def/31e0/Y18M5WbfltUffO+BRPX7wgNsmbJ0zS274hzz7yTWCYP/TFQMzWBsRkeHYx64V\nw65+86IHyv+9+bkZf7lxzi+GHs6ubM5mvh+9jta/3Gd09h6wpeTI44APYtu/B05TEps2JWSg\n2n2IFhKhVaGmN4vHtNIiLhX+UtE0f/G0g9szDzi+M77eXbmyHiM7tVr2AZrpY6fGXr935g9v\nn3PjqT/8RfCzgw9EZMN6AGUTJxywXbB5Z3byPrw9rN9M/wjc/uG/lpx08YfvPnHau084/OWj\nxo6ffMxxM867ZMqgklbrP6CP3cEy/ka0VZbeOKM+MId8utAXABz+EY1b5NjmF/727/lfLVu3\nfuPmys3bqprJkXbvkLuOKJ71/dI/bg7dVlEQ2f742zXx4gF3TS10ZqowIiIzYLBrjc396Pt/\neGnwtR9cf8pXF20oTOchWoZbQggHfV8KNicAweYBoGkSALu7z43Xnd/sw7uML2t60+5p9U0/\n5OCkIAoA1FRmXqBg855921tH3e/9OvT5/1XHz+l0YO86Qb+eQ3MxqaRJIE7/CPh7T5+3Zvfi\nuf99a84HCz77YvGC/y36+O2H7rpp+s2vvXlv64N2LcvCG9HmEg71i7TeuEN8bs3zgdFte+dj\nAIX9f6zfrFn6zLhjfrExInUaMObYCeOmnn5B/yOGDOv7ybjxDx7wwJn3jJv1w/ee//03tz07\n9Zu7ngAw5YFLMlgYEZEZMNi1rmjg1S9f9Og5/1o789xn5s5o/f5SfF1mC3irKn50YL9xhbqV\nHwMoHDoIgN3dr8wh1qqxe//wh4xc18oZGC8KQqLuPQU4YHLZxk92A+g2rCgTz6MTp5d4vg6n\nvotJ5+DAYOfvMxSYu2fh18DkA341r8lVYtt2BATn2B9cMPYHFwBQ4lUfvvbMj39yx9t/POvF\nX0cvLDusrsgZfyPa6jDfuHZ/bnP7gVEfvOc7AEffNla/ffWp122MSL9+cfGDF+yb6hDa/NXB\nj+x5ygNu2/ub/+829e8f3vDyRtFR+vjJPTJXGBGRKXCOXVpmPP3OcJ9j63tX37Zw98G/je7e\n71L02+fem9lnf+WmAyYMqQ9f+zmAY38zBAAEx6yBRUqq6tavqg642zUj+3Xt2vXNmgTaQnT3\nu7izV46vn/Xlfi9Wjq+9fmm1YHPeMDCT5xCL7TYAWxPNNG0O9Ph1icNWv+GWD/Z/CbXf3rsg\nmNx3O70jEKt6fsCAASMmXN/4a9FTfvJFtzw6oFjTtA/q2naUmpHpN6Kt2vrGZepzm8sPzIpn\nLvj7zojDO+Spk3sA0JTgf6pidlevpqkOQGjtqoMfq5+NTQY/vevj3ywKp7pMerSnq6VlMURE\nVsRglxbR3f+tf14A4L//3NB0e9HwIgBfXTW78QJHdavemH7JnMw+++bXf3TN3+brT6DKdX+9\n7pgH19Z7yk55vGGu+sX/+BmAB0486eVFO/UtmhL+940nPLFiY7Lg3DNLW5oZ1qzbH5kO4PFp\nZ85ZvfeCEHJ0429PP25bUu55ylPjAi2tcm0rfebh7rrkwb8SXT3/eUF/TYmfO/Hihdui+sa6\n1e+eedzdB9wznSPgLj65vnLTd4sevePN7xofWL3yf3duCgqC/eKDJjK2Q8bfiLZK843L+Oc2\nBx+YZPX6Z++4aOxVrwK45F/vlDtsAAQxUOEWldTWZ1fWNd5z8WsPnnjW/wAoB/X6nnnPOAB/\nOOtJAD98+OTDr4qIyHRyuALXAg5od7I/dVbDBPDGdifJ4Od6Ozp3pyGnnjXzuHHDPDbB6R8x\n3Oc4uN3JxKdWN93dRzMqAFy+dr/WuPf0KUSTLh7XdPPbXb0mlnsAuIq6jx07rNApArC7+/xz\nVV3TB75+00l6bX1GjDvhuEn9OrkBuApHzdm1r3uc3r1iynNr0zgS6oM/Gg5AEMQeA0dPHTvE\nb7cBKOx/5urYvl4hh9XHrsG7U7sDGHTlJ/rNgxsUnzuoSK+k+xGjRvbvIgiCq2jcI5cOwP69\n5dI5Agvv2vtdXt5/5PEnnjB2RH+bIAA48eb3W6i/hQbFB8vsG9H2BsVpvXFpfm6N+sDsPYBH\n7GvXV9Gjs8MmABBsrgvv/7Dpnb+44xgANtE3+eTp5844ZeQRnW2i/4JZN+vH7dKfX920A58U\n/U5f2uL0HxlvtYkLEZEFMdjtp8Vgp0V3/V9AtDUNdpqm1a16+7LTJ5YX7J2e5e855aWVded0\n8mYq2LkKJkmR9X++/uIRfbp4HI7izr1Pv/iGz7dGDi5v2VtPzDxpXFmx3+5wd+474sJf3bOy\nPtn0Dm35ntY0Tfnwn3efNmlYScBjdwd6DZ7wszue3p7c78swI8Fu42snAbDZC5/bFdUOCnaa\npinJnX+55YoxA7r7nPbCsu7TLrphWW3iq+uGHRy2Wj0CmqZ9/sL9Z0wZXVboE232QEm3iSef\n/8Qby1quv03BLp0yshnstHTeOC29z61RH5iD//9pc3i79hpw5qXXv/nNnoOf93+PzDp6aC+P\nU/QXl0887cdvrKjRNO3xS44pdNt9pT1D8n6tlf84qATAwJ/MT+9FERFZjKA192eU2kGO1mza\nHut7RE9O2yEL6Wif2+v7FD5UGfrL9sjPuvmMroWIKPMY7Iioo4hVvezrfIG37Pxo1UtG10JE\nlBVsd0JE+S8aSrgc4ftmXAdg7J13GF0OEVG2cMSOiPLftd0Dj++IAPCUTdmw7ZOuzV0Ghogo\nD/CvGxHlv6N+MHno4JGnXnjDvJVzmeqIKI9xxI6IiIgoT/B/rkRERER5gsGOiIiIKE8w2BER\nERHlCQY7IiIiojzBYEdERESUJxjsiIiIiPIEgx0RERFRnmCwIyIiIsoTDHaZp2laMBgMBoOS\nJBldS+tSqVQ0GjW6irSEQqFgMJhKpYwupHWSJEUiEaOrSIu1jmo4HDa6irSEw+FgMJhMJo0u\npHWyLFvlqEYikWAwmEgkjC6kdYqihEIho6ugDspudAH5SY90qqoaXUjrVFWVZdnoKtKihw+X\ny2V0Ia2z0FGVJEnTNKfTaXQhrbPWUVVV1eFwGF1I6zRNs8R/QQFIkqQoit1uga8tVVWtclQp\n/3DEjoiIiChPMNgRERER5QkGOyIiIqI8wWBHRERElCcY7IiIiIjyBIMdERERUZ5gsCMiIiLK\nEwx2RERERHmCwY6IiIgoTzDYEREREeUJBjsiIiKiPMFgR0RERJQnGOyIiIiI8gSDHREREVGe\nYLAjIiIiyhMMdkRERER5gsGOiIiIKE8w2BERERHlCQY7IiIiojzBYEdERESUJxjsiIiIiPIE\ngx0RERFRnmCwIyIiIsoTDHZEREREeYLBjoiIiChPMNgRERER5QkGOyIiIqI8wWBHRERElCcY\n7IiIiIjyBIMdERERUZ5gsCOi/JFQVaNLICIykj03T6PJda//7el3v1hek7B17TngjIt+9oNR\nXQAA6icvP/n2gqVbw+KgYeMuvfayvl57TrYTUb55s7p25srvL+1S/teB/Y2uhYjIGDkasZt7\n740vzN99xmW/vO/3s47vl3xy9tVvbI0A2Pjf2x56ZeGEs6+487qL/Rs+vPXXT+v/3c72diLK\nMwlVvW79RknTXqyqVjTN6HKIiIyRi2CnJLc+taR6yu13TD/+6AGDRvzw6ntPKhLfePI7aKkH\nX1nd74LfzTzx6KFjpvzq/muiO99/YXs069uJKO88uHXH5kQSQFRRVsXiRpdDRGSMnAS7xObe\nFRWn9i1o2CCMKnRJ9ZFkcMGWhHLSSd31ra6iyaP8ziWf7Mr29hy8ZCLKpaqUdN/WbY03F4fC\nBhZDRGSgXEw4cxZOefjhKY03pcj3z+6I9L5sYCr6KoAhXkfjrwZ77e+tCKaOXZHV7fhRM0Vq\nmhaJRA7/xeq70n+Ix+OpVCoj+8weRVFUVQ2HLfNFmEgkJEkyuopWqKpqlaOqf1yTyaQsy0bX\n0ooWjupNldtCsuK0CaV2+86U9EVt3Uy/N/cVNmo8qoqiGFhGOlRV1TTNEp9VVVUBpFIp1fRL\nZPQKc3xUA4FALp+OTCvXKwkqv57z6CPPSn2n3XpKD7kyCqDUvm/UsJNDlCMJNZnd7c0Wpmla\nMpnM0KvcS5Zl839Z6jL+2rOHRzUbLH1UVyaSz9fUAbiipLhWll9KSYsjUTMcfEVRzB/sdGY4\nXGniUT0UBjvS5S7YperWPPvYo+8uqz3mnJ/fc+HxbkEIOz0A6mTVL4r6fWokRSxy2rK8vdny\nBEFwOBzN/qod9CElURRtNrM3lNFHQex2CywW5lHNBv2o2mw2seGfiWmpqqooysH/Tu+q3K5o\nWrFdvLFr5/+rD75UH1qdSCp2u1sQDKkTljqqmqbJspzBv37ZI8uypmk8qkQty9EXT7jywxtu\nfFwcPu3+v108sJNb3+jwDQcWrInLPV17/5Wui8uFk4uyvb3ZCgVBKCwszMiL1TStpqYGgNfr\ndblcGdln9iQSiWQymanXnlXV1dUAPB6P2+02upZWJJPJeDxuiaNaU1OjaZrH4/F4PEbX0opk\nMhmLxQ44qm9V134cjgC4p2+fPqUlU51ObN0hadpmmzi+wLABjNraWlVV3W6312vkGeF0SJIU\nDoct8Vmtq6tTFMXlcvl8PqNraYUkSaFQyBJHlfJPLkY+NDV2z6wnXSf88sk7rmxMdQDcRcd1\nc4rvf1al35Si3ywKp0af2CXb23PwkokoByRN+83GzQAGez1XdO0MYKTf57bZACwKZ2bKLBGR\nteRixC5W9cKqmHTZcO+Sr7/e98Se/kcOLbrxnEG/eW72vK43DS2W3nriAW/XEy7u4QeQ7e1E\nlAee2L5zbSwO4MH+FXZBAOAQhBF+76JQZHEogu5G10dElHO5CHbh9ZsB/OO+e5puLOh5y/NP\nTOh/3t2/SD788kN31CSEfiOPuft3V+hDiNneTkRWVyfLd1duBXBCcdEpJcWN28cFAotCkcVW\nWOZJRJRxgsYW7ZnWOMcuEAhwjl0G6XPs/H6/VebYFRU1P6HTVPQ5dj6fzypz7IqL92a4X67b\n+Nj2naIgfHPUkcN8+6ay/WtX1SXfrxOA2snjiwxav6LPsfN6vVaZY1dSUmJ0Ia3T59h5PB6r\nzLErLS01uhDqiDiARUTWsyYWf2rHLgBXdevSNNUBGFsQAKABS8O8zAwRdTgMdkRkPTds2CRp\nWoFdvKN3zwN+NdDjKbCLAHg2log6IAY7IrKYj+qC79TUAbijd8/OzgNbhdkEjPH7ASzmwlgi\n6ngY7IjIShRNu279RgB9Pe5rundt9j5jC/wAFoUY7Iiow2GwIyIreWbn7m+jMQB/7tfHdYhr\nkIwNBABsTSZ3mv5izUREmcVgR0SWEVHV2Zu3AphUWDCj0yGXHI4N7G1X+TXPxhJRB8NgR0SW\n8cDu6l2plE3Aw/0rWrgQbG+3S597t5hnY4mog2GwIyJr2JxMPrWnBsAlncuPCrRyCRn9Dlw/\nQUQdDYMdEVnDrZXbk5rmFW13VfRq9c76NLtF4TA7sBNRh8JgR0QWsDAU/r+aWgA39+rRM40L\nuowr8AOoleRN8UTWiyMiMg0GOyIyOw24bv1GDejqsF/fo1s6D2lcP8GzsUTUoTDYEZHZPb+7\nSm9KN7trZ58opvOQTg5HhdsNBjsi6mAY7IjI1OKqetumLQBG+X0/LCpM/4ENbYp5YTEi6kAY\n7IjI1O7fsn1LIgnggT49bS30ODmIfjZ2SSQia1xBQUQdBYMdEZnXjmTqT1u3AzivvNPE1lqc\nHEAPdjFF/T4Wz0pxRETmw2BHROZ1y6bKqKK4bLZ7Knq39bFjAn5REMCzsUTUkTDYEZFJLYtE\n/727CsD1Pbr187jb+nC/KA7yesD1E0TUkTDYEZFJXbd+o6qh3Om4uVeP9u1hHK8/QUQdDIMd\nEZnRf/fULKgPAbi7oneBPa0WJwcbWxAAsCISjatqJosjIjIrBjsiMp2Uqv12YyWAIT7vZV3K\n270fff2EpGkrItGMFUdEZGIMdkRkOo9s37EuHgfwUL8Ku9CWHif7G+HzuWw28GwsEXUYDHZE\nZC57JOmeyq0AppeWnFxSdDi7ctqEkX4vGOyIqMNgsCMic7lj05agrNgF4Y9929zi5GBjAwGw\n4wkRdRgMdkRkIqtj8Wd27gZwdfeuQ3zew9+hPs1uTSxeL8uHvzciIpNjsCMiE/n1+o2yphXb\n7bf37pmRHerBTgOWhrl+gojyH4MdEZnFu7V179fWA5jdp1epw56RfQ7yevVuKYvDPBtLRPmP\nwY6ITEHRtJs2bAbQ3+P+WbcumdqtTcBoP9sUE1FHwWBHRKbw1I5d30VjAB7sX+G0tb/FycHG\nFTDYEVFHwWBHRMYLysrszVsBnFBcNL20JLM71xfGbkkkd6ekzO6ZiMhsGOyIyHhv19RWS5IA\nPNCvT8Z3rq+fAKfZEVEHwGBHRMb7KhQGMNDrGen3ZXznvd2uzk4HeDaWiDoABjsiMt6icBjA\nuIJAlvZ/VMAPYFGIwY6I8hyDHREZLKVqyyMxNDlnmnF7rz8RDmtZegIiInNgsCMigy2PRpOq\nCmBcIFsjdnpkrJXkzYlElp6CiMgMGOyIyGD6hVydNmGkPwPXEGuW3vEEPBtLRPmOwY6IDKav\naRjp87ls2fqL1Mnh6ON2gesniCjfMdgRkcH0EbvsrZzQ6ftnxxMiym8MdkRkpLCirInHkc2V\nEzp9/0vCUVnjCgoiylsMdkRkpMWhiKoB2R+x04NdVFG+j8Wz+kRERAZisCMiI+kd7AKiONDj\nyeoTjQn4RUEAp9kRUV5jsCMiI+kxa2yB3yZk94n8ojjI6wGwOMRpdkSUtxjsiMhIe1dOZK2D\nXVP62dhFHLEjovzFYEdEhtmZSm1LppD9lRM6/VlWRKIJVc3B0xER5R6DHREZprFd8NiCnAS7\nggAASdOWR6I5eDoiotxjsCMiw+hd5bo4nT1drhw8XWMPZK6fIKJ8xWBHRIbRR+zG52S4DoDT\nJozwecFgR0T5i8GOiIyhAV/rS2JzsnJCt/f6E1wYS0R5isGOiIyxNhavk2UA43I1YoeG9RPf\nx+L1spyzJyUiyhkGOyIyhn4+VACOysmSWJ0e7DRgGddPEFE+YrAjImPoKycGeD3FdnvOnnSQ\n11tgFwEsDnGaHRHlIQY7IjKGvnJiXA6H6wDYBIz2+9EQK4mI8gyDHREZoLGZXC5XTuh4/Qki\nymMMdkRkgOWRaFxVkduVEzq9GfKWRHJXKpXjpyYiyjYGOyIygL5ywiEII/2+HD9143Vpv+ag\nHRHlHQY7IjKA3kluhN/nseX6r1Bvt6vc6QDbFBNRPmKwIyID6FPccrxyopE+zY4LY4ko/zDY\nEVGuhRXl+1gcwNiCXK+c0OkrNhaFw5ohT09ElDUMdkSUa1+HI4qmwegRuxpJ3pxIGFIAEVGW\nMNgRUa7p50D9ojjI6zGkgLENS3F5NpaI8gyDHRHlmt4c+KiAXxQEQwooczj6uF3g+gkiyjsM\ndkSUa3tXTuS8g11TjdPsDKyBiCjjGOyIKKeqUtKWRBJGXHOiKf1s7NJwVJ/tR0SUHxjsiCin\nvgztHSQzauWETl8/EVGU1bG4gWUQEWUWgx0R5ZQ+ra3c6ejldhlYRuMMP/na/RwAACAASURB\nVE6zI6J8wmBHRDmlr5wYb+h5WAB+URzo9aDhGhhERPmBwY6IckdruELrWENXTuj0c8EcsSOi\nfMJgR0S5sz4er5FkAOOMHrFDwzS7FdFoUlWNroWIKDMY7Igod/SGwAJwlKErJ3T6Bc1SqrY8\nEjO6FiKizGCwI6Lc0c979vO4Sx12o2vBSJ/PZbOhYdofEVEeYLAjotzRGwKPKzD+PCwAp00Y\n4fOC0+yIKI8w2BFRjkiatiwcRcPkNjPQz8Yu4sJYIsoXDHZElCPfRqJxVYU5Vk7o9Ii5Jh4P\nyYrRtRARZQCDHRHliH7G0y4IowI+o2vZS+94ompYEuHZWCLKBwx2RJQjerAb7vN6bGb5yzPI\n6y2wi2hYrktEZHVm+fNKRHlPn8pmkpUTOpuA0X69TTGn2RFRPmCwI6JciCrK6lgcZlo5oRvL\n608QUR5hsCOiXPg6HJE1DSYbsUPDxc0qE8ndKcnoWoiIDheDHRHlgj4k5hVtg70eo2vZz9iG\nJbpfc9COiKzP+ObvJqFpWjAYzOw+o9FoPB7P7D4zTtM0VVXr6+uNLiRdsVgskUgYXUUrLHRU\nNU0DEI/Hk8lkVp/oi9o6AEd63JH2/kNTVVXTtIwf1SKgzGHfI8mf7tkzSRQysk9VVQEkEolU\nKpWRHWaPpmnZOKrZoCgKgEQiIUlmH1s15KgWFRXl8unItBjs9vF4MjOQoGlaJBIB4HQ6HQ5H\nRvaZPZIkSZKUqdeeVeFwGBY5qrIsp1IpSxzVSCSiaZrD4XA6nVl9oqWxOIDxBQXtPiySJGXp\nqI7x+96rC36TyNjO9aNqt9tdLldGdpg9iqLE43FLfFaj0aiqqg6Hg0eVqAUMdnsJgpCpPxaN\nwc4Sf4A0TVMUxfx1oiHYWeLLEoAkSZaoU/+sZvuo7pGkymQKwISiwsN5oiwd1fGFBe/VBZdE\nY5naeTQatUqwkyQpkUiYv04AsVgMgCiK5q9WkqR4PG7+OikvcY4dEWXdVw3X7DLbygmdPs2u\nWpI2mf4sPxFRyxjsiCjr9JUTZQ5HH7cZxzDGFeztwMI2xURkdQx2RJR1emBqzE9mU+Zw9Ha7\nwG52RGR9DHZElF1aQ2BqbCxiQuMCATDYEZH1MdgRUXZtjCeqJQkmHrFDQ5viJeGIomlG10JE\n1H4MdkSUXYsaLsN6lMkuJtaUfmGxiKJ8HzN770kiohYw2BFRdukT7Pp63GUmbkA4JuAXBQE8\nG0tEFsdgR0TZpUelcSYergMQEMWBXg8Y7IjI4hjsiCiLFE1bFonC3CsndPrZ2EUNLfeIiKyI\nwY6IsujbaCyqKDD3ygmdHuxWRKNJVTW6FiKidmKwI6Is0gfAREEY5fcZXUsr9KtipFRteSRm\ndC1ERO3EYEdEWaRPWRvm8/pE0ehaWjHS53PZbAAWh3k2loisisGOiLLIEisndE6bMMLnBddP\nEJGVMdgRUbbEFHVlNAZgbIHZV07o9DoZ7IjIuhjsiChblkQisqbBIiN2aFg/8X0sFpIVo2sh\nImoPBjsiyhZ95YRXtA31eY2uJS16sFM1LI1w0I6ILInBjoiyRT+nOdrvtwuC0bWkZbDXW2AX\nASwKMdgRkSUx2BFRtnwdjqBhGMwSbAJG+f0AlnHEjoisicGOiLKiRpI3xhNo6A9nFfqFxTbE\nE0YXQkTUHgx2RJQVX4XCGgDrrJzQ9XG7AGxOJI0uhIioPRjsiCgrFoXDAEod9gqP2+ha2qDC\n7QawR5LCChfGEpH1MNgRUVY0tCYOWGPdRIMKt0v/oZKDdkRkQQx2RJQV+sqJcQVWOg+LhhE7\nAJsSnGZHRNbDYEdEmbcpkahKSQDGBqy0cgJAudPhF0UAm+IcsSMi62GwI6LMa+wDZ6FeJ416\n710/wRE7IrIeBjsiyjx9gl2F213udBhdS5vpC2M3cY4dEVkQgx0RZZ5+MbGxVptgp9On2XGO\nHRFZEYMdEWWYomnLIlFY8zwsGOyIyMoY7Igow1ZGYxFFATDOaisndPqp2JCs1Eqy0bUQEbUN\ngx0RZdiicASAKAijAz6ja2mPxo7KXD9BRJbDYEdEGaavnBjq8+p9Qyyn775Wdlw/QUQWw2BH\nRBm2d+WENSfYASi0i0V2OzjNjogsiMGOiDIprqorozFYOdih4cJiHLEjIsthsCOiTFoajkia\nBmBcgSVXTuj0aXacY0dElsNgR0SZpK+ccNtsw3xeo2tpv709iuMMdkRkMQx2RJRJi0MRAGMC\nfocgGF1L++mt7DYnkprRlRARtQmDHRFl0qKwtVdO6PRgF1fV3amU0bUQEbUBgx0RZUytJG+M\nJ5APwc6l/8D1E0RkLQx2RJQxi8Jh/dylpVdOAKjwuPUTyZxmR0TWwmBHRBmzKBQBUOKw92u4\neINFeWy2MqcDwGaO2BGRpTDYEVHG6NecGBcIWHjdRAN9mh17FBORtTDYEVHGLM6LlRM69igm\nIitisCOizKhMJHenJABjC/Ij2LFHMRFZD4MdEWWG3ugEwFF5MWKn9yjekkgqGpvZEZFlMNgR\nUWborYl7u11dnU6ja8kA/apikqZtT7KVHRFZBoMdEWXGooaVE0YXkhn6qVhw/QQRWQqDHRFl\ngKphaTiCfJlgB6C32yUKArh+gogshcGOiDJgVSwWVhTky5JYAA5B6OZ0gusniMhSGOyIKAMW\nhcIAbAJG+/Mk2KFh/QRH7IjIQhjsiCgD9NbEQ7zeArtodC0Zo6+f4FXFiMhCGOyIKAP0lRN5\ncx5W19CjmMGOiCyDwY6IDldCVb+NRAGMLciTJbE6fWHsjlQqqapG10JElBYGOyI6XMsiUUnT\nAIzLrxE7fY6dqmFLktPsiMgaGOyI6HDpKyfcNttwn8/oWjKpsZXdZq6fICKLYLAjosOlr5wY\n5fc5bYLRtWRSd5dTf0VcP0FEVsFgR0SHa1Eor1oTNxIFoaeLHU+IyEoY7IjosNTJ8vp4HMDY\nfLmYWFP62VgujCUiq2CwI6LD8kUwrAEAJuTXklgdO54QkbUw2BHRYVkQDALo4nT297iNriXz\n+rjd4OIJIrIOBjsiOiyf1ocATC0qMLqQrKjwuABUpaSIohhdCxFR6xjsiKj94qq6JBIBMKUw\nT4NdQ8eTSg7aEZEVMNgRUft9GQqnVA3A1DwNdnqPYnCaHRFZBIMdEbXfgvoQgGK7fVh+tSZu\n1Nnp9Io2cJodEVkEgx0Rtd+nwRCASYUF+dWZeB8B6O3iwlgisgwGOyJqJ1nTvgqFkb8T7HQV\nHjeATXGO2BGRBTDYEVE7LQlH9LWiU/J0SayOPYqJyEIY7IionfTzsB6bbYw/3y4m1lQf9igm\nIutgsCOidtKD3dGFAWe+zrAD0DBiF5SVelk2uhYiolYw2BFRe2jA58EQ8n2CHRquKgZgExfG\nEpHpMdgRUXt8F43VSDI6QrBruFTapjjPxhKR2THYEVF7fFofBGAXhPEFAaNrya5iu73Ibgen\n2RGRFTDYEVF76BPsxgT8flE0upas09dPsEcxEZkfgx0RtcfnwTDy90piB+jDjidEZBEMdkTU\nZhvjia3JJPK9g12jir0dTzhiR0Rmx2BHRG22IBgCIAATCzpGsNt78YmEZnQlREQtY7AjojbT\nJ9gN83lLHXaja8kFfcQurqpVKcnoWoiIWsJgR0Rt9ml9CMCUokKjC8kRfY4dOM2OiEwv1//b\nfu7nl7h/99T5ZR795u6Ft17xh2+b3uHyf/xnRqkbUD95+cm3FyzdGhYHDRt36bWX9fXqpWZq\nOxG1065Ual08jg7Qwa5RY4/izYnkhHxv70JElpbLlKOt+/Tvr++on6ntm6ZS/029p3T6r64Y\n2rild8ABYON/b3volcofX33N5cXyO08/ceuvUy88fbUtc9uJqN3087AAJneYYOcTxTKHY48k\nccSOiEwuR8GuauHDsx77rCaSOnD7qlDRkIkTJw7db6uWevCV1f0u+PPME/sB6H+/MPPi+1/Y\nfulF3RyZ2d7dl5tXTZSX9POw/TzuHi6n0bXkToXHtUeSePEJIjK5HI1eFQ2deevv/vjn+2Yd\nsP2bULJ4VJESD+2qqm8cx0sGF2xJKCed1F2/6SqaPMrvXPLJrkxtz/JrJcpzCzrGJWIPUOF2\ngz2Kicj0cjRi5yzo3r8ASsp9wPZlEUn77NFzH/te0jS7r+wHF/7qqukjUtEVAIZ4HY13G+y1\nv7cimDo2M9vxo+aLlGX5sF8oAGgN55oVRcnUPrNHVVVN08xfZyNVVc1fraIo+XpUg7LyXTQG\nYFLAn+MXaOxR7eV0AtgYj6dfgFU+q8jcX7+s0v+08qgeit3OGeQE5H7xRFNKantEdPTpNPG+\nF35XpIW/mvPsn/52m2vAv85yRgGU2veNJnZyiHIkoSYzs73ZYlRVra+vz+wLjMVisVgss/vM\nkoy/9uzhUc2GeDwej8fTuecH4aiiaQBGCsa8QKOOamdVAbAlmaqpqxMFIZ2HJBKJhEXm5Fno\ns5pMJpNJa4yb5viodurUKZdPR6Zl5EIC0dn9P//5z/3XnFnudzkDnaacd9OZpZ6PnvnO5vQA\nqJPVxnvWSIrocWZqe/ZfGVHe+jIWB1But1c4Ha3eOZ/0cjgASJq2y/TDRUTUkZlr5HZUZ8+8\n2j0O33BgwZq43NO19+Li6+Jy4eSiTG1v9qltNltxcXFGXoWmafp/1Hw+n9Np9hyZTCZTqVQg\nYIEODnV1dQC8Xq/L5TK6llakUqlEIlFghasy1NfXa5rm8Xjc7gNnSjRr8ZbtAI4pLszUv5f0\npVKpeDxeWGhM87zhbjcqtwGoc3mGFbby7yUYDKqq6na7PR5PTqprP1mWI5FIUVHzfxhNJRQK\nKYrCo0rUMiODXf3aJ264f9U9Tz7WxakPHKrzd8SKRh/hLhrQzfnU+59VnXh6TwBS9JtF4dTZ\nJ3ZxF/XKyPZD1SOKYkZeV+McO5vNlql9Zo/NZhMEwfx1NuJRzYY0j2pcVZdEogCmFhXm/tUZ\ne1T7en02AaqGylTq2PRqsMRnVVVVa31WLVGtqqrI3HcKUZsYeSq2oO95pbHds2Y/vfi7NetW\nfvPywzctiAau/OkREJw3njNo/XOz5y1Zs3Pjd8/e8YC36wkX9/BnbDsRtcuXoXBK1dDxlsQC\ncNqErk4nuDCWiMzNyBE7m73T75+46x9PvfDo3bclxEDfAcNuemj2KL8DQP/z7v5F8uGXH7qj\nJiH0G3nM3b+7Qk+gmdpORO2gd7ArtIvDfF6jazFAhdu9PZlij2IiMjNBa3IdCMoITdNqamoA\nBAIB888GSyQSyWTSqHlLbVJdXQ3A7/enORvMQMlkMh6PW2KGTU1NjaZpPp8vnXlLJy1fOa+u\n/rTS4v8NH5KD2g6QTCZjsVju5/Y1unj1un/vrppaVDD/yOEt37O2tlZVVa/X6/WaPQFLkhQO\nh0tKSowupHV1dXWKong8Hp/P7E3mJUkKhUKlpaVGF0IdEQewiCgtsqZ9GQqjQ56H1VV4XAA2\nxXkqlojMi8GOiNKyNByNKAqAqUUWGN/Nhj5uN4DtqaQ+0ZCIyIQY7IgoLQuCQQAem22Mv4Ou\nQKpwuwCoGrZapEEuEXVADHZElJZPgyEAEwoCTlta113IPxUNkzu5foKITIvBjohapwGfB0MA\nphZ10Al2AHq4nA5BALCJHU+IyKwY7IiodSujsRpJRgdeOQFAFISebheAzRyxIyKzYrAjotbp\n52HtgjC+wAJXn8uePm4ujCUiU2OwI6LW6a2JxwT8/o59lSR9mh3n2BGRaTHYEVHrPguG0LHP\nw+oY7IjI5BjsiKgVG+MJvcEHg53e8aQqJcUU1ehaiIiawWBHRK3QJ9gJwKQOH+z0HsUa108Q\nkVkx2BFRK/RgN9TnLXXYja7FYPpVxQBsZscTIjIlBjsiasWCer2DXQe9klhTXZxOr2gDp9kR\nkVkx2BFRS3anpHXxODjBDgAgAL1cLrBHMRGZFYMdEbVEv0QsgEmFHbqDXSMujCUiM2OwI6KW\n6B3s+nrcPV0uo2sxhQqPG5xjR0RmxWBHRC3RV05M5XnYBg0Xn+CIHRGZEYMdER1SUFa+jcbA\nCXZN6Kdi62S5XpaNroWI6EAMdkR0SJ8HQ4qmAZhSxGC3l96jGDwbS0SmxGBHRIekn4ft4nQO\n8HiMrsUs9BE7cP0EEZkSgx0RHZK+JJbnYZsqcdgL7SKATXGO2BGR6TDYEVHz4qq6JBwFz8Me\npLdbXxjLETsiMh0GOyJq3lehcFJVwSWxB9Gn2bFHMRGZEIMdETVPv5JYoV0c5vMaXYu5sEcx\nEZkWgx0RNU9fOTG5sEAUBKNrMRe9lR1XxRKRCTHYEVEzZE37KhQGV040Rx+xiyrKHkkyuhYi\nov0w2BFRM5aGo2FFATClsNDoWkxHv6oYuDCWiMyHwY6ImvFpMAjAY7MdFfAbXYvp9GnoUcxp\ndkRkNgx2RNQMfYLdhIKA08YJdgcKiGInhwMMdkRkPgx2RHQgDfgsGAI72B1aBddPEJEpMdgR\n0YFWRWM1kgyunDi0Pux4QkSmxGBHRAdaEAwBsAvC+IKA0bWYVIXHBS6eICLzYbAjogN9Wh8C\nMDrgC4ii0bWYlN7xpDKZUDWjSyEiaoLBjogOpE+wm8pGJ4emB7uUqu1IpYyuhYhoHwY7ItrP\npkRiazIJTrBrETueEJE5MdgR0X70S8QKwCQGu0Pr7XbpfWA2M9gRkZkw2BHRfvQOdkN93lKH\n3ehazMtts3VxOsH1E0RkMgx2RLQfPdjxPGyrKtjxhIjMh8GOiPbZnZLWxeJga+I0sEcxEZkQ\ngx0R7fNpMKS375jMEbvWsEcxEZkQgx0R7fNpMAigr8fd0+Uyuhaz00fstiVTksZedkRkFgx2\nRLSPviSWE+zSUeFxA1A0bSvPxhKRaTDYEdFeQVn5NhoDg1169MUT4NlYIjITBjsi2uvzYEjR\nNDDYpaeHy2kXBACbOGJHRKbBYEdEe+mNTjo7HUd4PUbXYgF2QejhcoI9ionITBjsiGivT3mJ\n2DZqaGXHETsiMgsGOyICgISqfh2OgB3s2kJfP7EpzhE7IjILBjsiAoAvQ+GkqoIT7NpC73jC\nETsiMg8GOyICGs7DFtrF4T6v0bVYht6jeHcqFVNUo2shIgIY7IhI92l9CMCkwgJREIyuxTL0\nETsN2JLkoB0RmQKDHRFB1rQvQ2HwPGwbsZUdEZkNgx0RYXksHlYUcElsG3V1Od02G7h+gohM\ng8GOiPBZKAzAY7ONCfiMrsVKBKA3108QkZkw2BERPg9HAIwvCLhs/JvQNvrZWPYoJiKT4B9x\noo5OA74MR8EJdu3ShyN2RGQmDHZEHd2aRLJalsHWxO3ScPEJjtgRkSkw2BF1dF/G4gDsgjCh\nIGB0LdZT4XEBqJXkoKwYXQsREYMdUYenB7vRAV9AFI2uxXr6NHQ84TQ7IjIDBjuiju7LaBzA\nFDY6aRe9RzGAzZxmR0QmwGBH1KFVplLbJQlcOdFenRwOfaST0+yIyAwY7Ig6NH24TgAmM9i1\nV8PCWAY7IjIegx1Rh6ZPsBvkcZc67EbXYlUVHjeATXGeiiUi4zHYEXVcu1KpeeEIgEkBv9G1\nWBg7nhCReTDYEXVQlYnklGXf7pRkANNLiowux8L09RNcPEFEZsBgR9QRrYnFpyz7dn08IQB3\ndy0/iRPsDoPe8SSiKNWSZHQtRNTRMdgRdTgro7Hjl3+3NZkUBeHh7l2uKi02uiJra+x4wguL\nEZHhGOyIOpbF4cgx33y7I5ly2oSXhwz8EU/CHjZ98QSATXFOsyMigzHYEXUg8+uDJ3zzXY0k\ne0Xbm8MGn1NWanRF+SAgivqaYq6fICLDMdgRdRTv1NRNW7EqrCh+UXx72JBTSngGNmP0aXZc\nP0FEhmOwI+oQXq6qPuu71XFVLbbb540cenwxLyCWSRXsUUxE5sCWpET57687dv183QZVQxen\nc+7IocN9XqMryjcNrew4YkdEBmOwI8pzj2/f+ct1GzWgt9s1b+Sw/g0z/SmD9PUTlYmkqsEm\nGF0NEXVgPBVLlM/u27Lt2nUbNWCQ1/PZqBFMdVmiXy42qaq7UimjayGiDo3Bjig/acANGzbd\nvLESwOiAf8Go4T1cTqOLylv6qVhwmh0RGY3BjigPKZp2xZr1D27dAWBcgf+DEUPLHA6ji8pn\nfdwu/QQsp9kRkbEY7IjyTUrVLly99u87dwM4rqjww5HDShycTZtdbputi9MJjtgRkdEY7IgM\nEFWUv+7YNb8+KGtaZvccV9WzVq7+T1U1gLM6lb47YohfFDP7FNSsCo8LvPgEERmN/48nMsCt\nm7Y8sm0HgBKH/ZSS4umlJT8oKSq2H+6/x7CiTP929fz6IICLOpc/O6i/XeASzRypcLu/CIZ5\nKpaIjMVgt5emaclkZv4iaw1jMJIkaZkej8k4SZJUVU1Y5/yRJElGl9A6WZY1TTvUUa2VlWd2\n7t77syS/uHvPi7v32AVhUsB/anHRqcUF/d3tWbtaJytnfL/260gMwFVdyh/s3VNOJuXWHqV/\nRCVJEkwfAVs+qobrabcD2BSPJxIJ/ajKsmzaahspimLmo9qUtY4qgBzX6W7X3w3KPwx2+2T8\nH2EqlZLlVr9YDaZpmuWCnf5H08xaPqqP7doTVRS7IDzbu8fSWPy9UPj7RFLWtPmh8PxQeFYl\n+rtd0woCJxf4J/i8aQ65VcnyjPWbVyeSAK4r73Rnl7JUsg3vqSzLqqqmf39DqKpq5gjSzSYA\n2J6SwvG40BBBzH9U9bRk2qPalH4w9XxvdC2t0DQt959VBjvSCeb/F2I5mqbV1NQACAQCLpfL\n6HJakUgkkslkYaEFLjBVXV0NwO/3m//vVzKZjMfjRUVFB/8qpqi9v/y6WpIu7Fz2wuAj9I2b\nE8m5tXVv19R9UFefbBIFiu32E4uLTi8tnt6ppIUTtVsSyROXr1wXjwOY1avHH/v2Tr/Umpoa\nTdN8Pp/H40n/UYZIJpOxWKy42KSXuP2oLnjC8u8AbJwwpjAWU1XV6/V6vWa/yIckSeFwuKSk\nxOhCWldXV6coisfj8fl8RtfSCkmSQqFQaWmp0YVQR8QRO6Kcembn7mpJAnBjz+6NG/u4XVd2\n63Jlty4xRf2wvv5/NXVvV9fuTKXqZPnVPdWv7qkWBWFCQWB6afH00pIh+18QbE0sftLylVuT\nSQF4sH/FdT265folEYCGHsUANsWTRxpbChF1YAx2RLmjaNqj23cAOKWkeJS/mVEHr2ibXloy\nvbTkLwP6LYtE3q6p/V9N3dJwRNG0z4Ohz4OhmzdW9vW4Ty8tnl5aMrWwcF08fvKKlTuSKVEQ\n/npEv8u7ds75a6K9erlddkGQNW1zInGki10DicgYDHZEufNKVfWGeALAb5oM1zXLJmBMwD8m\n4J/dp9emREIfw5sfDKZUbWM88ei2nY9u21lstyvQQrLitAkvDR54dhnP+xjJLgg9XM7NieSm\nRBIMdkRkEPaxI8oRDbh/63YARwX8xxe3YVJjhdt9bfeuc0cOrZ40/tWhgy7pUq5fRqJOlkOy\n4hVtbw0bwlQHAIm48tFcbdsWo55fv7AYexQTkYE4YkeUI+/X1i2PRAHM6tWjfXsIiOI5ZaXn\nlJUqmvZVKPJ2Te3KaOzmXj0mFgYyWqlVye++rXz5mfDZx44bbhV8/twXoE+zY7AjIgO1Kdip\nOzdu6Np3AIBE1eI//Om5OmfP6T+5+qS+/FIhat19W7YD6Otxn9XpcFcgioIwsTDAPNeUVrNH\nWbwQgBaNym++5rjw0tzX0MftBrCZPYqJyDjpBrtUcOGFU05/a0OXVHSlJtedOeSYuTVxAH95\n8Onn1nz7o14G/OeYyEIWhyOf1AcBzOrZXTR9K2ArkufOQUODQ3X5UvXIMbYhw3Ncg35VsZ3J\nVFLTOMmOiAyR7hy7l2fMfH1V6pLrrwVQteS6uTXxq+esrdv06WjHjhvP+082KyTKB/dt2Qag\ns9NxUZdyo2vJQ9quHerypQDE404SOncFIP/fK4jHclyGPsdOA7amLHB9FCLKS+kGu3sXVfU+\n45W//f5nAFbcvcBVOOWRaQOK+kx+5Mf9a759MJsVElnehnjijepaAL/q0c1j44qlzJPffQua\nJvh89mNPsp9zIWw2LRyS33kjx2VUNLTOrkylcvzURES6dL9jtiTlTkf31H/+56I9pSOuFwEA\nvr4+Ob4hO7UR5Yn7tmxTNC0gij/v1sXoWvKQunmj+v0qAOJxJ8PttvXqLU6cCkBZ/KW6dnUu\nK+nmcrptNgCVHLEjIoOkG+wmFbi2v/MNgGT9By/tiY3+7Wh9+9dvbnN4B2WrOiLr252S/r17\nD4CrunUpOvRlwajdlPf/B0AoLBQnTNa32E85XSgtg35CNpm7pQwC0NPlArBVYrAjImOkG+zu\nuvSInQsum/7T686fcr5gL7l3alc5sf4v9/z8qs93lY+/KaslElnaw9t2JFTVIQi/7NHV6Fry\nkPr9SnXjegDiSafB0bBiweG0n3M+BEGrq5XfezuX9ejrJyqTDHZEZIx0g92E+z+aPXPUB/94\n9K3ViUv//MFwnyNR8+YvbnvK1X3y86+endUSiawrrChP7dgF4KIu5fpYDmWSpsnvvwNA6FQu\njhnX9De2vgPEsUcDUBZ+qm7K3XQRfZod59gRkVHSDXY2e+kdryyOhKtqo+FnfjkKgLt42hvv\nfr5t8/xjivl1RdS8p3bsqpdlAbi+Rzeja8lD6vKl2o5tAOynnI6DVqXYT5shFBVD0+TXXkKu\nzo1WuF0AtvBULBEZpG0L9DYs/PCh26+//NKLn9sdkxM7inr0LxTZkYuoeZKmPbZtJ4AzOpUM\n9XmNLifvKIo8dw4AoXtP27CRzdzB7bafdR4ArbpKnvduborSexTXykpEVXPzjERETaUf7LQn\nL5s06MTz7/rTI//457+/jqTCWx89bkSXY698QtayWB+Rdf1rV9XWEFH7awAAIABJREFUZBLA\nTT3beQ0xaoGyeKFWsweAfdp0HKLns23QENuoowAoCz7KzTVkGzuebJXkHDwdEdEB0g12G144\n++rnvjjh6oeXr9uubykecP+9Vx49/2/XnPHU91krj8iqNODBbTsATCks4LW/Mk+WlI/mArBV\n9LMNaGlhvv2MHwr+AFRVevXFxktTZI++eAJAZZLT7IjIAOkGu7tv+KBk8M3zHv/ViP57pwrZ\nvYNufurzu4aXzp/9+6yVR2RVc4KhVdEYgJt6dTe6ljykfD5fC9YDEKed0fI9Ba/PfuY5ALRd\nO5SPP8h2YWUOh18UwWl2RGSQdIPda9XxfpdeePD2sy7um6jJaTcBIkt4tKoawGCv59SSEqNr\nyTuJuPLJhwBsQ4bbele0enfbiFH6JDz5o/e1XTuzXV0ftwvsUUxEBkk32PVyieF1oYO3160M\nii4u9yPaz2ehyKJoHMDNvXrYuL4o0+T5H2qxKATBfvKpaT7EPmMmvF4oivTai8jysgZ9mh17\nFBORIdINdreML1///MVfVieabozt+OiyVzZ2GjUrC4URWdgDO3YC6OFynl9eZnQt+UaLRpTP\n5wMQR48VuqZ7mlsIFNhPOwuAtrVS+eyT7JUHjtgRkaHSDXZnv/LXXsKWYyqOvOrG3wFY+fKz\nv//NpUMG/GCL2vWxV8/NZoVEFrM6Fn+/Pgjg+p7dnRyvyzRl3ntIJiGK4onT2vRA8ajxtoGD\nAchz39Gq92SnOgCo8LgBbGGwIyIjpBvsPGWnLlv+1g/H2p55cDaAT2674c4Hng9MmPn6shU/\n7OrLYoFEVvOHym2qhiJR/GnXzkbXkm+EYL2y6AsA4vhJQklpWx9uP/t8uFyQJPk/z0PLVqMm\nvUdxRFVr5awvwiUiOkAbLkleMGDaix9N+/ueTSs37JBFT48BQ3sU8ZoTRPvZlky9smcPgJ92\nKgmIotHl5BvnZx9DluF0isef3I6HC0XF9mlnyG+8qlZuUr76XJwwOeMVokkru83JZA+w0w0R\n5VRLwe7NN99s4be7d2xd0vDzmWeembmSiCzsga3bU6rmttmuKONi2Eyr2iWuXAFAnHysECho\n3z7ECZPV5UvVTRvkd96wHTG4HcN+rWoa7LKSHImIDq2lYDdjxow096Jl7aQGkYXUSvIzO3cD\nuKistNzehuFwSsu896Cq8HjsU49v/04EwX7OhamH/4hUSv7vS46fXn2oq1a0W4FdLLaLdbJS\nmeQ0OyLKtZa+ez755JPGn1Wp6vYfXbo43u3ya688fsKwIjGxbuXCp+5/bGfPcz6Z82DWyySy\ngid27IwoiigI13XrAo2XCs0kbdsWrFkFwH7cSfAc1oV3hU5l9pNOlee8qa5fqyxdLI4Zl6Ea\n96lwOupkZX0i0fpdiYgyqqVgd8wxxzT+/PHPhi2ODVhQ+dX4kr3z6k469awrr77s2K6jzrn1\notV/b898F6J8klDVJ7fvAnBOWWk/tysejxtdUV6R57wFTdN8fnHi1MPfmzjlOGXFMm3bFvmt\n/9r6DxQKCw9/n031d7mWxhLrEsnM7paIqFXproq96cV1/X78l8ZUp7N7Bz/00yM2vHJjFgoj\nsphnd+7elUoB+E1PXkMsw9R136sb1gKQJh8LhzMDe7TZHOddBLsdibj8+isZ2OH++rucANZx\nxI6Ici7dYLc+Ltuczd3ZBiW5LZMVEVmQomkPbdsB4MTiojEBv9Hl5BdNU+a+AwDFJfKI0Zna\nq1DeWTz2JADq6u/Ub7/J1G51erCrkuR6Wc7snomIWpZusDu3zLv+X7M2J/dry6Qkt9zy93Xe\n8vOzUBiRlby6p2Z9PAFgVi8O12WY+t1ydUslAJxwCjLaQcZ+wg+Ebj0AyK+/okUjGdxzP+fe\nYcW1MQ7aEVFOpRvsbn3qwmT9/JHDpj3879e/XLZ69TdfvfnCo6cOHzGvLnHBX27OaolkLEXT\n5tcHowpbrbbkT1u3Axjl951YXGR0LflFVeW57wAQunTD8CMzvHObzTHzQoiiFo0qb7+ewR33\nc7n0a46siccyuFsiolal25Gh1xlPf/Sw/dybnv71xR80bhSdZb94+MMnzuiVndrIFO6u3DZ7\n85bTS0veHj7Y6FpMal5d/dJwBMBNvXoYXUu+UZYs0qp2A7BPmy5lui8JAKFbD3Hyscr8D5Vl\ni20jjrQNGZ6R3XpsQneHY2tKWhPjGhoiyqk2tNo67ldP7Lj8N+//74PvNuyQbO7u/YefeOrJ\nvfxs1pXnFgSDAP5XU7swFD66gG30m3Hflu0A+nrcM8sy3+22Q1MU5aP3Adj69LUNGopkVhaZ\n2k8+TV39nVa1W379P86K/vB4MrLbfk7n1pTEU7FElGNti2WOQJ/TL7ji9CzVQqa0IrL3XNLs\nzVveHzHU2GJMaHkk+mFdPYAbe3YXszCk1JEpXyzQamsAiD84LYtPY7fbz7lQ+svDWigov/uW\n/ezzMrLXfi7nJ5HoWna9IaLcainYjRo1SrC5li75Uv+5hXsuW7Ysw3WROWxLpqqlvd3z59bW\n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\ncqpw+nR/h0M6x+fkiyuWw2ph1VVcWn83z8rXafdbLNSjmAS+ufFx/tt0sZNPSspILa+Iam46\ncOS7Bcer3Dz9+CdUMSqOV7q+bERMp9cPRO4mdr812YY/+v2ia4d7NRriMwVtZvmTi796nRxp\nYWL8a9UHGxzOXxobz4r1eilDkdmyvc2EgN8fVty4VlyzCgA/YJDiXBoUD1x8egZUKtjtUnGR\n4HZil6fTwEiFsYT0WGTWNUz84c0ax525coEqu2vahEMXvvvJNfnuX+S1FTVTL8iUv/7sub2R\nef+JzIrv+2UDgbvVwOMiVJoEv9VOEo+T52HVPJ/rp+7ERzo1IlxeS+6b7cW+rDcA0PC8D5LI\nXpP27nJ+/xUALiVNufAKNyf4iH8IAp+RjR62KZYLY0stVgdj3R5MCOmgiZn1wvSUh8bPefOL\nZQXbNj5304SX1lVfdkFGjy7y46XT//3Jj1s2/vb8jVMX7Wy5/4OzPXLZQODuu8ULj03bcveV\nW+row2WIkHeJHRymUwbG1gULEuIA/GBoaHI6vf1acj3szJjoiECdh2VVFY4lH0CSuJhY5RXX\nQeW3RoPETXLTE6msFG63f5I/zDgYK7fS/hOE9MzNP2196LyYJ2+YN3rC7I92JH/8x5/To3vw\nd1JQJf/y/NyvHr1m/OTz3tuK/3yz65aB0X2/bIDgmLsfFsWbB8QvLtdOnTk5Le7YJZBvv/22\nxyMLXowxo9EIIDw8XK0O0N+JU7bu+LO17YqkhNcz0mw2W2RkpH/jKbFYczdtZcC7+TlXJid2\neozBYACg1+s1fWi8V2i2DNj8F4BPB+UtSHCvRqvnbDabxWKJiupNH0tmNDhef4G1tUKnU91w\nOxff+d3wFKPRyBgLCwvTBsCkvGs2m81sNkdHB2IPP1ZdZX/5PwCU197MZ+c2NDRIkqTT6XRd\nV50ftNv7rf8TwI9DB8723+Cxw+FobW2NiQnc0esOjY2NoihqtdqwsDB/x9INh8PR0tISG+C1\nWSREubvGbu0/J7xa2Ag0rlz2zfHFE5TYBReRsd1mM4Bh+kD5+5it1YyJCN/Y0rqkrr6rxM4j\n5HpYDc/PCsh3MmY63LJOoVRedq23szriKVy/VC4sjJlMUnEhn53rzinJKlWEQmhxioVmy2xK\nAAghHuLuVOwNr27Rp12wodzosFqO59UQicftt1jNogRgeMAkdgAWJsYDWN3UXGWzee9V5HrY\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# line graphs for number of rides on each hours of the day\n",
    "\n",
    "trip2020_new %>%\n",
    "  group_by(member_casual, hour) %>%\n",
    "  summarize(number_of_riders = n()) %>% \n",
    "  ggplot(aes(x = hour, y = number_of_riders, group = member_casual, color = member_casual)) + \n",
    "  geom_line() + \n",
    "  labs (title = \"Number of Rides Per Hour of Day\", x = \" Hours(24)\", y = \" Number of Rides\") + \n",
    "  theme_minimal()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d6bbffad",
   "metadata": {
    "papermill": {
     "duration": 0.231597,
     "end_time": "2022-03-10T14:46:34.875310",
     "exception": false,
     "start_time": "2022-03-10T14:46:34.643713",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Casual riders use bike more in the middle of day.\n",
    "\n",
    "Member riders use bike the most in the middle of day, and more in the morning time. \n",
    "\n",
    "Both group use bikes less late of the day. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "6ebefac0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-03-10T14:46:35.388628Z",
     "iopub.status.busy": "2022-03-10T14:46:35.386457Z",
     "iopub.status.idle": "2022-03-10T14:46:35.962769Z",
     "shell.execute_reply": "2022-03-10T14:46:35.960989Z"
    },
    "papermill": {
     "duration": 0.815435,
     "end_time": "2022-03-10T14:46:35.962934",
     "exception": false,
     "start_time": "2022-03-10T14:46:35.147499",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Bar chart for number of rides by bike type\n",
    "\n",
    "trip2020_new %>%\n",
    "  group_by(member_casual, rideable_type) %>%\n",
    "  summarize(mean_length = round(mean(ride_length)), count = n()) %>%\n",
    "  ggplot(aes(x = rideable_type, y = count, color = member_casual, fill = member_casual)) + \n",
    "  geom_bar(stat = \"identity\") + \n",
    "  facet_wrap(~member_casual) + \n",
    "  labs (title = \"Number of Rides by Bike Type\" , x = \" Type of Bike\", y = \"Number of Rides\") + \n",
    "  theme_minimal() + \n",
    "  theme(axis.text.x = element_text(angle = 90, size = 10))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70d68bf3",
   "metadata": {
    "papermill": {
     "duration": 0.236256,
     "end_time": "2022-03-10T14:46:36.435756",
     "exception": false,
     "start_time": "2022-03-10T14:46:36.199500",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Both member and casual prefer docked_bike type. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "df930f01",
   "metadata": {
    "papermill": {
     "duration": 0.241211,
     "end_time": "2022-03-10T14:46:36.915987",
     "exception": false,
     "start_time": "2022-03-10T14:46:36.674776",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "****6. Act - my top three recommendations based on your analysis****\n",
    "\n",
    "* Create your portfolio.\n",
    "* Add your case study.\n",
    "* Practice presenting your case study to a friend or family member."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5c3f3d2b",
   "metadata": {
    "papermill": {
     "duration": 0.240371,
     "end_time": "2022-03-10T14:46:37.392123",
     "exception": false,
     "start_time": "2022-03-10T14:46:37.151752",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Based on my analysis, casual rider seems to rider more on weekend and winter season.\n",
    "\n",
    "Member riders seems to use the bikes for more commuting purpose on weekdays and warmer season. \n",
    "\n",
    "Both group tend to use bike more in the day than night time.\n",
    "\n",
    "Both group prefer to use docked bikes.\n",
    "\n",
    "My top 3 recommendation are :\n",
    "\n",
    "1. **Focus on the time where casual riders use bikes more often, like weekend and and offer some promotion or discount on membership at during that time.**\n",
    "1. **Create different type of membership with variety of options like weekend membershipt targeting the casual riders on the weekend or seasonal membership targeting the casul riders on winter time.**\n",
    "1. **Increase the number of docked bikes for more availability based on the overall bike popularity.**"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 375.203446,
   "end_time": "2022-03-10T14:46:37.969607",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-03-10T14:40:22.766161",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
