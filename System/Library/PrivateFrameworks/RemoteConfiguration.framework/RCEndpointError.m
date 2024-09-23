@implementation RCEndpointError

+ (id)endpointErrorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  RCEndpointError *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  RCJSONStringValue(v3, CFSTR("errorCode"), CFSTR("UnknownServerError"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  RCJSONStringValue(v3, CFSTR("message"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  RCJSONStringValue(v3, CFSTR("stacktrace"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  RCSharedLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1A1FB5000, v7, OS_LOG_TYPE_DEFAULT, "creating endpoint error with code: %@ message: %@ stacktrace: %@", (uint8_t *)&v10, 0x20u);
  }

  v8 = -[RCEndpointError initWithErrorCode:message:stacktrace:]([RCEndpointError alloc], "initWithErrorCode:message:stacktrace:", v4, v5, v6);
  return v8;
}

- (RCEndpointError)initWithErrorCode:(id)a3 message:(id)a4 stacktrace:(id)a5
{
  id v8;
  id v9;
  id v10;
  RCEndpointError *v11;
  uint64_t v12;
  NSString *errorCode;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSString *stacktrace;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RCEndpointError;
  v11 = -[RCEndpointError init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    errorCode = v11->_errorCode;
    v11->_errorCode = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    message = v11->_message;
    v11->_message = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    stacktrace = v11->_stacktrace;
    v11->_stacktrace = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[RCEndpointError errorCode](self, "errorCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RCEndpointError message](self, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RCEndpointError stacktrace](self, "stacktrace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stacktrace");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RCEndpointError errorCode](self, "errorCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RCEndpointError message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RCEndpointError stacktrace](self, "stacktrace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RCEndpointError errorCode](self, "errorCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointError message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointError stacktrace](self, "stacktrace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<code: %@ message: %@ stacktrace: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)stacktrace
{
  return self->_stacktrace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacktrace, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
