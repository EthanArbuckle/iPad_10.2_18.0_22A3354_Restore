@implementation _OSActivityInterval

- (_OSActivityInterval)initWithStartTime:(double)a3 andEndTime:(double)a4 andActiveStatus:(BOOL)a5
{
  _BOOL8 v5;
  _OSActivityInterval *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OSActivityInterval *v13;
  _OSActivityInterval *v14;
  objc_super v16;

  v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_OSActivityInterval;
  v8 = -[_OSActivityInterval init](&v16, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
    -[_OSIInterval setStartDate:](v8, "setStartDate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4));
    -[_OSIInterval setEndDate:](v8, "setEndDate:", v10);

    -[_OSActivityInterval setIsActive:](v8, "setIsActive:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval endDate](v8, "endDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval startDate](v8, "startDate"));
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    -[_OSIInterval setDuration:](v8, "setDuration:");

  }
  if (-[_OSIInterval isValidInterval](v8, "isValidInterval"))
    v13 = v8;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (_OSActivityInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andActiveStatus:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v11;

  return -[_OSActivityInterval initWithStartTime:andEndTime:andActiveStatus:](self, "initWithStartTime:andEndTime:andActiveStatus:", v5, v10, v12);
}

- (BOOL)hasReasonableDuration
{
  double v3;
  double v5;

  -[_OSIInterval duration](self, "duration");
  if (v3 < 30.0)
    return 0;
  -[_OSIInterval duration](self, "duration");
  return v5 <= 604800.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSActivityInterval;
  v4 = -[_OSIInterval copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setIsActive:", -[_OSActivityInterval isActive](self, "isActive"));
  return v4;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

@end
