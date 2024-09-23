@implementation SKUICounterViewElement

- (SKUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICounterViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDate *endDate;
  void *v18;
  uint64_t v19;
  NSDate *startValueDate;
  void *v21;
  double v22;
  uint64_t v23;
  NSString *numberFormat;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICounterViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUICounterViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v28, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_counterType = objc_msgSend(v12, "isEqualToString:", CFSTR("timer")) ^ 1;
    objc_msgSend(v8, "getAttribute:", CFSTR("dateFormat"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqualToString:", CFSTR("hm")))
    {
      v14 = 3;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("hms")))
    {
      v14 = 2;
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("dhms")))
      {
        v11->_dateFormatType = 0;
LABEL_14:
        objc_msgSend(v8, "getAttribute:", CFSTR("endDate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
        {
          SKUIViewElementDateWithString(v15);
          v16 = objc_claimAutoreleasedReturnValue();
          endDate = v11->_endDate;
          v11->_endDate = (NSDate *)v16;

        }
        objc_msgSend(v8, "getAttribute:", CFSTR("timestamp"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "length"))
        {
          SKUIViewElementDateWithString(v18);
          v19 = objc_claimAutoreleasedReturnValue();
          startValueDate = v11->_startValueDate;
          v11->_startValueDate = (NSDate *)v19;

        }
        objc_msgSend(v8, "getAttribute:", CFSTR("rate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v11->_changeRatePerSecond = v22;

        objc_msgSend(v8, "getAttribute:", CFSTR("numberFormat"));
        v23 = objc_claimAutoreleasedReturnValue();
        numberFormat = v11->_numberFormat;
        v11->_numberFormat = (NSString *)v23;

        objc_msgSend(v8, "getAttribute:", CFSTR("value"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_startValue = objc_msgSend(v25, "longLongValue");

        objc_msgSend(v8, "getAttribute:", CFSTR("endValue"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_stopValue = objc_msgSend(v26, "longLongValue");

        goto LABEL_19;
      }
      v14 = 1;
    }
    v11->_dateFormatType = v14;
    goto LABEL_14;
  }
LABEL_19:

  return v11;
}

- (SKUIImageViewElement)backgroundImageElement
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (int64_t)currentNumberValue
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;

  v3 = -[SKUICounterViewElement stopValue](self, "stopValue");
  -[SKUICounterViewElement startValueDate](self, "startValueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKUICounterViewElement changeRatePerSecond](self, "changeRatePerSecond");
    v6 = v5;
    v7 = (double)-[SKUICounterViewElement startValue](self, "startValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICounterViewElement startValueDate](self, "startValueDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = (uint64_t)(v7 + v10 * v6);

    if (v3 >= v11)
      v12 = v11;
    else
      v12 = v3;
    if (v3 <= v11)
      v13 = v11;
    else
      v13 = v3;
    if (v6 >= 0.0)
      v3 = v12;
    else
      v3 = v13;
  }

  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICounterViewElement *v4;
  SKUICounterViewElement *v5;
  SKUICounterViewElement *v6;
  double v7;
  NSDate *v8;
  NSDate *endDate;
  NSString *v10;
  NSString *numberFormat;
  NSDate *v12;
  NSDate *startValueDate;
  objc_super v15;

  v4 = (SKUICounterViewElement *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SKUICounterViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v15, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUICounterViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SKUICounterViewElement changeRatePerSecond](v4, "changeRatePerSecond");
    self->_changeRatePerSecond = v7;
    self->_counterType = -[SKUICounterViewElement counterType](v4, "counterType");
    self->_dateFormatType = -[SKUICounterViewElement dateFormatType](v4, "dateFormatType");
    -[SKUICounterViewElement endDate](v4, "endDate");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v8;

    -[SKUICounterViewElement numberFormat](v4, "numberFormat");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    numberFormat = self->_numberFormat;
    self->_numberFormat = v10;

    self->_startValue = -[SKUICounterViewElement startValue](v4, "startValue");
    -[SKUICounterViewElement startValueDate](v4, "startValueDate");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startValueDate = self->_startValueDate;
    self->_startValueDate = v12;

    self->_stopValue = -[SKUICounterViewElement stopValue](v4, "stopValue");
  }

  return v6;
}

- (double)changeRatePerSecond
{
  return self->_changeRatePerSecond;
}

- (int64_t)counterType
{
  return self->_counterType;
}

- (int64_t)dateFormatType
{
  return self->_dateFormatType;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (int64_t)startValue
{
  return self->_startValue;
}

- (NSDate)startValueDate
{
  return self->_startValueDate;
}

- (int64_t)stopValue
{
  return self->_stopValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startValueDate, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICounterViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
