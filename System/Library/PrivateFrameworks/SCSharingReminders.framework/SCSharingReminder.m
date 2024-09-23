@implementation SCSharingReminder

- (SCSharingReminder)initWithIdentifier:(id)a3 displayName:(id)a4 type:(id)a5 deliverAfter:(double)a6
{
  id v11;
  id v12;
  id v13;
  SCSharingReminder *v14;
  SCSharingReminder *v15;
  uint64_t v16;
  NSDate *scheduledDate;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCSharingReminder;
  v14 = -[SCSharingReminder init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_displayName, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a6);
    v16 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v15->_scheduledDate;
    v15->_scheduledDate = (NSDate *)v16;

    objc_storeStrong((id *)&v15->_type, a5);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SCSharingReminder identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SCSharingReminder displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[SCSharingReminder scheduledDate](self, "scheduledDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("scheduledDate"));

  -[SCSharingReminder type](self, "type");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("type"));

}

- (SCSharingReminder)initWithCoder:(id)a3
{
  id v4;
  SCSharingReminder *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSDate *scheduledDate;
  uint64_t v12;
  NSString *type;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCSharingReminder;
  v5 = -[SCSharingReminder init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v12;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SCSharingReminder *v4;
  SCSharingReminder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (SCSharingReminder *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCSharingReminder identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCSharingReminder identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[SCSharingReminder type](v5, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCSharingReminder type](self, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminder scheduledDate](v5, "scheduledDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminder scheduledDate](self, "scheduledDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "isDate:inSameDayAsDate:", v11, v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminder scheduledDate](self, "scheduledDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 28, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCSharingReminder identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SCSharingReminder type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") ^ v7;
  v10 = v9 ^ objc_msgSend(v5, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCSharingReminder identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminder displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminder type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminder scheduledDate](self, "scheduledDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  localizedDateStringFromUTC((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ [%@] scheduled: %@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
