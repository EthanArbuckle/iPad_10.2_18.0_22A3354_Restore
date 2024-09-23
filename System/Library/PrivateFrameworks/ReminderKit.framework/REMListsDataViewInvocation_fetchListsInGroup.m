@implementation REMListsDataViewInvocation_fetchListsInGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchListsInGroup)initWithParentGroupObjectID:(id)a3
{
  id v5;
  REMListsDataViewInvocation_fetchListsInGroup *v6;
  REMListsDataViewInvocation_fetchListsInGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataViewInvocation_fetchListsInGroup;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupObjectID, a3);

  return v7;
}

- (REMListsDataViewInvocation_fetchListsInGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMListsDataViewInvocation_fetchListsInGroup *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMListsDataViewInvocation_fetchListsInGroup initWithParentGroupObjectID:](self, "initWithParentGroupObjectID:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMListsDataViewInvocation_fetchListsInGroup groupObjectID](self, "groupObjectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupObjectID"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMListsDataViewInvocation_fetchListsInGroup groupObjectID](self, "groupObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupObjectID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMListsDataViewInvocation_fetchListsInGroup groupObjectID](self, "groupObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groupObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMListsDataViewInvocation_fetchListsInGroup groupObjectID](self, "groupObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMObjectID)groupObjectID
{
  return self->_groupObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupObjectID, 0);
}

@end
