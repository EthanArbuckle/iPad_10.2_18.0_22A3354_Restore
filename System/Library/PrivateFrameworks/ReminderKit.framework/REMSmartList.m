@implementation REMSmartList

- (REMSmartList)initWithStore:(id)a3 storage:(id)a4
{
  id v7;
  id v8;
  REMSmartList *v9;
  REMSmartList *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMSmartList;
  v9 = -[REMSmartList init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    -[REMSmartListStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v7, "storeGeneration"));
  }

  return v10;
}

- (REMSmartList)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6
{
  REMAccount *v10;
  REMList *v11;
  REMSmartList *v12;
  REMAccount *account;
  REMAccount *v14;
  REMList *parentList;

  v10 = (REMAccount *)a4;
  v11 = (REMList *)a5;
  v12 = -[REMSmartList initWithStore:storage:](self, "initWithStore:storage:", a3, a6);
  account = v12->_account;
  v12->_account = v10;
  v14 = v10;

  parentList = v12->_parentList;
  v12->_parentList = v11;

  return v12;
}

- (id)optionalObjectID
{
  void *v2;
  void *v3;

  -[REMSmartList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[REMSmartList store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMSmartList store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_12;
  }
  -[REMSmartList account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMSmartList account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  -[REMSmartList parentList](self, "parentList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentList");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[REMSmartList parentList](self, "parentList");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
    {
LABEL_12:
      v23 = 0;
      goto LABEL_13;
    }
  }
  -[REMSmartList storage](self, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v25 == (void *)v26)
  {
    v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    -[REMSmartList storage](self, "storage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v28, "isEqual:", v29);

  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSmartList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMSmartList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMSmartList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMSmartList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMSmartList;
  if (-[REMSmartList respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMSmartList storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMSmartList storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (REMAccountCapabilities)accountCapabilities
{
  void *v2;
  void *v3;

  -[REMSmartList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMAccountCapabilities *)v3;
}

- (BOOL)isPinned
{
  void *v2;
  BOOL v3;

  -[REMSmartList pinnedDate](self, "pinnedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isOriginOfExistingTemplate
{
  void *v2;
  BOOL v3;

  -[REMSmartList mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)newObjectID
{
  return +[REMSmartListStorage newObjectID](REMSmartListStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMSmartListStorage objectIDWithUUID:](REMSmartListStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMSmartListStorage cdEntityName](REMSmartListStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMSmartList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (REMSmartListCustomContext)customContext
{
  void *v3;
  int v4;
  void *v5;
  REMSmartListCustomContext *v6;
  void *v7;
  void *v8;
  REMSmartListCustomContext *v9;
  NSObject *v11;

  -[REMSmartList smartListType](self, "smartListType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders.smartlist.custom"));

  if (v4)
  {
    -[REMSmartList account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[REMLogStore read](REMLogStore, "read");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[REMSmartList customContext].cold.1(v11);

    }
    v6 = [REMSmartListCustomContext alloc];
    -[REMSmartList account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartList parentList](self, "parentList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[REMSmartListCustomContext initWithSmartList:account:parentList:](v6, "initWithSmartList:account:parentList:", self, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (REMSmartListSectionContext)sectionContext
{
  void *v3;
  void *v4;
  int v5;
  REMSmartListSectionContext *v6;

  -[REMSmartList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSections");

  if (v5)
    v6 = -[REMSmartListSectionContext initWithSmartList:]([REMSmartListSectionContext alloc], "initWithSmartList:", self);
  else
    v6 = 0;
  return v6;
}

- (REMStore)store
{
  return self->_store;
}

- (REMSmartListStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (REMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (REMList)parentList
{
  return self->_parentList;
}

- (void)setParentList:(id)a3
{
  objc_storeStrong((id *)&self->_parentList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentList, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)customContext
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "self.account";
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!self.account) -- invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end
