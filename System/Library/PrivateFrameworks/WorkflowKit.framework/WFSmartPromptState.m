@implementation WFSmartPromptState

- (WFSmartPromptState)initWithMode:(id)a3 sourceContentAttribution:(id)a4 actionUUID:(id)a5 contentDestination:(id)a6 status:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFSmartPromptState *v17;
  WFSmartPromptState *v18;
  WFSmartPromptState *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptState;
  v17 = -[WFSmartPromptState init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mode, a3);
    objc_storeStrong((id *)&v18->_sourceContentAttribution, a4);
    objc_storeStrong((id *)&v18->_actionUUID, a5);
    objc_storeStrong((id *)&v18->_contentDestination, a6);
    objc_storeStrong((id *)&v18->_status, a7);
    v19 = v18;
  }

  return v18;
}

- (WFSmartPromptState)stateWithStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFSmartPromptState actionUUID](self, "actionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState stateWithStatus:actionUUID:](self, "stateWithStatus:actionUUID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFSmartPromptState *)v6;
}

- (WFSmartPromptState)stateWithStatus:(id)a3 actionUUID:(id)a4
{
  id v6;
  id v7;
  WFSmartPromptState *v8;
  void *v9;
  void *v10;
  void *v11;
  WFSmartPromptState *v12;

  v6 = a4;
  v7 = a3;
  v8 = [WFSmartPromptState alloc];
  -[WFSmartPromptState mode](self, "mode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState contentDestination](self, "contentDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:](v8, "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", v9, v10, v6, v11, v7);

  return v12;
}

- (id)databaseDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[WFSmartPromptState wfSerializedRepresentation](self, "wfSerializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedDeniedPermissionsError
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[WFSmartPromptState contentDestination](self, "contentDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDeniedPermissionsErrorWithContentDestination:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedExfiltrationRestrictedError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedPluralString(CFSTR("This action is trying to share %lu %@ items, which is not allowed."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D68];
  v19[0] = v10;
  v13 = *MEMORY[0x1E0CB2D50];
  v18[0] = v12;
  v18[1] = v13;
  WFLocalizedString(CFSTR("You can allow this in Settings."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[4];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WFSmartPromptState contentDestination](self, "contentDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfSerializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E08];
    v17[0] = v4;
    -[WFSmartPromptState status](self, "status", CFSTR("ContentDestination"), CFSTR("Status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    v16[2] = CFSTR("Mode");
    -[WFSmartPromptState mode](self, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = CFSTR("DataType");
    v17[2] = v7;
    v17[3] = CFSTR("SmartPrompt");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wfSerializedRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v9, "setValue:forKey:", v11, CFSTR("SourceContentAttribution"));
    -[WFSmartPromptState actionUUID](self, "actionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WFSmartPromptState actionUUID](self, "actionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v13, CFSTR("ActionUUID"));

    }
  }
  else
  {
    getWFSecurityLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[WFSmartPromptState description](self, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFSmartPromptState wfSerializedRepresentation]";
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Couldn't serialize WFSmartPromptState because contentDestination was nil, self: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)matches:(id)a3
{
  return -[WFSmartPromptState matches:ignoringAccountData:](self, "matches:ignoringAccountData:", a3, 0);
}

- (BOOL)matches:(id)a3 ignoringAccountData:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  v4 = a4;
  v6 = a3;
  -[WFSmartPromptState actionUUID](self, "actionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    -[WFSmartPromptState mode](self, "mode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      -[WFSmartPromptState contentDestination](self, "contentDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentDestination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "matches:", v12);

      if (!v13)
      {
        LOBYTE(v20) = 0;
        goto LABEL_12;
      }
      -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14
        || (v15 = (void *)v14,
            objc_msgSend(v6, "sourceContentAttribution"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            v15,
            !v16))
      {
        LOBYTE(v20) = 1;
        goto LABEL_12;
      }
      -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (v4)
      {
        objc_msgSend(v17, "attributionByReplacingAccountWithAppOrigin");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "origin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sourceContentAttribution");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "attributionByReplacingAccountWithAppOrigin");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "origin");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v20) = objc_msgSend(v9, "isEqual:", v19);

      }
      else
      {
        objc_msgSend(v17, "origin");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sourceContentAttribution");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "origin");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v8, "isEqual:", v10);
      }
    }
    else
    {
      LOBYTE(v20) = 0;
    }

  }
  else
  {
    LOBYTE(v20) = 0;
  }

LABEL_12:
  return v20;
}

