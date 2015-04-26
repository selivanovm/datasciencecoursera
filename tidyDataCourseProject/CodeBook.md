## Code Book - Human Activity Recognition Using Smartphones Dataset

1. Raw Data

  Files with data represent two data sets with measurement results for two subject groups. 
  For both data sets there are several files described below:
  ```
  /folder_with_script/run_analysis.R           -- the script
  /folder_with_script/features.txt             -- all feature labels
  /folder_with_script/activity_labels.txt      -- activity labels
  
  /folder_with_script/train/X_train.txt        -- training data set features
  /folder_with_script/train/y_train.txt        -- training data set activity labels
  /folder_with_script/train/subject_train.txt  -- training data set subject ids
  
  /folder_with_script/test/X_test.txt          -- test data set features
  /folder_with_script/test/y_test.txt          -- test data set activity labels
  /folder_with_script/test/subject_test.txt    -- test data set subject ids
  ```

2. Processing

  1. Loading test and training data sets
     
     On the first step the script loads features into data frame, then for loads correspoding activity labels and subjects' ids.
     Finally it merges data frames with features, activity labels and subject ids by columns into one data frame.
     So, the first two columns in the resulting data set will be called "ActivityName" and "SubjectId", 
     the rest of the columns will countain features data; labels for that columns are taken from the file features.txt. 
       
     This is done for both training and test data sets; two data frames called 'testFeatures' and 'trainFeatures' appear as as a result of running this step.
  
  2. Merge two data sets
    
     On that steps testFeatures and trainFeatures data frames from the first step are merged by rows into single data frame called 'features'.
  
  3. Extract columns with mean and standard deviation measurements(and subject/activity data as well)
  
     This step is aimed to remove all unneeded columns from the 'features' data frame. 
     'Unneeded' columns are those that are not 'ActivityName', 'SubjectId' and doesn't contain standard deviation or mean of measured values.
     Information about kind of measurement is encoded into column names, we need to take only those columns whose name contains 'std()' or 'mean()'.
     We need to take into account that column names have dots instead of brakets, after we added the column names to data frames.
     
  4. Set activity labels levels so they have understandable names
  
     In the step 1 "ActivityName" and "SubjectId" columns were added to testFeatures and trainFeatures data frames, they have 'factor' as a class and
     represented as numeric values. In this step script loads a vector of activity names from activity_labels.txt and set this vector as a levels for 
     "ActivityName" column of 'features' data frame.
     
  5. Set appropriate labels for the data set variables
  
     Now script makes 'features' data frame column names more readable by replacing in them encoded characters and abbreviations with full words.
     
  6. Create a tidy data set
     
     Now, script groups measurement values in 'features' data frame by activity name and subject id and for each group it calculates average.
     To make data more readable resulting data set called 'tinyDataSet' is ordered by ActivityName and SubjectId

