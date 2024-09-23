@implementation ALActivityLog

- (void)dealloc
{
  objc_super v3;

  -[ALActivityLog setActivityOverrideMsg:](self, "setActivityOverrideMsg:", 0);
  -[ALActivityLog setBodyMetrics:](self, "setBodyMetrics:", 0);
  -[ALActivityLog setMotionState:](self, "setMotionState:", 0);
  -[ALActivityLog setStepCountData:](self, "setStepCountData:", 0);
  -[ALActivityLog setSessionCatherineData:](self, "setSessionCatherineData:", 0);
  -[ALActivityLog setJacksonData:](self, "setJacksonData:", 0);
  -[ALActivityLog setStrideCalData:](self, "setStrideCalData:", 0);
  -[ALActivityLog setSedentaryAlarmData:](self, "setSedentaryAlarmData:", 0);
  -[ALActivityLog setAllDayHeartRate:](self, "setAllDayHeartRate:", 0);
  -[ALActivityLog setFitnessTracking:](self, "setFitnessTracking:", 0);
  -[ALActivityLog setOdometer:](self, "setOdometer:", 0);
  -[ALActivityLog setIdsStatus:](self, "setIdsStatus:", 0);
  -[ALActivityLog setStairClimbingModel:](self, "setStairClimbingModel:", 0);
  -[ALActivityLog setRowingModel:](self, "setRowingModel:", 0);
  -[ALActivityLog setExerciseMinute:](self, "setExerciseMinute:", 0);
  -[ALActivityLog setElevation:](self, "setElevation:", 0);
  -[ALActivityLog setCoarseElevation:](self, "setCoarseElevation:", 0);
  -[ALActivityLog setCalorieData:](self, "setCalorieData:", 0);
  -[ALActivityLog setWorkoutEvent:](self, "setWorkoutEvent:", 0);
  -[ALActivityLog setNatalieData:](self, "setNatalieData:", 0);
  -[ALActivityLog setSedentaryAlarmDataDeprecated:](self, "setSedentaryAlarmDataDeprecated:", 0);
  -[ALActivityLog setStrideCalDataDeprecated:](self, "setStrideCalDataDeprecated:", 0);
  -[ALActivityLog setCalorieDataDeprecated:](self, "setCalorieDataDeprecated:", 0);
  -[ALActivityLog setCoarseElevationDeprecated:](self, "setCoarseElevationDeprecated:", 0);
  -[ALActivityLog setElevationDeprecated:](self, "setElevationDeprecated:", 0);
  -[ALActivityLog setWorkoutEventDeprecated:](self, "setWorkoutEventDeprecated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALActivityLog;
  -[ALActivityLog dealloc](&v3, "dealloc");
}

- (BOOL)hasActivityOverrideMsg
{
  return self->_activityOverrideMsg != 0;
}

- (BOOL)hasBodyMetrics
{
  return self->_bodyMetrics != 0;
}

- (BOOL)hasMotionState
{
  return self->_motionState != 0;
}

- (BOOL)hasStepCountData
{
  return self->_stepCountData != 0;
}

- (BOOL)hasSessionCatherineData
{
  return self->_sessionCatherineData != 0;
}

- (BOOL)hasJacksonData
{
  return self->_jacksonData != 0;
}

- (BOOL)hasStrideCalData
{
  return self->_strideCalData != 0;
}

- (BOOL)hasSedentaryAlarmData
{
  return self->_sedentaryAlarmData != 0;
}

- (BOOL)hasAllDayHeartRate
{
  return self->_allDayHeartRate != 0;
}

- (BOOL)hasFitnessTracking
{
  return self->_fitnessTracking != 0;
}

- (BOOL)hasOdometer
{
  return self->_odometer != 0;
}

- (BOOL)hasIdsStatus
{
  return self->_idsStatus != 0;
}

- (BOOL)hasStairClimbingModel
{
  return self->_stairClimbingModel != 0;
}

- (BOOL)hasRowingModel
{
  return self->_rowingModel != 0;
}

- (BOOL)hasExerciseMinute
{
  return self->_exerciseMinute != 0;
}

- (BOOL)hasElevation
{
  return self->_elevation != 0;
}

- (BOOL)hasCoarseElevation
{
  return self->_coarseElevation != 0;
}

- (BOOL)hasCalorieData
{
  return self->_calorieData != 0;
}

- (BOOL)hasWorkoutEvent
{
  return self->_workoutEvent != 0;
}

- (BOOL)hasNatalieData
{
  return self->_natalieData != 0;
}

- (BOOL)hasSedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated != 0;
}

- (BOOL)hasStrideCalDataDeprecated
{
  return self->_strideCalDataDeprecated != 0;
}

- (BOOL)hasCalorieDataDeprecated
{
  return self->_calorieDataDeprecated != 0;
}

- (BOOL)hasCoarseElevationDeprecated
{
  return self->_coarseElevationDeprecated != 0;
}

- (BOOL)hasElevationDeprecated
{
  return self->_elevationDeprecated != 0;
}

