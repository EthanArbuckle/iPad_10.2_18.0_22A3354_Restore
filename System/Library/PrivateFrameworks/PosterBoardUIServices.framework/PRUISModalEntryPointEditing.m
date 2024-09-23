@implementation PRUISModalEntryPointEditing

- (PRUISModalEntryPointEditing)init
{
  return -[PRUISModalEntryPointEditing initWithType:extensionIdentifier:configuration:updateSessionInfo:](self, "initWithType:extensionIdentifier:configuration:updateSessionInfo:", 0, 0, 0, 0);
}

- (PRUISModalEntryPointEditing)initWithExtensionIdentifier:(id)a3 configuration:(id)a4
{
  return -[PRUISModalEntryPointEditing initWithType:extensionIdentifier:configuration:updateSessionInfo:](self, "initWithType:extensionIdentifier:configuration:updateSessionInfo:", 1, a3, a4, 0);
}

- (PRUISModalEntryPointEditing)initWithType:(int64_t)a3 extensionIdentifier:(id)a4 configuration:(id)a5 updateSessionInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  PRUISModalEntryPointEditing *v13;
  PRUISModalEntryPointEditing *v14;
  uint64_t v15;
  NSString *extensionIdentifier;
  NSObject *v17;
  void *v18;
  void *v19;
  PRUISModalEntryPointEditing *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PRUISModalEntryPointEditing;
  v13 = -[PRUISModalEntryPointEditing init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_editingType = a3;
    v15 = objc_msgSend(v10, "copy");
    extensionIdentifier = v14->_extensionIdentifier;
    v14->_extensionIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v14->_updateSessionInfo, a6);
    PRUISLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "_path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contentsURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl(&dword_2445ED000, v17, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: creating with poster path: %@", buf, 0xCu);

    }
    v20 = v14;
  }

  return v14;
}

- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3
{
  id v5;
  PRUISModalEntryPointEditing *v6;
  PRUISModalEntryPointEditing *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *extensionIdentifier;
  NSObject *v12;
  void *v13;
  void *v14;
  PRUISModalEntryPointEditing *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRUISModalEntryPointEditing;
  v6 = -[PRUISModalEntryPointEditing init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_editingType = 2;
    objc_msgSend(v5, "_path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "provider");
    v10 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v7->_extensionIdentifier;
    v7->_extensionIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v7->_serviceConfiguration, a3);
    PRUISLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "_path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentsURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl(&dword_2445ED000, v12, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: editing with poster path: %@", buf, 0xCu);

    }
    v15 = v7;
  }

  return v7;
}

- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3 updateSessionInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRUISModalEntryPointEditing *v10;
  PRUISModalEntryPointEditing *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *extensionIdentifier;
  NSObject *v16;
  void *v17;
  void *v18;
  PRUISModalEntryPointEditing *v19;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("serviceConfiguration != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditing initWithServiceConfiguration:updateSessionInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24460A354);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sessionInfo != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditing initWithServiceConfiguration:updateSessionInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24460A3B8);
  }
  v23.receiver = self;
  v23.super_class = (Class)PRUISModalEntryPointEditing;
  v10 = -[PRUISModalEntryPointEditing init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_editingType = 3;
    objc_msgSend(v7, "_path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "provider");
    v14 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v11->_extensionIdentifier;
    v11->_extensionIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_serviceConfiguration, a3);
    objc_storeStrong((id *)&v11->_updateSessionInfo, a4);
    PRUISLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "_path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentsURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_2445ED000, v16, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: editing with poster path: %@", buf, 0xCu);

    }
    v19 = v11;
  }

  return v11;
}

- (PFServerPosterPath)serverPosterPath
{
  void *serviceConfiguration;

  serviceConfiguration = self->_serviceConfiguration;
  if (serviceConfiguration)
  {
    objc_msgSend(serviceConfiguration, "_path");
    serviceConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PFServerPosterPath *)serviceConfiguration;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t editingType;
  uint64_t v8;
  id v9;
  id v10;
  NSString *extensionIdentifier;
  id v12;
  id v13;
  PRSPosterConfiguration *serviceConfiguration;
  id v15;
  id v16;
  PRMutablePosterConfiguration *configuration;
  id v18;
  id v19;
  PRSPosterUpdateSessionInfo *updateSessionInfo;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  editingType = self->_editingType;
  v8 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke;
  v32[3] = &unk_251535C78;
  v9 = v6;
  v33 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", editingType, v32);
  extensionIdentifier = self->_extensionIdentifier;
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_2;
  v30[3] = &unk_251535C28;
  v12 = v9;
  v31 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", extensionIdentifier, v30);
  serviceConfiguration = self->_serviceConfiguration;
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_3;
  v28[3] = &unk_251535CA0;
  v15 = v12;
  v29 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", serviceConfiguration, v28);
  configuration = self->_configuration;
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_4;
  v26[3] = &unk_251535CC8;
  v18 = v15;
  v27 = v18;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", configuration, v26);
  updateSessionInfo = self->_updateSessionInfo;
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_5;
  v24[3] = &unk_251535CF0;
  v25 = v18;
  v21 = v18;
  v22 = (id)objc_msgSend(v5, "appendObject:counterpart:", updateSessionInfo, v24);
  LOBYTE(updateSessionInfo) = objc_msgSend(v5, "isEqual");

  return (char)updateSessionInfo;
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editingType");
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceConfiguration");
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configuration");
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSessionInfo");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_editingType);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_extensionIdentifier);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_serviceConfiguration);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_configuration);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_updateSessionInfo);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t editingType;

  editingType = self->_editingType;
  if (editingType == 2)
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceConfiguration:", self->_serviceConfiguration);
  if (editingType == 3)
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceConfiguration:updateSessionInfo:", self->_serviceConfiguration, self->_updateSessionInfo);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:extensionIdentifier:configuration:updateSessionInfo:", self->_editingType, self->_extensionIdentifier, self->_configuration, self->_updateSessionInfo);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointEditing)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  PRUISModalEntryPointEditing *v17;
  PRUISModalEntryPointEditing *v18;
  PRUISModalEntryPointEditing *v19;
  uint64_t v20;
  PRUISModalEntryPointEditing *v21;
  PRUISModalEntryPointEditing *v22;
  NSObject *v23;
  NSObject *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("editingType"));
  if (v5 == 3)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("extensionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      PRUISLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      goto LABEL_38;
    }
    v8 = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      PRUISLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
