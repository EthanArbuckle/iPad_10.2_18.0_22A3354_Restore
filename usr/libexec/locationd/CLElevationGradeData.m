@implementation CLElevationGradeData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLElevationGradeData)initWithCoder:(id)a3
{
  CLElevationGradeData *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLElevationGradeData;
  v4 = -[CLElevationGradeData init](&v8, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fractionalGrade"));
    *(float *)&v6 = v6;
    v4->_fractionalGrade = *(float *)&v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fractionalGrade"), self->_fractionalGrade);
}

- (CLElevationGradeData)initWithElevationGradeEntry:(const CLElevationGradeEntry *)a3
{
  CLElevationGradeData *result;
  float var2;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLElevationGradeData;
  result = -[CLElevationGradeData init](&v6, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    var2 = a3->var2;
    result->_fractionalGrade = var2;
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
  float v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLElevationGradeData recordId](self, "recordId");
  -[CLElevationGradeData startTime](self, "startTime");
  v7 = v6;
  -[CLElevationGradeData fractionalGrade](self, "fractionalGrade");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %llu, startTime %f, fractionalGrade %f>"), v4, v5, v7, v8);
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)fractionalGrade
{
  return self->_fractionalGrade;
}

@end
