@implementation SSLookupProperties

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupProperties;
  -[SSLookupProperties dealloc](&v3, sel_dealloc);
}

- (id)copyRequestParameters
{
  id v3;
  NSMutableDictionary *requestParameters;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  requestParameters = self->_requestParameters;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](requestParameters, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(requestParameters);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_requestParameters, "objectForKey:", v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = (void *)objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
        objc_msgSend(v3, "setObject:forKey:", v10, v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](requestParameters, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  if (self->_location)
  {
    if (SSLookupPropertiesLoadCoreLocation_sOnce != -1)
      dispatch_once(&SSLookupPropertiesLoadCoreLocation_sOnce, &__block_literal_global_20);
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[CLLocation coordinate](self->_location, "coordinate");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v11, "stringWithFormat:", CFSTR("%.4f"), v12), CFSTR("lat"));
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[CLLocation coordinate](self->_location, "coordinate");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v13, "stringWithFormat:", CFSTR("%.4f"), v14), CFSTR("lon"));
  }
  return v3;
}

- (NSString)keyProfile
{
  return (NSString *)-[SSLookupProperties valueForRequestParameter:](self, "valueForRequestParameter:", CFSTR("p"));
}

- (void)setKeyProfile:(id)a3
{
  -[SSLookupProperties setValue:forRequestParameter:](self, "setValue:forRequestParameter:", a3, CFSTR("p"));
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  uint64_t v7;
  NSMutableDictionary *requestParameters;
  id v9;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = objc_msgSend(a3, "copy");
      requestParameters = self->_requestParameters;
      v9 = (id)v7;
      if (!requestParameters)
      {
        requestParameters = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v7 = (uint64_t)v9;
        self->_requestParameters = requestParameters;
      }
      -[NSMutableDictionary setObject:forKey:](requestParameters, "setObject:forKey:", v7, a4);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid parameter value: %@"), a3);
    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_requestParameters, "removeObjectForKey:", a4);
  }
}

- (id)valueForRequestParameter:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_requestParameters, "objectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = self->_localizationStyle;
  v5[1] = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v5[3] = -[NSMutableDictionary mutableCopyWithZone:](self->_requestParameters, "mutableCopyWithZone:", a3);
  v5[4] = -[NSNumber copyWithZone:](self->_timeoutInterval, "copyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  CLLocation *location;
  __CFString *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_localizationStyle);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_requestParameters);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_timeoutInterval);
  location = self->_location;
  if (location)
  {
    v21 = 0;
    v5 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", location, 1, &v21);
    if (v21)
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v8 &= 2u;
      if (v8)
      {
        v9 = objc_opt_class();
        v22 = 138543618;
        v23 = v9;
        v24 = 2114;
        v25 = v21;
        LODWORD(v20) = 22;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v20);
          free(v11);
          SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    SSXPCDictionarySetCFObject(v3, "1", v5);
  }
  return v3;
}

- (SSLookupProperties)initWithXPCEncoding:(id)a3
{
  SSLookupProperties *v5;
  CFArrayRef v7;
  CFArrayRef v8;
  CFArrayRef v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v26.receiver = self;
    v26.super_class = (Class)SSLookupProperties;
    v5 = -[SSLookupProperties init](&v26, sel_init);
    if (v5)
    {
      v5->_localizationStyle = xpc_dictionary_get_int64(a3, "0");
      objc_opt_class();
      v5->_timeoutInterval = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v5->_requestParameters = (NSMutableDictionary *)-[__CFArray mutableCopy](v7, "mutableCopy");

      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      if (v8)
      {
        v9 = v8;
        if (SSLookupPropertiesLoadCoreLocation_sOnce != -1)
          dispatch_once(&SSLookupPropertiesLoadCoreLocation_sOnce, &__block_literal_global_20);
        v25 = 0;
        v10 = (void *)MEMORY[0x1E0CB3710];
        getCLLocationClass();
        v5->_location = (CLLocation *)(id)objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v25);
        if (v25)
        {
          v11 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          if (!v11)
            v11 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v12 = objc_msgSend(v11, "shouldLog");
          if (objc_msgSend(v11, "shouldLogToDisk"))
            v13 = v12 | 2;
          else
            v13 = v12;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_ERROR))
            v13 &= 2u;
          if (v13)
          {
            v14 = objc_opt_class();
            v27 = 138543618;
            v28 = v14;
            v29 = 2114;
            v30 = v25;
            LODWORD(v24) = 22;
            v15 = _os_log_send_and_compose_impl();
            if (v15)
            {
              v16 = (void *)v15;
              v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v27, v24);
              free(v16);
              SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
            }
          }
        }

      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (int64_t)localizationStyle
{
  return self->_localizationStyle;
}

- (void)setLocalizationStyle:(int64_t)a3
{
  self->_localizationStyle = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
