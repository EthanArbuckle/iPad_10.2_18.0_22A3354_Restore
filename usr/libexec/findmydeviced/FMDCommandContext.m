@implementation FMDCommandContext

- (FMDCommandContext)initWithAccessory:(id)a3
{
  id v4;
  FMDCommandContext *v5;
  FMDCommandContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDCommandContext;
  v5 = -[FMDCommandContext init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FMDCommandContext setAccessory:](v5, "setAccessory:", v4);

  return v6;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(0x%p) with accessory(0x%p) "), v3, self, v4));

  return v5;
}

- (void)cleanupContexts
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  if (v11)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v5 = objc_msgSend((id)objc_opt_class(self, v4), "intentContextKeyForAccessory:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v3, "cleanupAllContextsForKey:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v9 = objc_msgSend((id)objc_opt_class(self, v8), "pendingActionKeyForAccessory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v7, "cleanupAllContextsForKey:", v10);

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  objc_msgSend(v6, "cleanupAllContextsForKey:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v8 = objc_msgSend(v7, "saveContext:forContextKey:dataProtectionClass:", v9, v5, 4);

}

+ (id)intentContextKeyForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AccessoryIntent:%@"), v3));

  return v4;
}

+ (id)pendingActionKeyForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AccessoryActionPending:%@"), v3));

  return v4;
}

- (NSDictionary)lastCompletedIntentDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "intentContextKeyForAccessory:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextForKey:contextUUID:error:", v7, 0, 0));

    v10 = objc_opt_class(NSDictionary, v9);
    v11 = 0;
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
      v11 = v8;

  }
  else
  {
    v11 = 0;
  }

  return (NSDictionary *)v11;
}

- (NSUUID)pendingActionUUID
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "pendingActionKeyForAccessory:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v11 = 0;
    v8 = objc_msgSend(v4, "contextForKey:contextUUID:error:", v7, &v11, 0);
    v9 = v11;

  }
  else
  {
    v9 = 0;
  }

  return (NSUUID *)v9;
}

- (void)setPendingActionIntent:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v4), "pendingActionKeyForAccessory:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FMDCommandContext setObject:forKey:](self, "setObject:forKey:", v8, v7);

  }
}

- (void)setActionCompleted:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext accessory](self, "accessory"));
  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(self, v5), "pendingActionKeyForAccessory:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v17 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextForKey:contextUUID:error:", v8, &v17, 0));
    v11 = v17;

    v12 = objc_msgSend(v6, "connectionState");
    if (v4 && v12 == (id)1 && objc_msgSend(v11, "isEqual:", v4))
    {
      v14 = objc_msgSend((id)objc_opt_class(self, v13), "intentContextKeyForAccessory:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[FMDCommandContext setObject:forKey:](self, "setObject:forKey:", v10, v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
      objc_msgSend(v16, "cleanupContextsForKey:contextUUID:", v8, v4);

    }
  }

}

- (BOOL)pendingAction
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandContext pendingActionUUID](self, "pendingActionUUID"));
  v3 = v2 != 0;

  return v3;
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
}

@end
