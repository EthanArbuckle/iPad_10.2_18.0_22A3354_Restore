@implementation SKUINavigationBarMenusController

- (SKUINavigationBarMenusController)initWithMenuViewElements:(id)a3
{
  id v4;
  SKUINavigationBarMenusController *v5;
  uint64_t v6;
  NSArray *menuViewElements;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationBarMenusController initWithMenuViewElements:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationBarMenusController;
  v5 = -[SKUINavigationBarMenusController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    menuViewElements = v5->_menuViewElements;
    v5->_menuViewElements = (NSArray *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUINavigationBarMenusView setButtonTarget:action:](self->_menusView, "setButtonTarget:action:", 0, 0);
  -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUINavigationBarMenusController;
  -[SKUINavigationBarSectionController dealloc](&v3, sel_dealloc);
}

- (void)reloadSectionViews
{
  void *v3;
  double v4;
  uint64_t v5;
  SKUINavigationBarMenusView *menusView;
  NSArray *menuViewElements;
  void *v8;
  objc_super v9;

  -[SKUINavigationBarSectionController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumNavigationBarWidth");
  v5 = (uint64_t)v4;

  menusView = self->_menusView;
  menuViewElements = self->_menuViewElements;
  -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationBarMenusView reloadWithMenus:width:context:](menusView, "reloadWithMenus:width:context:", menuViewElements, v5, v8);

  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationBarMenusController;
  -[SKUINavigationBarSectionController reloadSectionViews](&v9, sel_reloadSectionViews);
}

- (id)view
{
  SKUINavigationBarMenusView *menusView;
  SKUINavigationBarMenusView *v4;
  SKUINavigationBarMenusView *v5;
  SKUINavigationBarMenusView *v6;
  void *v7;

  menusView = self->_menusView;
  if (!menusView)
  {
    v4 = objc_alloc_init(SKUINavigationBarMenusView);
    v5 = self->_menusView;
    self->_menusView = v4;

    v6 = self->_menusView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUINavigationBarMenusView setButtonTarget:action:](self->_menusView, "setButtonTarget:action:", self, sel__menuButtonAction_);
    -[SKUINavigationBarMenusView setContentInset:](self->_menusView, "setContentInset:", 1.0, 20.0, 0.0, 20.0);
    menusView = self->_menusView;
  }
  return menusView;
}

- (void)willAppearInNavigationBar
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  objc_super v7;

  -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationBarSectionController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumNavigationBarWidth");
  v6 = (uint64_t)v5;

  +[SKUINavigationBarMenusView requestLayoutWithMenus:width:context:](SKUINavigationBarMenusView, "requestLayoutWithMenus:width:context:", self->_menuViewElements, v6, v3);
  v7.receiver = self;
  v7.super_class = (Class)SKUINavigationBarMenusController;
  -[SKUINavigationBarSectionController willAppearInNavigationBar](&v7, sel_willAppearInNavigationBar);

}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  id v6;

  -[SKUINavigationBarMenusController _menuViewElementForView:](self, "_menuViewElementForView:", self->_focusedMenuButton);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchEventOfType:forItemAtIndex:", 2, a4);
  -[SKUINavigationBarMenusController _destroyPopover](self, "_destroyPopover");

}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[UIControl frame](self->_focusedMenuButton, "frame", a3, a4, a5);
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)_menuButtonAction:(id)a3
{
  SKUIMenuPopoverController *popoverController;
  UIControl *focusedMenuButton;
  SKUIMenuPopoverController *v7;
  void *v8;
  SKUIMenuPopoverController *v9;
  void *v10;
  SKUIMenuPopoverController *v11;
  SKUIMenuPopoverController *v12;
  SKUIMenuPopoverController *v13;
  id v14;

  v14 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    -[SKUIMenuPopoverController setDelegate:](popoverController, "setDelegate:", 0);
    -[SKUIMenuPopoverController dismissAnimated:](self->_popoverController, "dismissAnimated:", 1);
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    v7 = self->_popoverController;
    self->_popoverController = 0;

  }
  -[SKUINavigationBarMenusController _menuViewElementForView:](self, "_menuViewElementForView:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    v9 = [SKUIMenuPopoverController alloc];
    objc_msgSend(v8, "menuItemTitles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](v9, "initWithMenuTitles:selectedIndex:", v10, objc_msgSend(v8, "selectedItemIndex"));
    v12 = self->_popoverController;
    self->_popoverController = v11;

    -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    v13 = self->_popoverController;
    -[UIControl frame](self->_focusedMenuButton, "frame");
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v13, "presentFromRect:inView:permittedArrowDirections:animated:", self->_menusView, 15, 1);
  }

}

- (void)_destroyPopover
{
  UIControl *focusedMenuButton;
  SKUIMenuPopoverController *popoverController;

  -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (id)_menuViewElementForView:(id)a3
{
  SKUINavigationBarMenusView *menusView;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  menusView = self->_menusView;
  v5 = a3;
  -[SKUIViewReuseView allExistingViews](menusView, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_menuViewElements, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewElements, 0);
  objc_storeStrong((id *)&self->_menusView, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
}

- (void)initWithMenuViewElements:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationBarMenusController initWithMenuViewElements:]";
}

@end
