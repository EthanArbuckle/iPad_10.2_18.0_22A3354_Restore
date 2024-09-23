@implementation UISHandleRemoteNotificationAction

- (id)_initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 type:(unint64_t)a6 withHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  UISHandleRemoteNotificationAction *v20;
  void *v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleRemoteNotificationAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payload"));

  }
  v17 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  objc_msgSend(v17, "setObject:forSetting:", v13, 1);
  objc_msgSend(v17, "setObject:forSetting:", v14, 2);
  objc_msgSend(v17, "setObject:forSetting:", v15, 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v18, 3);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D22F60], "responderWithHandler:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)UISHandleRemoteNotificationAction;
  v20 = -[UISHandleRemoteNotificationAction initWithInfo:responder:](&v23, sel_initWithInfo_responder_, v17, v19);

  return v20;
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 withHandler:(id)a4
{
  return (UISHandleRemoteNotificationAction *)-[UISHandleRemoteNotificationAction _initWithRemoteNotificationPayload:action:userResponse:type:withHandler:](self, "_initWithRemoteNotificationPayload:action:userResponse:type:withHandler:", a3, 0, 0, 3, a4);
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 withHandler:(id)a5
{
  return (UISHandleRemoteNotificationAction *)-[UISHandleRemoteNotificationAction _initWithRemoteNotificationPayload:action:userResponse:type:withHandler:](self, "_initWithRemoteNotificationPayload:action:userResponse:type:withHandler:", a3, a4, 0, 4, a5);
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 withHandler:(id)a6
{
  return (UISHandleRemoteNotificationAction *)-[UISHandleRemoteNotificationAction _initWithRemoteNotificationPayload:action:userResponse:type:withHandler:](self, "_initWithRemoteNotificationPayload:action:userResponse:type:withHandler:", a3, a4, a5, 4, a6);
}

- (UISHandleRemoteNotificationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return (UISHandleRemoteNotificationAction *)-[UISHandleRemoteNotificationAction _initWithRemoteNotificationPayload:action:userResponse:type:withHandler:](self, "_initWithRemoteNotificationPayload:action:userResponse:type:withHandler:", 0, 0, 0, 3, 0, a4);
}

- (id)payload
{
  void *v2;
  void *v3;

  -[UISHandleRemoteNotificationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)action
{
  void *v4;
  void *v5;
  void *v7;

  if (-[UISHandleRemoteNotificationAction UIActionType](self, "UIActionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleRemoteNotificationAction.m"), 53, CFSTR("You're trying to get the action but this is just a simple remote notification"));

  }
  -[UISHandleRemoteNotificationAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)userResponse
{
  void *v2;
  void *v3;

  -[UISHandleRemoteNotificationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)UIActionType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UISHandleRemoteNotificationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)sendResponse:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (-[UISHandleRemoteNotificationAction UIActionType](self, "UIActionType") == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleRemoteNotificationAction.m"), 68, CFSTR("You sent back the wrong response class -> %@"), v5);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UISHandleRemoteNotificationAction;
  -[UISHandleRemoteNotificationAction sendResponse:](&v7, sel_sendResponse_, v5);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_1E2CAF590[a3 - 1];
}

@end
