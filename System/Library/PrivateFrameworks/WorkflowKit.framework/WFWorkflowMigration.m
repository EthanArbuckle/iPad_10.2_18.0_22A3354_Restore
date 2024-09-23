@implementation WFWorkflowMigration

+ (id)migrationClassDependencies
{
  return 0;
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return 0;
}

- (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id completionHandler;

  objc_storeStrong((id *)&self->_workflow, a3);
  v7 = a3;
  v8 = a4;
  v9 = _Block_copy(v8);

  completionHandler = self->_completionHandler;
  self->_completionHandler = v9;

  -[WFWorkflowMigration migrateWorkflow](self, "migrateWorkflow");
}

- (NSMutableSet)warnings
{
  NSMutableSet *warnings;
  NSMutableSet *v4;
  NSMutableSet *v5;

  warnings = self->_warnings;
  if (!warnings)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_warnings;
    self->_warnings = v4;

    warnings = self->_warnings;
  }
  return warnings;
}

- (void)finish
{
  void (**completionHandler)(id, NSMutableSet *);

  completionHandler = (void (**)(id, NSMutableSet *))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, self->_warnings);
}

- (NSMutableArray)actions
{
  void *v2;
  void *v3;

  -[WFWorkflowMigration workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WFWorkflowActions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (NSString)actionIdentifierKey
{
  __CFString *v2;

  v2 = CFSTR("WFWorkflowActionIdentifier");
  return (NSString *)CFSTR("WFWorkflowActionIdentifier");
}

- (NSString)actionParametersKey
{
  __CFString *v2;

  v2 = CFSTR("WFWorkflowActionParameters");
  return (NSString *)CFSTR("WFWorkflowActionParameters");
}

- (void)enumerateActionsWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFWorkflowMigration actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__WFWorkflowMigration_enumerateActionsWithIdentifier_usingBlock___block_invoke;
  v11[3] = &unk_1E7AED3D0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

- (NSMutableDictionary)workflow
{
  return self->_workflow;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
}

void __65__WFWorkflowMigration_enumerateActionsWithIdentifier_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t))(v9 + 16))(v9, v12, v11, a4);

  }
}

@end
