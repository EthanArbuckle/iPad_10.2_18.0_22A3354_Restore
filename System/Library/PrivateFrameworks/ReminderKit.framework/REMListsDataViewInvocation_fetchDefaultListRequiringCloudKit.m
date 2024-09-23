@implementation REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithAccountObjectID:(id)a3 debugUseInMemoryPreferredDefaultListStorage:(BOOL)a4
{
  id v7;
  REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *v8;
  REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit;
  v8 = -[REMStoreInvocationValueStorage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountObjectID, a3);
    v9->_debug_useInMemoryPreferredDefaultListStorage = a4;
  }

  return v9;
}

- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("debug_useInMemoryPreferredDefaultListStorage"));

  v7 = -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit initWithAccountObjectID:debugUseInMemoryPreferredDefaultListStorage:](self, "initWithAccountObjectID:debugUseInMemoryPreferredDefaultListStorage:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit accountObjectID](self, "accountObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("accountObjectID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage"), CFSTR("debug_useInMemoryPreferredDefaultListStorage"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit accountObjectID](self, "accountObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountObjectID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit accountObjectID](self, "accountObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        LOBYTE(v12) = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v13 = -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage");
    v12 = v13 ^ objc_msgSend(v5, "debug_useInMemoryPreferredDefaultListStorage") ^ 1;
    goto LABEL_8;
  }
  LOBYTE(v12) = 0;
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit accountObjectID](self, "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4
     + -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage");

  return v5;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (BOOL)debug_useInMemoryPreferredDefaultListStorage
{
  return self->_debug_useInMemoryPreferredDefaultListStorage;
}

- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  self->_debug_useInMemoryPreferredDefaultListStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);
}

@end
