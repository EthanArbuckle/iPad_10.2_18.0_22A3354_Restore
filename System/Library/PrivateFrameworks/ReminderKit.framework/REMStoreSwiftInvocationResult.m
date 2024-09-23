@implementation REMStoreSwiftInvocationResult

- (NSDictionary)resultStorages
{
  return self->_resultStorages;
}

- (NSData)resultData
{
  return self->_resultData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestFetchResultToken, 0);
  objc_storeStrong((id *)&self->_resultStorages, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
}

- (REMStoreSwiftInvocationResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMStoreSwiftInvocationResult *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resultData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMXPCStorageClasses remStorageClasses](REMXPCStorageClasses, "remStorageClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("resultStorages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestFetchResultToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMStoreSwiftInvocationResult initWithResultData:storages:latestFetchResultToken:](self, "initWithResultData:storages:latestFetchResultToken:", v5, v7, v8);
  return v9;
}

- (REMStoreSwiftInvocationResult)initWithResultData:(id)a3 storages:(id)a4 latestFetchResultToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMStoreSwiftInvocationResult *v12;
  REMStoreSwiftInvocationResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMStoreSwiftInvocationResult;
  v12 = -[REMStoreSwiftInvocationResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resultData, a3);
    objc_storeStrong((id *)&v13->_resultStorages, a4);
    objc_storeStrong((id *)&v13->_latestFetchResultToken, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMStoreSwiftInvocationResult resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("resultData"));

  -[REMStoreSwiftInvocationResult resultStorages](self, "resultStorages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("resultStorages"));

  -[REMStoreSwiftInvocationResult latestFetchResultToken](self, "latestFetchResultToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("latestFetchResultToken"));

}

- (REMFetchResultToken)latestFetchResultToken
{
  return self->_latestFetchResultToken;
}

@end
