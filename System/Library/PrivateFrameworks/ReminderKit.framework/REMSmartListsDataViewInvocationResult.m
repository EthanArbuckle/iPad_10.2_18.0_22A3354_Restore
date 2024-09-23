@implementation REMSmartListsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3
{
  return -[REMSmartListsDataViewInvocationResult initWithSmartListStorages:accountStorages:parentListStorages:](self, "initWithSmartListStorages:accountStorages:parentListStorages:", a3, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMSmartListsDataViewInvocationResult *v12;
  REMSmartListsDataViewInvocationResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListsDataViewInvocationResult;
  v12 = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartListStorages, a3);
    objc_storeStrong((id *)&v13->_accountStorages, a4);
    objc_storeStrong((id *)&v13->_parentListStorages, a5);
  }

  return v13;
}

- (REMSmartListsDataViewInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  REMSmartListsDataViewInvocationResult *v19;
  REMSmartListsDataViewInvocationResult *v20;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("smartListStorages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("accountStorages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v17, CFSTR("parentListStorages"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v13 && v18)
      v19 = -[REMSmartListsDataViewInvocationResult initWithSmartListStorages:accountStorages:parentListStorages:](self, "initWithSmartListStorages:accountStorages:parentListStorages:", v8, v13, v18);
    else
      v19 = -[REMSmartListsDataViewInvocationResult initWithSmartListStorages:](self, "initWithSmartListStorages:", v8);
    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMSmartListsDataViewInvocationResult smartListStorages](self, "smartListStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("smartListStorages"));

  -[REMSmartListsDataViewInvocationResult accountStorages](self, "accountStorages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountStorages"));

  -[REMSmartListsDataViewInvocationResult parentListStorages](self, "parentListStorages");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parentListStorages"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[REMSmartListsDataViewInvocationResult smartListStorages](self, "smartListStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smartListStorages");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMSmartListsDataViewInvocationResult smartListStorages](self, "smartListStorages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smartListStorages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMSmartListsDataViewInvocationResult accountStorages](self, "accountStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountStorages");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMSmartListsDataViewInvocationResult accountStorages](self, "accountStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_14;
    }
  }
  -[REMSmartListsDataViewInvocationResult parentListStorages](self, "parentListStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentListStorages");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {
    v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    -[REMSmartListsDataViewInvocationResult parentListStorages](self, "parentListStorages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentListStorages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "isEqual:", v22);

  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[REMSmartListsDataViewInvocationResult smartListStorages](self, "smartListStorages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMSmartListsDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMSmartListsDataViewInvocationResult parentListStorages](self, "parentListStorages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSArray)smartListStorages
{
  return self->_smartListStorages;
}

- (NSDictionary)accountStorages
{
  return self->_accountStorages;
}

- (NSDictionary)parentListStorages
{
  return self->_parentListStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentListStorages, 0);
  objc_storeStrong((id *)&self->_accountStorages, 0);
  objc_storeStrong((id *)&self->_smartListStorages, 0);
}

@end
