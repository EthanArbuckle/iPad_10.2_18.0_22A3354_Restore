@implementation W5RapportResponse

+ (id)responseWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v11)), "initWithPayload:options:error:", v10, v9, v8);

  return v12;
}

- (W5RapportResponse)initWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  W5RapportResponse *v12;
  W5RapportResponse *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  objc_super v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)W5RapportResponse;
  v12 = -[W5RapportResponse init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_storeStrong((id *)&v13->_payload, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    v14 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316418;
      v20 = "-[W5RapportResponse initWithPayload:options:error:]";
      v21 = 2080;
      v22 = "W5RapportResponse.m";
      v23 = 1024;
      v24 = 34;
      v25 = 2114;
      v26 = v9;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) payload='%{public}@' options='%{public}@' error='%{public}@'", &v19, 58);
    }
  }
  else
  {
    v17 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315650;
      v20 = "-[W5RapportResponse initWithPayload:options:error:]";
      v21 = 2080;
      v22 = "W5RapportResponse.m";
      v23 = 1024;
      v24 = 40;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) init error!", &v19, 28);
    }
  }

  return v13;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (W5PeerPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
