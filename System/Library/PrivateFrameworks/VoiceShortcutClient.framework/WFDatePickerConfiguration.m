@implementation WFDatePickerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFDatePickerConfiguration datePickerMode](self, "datePickerMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatePickerMode:", v5);

  -[WFDatePickerConfiguration defaultDate](self, "defaultDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultDate:", v6);

  -[WFDatePickerConfiguration maximumDate](self, "maximumDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumDate:", v7);

  -[WFDatePickerConfiguration minimumDate](self, "minimumDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumDate:", v8);

  return v4;
}

- (WFDatePickerConfiguration)initWithCoder:(id)a3
{
  id v4;
  WFDatePickerConfiguration *v5;
  uint64_t v6;
  NSString *datePickerMode;
  uint64_t v8;
  NSDate *defaultDate;
  uint64_t v10;
  NSDate *maximumDate;
  uint64_t v12;
  NSDate *minimumDate;
  WFDatePickerConfiguration *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFDatePickerConfiguration;
  v5 = -[WFDatePickerConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("datePickerMode"));
    v6 = objc_claimAutoreleasedReturnValue();
    datePickerMode = v5->_datePickerMode;
    v5->_datePickerMode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    defaultDate = v5->_defaultDate;
    v5->_defaultDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumDate = v5->_maximumDate;
    v5->_maximumDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    minimumDate = v5->_minimumDate;
    v5->_minimumDate = (NSDate *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFDatePickerConfiguration datePickerMode](self, "datePickerMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("datePickerMode"));

  -[WFDatePickerConfiguration defaultDate](self, "defaultDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("defaultDate"));

  -[WFDatePickerConfiguration maximumDate](self, "maximumDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("maximumDate"));

  -[WFDatePickerConfiguration minimumDate](self, "minimumDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("minimumDate"));

}

- (NSString)datePickerMode
{
  return self->_datePickerMode;
}

- (void)setDatePickerMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)defaultDate
{
  return self->_defaultDate;
}

- (void)setDefaultDate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDate, a3);
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (void)setMinimumDate:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDate, a3);
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void)setMaximumDate:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_datePickerMode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
