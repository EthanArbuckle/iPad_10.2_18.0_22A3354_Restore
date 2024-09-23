@implementation SKUIMenuPopoverController

- (SKUIMenuPopoverController)initWithMenuTitles:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIMenuPopoverController *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMenuPopoverController initWithMenuTitles:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](self, "initWithMenuTitles:selectedIndex:", v4, -1);

  return v13;
}

- (SKUIMenuPopoverController)initWithMenuTitles:(id)a3 selectedIndex:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIMenuPopoverController *v15;
  SKUIMenuViewController *v16;
  SKUIMenuViewController *menuViewController;
  objc_super v19;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIMenuPopoverController;
  v15 = -[SKUIMenuPopoverController init](&v19, sel_init);
  if (v15)
  {
    v16 = -[SKUIMenuViewController initWithMenuTitles:]([SKUIMenuViewController alloc], "initWithMenuTitles:", v6);
    menuViewController = v15->_menuViewController;
    v15->_menuViewController = v16;

    -[SKUIMenuViewController setDelegate:](v15->_menuViewController, "setDelegate:", v15);
    -[SKUIMenuViewController setIndexOfCheckedTitle:](v15->_menuViewController, "setIndexOfCheckedTitle:", a4);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIMenuPopoverController;
  -[SKUIMenuPopoverController dealloc](&v3, sel_dealloc);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIPopoverController *v5;

  v3 = a3;
  v5 = self->_popoverController;
  -[SKUIMenuPopoverController _destroyPopoverController](self, "_destroyPopoverController");
  -[UIPopoverController dismissPopoverAnimated:](v5, "dismissPopoverAnimated:", v3);

}

- (NSArray)menuTitles
{
  return -[SKUIMenuViewController menuTitles](self->_menuViewController, "menuTitles");
}

- (void)presentFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  double v14;
  UIPopoverController *v15;
  UIPopoverController *popoverController;
  id v17;

  if (!self->_popoverController)
  {
    v6 = a6;
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v17 = a4;
    -[SKUIMenuPopoverController menuTitles](self, "menuTitles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (float)((float)(unint64_t)objc_msgSend(v13, "count") * 45.0);

    -[SKUIMenuViewController setPreferredContentSize:](self->_menuViewController, "setPreferredContentSize:", 320.0, v14);
    v15 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", self->_menuViewController);
    popoverController = self->_popoverController;
    self->_popoverController = v15;

    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    -[UIPopoverController setPopoverContentSize:](self->_popoverController, "setPopoverContentSize:", 320.0, v14);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v17, a5, v6, x, y, width, height);

  }
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  SKUIMenuPopoverDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "menuPopover:didSelectMenuItemAtIndex:", self, a4);

  }
  -[SKUIMenuPopoverController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[SKUIMenuPopoverController _destroyPopoverController](self, "_destroyPopoverController", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "menuPopoverDidCancel:", self);

  }
}

- (void)popoverController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  SKUIMenuPopoverDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "menuPopover:willRepositionToRect:inView:", self, a4, a5);

  }
}

- (void)_destroyPopoverController
{
  SKUIMenuViewController *menuViewController;
  UIPopoverController *popoverController;

  -[SKUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  menuViewController = self->_menuViewController;
  self->_menuViewController = 0;

  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (SKUIMenuPopoverDelegate)delegate
{
  return (SKUIMenuPopoverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithMenuTitles:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMenuTitles:(uint64_t)a3 selectedIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
