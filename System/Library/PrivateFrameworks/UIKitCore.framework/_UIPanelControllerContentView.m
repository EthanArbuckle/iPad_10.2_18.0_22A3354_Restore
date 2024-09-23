@implementation _UIPanelControllerContentView

- (void)_setPanelController:(id)a3
{
  objc_storeWeak((id *)&self->__panelController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__panelController);
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPanelControllerContentView;
  -[UIView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__panelController);
    objc_msgSend(v4, "appendFormat:", CFSTR(" panelController=%p"), WeakRetained);

  }
  return v4;
}

- (UIPanelController)_panelController
{
  return (UIPanelController *)objc_loadWeakRetained((id *)&self->__panelController);
}

@end
