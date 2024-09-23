@implementation ICRemoteRequestOperationExecutionResponse

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSError msv_errorByRemovingUnsafeUserInfo](self->_remoteRequestOperationError, "msv_errorByRemovingUnsafeUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("remoteRequestOperationError"));

  if (self->_remoteRequestOperationResponse)
  {
    v6 = (objc_class *)objc_opt_class();
    if (-[NSSecureCoding isNSString](self->_remoteRequestOperationResponse, "isNSString"))
      v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_ICRemoteRequestOperationResponseIsAllowedForClassName(v7) & 1) != 0)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("remoteRequestOperationResponseClassName"));
      objc_msgSend(v4, "encodeObject:forKey:", self->_remoteRequestOperationResponse, CFSTR("remoteRequestOperationResponse"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, CFSTR("Attempted to encode an instance of ICRemoteRequestOperationExecutionResponse with an unallowed class name for remoteRequestOperationResponse: %@."), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "msv_description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

      }
      objc_msgSend(v4, "failWithError:", v8);

    }
  }

}

- (ICRemoteRequestOperationExecutionResponse)initWithCoder:(id)a3
{
  id v4;
  ICRemoteRequestOperationExecutionResponse *v5;
  uint64_t v6;
  NSError *remoteRequestOperationError;
  NSString *v8;
  NSString *v9;
  Class v10;
  uint64_t v11;
  void *remoteRequestOperationResponse;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICRemoteRequestOperationExecutionResponse;
  v5 = -[ICRemoteRequestOperationExecutionResponse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteRequestOperationError"));
    v6 = objc_claimAutoreleasedReturnValue();
    remoteRequestOperationError = v5->_remoteRequestOperationError;
    v5->_remoteRequestOperationError = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteRequestOperationResponseClassName"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (_ICRemoteRequestOperationResponseIsAllowedForClassName(v8))
      {
        v10 = NSClassFromString(v9);
        if (v10)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("remoteRequestOperationResponse"));
          v11 = objc_claimAutoreleasedReturnValue();
          remoteRequestOperationResponse = v5->_remoteRequestOperationResponse;
          v5->_remoteRequestOperationResponse = (NSSecureCoding *)v11;
LABEL_12:

          goto LABEL_13;
        }
        v13 = CFSTR("Failed to look up class of developer token provider with name: %@.");
      }
      else
      {
        v13 = CFSTR("Attempted to decode an instance of ICRemoteRequestOperationExecutionResponse with an unallowed class name for remoteRequestOperationResponse: %@.");
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, v13, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        remoteRequestOperationResponse = (void *)v14;
        v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(remoteRequestOperationResponse, "msv_description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v20 = v16;
          _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

        }
        objc_msgSend(v4, "failWithError:", remoteRequestOperationResponse);

        v5 = 0;
        goto LABEL_12;
      }
    }
LABEL_13:

  }
  return v5;
}

- (NSSecureCoding)remoteRequestOperationResponse
{
  return self->_remoteRequestOperationResponse;
}

- (NSError)remoteRequestOperationError
{
  return self->_remoteRequestOperationError;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequestOperationError, 0);
  objc_storeStrong((id *)&self->_remoteRequestOperationResponse, 0);
}

- (ICRemoteRequestOperationExecutionResponse)initWithRemoteRequestOperationResponse:(id)a3 remoteRequestOperationError:(id)a4
{
  id v7;
  id v8;
  ICRemoteRequestOperationExecutionResponse *v9;
  ICRemoteRequestOperationExecutionResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRemoteRequestOperationExecutionResponse;
  v9 = -[ICRemoteRequestOperationExecutionResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteRequestOperationResponse, a3);
    objc_storeStrong((id *)&v10->_remoteRequestOperationError, a4);
  }

  return v10;
}

- (void)setRemoteRequestOperationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequestOperationResponse, a3);
}

- (void)setRemoteRequestOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequestOperationError, a3);
}

@end
