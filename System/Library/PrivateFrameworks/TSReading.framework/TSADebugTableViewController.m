@implementation TSADebugTableViewController

- (TSADebugTableViewController)init
{
  return -[TSADebugTableViewController initWithParent:](self, "initWithParent:", 0);
}

- (TSADebugTableViewController)initWithParent:(id)a3
{
  TSADebugTableViewController *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSADebugTableViewController;
  v4 = -[TSADebugTableViewController init](&v8, sel_init);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADebugTableViewController initWithParent:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADebugTableViewController.mm"), 71, CFSTR("invalid nil value for '%s'"), "parent");
    }
    v4->_parent = (TSADebugViewController *)a3;
  }
  -[TSADebugTableViewController view](v4, "view");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSADebugTableViewController;
  -[TSADebugTableViewController dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_debugItems, "count", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;

  v5 = (void *)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  objc_msgSend((id)objc_msgSend(v5, "target"), "performSelector:withObject:", objc_msgSend(v5, "action"), self);
  -[TSADebugViewController hideIt:](self->_parent, "hideIt:", self->_parent);
}

- (void)loadView
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSADebugTableViewController;
  -[TSADebugTableViewController loadView](&v5, sel_loadView);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[TSADebugTableViewController setTableView:](self, "setTableView:", v4);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;

  v6 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DebugCell"));
  if (!v6)
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DebugCell"));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", objc_msgSend(a4, "row")), "title"));
  return v6;
}

- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  NSMutableArray *debugItems;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DebugItem *v13;

  debugItems = self->_debugItems;
  if (!debugItems)
  {
    debugItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_debugItems = debugItems;
  }
  v10 = -[NSMutableArray count](debugItems, "count");
  if (v10 < 1)
  {
LABEL_7:
    v13 = -[DebugItem initWithTitle:target:action:]([DebugItem alloc], "initWithTitle:target:action:", a3, a4, a5);
    -[NSMutableArray addObject:](self->_debugItems, "addObject:", v13);
    objc_msgSend((id)-[TSADebugTableViewController tableView](self, "tableView"), "reloadData");

  }
  else
  {
    v11 = v10;
    v12 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", v12), "title"), "isEqualToString:", a3) & 1) == 0)
    {
      if (v11 == ++v12)
        goto LABEL_7;
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSADebugTableViewController;
  -[TSADebugTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend((id)objc_msgSend((id)-[TSADebugTableViewController tableView](self, "tableView"), "superview"), "frame");
  objc_msgSend((id)-[TSADebugTableViewController view](self, "view"), "setFrame:", v4, v5, v6, v7);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)-[TSADebugTableViewController tableView](self, "tableView");
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", objc_msgSend(v5, "indexPathForSelectedRow"), 0);
  objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v6.receiver = self;
  v6.super_class = (Class)TSADebugTableViewController;
  -[TSADebugTableViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (void)hideImmediately
{
  -[TSKPopoverBasedViewController dismissAnimated:](self->_parent, "dismissAnimated:", 0);
}

@end
