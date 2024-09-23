@implementation W5PeerStatusRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerStatusRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerStatusRequestPayload *v5;
  NSNumber *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  objc_super v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)W5PeerStatusRequestPayload;
  v5 = -[W5PeerStatusRequestPayload init](&v11, "init");
  if (!v5
    || (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) == 0))
  {

    v7 = sub_10008F56C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = "-[W5PeerStatusRequestPayload initWithRequest:]";
      v14 = 2080;
      v15 = "W5PeerStatusRequestPayload.m";
      v16 = 1024;
      v17 = 37;
      v18 = 2114;
      v19 = 0;
      v10 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v12, v10);
    }

    v5 = 0;
  }

  return v5;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v6;
  id v7;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_version)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequestPayload version](self, "version"));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  if (!objc_msgSend(v3, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerStatusRequestPayload encode]"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v6, 0));

    objc_exception_throw(v7);
  }
  return v3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

@end
