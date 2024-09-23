@implementation STAlwaysAllowList

- (STAlwaysAllowList)init
{
  return -[STAlwaysAllowList initWithBlueprint:](self, "initWithBlueprint:", 0);
}

- (STAlwaysAllowList)initWithBlueprint:(id)a3
{
  id v4;
  STAlwaysAllowList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STAlwaysAllowList;
  v5 = -[STAlwaysAllowList init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "configurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BE19098];
      objc_msgSend(v7, "payloadPlist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v8, "declarationForData:error:", v9, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;

      if (v10)
      {
        objc_msgSend(v10, "payloadApps");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[STUILog persistence](STUILog, "persistence");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[STAlwaysAllowList initWithBlueprint:].cold.1();

        v12 = 0;
      }
      objc_msgSend(v10, "unknownPayloadKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldAllowEditing = objc_msgSend(v14, "count") == 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE84510], "defaultAlwaysAllowBundleIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldAllowEditing = 1;
    }
    if (v12)
      v15 = v12;
    else
      v15 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v5->_allowedBundleIDs, v15);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSArray copy](self->_allowedBundleIDs, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSArray)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (void)setAllowedBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
}

- (void)initWithBlueprint:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Error creating app declaration from plist: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
