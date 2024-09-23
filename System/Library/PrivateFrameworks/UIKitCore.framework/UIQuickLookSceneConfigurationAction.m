@implementation UIQuickLookSceneConfigurationAction

+ (id)actionWithSceneConfiguration:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UISceneSessionRoleQuickLook"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "role");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIQuickLookSceneConfigurationAction.m"), 19, CFSTR("UIInternalSceneConfigurationAction should only be used to configure scenes with the role UISceneSessionRoleQuickLook. Provided Role: %@"), v13);

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v8, 0);

  return v10;
}

- (id)loadSceneConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[UIQuickLookSceneConfigurationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)UIActionType
{
  return 42;
}

@end