- (id)stateByReplacingAccountWithAppOrigin
{
  WFSmartPromptState *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFSmartPromptState *v10;

  v3 = [WFSmartPromptState alloc];
  -[WFSmartPromptState mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributionByReplacingAccountWithAppOrigin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState actionUUID](self, "actionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState contentDestination](self, "contentDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptState status](self, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:](v3, "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", v4, v6, v7, v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFSmartPromptState mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mode"));

  -[WFSmartPromptState sourceContentAttribution](self, "sourceContentAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceContentAttribution"));

  -[WFSmartPromptState actionUUID](self, "actionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionUUID"));

  -[WFSmartPromptState contentDestination](self, "contentDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contentDestination"));

  -[WFSmartPromptState status](self, "status");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("status"));

}

- (WFSmartPromptState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFSmartPromptState *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13EE0], "allContentLocationClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("contentDestination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceContentAttribution"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:](self, "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", v5, v8, v9, v7, v10);
  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *mode;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WFSmartPromptState;
  -[WFSmartPromptState description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mode = self->_mode;
  -[WFContentAttribution description](self->_sourceContentAttribution, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentLocation description](self->_contentDestination, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: mode: %@, source: %@, destination: %@, actionUUID: %@, status: %@"), v4, mode, v6, v7, self->_actionUUID, self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)siriActionToolDescription
{
  void *v3;
  void *v4;
  NSString *mode;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WFSmartPromptState;
  -[WFSmartPromptState description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mode = self->_mode;
  -[WFContentAttribution description](self->_sourceContentAttribution, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentLocation description](self->_contentDestination, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n      - Mode: %@\n      - Source: %@\n      - Destination: %@\n      - Action UUID: %@\n      - Status: %@\n}"), v4, mode, v6, v7, self->_actionUUID, self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFContentAttribution)sourceContentAttribution
{
  return self->_sourceContentAttribution;
}

- (NSString)mode
{
  return self->_mode;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (WFContentLocation)contentDestination
{
  return self->_contentDestination;
}

- (NSString)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_contentDestination, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_sourceContentAttribution, 0);
}

+ (id)stateFromDatabaseData:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    getWFWorkflowExecutionLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "+[WFSmartPromptState stateFromDatabaseData:]";
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Error deserializing smart prompt state property list: %@", buf, 0x16u);

    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "objectWithWFSerializedRepresentation:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    getWFWorkflowExecutionLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[WFSmartPromptState stateFromDatabaseData:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to init smart prompt state from database data.", buf, 0xCu);
    }

    v6 = 0;
    goto LABEL_9;
  }
  v6 = v8;
  v9 = v6;
LABEL_10:

  return v9;
}

+ (id)localizedDeniedPermissionsErrorWithContentDestination:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
    v6 = CFSTR("This shortcut can't access “%@”. You can change this in the shortcut’s privacy settings.");
  else
    v6 = CFSTR("This shortcut can't access a required resource. You can change this in the shortcut’s privacy settings.");
  WFLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)localizedUnsupportedEnvironmentError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("This shortcut requires privacy permissions that cannot be granted while running in this environment."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D68];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedUnlockedDeviceRequiredError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("This shortcut requires privacy permissions that cannot be granted while your device is locked."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Please unlock your device to run this shortcut."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D80];
  v9[0] = *MEMORY[0x1E0CB2D68];
  v9[1] = v5;
  v10[0] = v2;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("DataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isEqualToString:", CFSTR("SmartPrompt")))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ActionUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      getWFWorkflowExecutionLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315138;
        v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to deserialize smart prompt action UUID, returning nil", (uint8_t *)&v20, 0xCu);
      }
      v17 = 0;
      goto LABEL_22;
    }
    v8 = (void *)MEMORY[0x1E0D13EE0];
    objc_msgSend(v4, "valueForKey:", CFSTR("ContentDestination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectWithWFSerializedRepresentation:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("Status"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("Mode"));
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v4, "objectForKey:", CFSTR("SourceContentAttribution"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)MEMORY[0x1E0D13E98];
              objc_msgSend(v4, "objectForKey:", CFSTR("SourceContentAttribution"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectWithWFSerializedRepresentation:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v16 = 0;
            }
            v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", v12, v16, v7, v10, v11);

          }
          else
          {

            getWFWorkflowExecutionLogObject();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v20 = 136315138;
              v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
              _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to deserialize smart prompt mode, returning nil", (uint8_t *)&v20, 0xCu);
            }
            v17 = 0;
          }

          goto LABEL_21;
        }
      }

      getWFWorkflowExecutionLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315138;
        v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
        v18 = "%s Failed to deserialize smart prompt status, returning nil";
LABEL_19:
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315138;
        v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
        v18 = "%s Failed to deserialize smart prompt content destination, returning nil";
        goto LABEL_19;
      }
    }
    v17 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
