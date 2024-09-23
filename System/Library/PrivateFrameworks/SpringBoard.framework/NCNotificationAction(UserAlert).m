@implementation NCNotificationAction(UserAlert)

+ (id)defaultNotificationActionForSBAlertItem:()UserAlert
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NCUserAlertDefaultActionRunner *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%lu-default"), v7, objc_msgSend(v3, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", v8);
  objc_msgSend(v4, "setActivationMode:", 0);
  objc_msgSend(v4, "setRequiresAuthentication:", 0);
  v9 = -[NCUserAlertActionRunner initWithSBAlertItem:]([NCUserAlertDefaultActionRunner alloc], "initWithSBAlertItem:", v3);

  objc_msgSend(v4, "setActionRunner:", v9);
  return v4;
}

+ (id)dismissNotificationActionForSBAlertItem:()UserAlert
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NCUserAlertDismissActionRunner *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%lu-dismiss"), v7, objc_msgSend(v3, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", v8);
  objc_msgSend(v4, "setActivationMode:", 0);
  objc_msgSend(v4, "setRequiresAuthentication:", 0);
  v9 = -[NCUserAlertActionRunner initWithSBAlertItem:]([NCUserAlertDismissActionRunner alloc], "initWithSBAlertItem:", v3);

  objc_msgSend(v4, "setActionRunner:", v9);
  return v4;
}

@end
