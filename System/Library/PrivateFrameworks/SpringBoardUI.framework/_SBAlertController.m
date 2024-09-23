@implementation _SBAlertController

- (_SBAlertController)initWithStyleProvider:(id)a3
{
  id v5;
  _SBAlertController *v6;
  _SBAlertController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBAlertController;
  v6 = -[_SBAlertController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_styleProvider, a3);

  return v7;
}

- (void)setHiddenOnClonedDisplay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  -[_SBAlertController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disableUpdateMask");

  if (v3)
    v8 = 16;
  else
    v8 = 0;
  v9 = v7 & 0xFFFFFFEF | v8;
  -[_SBAlertController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisableUpdateMask:", v9);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SBAlertController;
  -[_SBAlertController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "alertControllerDidDisappear:", self);
  -[_SBAlertController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didDismissMiniAlert");

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_styleProvider
{
  return self->_styleProvider;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBAlertController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBAlertController title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("title"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBAlertController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBAlertItem)alertItem
{
  return (SBAlertItem *)objc_loadWeakRetained((id *)&self->_alertItem);
}

- (void)setAlertItem:(id)a3
{
  objc_storeWeak((id *)&self->_alertItem, a3);
}

- (_SBAlertControllerDelegate)alertControllerDelegate
{
  return (_SBAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_alertControllerDelegate);
}

- (void)setAlertControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alertControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_alertControllerDelegate);
  objc_destroyWeak((id *)&self->_alertItem);
}

@end
