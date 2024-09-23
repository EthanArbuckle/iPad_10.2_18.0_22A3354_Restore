@implementation SUStructuredPageViewController

- (SUStructuredPageViewController)init
{
  SUStructuredPageViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageViewController;
  v2 = -[SUItemTableViewController init](&v4, sel_init);
  if (v2)
    -[SUStructuredPageViewController setDataSourceClass:](v2, "setDataSourceClass:", objc_opt_class());
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageViewController;
  -[SUItemTableViewController dealloc](&v3, sel_dealloc);
}

- (id)newDataSource
{
  id v3;
  int64_t v4;
  uint64_t v5;

  v3 = objc_alloc_init(self->_dataSourceClass);
  objc_msgSend(v3, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  v4 = -[SUStructuredPage type](self->_structuredPage, "type");
  if (v4 == 2)
    v5 = 2;
  else
    v5 = v4 == 7;
  objc_msgSend(v3, "setStyle:", v5);
  return v3;
}

- (id)newNoItemsOverlayLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0));
  if (-[SUStructuredPage type](self->_structuredPage, "type") == 7)
    objc_msgSend(v3, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("NO_MATCHES"), &stru_24DE83F60, 0));
  return v3;
}

- (id)newTermsAndConditionsFooter
{
  SUTermsAndConditionsView *v3;
  _BOOL8 v4;
  double v5;

  if (-[SUTableDataSource numberOfSections](-[SUTableViewController dataSource](self, "dataSource"), "numberOfSections") < 1)return 0;
  v3 = objc_alloc_init(SUTermsAndConditionsView);
  -[SUTermsAndConditionsView setClientInterface:](v3, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  -[SUTermsAndConditionsView setDelegate:](v3, "setDelegate:", self);
  v4 = -[SUTableDataSource style](-[SUTableViewController dataSource](self, "dataSource"), "style") == 1
    || -[SUStructuredPage shouldHideSignInButton](self->_structuredPage, "shouldHideSignInButton");
  -[SUTermsAndConditionsView setHideAccountButton:](v3, "setHideAccountButton:", v4);
  if ((-[SUTableView isIndexHidden](self->super.super._tableView, "isIndexHidden") & 1) == 0)
  {
    -[SUTableView indexFrame](self->super.super._tableView, "indexFrame");
    -[SUTermsAndConditionsView setRightMargin:](v3, "setRightMargin:", v5);
  }
  -[SUTermsAndConditionsView sizeToFit](v3, "sizeToFit");
  return v3;
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "itemLinks"), "count") != 0;
}

- (CGRect)documentBounds
{
  SUTableView *tableView;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  tableView = self->super.super._tableView;
  if (tableView)
  {
    v3 = *MEMORY[0x24BDBF090];
    v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[SUTableView contentSize](tableView, "contentSize");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v3 = *MEMORY[0x24BDBF070];
    v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v9 = v3;
  v10 = v4;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = (void *)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource", a3, a4), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (objc_msgSend(v6, "itemType") == 4)
  {
    LOBYTE(v7) = -[SUStructuredPageViewController _handleLoadMoreForIndexPath:](self, "_handleLoadMoreForIndexPath:", a3);
  }
  else if (objc_msgSend(v6, "itemType") == 3
         && -[SUTableDataSource style](-[SUTableViewController dataSource](self, "dataSource"), "style") == 1)
  {
    v8 = (void *)objc_msgSend(v6, "itemLinksForType:", 0);
    v7 = objc_msgSend(v8, "count");
    if (v7)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "URL"));
      v10 = -[UIViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", v9);

      LOBYTE(v7) = v10;
    }
  }
  else
  {
    LOBYTE(v7) = -[SUStructuredPageViewController _gotoURLForItem:withURLIndex:](self, "_gotoURLForItem:withURLIndex:", v6, 0);
  }
  return v7;
}

- (BOOL)hasDisplayableContent
{
  return -[SUStructuredPage hasDisplayableContent](self->_structuredPage, "hasDisplayableContent");
}

- (BOOL)loadMoreWithURL:(id)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageViewController;
  if (!-[UIViewController loadMoreWithURL:](&v6, sel_loadMoreWithURL_))
    -[SUStructuredPageViewController _loadMoreWithURL:](self, "_loadMoreWithURL:", a3);
  return 1;
}

