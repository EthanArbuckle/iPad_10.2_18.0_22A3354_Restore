@implementation _TVVisualEffectView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_TVVisualEffectsViewDisablementNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_TVVisualEffectView;
  -[_TVVisualEffectView dealloc](&v4, sel_dealloc);
}

- (void)_disablement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend((id)objc_opt_class(), "hostViewDisablements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVVisualEffectView hostView](self, "hostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[_TVVisualEffectView _setDisabled:](self, "_setDisabled:", v7);
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_TVVisualEffectView;
  -[_TVVisualEffectView didMoveToWindow](&v13, sel_didMoveToWindow);
  -[_TVVisualEffectView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVVisualEffectView superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      while (1)
      {
        objc_msgSend((id)objc_opt_class(), "hostViewDisablements");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          break;
        objc_msgSend(v5, "superview");
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
        if (!v8)
          return;
      }
      -[_TVVisualEffectView setHostView:](self, "setHostView:", v5);
      -[_TVVisualEffectView _setDisabled:](self, "_setDisabled:", objc_msgSend(v7, "BOOLValue"));
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__disablement_, CFSTR("_TVVisualEffectsViewDisablementNotification"), v5);

    }
  }
  else
  {
    -[_TVVisualEffectView hostView](self, "hostView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVVisualEffectView hostView](self, "hostView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("_TVVisualEffectsViewDisablementNotification"), v11);

      -[_TVVisualEffectView setHostView:](self, "setHostView:", 0);
    }
  }
}

+ (id)hostViewDisablements
{
  if (hostViewDisablements_onceToken != -1)
    dispatch_once(&hostViewDisablements_onceToken, &__block_literal_global_16);
  return (id)hostViewDisablements_hostViewDisablements;
}

+ (void)addHostView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "hostViewDisablements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], v4);

}

+ (void)removeHostView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "hostViewDisablements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

+ (void)enableForHostView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "hostViewDisablements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "hostViewDisablements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C0], v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("_TVVisualEffectsViewDisablementNotification"), v8);

  }
}

+ (void)disableForHostView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "hostViewDisablements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "hostViewDisablements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("_TVVisualEffectsViewDisablementNotification"), v8);

  }
}

- (UIView)hostView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostView);
}

@end
