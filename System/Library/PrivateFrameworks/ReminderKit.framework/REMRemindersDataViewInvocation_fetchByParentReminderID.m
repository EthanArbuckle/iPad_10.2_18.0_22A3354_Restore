@implementation REMRemindersDataViewInvocation_fetchByParentReminderID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithParentReminderID:(id)a3 accountID:(id)a4 fetchOption:(int64_t)a5
{
  id v9;
  id v10;
  REMRemindersDataViewInvocation_fetchByParentReminderID *v11;
  REMRemindersDataViewInvocation_fetchByParentReminderID *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMRemindersDataViewInvocation_fetchByParentReminderID;
  v11 = -[REMStoreInvocationValueStorage init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_parentReminderID, a3);
    objc_storeStrong((id *)&v12->_accountID, a4);
    v12->_fetchOption = a5;
  }

  return v12;
}

- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  REMRemindersDataViewInvocation_fetchByParentReminderID *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentReminderID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchOption"));

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchByParentReminderID initWithParentReminderID:accountID:fetchOption:](self, "initWithParentReminderID:accountID:fetchOption:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[REMRemindersDataViewInvocation_fetchByParentReminderID parentReminderID](self, "parentReminderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("parentReminderID"));

  -[REMRemindersDataViewInvocation_fetchByParentReminderID accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("accountID"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[REMRemindersDataViewInvocation_fetchByParentReminderID fetchOption](self, "fetchOption"), CFSTR("fetchOption"));
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
  BOOL v17;
  int64_t v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[REMRemindersDataViewInvocation_fetchByParentReminderID parentReminderID](self, "parentReminderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentReminderID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMRemindersDataViewInvocation_fetchByParentReminderID parentReminderID](self, "parentReminderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentReminderID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMRemindersDataViewInvocation_fetchByParentReminderID accountID](self, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_10;
  }
  v13 = (void *)v12;
  -[REMRemindersDataViewInvocation_fetchByParentReminderID accountID](self, "accountID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
LABEL_10:
    v18 = -[REMRemindersDataViewInvocation_fetchByParentReminderID fetchOption](self, "fetchOption");
    v17 = v18 == objc_msgSend(v4, "fetchOption");
    goto LABEL_11;
  }
LABEL_8:
  v17 = 0;
LABEL_11:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[REMRemindersDataViewInvocation_fetchByParentReminderID parentReminderID](self, "parentReminderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMRemindersDataViewInvocation_fetchByParentReminderID accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = (-[REMRemindersDataViewInvocation_fetchByParentReminderID fetchOption](self, "fetchOption") + v6) ^ v4;

  return v7;
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (int64_t)fetchOption
{
  return self->_fetchOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_parentReminderID, 0);
}

@end
