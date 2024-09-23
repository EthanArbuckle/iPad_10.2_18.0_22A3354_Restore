@implementation BKIntegerEventStatistic

- (void)appendDescriptionToFormatter:(id)a3
{
  int64_t value;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  value = self->_value;
  if (value)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    v7 = objc_msgSend(v5, "appendInteger:withName:", value, v6);

    v8.receiver = self;
    v8.super_class = (Class)BKIntegerEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v8, "appendDescriptionToFormatter:", v5);

  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKIntegerEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_value = 0;
}

- (void)increment
{
  ++self->_value;
  -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1);
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_value));
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
  id v11;
  BOOL v12;

  v4 = a3;
  v6 = objc_opt_class(BKIntegerEventStatistic, v5);
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

  v11 = objc_msgSend(v10, "value");
  v12 = v11 == (id)self->_value;

  return v12;
}

- (void)setValue:(int64_t)a3
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
  v5.super_class = (Class)BKIntegerEventStatistic;
  result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((_QWORD *)result + 4) = self->_value;
  return result;
}

- (int64_t)value
{
  return self->_value;
}

@end
