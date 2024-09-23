@implementation _REMDefaultReplicaManagerProvider

- (_REMDefaultReplicaManagerProvider)initWithStore:(id)a3
{
  id v5;
  _REMDefaultReplicaManagerProvider *v6;
  _REMDefaultReplicaManagerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMDefaultReplicaManagerProvider;
  v6 = -[_REMDefaultReplicaManagerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)replicaManagerForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_REMDefaultReplicaManagerProvider store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReplicaManager replicaManagerForAccountID:store:](REMReplicaManager, "replicaManagerForAccountID:store:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  +[REMReplicaManager unsavedReplicaManagersForAccountIDs:](REMReplicaManager, "unsavedReplicaManagersForAccountIDs:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_REMDefaultReplicaManagerProvider store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
      v6 = v5;
    }
    else
    {
      -[_REMDefaultReplicaManagerProvider store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "store");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
