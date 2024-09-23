@implementation ISURLRequest

- (id)_initCommon
{
  ISURLRequest *v2;
  SSMutableURLRequestProperties *v3;
  SSMutableURLRequestProperties *properties;
  NSLock *v5;
  NSLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISURLRequest;
  v2 = -[ISURLRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v5;

  }
  return v2;
}

- (ISURLRequest)init
{
  return -[ISURLRequest initWithURL:](self, "initWithURL:", 0);
}

- (ISURLRequest)initWithRequestProperties:(id)a3
{
  id v4;
  ISURLRequest *v5;
  uint64_t v6;
  SSMutableURLRequestProperties *properties;

  v4 = a3;
  v5 = -[ISURLRequest _initCommon](self, "_initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    properties = v5->_properties;
    v5->_properties = (SSMutableURLRequestProperties *)v6;

  }
  return v5;
}

- (ISURLRequest)initWithURLRequest:(id)a3
{
  id v4;
  ISURLRequest *v5;
  uint64_t v6;
  SSMutableURLRequestProperties *properties;

  v4 = a3;
  v5 = -[ISURLRequest _initCommon](self, "_initCommon");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURLRequest:", v4);
    properties = v5->_properties;
    v5->_properties = (SSMutableURLRequestProperties *)v6;

  }
  return v5;
}

- (ISURLRequest)initWithURL:(id)a3
{
  id v4;
  id *v5;
  ISURLRequest *v6;

  v4 = a3;
  v5 = -[ISURLRequest _initCommon](self, "_initCommon");
  v6 = (ISURLRequest *)v5;
  if (v5)
    objc_msgSend(v5[2], "setURL:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSLock *lock;
  id v5;
  int v6;
  SSMutableURLRequestProperties *properties;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v6 = objc_msgSend(v5, "allowsKeyedCoding");
  properties = self->_properties;
  if (v6)
    objc_msgSend(v5, "encodeObject:forKey:", properties, CFSTR("properties"));
  else
    objc_msgSend(v5, "encodeObject:", properties);

  -[NSLock unlock](self->_lock, "unlock");
}

- (ISURLRequest)initWithCoder:(id)a3
{
  id v4;
  ISURLRequest *v5;
  uint64_t v6;
  SSMutableURLRequestProperties *v7;
  uint64_t v8;
  void *properties;
  SSMutableURLRequestProperties *v10;
  void *v11;
  SSMutableURLRequestProperties *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SSMutableURLRequestProperties *v17;
  void *v18;
  SSMutableURLRequestProperties *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SSMutableURLRequestProperties *v24;
  SSMutableURLRequestProperties *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v4 = a3;
  v5 = -[ISURLRequest _initCommon](self, "_initCommon");
  if (v5)
  {
    if (!objc_msgSend(v4, "allowsKeyedCoding"))
    {
      objc_msgSend(v4, "decodeObject");
      v8 = objc_claimAutoreleasedReturnValue();
      properties = v5->_properties;
      v5->_properties = (SSMutableURLRequestProperties *)v8;
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("properties")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v5->_properties;
      v5->_properties = (SSMutableURLRequestProperties *)v6;

    }
    else
    {
      -[SSMutableURLRequestProperties setAllowedRetryCount:](v5->_properties, "setAllowedRetryCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retryCount")));
      -[SSMutableURLRequestProperties setCachePolicy:](v5->_properties, "setCachePolicy:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cachePolicy")));
      v10 = v5->_properties;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setHTTPBody:](v10, "setHTTPBody:", v11);

      v12 = v5->_properties;
      v13 = (void *)MEMORY[0x24BDBCF20];
      v14 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("headers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setHTTPHeaders:](v12, "setHTTPHeaders:", v16);

      v17 = v5->_properties;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("method"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setHTTPMethod:](v17, "setHTTPMethod:", v18);

      v19 = v5->_properties;
      v20 = (void *)MEMORY[0x24BDBCF20];
      v21 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("query"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setRequestParameters:](v19, "setRequestParameters:", v23);

      v24 = v5->_properties;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeout"));
      -[SSMutableURLRequestProperties setTimeoutInterval:](v24, "setTimeoutInterval:");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("urls")))
    {
      -[SSMutableURLRequestProperties setExpectedContentLength:](v5->_properties, "setExpectedContentLength:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("expectedlength")));
      -[SSMutableURLRequestProperties setURLBagType:](v5->_properties, "setURLBagType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bagtype")));
      v25 = v5->_properties;
      v26 = (void *)MEMORY[0x24BDBCF20];
      v27 = objc_opt_class();
      v28 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
      properties = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", properties, CFSTR("urls"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setURLs:](v25, "setURLs:", v29);

      goto LABEL_9;
    }
  }
