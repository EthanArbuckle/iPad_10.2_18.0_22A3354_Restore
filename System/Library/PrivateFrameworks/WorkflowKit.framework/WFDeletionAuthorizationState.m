@implementation WFDeletionAuthorizationState

- (WFDeletionAuthorizationState)initWithStatus:(id)a3 contentItemClassName:(id)a4 actionUUID:(id)a5 count:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  WFDeletionAuthorizationState *v16;
  WFDeletionAuthorizationState *v17;
  uint64_t v18;
  NSString *contentItemClassName;
  uint64_t v20;
  NSString *actionUUID;
  WFDeletionAuthorizationState *v22;
  void *v24;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDeletionAuthorizationState.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClassName"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDeletionAuthorizationState.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUID"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)WFDeletionAuthorizationState;
  v16 = -[WFDeletionAuthorizationState init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_status, a3);
    v18 = objc_msgSend(v13, "copy");
    contentItemClassName = v17->_contentItemClassName;
    v17->_contentItemClassName = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    actionUUID = v17->_actionUUID;
    v17->_actionUUID = (NSString *)v20;

    v17->_count = a6;
    v22 = v17;
  }

  return v17;
}

- (WFDeletionAuthorizationState)stateWithStatus:(id)a3 count:(unint64_t)a4
{
  id v6;
  WFDeletionAuthorizationState *v7;
  void *v8;
  void *v9;
  WFDeletionAuthorizationState *v10;

  v6 = a3;
  v7 = [WFDeletionAuthorizationState alloc];
  -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDeletionAuthorizationState actionUUID](self, "actionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFDeletionAuthorizationState initWithStatus:contentItemClassName:actionUUID:count:](v7, "initWithStatus:contentItemClassName:actionUUID:count:", v6, v8, v9, a4);

  return v10;
}

- (id)localizedExfiltrationRestrictedError
{
  NSString *v3;
  Class v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSClassFromString(v3);

  -[objc_class localizedPluralFilterDescription](v4, "localizedPluralFilterDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](v4, "canLowercaseTypeDescription"))
  {
    objc_msgSend(v5, "localizedLowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class localizedCountDescriptionWithValue:](v4, "localizedCountDescriptionWithValue:", -[WFDeletionAuthorizationState count](self, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_5:
      v8 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("This action is trying to delete %@, which is not allowed."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v7);
LABEL_11:
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[objc_class countDescription](v4, "countDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, -[WFDeletionAuthorizationState count](self, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedLowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
  }
  getWFWorkflowExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
  if (v5)
  {
    if (v14)
    {
      -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFDeletionAuthorizationState localizedExfiltrationRestrictedError]";
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Missing countDescription for %@", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This action is trying to delete a large amount of %@, which is not allowed."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v9, v5);
    goto LABEL_11;
  }
  if (v14)
  {
    -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFDeletionAuthorizationState localizedExfiltrationRestrictedError]";
    v30 = 2112;
    v31 = v25;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Missing countDescription and typeDescription for %@", buf, 0x16u);

  }
  WFLocalizedString(CFSTR("This action is trying to delete a large amount of data, which is not allowed."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0CB2D68];
  v27[0] = v17;
  v20 = *MEMORY[0x1E0CB2D50];
  v26[0] = v19;
  v26[1] = v20;
  WFLocalizedString(CFSTR("You can allow this in Settings."));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)deniedPermissionsError
{
  void *v3;
  NSString *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deniedPermissionsErrorForContentItemClass:", NSClassFromString(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)databaseDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[WFDeletionAuthorizationState wfSerializedRepresentation](self, "wfSerializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("ActionUUID");
  -[WFDeletionAuthorizationState actionUUID](self, "actionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("Status");
  -[WFDeletionAuthorizationState status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("ContentItemClassName");
  -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFDeletionAuthorizationState count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = CFSTR("DataType");
  v10[3] = v6;
  v10[4] = CFSTR("DeletionAuthorization");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFDeletionAuthorizationState status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("status"));

  -[WFDeletionAuthorizationState contentItemClassName](self, "contentItemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("contentItemClassName"));

  -[WFDeletionAuthorizationState actionUUID](self, "actionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("actionUUID"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFDeletionAuthorizationState count](self, "count"), CFSTR("count"));
}

- (WFDeletionAuthorizationState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  WFDeletionAuthorizationState *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentItemClassName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[WFDeletionAuthorizationState initWithStatus:contentItemClassName:actionUUID:count:](self, "initWithStatus:contentItemClassName:actionUUID:count:", v5, v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WFDeletionAuthorizationState;
  -[WFDeletionAuthorizationState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: actionUUID: %@, contentItemClass: %@, status: %@, count: %lu"), v4, self->_actionUUID, self->_contentItemClassName, self->_status, self->_count);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)siriActionToolDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WFDeletionAuthorizationState;
  -[WFDeletionAuthorizationState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n      - Action UUID: %@\n      - ContentItemClass: %@\n      - Status: %@\n      - Count: %lu\n}"), v4, self->_actionUUID, self->_contentItemClassName, self->_status, self->_count);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)contentItemClassName
{
  return self->_contentItemClassName;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_contentItemClassName, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

+ (id)deniedPermissionsErrorForContentItemClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[objc_class localizedPluralFilterDescription](a3, "localizedPluralFilterDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](a3, "canLowercaseTypeDescription"))
  {
    objc_msgSend(v4, "localizedLowercaseString");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This shortcut can’t delete %@. You can change this in the shortcut’s privacy settings."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "+[WFDeletionAuthorizationState deniedPermissionsErrorForContentItemClass:]";
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Missing pluralTypeDescription for %@", buf, 0x16u);

    }
    WFLocalizedString(CFSTR("This shortcut can’t delete this content. You can change this in the shortcut’s privacy settings."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v15 = *MEMORY[0x1E0CB2D68];
  v16 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)dontDeleteErrorForContentItemClass:(Class)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  getWFWorkflowExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Don't Delete'.", buf, 0xCu);
  }

  -[objc_class localizedPluralFilterDescription](a3, "localizedPluralFilterDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](a3, "canLowercaseTypeDescription"))
  {
    objc_msgSend(v5, "localizedLowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("You opted not to delete any %@."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "+[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:]";
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Missing pluralTypeDescription for %@", buf, 0x16u);

    }
    WFLocalizedString(CFSTR("You opted not to delete some content."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0CB2D68];
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WFSmartPromptErrorDomain"), 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
      v14 = "+[WFDeletionAuthorizationState stateFromDatabaseData:]";
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Error deserializing WFDeletionAuthorizationState property list: %@", buf, 0x16u);

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
      v14 = "+[WFDeletionAuthorizationState stateFromDatabaseData:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to init WFDeletionAuthorizationState from database data.", buf, 0xCu);
    }

    v6 = 0;
    goto LABEL_9;
  }
  v6 = v8;
  v9 = v6;
LABEL_10:

  return v9;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("DataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isEqualToString:", CFSTR("DeletionAuthorization")))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ContentItemClassName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("Status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("ActionUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("Count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    v20 = objc_msgSend(v19, "unsignedIntegerValue");
    if (v10 && v13 && v16 && v20)
    {
      v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatus:contentItemClassName:actionUUID:count:", v13, v10, v16, v20);
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v23 = 136315394;
        v24 = "+[WFDeletionAuthorizationState objectWithWFSerializedRepresentation:]";
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s Failed to deserialize WFDeletionAuthorizationState, returning nil: %{public}@", (uint8_t *)&v23, 0x16u);
      }

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
