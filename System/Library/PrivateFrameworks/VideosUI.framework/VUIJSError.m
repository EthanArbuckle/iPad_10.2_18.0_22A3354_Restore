@implementation VUIJSError

- (VUIJSError)initWithError:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIJSError *v9;
  VUIJSError *v10;
  void *v11;
  void *v12;
  VUIJSError *v13;
  VUIJSError *jsUnderlyingError;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = -[VUIJSObject initWithAppContext:](self, "initWithAppContext:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedError, a3);
    -[NSError userInfo](v10->_wrappedError, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[VUIJSError initWithError:appContext:]([VUIJSError alloc], "initWithError:appContext:", v12, v8);
      jsUnderlyingError = v10->_jsUnderlyingError;
      v10->_jsUnderlyingError = v13;

      objc_msgSend(v8, "jsContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "virtualMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addManagedReference:withOwner:", v10->_jsUnderlyingError, v10);

    }
  }

  return v10;
}

- (id)code
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIJSError wrappedError](self, "wrappedError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)domain
{
  void *v2;
  void *v3;

  -[VUIJSError wrappedError](self, "wrappedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[VUIJSError wrappedError](self, "wrappedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)failureReason
{
  void *v2;
  void *v3;

  -[VUIJSError wrappedError](self, "wrappedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recoverySuggestion
{
  void *v2;
  void *v3;

  -[VUIJSError wrappedError](self, "wrappedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedRecoverySuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userInfo
{
  void *v2;
  void *v3;

  -[VUIJSError wrappedError](self, "wrappedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)underlyingError
{
  return self->_jsUnderlyingError;
}

- (NSError)wrappedError
{
  return self->_wrappedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedError, 0);
  objc_storeStrong((id *)&self->_jsUnderlyingError, 0);
}

@end
