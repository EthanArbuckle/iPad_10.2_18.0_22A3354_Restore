@implementation W5PeerSimpleResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSimpleResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerSimpleResponsePayload *v5;
  NSDictionary *v6;
  NSObject *p_super;
  uint64_t v9;
  objc_super v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerSimpleResponsePayload;
  v5 = -[W5PeerSimpleResponsePayload init](&v10, "init");
  if (v5)
  {
    v6 = (NSDictionary *)v4;
    p_super = &v5->_dictionary->super;
    v5->_dictionary = v6;
  }
  else
  {
    v9 = sub_10008F56C();
    p_super = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[W5PeerSimpleResponsePayload initWithRequest:]";
      v13 = 2080;
      v14 = "W5PeerSimpleResponsePayload.m";
      v15 = 1024;
      v16 = 33;
      v17 = 2114;
      v18 = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v11, 38);
    }
  }

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

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
