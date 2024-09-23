@implementation RERelativeDateContentProvider

+ (id)relativeDateContentProviderWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5
{
  id v7;
  RERelativeDateContentProvider *v8;

  v7 = a3;
  v8 = -[RERelativeDateContentProvider initWithDate:style:units:]([RERelativeDateContentProvider alloc], "initWithDate:style:units:", v7, a4, a5);

  return v8;
}

- (RERelativeDateContentProvider)initWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5
{
  id v8;
  RERelativeDateContentProvider *v9;
  uint64_t v10;
  NSDate *date;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RERelativeDateContentProvider;
  v9 = -[RERelativeDateContentProvider init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    date = v9->_date;
    v9->_date = (NSDate *)v10;

    v9->_style = a4;
    v9->_units = a5;
  }

  return v9;
}

- (id)attributedStringRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSinceNow](self->_date, "timeIntervalSinceNow");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDate:style:units:", self->_date, self->_style, self->_units);
}

- (unint64_t)hash
{
  return self->_style ^ self->_units ^ -[NSDate hash](self->_date, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSDate *v6;
  NSDate *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "units") == self->_units && objc_msgSend(v5, "style") == self->_style)
    {
      objc_msgSend(v5, "date");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_date)
        v8 = 1;
      else
        v8 = -[NSDate isEqual:](v6, "isEqual:");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)clockKitTextProviderRepresentation
{
  int64_t style;

  if ((unint64_t)(self->_style - 1) >= 3)
    style = 0;
  else
    style = self->_style;
  return (id)objc_msgSend(getCLKRelativeDateTextProviderClass(), "textProviderWithDate:style:units:", self->_date, style, self->_units);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;
  void *v6;
  id v7;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_units);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("units"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_style);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("style"));

}

- (RERelativeDateContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  RERelativeDateContentProvider *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("units"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("style"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = -[RERelativeDateContentProvider initWithDate:style:units:](self, "initWithDate:style:units:", v5, v9, v7);

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)units
{
  return self->_units;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
