@implementation CLPredictedWalkDistanceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPredictedWalkDistanceData)initWithCoder:(id)a3
{
  CLPredictedWalkDistanceData *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLPredictedWalkDistanceData;
  v4 = -[CLPredictedWalkDistanceData init](&v11, "init");
  if (v4)
  {
    v4->_recordId = objc_msgSend(a3, "decodeIntForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_endTime = v6;
    v4->_stepCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stepCount"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("distance"));
    v4->_distance = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("activeTime"));
    v4->_activeTime = v8;
    v4->_elevationAscended = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("elevationAscended"));
    v4->_elevationDescended = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("elevationDescended"));
    v4->_stepCountGPS = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stepCountGPS"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("distanceGPS"));
    v4->_distanceGPS = v9;
    v4->_boutType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("boutType"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_stepCount, CFSTR("stepCount"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("distance"), self->_distance);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("activeTime"), self->_activeTime);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_elevationAscended, CFSTR("elevationAscended"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_elevationDescended, CFSTR("elevationDescended"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_stepCountGPS, CFSTR("stepCountGPS"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("distanceGPS"), self->_distanceGPS);
  objc_msgSend(a3, "encodeInt:forKey:", self->_boutType, CFSTR("boutType"));
}

- (CLPredictedWalkDistanceData)initWithPredictedWalkDistanceBoutEntry:(const CLPredictedWalkDistanceBoutEntry *)a3
{
  CLPredictedWalkDistanceData *result;
  unsigned int stepCountGPS;
  int boutType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLPredictedWalkDistanceData;
  result = -[CLPredictedWalkDistanceData init](&v7, "init");
  if (result)
  {
    result->_recordId = a3->recordId;
    result->_startTime = a3->startTime;
    result->_endTime = a3->endTime;
    result->_stepCount = a3->stepCount;
    result->_distance = a3->distance;
    result->_activeTime = a3->activeTime;
    result->_elevationAscended = a3->elevationAscended;
    result->_elevationDescended = a3->elevationDescended;
    stepCountGPS = a3->stepCountGPS;
    result->_distanceGPS = a3->distanceGPS;
    boutType = a3->boutType;
    result->_stepCountGPS = stepCountGPS;
    result->_boutType = boutType;
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

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLPredictedWalkDistanceData recordId](self, "recordId");
  -[CLPredictedWalkDistanceData startTime](self, "startTime");
  v7 = v6;
  -[CLPredictedWalkDistanceData endTime](self, "endTime");
  v9 = v8;
  v10 = -[CLPredictedWalkDistanceData stepCount](self, "stepCount");
  -[CLPredictedWalkDistanceData distance](self, "distance");
  v12 = v11;
  -[CLPredictedWalkDistanceData activeTime](self, "activeTime");
  v14 = v13;
  v15 = -[CLPredictedWalkDistanceData elevationAscended](self, "elevationAscended");
  v16 = -[CLPredictedWalkDistanceData elevationDescended](self, "elevationDescended");
  v17 = -[CLPredictedWalkDistanceData stepCountGPS](self, "stepCountGPS");
  -[CLPredictedWalkDistanceData distanceGPS](self, "distanceGPS");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %d, startTime %f, endTime %f, stepCount %u, distance %f, activeTime %f, elevationAscended %u, elevationDescended %u, stepCountGPS %u, distanceGPS %f, boutType %d>"), v4, v5, v7, v9, v10, v12, v14, v15, v16, v17, v18, -[CLPredictedWalkDistanceData boutType](self, "boutType"));
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (unsigned)stepCount
{
  return self->_stepCount;
}

- (double)distance
{
  return self->_distance;
}

- (double)activeTime
{
  return self->_activeTime;
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (unsigned)elevationDescended
{
  return self->_elevationDescended;
}

- (unsigned)stepCountGPS
{
  return self->_stepCountGPS;
}

- (double)distanceGPS
{
  return self->_distanceGPS;
}

- (int)boutType
{
  return self->_boutType;
}

@end
