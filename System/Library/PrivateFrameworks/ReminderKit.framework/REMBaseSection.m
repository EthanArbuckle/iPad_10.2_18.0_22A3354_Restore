@implementation REMBaseSection

- (REMBaseSection)initWithStore:(id)a3 accountCapabilities:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMBaseSection *v12;
  REMBaseSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMBaseSection;
  v12 = -[REMBaseSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_accountCapabilities, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMBaseSectionStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v9, "storeGeneration"));
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  REMBaseSection *v4;
  REMBaseSection *v5;
  REMBaseSection *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = (REMBaseSection *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMBaseSection store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSection store](v6, "store");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMBaseSection store](self, "store");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSection store](v6, "store");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_10;
      }
      -[REMBaseSection accountCapabilities](self, "accountCapabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSection accountCapabilities](v6, "accountCapabilities");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMBaseSection accountCapabilities](self, "accountCapabilities");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSection accountCapabilities](v6, "accountCapabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_10;
      }
      -[REMBaseSection storage](self, "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSection storage](v6, "storage");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {
        v13 = 1;
        v22 = v20;
      }
      else
      {
        v22 = (void *)v21;
        -[REMBaseSection storage](self, "storage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSection storage](v6, "storage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v23, "isEqual:", v24);

      }
      goto LABEL_16;
    }
LABEL_10:
    v13 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMBaseSection storage](self, "storage");
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
  -[REMBaseSection storage](self, "storage");
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
  -[REMBaseSection storage](self, "storage");
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
  -[REMBaseSection storage](self, "storage");
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
  v7.super_class = (Class)REMBaseSection;
  if (-[REMBaseSection respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMBaseSection storage](self, "storage");
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
  -[REMBaseSection storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

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
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[REMBaseSection newObjectID].cold.1();

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
    +[REMLogStore read](REMLogStore, "read");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[REMBaseSection objectIDWithUUID:].cold.1();

  }
  +[REMBaseSectionStorage objectIDWithUUID:](REMBaseSectionStorage, "objectIDWithUUID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSString)cdEntityName
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
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[REMBaseSection cdEntityName].cold.1();

  }
  +[REMBaseSectionStorage cdEntityName](REMBaseSectionStorage, "cdEntityName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMBaseSection storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (REMStore)store
{
  return self->_store;
}

- (REMBaseSectionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_store, 0);
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

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage newObjectID]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);

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

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage objectIDWithUUID:]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);

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

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
