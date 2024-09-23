@implementation CMMotionTimeRange

- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  CMMotionTimeRange *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMMotionTimeRange;
  v6 = -[CMMotionTimeRange init](&v8, "init");
  if (v6)
  {
    v6->fStartDate = (NSDate *)objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", a3);
    v6->fEndDate = (NSDate *)objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMMotionTimeRange;
  -[CMLogItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[2] = -[NSDate copy](self->fStartDate, "copy");
    v4[3] = -[NSDate copy](self->fEndDate, "copy");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionTimeRange)initWithCoder:(id)a3
{
  uint64_t v4;
  CMMotionTimeRange *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMMotionTimeRange;
  v5 = -[CMMotionTimeRange init](&v8, "init");
  if (v5)
  {
    v5->fStartDate = (NSDate *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v4), CFSTR("kCMMotionTimeRangeCodingKeyStartDate"));
    v5->fEndDate = (NSDate *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v6), CFSTR("kCMMotionTimeRangeCodingKeyEndDate"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->fStartDate, CFSTR("kCMMotionTimeRangeCodingKeyStartDate"));
  objc_msgSend(a3, "encodeObject:forKey:", self->fEndDate, CFSTR("kCMMotionTimeRangeCodingKeyEndDate"));
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<startDate %@, endDate %@>"), NSStringFromClass(v3), -[CMMotionTimeRange startDate](self, "startDate"), -[CMMotionTimeRange endDate](self, "endDate"));
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3
{
  return -[CMMotionTimeRange initWithStartDate:endDate:]([CMMotionTimeRange alloc], "initWithStartDate:endDate:", a3.var0, a3.var1);
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMMotionTimeRange.mm"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeRange"));
  objc_msgSend(objc_msgSend(a3, "startDate"), "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(objc_msgSend(a3, "endDate"), "timeIntervalSinceReferenceDate");
  v7 = v6;
  v8 = v5;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

@end
