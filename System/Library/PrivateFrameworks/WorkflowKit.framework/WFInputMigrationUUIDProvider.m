@implementation WFInputMigrationUUIDProvider

- (WFInputMigrationUUIDProvider)initWithAction:(id)a3 atPosition:(unint64_t)a4
{
  id v8;
  WFInputMigrationUUIDProvider *v9;
  WFInputMigrationUUIDProvider *v10;
  WFInputMigrationUUIDProvider *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInputMigrationUUIDProvider.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFInputMigrationUUIDProvider;
  v9 = -[WFInputMigrationUUIDProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    v10->_position = a4;
    v11 = v10;
  }

  return v10;
}

- (id)generateOutputUUIDForAction:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[WFInputMigrationUUIDProvider action](self, "action");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInputMigrationUUIDProvider.m"), 59, CFSTR("[%@] should be initialized with the UUID requested action %@"), objc_opt_class(), v5);

  }
  v7 = -[WFInputMigrationUUIDProvider position](self, "position");
  v8 = v5;
  if (!v8)
    __assert_rtn("WFActionBootDeterministicID", "WFInputMigrationUUIDProvider.m", 24, "action != nil");
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x1E0D3E558]);
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "combineContentsOfPropertyListObject:", v11);

  v13 = (id)objc_msgSend(v10, "combineInteger:", v7);
  v22 = 0;
  v14 = WFKernelBootTime(&v22);
  v15 = v22;
  v16 = (id)objc_msgSend(v10, "combineInteger:", v14);
  objc_msgSend(v10, "finalize");
  if (v15)
  {
    getWFWorkflowMigrationLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "WFActionBootDeterministicID";
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_FAULT, "%s Failed to get kernel boot time for deterministic output ID generation: %@", buf, 0x16u);
    }

  }
  WFUUIDv4FromInteger();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (WFAction)action
{
  return self->_action;
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
