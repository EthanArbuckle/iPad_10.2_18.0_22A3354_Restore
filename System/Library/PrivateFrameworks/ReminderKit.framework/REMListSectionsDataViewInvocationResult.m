@implementation REMListSectionsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionsDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMListSectionsDataViewInvocationResult *v12;
  REMListSectionsDataViewInvocationResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMListSectionsDataViewInvocationResult;
  v12 = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStorages, a3);
    objc_storeStrong((id *)&v13->_listStorages, a4);
    objc_storeStrong((id *)&v13->_listSectionStorages, a5);
  }

  return v13;
}

- (REMListSectionsDataViewInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  REMListSectionsDataViewInvocationResult *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("accountStorages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("listStorages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("listSectionStorages"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v8 && v12 && v16)
  {
    self = -[REMListSectionsDataViewInvocationResult initWithAccountStorages:listStorages:listSectionStorages:](self, "initWithAccountStorages:listStorages:listSectionStorages:", v8, v12, v16);
    v17 = self;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMListSectionsDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountStorages"));

  -[REMListSectionsDataViewInvocationResult listStorages](self, "listStorages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("listStorages"));

  -[REMListSectionsDataViewInvocationResult listSectionStorages](self, "listSectionStorages");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("listSectionStorages"));

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
  -[REMListSectionsDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountStorages");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMListSectionsDataViewInvocationResult accountStorages](self, "accountStorages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountStorages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMListSectionsDataViewInvocationResult listStorages](self, "listStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listStorages");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMListSectionsDataViewInvocationResult listStorages](self, "listStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_14;
    }
  }
  -[REMListSectionsDataViewInvocationResult listSectionStorages](self, "listSectionStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listSectionStorages");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {
    v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    -[REMListSectionsDataViewInvocationResult listSectionStorages](self, "listSectionStorages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listSectionStorages");
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

  -[REMListSectionsDataViewInvocationResult accountStorages](self, "accountStorages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMListSectionsDataViewInvocationResult listStorages](self, "listStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMListSectionsDataViewInvocationResult listSectionStorages](self, "listSectionStorages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (NSArray)listStorages
{
  return self->_listStorages;
}

- (NSArray)listSectionStorages
{
  return self->_listSectionStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listSectionStorages, 0);
  objc_storeStrong((id *)&self->_listStorages, 0);
  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end
