@implementation SSURLConnectionResponse

- (BOOL)ssv_isExpiredResponse
{
  void *v2;
  char v3;

  -[SSURLConnectionResponse URLResponse](self, "URLResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ssv_isExpiredResponse");

  return v3;
}

- (SSURLConnectionResponse)initWithURLResponse:(id)a3 bodyData:(id)a4
{
  SSURLConnectionResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSURLConnectionResponse;
  v6 = -[SSURLConnectionResponse init](&v8, sel_init);
  if (v6)
  {
    v6->_bodyData = (NSData *)objc_msgSend(a4, "copy");
    v6->_urlResponse = (NSHTTPURLResponse *)a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSURLConnectionResponse;
  -[SSURLConnectionResponse dealloc](&v3, sel_dealloc);
}

- (id)allHeaderFields
{
  return -[NSHTTPURLResponse allHeaderFields](self->_urlResponse, "allHeaderFields");
}

- (int64_t)expectedContentLength
{
  return -[NSHTTPURLResponse expectedContentLength](self->_urlResponse, "expectedContentLength");
}

- (NSString)MIMEType
{
  return (NSString *)-[NSHTTPURLResponse MIMEType](self->_urlResponse, "MIMEType");
}

- (int64_t)statusCode
{
  return -[NSHTTPURLResponse statusCode](self->_urlResponse, "statusCode");
}

- (NSString)suggestedFilename
{
  return (NSString *)-[NSHTTPURLResponse suggestedFilename](self->_urlResponse, "suggestedFilename");
}

- (NSString)textEncodingName
{
  return (NSString *)-[NSHTTPURLResponse textEncodingName](self->_urlResponse, "textEncodingName");
}

- (NSURL)URL
{
  return (NSURL *)-[NSHTTPURLResponse URL](self->_urlResponse, "URL");
}

- (SSURLConnectionResponse)initWithDatabaseEncoding:(id)a3
{
  void *v5;
  SSURLConnectionResponse *v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSHTTPURLResponse *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  else
    v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36.receiver = self;
    v36.super_class = (Class)SSURLConnectionResponse;
    v6 = -[SSURLConnectionResponse init](&v36, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "objectForKey:", CFSTR("9"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0;
        v6->_urlResponse = (NSHTTPURLResponse *)(id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v35);
        if (v35)
        {
          v8 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          if (!v8)
            v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v9 = objc_msgSend(v8, "shouldLog");
          if (objc_msgSend(v8, "shouldLogToDisk"))
            v10 = v9 | 2;
          else
            v10 = v9;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
            v10 &= 2u;
          if (v10)
          {
            v11 = objc_opt_class();
            v37 = 138543618;
            v38 = v11;
            v39 = 2114;
            v40 = v35;
            LODWORD(v34) = 22;
            v33 = &v37;
            v12 = _os_log_send_and_compose_impl();
            if (v12)
            {
              v13 = (void *)v12;
              v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v37, v34);
              free(v13);
              SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
            }
          }
        }
      }
      else
      {
        v21 = objc_msgSend(v5, "objectForKey:", CFSTR("7"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
          if (v22)
          {
            v23 = v22;
            v24 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("4"));
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v25 = objc_msgSend(v24, "integerValue");
            else
              v25 = 0;
            v26 = objc_msgSend(v5, "objectForKey:", CFSTR("2"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v26 = 0;
            v27 = objc_alloc(MEMORY[0x1E0CB3680]);
            v28 = (NSHTTPURLResponse *)objc_msgSend(v27, "initWithURL:statusCode:HTTPVersion:headerFields:", v23, v25, *MEMORY[0x1E0C930E8], v26);
            if (-[NSHTTPURLResponse _CFURLResponse](v28, "_CFURLResponse"))
            {
              objc_msgSend(v5, "objectForKey:", CFSTR("3"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                CFURLResponseSetMIMEType();
              v29 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("1"));
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v29, "longLongValue");
                CFURLResponseSetExpectedContentLength();
              }
            }
            v6->_urlResponse = v28;
          }
        }
      }
      v30 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("0"), v33);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6->_bodyData = (NSData *)v30;
      v31 = objc_msgSend(v5, "objectForKey:", CFSTR("8"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6->_metricsPageEvent = -[SSMetricsMutableEvent initWithBodyDictionary:]([SSMetricsPageEvent alloc], "initWithBodyDictionary:", v31);
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (NSData)databaseEncoding
{
  id v3;
  void *v4;
  NSData *bodyData;
  SSMetricsPageEvent *metricsPageEvent;
  NSHTTPURLResponse *urlResponse;
  id v8;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSData *v22;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  bodyData = self->_bodyData;
  if (bodyData)
    objc_msgSend(v3, "setObject:forKey:", bodyData, CFSTR("0"));
  metricsPageEvent = self->_metricsPageEvent;
  if (metricsPageEvent)
    objc_msgSend(v4, "setObject:forKey:", -[SSMetricsMutableEvent bodyDictionary](metricsPageEvent, "bodyDictionary"), CFSTR("8"));
  urlResponse = self->_urlResponse;
  if (urlResponse)
  {
    v26 = 0;
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", urlResponse, 1, &v26);
    if (v26)
    {
      v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v9)
        v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (v11)
      {
        v12 = objc_opt_class();
        v27 = 138543618;
        v28 = v12;
        v29 = 2114;
        v30 = v26;
        LODWORD(v25) = 22;
        v24 = &v27;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v27, v25);
          free(v14);
          SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
        }
      }
    }
    if (objc_msgSend(v8, "length", v24))
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("7"));

  }
  v22 = (NSData *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);

  return v22;
}

- (NSString)storeCorrelationID
{
  NSString *v2;

  v2 = -[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](self->_urlResponse, "allHeaderFields"), "objectForKey:", CFSTR("x-apple-jingle-correlation-key"));
  if (-[NSString length](v2, "length"))
    return v2;
  else
    return 0;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_bodyData);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)-[SSMetricsMutableEvent bodyDictionary](self->_metricsPageEvent, "bodyDictionary"));
  SSXPCDictionarySetCFObject(v3, "9", (__CFString *)self->_urlResponse);
  return v3;
}

- (SSURLConnectionResponse)initWithXPCEncoding:(id)a3
{
  SSURLConnectionResponse *v5;
  CFArrayRef v7;
  xpc_object_t value;
  objc_super v9;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSURLConnectionResponse;
    v5 = -[SSURLConnectionResponse init](&v9, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_bodyData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_metricsPageEvent = -[SSMetricsMutableEvent initWithBodyDictionary:]([SSMetricsPageEvent alloc], "initWithBodyDictionary:", v7);

      value = xpc_dictionary_get_value(a3, "9");
      if (value)
        v5->_urlResponse = (NSHTTPURLResponse *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3680]), "initWithXPCEncoding:", value);
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (void)setMetricsPageEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
}

@end
