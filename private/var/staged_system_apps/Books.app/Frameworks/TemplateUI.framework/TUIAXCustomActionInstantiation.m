@implementation TUIAXCustomActionInstantiation

- (TUIAXCustomActionInstantiation)initWithCustomAction:(id)a3 arguments:(id)a4 axElement:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIAXCustomActionInstantiation *v12;
  TUIAXCustomActionInstantiation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIAXCustomActionInstantiation;
  v12 = -[TUIAXCustomActionInstantiation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_customAction, a3);
    objc_storeStrong((id *)&v13->_additionalArguments, a4);
    objc_storeWeak((id *)&v13->_triggerAXElement, v11);
  }

  return v13;
}

- (BOOL)invoke
{
  NSMutableDictionary *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;

  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap arguments](self->_additionalArguments, "arguments"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_triggerAXElement);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("sourceView")));

    if (!v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_triggerAXElement);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXCustomAction controlIdentifier](self->_customAction, "controlIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controlViewForOverrideIdentifier:", v8));

      if (v9)
      {
        v10 = -[TUIElementBehaviorArgumentsMap mutableCopy](self->_additionalArguments, "mutableCopy");
        v11 = v10;
        if (v10)
          v12 = (NSMutableDictionary *)v10;
        else
          v12 = objc_opt_new(NSMutableDictionary);
        v13 = v12;

        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, CFSTR("sourceView"));
        v3 = v13;
      }

    }
  }
  -[TUIAXCustomAction invokeWithArguments:](self->_customAction, "invokeWithArguments:", v3);

  return 1;
}

- (TUIAXCustomAction)customAction
{
  return self->_customAction;
}

- (TUIElementBehaviorArgumentsMap)additionalArguments
{
  return self->_additionalArguments;
}

- (TUIAXElement)triggerAXElement
{
  return (TUIAXElement *)objc_loadWeakRetained((id *)&self->_triggerAXElement);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_triggerAXElement);
  objc_storeStrong((id *)&self->_additionalArguments, 0);
  objc_storeStrong((id *)&self->_customAction, 0);
}

@end
