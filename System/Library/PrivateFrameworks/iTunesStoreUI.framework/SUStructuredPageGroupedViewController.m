@implementation SUStructuredPageGroupedViewController

- (SUStructuredPageGroupedViewController)init
{
  SUStructuredPageGroupedViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageGroupedViewController;
  v2 = -[SUStructuredPageViewController init](&v4, sel_init);
  if (v2)
  {
    -[SUStructuredPageViewController setDataSourceClass:](v2, "setDataSourceClass:", objc_opt_class());
    -[SUTableViewController setTableViewStyle:](v2, "setTableViewStyle:", 1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageGroupedViewController;
  -[SUStructuredPageViewController dealloc](&v3, sel_dealloc);
}

- (id)itemAtIndexPath:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
}

- (id)newNoItemsOverlayLabel
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageGroupedViewController;
  v2 = -[SUStructuredPageViewController newNoItemsOverlayLabel](&v4, sel_newNoItemsOverlayLabel);
  objc_msgSend(v2, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.298039216, 0.337254902, 0.423529412, 1.0));
  return v2;
}

- (BOOL)openDocumentForItemAtIndexPath:(id)a3 withApplication:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  SUPurchaseManager *v9;
  id v10;
  objc_super v12;

  v7 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = -[SUClientInterface purchaseManager](-[SUViewController clientInterface](self, "clientInterface"), "purchaseManager");
    v10 = -[SUPurchaseManager newPurchaseBatchForItems:offers:](v9, "newPurchaseBatchForItems:offers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8), 0);
    objc_msgSend(v10, "setDocumentTargetIdentifier:", a4);
    LODWORD(v9) = -[SUStructuredPageGroupedViewController _addPurchaseBatch:forIndexPath:](self, "_addPurchaseBatch:forIndexPath:", v10, a3);

    if ((_DWORD)v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)SUStructuredPageGroupedViewController;
      LOBYTE(v7) = -[SUItemTableViewController openDocumentForItemAtIndexPath:withApplication:](&v12, sel_openDocumentForItemAtIndexPath_withApplication_, a3, a4);
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)purchaseItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  SUPurchaseManager *v7;
  id v8;
  objc_super v10;

  v5 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (v5)
  {
    v6 = v5;
    v7 = -[SUClientInterface purchaseManager](-[SUViewController clientInterface](self, "clientInterface"), "purchaseManager");
    v8 = -[SUPurchaseManager newPurchaseBatchForItems:offers:](v7, "newPurchaseBatchForItems:offers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6), 0);
    LODWORD(v7) = -[SUStructuredPageGroupedViewController _addPurchaseBatch:forIndexPath:](self, "_addPurchaseBatch:forIndexPath:", v8, a3);

    if ((_DWORD)v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)SUStructuredPageGroupedViewController;
      LOBYTE(v5) = -[SUItemTableViewController purchaseItemAtIndexPath:](&v10, sel_purchaseItemAtIndexPath_, a3);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)setSkLoading:(BOOL)a3
{
  SULoadingView *loadingView;
  void *v6;
  SULoadingView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUStructuredPageGroupedViewController;
  -[SUStructuredPageViewController setSkLoading:](&v8, sel_setSkLoading_);
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      v6 = (void *)-[SUStructuredPageGroupedViewController view](self, "view");
      v7 = objc_alloc_init(SULoadingView);
      self->_loadingView = v7;
      -[SULoadingView sizeToFit](v7, "sizeToFit");
      objc_msgSend(v6, "addSubview:", self->_loadingView);
      objc_msgSend(v6, "centerSubviewInBounds:", self->_loadingView);
    }
  }
  else
  {
    -[SULoadingView removeFromSuperview](loadingView, "removeFromSuperview");

    self->_loadingView = 0;
  }
}

- (BOOL)_addPurchaseBatch:(id)a3 forIndexPath:(id)a4
{
  SUPurchaseManager *v7;
  BOOL v8;

  v7 = -[SUClientInterface purchaseManager](-[SUViewController clientInterface](self, "clientInterface"), "purchaseManager");
  -[SUPurchaseManager beginUpdates](v7, "beginUpdates");
  if (a3 && -[SUPurchaseManager addPurchaseBatch:](v7, "addPurchaseBatch:", a3))
  {
    -[SUStructuredPageGroupedViewController _performPurchaseAnimationForIndexPath:](self, "_performPurchaseAnimationForIndexPath:", a4);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[SUPurchaseManager endUpdates](v7, "endUpdates");
  return v8;
}

- (void)_performPurchaseAnimationForIndexPath:(id)a3
{
  UITableViewCell *v4;
  UITableViewCell *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v4 = -[UITableView cellForRowAtIndexPath:](-[SUTableViewController tableView](self, "tableView"), "cellForRowAtIndexPath:", a3);
  if (v4)
  {
    v5 = v4;
    v6 = -[UITableViewCell copyPurchaseAnimationView](v4, "copyPurchaseAnimationView");
    if (v6)
    {
      v12 = (id)v6;
      v7 = (void *)-[SUStructuredPageGroupedViewController view](self, "view");
      objc_msgSend(v12, "frame");
      objc_msgSend(v7, "convertRect:fromView:", v5);
      objc_msgSend(v12, "setFrame:");
      objc_msgSend(v7, "addSubview:", v12);
      v8 = -[SUStructuredPageGroupedViewController view](self, "view");
      v9 = -[SUStructuredPageGroupedViewController tabBarController](self, "tabBarController");
      LODWORD(v10) = 1.0;
      LODWORD(v11) = -1.0;
      +[SUPurchaseAnimator performHopAnimationForView:relativeToView:tabBarController:finalAlpha:scale:](SUPurchaseAnimator, "performHopAnimationForView:relativeToView:tabBarController:finalAlpha:scale:", v12, v8, v9, v10, v11);

    }
  }
}

@end
