@implementation PKPassDateRangeField

- (id)asDictionary
{
  void *v2;
  void *v3;

  -[PKPassDateField asMutableDictionary](self, "asMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)asMuteDictionary
{
  void *v3;
  void *v4;
  NSDate *startDate;
  NSDate *endDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassDateRangeField;
  -[PKPassDateField asMutableDictionary](&v8, sel_asMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  startDate = self->_startDate;
  if (startDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", startDate, CFSTR("startDate"));
  endDate = self->_endDate;
  if (endDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", endDate, CFSTR("endDate"));
  return v4;
}

- (PKPassDateRangeField)initWithCoder:(id)a3
{
  id v4;
  PKPassDateRangeField *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassDateRangeField;
  v5 = -[PKPassDateField initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateRangeField setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDateRangeField setEndDate:](v5, "setEndDate:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassDateRangeField;
  v4 = a3;
  -[PKPassDateField encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassDateRangeField;
  v4 = -[PKPassDateField copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStartDate:", self->_startDate);
  objc_msgSend(v4, "setEndDate:", self->_endDate);
  return v4;
}

- (NSString)displayableStartDate
{
  NSString *displayableStartDate;
  NSString *v4;
  NSString *v5;

  displayableStartDate = self->_displayableStartDate;
  if (!displayableStartDate)
  {
    -[PKPassDateRangeField _displayableDate:](self, "_displayableDate:", self->_startDate);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayableStartDate;
    self->_displayableStartDate = v4;

    displayableStartDate = self->_displayableStartDate;
  }
  return displayableStartDate;
}

- (NSString)displayableEndDate
{
  NSString *displayableEndDate;
  NSString *v4;
  NSString *v5;

  displayableEndDate = self->_displayableEndDate;
  if (!displayableEndDate)
  {
    -[PKPassDateRangeField _displayableDate:](self, "_displayableDate:", self->_endDate);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayableEndDate;
    self->_displayableEndDate = v4;

    displayableEndDate = self->_displayableEndDate;
  }
  return displayableEndDate;
}

- (id)_displayableDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  if (-[PKPassDateField dateStyle](self, "dateStyle") || -[PKPassDateField timeStyle](self, "timeStyle"))
  {
    objc_msgSend(v5, "setDateStyle:", -[PKPassDateField dateStyle](self, "dateStyle"));
    objc_msgSend(v5, "setTimeStyle:", -[PKPassDateField timeStyle](self, "timeStyle"));
  }
  else
  {
    objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("M d"));
  }
  objc_msgSend(v5, "setDoesRelativeDateFormatting:", -[PKPassDateField isRelative](self, "isRelative"));
  if (-[PKPassDateField ignoresTimeZone](self, "ignoresTimeZone"))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

  }
  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)value
{
  NSString *value;
  NSTimeZone *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  value = self->super.super._value;
  if (!value)
  {
    if (self->_startDate && self->_endDate)
    {
      if (-[PKPassDateField ignoresTimeZone](self, "ignoresTimeZone"))
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
        v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
      PKDateRangeStringFromDateToDate(self->_startDate, self->_endDate, 0, 1, 0, v4);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->super.super._value;
      self->super.super._value = v6;

    }
    else
    {
      -[PKPassField unformattedValue](self, "unformattedValue");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v4 = (NSTimeZone *)self->super.super._value;
      self->super.super._value = v5;
    }

    value = self->super.super._value;
  }
  return value;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setDisplayableStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setDisplayableEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_displayableEndDate, 0);
  objc_storeStrong((id *)&self->_displayableStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
