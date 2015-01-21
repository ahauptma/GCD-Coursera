# Codebook for run_analysis.R

30 subjects volunteered to have their body movements measured by waist-mounted cell phones as they did six different common activities.  Each row in this data corresponds to one subject-activity combination and each column to a type of measurement.  The value is the average value of the measurement across all repetitions of the activity done by the subject.  These values are dimensionless; they were normalized between -1 and 1 in an earlier data set which held the measurement values for each repetition of each activity.

## Variable Names
* subject: The test subject performing the activity. (integer 1:30)
* activity.description: The activity performed. (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* measurement variables: Average of normalized measurements for this subject and activity. (numeric -1:1)

## Measurement Variable Naming Conventions
* (timeDomain|frequencyDomain).(Body|Gravity).(Accelerometer|Gyroscope).(Acceleration|Jerk).(mean|std).(X|Y|Z|Magnitude)
* timeDomain: Measurement relates to the time domain (i.e. extent of movement on relevant access)
* frequencyDomain: Measurement relates to the frequency domain (i.e. frequency of repetitive motions)
* Body: Measurement relates to movement of body
* Gravity: Measurement relates to gravitional force
* Accelerometer: Measurement was taken with phone's accelerometer
* Gyroscope: Measurement was taken with phone's gyroscope
* Acceleration: Measurement relates to body or gravity's acceleration
* Jerk: Measurement relates to body or gravity's jerk (rate of change of acceleration)
* mean: Measurement has been averaged across duration of activity
* std: Measurement describes standard deviation of underlying measurements across duration of activity
* X/Y/Z: Measurement describes movement along X, Y or Z axis
* Magnitude: Measurement describes absolute magnitude of movement (sqrt(X^2 + Y^2 + Z^2))

For more details, please see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
