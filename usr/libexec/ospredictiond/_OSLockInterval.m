@implementation _OSLockInterval

- (_OSLockInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andIsLocked:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _OSLockInterval *v10;
  _OSLockInterval *v11;
  void *v12;
  void *v13;
  _OSLockInterval *v14;
  _OSLockInterval *v15;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_OSLockInterval;
  v10 = -[_OSLockInterval init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    -[_OSIInterval setStartDate:](v10, "setStartDate:", v8);
    -[_OSIInterval setEndDate:](v11, "setEndDate:", v9);
    -[_OSLockInterval setIsLocked:](v11, "setIsLocked:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval endDate](v11, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval startDate](v11, "startDate"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    -[_OSIInterval setDuration:](v11, "setDuration:");

  }
  if (-[_OSIInterval isValidInterval](v11, "isValidInterval"))
    v14 = v11;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (BOOL)hasReasonableDuration
{
  double v3;
  double v5;

  -[_OSIInterval duration](self, "duration");
  if (v3 < 60.0)
    return 0;
  -[_OSIInterval duration](self, "duration");
  return v5 <= 86400.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSLockInterval;
  v4 = -[_OSIInterval copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setIsLocked:", -[_OSLockInterval isLocked](self, "isLocked"));
  return v4;
}

- (id)description
{
  NSString *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_OSLockInterval;
  v3 = -[_OSIInterval description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[_OSLockInterval isLocked](self, "isLocked");
  v6 = CFSTR("N");
  if (v5)
    v6 = CFSTR("Y");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Locked=%@] %@"), v6, v4));

  return v7;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

@end
