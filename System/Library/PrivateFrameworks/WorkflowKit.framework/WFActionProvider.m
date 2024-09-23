@implementation WFActionProvider

- (void)createActionsForRequests:(id)a3
{
  -[WFActionProvider createActionsForRequests:forceLocalActionsOnly:](self, "createActionsForRequests:forceLocalActionsOnly:", a3, 0);
}

- (id)availableActionIdentifiers
{
  return 0;
}

- (id)createAllAvailableActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFActionProvider availableActionIdentifiers](self, "availableActionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_49534);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionProvider createActionsForRequests:](self, "createActionsForRequests:", v5);

  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_139_49535);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)definitionForMissingActionWithSerializedParameters:(id)a3
{
  return 0;
}

- (INStringLocalizer)stringLocalizer
{
  INStringLocalizer *stringLocalizer;
  INStringLocalizer *v4;
  INStringLocalizer *v5;

  stringLocalizer = self->_stringLocalizer;
  if (!stringLocalizer)
  {
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v4 = (INStringLocalizer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stringLocalizer;
    self->_stringLocalizer = v4;

    stringLocalizer = self->_stringLocalizer;
  }
  return stringLocalizer;
}

- (WFActionDefinition)defaultActionDefinition
{
  WFActionDefinition *v3;
  NSString *providerName;
  NSString *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  WFActionDefinition *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = [WFActionDefinition alloc];
  v13 = CFSTR("FillingProvider");
  if (self)
  {
    providerName = self->_providerName;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (providerName == v5)
    {
      v6 = 0;
    }
    else if (providerName)
    {
      providerName = providerName;
      v6 = providerName;
    }
    else
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (v8)
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      providerName = self->_providerName;
      self->_providerName = v9;
    }

  }
  else
  {
    v6 = 0;
  }
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFActionDefinition initWithDictionary:](v3, "initWithDictionary:", v10);

  return v11;
}

- (NSDictionary)defaultSerializedParameters
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (WFActionProviderDelegate)delegate
{
  return (WFActionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setStringLocalizer:(id)a3
{
  objc_storeStrong((id *)&self->_stringLocalizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerName, 0);
}

uint64_t __45__WFActionProvider_createAllAvailableActions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "result");
}

WFActionRequest *__45__WFActionProvider_createAllAvailableActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFActionRequest *v3;

  v2 = a2;
  v3 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v2, 0);

  return v3;
}

@end
