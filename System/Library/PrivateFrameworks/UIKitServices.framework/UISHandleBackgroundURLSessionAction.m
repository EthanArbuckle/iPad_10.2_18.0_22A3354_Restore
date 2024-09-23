@implementation UISHandleBackgroundURLSessionAction

- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3
{
  return -[UISHandleBackgroundURLSessionAction initWithSessionIdentifier:timeout:forResponseOnQueue:withHandler:](self, "initWithSessionIdentifier:timeout:forResponseOnQueue:withHandler:", a3, 0, 0, 0.0);
}

- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  UISHandleBackgroundURLSessionAction *v17;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleBackgroundURLSessionAction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  }
  v13 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v14 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v13, "setObject:forSetting:", v14, 1);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D22F60], "responderWithHandler:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "setQueue:", v11);
  }
  else
  {
    v16 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)UISHandleBackgroundURLSessionAction;
  v17 = -[UISHandleBackgroundURLSessionAction initWithInfo:responder:](&v20, sel_initWithInfo_responder_, v13, v16);

  return v17;
}

- (UISHandleBackgroundURLSessionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISHandleBackgroundURLSessionAction initWithSessionIdentifier:](self, "initWithSessionIdentifier:", 0, a5, a6, a4);
}

- (NSString)sessionIdentifier
{
  void *v2;
  void *v3;

  -[UISHandleBackgroundURLSessionAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)UIActionType
{
  return 5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("sessionIdentifier");
  else
    return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISHandleBackgroundURLSessionAction;
  if (-[UISHandleBackgroundURLSessionAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

@end
