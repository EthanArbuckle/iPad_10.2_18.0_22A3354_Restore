@implementation PLResourceXPCMakeAvailableRequest

- (PLResourceXPCMakeAvailableRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 resource:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLResourceXPCMakeAvailableRequest *v12;
  PLResourceXPCMakeAvailableRequest *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceXPCMakeAvailableRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  v12 = -[PLResourceXPCRequest initWithTaskIdentifier:assetObjectID:](&v16, sel_initWithTaskIdentifier_assetObjectID_, v9, v10);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_resourceIdentity, a5);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  -[PLResourceXPCRequest encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_transient, CFSTR("transient"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_networkAccessAllowed, CFSTR("networkAccessAllowed"));
  +[PLResourceIdentityXPC dictionaryRepresentationFromResourceIdentity:](PLResourceIdentityXPC, "dictionaryRepresentationFromResourceIdentity:", self->_resourceIdentity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("resourceIdentity"));
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v12 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to encode resource identity %@"), self->_resourceIdentity);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 46309, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_downloadIntent, CFSTR("downloadIntent"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_downloadPriority, CFSTR("downloadPriority"));

}

- (PLResourceXPCMakeAvailableRequest)initWithCoder:(id)a3
{
  id v4;
  PLResourceXPCMakeAvailableRequest *v5;
  void *v6;
  void *v7;
  PLResourceIdentityXPC *v8;
  PLResourceIdentity *resourceIdentity;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  v5 = -[PLResourceXPCRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_transient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transient"));
    v5->_networkAccessAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("networkAccessAllowed"));
    +[PLResourceIdentityXPC possibleClassesInDictionaryRepresentation](PLResourceIdentityXPC, "possibleClassesInDictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("resourceIdentity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PLResourceIdentityXPC initWithDictionary:]([PLResourceIdentityXPC alloc], "initWithDictionary:", v7);
    resourceIdentity = v5->_resourceIdentity;
    v5->_resourceIdentity = (PLResourceIdentity *)v8;

    if (!v5->_resourceIdentity)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D74498];
      v16 = *MEMORY[0x1E0CB2938];
      v17[0] = CFSTR("resource identity is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46309, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v13);

    }
    v5->_downloadIntent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadIntent"));
    v5->_downloadPriority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadPriority"));

  }
  return v5;
}

- (PLResourceIdentity)resourceIdentity
{
  return self->_resourceIdentity;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceIdentity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
