@implementation BKAverageTimeIntervalEventStatistic

+ (id)statisticWithLabel:(id)a3 scale:(int64_t)a4
{
  id v5;
  _QWORD *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___BKAverageTimeIntervalEventStatistic;
  v5 = objc_msgSendSuper2(&v8, "statisticWithLabel:", a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(v5);
  v6[4] = a4;
  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  double value;
  int64_t scale;
  const __CFString *v6;
  const __CFString *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  value = self->_value;
  if (value != 0.0)
  {
    scale = self->_scale;
    if (scale <= 0)
    {
      self->_scale = 1;
      value = self->_value;
      v7 = CFSTR(" (s)");
      v8 = 1.0;
    }
    else
    {
      v6 = CFSTR(" (s)");
      if (scale == 1000000)
        v6 = CFSTR(" (µs)");
      if (scale == 1000)
        v7 = CFSTR(" (ms)");
      else
        v7 = v6;
      v8 = (double)scale;
    }
    v9 = value * v8;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v7));
    v13 = objc_msgSend(v10, "appendDouble:withName:decimalPrecision:", v12, 2, v9);

    v14.receiver = self;
    v14.super_class = (Class)BKAverageTimeIntervalEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v14, "appendDescriptionToFormatter:", v10);

  }
}

- (void)begin
{
  double v3;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_startInterval = v3;
}

- (void)end
{
  double v3;
  double v4;
  int64_t v5;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3 - self->_startInterval + self->_cumulativeInterval;
  self->_cumulativeInterval = v4;
  v5 = self->_count + 1;
  self->_count = v5;
  self->_value = v4 / (double)v5;
  -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAverageTimeIntervalEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_value = 0.0;
  self->_cumulativeInterval = 0.0;
  self->_count = 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_value));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  v6 = objc_opt_class(BKAverageTimeIntervalEventStatistic, v5);
  v7 = v4;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "value");
  v12 = v11;

  v13 = v12 == self->_value;
  return v13;
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAverageTimeIntervalEventStatistic;
  result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_value;
  return result;
}

- (double)value
{
  return self->_value;
}

@end
