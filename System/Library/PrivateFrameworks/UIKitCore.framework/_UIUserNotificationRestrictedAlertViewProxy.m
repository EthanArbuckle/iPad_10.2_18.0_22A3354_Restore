@implementation _UIUserNotificationRestrictedAlertViewProxy

+ (id)restrictedProxyForAlertView:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIUserNotificationRestrictedAlertViewProxy;
  objc_msgSendSuper2(&v4, sel_proxyWithTarget_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id delegate;
  id v7;

  v4 = a3;
  -[_UITargetedProxy _target](self, "_target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  delegate = self->_delegate;
  self->_delegate = v4;

  -[_UITargetedProxy _target](self, "_target");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;

  if (isAlertViewDelegateMethod(a3))
  {
    objc_msgSend(self->_delegate, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITargetedProxy _target](self, "_target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;

  if (isAlertViewDelegateMethod(a3))
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    -[_UITargetedProxy _target](self, "_target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  _UIUserNotificationRestrictedAlertViewProxy *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;
  _UIUserNotificationRestrictedAlertViewProxy *v12;

  v4 = a3;
  if (isAlertViewDelegateMethod((SEL)objc_msgSend(v4, "selector")))
  {
    v5 = self;
    v12 = v5;
    objc_msgSend(v4, "setArgument:atIndex:", &v12, 2);
    objc_msgSend(v4, "invokeWithTarget:", v5->_delegate);

  }
  else
  {
    v6 = (char *)objc_msgSend(v4, "selector");
    if (!+[UIView instancesRespondToSelector:](UIView, "instancesRespondToSelector:", v6)
      || (objc_msgSend(MEMORY[0x1E0DE7910], "instancesRespondToSelector:", v6) & 1) != 0
      || v6 == sel_resignFirstResponder)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UIUserNotificationRestrictedAlertViewProxy;
      -[_UITargetedProxy forwardInvocation:](&v11, sel_forwardInvocation_, v4);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99750];
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITargetedProxy _target](self, "_target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("UIView API (%@) is not supported for UIAlertViews presented from view services: %@"), v9, v10);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
}

@end
