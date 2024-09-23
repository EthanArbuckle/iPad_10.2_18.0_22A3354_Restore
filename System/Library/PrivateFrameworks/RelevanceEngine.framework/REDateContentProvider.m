@implementation REDateContentProvider

+ (id)dateContentProviderWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:units:timeZone:", v9, a4, v8);

  return v10;
}

- (REDateContentProvider)initWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  REDateContentProvider *v10;
  uint64_t v11;
  NSDate *date;
  uint64_t v13;
  NSTimeZone *timeZone;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)REDateContentProvider;
  v10 = -[REDateContentProvider init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v11;

    v10->_units = a4;
    v13 = objc_msgSend(v9, "copy");
    timeZone = v10->_timeZone;
    v10->_timeZone = (NSTimeZone *)v13;

  }
  return v10;
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
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDate:units:timeZone:", self->_date, self->_units, self->_timeZone);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_units ^ -[NSDate hash](self->_date, "hash");
  return v3 ^ -[NSTimeZone hash](self->_timeZone, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  int v9;
  char v10;
  NSTimeZone *v11;
  NSTimeZone *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "units") != self->_units)
    {
      v10 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v5, "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_date;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = -[NSDate isEqual:](v6, "isEqual:", v7);

      if (!v9)
      {
        v10 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    objc_msgSend(v5, "timeZone");
    v11 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == self->_timeZone)
      v10 = 1;
    else
      v10 = -[NSTimeZone isEqual:](v11, "isEqual:");

    goto LABEL_13;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  return (id)objc_msgSend(getCLKDateTextProviderClass(), "textProviderWithDate:units:timeZone:", self->_date, self->_units, self->_timeZone);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  void *v5;
  id v6;

  date = self->_date;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_units);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("units"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
}

- (REDateContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  REDateContentProvider *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("units"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REDateContentProvider initWithDate:units:timeZone:](self, "initWithDate:units:timeZone:", v5, v7, v8);
  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)units
{
  return self->_units;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
