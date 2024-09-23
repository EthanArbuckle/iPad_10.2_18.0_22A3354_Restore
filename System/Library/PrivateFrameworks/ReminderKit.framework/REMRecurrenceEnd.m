@implementation REMRecurrenceEnd

+ (id)recurrenceEndWithEndDate:(id)a3
{
  id v3;
  REMRecurrenceEnd *v4;

  v3 = a3;
  v4 = -[REMRecurrenceEnd initWithEndDate:]([REMRecurrenceEnd alloc], "initWithEndDate:", v3);

  return v4;
}

+ (id)recurrenceEndWithOccurrenceCount:(unint64_t)a3
{
  return -[REMRecurrenceEnd initWithOccurrenceCount:]([REMRecurrenceEnd alloc], "initWithOccurrenceCount:", a3);
}

- (REMRecurrenceEnd)initWithEndDate:(id)a3
{
  id v4;
  REMRecurrenceEnd *v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSDate *endDate;
  objc_super v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("endDate is nil"));
  v11.receiver = self;
  v11.super_class = (Class)REMRecurrenceEnd;
  v5 = -[REMRecurrenceEnd init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", floor(v7));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

  }
  return v5;
}

- (REMRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3
{
  NSObject *v5;
  REMRecurrenceEnd *result;
  objc_super v7;

  if (!a3)
  {
    v5 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[REMRecurrenceEnd initWithOccurrenceCount:].cold.1(v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)REMRecurrenceEnd;
  result = -[REMRecurrenceEnd init](&v7, sel_init);
  if (result)
    result->_occurrenceCount = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceEnd)initWithCoder:(id)a3
{
  id v4;
  REMRecurrenceEnd *v5;
  uint64_t v6;
  NSDate *endDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRecurrenceEnd;
  v5 = -[REMRecurrenceEnd init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v6;

    v5->_occurrenceCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("occurrenceCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMRecurrenceEnd endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("endDate"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount"), CFSTR("occurrenceCount"));
}

- (BOOL)usesEndDate
{
  void *v2;
  BOOL v3;

  -[REMRecurrenceEnd endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[REMRecurrenceEnd endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[REMRecurrenceEnd endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %p { UNTIL=%@ } "), v5, self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %p { COUNT=%lu }"), v5, self, -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount");
  -[REMRecurrenceEnd endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  REMRecurrenceEnd *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (REMRecurrenceEnd *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (v6 = -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount"),
          v6 == -[REMRecurrenceEnd occurrenceCount](v4, "occurrenceCount")))
    {
      -[REMRecurrenceEnd endDate](self, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMRecurrenceEnd endDate](v4, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else if (v4)
      {
        -[REMRecurrenceEnd endDate](self, "endDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMRecurrenceEnd endDate](v4, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDate:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)occurrenceCount
{
  return self->_occurrenceCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (void)initWithOccurrenceCount:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B4A39000, a1, OS_LOG_TYPE_ERROR, "An REMRecurrenceEnd was created with an occurrence count of 0. %@", (uint8_t *)&v3, 0xCu);

}

@end
