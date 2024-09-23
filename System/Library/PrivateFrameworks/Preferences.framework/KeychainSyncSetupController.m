@implementation KeychainSyncSetupController

- (KeychainSyncSetupController)initWithManager:(id)a3
{
  id v4;
  KeychainSyncSetupController *v5;
  KeychainSyncSetupController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncSetupController;
  v5 = -[PSSetupController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_manager, v4);

  return v6;
}

- (void)showController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  objc_super v10;

  v4 = a3;
  -[KeychainSyncSetupController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPressed);
    objc_msgSend(v4, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(v4, "setDelegate:", WeakRetained);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setRootController:", self);
  v10.receiver = self;
  v10.super_class = (Class)KeychainSyncSetupController;
  -[PSRootController showController:](&v10, sel_showController_, v4);

}

- (void)cancelPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "keychainSyncControllerCancel:", self);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
