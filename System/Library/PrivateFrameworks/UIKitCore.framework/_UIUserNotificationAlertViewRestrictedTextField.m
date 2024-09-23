@implementation _UIUserNotificationAlertViewRestrictedTextField

+ (id)restrictedProxyForTextField:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIUserNotificationAlertViewRestrictedTextField;
  objc_msgSendSuper2(&v4, sel_proxyWithTarget_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_supportedMethodSelectorNames
{
  return &unk_1E1A950C0;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_supportedMethodSelectorNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIUserNotificationAlertViewRestrictedTextField;
    -[_UITargetedProxy forwardInvocation:](&v11, sel_forwardInvocation_, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99750];
    objc_msgSend((id)objc_opt_class(), "_supportedMethodSelectorNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Text fields in UIAlertViews displayed from view services only accept these methods: %@"), v10);

  }
}

@end