- (BOOL)hasWorkoutEventDeprecated
{
  return self->_workoutEventDeprecated != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALActivityLog;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALActivityLog description](&v3, "description"), -[ALActivityLog dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  ALActivityOverrideMsg *activityOverrideMsg;
  ALCLBodyMetrics *bodyMetrics;
  ALMotionState *motionState;
  ALCLStepCountEntry *stepCountData;
  ALCLSessionCatherine *sessionCatherineData;
  ALCLJacksonData *jacksonData;
  ALCLStrideCalEntry *strideCalData;
  ALCLSedentaryAlarmData *sedentaryAlarmData;
  ALCLAllDayHeartRate *allDayHeartRate;
  ALCMFitnessTracking *fitnessTracking;
  ALCLOdometer *odometer;
  ALCLIDSStatus *idsStatus;
  ALCLStairClimbingModel *stairClimbingModel;
  ALCLRowingModel *rowingModel;
  ALCMExerciseMinute *exerciseMinute;
  ALCMElevation *elevation;
  ALCMCoarseElevation *coarseElevation;
  ALCMCalorieData *calorieData;
  ALCMWorkoutEvent *workoutEvent;
  ALCLNatalieDataDeprecated *natalieData;
  ALCLSedentaryAlarmDataDeprecated *sedentaryAlarmDataDeprecated;
  ALCLStrideCalEntryDeprecated *strideCalDataDeprecated;
  ALCMCalorieDataDeprecated *calorieDataDeprecated;
  ALCMCoarseElevationDeprecated *coarseElevationDeprecated;
  ALCLElevationDeprecated *elevationDeprecated;
  ALCMWorkoutEventDeprecated *workoutEventDeprecated;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  activityOverrideMsg = self->_activityOverrideMsg;
  if (activityOverrideMsg)
    objc_msgSend(v3, "setObject:forKey:", -[ALActivityOverrideMsg dictionaryRepresentation](activityOverrideMsg, "dictionaryRepresentation"), CFSTR("activityOverrideMsg"));
  bodyMetrics = self->_bodyMetrics;
  if (bodyMetrics)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLBodyMetrics dictionaryRepresentation](bodyMetrics, "dictionaryRepresentation"), CFSTR("bodyMetrics"));
  motionState = self->_motionState;
  if (motionState)
    objc_msgSend(v3, "setObject:forKey:", -[ALMotionState dictionaryRepresentation](motionState, "dictionaryRepresentation"), CFSTR("motionState"));
  stepCountData = self->_stepCountData;
  if (stepCountData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLStepCountEntry dictionaryRepresentation](stepCountData, "dictionaryRepresentation"), CFSTR("stepCountData"));
  sessionCatherineData = self->_sessionCatherineData;
  if (sessionCatherineData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLSessionCatherine dictionaryRepresentation](sessionCatherineData, "dictionaryRepresentation"), CFSTR("sessionCatherineData"));
  jacksonData = self->_jacksonData;
  if (jacksonData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLJacksonData dictionaryRepresentation](jacksonData, "dictionaryRepresentation"), CFSTR("jacksonData"));
  strideCalData = self->_strideCalData;
  if (strideCalData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLStrideCalEntry dictionaryRepresentation](strideCalData, "dictionaryRepresentation"), CFSTR("strideCalData"));
  sedentaryAlarmData = self->_sedentaryAlarmData;
  if (sedentaryAlarmData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLSedentaryAlarmData dictionaryRepresentation](sedentaryAlarmData, "dictionaryRepresentation"), CFSTR("sedentaryAlarmData"));
  allDayHeartRate = self->_allDayHeartRate;
  if (allDayHeartRate)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLAllDayHeartRate dictionaryRepresentation](allDayHeartRate, "dictionaryRepresentation"), CFSTR("allDayHeartRate"));
  fitnessTracking = self->_fitnessTracking;
  if (fitnessTracking)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMFitnessTracking dictionaryRepresentation](fitnessTracking, "dictionaryRepresentation"), CFSTR("fitnessTracking"));
  odometer = self->_odometer;
  if (odometer)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLOdometer dictionaryRepresentation](odometer, "dictionaryRepresentation"), CFSTR("odometer"));
  idsStatus = self->_idsStatus;
  if (idsStatus)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLIDSStatus dictionaryRepresentation](idsStatus, "dictionaryRepresentation"), CFSTR("idsStatus"));
  stairClimbingModel = self->_stairClimbingModel;
  if (stairClimbingModel)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLStairClimbingModel dictionaryRepresentation](stairClimbingModel, "dictionaryRepresentation"), CFSTR("stairClimbingModel"));
  rowingModel = self->_rowingModel;
  if (rowingModel)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLRowingModel dictionaryRepresentation](rowingModel, "dictionaryRepresentation"), CFSTR("rowingModel"));
  exerciseMinute = self->_exerciseMinute;
  if (exerciseMinute)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMExerciseMinute dictionaryRepresentation](exerciseMinute, "dictionaryRepresentation"), CFSTR("exerciseMinute"));
  elevation = self->_elevation;
  if (elevation)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMElevation dictionaryRepresentation](elevation, "dictionaryRepresentation"), CFSTR("elevation"));
  coarseElevation = self->_coarseElevation;
  if (coarseElevation)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMCoarseElevation dictionaryRepresentation](coarseElevation, "dictionaryRepresentation"), CFSTR("coarseElevation"));
  calorieData = self->_calorieData;
  if (calorieData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMCalorieData dictionaryRepresentation](calorieData, "dictionaryRepresentation"), CFSTR("calorieData"));
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMWorkoutEvent dictionaryRepresentation](workoutEvent, "dictionaryRepresentation"), CFSTR("workoutEvent"));
  natalieData = self->_natalieData;
  if (natalieData)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLNatalieDataDeprecated dictionaryRepresentation](natalieData, "dictionaryRepresentation"), CFSTR("natalieData"));
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  if (sedentaryAlarmDataDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLSedentaryAlarmDataDeprecated dictionaryRepresentation](sedentaryAlarmDataDeprecated, "dictionaryRepresentation"), CFSTR("sedentaryAlarmDataDeprecated"));
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  if (strideCalDataDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLStrideCalEntryDeprecated dictionaryRepresentation](strideCalDataDeprecated, "dictionaryRepresentation"), CFSTR("strideCalDataDeprecated"));
  calorieDataDeprecated = self->_calorieDataDeprecated;
  if (calorieDataDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMCalorieDataDeprecated dictionaryRepresentation](calorieDataDeprecated, "dictionaryRepresentation"), CFSTR("calorieDataDeprecated"));
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  if (coarseElevationDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMCoarseElevationDeprecated dictionaryRepresentation](coarseElevationDeprecated, "dictionaryRepresentation"), CFSTR("coarseElevationDeprecated"));
  elevationDeprecated = self->_elevationDeprecated;
  if (elevationDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLElevationDeprecated dictionaryRepresentation](elevationDeprecated, "dictionaryRepresentation"), CFSTR("elevationDeprecated"));
  workoutEventDeprecated = self->_workoutEventDeprecated;
  if (workoutEventDeprecated)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMWorkoutEventDeprecated dictionaryRepresentation](workoutEventDeprecated, "dictionaryRepresentation"), CFSTR("workoutEventDeprecated"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004D4CB0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ALActivityOverrideMsg *activityOverrideMsg;
  ALCLBodyMetrics *bodyMetrics;
  ALMotionState *motionState;
  ALCLNatalieDataDeprecated *natalieData;
  ALCLSedentaryAlarmDataDeprecated *sedentaryAlarmDataDeprecated;
  ALCLStepCountEntry *stepCountData;
  ALCLStrideCalEntryDeprecated *strideCalDataDeprecated;
  ALCLSessionCatherine *sessionCatherineData;
  ALCLJacksonData *jacksonData;
  ALCLStrideCalEntry *strideCalData;
  ALCLSedentaryAlarmData *sedentaryAlarmData;
  ALCLAllDayHeartRate *allDayHeartRate;
  ALCMCalorieDataDeprecated *calorieDataDeprecated;
  ALCMCoarseElevationDeprecated *coarseElevationDeprecated;
  ALCMFitnessTracking *fitnessTracking;
  ALCLOdometer *odometer;
  ALCLElevationDeprecated *elevationDeprecated;
  ALCLIDSStatus *idsStatus;
  ALCLStairClimbingModel *stairClimbingModel;
  ALCLRowingModel *rowingModel;
  ALCMExerciseMinute *exerciseMinute;
  ALCMWorkoutEventDeprecated *workoutEventDeprecated;
  ALCMElevation *elevation;
  ALCMCoarseElevation *coarseElevation;
  ALCMCalorieData *calorieData;
  ALCMWorkoutEvent *workoutEvent;

  PBDataWriterWriteDoubleField(a3, 1, self->_timestamp);
  activityOverrideMsg = self->_activityOverrideMsg;
  if (activityOverrideMsg)
    PBDataWriterWriteSubmessage(a3, activityOverrideMsg, 2);
  bodyMetrics = self->_bodyMetrics;
  if (bodyMetrics)
    PBDataWriterWriteSubmessage(a3, bodyMetrics, 3);
  motionState = self->_motionState;
  if (motionState)
    PBDataWriterWriteSubmessage(a3, motionState, 4);
  natalieData = self->_natalieData;
  if (natalieData)
    PBDataWriterWriteSubmessage(a3, natalieData, 5);
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  if (sedentaryAlarmDataDeprecated)
    PBDataWriterWriteSubmessage(a3, sedentaryAlarmDataDeprecated, 6);
  stepCountData = self->_stepCountData;
  if (stepCountData)
    PBDataWriterWriteSubmessage(a3, stepCountData, 7);
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  if (strideCalDataDeprecated)
    PBDataWriterWriteSubmessage(a3, strideCalDataDeprecated, 8);
  sessionCatherineData = self->_sessionCatherineData;
  if (sessionCatherineData)
    PBDataWriterWriteSubmessage(a3, sessionCatherineData, 9);
  jacksonData = self->_jacksonData;
  if (jacksonData)
    PBDataWriterWriteSubmessage(a3, jacksonData, 10);
  strideCalData = self->_strideCalData;
  if (strideCalData)
    PBDataWriterWriteSubmessage(a3, strideCalData, 11);
  sedentaryAlarmData = self->_sedentaryAlarmData;
  if (sedentaryAlarmData)
    PBDataWriterWriteSubmessage(a3, sedentaryAlarmData, 12);
  allDayHeartRate = self->_allDayHeartRate;
  if (allDayHeartRate)
    PBDataWriterWriteSubmessage(a3, allDayHeartRate, 13);
  calorieDataDeprecated = self->_calorieDataDeprecated;
  if (calorieDataDeprecated)
    PBDataWriterWriteSubmessage(a3, calorieDataDeprecated, 14);
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  if (coarseElevationDeprecated)
    PBDataWriterWriteSubmessage(a3, coarseElevationDeprecated, 15);
  fitnessTracking = self->_fitnessTracking;
  if (fitnessTracking)
    PBDataWriterWriteSubmessage(a3, fitnessTracking, 16);
  odometer = self->_odometer;
  if (odometer)
    PBDataWriterWriteSubmessage(a3, odometer, 17);
  elevationDeprecated = self->_elevationDeprecated;
  if (elevationDeprecated)
    PBDataWriterWriteSubmessage(a3, elevationDeprecated, 18);
  idsStatus = self->_idsStatus;
  if (idsStatus)
    PBDataWriterWriteSubmessage(a3, idsStatus, 19);
  stairClimbingModel = self->_stairClimbingModel;
  if (stairClimbingModel)
    PBDataWriterWriteSubmessage(a3, stairClimbingModel, 20);
  rowingModel = self->_rowingModel;
  if (rowingModel)
    PBDataWriterWriteSubmessage(a3, rowingModel, 21);
  exerciseMinute = self->_exerciseMinute;
  if (exerciseMinute)
    PBDataWriterWriteSubmessage(a3, exerciseMinute, 22);
  workoutEventDeprecated = self->_workoutEventDeprecated;
  if (workoutEventDeprecated)
    PBDataWriterWriteSubmessage(a3, workoutEventDeprecated, 23);
  elevation = self->_elevation;
  if (elevation)
    PBDataWriterWriteSubmessage(a3, elevation, 24);
  coarseElevation = self->_coarseElevation;
  if (coarseElevation)
    PBDataWriterWriteSubmessage(a3, coarseElevation, 25);
  calorieData = self->_calorieData;
  if (calorieData)
    PBDataWriterWriteSubmessage(a3, calorieData, 26);
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    PBDataWriterWriteSubmessage(a3, workoutEvent, 27);
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timestamp;
  if (self->_activityOverrideMsg)
    objc_msgSend(a3, "setActivityOverrideMsg:");
  if (self->_bodyMetrics)
    objc_msgSend(a3, "setBodyMetrics:");
  if (self->_motionState)
    objc_msgSend(a3, "setMotionState:");
  if (self->_natalieData)
    objc_msgSend(a3, "setNatalieData:");
  if (self->_sedentaryAlarmDataDeprecated)
    objc_msgSend(a3, "setSedentaryAlarmDataDeprecated:");
  if (self->_stepCountData)
    objc_msgSend(a3, "setStepCountData:");
  if (self->_strideCalDataDeprecated)
    objc_msgSend(a3, "setStrideCalDataDeprecated:");
  if (self->_sessionCatherineData)
    objc_msgSend(a3, "setSessionCatherineData:");
  if (self->_jacksonData)
    objc_msgSend(a3, "setJacksonData:");
  if (self->_strideCalData)
    objc_msgSend(a3, "setStrideCalData:");
  if (self->_sedentaryAlarmData)
    objc_msgSend(a3, "setSedentaryAlarmData:");
  if (self->_allDayHeartRate)
    objc_msgSend(a3, "setAllDayHeartRate:");
  if (self->_calorieDataDeprecated)
    objc_msgSend(a3, "setCalorieDataDeprecated:");
  if (self->_coarseElevationDeprecated)
    objc_msgSend(a3, "setCoarseElevationDeprecated:");
  if (self->_fitnessTracking)
    objc_msgSend(a3, "setFitnessTracking:");
  if (self->_odometer)
    objc_msgSend(a3, "setOdometer:");
  if (self->_elevationDeprecated)
    objc_msgSend(a3, "setElevationDeprecated:");
  if (self->_idsStatus)
    objc_msgSend(a3, "setIdsStatus:");
  if (self->_stairClimbingModel)
    objc_msgSend(a3, "setStairClimbingModel:");
  if (self->_rowingModel)
    objc_msgSend(a3, "setRowingModel:");
  if (self->_exerciseMinute)
    objc_msgSend(a3, "setExerciseMinute:");
  if (self->_workoutEventDeprecated)
    objc_msgSend(a3, "setWorkoutEventDeprecated:");
  if (self->_elevation)
    objc_msgSend(a3, "setElevation:");
  if (self->_coarseElevation)
    objc_msgSend(a3, "setCoarseElevation:");
  if (self->_calorieData)
    objc_msgSend(a3, "setCalorieData:");
  if (self->_workoutEvent)
    objc_msgSend(a3, "setWorkoutEvent:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_timestamp;

  *((_QWORD *)v5 + 2) = -[ALActivityOverrideMsg copyWithZone:](self->_activityOverrideMsg, "copyWithZone:", a3);
  *((_QWORD *)v5 + 4) = -[ALCLBodyMetrics copyWithZone:](self->_bodyMetrics, "copyWithZone:", a3);

  *((_QWORD *)v5 + 15) = -[ALMotionState copyWithZone:](self->_motionState, "copyWithZone:", a3);
  *((_QWORD *)v5 + 16) = -[ALCLNatalieDataDeprecated copyWithZone:](self->_natalieData, "copyWithZone:", a3);

  *((_QWORD *)v5 + 20) = -[ALCLSedentaryAlarmDataDeprecated copyWithZone:](self->_sedentaryAlarmDataDeprecated, "copyWithZone:", a3);
  *((_QWORD *)v5 + 23) = -[ALCLStepCountEntry copyWithZone:](self->_stepCountData, "copyWithZone:", a3);

  *((_QWORD *)v5 + 25) = -[ALCLStrideCalEntryDeprecated copyWithZone:](self->_strideCalDataDeprecated, "copyWithZone:", a3);
  *((_QWORD *)v5 + 21) = -[ALCLSessionCatherine copyWithZone:](self->_sessionCatherineData, "copyWithZone:", a3);

  *((_QWORD *)v5 + 14) = -[ALCLJacksonData copyWithZone:](self->_jacksonData, "copyWithZone:", a3);
  *((_QWORD *)v5 + 24) = -[ALCLStrideCalEntry copyWithZone:](self->_strideCalData, "copyWithZone:", a3);

  *((_QWORD *)v5 + 19) = -[ALCLSedentaryAlarmData copyWithZone:](self->_sedentaryAlarmData, "copyWithZone:", a3);
  *((_QWORD *)v5 + 3) = -[ALCLAllDayHeartRate copyWithZone:](self->_allDayHeartRate, "copyWithZone:", a3);

  *((_QWORD *)v5 + 6) = -[ALCMCalorieDataDeprecated copyWithZone:](self->_calorieDataDeprecated, "copyWithZone:", a3);
  *((_QWORD *)v5 + 8) = -[ALCMCoarseElevationDeprecated copyWithZone:](self->_coarseElevationDeprecated, "copyWithZone:", a3);

  *((_QWORD *)v5 + 12) = -[ALCMFitnessTracking copyWithZone:](self->_fitnessTracking, "copyWithZone:", a3);
  *((_QWORD *)v5 + 17) = -[ALCLOdometer copyWithZone:](self->_odometer, "copyWithZone:", a3);

  *((_QWORD *)v5 + 10) = -[ALCLElevationDeprecated copyWithZone:](self->_elevationDeprecated, "copyWithZone:", a3);
  *((_QWORD *)v5 + 13) = -[ALCLIDSStatus copyWithZone:](self->_idsStatus, "copyWithZone:", a3);

  *((_QWORD *)v5 + 22) = -[ALCLStairClimbingModel copyWithZone:](self->_stairClimbingModel, "copyWithZone:", a3);
  *((_QWORD *)v5 + 18) = -[ALCLRowingModel copyWithZone:](self->_rowingModel, "copyWithZone:", a3);

  *((_QWORD *)v5 + 11) = -[ALCMExerciseMinute copyWithZone:](self->_exerciseMinute, "copyWithZone:", a3);
  *((_QWORD *)v5 + 27) = -[ALCMWorkoutEventDeprecated copyWithZone:](self->_workoutEventDeprecated, "copyWithZone:", a3);

  *((_QWORD *)v5 + 9) = -[ALCMElevation copyWithZone:](self->_elevation, "copyWithZone:", a3);
  *((_QWORD *)v5 + 7) = -[ALCMCoarseElevation copyWithZone:](self->_coarseElevation, "copyWithZone:", a3);

  *((_QWORD *)v5 + 5) = -[ALCMCalorieData copyWithZone:](self->_calorieData, "copyWithZone:", a3);
  *((_QWORD *)v5 + 26) = -[ALCMWorkoutEvent copyWithZone:](self->_workoutEvent, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  ALActivityOverrideMsg *activityOverrideMsg;
  ALCLBodyMetrics *bodyMetrics;
  ALMotionState *motionState;
  ALCLNatalieDataDeprecated *natalieData;
  ALCLSedentaryAlarmDataDeprecated *sedentaryAlarmDataDeprecated;
  ALCLStepCountEntry *stepCountData;
  ALCLStrideCalEntryDeprecated *strideCalDataDeprecated;
  ALCLSessionCatherine *sessionCatherineData;
  ALCLJacksonData *jacksonData;
  ALCLStrideCalEntry *strideCalData;
  ALCLSedentaryAlarmData *sedentaryAlarmData;
  ALCLAllDayHeartRate *allDayHeartRate;
  ALCMCalorieDataDeprecated *calorieDataDeprecated;
  ALCMCoarseElevationDeprecated *coarseElevationDeprecated;
  ALCMFitnessTracking *fitnessTracking;
  ALCLOdometer *odometer;
  ALCLElevationDeprecated *elevationDeprecated;
  ALCLIDSStatus *idsStatus;
  ALCLStairClimbingModel *stairClimbingModel;
  ALCLRowingModel *rowingModel;
  ALCMExerciseMinute *exerciseMinute;
  ALCMWorkoutEventDeprecated *workoutEventDeprecated;
  ALCMElevation *elevation;
  ALCMCoarseElevation *coarseElevation;
  ALCMCalorieData *calorieData;
  ALCMWorkoutEvent *workoutEvent;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_timestamp == *((double *)a3 + 1))
    {
      activityOverrideMsg = self->_activityOverrideMsg;
      if (!((unint64_t)activityOverrideMsg | *((_QWORD *)a3 + 2))
        || (v5 = -[ALActivityOverrideMsg isEqual:](activityOverrideMsg, "isEqual:")) != 0)
      {
        bodyMetrics = self->_bodyMetrics;
        if (!((unint64_t)bodyMetrics | *((_QWORD *)a3 + 4))
          || (v5 = -[ALCLBodyMetrics isEqual:](bodyMetrics, "isEqual:")) != 0)
        {
          motionState = self->_motionState;
          if (!((unint64_t)motionState | *((_QWORD *)a3 + 15))
            || (v5 = -[ALMotionState isEqual:](motionState, "isEqual:")) != 0)
          {
            natalieData = self->_natalieData;
            if (!((unint64_t)natalieData | *((_QWORD *)a3 + 16))
              || (v5 = -[ALCLNatalieDataDeprecated isEqual:](natalieData, "isEqual:")) != 0)
            {
              sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
              if (!((unint64_t)sedentaryAlarmDataDeprecated | *((_QWORD *)a3 + 20))
                || (v5 = -[ALCLSedentaryAlarmDataDeprecated isEqual:](sedentaryAlarmDataDeprecated, "isEqual:")) != 0)
              {
                stepCountData = self->_stepCountData;
                if (!((unint64_t)stepCountData | *((_QWORD *)a3 + 23))
                  || (v5 = -[ALCLStepCountEntry isEqual:](stepCountData, "isEqual:")) != 0)
                {
                  strideCalDataDeprecated = self->_strideCalDataDeprecated;
                  if (!((unint64_t)strideCalDataDeprecated | *((_QWORD *)a3 + 25))
                    || (v5 = -[ALCLStrideCalEntryDeprecated isEqual:](strideCalDataDeprecated, "isEqual:")) != 0)
                  {
                    sessionCatherineData = self->_sessionCatherineData;
                    if (!((unint64_t)sessionCatherineData | *((_QWORD *)a3 + 21))
                      || (v5 = -[ALCLSessionCatherine isEqual:](sessionCatherineData, "isEqual:")) != 0)
                    {
                      jacksonData = self->_jacksonData;
                      if (!((unint64_t)jacksonData | *((_QWORD *)a3 + 14))
                        || (v5 = -[ALCLJacksonData isEqual:](jacksonData, "isEqual:")) != 0)
                      {
                        strideCalData = self->_strideCalData;
                        if (!((unint64_t)strideCalData | *((_QWORD *)a3 + 24))
                          || (v5 = -[ALCLStrideCalEntry isEqual:](strideCalData, "isEqual:")) != 0)
                        {
                          sedentaryAlarmData = self->_sedentaryAlarmData;
                          if (!((unint64_t)sedentaryAlarmData | *((_QWORD *)a3 + 19))
                            || (v5 = -[ALCLSedentaryAlarmData isEqual:](sedentaryAlarmData, "isEqual:")) != 0)
                          {
                            allDayHeartRate = self->_allDayHeartRate;
                            if (!((unint64_t)allDayHeartRate | *((_QWORD *)a3 + 3))
                              || (v5 = -[ALCLAllDayHeartRate isEqual:](allDayHeartRate, "isEqual:")) != 0)
                            {
                              calorieDataDeprecated = self->_calorieDataDeprecated;
                              if (!((unint64_t)calorieDataDeprecated | *((_QWORD *)a3 + 6))
                                || (v5 = -[ALCMCalorieDataDeprecated isEqual:](calorieDataDeprecated, "isEqual:")) != 0)
                              {
                                coarseElevationDeprecated = self->_coarseElevationDeprecated;
                                if (!((unint64_t)coarseElevationDeprecated | *((_QWORD *)a3 + 8))
                                  || (v5 = -[ALCMCoarseElevationDeprecated isEqual:](coarseElevationDeprecated, "isEqual:")) != 0)
                                {
                                  fitnessTracking = self->_fitnessTracking;
                                  if (!((unint64_t)fitnessTracking | *((_QWORD *)a3 + 12))
                                    || (v5 = -[ALCMFitnessTracking isEqual:](fitnessTracking, "isEqual:")) != 0)
                                  {
                                    odometer = self->_odometer;
                                    if (!((unint64_t)odometer | *((_QWORD *)a3 + 17))
                                      || (v5 = -[ALCLOdometer isEqual:](odometer, "isEqual:")) != 0)
                                    {
                                      elevationDeprecated = self->_elevationDeprecated;
                                      if (!((unint64_t)elevationDeprecated | *((_QWORD *)a3 + 10))
                                        || (v5 = -[ALCLElevationDeprecated isEqual:](elevationDeprecated, "isEqual:")) != 0)
                                      {
                                        idsStatus = self->_idsStatus;
                                        if (!((unint64_t)idsStatus | *((_QWORD *)a3 + 13))
                                          || (v5 = -[ALCLIDSStatus isEqual:](idsStatus, "isEqual:")) != 0)
                                        {
                                          stairClimbingModel = self->_stairClimbingModel;
                                          if (!((unint64_t)stairClimbingModel | *((_QWORD *)a3 + 22))
                                            || (v5 = -[ALCLStairClimbingModel isEqual:](stairClimbingModel, "isEqual:")) != 0)
                                          {
                                            rowingModel = self->_rowingModel;
                                            if (!((unint64_t)rowingModel | *((_QWORD *)a3 + 18))
                                              || (v5 = -[ALCLRowingModel isEqual:](rowingModel, "isEqual:")) != 0)
                                            {
                                              exerciseMinute = self->_exerciseMinute;
                                              if (!((unint64_t)exerciseMinute | *((_QWORD *)a3 + 11))
                                                || (v5 = -[ALCMExerciseMinute isEqual:](exerciseMinute, "isEqual:")) != 0)
                                              {
                                                workoutEventDeprecated = self->_workoutEventDeprecated;
                                                if (!((unint64_t)workoutEventDeprecated | *((_QWORD *)a3 + 27))
                                                  || (v5 = -[ALCMWorkoutEventDeprecated isEqual:](workoutEventDeprecated, "isEqual:")) != 0)
                                                {
                                                  elevation = self->_elevation;
                                                  if (!((unint64_t)elevation | *((_QWORD *)a3 + 9))
                                                    || (v5 = -[ALCMElevation isEqual:](elevation, "isEqual:")) != 0)
                                                  {
                                                    coarseElevation = self->_coarseElevation;
                                                    if (!((unint64_t)coarseElevation | *((_QWORD *)a3 + 7))
                                                      || (v5 = -[ALCMCoarseElevation isEqual:](coarseElevation, "isEqual:")) != 0)
                                                    {
                                                      calorieData = self->_calorieData;
                                                      if (!((unint64_t)calorieData | *((_QWORD *)a3 + 5))
                                                        || (v5 = -[ALCMCalorieData isEqual:](calorieData, "isEqual:")) != 0)
                                                      {
                                                        workoutEvent = self->_workoutEvent;
                                                        if ((unint64_t)workoutEvent | *((_QWORD *)a3 + 26))
                                                          LOBYTE(v5) = -[ALCMWorkoutEvent isEqual:](workoutEvent, "isEqual:");
                                                        else
                                                          LOBYTE(v5) = 1;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[ALActivityOverrideMsg hash](self->_activityOverrideMsg, "hash");
  v13 = v11 ^ -[ALCLBodyMetrics hash](self->_bodyMetrics, "hash");
  v14 = v12 ^ -[ALMotionState hash](self->_motionState, "hash");
  v15 = v14 ^ -[ALCLNatalieDataDeprecated hash](self->_natalieData, "hash");
  v16 = v15 ^ -[ALCLSedentaryAlarmDataDeprecated hash](self->_sedentaryAlarmDataDeprecated, "hash");
  v17 = v16 ^ -[ALCLStepCountEntry hash](self->_stepCountData, "hash");
  v18 = v17 ^ -[ALCLStrideCalEntryDeprecated hash](self->_strideCalDataDeprecated, "hash");
  v19 = v18 ^ -[ALCLSessionCatherine hash](self->_sessionCatherineData, "hash");
  v20 = v19 ^ -[ALCLJacksonData hash](self->_jacksonData, "hash");
  v21 = v20 ^ -[ALCLStrideCalEntry hash](self->_strideCalData, "hash");
  v22 = v21 ^ -[ALCLSedentaryAlarmData hash](self->_sedentaryAlarmData, "hash");
  v23 = v22 ^ -[ALCLAllDayHeartRate hash](self->_allDayHeartRate, "hash");
  v24 = v23 ^ -[ALCMCalorieDataDeprecated hash](self->_calorieDataDeprecated, "hash");
  v25 = v24 ^ -[ALCMCoarseElevationDeprecated hash](self->_coarseElevationDeprecated, "hash");
  v26 = v25 ^ -[ALCMFitnessTracking hash](self->_fitnessTracking, "hash");
  v27 = v26 ^ -[ALCLOdometer hash](self->_odometer, "hash");
  v28 = v27 ^ -[ALCLElevationDeprecated hash](self->_elevationDeprecated, "hash");
  v29 = v28 ^ -[ALCLIDSStatus hash](self->_idsStatus, "hash");
  v30 = v29 ^ -[ALCLStairClimbingModel hash](self->_stairClimbingModel, "hash");
  v31 = v30 ^ -[ALCLRowingModel hash](self->_rowingModel, "hash");
  v32 = v31 ^ -[ALCMExerciseMinute hash](self->_exerciseMinute, "hash");
  v33 = v32 ^ -[ALCMWorkoutEventDeprecated hash](self->_workoutEventDeprecated, "hash");
  v34 = v33 ^ -[ALCMElevation hash](self->_elevation, "hash");
  v35 = v34 ^ -[ALCMCoarseElevation hash](self->_coarseElevation, "hash");
  v36 = v35 ^ -[ALCMCalorieData hash](self->_calorieData, "hash");
  return v36 ^ -[ALCMWorkoutEvent hash](self->_workoutEvent, "hash") ^ v13;
}

- (void)mergeFrom:(id)a3
{
  ALActivityOverrideMsg *activityOverrideMsg;
  uint64_t v6;
  ALCLBodyMetrics *bodyMetrics;
  uint64_t v8;
  ALMotionState *motionState;
  uint64_t v10;
  ALCLNatalieDataDeprecated *natalieData;
  uint64_t v12;
  ALCLSedentaryAlarmDataDeprecated *sedentaryAlarmDataDeprecated;
  uint64_t v14;
  ALCLStepCountEntry *stepCountData;
  uint64_t v16;
  ALCLStrideCalEntryDeprecated *strideCalDataDeprecated;
  uint64_t v18;
  ALCLSessionCatherine *sessionCatherineData;
  uint64_t v20;
  ALCLJacksonData *jacksonData;
  uint64_t v22;
  ALCLStrideCalEntry *strideCalData;
  uint64_t v24;
  ALCLSedentaryAlarmData *sedentaryAlarmData;
  uint64_t v26;
  ALCLAllDayHeartRate *allDayHeartRate;
  uint64_t v28;
  ALCMCalorieDataDeprecated *calorieDataDeprecated;
  uint64_t v30;
  ALCMCoarseElevationDeprecated *coarseElevationDeprecated;
  uint64_t v32;
  ALCMFitnessTracking *fitnessTracking;
  uint64_t v34;
  ALCLOdometer *odometer;
  uint64_t v36;
  ALCLElevationDeprecated *elevationDeprecated;
  uint64_t v38;
  ALCLIDSStatus *idsStatus;
  uint64_t v40;
  ALCLStairClimbingModel *stairClimbingModel;
  uint64_t v42;
  ALCLRowingModel *rowingModel;
  uint64_t v44;
  ALCMExerciseMinute *exerciseMinute;
  uint64_t v46;
  ALCMWorkoutEventDeprecated *workoutEventDeprecated;
  uint64_t v48;
  ALCMElevation *elevation;
  uint64_t v50;
  ALCMCoarseElevation *coarseElevation;
  uint64_t v52;
  ALCMCalorieData *calorieData;
  uint64_t v54;
  ALCMWorkoutEvent *workoutEvent;
  uint64_t v56;

  self->_timestamp = *((double *)a3 + 1);
  activityOverrideMsg = self->_activityOverrideMsg;
  v6 = *((_QWORD *)a3 + 2);
  if (activityOverrideMsg)
  {
    if (v6)
      -[ALActivityOverrideMsg mergeFrom:](activityOverrideMsg, "mergeFrom:");
  }
  else if (v6)
  {
    -[ALActivityLog setActivityOverrideMsg:](self, "setActivityOverrideMsg:");
  }
  bodyMetrics = self->_bodyMetrics;
  v8 = *((_QWORD *)a3 + 4);
  if (bodyMetrics)
  {
    if (v8)
      -[ALCLBodyMetrics mergeFrom:](bodyMetrics, "mergeFrom:");
  }
  else if (v8)
  {
    -[ALActivityLog setBodyMetrics:](self, "setBodyMetrics:");
  }
  motionState = self->_motionState;
  v10 = *((_QWORD *)a3 + 15);
  if (motionState)
  {
    if (v10)
      -[ALMotionState mergeFrom:](motionState, "mergeFrom:");
  }
  else if (v10)
  {
    -[ALActivityLog setMotionState:](self, "setMotionState:");
  }
  natalieData = self->_natalieData;
  v12 = *((_QWORD *)a3 + 16);
  if (natalieData)
  {
    if (v12)
      -[ALCLNatalieDataDeprecated mergeFrom:](natalieData, "mergeFrom:");
  }
  else if (v12)
  {
    -[ALActivityLog setNatalieData:](self, "setNatalieData:");
  }
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  v14 = *((_QWORD *)a3 + 20);
  if (sedentaryAlarmDataDeprecated)
  {
    if (v14)
      -[ALCLSedentaryAlarmDataDeprecated mergeFrom:](sedentaryAlarmDataDeprecated, "mergeFrom:");
  }
  else if (v14)
  {
    -[ALActivityLog setSedentaryAlarmDataDeprecated:](self, "setSedentaryAlarmDataDeprecated:");
  }
  stepCountData = self->_stepCountData;
  v16 = *((_QWORD *)a3 + 23);
  if (stepCountData)
  {
    if (v16)
      -[ALCLStepCountEntry mergeFrom:](stepCountData, "mergeFrom:");
  }
  else if (v16)
  {
    -[ALActivityLog setStepCountData:](self, "setStepCountData:");
  }
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  v18 = *((_QWORD *)a3 + 25);
  if (strideCalDataDeprecated)
  {
    if (v18)
      -[ALCLStrideCalEntryDeprecated mergeFrom:](strideCalDataDeprecated, "mergeFrom:");
  }
  else if (v18)
  {
    -[ALActivityLog setStrideCalDataDeprecated:](self, "setStrideCalDataDeprecated:");
  }
  sessionCatherineData = self->_sessionCatherineData;
  v20 = *((_QWORD *)a3 + 21);
  if (sessionCatherineData)
  {
    if (v20)
      -[ALCLSessionCatherine mergeFrom:](sessionCatherineData, "mergeFrom:");
  }
  else if (v20)
  {
    -[ALActivityLog setSessionCatherineData:](self, "setSessionCatherineData:");
  }
  jacksonData = self->_jacksonData;
  v22 = *((_QWORD *)a3 + 14);
  if (jacksonData)
  {
    if (v22)
      -[ALCLJacksonData mergeFrom:](jacksonData, "mergeFrom:");
  }
  else if (v22)
  {
    -[ALActivityLog setJacksonData:](self, "setJacksonData:");
  }
  strideCalData = self->_strideCalData;
  v24 = *((_QWORD *)a3 + 24);
  if (strideCalData)
  {
    if (v24)
      -[ALCLStrideCalEntry mergeFrom:](strideCalData, "mergeFrom:");
  }
  else if (v24)
  {
    -[ALActivityLog setStrideCalData:](self, "setStrideCalData:");
  }
  sedentaryAlarmData = self->_sedentaryAlarmData;
  v26 = *((_QWORD *)a3 + 19);
  if (sedentaryAlarmData)
  {
    if (v26)
      -[ALCLSedentaryAlarmData mergeFrom:](sedentaryAlarmData, "mergeFrom:");
  }
  else if (v26)
  {
    -[ALActivityLog setSedentaryAlarmData:](self, "setSedentaryAlarmData:");
  }
  allDayHeartRate = self->_allDayHeartRate;
  v28 = *((_QWORD *)a3 + 3);
  if (allDayHeartRate)
  {
    if (v28)
      -[ALCLAllDayHeartRate mergeFrom:](allDayHeartRate, "mergeFrom:");
  }
  else if (v28)
  {
    -[ALActivityLog setAllDayHeartRate:](self, "setAllDayHeartRate:");
  }
  calorieDataDeprecated = self->_calorieDataDeprecated;
  v30 = *((_QWORD *)a3 + 6);
  if (calorieDataDeprecated)
  {
    if (v30)
      -[ALCMCalorieDataDeprecated mergeFrom:](calorieDataDeprecated, "mergeFrom:");
  }
  else if (v30)
  {
    -[ALActivityLog setCalorieDataDeprecated:](self, "setCalorieDataDeprecated:");
  }
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  v32 = *((_QWORD *)a3 + 8);
  if (coarseElevationDeprecated)
  {
    if (v32)
      -[ALCMCoarseElevationDeprecated mergeFrom:](coarseElevationDeprecated, "mergeFrom:");
  }
  else if (v32)
  {
    -[ALActivityLog setCoarseElevationDeprecated:](self, "setCoarseElevationDeprecated:");
  }
  fitnessTracking = self->_fitnessTracking;
  v34 = *((_QWORD *)a3 + 12);
  if (fitnessTracking)
  {
    if (v34)
      -[ALCMFitnessTracking mergeFrom:](fitnessTracking, "mergeFrom:");
  }
  else if (v34)
  {
    -[ALActivityLog setFitnessTracking:](self, "setFitnessTracking:");
  }
  odometer = self->_odometer;
  v36 = *((_QWORD *)a3 + 17);
  if (odometer)
  {
    if (v36)
      -[ALCLOdometer mergeFrom:](odometer, "mergeFrom:");
  }
  else if (v36)
  {
    -[ALActivityLog setOdometer:](self, "setOdometer:");
  }
  elevationDeprecated = self->_elevationDeprecated;
  v38 = *((_QWORD *)a3 + 10);
  if (elevationDeprecated)
  {
    if (v38)
      -[ALCLElevationDeprecated mergeFrom:](elevationDeprecated, "mergeFrom:");
  }
  else if (v38)
  {
    -[ALActivityLog setElevationDeprecated:](self, "setElevationDeprecated:");
  }
  idsStatus = self->_idsStatus;
  v40 = *((_QWORD *)a3 + 13);
  if (idsStatus)
  {
    if (v40)
      -[ALCLIDSStatus mergeFrom:](idsStatus, "mergeFrom:");
  }
  else if (v40)
  {
    -[ALActivityLog setIdsStatus:](self, "setIdsStatus:");
  }
  stairClimbingModel = self->_stairClimbingModel;
  v42 = *((_QWORD *)a3 + 22);
  if (stairClimbingModel)
  {
    if (v42)
      -[ALCLStairClimbingModel mergeFrom:](stairClimbingModel, "mergeFrom:");
  }
  else if (v42)
  {
    -[ALActivityLog setStairClimbingModel:](self, "setStairClimbingModel:");
  }
  rowingModel = self->_rowingModel;
  v44 = *((_QWORD *)a3 + 18);
  if (rowingModel)
  {
    if (v44)
      -[ALCLRowingModel mergeFrom:](rowingModel, "mergeFrom:");
  }
  else if (v44)
  {
    -[ALActivityLog setRowingModel:](self, "setRowingModel:");
  }
  exerciseMinute = self->_exerciseMinute;
  v46 = *((_QWORD *)a3 + 11);
  if (exerciseMinute)
  {
    if (v46)
      -[ALCMExerciseMinute mergeFrom:](exerciseMinute, "mergeFrom:");
  }
  else if (v46)
  {
    -[ALActivityLog setExerciseMinute:](self, "setExerciseMinute:");
  }
  workoutEventDeprecated = self->_workoutEventDeprecated;
  v48 = *((_QWORD *)a3 + 27);
  if (workoutEventDeprecated)
  {
    if (v48)
      -[ALCMWorkoutEventDeprecated mergeFrom:](workoutEventDeprecated, "mergeFrom:");
  }
  else if (v48)
  {
    -[ALActivityLog setWorkoutEventDeprecated:](self, "setWorkoutEventDeprecated:");
  }
  elevation = self->_elevation;
  v50 = *((_QWORD *)a3 + 9);
  if (elevation)
  {
    if (v50)
      -[ALCMElevation mergeFrom:](elevation, "mergeFrom:");
  }
  else if (v50)
  {
    -[ALActivityLog setElevation:](self, "setElevation:");
  }
  coarseElevation = self->_coarseElevation;
  v52 = *((_QWORD *)a3 + 7);
  if (coarseElevation)
  {
    if (v52)
      -[ALCMCoarseElevation mergeFrom:](coarseElevation, "mergeFrom:");
  }
  else if (v52)
  {
    -[ALActivityLog setCoarseElevation:](self, "setCoarseElevation:");
  }
  calorieData = self->_calorieData;
  v54 = *((_QWORD *)a3 + 5);
  if (calorieData)
  {
    if (v54)
      -[ALCMCalorieData mergeFrom:](calorieData, "mergeFrom:");
  }
  else if (v54)
  {
    -[ALActivityLog setCalorieData:](self, "setCalorieData:");
  }
  workoutEvent = self->_workoutEvent;
  v56 = *((_QWORD *)a3 + 26);
  if (workoutEvent)
  {
    if (v56)
      -[ALCMWorkoutEvent mergeFrom:](workoutEvent, "mergeFrom:");
  }
  else if (v56)
  {
    -[ALActivityLog setWorkoutEvent:](self, "setWorkoutEvent:");
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ALActivityOverrideMsg)activityOverrideMsg
{
  return self->_activityOverrideMsg;
}

- (void)setActivityOverrideMsg:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (ALCLBodyMetrics)bodyMetrics
{
  return self->_bodyMetrics;
}

- (void)setBodyMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (ALMotionState)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (ALCLStepCountEntry)stepCountData
{
  return self->_stepCountData;
}

- (void)setStepCountData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (ALCLSessionCatherine)sessionCatherineData
{
  return self->_sessionCatherineData;
}

- (void)setSessionCatherineData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (ALCLJacksonData)jacksonData
{
  return self->_jacksonData;
}

- (void)setJacksonData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (ALCLStrideCalEntry)strideCalData
{
  return self->_strideCalData;
}

- (void)setStrideCalData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (ALCLSedentaryAlarmData)sedentaryAlarmData
{
  return self->_sedentaryAlarmData;
}

- (void)setSedentaryAlarmData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (ALCLAllDayHeartRate)allDayHeartRate
{
  return self->_allDayHeartRate;
}

- (void)setAllDayHeartRate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (ALCMFitnessTracking)fitnessTracking
{
  return self->_fitnessTracking;
}

- (void)setFitnessTracking:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (ALCLOdometer)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (ALCLIDSStatus)idsStatus
{
  return self->_idsStatus;
}

- (void)setIdsStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (ALCLStairClimbingModel)stairClimbingModel
{
  return self->_stairClimbingModel;
}

- (void)setStairClimbingModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (ALCLRowingModel)rowingModel
{
  return self->_rowingModel;
}

- (void)setRowingModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (ALCMExerciseMinute)exerciseMinute
{
  return self->_exerciseMinute;
}

- (void)setExerciseMinute:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (ALCMElevation)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (ALCMCoarseElevation)coarseElevation
{
  return self->_coarseElevation;
}

- (void)setCoarseElevation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (ALCMCalorieData)calorieData
{
  return self->_calorieData;
}

- (void)setCalorieData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (ALCMWorkoutEvent)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (ALCLNatalieDataDeprecated)natalieData
{
  return self->_natalieData;
}

- (void)setNatalieData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (ALCLSedentaryAlarmDataDeprecated)sedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated;
}

- (void)setSedentaryAlarmDataDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (ALCLStrideCalEntryDeprecated)strideCalDataDeprecated
{
  return self->_strideCalDataDeprecated;
}

- (void)setStrideCalDataDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (ALCMCalorieDataDeprecated)calorieDataDeprecated
{
  return self->_calorieDataDeprecated;
}

- (void)setCalorieDataDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (ALCMCoarseElevationDeprecated)coarseElevationDeprecated
{
  return self->_coarseElevationDeprecated;
}

- (void)setCoarseElevationDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (ALCLElevationDeprecated)elevationDeprecated
{
  return self->_elevationDeprecated;
}

- (void)setElevationDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (ALCMWorkoutEventDeprecated)workoutEventDeprecated
{
  return self->_workoutEventDeprecated;
}

- (void)setWorkoutEventDeprecated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

@end