3. Tidy Data
```
  ActivityName
    Activity name
      1 WALKING
      2 WALKING_UPSTAIRS
      3 WALKING_DOWNSTAIRS
      4 SITTING
      5 STANDING
      6 LAYING
      
  SubjectId
    Experiment subject identifier
      1..30
    
  time.BodyAccelerometer.mean.X
  
    Body accelerometer value mean, X axis, time domain
    
  time.BodyAccelerometer.mean.Y
    Body accelerometer value mean, Y axis, time domain    
    
  time.BodyAccelerometer.mean.Z
    Body accelerometer value mean, Z axis, time domain
    
  time.BodyAccelerometer.standard.deviation.X
    Body accelerometer value standard deviation, X axis, time domain
    
  time.BodyAccelerometer.standard.deviation.Y
    Body accelerometer value standard deviation, Y axis, time domain
    
  time.BodyAccelerometer.standard.deviation.Z
    Body accelerometer value standard deviation, Z axis, time domain
    
  time.GravityAccelerometer.mean.X
    Gravity accelerometer mean value, X axis, time domain
    
  time.GravityAccelerometer.mean.Y
    Gravity accelerometer mean value, Y axis, time domain
    
  time.GravityAccelerometer.mean.Z
    Gravity accelerometer mean value, Z axis, time domain
    
  time.GravityAccelerometer.standard.deviation.X
    Gravity accelerometer standard deviation value, X axis, time domain
    
  time.GravityAccelerometer.standard.deviation.Y
    Gravity accelerometer standard deviation value, Y axis, time domain
    
  time.GravityAccelerometer.standard.deviation.Z
    Gravity accelerometer standard deviation value, Z axis, time domain
    
  time.BodyAccelerometerJerk.mean.X
    Body accelerometer mean value, X axis, time domain
    
  time.BodyAccelerometerJerk.mean.Y
    Body accelerometer mean value, Y axis, time domain
    
  time.BodyAccelerometerJerk.mean.Z
    Body accelerometer mean value, Z axis, time domain
    
  time.BodyAccelerometerJerk.standard.deviation.X
    Body accelerometer standard deviation value, X axis, time domain
    
  time.BodyAccelerometerJerk.standard.deviation.Y
    Body accelerometer standard deviation value, Y axis, time domain
    
  time.BodyAccelerometerJerk.standard.deviation.Z
    Body accelerometer standard deviation value, Z axis, time domain
    
  time.BodyGyroscope.mean.X
    Body gyroscope mean value, X axis, time domain
    
  time.BodyGyroscope.mean.Y
    Body gyroscope mean value, Y axis, time domain
    
  time.BodyGyroscope.mean.Z
    Body gyroscope mean value, Z axis, time domain
    
  time.BodyGyroscope.standard.deviation.X
    Body gyroscope standard deviation, X axis, time domain
    
  time.BodyGyroscope.standard.deviation.Y
    Body gyroscope standard deviation, Y axis, time domain
    
  time.BodyGyroscope.standard.deviation.Z
    Body gyroscope standard deviation, Z axis, time domain
    
  time.BodyGyroscopeJerk.mean.X
    Body gyroscope jerk mean value, X axis, time domain
    
  time.BodyGyroscopeJerk.mean.Y
    Body gyroscope jerk mean value, Y axis, time domain
    
  time.BodyGyroscopeJerk.mean.Z
    Body gyroscope jerk mean value, Z axis, time domain
    
  time.BodyGyroscopeJerk.standard.deviation.X
    Body gyroscope jerk standard deviation, X axis, jerk time domain
    
  time.BodyGyroscopeJerk.standard.deviation.Y
    Body gyroscope jerk standard deviation, Y axis, time domain
    
  time.BodyGyroscopeJerk.standard.deviation.Z
    Body gyroscope jerk standard deviation, Z axis, time domain
    
  time.BodyAccelerometer.Magnitude.mean.
    Body accelerometer magnitude value, time domain
    
  time.BodyAccelerometer.Magnitude.standard.deviation.
    Body accelerometer magnitude standard deviation value, time domain
    
  time.GravityAccelerometer.Magnitude.mean.
    Gravity accelerometer magnitude mean value, time domain
    
  time.GravityAccelerometer.Magnitude.standard.deviation.
    Gravity accelerometer mean magnitude standard deviation value, time domain
    
  time.BodyAccelerometerJerk.Magnitude.mean.
    Gravity accelerometer jerk magnitude mean value, time domain
    
  time.BodyAccelerometerJerk.Magnitude.standard.deviation.
    Gravity accelerometer jerk magnitude standard deviation value, time domain
    
  time.BodyGyroscope.Magnitude.mean.
    Body gyroscope magnitude mean value, time domain
    
  time.BodyGyroscope.Magnitude.standard.deviation.
    Body gyroscope magnitude standard deviation, time domain
    
  time.BodyGyroscopeJerk.Magnitude.mean.
    Body gyroscope jerk mean value, time domain
    
  time.BodyGyroscopeJerk.Magnitude.standard.deviation.
    Body gyroscope jerk magnitude standard deviation value, time domain
    
  frequency.BodyAccelerometer.mean.X
    Body accelerometer mean value, X axis, frequency domain
    
  frequency.BodyAccelerometer.mean.Y
    Body accelerometer mean value, Y axis, frequency domain
    
  frequency.BodyAccelerometer.mean.Z
    Body accelerometer mean value, Z axis, frequency domain
    
  frequency.BodyAccelerometer.standard.deviation.X
    Body accelerometer standard deviation value, X axis, frequency domain
    
  frequency.BodyAccelerometer.standard.deviation.Y
    Body accelerometer standard deviation value, Y axis, frequency domain
    
  frequency.BodyAccelerometer.standard.deviation.Z
    Body accelerometer standard deviation, value, Z axis, frequency domain
    
  frequency.BodyAccelerometerJerk.mean.X
    Body accelerometer jerk mean value, X axis, frequency domain
    
  frequency.BodyAccelerometerJerk.mean.Y
    Body accelerometer jerk mean value, Y axis, frequency domain
    
  frequency.BodyAccelerometerJerk.mean.Z
    Body accelerometer jerk mean value, Z axis, frequency domain
    
  frequency.BodyAccelerometerJerk.standard.deviation.X
    Body accelerometer jerk standard deviation value, X axis, frequency domain
    
  frequency.BodyAccelerometerJerk.standard.deviation.Y
    Body accelerometer jerk standard deviation value, Y axis, frequency domain
    
  frequency.BodyAccelerometerJerk.standard.deviation.Z
    Body accelerometer jerk standard deviation value, Z axis, frequency domain
    
  frequency.BodyGyroscope.mean.X
    Body gyroscope mean value, X axis, frequency domain
    
  frequency.BodyGyroscope.mean.Y
    Body gyroscope mean value, Y axis, frequency domain
    
  frequency.BodyGyroscope.mean.Z
    Body gyroscope mean value, Z axis, frequency domain
    
  frequency.BodyGyroscope.standard.deviation.X
    Body gyroscope standard deviation value, X axis, frequency domain
    
  frequency.BodyGyroscope.standard.deviation.Y
    Body gyroscope standard deviation value, Y axis, frequency domain
    
  frequency.BodyGyroscope.standard.deviation.Z
    Body gyroscope standard deviation value, Z axis, frequency domain
    
  frequency.BodyAccelerometer.Magnitude.mean.
    Body accelerometer magnitude mean value, frequency domain
    
  frequency.BodyAccelerometer.Magnitude.standard.deviation.
    Body accelerometer magnitude standard deviation value, frequency domain
    
  frequency.BodyAccelerometerJerk.Magnitude.mean.
    Body accelerometer jerk magnitude mean value, frequency domain
    
  frequency.BodyAccelerometerJerk.Magnitude.standard.deviation.
    Body accelerometer jerk magnitude standard deviation value, frequency domain
    
  frequency.BodyGyroscope.Magnitude.mean.
    Body gyroscope magnitude mean value, frequency domain
    
  frequency.BodyGyroscope.Magnitude.standard.deviation.
    Body gyroscope magnitude standard deviation value, frequency domain
    
  frequency.BodyGyroscopeJerk.Magnitude.mean.
    Body gyroscope jerk magnitude mean value, frequency domain
    
  frequency.BodyGyroscopeJerk.Magnitude.standard.deviation.
    Body gyroscope jerk magnitude standard deviation value, frequency domain
```
