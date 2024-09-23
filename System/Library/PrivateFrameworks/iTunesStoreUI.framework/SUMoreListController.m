@implementation SUMoreListController

- (SUMoreListController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUMoreListController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUMoreListController;
  v4 = -[SUMoreListController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__reloadPreviewOverlayVisibility, CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__badgeDidChangeNotification_, CFSTR("SUViewControllerBadgeDidChangeNotification"), 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerBadgeDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SUMoreListController;
  -[SUMoreListController dealloc](&v4, sel_dealloc);
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  -[SUMoreListController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
  v5.receiver = self;
  v5.super_class = (Class)SUMoreListController;
  -[SUMoreListController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, a3);
}

- (int64_t)ITunesStoreUIBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUMoreListController;
  -[UIMoreListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SUMoreListController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    return 30;
  if (SUAllowsLandscapePhone())
    return 26;
  return 2;
}

- (id)tabBarItem
{
  id result;
  void *v4;
  UITabBarItem *v5;

  result = self->_tabBarItem;
  if (!result)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E50]), "initWithTabBarSystemItem:tag:", 0, 0);
    v5 = (UITabBarItem *)objc_alloc_init(MEMORY[0x24BDF6E50]);
    self->_tabBarItem = v5;
    -[UITabBarItem setImage:](v5, "setImage:", objc_msgSend((id)objc_msgSend(v4, "_internalTemplateImage"), "_imageThatSuppressesAccessibilityHairlineThickening"));
    -[UITabBarItem setTitle:](self->_tabBarItem, "setTitle:", objc_msgSend(v4, "_internalTitle"));

    return self->_tabBarItem;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  SUMoreListTableViewCell *v5;
  SUMoreListTableViewCell *v6;
  SUMoreListTableViewCell *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUMoreListController;
  v5 = -[UIMoreListController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = v5;
  if (_UIApplicationUsesLegacyUI())
  {
    v7 = (SUMoreListTableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SUMoreList"));
    if (!v7)
      v7 = -[SUMoreListTableViewCell initWithStyle:reuseIdentifier:]([SUMoreListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("SUMoreList"));
  }
  -[SUMoreListTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
  -[SUMoreListTableViewCell _setBadgeText:](v7, "_setBadgeText:", -[SUMoreListTableViewCell _badgeText](v6, "_badgeText"));
  objc_msgSend((id)-[SUMoreListTableViewCell textLabel](v7, "textLabel"), "setText:", objc_msgSend((id)-[SUMoreListTableViewCell textLabel](v6, "textLabel"), "text"));
  v8 = (void *)-[SUMoreListTableViewCell imageView](v6, "imageView");
  v9 = (void *)-[SUMoreListTableViewCell imageView](v7, "imageView");
  objc_msgSend(v9, "setImage:", objc_msgSend(v8, "image"));
  objc_msgSend(v9, "setHighlightedImage:", objc_msgSend(v8, "highlightedImage"));
  return v7;
}

- (void)_badgeDidChangeNotification:(id)a3
{
  objc_msgSend(-[UIMoreListController table](self, "table", a3), "reloadData");
}

- (void)_reloadPreviewOverlayVisibility
{
  +[SUPreviewOverlayViewController offsetScrollView:forViewController:](SUPreviewOverlayViewController, "offsetScrollView:forViewController:", -[UIMoreListController table](self, "table"), self);
}

@end
