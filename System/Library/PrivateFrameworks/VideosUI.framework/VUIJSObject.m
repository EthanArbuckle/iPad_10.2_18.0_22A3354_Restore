@implementation VUIJSObject

- (VUIJSObject)initWithAppContext:(id)a3
{
  id v4;
  VUIJSObject *v5;
  VUIJSObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIJSObject;
  v5 = -[VUIJSObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_appContext, v4);

  return v6;
}

- (id)invokeMethod:(id)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[VUIJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v8, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithObject:inContext:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hasProperty:", v6))
  {
    objc_msgSend(v11, "invokeMethod:withArguments:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invokeMethod: failed - Method [%@] not defined in [%@]"), v6, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueWithNewErrorFromMessage:inContext:", v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)setJSValue:(id)a3 forProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[VUIJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIJSObject managedProperties](self, "managedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "jsContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "virtualMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeManagedReference:withOwner:", v9, self);

    -[VUIJSObject managedProperties](self, "managedProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v6);

  }
  if (v19)
  {
    -[VUIJSObject managedProperties](self, "managedProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIJSObject setManagedProperties:](self, "setManagedProperties:", v14);

    }
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "virtualMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addManagedReference:withOwner:", v15, self);

    -[VUIJSObject managedProperties](self, "managedProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v15, v6);

  }
}

- (NSMutableDictionary)managedProperties
{
  return self->_managedProperties;
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setManagedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_managedProperties, a3);
}

- (id)jsValueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VUIJSObject managedProperties](self, "managedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedProperties, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (VUIJSObject)init
{

  return 0;
}

@end
