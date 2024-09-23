@implementation ChartLabelInfo

- (void)setString:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_string != v5 && !self->_immutable)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_string, a3);
    v5 = v6;
    self->_size = (CGSize)*MEMORY[0x24BDBF148];
  }

}

- (void)setPosition:(double)a3
{
  if (!self->_immutable)
    self->_position = a3;
}

- (void)setImmutable:(BOOL)a3
{
  self->_immutable = a3;
}

- (void)setStringToMonthAndDayWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)monthDayFormatter;
  if (!monthDayFormatter)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v9 = (void *)monthDayFormatter;
    monthDayFormatter = (uint64_t)v8;

    v10 = (void *)monthDayFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v11);

    objc_msgSend((id)monthDayFormatter, "setDateStyle:", 1);
    objc_msgSend((id)monthDayFormatter, "setTimeStyle:", 1);
    v12 = (void *)monthDayFormatter;
    CPDateFormatStringForFormatType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateFormat:", v13);

    v7 = (void *)monthDayFormatter;
  }
  objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend((id)monthDayFormatter, "stringFromDate:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartLabelInfo setString:](self, "setString:", v14);

}

- (void)setStringToYearWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)yearFormatter;
  if (!yearFormatter)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v9 = (void *)yearFormatter;
    yearFormatter = (uint64_t)v8;

    v10 = (void *)yearFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v11);

    objc_msgSend((id)yearFormatter, "setDateStyle:", 1);
    objc_msgSend((id)yearFormatter, "setTimeStyle:", 1);
    v12 = (void *)yearFormatter;
    CPDateFormatStringForFormatType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateFormat:", v13);

    v7 = (void *)yearFormatter;
  }
  objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend((id)yearFormatter, "stringFromDate:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartLabelInfo setString:](self, "setString:", v14);

}

- (CGSize)size
{
  NSString *string;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  double width;
  double height;
  uint64_t v11;
  _QWORD v12[2];
  CGSize result;

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (-[NSString length](self->_string, "length"))
  {
    if (self->_size.width == *MEMORY[0x24BDBF148] && self->_size.height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      string = self->_string;
      v11 = *MEMORY[0x24BDF65F8];
      +[ChartLabelInfoManager chartLabelFont](ChartLabelInfoManager, "chartLabelFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString sizeWithAttributes:](string, "sizeWithAttributes:", v6);
      self->_size.width = v7;
      self->_size.height = v8;

    }
  }
  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)retainStringAndSizeFromLabelInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartLabelInfo setString:](self, "setString:", v5);

  objc_msgSend(v4, "size");
  -[ChartLabelInfo setSize:](self, "setSize:");
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ChartLabelInfo setAccessibilityLabel:](self, "setAccessibilityLabel:", v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ChartLabelInfo *v4;
  void *v5;

  v4 = objc_alloc_init(ChartLabelInfo);
  -[ChartLabelInfo setString:](v4, "setString:", self->_string);
  -[ChartLabelInfo setSize:](v4, "setSize:", self->_size.width, self->_size.height);
  -[ChartLabelInfo setPosition:](v4, "setPosition:", self->_position);
  -[ChartLabelInfo accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartLabelInfo setAccessibilityLabel:](v4, "setAccessibilityLabel:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  NSString *string;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  string = self->_string;
  NSStringFromCGSize(self->_size);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ChartLabelInfo with string = %@, size = %@, position = %f"), string, v5, *(_QWORD *)&self->_position);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)position
{
  return self->_position;
}

- (BOOL)immutable
{
  return self->_immutable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
