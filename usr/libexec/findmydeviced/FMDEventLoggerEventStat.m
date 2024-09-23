@implementation FMDEventLoggerEventStat

- (FMDEventLoggerEventStat)initWithEventName:(id)a3
{
  id v4;
  FMDEventLoggerEventStat *v5;
  FMDEventLoggerEventStat *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEventLoggerEventStat;
  v5 = -[FMDEventLoggerEventStat init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDEventLoggerEventStat setEventName:](v5, "setEventName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDEventLoggerEventStat setMutableDictionary:](v6, "setMutableDictionary:", v7);

  }
  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!v8 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "removeObjectForKey:", v6);
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "fm_safelySetObject:forKey:", v8, v6);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)userInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat mutableDictionary](self, "mutableDictionary"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat eventName](self, "eventName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat statValue](self, "statValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat groupValue](self, "groupValue"));
  objc_msgSend(v5, "doubleValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@ %f"), v3, v4, v6));

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventStat)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDEventLoggerEventStat *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDEventLoggerEventStat;
  v6 = -[FMDEventLoggerEventStat init](&v19, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMutableDictionary, v5), CFSTR("mutableDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDEventLoggerEventStat setMutableDictionary:](v6, "setMutableDictionary:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("eventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDEventLoggerEventStat setEventName:](v6, "setEventName:", v11);

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v12), CFSTR("statValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[FMDEventLoggerEventStat setStatValue:](v6, "setStatValue:", v14);

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v15), CFSTR("groupValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[FMDEventLoggerEventStat setGroupValue:](v6, "setGroupValue:", v17);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat eventName](self, "eventName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat mutableDictionary](self, "mutableDictionary"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mutableDictionary"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat statValue](self, "statValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("statValue"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventStat groupValue](self, "groupValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("groupValue"));

}

- (NSString)groupByKey
{
  return self->_groupByKey;
}

- (void)setGroupByKey:(id)a3
{
  objc_storeStrong((id *)&self->_groupByKey, a3);
}

- (NSNumber)precision
{
  return self->_precision;
}

- (void)setPrecision:(id)a3
{
  objc_storeStrong((id *)&self->_precision, a3);
}

- (NSNumber)statValue
{
  return self->_statValue;
}

- (void)setStatValue:(id)a3
{
  objc_storeStrong((id *)&self->_statValue, a3);
}

- (NSNumber)groupValue
{
  return self->_groupValue;
}

- (void)setGroupValue:(id)a3
{
  objc_storeStrong((id *)&self->_groupValue, a3);
}

- (NSMutableDictionary)mutableDictionary
{
  return self->_mutableDictionary;
}

- (void)setMutableDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDictionary, a3);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
  objc_storeStrong((id *)&self->_groupValue, 0);
  objc_storeStrong((id *)&self->_statValue, 0);
  objc_storeStrong((id *)&self->_precision, 0);
  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end
