@implementation SUSimpleMenuViewController

- (SUSimpleMenuViewController)initWithTitles:(id)a3
{
  SUSimpleMenuViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSimpleMenuViewController;
  v4 = -[SUMenuViewController init](&v6, sel_init);
  if (v4)
    v4->_titles = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSimpleMenuViewController;
  -[SUMenuViewController dealloc](&v3, sel_dealloc);
}

- (void)setCancelButtonTitle:(id)a3
{
  NSString *cancelButtonTitle;
  SUNavigationItem *v6;
  SUNavigationItem *v7;
  SUBarButtonItem *v8;

  cancelButtonTitle = self->_cancelButtonTitle;
  if (cancelButtonTitle != a3)
  {

    self->_cancelButtonTitle = (NSString *)objc_msgSend(a3, "copy");
    v6 = -[SUViewController navigationItem](self, "navigationItem");
    v7 = v6;
    if (self->_cancelButtonTitle)
    {
      v8 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", self->_cancelButtonTitle, 0, self, sel__cancelAction_);
      -[SUUIAppearance styleBarButtonItem:](-[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance"), "styleBarButtonItem:", v8);
      -[SUNavigationItem setLeftBarButtonItem:](v7, "setLeftBarButtonItem:", v8);

    }
    else
    {
      -[SUNavigationItem setLeftBarButtonItem:](v6, "setLeftBarButtonItem:", 0);
    }
  }
}

- (void)setTitles:(id)a3
{
  NSArray *titles;

  titles = self->_titles;
  if (titles != a3)
  {

    self->_titles = (NSArray *)objc_msgSend(a3, "copy");
    -[SUMenuViewController reload](self, "reload");
  }
}

- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3
{
  return 1;
}

- (int64_t)numberOfMenuItems
{
  return -[NSArray count](self->_titles, "count");
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", a3);
}

- (void)reloadContentSizeForViewInPopover
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SUSimpleMenuViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  v5 = (double)-[NSArray count](self->_titles, "count");
  objc_msgSend(-[SUMenuViewController _tableView](self, "_tableView"), "rowHeight");
  -[SUSimpleMenuViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6 * v5);
}

- (void)_cancelAction:(id)a3
{
  if (!-[SUMenuViewController _sendDidCancel](self, "_sendDidCancel", a3))
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSArray)titles
{
  return self->_titles;
}

@end