LABEL_10:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSLock lock](self->_lock, "lock");
  v6 = -[SSMutableURLRequestProperties mutableCopyWithZone:](self->_properties, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISURLRequest requestProperties](self, "requestProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)requestWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

- (int64_t)allowedRetryCount
{
  return -[SSMutableURLRequestProperties allowedRetryCount](self->_properties, "allowedRetryCount");
}

- (NSString)appleClientApplication
{
  return (NSString *)-[SSMutableURLRequestProperties clientIdentifier](self->_properties, "clientIdentifier");
}

- (unint64_t)cachePolicy
{
  return -[SSMutableURLRequestProperties cachePolicy](self->_properties, "cachePolicy");
}

- (NSDictionary)customHeaders
{
  return (NSDictionary *)-[SSMutableURLRequestProperties HTTPHeaders](self->_properties, "HTTPHeaders");
}

- (int64_t)expectedContentLength
{
  return -[SSMutableURLRequestProperties expectedContentLength](self->_properties, "expectedContentLength");
}

- (NSData)HTTPBody
{
  return (NSData *)-[SSMutableURLRequestProperties HTTPBody](self->_properties, "HTTPBody");
}

- (NSInputStream)HTTPBodyStream
{
  return (NSInputStream *)-[SSMutableURLRequestProperties HTTPBodyStream](self->_properties, "HTTPBodyStream");
}

- (NSString)HTTPMethod
{
  return (NSString *)-[SSMutableURLRequestProperties HTTPMethod](self->_properties, "HTTPMethod");
}

- (NSDictionary)queryStringDictionary
{
  return (NSDictionary *)-[SSMutableURLRequestProperties requestParameters](self->_properties, "requestParameters");
}

- (NSURL)primaryURL
{
  return (NSURL *)-[SSMutableURLRequestProperties URL](self->_properties, "URL");
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  -[SSMutableURLRequestProperties setAllowedRetryCount:](self->_properties, "setAllowedRetryCount:", a3);
}

- (void)setAppleClientApplication:(id)a3
{
  -[SSMutableURLRequestProperties setClientIdentifier:](self->_properties, "setClientIdentifier:", a3);
}

- (void)setCachePolicy:(unint64_t)a3
{
  -[SSMutableURLRequestProperties setCachePolicy:](self->_properties, "setCachePolicy:", a3);
}

- (void)setCustomHeaders:(id)a3
{
  -[SSMutableURLRequestProperties setHTTPHeaders:](self->_properties, "setHTTPHeaders:", a3);
}

- (void)setExpectedContentLength:(int64_t)a3
{
  -[SSMutableURLRequestProperties setExpectedContentLength:](self->_properties, "setExpectedContentLength:", a3);
}

- (void)setHTTPBody:(id)a3
{
  -[SSMutableURLRequestProperties setHTTPBody:](self->_properties, "setHTTPBody:", a3);
}

- (void)setHTTPBodyStream:(id)a3
{
  -[SSMutableURLRequestProperties setHTTPBodyStream:](self->_properties, "setHTTPBodyStream:", a3);
}

- (void)setHTTPMethod:(id)a3
{
  -[SSMutableURLRequestProperties setHTTPMethod:](self->_properties, "setHTTPMethod:", a3);
}

- (void)setQueryStringDictionary:(id)a3
{
  -[SSMutableURLRequestProperties setRequestParameters:](self->_properties, "setRequestParameters:", a3);
}

- (void)setTimeoutInterval:(double)a3
{
  -[SSMutableURLRequestProperties setTimeoutInterval:](self->_properties, "setTimeoutInterval:", a3);
}

- (void)setURLBagType:(int64_t)a3
{
  -[SSMutableURLRequestProperties setURLBagType:](self->_properties, "setURLBagType:", a3);
}

- (void)setURLs:(id)a3
{
  -[SSMutableURLRequestProperties setURLs:](self->_properties, "setURLs:", a3);
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_properties, "setValue:forHTTPHeaderField:", a3, a4);
}

- (void)setValue:(id)a3 forQueryStringParameter:(id)a4
{
  -[SSMutableURLRequestProperties setValue:forRequestParameter:](self->_properties, "setValue:forRequestParameter:", a3, a4);
}

- (double)timeoutInterval
{
  double result;

  -[SSMutableURLRequestProperties timeoutInterval](self->_properties, "timeoutInterval");
  return result;
}

- (int64_t)URLBagType
{
  return -[SSMutableURLRequestProperties URLBagType](self->_properties, "URLBagType");
}

- (NSArray)URLs
{
  return (NSArray *)-[SSMutableURLRequestProperties URLs](self->_properties, "URLs");
}

- (id)requestProperties
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[SSMutableURLRequestProperties copy](self->_properties, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
