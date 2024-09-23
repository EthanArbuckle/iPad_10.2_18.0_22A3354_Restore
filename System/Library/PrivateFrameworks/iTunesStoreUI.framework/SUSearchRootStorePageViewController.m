@implementation SUSearchRootStorePageViewController

- (void)reloadCancelBarButtonItem
{
  SUNavigationItem *v3;
  SUSearchFieldConfiguration *v4;
  NSString *v5;
  SUBarButtonItem *v6;

  v3 = -[SUViewController navigationItem](self, "navigationItem");
  if (objc_msgSend((id)-[SUNavigationItem leftBarButtonItem](v3, "leftBarButtonItem"), "tag") == 1397244748)
  {
    -[SUNavigationItem setLeftBarButtonItem:](v3, "setLeftBarButtonItem:", 0);
  }
  else if (objc_msgSend((id)-[SUNavigationItem rightBarButtonItem](v3, "rightBarButtonItem"), "tag") == 1397244748)
  {
    -[SUNavigationItem setRightBarButtonItem:](v3, "setRightBarButtonItem:", 0);
  }
  v4 = -[SUSearchFieldController searchFieldConfiguration](-[SUStorePageViewController searchFieldController](self, "searchFieldController"), "searchFieldConfiguration");
  if (!v4)
    v4 = (SUSearchFieldConfiguration *)objc_msgSend(-[UIViewController section](self, "section"), "searchFieldConfiguration");
  v5 = -[SUSearchFieldConfiguration cancelString](v4, "cancelString");
  if (-[NSString length](v5, "length"))
  {
    v6 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", v5, 2, 0, sel_cancelTransientViewController_);
    -[SUUIAppearance styleBarButtonItem:](-[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance"), "styleBarButtonItem:", v6);
    -[UIBarItem setTag:](v6, "setTag:", 1397244748);
    if (-[SUSearchFieldConfiguration location](v4, "location") == 1)
      -[SUNavigationItem setRightBarButtonItem:](v3, "setRightBarButtonItem:", v6);
    else
      -[SUNavigationItem setLeftBarButtonItem:](v3, "setLeftBarButtonItem:", v6);

  }
}

- (id)copyArchivableContext
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSearchRootStorePageViewController;
  v2 = -[SUStorePageViewController copyArchivableContext](&v4, sel_copyArchivableContext);
  objc_msgSend(v2, "setType:", 6);
  return v2;
}

- (void)resetNavigationItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSearchRootStorePageViewController;
  -[SUStorePageViewController resetNavigationItem:](&v4, sel_resetNavigationItem_, a3);
  -[SUSearchRootStorePageViewController reloadCancelBarButtonItem](self, "reloadCancelBarButtonItem");
}

- (void)setParentViewController:(id)a3
{
  id v5;
  objc_super v6;

  v5 = -[UIViewController section](self, "section");
  v6.receiver = self;
  v6.super_class = (Class)SUSearchRootStorePageViewController;
  -[SUStorePageViewController setParentViewController:](&v6, sel_setParentViewController_, a3);
  if (v5 != -[UIViewController section](self, "section"))
    -[SUSearchRootStorePageViewController reloadCancelBarButtonItem](self, "reloadCancelBarButtonItem");

}

- (void)setSection:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSearchRootStorePageViewController;
  -[SUStorePageViewController setSection:](&v4, sel_setSection_, a3);
  -[SUSearchRootStorePageViewController reloadCancelBarButtonItem](self, "reloadCancelBarButtonItem");
  -[SUViewController setTitle:](self, "setTitle:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UISearchBar resignFirstResponder](-[SUSearchFieldController searchBar](-[SUStorePageViewController searchFieldController](self, "searchFieldController"), "searchBar"), "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SUSearchRootStorePageViewController;
  -[SUStorePageViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

@end
