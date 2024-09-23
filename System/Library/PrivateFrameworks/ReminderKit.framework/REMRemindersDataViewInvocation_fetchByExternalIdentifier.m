@implementation REMRemindersDataViewInvocation_fetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 listObjectID:(id)a4
{
  id v7;
  id v8;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v9;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMRemindersDataViewInvocation_fetchByExternalIdentifier;
  v9 = -[REMStoreInvocationValueStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_listObjectID, a4);
  }

  return v10;
}

- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("externalIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listObjectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[REMRemindersDataViewInvocation_fetchByExternalIdentifier initWithExternalIdentifiers:listObjectID:](self, "initWithExternalIdentifiers:listObjectID:", v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("externalIdentifiers"));

  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier listObjectID](self, "listObjectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("listObjectID"));

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
  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMRemindersDataViewInvocation_fetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
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
  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier listObjectID](self, "listObjectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listObjectID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMRemindersDataViewInvocation_fetchByExternalIdentifier listObjectID](self, "listObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listObjectID");
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

  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier listObjectID](self, "listObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataViewInvocation_fetchByExternalIdentifier externalIdentifiers](self, "externalIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (v3)
  {
    -[REMRemindersDataViewInvocation_fetchByExternalIdentifier listObjectID](self, "listObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= objc_msgSend(v6, "hash");

  }
  return v5;
}

- (NSArray)externalIdentifiers
{
  return self->_externalIdentifiers;
}

- (REMObjectID)listObjectID
{
  return self->_listObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listObjectID, 0);
  objc_storeStrong((id *)&self->_externalIdentifiers, 0);
}

@end
