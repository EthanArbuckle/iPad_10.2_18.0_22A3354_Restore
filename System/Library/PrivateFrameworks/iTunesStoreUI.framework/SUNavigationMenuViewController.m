@implementation SUNavigationMenuViewController

- (SUNavigationMenuViewController)init
{
  return -[SUNavigationMenuViewController initWithNavigationMenu:](self, "initWithNavigationMenu:", 0);
}

- (SUNavigationMenuViewController)initWithNavigationMenu:(id)a3
{
  SUNavigationMenuViewController *v4;
  SUNavigationMenu *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUNavigationMenuViewController;
  v4 = -[SUMenuViewController init](&v7, sel_init);
  if (v4)
  {
    v5 = (SUNavigationMenu *)a3;
    v4->_navigationMenu = v5;
    -[SUMenuViewController setSelectedIndex:](v4, "setSelectedIndex:", -[SUNavigationMenu initialSelectedIndex](v5, "initialSelectedIndex"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenuViewController;
  -[SUMenuViewController dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfMenuItems
{
  return -[NSArray count](-[SUNavigationMenu menuItems](self->_navigationMenu, "menuItems"), "count");
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](-[SUNavigationMenu menuItems](self->_navigationMenu, "menuItems"), "objectAtIndex:", a3), "title");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUUIAppearance *v5;
  SUNavigationItem *v6;
  NSString *v7;
  SUBarButtonItem *v8;
  NSString *v9;
  id v10;
  id v11;
  SUBarButtonItem *v12;
  SUBarButtonItem *v13;
  objc_super v14;

  v3 = a3;
  v5 = -[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance");
  v6 = -[SUViewController navigationItem](self, "navigationItem");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") != 1)
  {
    v7 = -[SUNavigationMenu cancelTitle](self->_navigationMenu, "cancelTitle");
    if (!-[NSString length](v7, "length"))
      v7 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
    v8 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", v7, 0, self, sel__cancelAction_);
    -[SUUIAppearance styleBarButtonItem:](v5, "styleBarButtonItem:", v8);
    -[SUNavigationItem setLeftBarButtonItem:](v6, "setLeftBarButtonItem:", v8);

  }
  v9 = -[SUNavigationMenu openTitle](self->_navigationMenu, "openTitle");
  if (!v9)
    v9 = -[SUNavigationMenu closedTitle](self->_navigationMenu, "closedTitle");
  -[SUViewController setTitle:](self, "setTitle:", v9);
  v10 = -[SUNavigationMenu navigationButtonForLocation:](self->_navigationMenu, "navigationButtonForLocation:", CFSTR("left"));
  v11 = -[SUNavigationMenu navigationButtonForLocation:](self->_navigationMenu, "navigationButtonForLocation:", CFSTR("right"));
  if (v10)
  {
    if (-[SUNavigationItem leftBarButtonItem](v6, "leftBarButtonItem"))
    {
      if (!v11)
        v11 = v10;
      goto LABEL_14;
    }
    v12 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", objc_msgSend(v10, "buttonTitle"), 0, self, sel__protocolButtonAction_);
    -[SUUIAppearance styleBarButtonItem:](v5, "styleBarButtonItem:", v12);
    -[SUNavigationItem setLeftBarButtonItem:](v6, "setLeftBarButtonItem:", v12);

  }
  if (v11)
  {
LABEL_14:
    v13 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", objc_msgSend(v11, "buttonTitle"), 0, self, sel__protocolButtonAction_);
    -[SUUIAppearance styleBarButtonItem:](v5, "styleBarButtonItem:", v13);
    -[SUNavigationItem setRightBarButtonItem:](v6, "setRightBarButtonItem:", v13);

  }
  v14.receiver = self;
  v14.super_class = (Class)SUNavigationMenuViewController;
  -[SUViewController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
}

- (void)_cancelAction:(id)a3
{
  if (!-[SUMenuViewController _sendDidCancel](self, "_sendDidCancel", a3))
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)_protocolButtonAction:(id)a3
{
  uint64_t v5;
  id v6;
  SUNavigationMenu *navigationMenu;
  SUNavigationMenuViewController *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (id)-[SUNavigationItem leftBarButtonItem](-[SUViewController navigationItem](self, "navigationItem"), "leftBarButtonItem");
    navigationMenu = self->_navigationMenu;
    if (v6 != a3)
    {
      v5 = -[SUNavigationMenu navigationButtonForLocation:](navigationMenu, "navigationButtonForLocation:", CFSTR("right"));
      if (v5)
      {
LABEL_6:
        -[SUMenuViewControllerDelegate menuViewController:didTapButton:](self->super._delegate, "menuViewController:didTapButton:", self, v5);
        v8 = self;
        return;
      }
      navigationMenu = self->_navigationMenu;
    }
    v5 = -[SUNavigationMenu navigationButtonForLocation:](navigationMenu, "navigationButtonForLocation:", CFSTR("left"), v5);
    if (!v5)
      return;
    goto LABEL_6;
  }
}

- (SUNavigationMenu)navigationMenu
{
  return self->_navigationMenu;
}

@end