- (void)reloadData
{
  SUStructuredPage *v3;
  uint64_t v4;
  SUStructuredPage *v5;
  id v6;
  objc_super v7;

  v3 = -[SUStructuredPageViewController structuredPage](self, "structuredPage");
  -[SUViewController setTitle:changeTabBarItem:](self, "setTitle:changeTabBarItem:", -[SUStructuredPage title](v3, "title"), 0);
  v4 = -[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage");
  if (-[SUViewController isSkLoading](self, "isSkLoading"))
    v5 = 0;
  else
    v5 = v3;
  if ((SUStructuredPage *)v4 != v5)
  {
    v6 = -[SUStructuredPageViewController newDataSource](self, "newDataSource");
    objc_msgSend(v6, "setStructuredPage:", v3);
    -[SUTableViewController setDataSource:](self, "setDataSource:", v6);

  }
  -[SUStructuredPageViewController _reloadNoItemsLabel](self, "_reloadNoItemsLabel");
  -[SUStructuredPageViewController _reloadTermsAndConditions](self, "_reloadTermsAndConditions");
  v7.receiver = self;
  v7.super_class = (Class)SUStructuredPageViewController;
  -[SUItemTableViewController reloadData](&v7, sel_reloadData);
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUStructuredPageViewController.m"), 180, CFSTR("Page must be structured"));
  }
  -[SUStructuredPageViewController setStructuredPage:](self, "setStructuredPage:", a3, a4);
  -[SUStructuredPageViewController reloadData](self, "reloadData");
  -[UIViewController reloadForSectionsWithGroup:](self, "reloadForSectionsWithGroup:", -[SUStructuredPage sectionsGroup](self->_structuredPage, "sectionsGroup"));
}

- (void)setSkLoading:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  UITableView *v6;
  UITableView *v7;
  SUStructuredPageViewController *v8;
  objc_super v9;

  v3 = a3;
  v5 = -[UIViewController isSkLoaded](self, "isSkLoaded");
  v9.receiver = self;
  v9.super_class = (Class)SUStructuredPageViewController;
  -[SUViewController setSkLoading:](&v9, sel_setSkLoading_, v3);
  if (v5 != -[UIViewController isSkLoaded](self, "isSkLoaded"))
  {
    v6 = -[SUTableViewController tableView](self, "tableView");
    v7 = v6;
    if (v3)
      v8 = 0;
    else
      v8 = self;
    -[UITableView setDataSource:](v6, "setDataSource:", v8);
    -[UITableView setDelegate:](v7, "setDelegate:", v8);
    -[SUStructuredPageViewController reloadData](self, "reloadData");
  }
}

