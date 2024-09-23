@implementation FMDEventLoggerEventLaunch

- (FMDEventLoggerEventLaunch)initWithEventName:(id)a3
{
  id v4;
  FMDEventLoggerEventLaunch *v5;
  FMDEventLoggerEventLaunch *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDEventLoggerEventLaunch;
  v5 = -[FMDEventLoggerEventLaunch init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDEventLoggerEventLaunch setEventName:](v5, "setEventName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDEventLoggerEventLaunch setMutableDictionary:](v6, "setMutableDictionary:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](v6, "mutableDictionary"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_1002D7E58, CFSTR("FMDEventLoggerFacilityDataPeekCompoundScalarValue"));

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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "removeObjectForKey:", v6);
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "fm_safelySetObject:forKey:", v8, v6);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)setLaunchReason:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_launchReason, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("FMDDaemonLaunchEvent"), v6));
    -[FMDEventLoggerEventLaunch setEventName:](self, "setEventName:", v5);

  }
}

- (id)userInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](self, "mutableDictionary"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](self, "mutableDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventLaunch)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDEventLoggerEventLaunch *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDEventLoggerEventLaunch;
  v6 = -[FMDEventLoggerEventLaunch init](&v13, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMutableDictionary, v5), CFSTR("mutableDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDEventLoggerEventLaunch setMutableDictionary:](v6, "setMutableDictionary:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("eventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDEventLoggerEventLaunch setEventName:](v6, "setEventName:", v11);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch eventName](self, "eventName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventName"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventLaunch mutableDictionary](self, "mutableDictionary"));
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

- (NSString)launchReason
{
  return self->_launchReason;
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
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_precision, 0);
  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end
