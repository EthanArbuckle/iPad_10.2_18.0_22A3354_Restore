@implementation W5PeerSensingResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSensingResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerSensingResponsePayload *v5;
  void *v6;
  uint64_t v7;
  NSObject *errorStr;
  uint64_t v10;
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
  v11.super_class = (Class)W5PeerSensingResponsePayload;
  v5 = -[W5PeerSensingResponsePayload init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result")));
    v5->_result = objc_msgSend(v6, "BOOLValue");

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error")));
    errorStr = v5->_errorStr;
    v5->_errorStr = (NSString *)v7;
  }
  else
  {
    v10 = sub_10008F56C();
    errorStr = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(errorStr, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = "-[W5PeerSensingResponsePayload initWithRequest:]";
      v14 = 2080;
      v15 = "W5PeerSensingResponsePayload.m";
      v16 = 1024;
      v17 = 34;
      v18 = 2114;
      v19 = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, errorStr, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v12, 38);
    }
  }

  return v5;
}

- (id)encode
{
  __CFString *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingResponsePayload errorStr](self, "errorStr"));
  if (!v3)
  {
    if (-[W5PeerSensingResponsePayload result](self, "result"))
      v3 = 0;
    else
      v3 = CFSTR("unknown error");
  }
  v7[0] = CFSTR("result");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[W5PeerSensingResponsePayload result](self, "result")));
  v7[1] = CFSTR("error");
  v8[0] = v4;
  v8[1] = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  return v5;
}

- (NSNumber)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
  self->version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->status;
}

- (void)setStatus:(int64_t)a3
{
  self->status = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (NSString)errorStr
{
  return self->_errorStr;
}

- (void)setErrorStr:(id)a3
{
  objc_storeStrong((id *)&self->_errorStr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorStr, 0);
}

@end
