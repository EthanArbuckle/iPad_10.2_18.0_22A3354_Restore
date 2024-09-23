@implementation FMDEventLoggerEventLocate

- (FMDEventLoggerEventLocate)initWithEventName:(id)a3
{
  id v4;
  FMDEventLoggerEventLocate *v5;
  FMDEventLoggerEventLocate *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEventLoggerEventLocate;
  v5 = -[FMDEventLoggerEventLocate init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDEventLoggerEventLocate setEventName:](v5, "setEventName:", v4);
    -[FMDEventLoggerEventLocate setGroupByKey:](v6, "setGroupByKey:", CFSTR("FMDEventLoggerEventLocateTimestampKey"));
    -[FMDEventLoggerEventLocate setPrecision:](v6, "setPrecision:", &off_1002D82F0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDEventLoggerEventLocate setMutableDictionary:](v6, "setMutableDictionary:", v7);

  }
  return v6;
}

- (void)setLocation:(id)a3 reason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryValue"));
  objc_msgSend(v10, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeStamp"));
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("FMDEventLoggerEventLocateTimestampKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "removeObjectForKey:", v6);
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "fm_safelySetObject:forKey:", v8, v6);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)userInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventLocate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDEventLoggerEventLocate *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDEventLoggerEventLocate;
  v6 = -[FMDEventLoggerEventLocate init](&v13, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMutableDictionary, v5), CFSTR("mutableDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDEventLoggerEventLocate setMutableDictionary:](v6, "setMutableDictionary:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("eventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDEventLoggerEventLocate setEventName:](v6, "setEventName:", v11);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate eventName](self, "eventName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventName"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLocate mutableDictionary](self, "mutableDictionary"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mutableDictionary"));

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
  objc_storeStrong((id *)&self->_precision, 0);
  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end
