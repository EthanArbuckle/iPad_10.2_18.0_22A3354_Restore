@implementation W5RapportClientRequest

- (W5RapportClientRequest)initWithPayload:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  W5RapportClientRequest *v15;
  W5RapportClientRequest *v16;
  id v17;
  id handler;
  NSDictionary *v19;
  NSObject *p_super;
  uint64_t v22;
  const char *v23;
  int v24;
  objc_super v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_10008F56C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainBlock(v11);
    v26 = 136316418;
    v27 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
    v28 = 2080;
    v29 = "W5RapportClientRequest.m";
    v30 = 1024;
    v31 = 18;
    v32 = 2114;
    v33 = v10;
    v34 = 2114;
    v35 = v9;
    v36 = 2114;
    v37 = v14;
    v24 = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) options=%{public}@, response=%{public}@, handler=%{public}@", &v26, v24);

  }
  v25.receiver = self;
  v25.super_class = (Class)W5RapportClientRequest;
  v15 = -[W5RapportClientRequest init](&v25, "init");
  v16 = v15;
  if (v15
    && (objc_storeStrong((id *)&v15->_payload, a3),
        v17 = objc_retainBlock(v11),
        handler = v16->_handler,
        v16->_handler = v17,
        handler,
        v16->_handler))
  {
    v19 = (NSDictionary *)v10;
    p_super = &v16->_options->super;
    v16->_options = v19;
  }
  else
  {

    v22 = sub_10008F56C();
    p_super = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315650;
      v27 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
      v28 = 2080;
      v29 = "W5RapportClientRequest.m";
      v30 = 1024;
      v31 = 34;
      LODWORD(v23) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v26, v23, LODWORD(v25.receiver));
    }
    v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ : %p"), v7, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClientRequest payload](self, "payload"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" payload='%@'"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = objc_msgSend(v3, "copy");

  return (NSString *)v9;
}

- (W5PeerRequestPayload)payload
{
  return self->_payload;
}

- (id)handler
{
  return self->_handler;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