LABEL_32:
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.2();
LABEL_44:
      v19 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", v13);
    if (v14)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionInfo"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        v17 = -[PRUISModalEntryPointEditing initWithType:extensionIdentifier:configuration:updateSessionInfo:](self, "initWithType:extensionIdentifier:configuration:updateSessionInfo:", 3, v8, 0, v15);
        v18 = v17;
        if (v17)
          objc_storeStrong((id *)&v17->_serviceConfiguration, v14);
        self = v18;
        v19 = self;
        goto LABEL_48;
      }
      PRUISLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.10();
    }
    else
    {
      PRUISLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.3();
    }
    v19 = 0;
LABEL_48:

    goto LABEL_49;
  }
  v6 = v5;
  if (v5 == 2)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("extensionIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      PRUISLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
LABEL_28:
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.1();
LABEL_38:
      v19 = 0;
      goto LABEL_50;
    }
    v8 = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", v13);
      if (v14)
      {
        v21 = -[PRUISModalEntryPointEditing initWithType:extensionIdentifier:configuration:updateSessionInfo:](self, "initWithType:extensionIdentifier:configuration:updateSessionInfo:", 2, v8, 0, 0);
        v22 = v21;
        if (v21)
          objc_storeStrong((id *)&v21->_serviceConfiguration, v14);
        self = v22;
        v19 = self;
        goto LABEL_49;
      }
      PRUISLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.3();

      goto LABEL_44;
    }
    PRUISLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    goto LABEL_44;
  }
  if (v5 != 1)
  {
    v11 = 0;
    v8 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("extensionIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    PRUISLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    goto LABEL_38;
  }
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    PRUISLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.2();
    goto LABEL_37;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE74DC8]), "_initWithPath:", v9);
  if (!v10)
  {
    PRUISLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.3();
LABEL_37:

    goto LABEL_38;
  }
  v11 = (void *)v10;

LABEL_22:
  self = -[PRUISModalEntryPointEditing initWithType:extensionIdentifier:configuration:updateSessionInfo:](self, "initWithType:extensionIdentifier:configuration:updateSessionInfo:", v6, v8, v11, 0);

  v19 = self;
LABEL_50:

  return v19;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  int64_t editingType;
  void *v6;
  PRSPosterUpdateSessionInfo *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  PRSPosterUpdateSessionInfo *updateSessionInfo;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  editingType = self->_editingType;
  switch(editingType)
  {
    case 3:
      -[PRSPosterConfiguration _path](self->_serviceConfiguration, "_path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v10, "extendContentsReadAccessToAuditToken:error:", 0, &v16);
      v7 = (PRSPosterUpdateSessionInfo *)objc_claimAutoreleasedReturnValue();
      v8 = v16;

      if (!v7)
      {
        PRUISLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:].cold.3();

      }
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("posterPath"));
      updateSessionInfo = self->_updateSessionInfo;
      v13 = CFSTR("sessionInfo");
      v14 = v4;
      goto LABEL_17;
    case 2:
      -[PRSPosterConfiguration _path](self->_serviceConfiguration, "_path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v15, "extendContentsReadAccessToAuditToken:error:", 0, &v17);
      v7 = (PRSPosterUpdateSessionInfo *)objc_claimAutoreleasedReturnValue();
      v8 = v17;

      if (!v7)
      {
        PRUISLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:].cold.2();
        goto LABEL_15;
      }
LABEL_16:
      v13 = CFSTR("posterPath");
      v14 = v4;
      updateSessionInfo = v7;
LABEL_17:
      objc_msgSend(v14, "encodeObject:forKey:", updateSessionInfo, v13);

      break;
    case 1:
      -[PRMutablePosterConfiguration _path](self->_configuration, "_path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "extendContentsReadAccessToAuditToken:error:", 0, &v18);
      v7 = (PRSPosterUpdateSessionInfo *)objc_claimAutoreleasedReturnValue();
      v8 = v18;

      if (!v7)
      {
        PRUISLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:].cold.1();
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_16;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_editingType, CFSTR("editingType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionIdentifier, CFSTR("extensionIdentifier"));

}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return CFSTR("Editing");
}

- (PRSPosterConfiguration)_serviceConfiguration
{
  return self->_serviceConfiguration;
}

- (int64_t)editingType
{
  return self->_editingType;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (PRMutablePosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRSPosterUpdateSessionInfo)updateSessionInfo
{
  return self->_updateSessionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSessionInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceConfiguration, 0);
}

- (void)initWithServiceConfiguration:updateSessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithServiceConfiguration:updateSessionInfo:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_2(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not decode extension identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_2();
}

- (void)initWithBSXPCCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_2(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not decode poster path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_2();
}

- (void)initWithBSXPCCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_2(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not create poster configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_2();
}

- (void)initWithBSXPCCoder:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_2(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not decode update session info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_2();
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension for new poster from configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)encodeWithBSXPCCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension to edit existing configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)encodeWithBSXPCCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension to edit existing configuration with update session info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
