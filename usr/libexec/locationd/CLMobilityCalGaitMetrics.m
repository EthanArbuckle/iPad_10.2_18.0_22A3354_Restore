@implementation CLMobilityCalGaitMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMobilityCalGaitMetrics)initWithCoder:(id)a3
{
  CLMobilityCalGaitMetrics *v4;
  double v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLMobilityCalGaitMetrics;
  v4 = -[CLMobilityCalGaitMetrics init](&v10, "init");
  if (v4)
  {
    v4->_recordId = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    v4->_timestamp = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("timestamp"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("walkingSpeed"));
    v4->_walkingSpeed = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("stepLength"));
    v4->_stepLength = v7;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("cycleTime"));
    v4->_cycleTime = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "encodeInt32:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeInt64:forKey:", self->_timestamp, CFSTR("timestamp"));
  *(float *)&v5 = self->_walkingSpeed;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("walkingSpeed"), v5);
  *(float *)&v6 = self->_stepLength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("stepLength"), v6);
  *(float *)&v7 = self->_cycleTime;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("cycleTime"), v7);
}

- (CLMobilityCalGaitMetrics)initWithRecordId:(int)a3 startTime:(double)a4 timestamp:(unint64_t)a5 walkingSpeed:(float)a6 stepLength:(float)a7 cycleTime:(float)a8
{
  CLMobilityCalGaitMetrics *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLMobilityCalGaitMetrics;
  result = -[CLMobilityCalGaitMetrics init](&v15, "init");
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_timestamp = a5;
    result->_walkingSpeed = a6;
    result->_stepLength = a7;
    result->_cycleTime = a8;
  }
  return result;
}

- (CLMobilityCalGaitMetrics)initWithGaitMetrics:(const GaitMetrics *)a3
{
  CLMobilityCalGaitMetrics *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMobilityCalGaitMetrics;
  result = -[CLMobilityCalGaitMetrics init](&v5, "init");
  if (result)
  {
    result->_recordId = *(_DWORD *)&a3->var0;
    *(_QWORD *)&result->_startTime = a3->var8;
    result->_timestamp = a3->var9;
    result->_walkingSpeed = a3->var10;
    result->_stepLength = a3->var12;
    result->_cycleTime = a3->var16;
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
  unint64_t v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLMobilityCalGaitMetrics recordId](self, "recordId");
  -[CLMobilityCalGaitMetrics startTime](self, "startTime");
  v7 = v6;
  v8 = -[CLMobilityCalGaitMetrics timestamp](self, "timestamp");
  -[CLMobilityCalGaitMetrics walkingSpeed](self, "walkingSpeed");
  v10 = v9;
  -[CLMobilityCalGaitMetrics stepLength](self, "stepLength");
  v12 = v11;
  -[CLMobilityCalGaitMetrics cycleTime](self, "cycleTime");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %d, startTime %f, timestamp %llu, walkingSpeed %f, stepLength %f, cycleTime %f>"), v4, v5, v7, v8, *(_QWORD *)&v10, *(_QWORD *)&v12, v13);
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (float)walkingSpeed
{
  return self->_walkingSpeed;
}

- (float)stepLength
{
  return self->_stepLength;
}

- (float)cycleTime
{
  return self->_cycleTime;
}

@end
