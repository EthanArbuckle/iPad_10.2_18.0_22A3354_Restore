@implementation UISceneProposalAction

- (UISceneProposalAction)initWithPersistentIdentifier:(id)a3 action:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  UISceneProposalAction *v20;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISceneProposalAction.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentIdentifier"));

  }
  v15 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v16 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v15, "setObject:forSetting:", v16, 10);

  v17 = objc_msgSend(v12, "UIActionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v18, 11);

  if (v17 <= 0x1A && ((1 << v17) & 0x4020042) != 0)
  {
    objc_msgSend(v12, "info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applySettings:", v19);

  }
  v23.receiver = self;
  v23.super_class = (Class)UISceneProposalAction;
  v20 = -[UISceneProposalAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v23, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v15, v13, v14, 5.0);

  return v20;
}

- (NSString)persistentIdentifier
{
  void *v2;
  id v3;

  -[UISceneProposalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 10);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BSAction)action
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __objc2_class *v7;
  UINotificationResponseAction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  UIHandleApplicationShortcutAction *v13;

  -[UISceneProposalAction info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = 0;
  if (v5 > 16)
  {
    if (v5 == 17)
    {
      v13 = [UIHandleApplicationShortcutAction alloc];
      -[UISceneProposalAction info](self, "info");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForSetting:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UISHandleApplicationShortcutAction initWithSBSShortcutItem:](v13, "initWithSBSShortcutItem:", v10);
    }
    else
    {
      if (v5 != 26)
        return (BSAction *)v6;
      v8 = [UINotificationResponseAction alloc];
      -[UISceneProposalAction info](self, "info");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForSetting:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UISNotificationResponseAction initWithResponse:withHandler:](v8, "initWithResponse:withHandler:", v10, 0);
    }
    v6 = (void *)v11;

    goto LABEL_12;
  }
  if (v5 == 1)
  {
    v7 = UIOpenURLAction;
    goto LABEL_9;
  }
  if (v5 == 6)
  {
    v7 = UIActivityContinuationAction;
LABEL_9:
    v12 = [v7 alloc];
    -[UISceneProposalAction info](self, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v9, 0, 0, 0.0);
LABEL_12:

  }
  return (BSAction *)v6;
}

- (int64_t)UIActionType
{
  return 34;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("actionValues");
  if (a3 == 11)
    v3 = CFSTR("actionType");
  if (a3 == 10)
    return CFSTR("sceneID");
  else
    return (id)v3;
}

@end
