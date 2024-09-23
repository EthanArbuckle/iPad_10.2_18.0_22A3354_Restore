@implementation PRUISForwardExtensionAppearanceNotificationAction

- (PRUISForwardExtensionAppearanceNotificationAction)initWithNotificationName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  PRUISForwardExtensionAppearanceNotificationAction *v8;
  objc_super v10;

  v4 = (objc_class *)MEMORY[0x24BE0BE40];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setObject:forSetting:", v7, 1);
  v10.receiver = self;
  v10.super_class = (Class)PRUISForwardExtensionAppearanceNotificationAction;
  v8 = -[PRUISForwardExtensionAppearanceNotificationAction initWithInfo:responder:](&v10, sel_initWithInfo_responder_, v6, 0);

  return v8;
}

- (NSString)notificationName
{
  void *v2;
  void *v3;

  -[PRUISForwardExtensionAppearanceNotificationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("notificationName");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 1)
    return 0;
  -[PRUISForwardExtensionAppearanceNotificationAction notificationName](self, "notificationName", a3, a4, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
