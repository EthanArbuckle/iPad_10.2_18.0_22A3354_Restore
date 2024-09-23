@implementation SKUIToolbarController

- (SKUIToolbarController)initWithToolbarViewElement:(id)a3
{
  id v5;
  SKUIToolbarController *v6;
  SKUIToolbarController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIToolbarController initWithToolbarViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIToolbarController;
  v6 = -[SKUIToolbarController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewElement, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIToolbarButtonsController disconnectAllButtons](self->_buttonsController, "disconnectAllButtons");
  v3.receiver = self;
  v3.super_class = (Class)SKUIToolbarController;
  -[SKUIToolbarController dealloc](&v3, sel_dealloc);
}

- (void)updateToolbarForNavigationController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SKUIToolbarViewElement *viewElement;
  NSArray *v8;
  NSArray *toolbarItems;
  NSArray *v10;
  _QWORD v11[5];
  NSArray *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  viewElement = self->_viewElement;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SKUIToolbarController_updateToolbarForNavigationController___block_invoke;
  v11[3] = &unk_1E73A2180;
  v11[4] = self;
  v8 = (NSArray *)v6;
  v12 = v8;
  -[SKUIViewElement enumerateChildrenUsingBlock:](viewElement, "enumerateChildrenUsingBlock:", v11);
  toolbarItems = self->_toolbarItems;
  self->_toolbarItems = v8;
  v10 = v8;

  objc_msgSend(v5, "setToolbarHidden:", -[NSArray count](v10, "count") == 0);
}

void __62__SKUIToolbarController_updateToolbarForNavigationController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (SKUIIKViewElementTypeIsButton(objc_msgSend(v4, "elementType")))
  {
    objc_msgSend(*(id *)(a1 + 32), "_barButtonItemWithElement:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
  else
  {
    NSLog(CFSTR("Unexpected element type in toolbar."));
  }

}

- (void)detachFromNavigationController:(id)a3
{
  SKUIToolbarButtonsController *buttonsController;
  SKUIToolbarButtonsController *v5;
  NSArray *toolbarItems;
  id v7;

  buttonsController = self->_buttonsController;
  v7 = a3;
  -[SKUIToolbarButtonsController disconnectAllButtons](buttonsController, "disconnectAllButtons");
  v5 = self->_buttonsController;
  self->_buttonsController = 0;

  toolbarItems = self->_toolbarItems;
  self->_toolbarItems = 0;

  objc_msgSend(v7, "setToolbarHidden:", 1);
}

- (BOOL)toolbarButtonsController:(id)a3 shouldDispatchEventForButton:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  char v11;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v7 = WeakRetained,
        v8 = objc_loadWeakRetained((id *)&self->_delegate),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_msgSend(v10, "toolbarController:shouldDispatchEventForButton:", self, v5);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)_barButtonItemWithElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (SKUIIKViewElementTypeIsButton(objc_msgSend(v4, "elementType")))
  {
    -[SKUIToolbarController _barButtonItemWithButtonElement:](self, "_barButtonItemWithButtonElement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_barButtonItemWithButtonElement:(id)a3
{
  id v4;
  SKUIToolbarButtonsController *buttonsController;
  SKUIToolbarButtonsController *v6;
  SKUIToolbarButtonsController *v7;
  void *v8;

  v4 = a3;
  buttonsController = self->_buttonsController;
  if (!buttonsController)
  {
    v6 = -[SKUIToolbarButtonsController initWithToolbarViewElement:]([SKUIToolbarButtonsController alloc], "initWithToolbarViewElement:", self->_viewElement);
    v7 = self->_buttonsController;
    self->_buttonsController = v6;

    buttonsController = self->_buttonsController;
  }
  -[SKUIToolbarButtonsController addButtonItemWithButtonViewElement:](buttonsController, "addButtonItemWithButtonViewElement:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SKUIToolbarViewElement)toolbarViewElement
{
  return self->_viewElement;
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (SKUIToolbarControllerDelegate)delegate
{
  return (SKUIToolbarControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
}

- (void)initWithToolbarViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToolbarController initWithToolbarViewElement:]";
}

@end
