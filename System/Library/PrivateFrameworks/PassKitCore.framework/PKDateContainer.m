@implementation PKDateContainer

- (PKDateContainer)init
{

  return 0;
}

- (PKDateContainer)initWithDate:(id)a3 timeZone:(id)a4
{
  id v7;
  PKDateContainer *result;
  PKDateContainer *v9;
  PKDateContainer *v10;
  objc_super v11;

  v7 = a3;
  result = (PKDateContainer *)a4;
  if (v7)
  {
    v9 = result;
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKDateContainer;
      v10 = -[PKDateContainer init](&v11, sel_init);
      self = v10;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_date, a3);
        objc_storeStrong((id *)&self->_timeZone, a4);
      }
    }

    return self;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDateContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKDateContainer *v6;
  PKDateContainer *v7;
  uint64_t v8;
  NSTimeZone *timeZone;
  PKDateContainer *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKDateContainer;
    v6 = -[PKDateContainer init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_date, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
      v8 = objc_claimAutoreleasedReturnValue();
      timeZone = v7->_timeZone;
      v7->_timeZone = (NSTimeZone *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKDateContainerDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v11);

    v10 = 0;
  }

  return v10;
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

- (BOOL)isEqual:(id)a3
{
  PKDateContainer *v4;
  PKDateContainer *v5;
  PKDateContainer *v6;
  NSDate *date;
  NSDate *v8;
  NSTimeZone *timeZone;
  NSTimeZone *v10;

  v4 = (PKDateContainer *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (self)
        {
          date = self->_date;
          v8 = v6->_date;
          if (date && v8)
          {
            if ((-[NSDate isEqual:](date, "isEqual:") & 1) != 0)
            {
LABEL_8:
              timeZone = self->_timeZone;
              v10 = v6->_timeZone;
              if (timeZone && v10)
                LOBYTE(self) = -[NSTimeZone isEqual:](timeZone, "isEqual:");
              else
                LOBYTE(self) = timeZone == v10;
              goto LABEL_16;
            }
          }
          else if (date == v8)
          {
            goto LABEL_8;
          }
          LOBYTE(self) = 0;
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_17:

  return (char)self;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_date, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDateContainer *v5;
  PKDateContainer *v6;
  uint64_t v7;
  NSDate *date;
  NSTimeZone *timeZone;
  uint64_t v10;
  NSTimeZone *v11;
  objc_super v13;

  v5 = +[PKDateContainer allocWithZone:](PKDateContainer, "allocWithZone:");
  if (v5)
  {
    v13.receiver = v5;
    v13.super_class = (Class)PKDateContainer;
    v6 = -[PKDateContainer init](&v13, sel_init);
  }
  else
  {
    v6 = 0;
  }
  v7 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  date = v6->_date;
  v6->_date = (NSDate *)v7;

  timeZone = self->_timeZone;
  if (timeZone)
  {
    v10 = -[NSTimeZone copyWithZone:](timeZone, "copyWithZone:", a3);
    v11 = v6->_timeZone;
    v6->_timeZone = (NSTimeZone *)v10;
  }
  else
  {
    v11 = v6->_timeZone;
    v6->_timeZone = 0;
  }

  return v6;
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
