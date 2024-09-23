@implementation SecEventMetric

- (SecEventMetric)initWithEventName:(id)a3
{
  id v4;
  SecEventMetric *v5;
  SecEventMetric *v6;
  void *v7;
  SecEventMetric *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SecEventMetric;
  v5 = -[SecEventMetric init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[SecEventMetric setEventName:](v5, "setEventName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SecEventMetric setAttributes:](v6, "setAttributes:", v7);

    v8 = v6;
  }

  return v6;
}

- (SecEventMetric)initWithCoder:(id)a3
{
  id v4;
  SecEventMetric *v5;
  SecEventMetric *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSString *eventName;
  uint64_t v13;
  NSMutableDictionary *attributes;
  SecEventMetric *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SecEventMetric;
  v5 = -[SecEventMetric init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "supportedAttributeClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", objc_opt_class(NSDictionary));
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("eventName"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("attributes")));
    attributes = v6->_attributes;
    v6->_attributes = (NSMutableDictionary *)v13;

    if (!v6->_eventName || !v6->_attributes)
    {

      v15 = 0;
      goto LABEL_7;
    }

  }
  v15 = v6;
LABEL_7:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric eventName](self, "eventName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventName"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](self, "attributes"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("attributes"));

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  SecEventMetric *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = objc_msgSend((id)objc_opt_class(self), "supportedAttributeClasses", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            if ((objc_opt_isKindOfClass(v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12)) & 1) != 0)
            {

              goto LABEL_14;
            }
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v10)
            continue;
          break;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class(v6);
        v14 = NSStringFromClass(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138543618;
        v23 = v7;
        v24 = 2114;
        v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "genericMetric  %{public}@ with unhandled metric type: %{public}@", buf, 0x16u);

      }
    }
    else
    {
LABEL_14:
      v16 = self;
      objc_sync_enter(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](v16, "attributes"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, v7);

      objc_sync_exit(v16);
    }
  }

}

- (unint64_t)convertTimeIntervalToServerTime:(double)a3
{
  return (unint64_t)((a3 + 978307200.0) * 1000.0);
}

- (id)genericEvent
{
  SECC2MPGenericEvent *v3;
  void *v4;
  void *v5;
  SECC2MPGenericEvent *v6;
  SECC2MPGenericEvent *v7;
  SECC2MPGenericEvent *v8;
  _QWORD v10[5];
  SECC2MPGenericEvent *v11;

  v3 = objc_alloc_init(SECC2MPGenericEvent);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric eventName](self, "eventName"));
  -[SECC2MPGenericEvent setName:](v3, "setName:", v4);

  -[SECC2MPGenericEvent setType:](v3, "setType:", 201);
  -[SECC2MPGenericEvent setTimestampStart:](v3, "setTimestampStart:", 0);
  -[SECC2MPGenericEvent setTimestampEnd:](v3, "setTimestampEnd:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](self, "attributes"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BCFEC;
  v10[3] = &unk_1002EAE60;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)generateError:(id)a3
{
  id v4;
  SECC2MPError *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(SECC2MPError);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  -[SECC2MPError setErrorDomain:](v5, "setErrorDomain:", v6);

  -[SECC2MPError setErrorCode:](v5, "setErrorCode:", objc_msgSend(v4, "code"));
  if (+[SecC2DeviceInfo isAppleInternal](SecC2DeviceInfo, "isAppleInternal"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
    -[SECC2MPError setErrorDescription:](v5, "setErrorDescription:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric generateError:](self, "generateError:", v10));
    -[SECC2MPError setUnderlyingError:](v5, "setUnderlyingError:", v11);

  }
  return v5;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedAttributeClasses
{
  if (qword_100341508 != -1)
    dispatch_once(&qword_100341508, &stru_1002EAE38);
  return (id)qword_100341500;
}

@end
