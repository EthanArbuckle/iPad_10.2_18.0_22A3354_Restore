@implementation RETimeIntervalContentProvider

+ (id)timeIntervalContentProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:timeZone:", v10, v9, v8);

  return v11;
}

- (RETimeIntervalContentProvider)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  RETimeIntervalContentProvider *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  uint64_t v16;
  NSTimeZone *timeZone;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RETimeIntervalContentProvider;
  v11 = -[RETimeIntervalContentProvider init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    timeZone = v11->_timeZone;
    v11->_timeZone = (NSTimeZone *)v16;

  }
  return v11;
}

- (id)attributedStringRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithString:", v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStartDate:endDate:timeZone:", self->_startDate, self->_endDate, self->_timeZone);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDate hash](self->_startDate, "hash");
  v4 = -[NSDate hash](self->_endDate, "hash") ^ v3;
  return v4 ^ -[NSTimeZone hash](self->_timeZone, "hash");
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
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  int v14;
  NSTimeZone *v15;
  NSTimeZone *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "startDate");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_startDate;
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
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend(v5, "endDate");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v12 = self->_endDate;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      v14 = -[NSDate isEqual:](v11, "isEqual:", v12);

      if (!v14)
      {
        v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v5, "timeZone");
    v15 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 == self->_timeZone)
      v10 = 1;
    else
      v10 = -[NSTimeZone isEqual:](v15, "isEqual:");

    goto LABEL_15;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  return (id)objc_msgSend(getCLKTimeIntervalTextProviderClass(), "textProviderWithStartDate:endDate:timeZone:", self->_startDate, self->_endDate, self->_timeZone);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));

}

- (RETimeIntervalContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RETimeIntervalContentProvider *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RETimeIntervalContentProvider initWithStartDate:endDate:timeZone:](self, "initWithStartDate:endDate:timeZone:", v5, v6, v7);
  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
