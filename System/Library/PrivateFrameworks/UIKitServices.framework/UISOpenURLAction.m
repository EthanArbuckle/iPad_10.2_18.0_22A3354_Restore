@implementation UISOpenURLAction

- (UISOpenURLAction)initWithURL:(id)a3
{
  return -[UISOpenURLAction initWithURL:workspaceOriginatingProcess:](self, "initWithURL:workspaceOriginatingProcess:", a3, 0);
}

- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4
{
  return -[UISOpenURLAction initWithURL:workspaceOriginatingProcess:responder:](self, "initWithURL:workspaceOriginatingProcess:responder:", a3, a4, 0);
}

- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4 responder:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  UISOpenURLAction *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISOpenURLAction.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v12 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v12, "setObject:forSetting:", v13, 1);

  objc_msgSend(v12, "setObject:forSetting:", v10, 2);
  v17.receiver = self;
  v17.super_class = (Class)UISOpenURLAction;
  v14 = -[UISOpenURLAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v12, v11);

  return v14;
}

- (UISOpenURLAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  UISOpenURLAction *v18;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "objectForSetting:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (NSClassFromString(CFSTR("NSURL")))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  v11 = v10;
  if (v8 && !v10)
  {
    BSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136446466;
      v21 = "[info objectForSetting:1]";
      v22 = 2082;
      v23 = "NSURL";
      _os_log_impl(&dword_190875000, v12, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\", (uint8_t *)&v20, 0x16u);
    }

  }
  objc_msgSend(v7, "objectForSetting:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (NSClassFromString(CFSTR("BSProcessHandle")))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
  v16 = v15;
  if (v13 && !v15)
  {
    BSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136446466;
      v21 = "[info objectForSetting:2]";
      v22 = 2082;
      v23 = "BSProcessHandle";
      _os_log_impl(&dword_190875000, v17, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\", (uint8_t *)&v20, 0x16u);
    }

  }
  v18 = -[UISOpenURLAction initWithURL:workspaceOriginatingProcess:](self, "initWithURL:workspaceOriginatingProcess:", v11, v16);

  return v18;
}

- (BSProcessHandle)workspaceOriginatingProcess
{
  void *v2;
  void *v3;

  -[UISOpenURLAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSProcessHandle *)v3;
}

- (NSURL)url
{
  void *v2;
  id v3;

  -[UISOpenURLAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int64_t)UIActionType
{
  return 1;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("url");
  else
    return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISOpenURLAction;
  if (-[UISOpenURLAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

@end
