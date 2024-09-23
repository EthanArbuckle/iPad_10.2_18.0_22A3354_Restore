@implementation UIWebSelectPopover

- (UIWebSelectPopover)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7
{
  _BOOL8 v7;
  UIWebSelectPopover *v11;
  void *tableViewController;
  uint64_t v13;
  UINavigationController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v21;

  v7 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UIWebSelectPopover;
  v11 = -[UIWebFormRotatingAccessoryPopover initWithDOMNode:](&v21, sel_initWithDOMNode_, a3, a4, a5);
  if (v11)
  {
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0));
    -[UIWebSelectPopover set_tableViewController:](v11, "set_tableViewController:", -[UIWebSelectTableViewController initWithDOMHTMLSelectNode:cachedItems:singleSelectionIndex:multipleSelection:]([UIWebSelectTableViewController alloc], "initWithDOMHTMLSelectNode:cachedItems:singleSelectionIndex:multipleSelection:", a3, a4, a6, v7));
    -[UIWebSelectTableViewController set_popover:](v11->_tableViewController, "set_popover:", v11);
    tableViewController = v11->_tableViewController;
    v13 = objc_msgSend((id)objc_msgSend(a3, "title"), "length");
    if (v13)
    {
      v14 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v11->_tableViewController);
      tableViewController = v14;
    }
    else
    {
      v14 = 0;
    }
    -[UITableView sizeThatFits:](-[UITableViewController tableView](v11->_tableViewController, "tableView"), "sizeThatFits:", 320.0, 1.79769313e308);
    v16 = v15;
    v18 = v17;
    v19 = tableViewController;
    if (v13)
      v19 = (void *)objc_msgSend(tableViewController, "topViewController");
    objc_msgSend(v19, "setPreferredContentSize:", v16, v18);
    -[UIWebRotatingNodePopover setPopoverController:](v11, "setPopoverController:", -[UIPopoverController initWithContentViewController:]([UIPopoverController alloc], "initWithContentViewController:", tableViewController));

    -[UIKeyboardImpl setDelegate:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "setDelegate:", v11->_tableViewController);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebSelectTableViewController set_selectionNode:](self->_tableViewController, "set_selectionNode:", 0);
  -[UIWebSelectTableViewController set_cachedItems:](self->_tableViewController, "set_cachedItems:", 0);
  -[UIWebSelectTableViewController set_popover:](self->_tableViewController, "set_popover:", 0);
  -[UITableView setDataSource:](-[UITableViewController tableView](self->_tableViewController, "tableView"), "setDataSource:", 0);
  -[UITableView setDelegate:](-[UITableViewController tableView](self->_tableViewController, "tableView"), "setDelegate:", 0);
  -[UIWebSelectPopover set_tableViewController:](self, "set_tableViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectPopover;
  -[UIWebRotatingNodePopover dealloc](&v3, sel_dealloc);
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  -[UIWebRotatingNodePopover presentPopoverAnimated:](self, "presentPopoverAnimated:", 0);
}

- (UIWebSelectTableViewController)_tableViewController
{
  return self->_tableViewController;
}

- (void)set_tableViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
