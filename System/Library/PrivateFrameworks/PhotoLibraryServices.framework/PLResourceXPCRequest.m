@implementation PLResourceXPCRequest

- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectIDURL:(id)a4
{
  id v7;
  id v8;
  PLResourceXPCRequest *v9;
  PLResourceXPCRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLResourceXPCRequest;
  v9 = -[PLResourceXPCRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskIdentifier, a3);
    objc_storeStrong((id *)&v10->_assetObjectIDURL, a4);
  }

  return v10;
}

- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4
{
  id v6;
  void *v7;
  PLResourceXPCRequest *v8;

  v6 = a3;
  objc_msgSend(a4, "URIRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLResourceXPCRequest initWithTaskIdentifier:assetObjectIDURL:](self, "initWithTaskIdentifier:assetObjectIDURL:", v6, v7);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@, %@"), v5, self, self->_taskIdentifier, self->_assetObjectIDURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *taskIdentifier;
  id v5;

  taskIdentifier = self->_taskIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", taskIdentifier, CFSTR("taskIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetObjectIDURL, CFSTR("assetObjectIDURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsProgress, CFSTR("wantsProgress"));

}

- (PLResourceXPCRequest)initWithCoder:(id)a3
{
  id v4;
  PLResourceXPCRequest *v5;
  uint64_t v6;
  NSString *taskIdentifier;
  uint64_t v8;
  NSURL *assetObjectIDURL;
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
  v15.super_class = (Class)PLResourceXPCRequest;
  v5 = -[PLResourceXPCRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetObjectIDURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetObjectIDURL = v5->_assetObjectIDURL;
    v5->_assetObjectIDURL = (NSURL *)v8;

    v5->_wantsProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsProgress"));
    if (!v5->_taskIdentifier || !v5->_assetObjectIDURL)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D74498];
      v16 = *MEMORY[0x1E0CB2938];
      v17[0] = CFSTR("task identifier and asset object id url are required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46309, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v13);

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSURL)assetObjectIDURL
{
  return self->_assetObjectIDURL;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetObjectIDURL, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
