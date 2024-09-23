@implementation ICRemoteRequestOperationExecutionContext

- (ICRemoteRequestOperationExecutionContext)initWithCoder:(id)a3
{
  id v4;
  ICRemoteRequestOperationExecutionContext *v5;
  NSString *v6;
  Class v7;
  uint64_t v8;
  void *remoteRequestOperation;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteRequestOperationExecutionContext;
  v5 = -[ICRemoteRequestOperationExecutionContext init](&v15, sel_init);
  if (v5)
  {
    v5->_qualityOfService = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qualityOfService"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteRequestOperationClassName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_ICRemoteRequestOperationIsAllowedForClassName(v6))
    {
      v7 = NSClassFromString(v6);
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("remoteRequestOperation"));
        v8 = objc_claimAutoreleasedReturnValue();
        remoteRequestOperation = v5->_remoteRequestOperation;
        v5->_remoteRequestOperation = (ICRemoteRequestOperation *)v8;
        goto LABEL_11;
      }
      v10 = CFSTR("Failed to look up class of developer token provider with name: %@.");
    }
    else
    {
      v10 = CFSTR("Attempted to decode an instance of ICRemoteRequestOperationExecutionContext with an unallowed class name for remoteRequestOperation: %@.");
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, v10, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_12:

      goto LABEL_13;
    }
    remoteRequestOperation = (void *)v11;
    objc_msgSend(v4, "failWithError:", v11);
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(remoteRequestOperation, "msv_description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

    }
    v5 = 0;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t qualityOfService;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  qualityOfService = self->_qualityOfService;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", qualityOfService, CFSTR("qualityOfService"));
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ICRemoteRequestOperationIsAllowedForClassName(v7) & 1) != 0)
  {
    objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("remoteRequestOperationClassName"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_remoteRequestOperation, CFSTR("remoteRequestOperation"));
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, CFSTR("Attempted to encode an instance of ICRemoteRequestOperationExecutionContext with an unallowed class name for remoteRequestOperation: %@."), v7);
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
    objc_msgSend(v5, "failWithError:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequestOperation, 0);
}

- (ICRemoteRequestOperation)remoteRequestOperation
{
  return self->_remoteRequestOperation;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICRemoteRequestOperationExecutionContext)initWithRemoteRequestOperation:(id)a3
{
  id v5;
  ICRemoteRequestOperationExecutionContext *v6;
  ICRemoteRequestOperationExecutionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRemoteRequestOperationExecutionContext;
  v6 = -[ICRemoteRequestOperationExecutionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteRequestOperation, a3);
    v7->_qualityOfService = -1;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
