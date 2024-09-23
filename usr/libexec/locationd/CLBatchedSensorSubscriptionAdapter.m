@implementation CLBatchedSensorSubscriptionAdapter

- (CLBatchedSensorSubscriptionAdapter)initWithBatchedSensorSubscription:(void *)a3
{
  CLBatchedSensorSubscriptionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLBatchedSensorSubscriptionAdapter;
  result = -[CLBatchedSensorSubscriptionAdapter init](&v5, "init");
  if (result)
    result->_subscription = a3;
  return result;
}

- (void)onBatchedAccelerometerData:(id)a3
{
  sub_1011F74CC((uint64_t)-[CLBatchedSensorSubscriptionAdapter subscription](self, "subscription"), (uint64_t)objc_msgSend(a3, "buffer"));
}

- (void)onBatchedDeviceMotionData:(id)a3
{
  sub_1011F7A1C((uint64_t)-[CLBatchedSensorSubscriptionAdapter subscription](self, "subscription"), (uint64_t)objc_msgSend(a3, "buffer"));
}

- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5
{
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  WorkoutAttrib attrib;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18[4];
  char v19;
  _QWORD v20[6];
  _OWORD v21[14];
  unint64_t workoutMode;

  v7 = -[CLBatchedSensorSubscriptionAdapter subscription](self, "subscription", a3, a4, a5);
  v8 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[47];
  v9 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[63];
  v10 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[15];
  v21[11] = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[31];
  v21[12] = v8;
  v21[13] = v9;
  attrib = a3->workoutSettings.attrib;
  v12 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.isFitnessPlus;
  v13 = *(_OWORD *)a3->workoutSettings.workoutRecorderSessionId;
  v21[7] = *(_OWORD *)&a3->workoutSettings.workoutType;
  v21[8] = attrib;
  v21[9] = v12;
  v21[10] = v10;
  v14 = *(_OWORD *)a3->workoutSettings.sessionId;
  v15 = *(_OWORD *)a3->workoutSettings.overviewId;
  v16 = *(_OWORD *)&a3->details.sessionType;
  v21[3] = *(_OWORD *)&a3->details.escalationType;
  v21[4] = v14;
  v21[5] = v15;
  v21[6] = v13;
  v17 = *(_OWORD *)&a3->eventType;
  v21[0] = *(_OWORD *)&a3->startTime;
  v21[1] = v17;
  workoutMode = a3->workoutSettings.workoutMode;
  v21[2] = v16;
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v18, a4);
  sub_1011F8044((uint64_t)v7, (uint64_t)v21, (uint64_t)v18);
  sub_100691160(v20);
  if (v19 < 0)
    operator delete(v18[2]);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end