- (id)storePageProtocol
{
  return -[SUStructuredPage protocol](self->_structuredPage, "protocol");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUStorePageProtocol *v5;
  NSNumber *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v5 = -[SUStructuredPage protocol](self->_structuredPage, "protocol");
  v6 = -[SUStorePageProtocol focusedItemIdentifier](v5, "focusedItemIdentifier");
  if (v6)
  {
    v7 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItemWithIdentifier:", -[NSNumber itemIdentifierValue](v6, "itemIdentifierValue"));
    if (v7)
      -[SUTableViewController scrollToRowAtIndexPath:atScrollPosition:animated:](self, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 1, 0);
    -[SUStorePageProtocol setFocusedItemIdentifier:](v5, "setFocusedItemIdentifier:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)SUStructuredPageViewController;
  -[SUTableViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUStructuredPage *structuredPage;
  objc_super v6;

  v3 = a3;
  structuredPage = self->_structuredPage;
  if (structuredPage)
    -[UIViewController reloadForSectionsWithGroup:](self, "reloadForSectionsWithGroup:", -[SUStructuredPage sectionsGroup](structuredPage, "sectionsGroup"));
  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageViewController;
  -[SUTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)setDataSourceClass:(Class)a3
{
  Class dataSourceClass;

  dataSourceClass = self->_dataSourceClass;
  if (dataSourceClass != a3)
  {

    self->_dataSourceClass = a3;
  }
}

- (void)setStructuredPage:(id)a3
{
  SUStructuredPage *structuredPage;

  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    self->_structuredPage = (SUStructuredPage *)a3;
    -[SUViewController storePageProtocolDidChange](self, "storePageProtocolDidChange");
  }
}

- (void)bannerCell:(id)a3 tappedButtonAtIndex:(int64_t)a4
{
  NSIndexPath *v6;

  v6 = -[UITableView indexPathForCell:](-[SUTableViewController tableView](self, "tableView"), "indexPathForCell:", a3);
  if (v6)
    -[SUStructuredPageViewController _gotoURLForItem:withURLIndex:](self, "_gotoURLForItem:withURLIndex:", objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", v6), a4);
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  UITableView *v10;
  objc_super v11;

  v7 = (id)-[SUTableDataSource activeLoadMoreItem](-[SUTableViewController dataSource](self, "dataSource"), "activeLoadMoreItem");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItem:", v7);
    -[SUTableDataSource setActiveLoadMoreItem:](-[SUTableViewController dataSource](self, "dataSource"), "setActiveLoadMoreItem:", 0);
    if (v9)
    {
      v10 = -[SUTableViewController tableView](self, "tableView");
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v10, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v9, 0), 5);
    }
    -[SUViewController presentDialogForError:pendUntilVisible:](self, "presentDialogForError:pendUntilVisible:", a4, 1);

  }
  -[SUStructuredPageViewController setSkLoading:](self, "setSkLoading:", 0);
  v11.receiver = self;
  v11.super_class = (Class)SUStructuredPageViewController;
  -[SUViewController operation:failedWithError:](&v11, sel_operation_failedWithError_, a3, a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  -[SUStructuredPageViewController setSkLoading:](self, "setSkLoading:", 0);
  if (-[SUTableDataSource activeLoadMoreItem](-[SUTableViewController dataSource](self, "dataSource"), "activeLoadMoreItem"))
  {
    -[SUStructuredPageViewController _loadMoreOperation:finishedWithOutput:](self, "_loadMoreOperation:finishedWithOutput:", a3, a4);
  }
}

- (BOOL)_handleLoadMoreForIndexPath:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  -[SUTableDataSource setActiveLoadMoreItem:](-[SUTableViewController dataSource](self, "dataSource"), "setActiveLoadMoreItem:", v5);
  -[UITableView deselectRowAtIndexPath:animated:](-[SUTableViewController tableView](self, "tableView"), "deselectRowAtIndexPath:animated:", a3, 1);
  -[SUStructuredPageViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadLoadMoreCellAtIndexPath_, a3, 0.25);
  if (objc_msgSend(v5, "itemType") == 4)
  {
    v6 = (void *)objc_msgSend(v5, "itemLinksForType:", 0);
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "URL");
      if (objc_msgSend(v5, "BOOLValueForProperty:", CFSTR("reload-in-place")))
        -[SUStructuredPageViewController loadMoreWithURL:](self, "loadMoreWithURL:", v7);
      else
        -[SUStructuredPageViewController _loadMoreWithURL:](self, "_loadMoreWithURL:", v7);
    }
  }
  return 1;
}

- (BOOL)_gotoURLForItem:(id)a3 withURLIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  SUAccountViewController *v9;
  char v10;
  UITableView *v11;
  void *v12;

  v6 = (void *)objc_msgSend(a3, "itemLinks");
  if (objc_msgSend(v6, "count") <= (unint64_t)a4)
    return 0;
  v7 = (void *)objc_msgSend(v6, "objectAtIndex:", a4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(v7, "URL"));
  if (objc_msgSend(v7, "linkType") == 1)
  {
    v9 = objc_alloc_init(SUAccountViewController);
    -[SUViewController setClientInterface:](v9, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    -[SUStorePageViewController setURLRequestProperties:](v9, "setURLRequestProperties:", v8);
    v10 = +[SUClientDispatch enterAccountFlowWithViewController:animated:](SUClientDispatch, "enterAccountFlowWithViewController:animated:", v9, 1);

  }
  else if (objc_msgSend(v7, "linkTarget") == 1)
  {
    v11 = -[SUTableViewController tableView](self, "tableView");
    -[UITableView deselectRowAtIndexPath:animated:](v11, "deselectRowAtIndexPath:animated:", -[UITableView indexPathForSelectedRow](v11, "indexPathForSelectedRow"), 1);
    v10 = SUOpenExternalURL(objc_msgSend(v8, "URL"), -[SUViewController clientInterface](self, "clientInterface"));
  }
  else
  {
    v12 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", -[UIViewController section](self, "section"));
    objc_msgSend(v12, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    objc_msgSend(v12, "setURLRequestProperties:", v8);
    v10 = -[UIViewController pushStorePage:withTarget:animated:](self, "pushStorePage:withTarget:animated:", v12, objc_msgSend(v7, "linkTarget"), 1);

  }
  return v10;
}

- (void)_loadMoreOperation:(id)a3 finishedWithOutput:(id)a4
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UITableView *v17;
  void *v18;
  void *v19;
  int *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (id)-[SUTableDataSource activeLoadMoreItem](-[SUTableViewController dataSource](self, "dataSource"), "activeLoadMoreItem");
  v9 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItem:", v8);
  if (v9)
  {
    v10 = v9;
    -[SUTableDataSource setActiveLoadMoreItem:](-[SUTableViewController dataSource](self, "dataSource"), "setActiveLoadMoreItem:", 0);
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadLoadMoreCellAtIndexPath_, v10);
    if (objc_msgSend((id)objc_msgSend(a3, "dataProvider"), "outputType"))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (v13)
      {
        v22 = 138412290;
        v23 = objc_opt_class();
        LODWORD(v21) = 12;
        v20 = &v22;
        v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v22, v21);
          free(v15);
          v20 = (int *)v16;
          SSFileLog();
        }
      }
      v17 = -[SUTableViewController tableView](self, "tableView", v20);
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v17, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v10, 0), 5);
      -[SUViewController presentDialogForError:pendUntilVisible:](self, "presentDialogForError:pendUntilVisible:", SSError(), 1);
    }
    else
    {
      v18 = (void *)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList");
      if (objc_msgSend(v8, "BOOLValueForProperty:", CFSTR("reload-in-place")))
      {
        -[SUStructuredPageViewController reloadWithStorePage:forURL:](self, "reloadWithStorePage:forURL:", a4, objc_msgSend((id)objc_msgSend(a3, "response"), "URL"));
      }
      else
      {
        v19 = (void *)objc_msgSend((id)objc_msgSend(a4, "itemList"), "copyItems");
        objc_msgSend(v18, "replaceItemAtIndexPath:withItems:", v10, v19);
        -[SUStructuredPageViewController reloadData](self, "reloadData");

      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUStructuredPageViewController.m"), 349, CFSTR("Load more operation finished without an index path"));
    -[SUTableDataSource setActiveLoadMoreItem:](-[SUTableViewController dataSource](self, "dataSource"), "setActiveLoadMoreItem:", 0);
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadLoadMoreCellAtIndexPath_, 0);
  }

}

