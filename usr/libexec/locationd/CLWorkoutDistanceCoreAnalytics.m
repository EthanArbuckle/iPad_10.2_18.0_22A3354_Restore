@implementation CLWorkoutDistanceCoreAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLWorkoutDistanceCoreAnalytics)initWithCoder:(id)a3
{
  CLWorkoutDistanceCoreAnalytics *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  v4 = -[CLWorkoutDistanceCoreAnalytics init](&v15, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("beginTime"));
    v4->_beginTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_endTime = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("totalDistanceStepCount"));
    v4->_totalDistanceStepCount = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("totalDistanceStepCountMobility"));
    v4->_totalDistanceStepCountMobility = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("totalDistanceOdometer"));
    v4->_totalDistanceOdometer = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("totalDistanceFused"));
    v4->_totalDistanceFused = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("percentageRemoteGPSSource"));
    v4->_percentageRemoteGPSSource = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("meanPaceStepCount"));
    v4->_meanPaceStepCount = v12;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("meanPaceFinalFused"));
    v4->_meanPaceFinalFused = v13;
    v4->_totalStepCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("totalStepCount"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("beginTime"), self->_beginTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("totalDistanceStepCount"), self->_totalDistanceStepCount);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("totalDistanceStepCountMobility"), self->_totalDistanceStepCountMobility);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("totalDistanceOdometer"), self->_totalDistanceOdometer);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("totalDistanceFused"), self->_totalDistanceFused);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("percentageRemoteGPSSource"), self->_percentageRemoteGPSSource);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("meanPaceStepCount"), self->_meanPaceStepCount);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("meanPaceFinalFused"), self->_meanPaceFinalFused);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_totalStepCount, CFSTR("totalStepCount"));
}

- (CLWorkoutDistanceCoreAnalytics)initWithBeginTime:(double)a3 endTime:(double)a4 totalDistanceStepCount:(double)a5 totalDistanceStepCountMobility:(double)a6 totalDistanceOdometer:(double)a7 totalDistanceFused:(double)a8 percentageRemoteGPSSource:(double)a9 meanPaceStepCount:(double)a10 meanPaceFinalFused:(double)a11 totalStepCount:(int)a12
{
  CLWorkoutDistanceCoreAnalytics *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  result = -[CLWorkoutDistanceCoreAnalytics init](&v22, "init");
  if (result)
  {
    result->_beginTime = a3;
    result->_endTime = a4;
    result->_totalDistanceStepCount = a5;
    result->_totalDistanceStepCountMobility = a6;
    result->_totalDistanceOdometer = a7;
    result->_totalDistanceFused = a8;
    result->_percentageRemoteGPSSource = a9;
    result->_meanPaceStepCount = a10;
    result->_meanPaceFinalFused = a11;
    result->_totalStepCount = a12;
  }
  return result;
}

- (CLWorkoutDistanceCoreAnalytics)initWithWorkoutDistanceMeasures:(const WorkoutDistanceMeasures *)a3
{
  CLWorkoutDistanceCoreAnalytics *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  result = -[CLWorkoutDistanceCoreAnalytics init](&v5, "init");
  if (result)
  {
    result->_beginTime = a3->var0;
    result->_endTime = a3->var1;
    result->_totalDistanceStepCount = a3->var2;
    result->_totalDistanceStepCountMobility = a3->var3;
    result->_totalDistanceOdometer = a3->var4;
    result->_totalDistanceFused = a3->var5;
    result->_percentageRemoteGPSSource = a3->var6;
    result->_meanPaceStepCount = a3->var7;
    result->_meanPaceFinalFused = a3->var8;
    result->_totalStepCount = a3->var9;
  }
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  -[CLWorkoutDistanceCoreAnalytics beginTime](self, "beginTime");
  v22 = v5;
  -[CLWorkoutDistanceCoreAnalytics endTime](self, "endTime");
  v7 = v6;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceStepCount](self, "totalDistanceStepCount");
  v9 = v8;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceStepCount](self, "totalDistanceStepCount");
  v11 = v10;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceOdometer](self, "totalDistanceOdometer");
  v13 = v12;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceFused](self, "totalDistanceFused");
  v15 = v14;
  -[CLWorkoutDistanceCoreAnalytics percentageRemoteGPSSource](self, "percentageRemoteGPSSource");
  v17 = v16;
  -[CLWorkoutDistanceCoreAnalytics meanPaceStepCount](self, "meanPaceStepCount");
  v19 = v18;
  -[CLWorkoutDistanceCoreAnalytics meanPaceFinalFused](self, "meanPaceFinalFused");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<beginTime %f, endTime %f, totalDistanceStepCount %f, totalDistanceStepCountMobility %f, totalDistanceOdometer %f, totalDistanceFused %f, percentageRemoteGPSSource %f, meanPaceStepCount %f, meanPaceFinalFused %f, totalStepCount %d>"), v4, v22, v7, v9, v11, v13, v15, v17, v19, v20, -[CLWorkoutDistanceCoreAnalytics totalStepCount](self, "totalStepCount"));
}

- (double)beginTime
{
  return self->_beginTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)totalDistanceStepCount
{
  return self->_totalDistanceStepCount;
}

- (double)totalDistanceStepCountMobility
{
  return self->_totalDistanceStepCountMobility;
}

- (double)totalDistanceOdometer
{
  return self->_totalDistanceOdometer;
}

- (double)totalDistanceFused
{
  return self->_totalDistanceFused;
}

- (double)percentageRemoteGPSSource
{
  return self->_percentageRemoteGPSSource;
}

- (double)meanPaceStepCount
{
  return self->_meanPaceStepCount;
}

- (double)meanPaceFinalFused
{
  return self->_meanPaceFinalFused;
}

- (int)totalStepCount
{
  return self->_totalStepCount;
}

@end
