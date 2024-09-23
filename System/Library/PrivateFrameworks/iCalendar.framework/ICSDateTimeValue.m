@implementation ICSDateTimeValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "appendFormat:", CFSTR("%.4d%.2d%.2dT%.2d%.2d%.2d"), -[ICSDateValue year](self, "year"), -[ICSDateValue month](self, "month"), -[ICSDateValue day](self, "day"), -[ICSDateTimeValue hour](self, "hour"), -[ICSDateTimeValue minute](self, "minute"), -[ICSDateTimeValue second](self, "second"));

}

- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  return -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:](self, "initWithYear:month:day:hour:minute:second:", a3, a4, a5, 0, 0, 0);
}

- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8
{
  ICSDateTimeValue *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICSDateTimeValue;
  result = -[ICSDateValue initWithYear:month:day:](&v12, sel_initWithYear_month_day_, a3, a4, a5);
  if (result)
  {
    result->_hour = a6;
    result->_minute = a7;
    result->_second = a8;
  }
  return result;
}

- (id)components
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSDateTimeValue;
  -[ICSDateValue components](&v5, sel_components);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", self->_hour);
  objc_msgSend(v3, "setMinute:", self->_minute);
  objc_msgSend(v3, "setSecond:", self->_second);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSDateTimeValue;
  v4 = a3;
  -[ICSDateValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_hour, CFSTR("Hour"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minute, CFSTR("Minute"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_second, CFSTR("Second"));

}

- (ICSDateTimeValue)initWithCoder:(id)a3
{
  id v3;
  ICSDateTimeValue *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSDateTimeValue;
  v3 = a3;
  v4 = -[ICSDateValue initWithCoder:](&v7, sel_initWithCoder_, v3);
  v4->_hour = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Hour"), v7.receiver, v7.super_class);
  v4->_minute = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Minute"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Second"));

  v4->_second = v5;
  return v4;
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (int)dateType
{
  return 5016;
}

@end
