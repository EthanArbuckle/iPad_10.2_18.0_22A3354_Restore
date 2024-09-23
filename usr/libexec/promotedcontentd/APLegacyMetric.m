@implementation APLegacyMetric

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (APLegacyMetric)initWithCoder:(id)a3
{

  return 0;
}

- (APLegacyMetric)initWithType:(int64_t)a3 purpose:(int64_t)a4 contentData:(id)a5 context:(id)a6 bundleIdentifier:(id)a7 properties:(id)a8
{
  id v14;
  id v15;
  id v16;
  APLegacyMetric *v17;
  uint64_t v18;
  NSDate *timestamp;
  void *v20;
  uint64_t v21;
  NSString *handle;
  uint64_t v23;
  NSDictionary *properties;
  uint64_t v25;
  NSDictionary *internalProperties;
  _QWORD v28[4];
  APLegacyMetric *v29;
  objc_super v30;

  v14 = a5;
  v15 = a6;
  v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)APLegacyMetric;
  v17 = -[APLegacyMetric init](&v30, "init");
  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    timestamp = v17->_timestamp;
    v17->_timestamp = (NSDate *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    handle = v17->handle;
    v17->handle = (NSString *)v21;

    v17->_metric = a3;
    objc_storeStrong((id *)&v17->_contentData, a5);
    objc_storeStrong((id *)&v17->_context, a6);
    v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v23;

    v25 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    internalProperties = v17->_internalProperties;
    v17->_internalProperties = (NSDictionary *)v25;

    v17->_purpose = a4;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000F4B14;
    v28[3] = &unk_100214FC8;
    v29 = v17;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v28);

  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)setProperty:(id)a3 forKey:(id)a4 internal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (v5)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetric internalProperties](self, "internalProperties"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetric properties](self, "properties"));
  v10 = v9;
  v11 = objc_msgSend(v9, "mutableCopy");

  if (v13)
    objc_msgSend(v11, "setObject:forKey:", v13, v8);
  else
    objc_msgSend(v11, "removeObjectForKey:", v8);
  v12 = objc_msgSend(v11, "copy");
  if (v5)
    -[APLegacyMetric setInternalProperties:](self, "setInternalProperties:", v12);
  else
    -[APLegacyMetric setProperties:](self, "setProperties:", v12);

}

- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 properties:(id)a8 internalProperties:(id)a9 options:(int64_t)a10
{

  return 0;
}

- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14
{

  return 0;
}

- (APLegacyMetric)init
{
  APLegacyMetric *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APLegacyMetric;
  v2 = -[APLegacyMetric init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[APLegacyMetric setTimestamp:](v2, "setTimestamp:", v3);

  }
  return v2;
}

- (NSString)contentIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetric contentData](self, "contentData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return (NSString *)v4;
}

- (NSString)contextIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetric context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  return (NSString *)v4;
}

- (int64_t)options
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return self->bundleIdentifier;
}

- (NSString)trace
{
  return self->trace;
}

- (void)setTrace:(id)a3
{
  objc_storeStrong((id *)&self->trace, a3);
}

- (NSDictionary)relayData
{
  return self->relayData;
}

- (int64_t)order
{
  return self->order;
}

- (NSString)handle
{
  return self->handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->handle, a3);
}

- (NSArray)environment
{
  return self->environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->environment, a3);
}

- (NSArray)branch
{
  return self->branch;
}

- (void)setBranch:(id)a3
{
  objc_storeStrong((id *)&self->branch, a3);
}

- (unsigned)source
{
  return self->source;
}

- (void)setSource:(unsigned int)a3
{
  self->source = a3;
}

- (APContentDataInternal)contentData
{
  return (APContentDataInternal *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContentData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (APContext)context
{
  return (APContext *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)metric
{
  return self->_metric;
}

- (void)setMetric:(int64_t)a3
{
  self->_metric = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSDictionary)internalProperties
{
  return self->_internalProperties;
}

- (void)setInternalProperties:(id)a3
{
  objc_storeStrong((id *)&self->_internalProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->branch, 0);
  objc_storeStrong((id *)&self->environment, 0);
  objc_storeStrong((id *)&self->handle, 0);
  objc_storeStrong((id *)&self->relayData, 0);
  objc_storeStrong((id *)&self->trace, 0);
  objc_storeStrong((id *)&self->contextIdentifier, 0);
  objc_storeStrong((id *)&self->contentIdentifier, 0);
  objc_storeStrong((id *)&self->bundleIdentifier, 0);
}

@end
