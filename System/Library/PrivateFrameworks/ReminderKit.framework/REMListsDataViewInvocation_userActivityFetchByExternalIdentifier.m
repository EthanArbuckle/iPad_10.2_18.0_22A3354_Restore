@implementation REMListsDataViewInvocation_userActivityFetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithExternalIdentifier:(id)a3 accountObjectID:(id)a4
{
  id v7;
  id v8;
  REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *v9;
  REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMListsDataViewInvocation_userActivityFetchByExternalIdentifier;
  v9 = -[REMStoreInvocationValueStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountObjectID, a4);
  }

  return v10;
}

- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier initWithExternalIdentifier:accountObjectID:](self, "initWithExternalIdentifier:accountObjectID:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier externalIdentifier](self, "externalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("externalIdentifier"));

  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
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
  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier externalIdentifier](self, "externalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier externalIdentifier](self, "externalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
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
    -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
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
  void *v4;
  unint64_t v5;
  void *v6;

  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier externalIdentifier](self, "externalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (v3)
  {
    -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier accountObjectID](self, "accountObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= objc_msgSend(v6, "hash");

  }
  return v5;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

@end
