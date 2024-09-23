@implementation UINotificationSettingsAction

- (UINotificationSettingsAction)initWithNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UINotificationSettingsAction *v7;
  uint64_t v8;
  UNNotification *notification;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  }
  v11.receiver = self;
  v11.super_class = (Class)UINotificationSettingsAction;
  v7 = -[UINotificationSettingsAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v11, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);
  if (v7)
  {
    v8 = objc_msgSend(v4, "copy");
    notification = v7->_notification;
    v7->_notification = (UNNotification *)v8;

  }
  return v7;
}

- (int64_t)UIActionType
{
  return 32;
}

- (UINotificationSettingsAction)initWithXPCDictionary:(id)a3
{
  UINotificationSettingsAction *v3;
  UINotificationSettingsAction *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UNNotification *notification;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UINotificationSettingsAction;
  v3 = -[UINotificationSettingsAction initWithXPCDictionary:](&v10, sel_initWithXPCDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    -[UINotificationSettingsAction info](v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEC6F8], "bs_secureDecodedFromData:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    notification = v4->_notification;
    v4->_notification = (UNNotification *)v7;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
