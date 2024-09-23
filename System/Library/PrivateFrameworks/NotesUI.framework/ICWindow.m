@implementation ICWindow

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (ICWindow)initWithWindowScene:(id)a3
{
  return -[ICWindow initWithWindowScene:behavior:](self, "initWithWindowScene:behavior:", a3, 0);
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerManager, a3);
}

- (void)setRootViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICWindow rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ICWindow;
  -[ICWindow setRootViewController:](&v8, sel_setRootViewController_, v4);

  if (v5)
  {
    v9 = CFSTR("previousRootViewController");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICWindowRootViewControllerDidChange"), self, v6);

}

- (void)setWindowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_windowIdentifier, a3);
}

- (void)setToolPickerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerIdentifier, a3);
}

- (ICWindow)initWithWindowScene:(id)a3 behavior:(int64_t)a4
{
  ICWindow *v5;
  ICWindow *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICWindow;
  v5 = -[ICWindow initWithWindowScene:](&v8, sel_initWithWindowScene_, a3);
  v6 = v5;
  if (v5)
    -[ICWindow setBehavior:](v5, "setBehavior:", a4);
  return v6;
}

- (void)setBehavior:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_behavior = a3;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICWindow setTintColor:](self, "setTintColor:", v4);

      -[ICWindow traitOverrides](self, "traitOverrides");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUserInterfaceStyle:", 2);

      -[ICWindow traitOverrides](self, "traitOverrides");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNSIntegerValue:forTrait:", 1, objc_opt_class());
      goto LABEL_6;
    }
    if (a3)
      return;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICWindow setTintColor:](self, "setTintColor:");
LABEL_6:

}

- (UIViewController)ic_topmostPresentedViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[ICWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = v5;

      objc_msgSend(v6, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v6;
    }
    while (v5);
  }
  else
  {
    v6 = v3;
  }
  return (UIViewController *)v6;
}

- (BOOL)accessibilityElementsHidden
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICWindow;
  v2 = -[ICWindow accessibilityElementsHidden](&v4, sel_accessibilityElementsHidden);
  if ((objc_msgSend((id)objc_opt_class(), "_isSecure") & 1) == 0)
    v2 |= objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLocked");
  return v2;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (NSString)windowIdentifier
{
  return self->_windowIdentifier;
}

- (NSString)toolPickerIdentifier
{
  return self->_toolPickerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
  objc_storeStrong((id *)&self->_toolPickerIdentifier, 0);
  objc_storeStrong((id *)&self->_windowIdentifier, 0);
}

@end
