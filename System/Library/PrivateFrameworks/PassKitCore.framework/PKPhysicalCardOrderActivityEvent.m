@implementation PKPhysicalCardOrderActivityEvent

- (PKPhysicalCardOrderActivityEvent)initWithDictionary:(id)a3
{
  id v4;
  PKPhysicalCardOrderActivityEvent *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  uint64_t v19;
  NSDate *date;
  uint64_t v21;
  NSString *localizedReason;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPhysicalCardOrderActivityEvent;
  v5 = -[PKPhysicalCardOrderActivityEvent init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("activity"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("ordered"))
    {
      if (v6)
      {
        v8 = objc_msgSend(CFSTR("ordered"), "isEqualToString:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 == CFSTR("shipped")
          || (v11 = v10, v12 = objc_msgSend(CFSTR("shipped"), "isEqualToString:", v10),
                         v11,
                         (v12 & 1) != 0))
        {
          v9 = 2;
          goto LABEL_16;
        }
        v13 = v11;
        if (v13 == CFSTR("fixShippingAddress")
          || (v14 = v13,
              v15 = objc_msgSend(CFSTR("fixShippingAddress"), "isEqualToString:", v13),
              v14,
              (v15 & 1) != 0))
        {
          v9 = 3;
          goto LABEL_16;
        }
        v16 = v14;
        if (v16 == CFSTR("error")
          || (v17 = v16, v18 = objc_msgSend(CFSTR("error"), "isEqualToString:", v16), v17, v18))
        {
          v9 = 4;
          goto LABEL_16;
        }
      }
      v9 = 0;
      goto LABEL_16;
    }
LABEL_5:
    v9 = 1;
LABEL_16:

    v5->_activity = v9;
    objc_msgSend(v4, "PKDateForKey:", CFSTR("timestamp"));
    v19 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v19;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedReason"));
    v21 = objc_claimAutoreleasedReturnValue();
    localizedReason = v5->_localizedReason;
    v5->_localizedReason = (NSString *)v21;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardOrderActivityEvent)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCardOrderActivityEvent *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSString *localizedReason;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicalCardOrderActivityEvent;
  v5 = -[PKPhysicalCardOrderActivityEvent init](&v11, sel_init);
  if (v5)
  {
    v5->_activity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedReason"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedReason = v5->_localizedReason;
    v5->_localizedReason = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activity;
  id v5;

  activity = self->_activity;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", activity, CFSTR("activity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedReason, CFSTR("localizedReason"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *date;
  NSDate *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  date = self->_date;
  v6 = (NSDate *)v4[2];
  if (date && v6)
  {
    if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (date != v6)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v7 = (void *)v4[3];
  v8 = self->_localizedReason;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_13;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_15;
  }
  v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

  if (!v11)
    goto LABEL_15;
LABEL_13:
  v12 = self->_activity == v4[1];
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedReason);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_activity - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t activity;
  __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  activity = self->_activity;
  if (activity > 4)
    v6 = 0;
  else
    v6 = off_1E2AC8600[activity];
  objc_msgSend(v3, "appendFormat:", CFSTR("activity: '%@'; "), v6);
  -[NSDate description](self->_date, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("date: '%@'; "), v7);

  objc_msgSend(v4, "appendFormat:", CFSTR("localizedReason: '%@'; "), self->_localizedReason);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPhysicalCardOrderActivityEvent *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSString *localizedReason;

  v5 = +[PKPhysicalCardOrderActivityEvent allocWithZone:](PKPhysicalCardOrderActivityEvent, "allocWithZone:");
  v5->_activity = self->_activity;
  v6 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  date = v5->_date;
  v5->_date = (NSDate *)v6;

  v8 = -[NSString copyWithZone:](self->_localizedReason, "copyWithZone:", a3);
  localizedReason = v5->_localizedReason;
  v5->_localizedReason = (NSString *)v8;

  return v5;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setActivity:(unint64_t)a3
{
  self->_activity = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
