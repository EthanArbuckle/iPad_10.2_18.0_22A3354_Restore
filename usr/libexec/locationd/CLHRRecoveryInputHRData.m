@implementation CLHRRecoveryInputHRData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHRRecoveryInputHRData)initWithCoder:(id)a3
{
  CLHRRecoveryInputHRData *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLHRRecoveryInputHRData;
  v4 = -[CLHRRecoveryInputHRData init](&v9, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mets"));
    v4->_hr = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("grade"));
    v4->_hrConfidence = v7;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mets"), self->_hr);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("grade"), self->_hrConfidence);
}

- (CLHRRecoveryInputHRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 hr:(double)a5 hrConfidence:(double)a6
{
  CLHRRecoveryInputHRData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLHRRecoveryInputHRData;
  result = -[CLHRRecoveryInputHRData init](&v11, "init");
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_hr = a5;
    result->_hrConfidence = a6;
  }
  return result;
}

- (CLHRRecoveryInputHRData)initWithHRRecoveryInputHR:(const HRRecoveryInputHR *)a3
{
  CLHRRecoveryInputHRData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLHRRecoveryInputHRData;
  result = -[CLHRRecoveryInputHRData init](&v5, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    result->_hr = a3->var2;
    result->_hrConfidence = a3->var3;
  }
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLHRRecoveryInputHRData recordId](self, "recordId");
  -[CLHRRecoveryInputHRData startTime](self, "startTime");
  v7 = v6;
  -[CLHRRecoveryInputHRData hr](self, "hr");
  v9 = v8;
  -[CLHRRecoveryInputHRData hrConfidence](self, "hrConfidence");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %llu, startTime %f, hr %f, hrConfidence %f>"), v4, v5, v7, v9, v10);
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)hr
{
  return self->_hr;
}

- (double)hrConfidence
{
  return self->_hrConfidence;
}

@end
