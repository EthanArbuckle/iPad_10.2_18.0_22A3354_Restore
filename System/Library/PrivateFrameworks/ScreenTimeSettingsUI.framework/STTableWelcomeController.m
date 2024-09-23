@implementation STTableWelcomeController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), "KVOContextSTTableWelcomeController");

  v4.receiver = self;
  v4.super_class = (Class)STTableWelcomeController;
  -[STTableWelcomeController dealloc](&v4, sel_dealloc);
}

- (void)setTableViewController:(id)a3
{
  UITableViewController *v5;
  UITableViewController *tableViewController;
  UITableViewController *v7;
  void *v8;
  void *v9;
  UITableViewController *v10;

  v5 = (UITableViewController *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STTableWelcomeController.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableViewController != nil"));

  }
  tableViewController = self->_tableViewController;
  self->_tableViewController = v5;
  v10 = v5;
  v7 = tableViewController;

  -[UITableViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", 0);
  -[STTableWelcomeController addChildViewController:](self, "addChildViewController:", v10);
  -[UITableViewController tableView](v10, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTableWelcomeController setTableView:](self, "setTableView:", v8);

  -[UITableViewController didMoveToParentViewController:](v10, "didMoveToParentViewController:", self);
  -[UITableViewController removeFromParentViewController](v7, "removeFromParentViewController");

}

- (void)setTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), "KVOContextSTTableWelcomeController");

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setScrollEnabled:", 0);
  v9.receiver = self;
  v9.super_class = (Class)STTableWelcomeController;
  -[OBTableWelcomeController setTableView:](&v9, sel_setTableView_, v4);
  objc_msgSend(v4, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  objc_msgSend(v6, "constraintEqualToConstant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STTableWelcomeController setHeightConstraint:](self, "setHeightConstraint:", v8);
  objc_msgSend(v8, "setActive:", 1);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 3, "KVOContextSTTableWelcomeController");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v10 = a5;
  if (a6 == "KVOContextSTTableWelcomeController")
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("contentSize")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {

        v11 = 0;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      objc_msgSend(v11, "CGSizeValue");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v13, "CGSizeValue");
      -[STTableWelcomeController _contentSizeDidChangeFrom:to:](self, "_contentSizeDidChangeFrom:to:", v16, v18, v19, v20);

    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)STTableWelcomeController;
    -[STTableWelcomeController observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, CFSTR("contentSize"), a4, v10, a6);
  }

}

- (void)_contentSizeDidChangeFrom:(CGSize)a3 to:(CGSize)a4
{
  double height;
  void *v6;

  if (a3.height != a4.height)
  {
    height = a4.height;
    -[STTableWelcomeController heightConstraint](self, "heightConstraint", a3.width, a3.height, a4.width);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", height);

    -[STTableWelcomeController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_viewDidLayoutSubviews, 0, 0.0);
  }
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

@end
