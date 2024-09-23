@implementation CLMobilityCalBoutMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMobilityCalBoutMetrics)initWithCoder:(id)a3
{
  CLMobilityCalBoutMetrics *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLMobilityCalBoutMetrics;
  v4 = -[CLMobilityCalBoutMetrics init](&v9, "init");
  if (v4)
  {
    v4->_recordId = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_endTime = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("invalidGradePercentage"));
    v4->_invalidGradePercentage = v7;
    v4->_boundaryType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("boundaryType"));
    v4->_isWalkingSpeedValid = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isWalkingSpeedValid"));
    v4->_isStepLengthValid = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isStepLengthValid"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("invalidGradePercentage"), self->_invalidGradePercentage);
  objc_msgSend(a3, "encodeInt:forKey:", self->_boundaryType, CFSTR("boundaryType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isWalkingSpeedValid, CFSTR("isWalkingSpeedValid"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isStepLengthValid, CFSTR("isStepLengthValid"));
}

- (CLMobilityCalBoutMetrics)initWithRecordId:(int)a3 startTime:(double)a4 endTime:(double)a5 invalidGradePercentage:(double)a6 boundaryType:(int)a7 isWalkingSpeedValid:(BOOL)a8 isStepLengthValid:(BOOL)a9
{
  CLMobilityCalBoutMetrics *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLMobilityCalBoutMetrics;
  result = -[CLMobilityCalBoutMetrics init](&v17, "init");
  if (result)
  {
    result->_startTime = a4;
    result->_endTime = a5;
    result->_invalidGradePercentage = a6;
    result->_recordId = a3;
    result->_boundaryType = a7;
    result->_isWalkingSpeedValid = a8;
    result->_isStepLengthValid = a9;
  }
  return result;
}

- (CLMobilityCalBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3
{
  CLMobilityCalBoutMetrics *result;
  int recordId;
  int boundaryType;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLMobilityCalBoutMetrics;
  result = -[CLMobilityCalBoutMetrics init](&v8, "init");
  if (result)
  {
    recordId = a3->recordId;
    result->_startTime = a3->startTime;
    result->_endTime = a3->endTime;
    result->_invalidGradePercentage = a3->invalidGradePercentage;
    boundaryType = a3->boundaryType;
    result->_recordId = recordId;
    result->_boundaryType = boundaryType;
    if (boundaryType)
      v7 = 42;
    else
      v7 = -1;
    result->_isWalkingSpeedValid = (v7 & a3->walkingSpeedRejectionStatus) == 0;
    result->_isStepLengthValid = (a3->stepLengthRejectionStatus & v7) == 0;
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

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLMobilityCalBoutMetrics recordId](self, "recordId");
  -[CLMobilityCalBoutMetrics startTime](self, "startTime");
  v7 = v6;
  -[CLMobilityCalBoutMetrics endTime](self, "endTime");
  v9 = v8;
  -[CLMobilityCalBoutMetrics invalidGradePercentage](self, "invalidGradePercentage");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %d, startTime %f, endTime %f, invalidGradePercentage %f, boundaryType %d, isWalkingSpeedValid %d, isStepLengthValid %d>"), v4, v5, v7, v9, v10, -[CLMobilityCalBoutMetrics boundaryType](self, "boundaryType"), -[CLMobilityCalBoutMetrics isWalkingSpeedValid](self, "isWalkingSpeedValid"), -[CLMobilityCalBoutMetrics isStepLengthValid](self, "isStepLengthValid"));
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

- (double)invalidGradePercentage
{
  return self->_invalidGradePercentage;
}

- (int)boundaryType
{
  return self->_boundaryType;
}

- (BOOL)isWalkingSpeedValid
{
  return self->_isWalkingSpeedValid;
}

- (BOOL)isStepLengthValid
{
  return self->_isStepLengthValid;
}

@end
