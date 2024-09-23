@implementation STGenericIntentDateRange

- (STGenericIntentDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  STGenericIntentDateRange *v9;
  STGenericIntentDateRange *v10;
  STGenericIntentDateRange *v11;
  void *v12;
  void *endDate;
  uint64_t v14;
  NSDate *v15;
  NSDate *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "compare:", v8) == 1)
  {
    v9 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STGenericIntentDateRange;
    v10 = -[STGenericIntentDateRange init](&v18, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_startDate, a3);
      if (v8 && !objc_msgSend(v7, "isEqualToDate:", v8))
      {
        v16 = (NSDate *)v8;
        endDate = v11->_endDate;
        v11->_endDate = v16;
      }
      else
      {
        v12 = (void *)MEMORY[0x24BDBCE60];
        -[NSDate timeIntervalSince1970](v11->_startDate, "timeIntervalSince1970");
        objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        endDate = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(endDate, "dateByAddingTimeInterval:", 86400.0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v11->_endDate;
        v11->_endDate = (NSDate *)v14;

      }
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("_endDate"));

}

- (STGenericIntentDateRange)initWithCoder:(id)a3
{
  id v4;
  STGenericIntentDateRange *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  STGenericIntentDateRange *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STGenericIntentDateRange;
  v5 = -[STGenericIntentDateRange init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
