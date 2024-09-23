@implementation BKHexadecimalIntegerEventStatistic

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  unint64_t value;
  int64_t hexFormatModifier;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[5];

  v4 = a3;
  value = self->_value;
  if (value)
  {
    hexFormatModifier = self->_hexFormatModifier;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEventStatistic label](self, "label"));
    if (hexFormatModifier)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100018D00;
      v10[3] = &unk_1000ECB10;
      v10[4] = self;
      objc_msgSend(v4, "appendCustomFormatWithName:block:", v7, v10);
    }
    else
    {
      v8 = objc_msgSend(v4, "appendUnsignedInteger:withName:format:", value, v7, 1);
    }

    v9.receiver = self;
    v9.super_class = (Class)BKHexadecimalIntegerEventStatistic;
    -[BKEventStatistic appendDescriptionToFormatter:](&v9, "appendDescriptionToFormatter:", v4);
  }

}

+ (id)statisticWithLabel:(id)a3 hexFormatModifier:(int64_t)a4
{
  id v5;
  _QWORD *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___BKHexadecimalIntegerEventStatistic;
  v5 = objc_msgSendSuper2(&v8, "statisticWithLabel:", a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
    v6[5] = a4;
  return v6;
}

- (void)excludeBitNumber:(int64_t)a3
{
  -[BKHexadecimalIntegerEventStatistic setValue:](self, "setValue:", self->_value & ~(1 << a3));
}

- (void)setValue:(unint64_t)a3
{
  unsigned int v5;
  uint64_t v6;

  if (self->_value != a3)
  {
    self->_value = a3;
    v5 = !-[BKEventStatistic automaticResetDisabled](self, "automaticResetDisabled");
    if (a3)
      v6 = 1;
    else
      v6 = v5;
    -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", v6);
  }
}

- (void)includeBitNumber:(int64_t)a3
{
  -[BKHexadecimalIntegerEventStatistic setValue:](self, "setValue:", self->_value | (1 << a3));
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHexadecimalIntegerEventStatistic;
  -[BKEventStatistic reset](&v3, "reset");
  self->_value = 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_value));
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
  v6 = objc_opt_class(BKHexadecimalIntegerEventStatistic, v5);
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

- (void)includeMask:(unint64_t)a3
{
  -[BKHexadecimalIntegerEventStatistic setValue:](self, "setValue:", self->_value | a3);
}

- (void)excludeMask:(unint64_t)a3
{
  -[BKHexadecimalIntegerEventStatistic setValue:](self, "setValue:", self->_value & ~a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKHexadecimalIntegerEventStatistic;
  result = -[BKEventStatistic copyWithZone:](&v5, "copyWithZone:", a3);
  *((_QWORD *)result + 4) = self->_value;
  return result;
}

- (unint64_t)value
{
  return self->_value;
}

@end
