@implementation WFIntentHandlerResource

- (void)refreshAvailability
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[WFIntentHandlerResource action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);

  if (v13)
  {
    -[WFIntentHandlerResource action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intentDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v8, "facadeClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedIntents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v9);

    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", v12, 0);
  }
  else
  {
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, 0);
  }

}

- (void)setupWithAction:(id)a3
{
  WFHandleIntentAction **p_action;
  id v5;
  id WeakRetained;

  p_action = &self->_action;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  objc_storeWeak((id *)p_action, v5);
  objc_msgSend(v5, "addEventObserver:", self);

  -[WFResource invalidateAvailability](self, "invalidateAvailability");
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("IntentAppDefinition")))
    -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
}

- (BOOL)requiresIntentSupport
{
  return self->_requiresIntentSupport;
}

- (WFHandleIntentAction)action
{
  return (WFHandleIntentAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

@end
