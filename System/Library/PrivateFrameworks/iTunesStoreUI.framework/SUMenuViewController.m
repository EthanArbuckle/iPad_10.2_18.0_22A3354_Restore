@implementation SUMenuViewController

- (SUMenuViewController)init
{
  SUMenuViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  result = -[SUViewController init](&v3, sel_init);
  if (result)
    result->_selectedIndex = -1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3
{
  return 1;
}

- (int64_t)numberOfMenuItems
{
  return 0;
}

- (void)performActionForMenuItemAtIndex:(int64_t)a3
{
  SUMenuViewController *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = self;
    -[SUMenuViewControllerDelegate menuViewController:didSelectItemAtIndex:](self->_delegate, "menuViewController:didSelectItemAtIndex:", self, a3);
  }
  else
  {
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
  }
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[SUMenuViewController reload](self, "reload");
  }
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)loadView
{
  -[SUMenuViewController setView:](self, "setView:", -[SUMenuViewController _tableView](self, "_tableView"));
  -[SUMenuViewController reload](self, "reload");
}

- (CGSize)maximumViewSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[SUMenuViewController view](self, "view");
  -[UITableView rowHeight](self->_tableView, "rowHeight");
  v4 = v3 * 15.0;
  v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)minimumViewSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[SUMenuViewController numberOfMenuItems](self, "numberOfMenuItems");
  if (v3 <= 5)
    v4 = 5;
  else
    v4 = v3;
  -[SUMenuViewController view](self, "view");
  -[UITableView rowHeight](self->_tableView, "rowHeight");
  v6 = v5 * (double)v4;
  v7 = 0.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)reload
{
  objc_super v3;

  -[UITableView reloadData](self->_tableView, "reloadData");
  -[SUViewController reloadContentSizeForViewInPopover](self, "reloadContentSizeForViewInPopover");
  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  -[SUViewController reload](&v3, sel_reload);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UITableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
  v5.receiver = self;
  v5.super_class = (Class)SUMenuViewController;
  -[SUViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[SUMenuViewController setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(a4, "row", a3));
  -[SUMenuViewController performActionForMenuItemAtIndex:](self, "performActionForMenuItemAtIndex:", objc_msgSend(a4, "row"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v6 = objc_msgSend(a4, "row");
  v7 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("i"));
  if (!v7)
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("i"));
  if (v6 == self->_selectedIndex)
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v7, "setAccessoryType:", v8);
  v9 = (void *)objc_msgSend(v7, "textLabel");
  objc_msgSend(v9, "setText:", -[SUMenuViewController titleOfMenuItemAtIndex:](self, "titleOfMenuItemAtIndex:", v6));
  v10 = -[SUMenuViewController isMenuItemEnabledAtIndex:](self, "isMenuItemEnabledAtIndex:", v6);
  objc_msgSend(v9, "setEnabled:", v10);
  objc_msgSend(v7, "setUserInteractionEnabled:", v10);
  return v7;
}

- (BOOL)_sendDidCancel
{
  char v3;
  SUMenuViewController *v4;

  v3 = objc_opt_respondsToSelector();
  if ((v3 & 1) != 0)
  {
    v4 = self;
    -[SUMenuViewControllerDelegate menuViewControllerDidCancel:](self->_delegate, "menuViewControllerDidCancel:", self);
  }
  return v3 & 1;
}

- (id)_tableView
{
  id result;
  UITableView *v4;

  result = self->_tableView;
  if (!result)
  {
    v4 = (UITableView *)objc_alloc_init(MEMORY[0x24BDF6E58]);
    self->_tableView = v4;
    -[UITableView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    return self->_tableView;
  }
  return result;
}

- (SUMenuViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUMenuViewControllerDelegate *)a3;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

@end
