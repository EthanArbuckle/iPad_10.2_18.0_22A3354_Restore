@implementation TUIButtonBarAppearanceDelegate

- (TUIButtonBarAppearanceDelegate)initWithSystemInputAssistantView:(id)a3
{
  id v4;
  TUIButtonBarAppearanceDelegate *v5;
  TUIButtonBarAppearanceDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIButtonBarAppearanceDelegate;
  v5 = -[TUIButtonBarAppearanceDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_systemInputAssistantView, v4);

  return v6;
}

- (UIColor)tintColor
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TUIButtonBarAppearanceDelegate systemInputAssistantView](self, "systemInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableButtonTintColor");

  if (v5)
  {
    -[TUIButtonBarAppearanceDelegate systemInputAssistantView](self, "systemInputAssistantView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftButtonBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return (UIColor *)v9;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[TUIButtonBarAppearanceDelegate systemInputAssistantView](self, "systemInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "barButtonImageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIButtonBarAppearanceDelegate systemInputAssistantView](self, "systemInputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUIButtonBarAppearanceDelegate systemInputAssistantView](self, "systemInputAssistantView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithLocale:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return (UIImageSymbolConfiguration *)v5;
}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  return (TUISystemInputAssistantView *)objc_loadWeakRetained((id *)&self->_systemInputAssistantView);
}

- (void)setSystemInputAssistantView:(id)a3
{
  objc_storeWeak((id *)&self->_systemInputAssistantView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemInputAssistantView);
}

@end
