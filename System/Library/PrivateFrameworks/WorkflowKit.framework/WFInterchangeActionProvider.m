@implementation WFInterchangeActionProvider

- (id)availableActionIdentifiers
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_4317);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithArray:", v5);

  return v6;
}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WFInterchangeActionProvider *v12;

  v5 = a3;
  objc_msgSend(v5, "if_map:", &__block_literal_global_106);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsWithIdentifiers:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__WFInterchangeActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_2;
  v10[3] = &unk_1E7AEB440;
  v11 = v7;
  v12 = self;
  v8 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

}

- (id)actionWithInterchangeAction:(id)a3 serializedParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "createsWFAction"))
  {
    objc_msgSend(v6, "wfActionClassName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "wfActionClassName");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = NSClassFromString(v9);

    }
    else
    {
      v10 = (objc_class *)objc_opt_class();
    }
    if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
    {
      v12 = [v10 alloc];
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFActionProvider defaultActionDefinition](self, "defaultActionDefinition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v12, "initWithInterchangeAction:identifier:definition:serializedParameters:", v6, v13, v14, v7);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __78__WFInterchangeActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v6, "serializedParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithInterchangeAction:serializedParameters:", v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setResult:", v9);
}

uint64_t __78__WFInterchangeActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionIdentifier");
}

id __57__WFInterchangeActionProvider_availableActionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "createsWFAction"))
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
