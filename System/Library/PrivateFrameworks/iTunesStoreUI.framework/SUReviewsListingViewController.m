@implementation SUReviewsListingViewController

- (void)dealloc
{
  objc_super v3;

  -[SUGradientButton removeTarget:action:forControlEvents:](-[SUButtonAccessoryView button](self->_accessoryView, "button"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_accessoryView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUReviewsListingViewController;
  -[SUStructuredPageViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  UITableView *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUReviewsListingViewController;
  -[SUTableViewController loadView](&v4, sel_loadView);
  v3 = -[SUTableViewController tableView](self, "tableView");
  -[UITableView setBackgroundColor:](v3, "setBackgroundColor:", SUGetReviewListOddRowColor());
  -[UITableView setTopExtensionViewColor:](v3, "setTopExtensionViewColor:", SUGetReviewListEvenRowColor());
  -[SUReviewsListingViewController _reloadHeaderView](self, "_reloadHeaderView");
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUReviewsListingViewController;
  -[SUStructuredPageViewController reloadData](&v3, sel_reloadData);
  -[SUReviewsListingViewController _reloadHeaderView](self, "_reloadHeaderView");
}

- (void)reloadForChangedRowCount:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  if ((a3 & 1) != 0)
    v5 = SUGetReviewListOddRowColor();
  else
    v5 = SUGetReviewListEvenRowColor();
  -[UITableView setBackgroundColor:](-[SUTableViewController tableView](self, "tableView"), "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUReviewsListingViewController;
  -[SUTableViewController reloadForChangedRowCount:](&v6, sel_reloadForChangedRowCount_, a3);
}

- (id)newTermsAndConditionsFooter
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUReviewsListingViewController;
  v2 = -[SUStructuredPageViewController newTermsAndConditionsFooter](&v4, sel_newTermsAndConditionsFooter);
  objc_msgSend(v2, "setStyle:", 2);
  return v2;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUReviewsListingViewController;
  -[SUTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v8, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3);
  if ((objc_msgSend(a5, "row") & 1) != 0)
    v7 = SUGetReviewListOddRowColor();
  else
    v7 = SUGetReviewListEvenRowColor();
  objc_msgSend(a4, "setBackgroundColor:", v7);
  objc_msgSend(a4, "setBottomBorderColor:", SUGetReviewListBorderColor());
  objc_msgSend(a4, "setTopBorderColor:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUGradientButton setSelected:](-[SUButtonAccessoryView button](self->_accessoryView, "button"), "setSelected:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUReviewsListingViewController;
  -[SUStructuredPageViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)_writeAReview:(id)a3
{
  void *v4;
  SUClientInterface *v5;
  SUComposeReviewViewController *v6;
  SUComposeReviewViewController *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem", a3), "itemLinksForType:", 3), "objectAtIndex:", 0);
  v5 = -[SUViewController clientInterface](self, "clientInterface");
  v6 = -[SUViewControllerFactory newComposeReviewViewControllerWithCompositionURL:](-[SUClientInterface viewControllerFactory](v5, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", objc_msgSend(v4, "URL"));
  if (!v6)
    v6 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", objc_msgSend(v4, "URL"));
  v7 = v6;
  -[SUViewController setClientInterface:](v6, "setClientInterface:", v5);
  +[SUClientDispatch composeReviewWithViewController:animated:](SUClientDispatch, "composeReviewWithViewController:animated:", v7, 1);

}

- (id)_accessoryView
{
  id result;

  result = self->_accessoryView;
  if (!result)
  {
    self->_accessoryView = -[SUButtonAccessoryView initWithDefaultSize]([SUButtonAccessoryView alloc], "initWithDefaultSize");
    -[SUButtonAccessoryView setBackgroundColor:](self->_accessoryView, "setBackgroundColor:", SUGetReviewListEvenRowColor());
    -[SUGradientButton addTarget:action:forControlEvents:](-[SUButtonAccessoryView button](self->_accessoryView, "button"), "addTarget:action:forControlEvents:", self, sel__writeAReview_, 64);
    return self->_accessoryView;
  }
  return result;
}

- (BOOL)_canWriteReview
{
  return objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem"), "itemLinksForType:", 3) != 0;
}

- (id)_headerItem
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](self->super.super.super._dataSource, "structuredPage"), "itemList"), "copyItems");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
      if (objc_msgSend(v7, "itemType") == 10)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return v7;
}

- (void)_reloadHeaderView
{
  id v3;
  void *v4;

  if (-[SUReviewsListingViewController _canWriteReview](self, "_canWriteReview"))
  {
    v3 = -[SUReviewsListingViewController _accessoryView](self, "_accessoryView");
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem"), "itemLinksForType:", 3), "objectAtIndex:", 0), "title");
    if (!objc_msgSend(v4, "length"))
      v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("WRITE_A_REVIEW"), &stru_24DE83F60, 0);
    objc_msgSend((id)objc_msgSend(v3, "button"), "setTitle:forState:", v4, 0);
  }
  else
  {
    v3 = 0;
  }
  -[UITableView setTableHeaderView:](-[SUTableViewController tableView](self, "tableView"), "setTableHeaderView:", v3);
}

@end
