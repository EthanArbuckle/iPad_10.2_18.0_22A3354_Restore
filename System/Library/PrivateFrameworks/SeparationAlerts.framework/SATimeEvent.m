@implementation SATimeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SATimeEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SATimeEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SATimeEventDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SATimeEvent initWithDate:](self, "initWithDate:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SATimeEvent date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SATimeEventDate"));

}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x1CAA49754]();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SATimeEvent *v4;
  void *v5;
  SATimeEvent *v6;

  v4 = +[SATimeEvent allocWithZone:](SATimeEvent, "allocWithZone:", a3);
  -[SATimeEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SATimeEvent initWithDate:](v4, "initWithDate:", v5);

  return v6;
}

- (SATimeEvent)initWithDate:(id)a3
{
  id v4;
  SATimeEvent *v5;
  uint64_t v6;
  NSDate *date;
  SATimeEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SATimeEvent;
  v5 = -[SATimeEvent init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v4, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SATimeEvent *v4;
  SATimeEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SATimeEvent *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SATimeEvent date](self, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SATimeEvent date](v5, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[SATimeEvent date](self, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SATimeEvent date](v5, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("SATimeEventDate");
  v10[0] = v4;
  -[SATimeEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[SATimeEvent descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      -[SAConnectionEvent description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
