@implementation REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 accountObjectID:(id)a4
{
  id v7;
  id v8;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v9;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier;
  v9 = -[REMStoreInvocationValueStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_accountObjectID, a4);
  }

  return v10;
}

- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("externalIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountObjectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    self = -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier initWithExternalIdentifiers:accountObjectID:](self, "initWithExternalIdentifiers:accountObjectID:", v8, v9);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("externalIdentifiers"));

  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountObjectID"));

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
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountObjectID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountObjectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)externalIdentifiers
{
  return self->_externalIdentifiers;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_externalIdentifiers, 0);
}

@end
