@implementation REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithListID:(id)a3
{
  id v5;
  REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *v6;
  REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listID, a3);

  return v7;
}

- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList initWithListID:](self, "initWithListID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList listID](self, "listID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listID"));

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
    -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList listID](self, "listID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList listID](self, "listID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "listID");
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

  -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList listID](self, "listID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listID, 0);
}

@end
