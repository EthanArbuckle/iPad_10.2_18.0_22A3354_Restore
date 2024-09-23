@implementation PKEventDateInfo

- (PKEventDateInfo)initWithDictionary:(id)a3
{
  id v4;
  PKEventDateInfo *v5;
  uint64_t v6;
  NSDate *date;
  void *v8;
  void *v9;
  void *v10;
  NSTimeZone *v11;
  NSTimeZone *timeZone;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKEventDateInfo;
  v5 = -[PKEventDateInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_ignoreTimeComponents = objc_msgSend(v4, "PKBoolForKey:", CFSTR("ignoreTimeComponents"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("timeZone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", v8);
      v11 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
    timeZone = v5->_timeZone;
    v5->_timeZone = v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEventDateInfo)initWithCoder:(id)a3
{
  id v4;
  PKEventDateInfo *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSTimeZone *timeZone;

  v4 = a3;
  v5 = -[PKEventDateInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v5->_ignoreTimeComponents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreTimeComponents"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreTimeComponents, CFSTR("ignoreTimeComponents"));

}

- (NSDate)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (BOOL)ignoreTimeComponents
{
  return self->_ignoreTimeComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
