@implementation REMRemindersDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 objectIDs:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMRemindersDataViewInvocationResult *v15;
  REMRemindersDataViewInvocationResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REMRemindersDataViewInvocationResult;
  v15 = -[REMStoreInvocationValueStorage init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStorages, a3);
    objc_storeStrong((id *)&v16->_listStorages, a4);
    objc_storeStrong((id *)&v16->_reminderStorages, a5);
    objc_storeStrong((id *)&v16->_objectIDs, a6);
  }

  return v16;
}

- (REMRemindersDataViewInvocationResult)initWithCoder:(id)a3
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  REMRemindersDataViewInvocationResult *v21;

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
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("reminderStorages"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("objectIDs"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (v8 && v12 && v16 && v20)
  {
    self = -[REMRemindersDataViewInvocationResult initWithAccountStorages:listStorages:reminderStorages:objectIDs:](self, "initWithAccountStorages:listStorages:reminderStorages:objectIDs:", v8, v12, v16, v20);
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[REMRemindersDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountStorages"));

  -[REMRemindersDataViewInvocationResult listStorages](self, "listStorages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("listStorages"));

  -[REMRemindersDataViewInvocationResult reminderStorages](self, "reminderStorages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reminderStorages"));

  -[REMRemindersDataViewInvocationResult objectIDs](self, "objectIDs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("objectIDs"));

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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  -[REMRemindersDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountStorages");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMRemindersDataViewInvocationResult accountStorages](self, "accountStorages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountStorages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_12;
  }
  -[REMRemindersDataViewInvocationResult listStorages](self, "listStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listStorages");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMRemindersDataViewInvocationResult listStorages](self, "listStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  -[REMRemindersDataViewInvocationResult reminderStorages](self, "reminderStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reminderStorages");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[REMRemindersDataViewInvocationResult reminderStorages](self, "reminderStorages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reminderStorages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
    {
LABEL_12:
      v23 = 0;
      goto LABEL_13;
    }
  }
  -[REMRemindersDataViewInvocationResult objectIDs](self, "objectIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDs");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v25 == (void *)v26)
  {
    v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    -[REMRemindersDataViewInvocationResult objectIDs](self, "objectIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v28, "isEqual:", v29);

  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[REMRemindersDataViewInvocationResult accountStorages](self, "accountStorages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMRemindersDataViewInvocationResult listStorages](self, "listStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMRemindersDataViewInvocationResult reminderStorages](self, "reminderStorages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[REMRemindersDataViewInvocationResult objectIDs](self, "objectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (NSArray)listStorages
{
  return self->_listStorages;
}

- (NSArray)reminderStorages
{
  return self->_reminderStorages;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_reminderStorages, 0);
  objc_storeStrong((id *)&self->_listStorages, 0);
  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end
