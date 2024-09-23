@implementation REMBaseSectionChangeItem

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836E38);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)__resolutionTokenKeyDenylist_1;
    __resolutionTokenKeyDenylist_1 = v2;

  }
}

+ (id)keysToObserve
{
  if (keysToObserve_onceToken_0 != -1)
    dispatch_once(&keysToObserve_onceToken_0, &__block_literal_global_20);
  return (id)keysToObserve___sKeysToObserve_0;
}

void __41__REMBaseSectionChangeItem_keysToObserve__block_invoke()
{
  void *v0;

  v0 = (void *)keysToObserve___sKeysToObserve_0;
  keysToObserve___sKeysToObserve_0 = (uint64_t)&unk_1E6836E50;

}

- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  REMBaseSectionChangeItem *v16;
  REMBaseSectionChangeItem *v17;
  REMSaveRequest *saveRequest;
  void *v19;
  REMBaseSectionChangeItem *v20;
  NSObject *v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMBaseSectionChangeItem;
    v16 = -[REMBaseSectionChangeItem init](&v23, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_saveRequest, a3);
      objc_storeStrong((id *)&v17->_storage, a4);
      objc_storeStrong((id *)&v17->_changedKeysObserver, a6);
      saveRequest = v17->_saveRequest;
      -[REMBaseSectionStorage objectID](v17->_storage, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSaveRequest _trackAccountCapabilities:forObjectID:](saveRequest, "_trackAccountCapabilities:forObjectID:", v14, v19);

    }
    self = v17;
    v20 = self;
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
    v20 = 0;
  }

  return v20;
}

- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  REMChangedKeysObserver *v14;
  void *v15;
  REMChangedKeysObserver *v16;
  REMBaseSectionChangeItem *v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
    if (v12)
      goto LABEL_4;
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountCapabilities");
    goto LABEL_4;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "saveRequest");
  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!v12)
    goto LABEL_7;
LABEL_4:
  v13 = (void *)objc_msgSend(v11, "copy");
  v14 = [REMChangedKeysObserver alloc];
  objc_msgSend((id)objc_opt_class(), "keysToObserve");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v14, "initWithTarget:keysToObserve:includeInitial:", v13, v15, v6);

  v17 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:](self, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v10, v13, v12, v16);
  return v17;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  REMAccountCapabilities *v7;
  NSObject *v8;

  -[REMBaseSectionChangeItem storage](self, "storage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[REMBaseSectionChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMBaseSectionChangeItem objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v6);
  v7 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMBaseSectionChangeItem accountCapabilities].cold.1(self);

    v7 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
  }
  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMBaseSectionChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)newObjectID
{
  objc_class *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[REMBaseSectionChangeItem newObjectID].cold.1();

  }
  return +[REMBaseSectionStorage newObjectID](REMBaseSectionStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v11;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[REMBaseSectionChangeItem objectIDWithUUID:].cold.1();

  }
  +[REMBaseSectionStorage objectIDWithUUID:](REMBaseSectionStorage, "objectIDWithUUID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cdEntityName
{
  objc_class *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[REMBaseSectionChangeItem cdEntityName].cold.1();

  }
  +[REMBaseSectionStorage cdEntityName](REMBaseSectionStorage, "cdEntityName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMBaseSectionChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylist_1;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  REMAccountCapabilities *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[REMBaseSectionChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[REMBaseSectionChangeItem objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v7);
    v8 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_16:
      v13 = objc_alloc((Class)objc_opt_class());
      -[REMBaseSectionChangeItem storage](self, "storage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionChangeItem changedKeysObserver](self, "changedKeysObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v13, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v5, v14, v8, v15);

      goto LABEL_17;
    }
    -[REMBaseSectionChangeItem objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v5)
      {
LABEL_15:
        v8 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
        goto LABEL_16;
      }
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.3(self, a2, v10);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMBaseSectionChangeItem shallowCopyWithSaveRequest:].cold.2((uint64_t)self, a2);
    }

    goto LABEL_15;
  }
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[REMTemplateChangeItem shallowCopyWithSaveRequest:].cold.1((uint64_t)self, a2);

  -[REMBaseSectionChangeItem storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = 0;
  else
    NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
LABEL_17:

  return v12;
}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMBaseSectionChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMBaseSectionChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMBaseSectionChangeItem;
  if (-[REMBaseSectionChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMBaseSectionChangeItem storage](self, "storage");
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
  -[REMBaseSectionChangeItem saveRequest](self, "saveRequest");
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
  -[REMBaseSectionChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMBaseSectionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
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

- (void)accountCapabilities
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting baseSectionChangeItem.accountCapabilities {objectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

+ (void)newObjectID
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage newObjectID]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

+ (void)objectIDWithUUID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage objectIDWithUUID:]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

+ (void)cdEntityName
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v8, v9, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, 2u);

  OUTLINED_FUNCTION_6();
}

@end
