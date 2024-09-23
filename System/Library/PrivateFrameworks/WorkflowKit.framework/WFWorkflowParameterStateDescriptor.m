@implementation WFWorkflowParameterStateDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "mtl_identityPropertyMapWithModel:", a1);
}

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cachedDisplayName")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFWorkflowParameterStateDescriptor;
    v5 = objc_msgSendSuper2(&v7, sel_storageBehaviorForPropertyWithKey_, v4);
  }

  return (unint64_t)v5;
}

- (WFWorkflowParameterStateDescriptor)initWithWorkflowName:(id)a3 workflowIdentifier:(id)a4 isSelf:(BOOL)a5
{
  id v9;
  id v10;
  WFWorkflowParameterStateDescriptor *v11;
  uint64_t v12;
  NSString *workflowName;
  uint64_t v14;
  NSString *workflowIdentifier;
  WFWorkflowParameterStateDescriptor *v16;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowParameterState.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowName"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFWorkflowParameterStateDescriptor;
  v11 = -[MTLModel init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    workflowName = v11->_workflowName;
    v11->_workflowName = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    workflowIdentifier = v11->_workflowIdentifier;
    v11->_workflowIdentifier = (NSString *)v14;

    v11->_isSelf = a5;
    v16 = v11;
  }

  return v11;
}

- (WFWorkflowParameterStateDescriptor)initWithWorkflowReference:(id)a3 isSelf:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  WFWorkflowParameterStateDescriptor *v10;
  void *v11;
  uint64_t v12;
  NSString *cachedDisplayName;
  WFWorkflowParameterStateDescriptor *v14;
  void *v16;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowParameterState.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowReference"));

  }
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFWorkflowParameterStateDescriptor initWithWorkflowName:workflowIdentifier:isSelf:](self, "initWithWorkflowName:workflowIdentifier:isSelf:", v8, v9, v4);

  if (v10)
  {
    -[WFWorkflowParameterStateDescriptor workflowName](v10, "workflowName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    cachedDisplayName = v10->_cachedDisplayName;
    v10->_cachedDisplayName = (NSString *)v12;

    v14 = v10;
  }

  return v10;
}

- (id)displayNameWithDatabase:(id)a3 containingWorkflow:(id)a4
{
  NSString *cachedDisplayName;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  cachedDisplayName = self->_cachedDisplayName;
  if (!cachedDisplayName)
  {
    -[WFWorkflowParameterStateDescriptor matchingWorkflowInDatabase:containingWorkflow:](self, "matchingWorkflowInDatabase:containingWorkflow:", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "name");
    else
      -[WFWorkflowParameterStateDescriptor workflowName](self, "workflowName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    v10 = self->_cachedDisplayName;
    self->_cachedDisplayName = v9;

    cachedDisplayName = self->_cachedDisplayName;
  }
  return cachedDisplayName;
}

- (id)matchingWorkflowInDatabase:(id)a3 containingWorkflow:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[WFWorkflowParameterStateDescriptor isSelf](self, "isSelf");
  if (v7 && v8)
  {
    v9 = v7;
  }
  else
  {
    -[WFWorkflowParameterStateDescriptor workflowIdentifier](self, "workflowIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(v6, "referenceForWorkflowID:", v10), (v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[WFWorkflowParameterStateDescriptor workflowName](self, "workflowName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueVisibleReferenceForWorkflowName:", v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (NSString)workflowName
{
  return self->_workflowName;
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (BOOL)isSelf
{
  return self->_isSelf;
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowName, 0);
}

@end
