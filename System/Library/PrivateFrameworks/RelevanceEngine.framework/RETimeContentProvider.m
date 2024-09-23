@implementation RETimeContentProvider

+ (id)timeContentProviderWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:timeZone:", v7, v6);

  return v8;
}

- (RETimeContentProvider)initWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  RETimeContentProvider *v8;
  uint64_t v9;
  NSDate *date;
  uint64_t v11;
  NSTimeZone *timeZone;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RETimeContentProvider;
  v8 = -[RETimeContentProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    timeZone = v8->_timeZone;
    v8->_timeZone = (NSTimeZone *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDate:timeZone:", self->_date, self->_timeZone);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_date, "hash");
  return -[NSTimeZone hash](self->_timeZone, "hash") ^ v3;
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
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "timeZone");
    v11 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == self->_timeZone)
      v10 = 1;
    else
      v10 = -[NSTimeZone isEqual:](v11, "isEqual:");

    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  return (id)objc_msgSend(getCLKTimeTextProviderClass(), "textProviderWithDate:timeZone:", self->_date, self->_timeZone);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));

}

- (RETimeContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RETimeContentProvider *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RETimeContentProvider initWithDate:timeZone:](self, "initWithDate:timeZone:", v5, v6);
  return v7;
}

- (id)attributedStringRepresentation
{
  id v3;
  void *v4;
  void *v5;

  if (attributedStringRepresentation_onceToken != -1)
    dispatch_once(&attributedStringRepresentation_onceToken, &__block_literal_global_49);
  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend((id)attributedStringRepresentation_formatter, "stringFromDate:", self->_date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  return v5;
}

uint64_t __55__RETimeContentProvider_attributedStringRepresentation__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)attributedStringRepresentation_formatter;
  attributedStringRepresentation_formatter = (uint64_t)v0;

  objc_msgSend((id)attributedStringRepresentation_formatter, "setTimeStyle:", 2);
  return objc_msgSend((id)attributedStringRepresentation_formatter, "setDateStyle:", 0);
}

- (NSDate)date
{
  return self->_date;
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
