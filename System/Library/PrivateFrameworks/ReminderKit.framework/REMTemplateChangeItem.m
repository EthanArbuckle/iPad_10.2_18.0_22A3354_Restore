@implementation REMTemplateChangeItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_1;
    __sKeysToObserve_1 = (uint64_t)&unk_1E6836DD8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836DF0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__resolutionTokenKeyDenylist_0;
    __resolutionTokenKeyDenylist_0 = v3;

  }
}

- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5
{
  id v10;
  id v11;
  id v12;
  REMTemplateChangeItem *v13;
  id *p_isa;
  REMTemplateChangeItem *v15;
  NSObject *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)REMTemplateChangeItem;
    v13 = -[REMTemplateChangeItem init](&v18, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_saveRequest, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
    v15 = 0;
  }

  return v15;
}

- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  REMChangedKeysObserver *v10;
  REMChangedKeysObserver *v11;
  REMTemplateChangeItem *v12;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "copy");
  v10 = [REMChangedKeysObserver alloc];
  v11 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v10, "initWithTarget:keysToObserve:includeInitial:", v9, __sKeysToObserve_1, v5);
  v12 = -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:](self, "initWithSaveRequest:storage:changedKeysObserver:", v8, v9, v11);

  return v12;
}

- (REMTemplateChangeItem)initWithObjectID:(id)a3 name:(id)a4 configuration:(id)a5 insertIntoAccountChangeItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  REMTemplateStorage *v15;
  void *v16;
  REMTemplateStorage *v17;
  void *v18;
  id v19;
  REMManualOrdering *v20;
  void *v21;
  void *v22;
  void *v23;
  REMManualOrdering *v24;
  void *v25;
  REMTemplateChangeItem *v26;
  NSObject *v28;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v14, "supportsTemplates");

  if ((a3 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[REMTemplateChangeItem initWithObjectID:name:configuration:insertIntoAccountChangeItem:].cold.1(v10, v28);

  }
  v15 = [REMTemplateStorage alloc];
  objc_msgSend(v10, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[REMTemplateStorage initWithObjectID:accountID:name:](v15, "initWithObjectID:accountID:name:", v13, v16, v12);

  objc_msgSend(v10, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setParentAccountID:](v17, "setParentAccountID:", v18);

  -[REMTemplateStorage setConfiguration:](v17, "setConfiguration:", v11);
  v19 = +[REMManualOrdering newObjectID](REMManualOrdering, "newObjectID");
  v20 = [REMManualOrdering alloc];
  objc_msgSend(v13, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v24 = -[REMManualOrdering initWithObjectID:listType:listID:modifiedDate:](v20, "initWithObjectID:listType:listID:modifiedDate:", v19, 6, v22, v23);

  -[REMTemplateStorage setUnsavedManualOrdering:](v17, "setUnsavedManualOrdering:", v24);
  objc_msgSend(v10, "saveRequest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[REMTemplateChangeItem initWithSaveRequest:storage:observeInitialValues:](self, "initWithSaveRequest:storage:observeInitialValues:", v25, v17, 1);

  return v26;
}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMTemplateChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylist_0;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (REMAccountCapabilities)accountCapabilities
{
  void *v2;
  void *v3;

  -[REMTemplateChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMAccountCapabilities *)v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMTemplateChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMTemplateChangeItem;
  if (-[REMTemplateChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMTemplateChangeItem storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  -[REMTemplateChangeItem saveRequest](self, "saveRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSaved");

  if (v9)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }

  }
  -[REMTemplateChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

- (void)setBadge:(id)a3
{
  id v4;

  objc_msgSend(a3, "rawValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REMTemplateChangeItem setBadgeEmblem:](self, "setBadgeEmblem:", v4);

}

- (REMListBadge)badge
{
  void *v2;
  REMListBadge *v3;

  -[REMTemplateChangeItem badgeEmblem](self, "badgeEmblem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v2);
  else
    v3 = 0;

  return v3;
}

+ (id)newObjectID
{
  return +[REMTemplateStorage newObjectID](REMTemplateStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMTemplateStorage objectIDWithUUID:](REMTemplateStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMTemplateStorage cdEntityName](REMTemplateStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMTemplateChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5;
  void *v6;
  REMTemplateChangeItem *v7;
  void *v8;
  void *v9;
  REMTemplateChangeItem *v10;
  NSObject *v11;

  v5 = a3;
  -[REMTemplateChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [REMTemplateChangeItem alloc];
    -[REMTemplateChangeItem storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMTemplateChangeItem changedKeysObserver](self, "changedKeysObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:](v7, "initWithSaveRequest:storage:changedKeysObserver:", v5, v8, v9);

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMTemplateChangeItem shallowCopyWithSaveRequest:].cold.1((uint64_t)self, a2);

    -[REMTemplateChangeItem storage](self, "storage");
    v10 = (REMTemplateChangeItem *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10 = 0;
    else
      NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
  }

  return v10;
}

- (void)removeFromParentAccount
{
  -[REMTemplateChangeItem setParentAccountID:](self, "setParentAccountID:", 0);
}

- (REMTemplateSectionContextChangeItem)sectionsContextChangeItem
{
  void *v3;
  int v4;
  REMTemplateSectionContextChangeItem *v5;

  -[REMTemplateChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSections");

  if (v4)
    v5 = -[REMTemplateSectionContextChangeItem initWithTemplateChangeItem:]([REMTemplateSectionContextChangeItem alloc], "initWithTemplateChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMTemplateStorage)storage
{
  return self->_storage;
}

- (REMChangedKeysObserver)changedKeysObserver
{
  return self->_changedKeysObserver;
}

- (void)setChangedKeysObserver:(id)a3
{
  objc_storeStrong((id *)&self->_changedKeysObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)initWithSaveRequest:(uint64_t)a1 storage:(const char *)a2 changedKeysObserver:.cold.1(uint64_t a1, const char *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint8_t v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);

  OUTLINED_FUNCTION_1();
}

- (void)initWithObjectID:(void *)a1 name:(NSObject *)a2 configuration:insertIntoAccountChangeItem:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!accountChangeItem.capabilities.supportsTemplates) -- Attempt to create REMTemplateChangeItem into account not supporting templates {account: %{public}@}", (uint8_t *)&v4, 0xCu);

}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint8_t v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);

  OUTLINED_FUNCTION_1();
}

@end
