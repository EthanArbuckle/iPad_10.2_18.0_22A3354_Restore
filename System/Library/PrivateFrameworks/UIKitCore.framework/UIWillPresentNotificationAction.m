@implementation UIWillPresentNotificationAction

- (UIWillPresentNotificationAction)initWithNotification:(id)a3 timeout:(double)a4 withHandler:(id)a5
{
  return -[UIWillPresentNotificationAction initWithNotification:deliverable:timeout:withHandler:](self, "initWithNotification:deliverable:timeout:withHandler:", a3, 1, a5, a4);
}

- (UIWillPresentNotificationAction)initWithNotification:(id)a3 deliverable:(BOOL)a4 timeout:(double)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  UIWillPresentNotificationAction *v15;
  uint64_t v16;
  UNNotification *notification;
  void *v19;
  objc_super v20;

  v11 = a3;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWillPresentNotificationAction.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v14, "setObject:forSetting:", v13, 1);
  objc_msgSend(v14, "setFlag:forSetting:", BSSettingFlagForBool(), 2);
  v20.receiver = self;
  v20.super_class = (Class)UIWillPresentNotificationAction;
  v15 = -[UIWillPresentNotificationAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v20, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v14, MEMORY[0x1E0C80D38], v12, a5);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    notification = v15->_notification;
    v15->_notification = (UNNotification *)v16;

    v15->_isDeliverable = a4;
  }

  return v15;
}

- (BOOL)isLocal
{
  return !-[UIWillPresentNotificationAction isRemote](self, "isRemote");
}

- (BOOL)isRemote
{
  void *v2;
  char isKindOfClass;

  -[UIWillPresentNotificationAction _trigger](self, "_trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_trigger
{
  void *v2;
  void *v3;
  void *v4;

  -[UIWillPresentNotificationAction notification](self, "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)UIActionType
{
  return 25;
}

- (UIWillPresentNotificationAction)initWithXPCDictionary:(id)a3
{
  UIWillPresentNotificationAction *v3;
  UIWillPresentNotificationAction *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UNNotification *notification;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIWillPresentNotificationAction;
  v3 = -[UIWillPresentNotificationAction initWithXPCDictionary:](&v11, sel_initWithXPCDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIWillPresentNotificationAction info](v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWillPresentNotificationAction info](v4, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flagForSetting:", 2);

    objc_msgSend(MEMORY[0x1E0CEC6F8], "bs_secureDecodedFromData:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    notification = v4->_notification;
    v4->_notification = (UNNotification *)v8;

    v4->_isDeliverable = BSSettingFlagIsYes();
  }
  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("notification");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 1)
    return 0;
  -[UNNotification description](self->_notification, "description", a3, a4, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UNNotification)notification
{
  return self->_notification;
}

- (BOOL)isDeliverable
{
  return self->_isDeliverable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