- (void)_loadMoreWithURL:(id)a3
{
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v6, "setDataProvider:", +[ISDataProvider provider](SUStorePageDataProvider, "provider"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", a3);
  objc_msgSend(v6, "setRequestProperties:", v5);

  -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v6, 1);
}

- (void)_reloadLoadMoreCellAtIndexPath:(id)a3
{
  UITableView *v5;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, a3);
  v5 = -[SUTableViewController tableView](self, "tableView");
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v5, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0), 5);
}

- (void)_reloadNoItemsLabel
{
  void *v3;
  UILabel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = (void *)-[SUStructuredPageViewController view](self, "view");
  if (-[UIViewController isSkLoaded](self, "isSkLoaded")
    || objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "numberOfItems") >= 1)
  {
    -[UILabel removeFromSuperview](self->_noItemsLabel, "removeFromSuperview");

    self->_noItemsLabel = 0;
  }
  else if (!self->_noItemsLabel)
  {
    v11 = -[SUStructuredPageViewController newNoItemsOverlayLabel](self, "newNoItemsOverlayLabel");
    if (objc_msgSend((id)objc_msgSend(v11, "text"), "length"))
    {
      v4 = (UILabel *)v11;
      self->_noItemsLabel = v4;
      -[UILabel setAutoresizingMask:](v4, "setAutoresizingMask:", 43);
      -[UILabel sizeToFit](self->_noItemsLabel, "sizeToFit");
      objc_msgSend(v3, "addSubview:", self->_noItemsLabel);
      objc_msgSend(v3, "bounds");
      v6 = v5;
      v8 = v7;
      -[UILabel frame](self->_noItemsLabel, "frame");
      -[UILabel setFrame:](self->_noItemsLabel, "setFrame:", floor((v6 - v9) * 0.5), floor((v8 - v10) * 0.5));
    }

  }
}

- (void)_reloadTermsAndConditions
{
  UITableView *v3;
  UITableView *v4;
  id v5;

  v3 = -[SUTableViewController tableView](self, "tableView");
  if (v3)
  {
    v4 = v3;
    if (-[UIViewController isSkLoaded](self, "isSkLoaded"))
    {
      -[UITableView setTableFooterView:](v4, "setTableFooterView:", 0);
    }
    else
    {
      v5 = -[SUStructuredPageViewController newTermsAndConditionsFooter](self, "newTermsAndConditionsFooter");
      -[UITableView setTableFooterView:](v4, "setTableFooterView:", v5);

    }
  }
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (SUStructuredPage)structuredPage
{
  return self->_structuredPage;
}

@end
