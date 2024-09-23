@implementation FMDEventLoggerEventError

- (FMDEventLoggerEventError)initWithEventName:(id)a3
{
  id v4;
  FMDEventLoggerEventError *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDEventLoggerEventError;
  v5 = -[FMDEventLoggerEventError init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDEventLoggerEventError setMutableDictionary:](v5, "setMutableDictionary:", v6);

    -[FMDEventLoggerEventError setEventName:](v5, "setEventName:", v4);
  }

  return v5;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  -[FMDEventLoggerEventError _populateInfo](self, "_populateInfo");
}

- (void)_populateInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  FMDEventLoggerEventError *v14;
  const __CFString *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError error](self, "error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError dictionaryForError:](self, "dictionaryForError:", v4));
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError error](self, "error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100038114;
  v12[3] = &unk_1002C1BC8;
  v13 = v3;
  v14 = self;
  v8 = v3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  v15 = CFSTR("errors");
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError mutableDictionary](self, "mutableDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError eventName](self, "eventName"));
  objc_msgSend(v10, "fm_safelySetObject:forKey:", v9, v11);

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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "removeObjectForKey:", v6);
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError mutableDictionary](self, "mutableDictionary"));
    objc_msgSend(v7, "fm_safelySetObject:forKey:", v8, v6);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)userInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError mutableDictionary](self, "mutableDictionary"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)dictionaryForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("domain"), v5);

  v6 = objc_msgSend(v3, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("code"), v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventError)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDEventLoggerEventError *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDEventLoggerEventError;
  v6 = -[FMDEventLoggerEventError init](&v13, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMutableDictionary, v5), CFSTR("mutableDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDEventLoggerEventError setMutableDictionary:](v6, "setMutableDictionary:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("eventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDEventLoggerEventError setEventName:](v6, "setEventName:", v11);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError eventName](self, "eventName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventName"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventError mutableDictionary](self, "mutableDictionary"));
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

- (NSError)error
{
  return self->_error;
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_precision, 0);
  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end
