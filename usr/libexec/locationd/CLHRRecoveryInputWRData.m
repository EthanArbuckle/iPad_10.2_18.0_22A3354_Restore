@implementation CLHRRecoveryInputWRData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHRRecoveryInputWRData)initWithCoder:(id)a3
{
  CLHRRecoveryInputWRData *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLHRRecoveryInputWRData;
  v4 = -[CLHRRecoveryInputWRData init](&v10, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mets"));
    v4->_mets = v6;
    v4->_gradeType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("gradeType"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("grade"));
    v4->_grade = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("userMets"));
    v4->_userMets = v8;
    v4->_userMetsSource = objc_msgSend(a3, "decodeIntForKey:", CFSTR("userMetsSource"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mets"), self->_mets);
  objc_msgSend(a3, "encodeInt:forKey:", self->_gradeType, CFSTR("gradeType"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("grade"), self->_grade);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("userMets"), self->_userMets);
  objc_msgSend(a3, "encodeInt:forKey:", self->_userMetsSource, CFSTR("userMetsSource"));
}

- (CLHRRecoveryInputWRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 mets:(double)a5 gradeType:(int)a6 grade:(double)a7 userMets:(double)a8 userMetsSource:(int)a9
{
  CLHRRecoveryInputWRData *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLHRRecoveryInputWRData;
  result = -[CLHRRecoveryInputWRData init](&v17, "init");
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_mets = a5;
    result->_grade = a7;
    result->_userMets = a8;
    result->_gradeType = a6;
    result->_userMetsSource = a9;
  }
  return result;
}

- (CLHRRecoveryInputWRData)initWithHRRecoveryInputWR:(const HRRecoveryInputWR *)a3
{
  CLHRRecoveryInputWRData *result;
  int var3;
  int var6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLHRRecoveryInputWRData;
  result = -[CLHRRecoveryInputWRData init](&v7, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    result->_mets = a3->var2;
    var3 = a3->var3;
    result->_grade = a3->var4;
    result->_userMets = a3->var5;
    var6 = a3->var6;
    result->_gradeType = var3;
    result->_userMetsSource = var6;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLHRRecoveryInputWRData recordId](self, "recordId");
  -[CLHRRecoveryInputWRData startTime](self, "startTime");
  v7 = v6;
  -[CLHRRecoveryInputWRData mets](self, "mets");
  v9 = v8;
  v10 = -[CLHRRecoveryInputWRData gradeType](self, "gradeType");
  -[CLHRRecoveryInputWRData grade](self, "grade");
  v12 = v11;
  -[CLHRRecoveryInputWRData userMets](self, "userMets");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %llu, startTime %f, mets %f, gradeType %d, grade %f, userMets, %f, userMetsSource, %d>"), v4, v5, v7, v9, v10, v12, v13, -[CLHRRecoveryInputWRData userMetsSource](self, "userMetsSource"));
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)mets
{
  return self->_mets;
}

- (int)gradeType
{
  return self->_gradeType;
}

- (double)grade
{
  return self->_grade;
}

- (double)userMets
{
  return self->_userMets;
}

- (int)userMetsSource
{
  return self->_userMetsSource;
}

@end
