@implementation WFSerializedSmartPromptPerWorkflowState

- (WFSerializedSmartPromptPerWorkflowState)initWithData:(id)a3 actionUUID:(id)a4
{
  id v7;
  id v8;
  WFSerializedSmartPromptPerWorkflowState *v9;
  uint64_t v10;
  NSString *actionUUID;
  uint64_t v12;
  NSData *data;
  WFSerializedSmartPromptPerWorkflowState *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSerializedSmartPromptPerWorkflowState.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFSerializedSmartPromptPerWorkflowState;
  v9 = -[WFSerializedSmartPromptPerWorkflowState init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    actionUUID = v9->_actionUUID;
    v9->_actionUUID = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    data = v9->_data;
    v9->_data = (NSData *)v12;

    v14 = v9;
  }

  return v9;
}

- (WFSerializedSmartPromptPerWorkflowState)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFSerializedSmartPromptPerWorkflowState *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[WFSerializedSmartPromptPerWorkflowState initWithData:actionUUID:](self, "initWithData:actionUUID:", v6, v5);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSerializedSmartPromptPerWorkflowState data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("data"));

  -[WFSerializedSmartPromptPerWorkflowState actionUUID](self, "actionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFSerializedSmartPromptPerWorkflowState actionUUID](self, "actionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("actionUUID"));

  }
  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFSerializedSmartPromptPerWorkflowState *v4;
  WFSerializedSmartPromptPerWorkflowState *v5;
  WFSerializedSmartPromptPerWorkflowState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (WFSerializedSmartPromptPerWorkflowState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFSerializedSmartPromptPerWorkflowState data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "wfSerializedRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFSerializedSmartPromptPerWorkflowState data](v6, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "wfSerializedRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v9, "isEqualToDictionary:", v12);
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
}

@end
