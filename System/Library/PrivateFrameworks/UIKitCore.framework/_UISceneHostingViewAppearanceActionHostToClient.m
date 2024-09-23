@implementation _UISceneHostingViewAppearanceActionHostToClient

+ (id)_actionForActionType:(uint64_t)a1
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_self();
  v4 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 0);

  v6 = (void *)objc_msgSend([v3 alloc], "initWithInfo:responder:", v4, 0);
  return v6;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[_UISceneHostingViewAppearanceActionHostToClient info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  switch(v6)
  {
    case 2:
      objc_msgSend(a3, "hostViewDidDisappear");
      break;
    case 1:
      objc_msgSend(a3, "hostViewWillDisappear");
      break;
    case 0:
      objc_msgSend(a3, "hostViewWillAppear");
      break;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  -[_UISceneHostingViewAppearanceActionHostToClient info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = 0;
  if (v5 <= 2)
    v6 = off_1E16EAF10[v5];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@;%p> Action type: %@"), v9, self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
