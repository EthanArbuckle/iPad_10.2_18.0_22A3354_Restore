@implementation PRXFeatureListViewController

- (PRXFeatureListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PRXScrollableContentView *v5;
  id v6;
  PRXScrollableContentView *v7;
  PRXFeatureListViewController *v8;

  v5 = [PRXScrollableContentView alloc];
  v6 = objc_alloc_init(MEMORY[0x24BDF6E58]);
  v7 = -[PRXScrollableContentView initWithCardStyle:scrollView:](v5, "initWithCardStyle:scrollView:", 0, v6);
  v8 = -[PRXFeatureListViewController initWithContentView:](self, "initWithContentView:", v7);

  return v8;
}

- (PRXFeatureListViewController)initWithContentView:(id)a3
{
  PRXFeatureListViewController *v3;
  uint64_t v4;
  NSMutableArray *mutableFeatures;
  PRXFeatureListViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureListViewController;
  v3 = -[PRXCardContentViewController initWithContentView:](&v8, sel_initWithContentView_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    mutableFeatures = v3->_mutableFeatures;
    v3->_mutableFeatures = (NSMutableArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  char isKindOfClass;
  UITableView *v6;
  UITableView *tableView;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRXFeatureListViewController;
  -[PRXCardContentViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PRXCardContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "scrollView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ requires a PRXScrollableContentView with a UITableView"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  objc_msgSend(v3, "scrollView");
  v6 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v6;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 1.0, 21.0);
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v8);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PRXFeatureCell"));
  -[PRXFeatureListViewController _updateHeaderView](self, "_updateHeaderView");

}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRXFeatureListViewController;
  -[PRXFeatureListViewController viewLayoutMarginsDidChange](&v10, sel_viewLayoutMarginsDidChange);
  -[PRXCardContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4 + 10.0;
  -[PRXCardContentViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "directionalLayoutMargins");
  v8 = v7 + 10.0;
  -[PRXFeatureListViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDirectionalLayoutMargins:", 0.0, v5, 0.0, v8);

}

- (void)_updateHeaderView
{
  id v3;
  double Width;
  void *v5;
  double MidX;
  void *v7;
  id v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  if (-[PRXFeatureListViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_featureImage)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", self->_featureImage);
      v3 = objc_alloc(MEMORY[0x24BDF6F90]);
      objc_msgSend(v8, "bounds");
      Width = CGRectGetWidth(v9);
      objc_msgSend(v8, "bounds");
      v5 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v10) + 20.0);
      objc_msgSend(v8, "setAutoresizingMask:", 5);
      objc_msgSend(v5, "bounds");
      MidX = CGRectGetMidX(v11);
      objc_msgSend(v8, "bounds");
      objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v12));
      objc_msgSend(v5, "addSubview:", v8);
      -[PRXFeatureListViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTableHeaderView:", v5);

    }
    else
    {
      -[PRXFeatureListViewController tableView](self, "tableView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTableHeaderView:", 0);
    }

  }
}

- (void)setFeatureImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_featureImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_featureImage, a3);
    -[PRXFeatureListViewController _updateHeaderView](self, "_updateHeaderView");
    v5 = v6;
  }

}

- (NSArray)features
{
  void *v2;
  void *v3;

  -[PRXFeatureListViewController mutableFeatures](self, "mutableFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)addFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  -[PRXFeatureListViewController mutableFeatures](self, "mutableFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PRXFeatureListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasUncommittedUpdates");

  if ((v7 & 1) == 0)
  {
    -[PRXFeatureListViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  -[PRXFeatureListViewController mutableFeatures](self, "mutableFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PRXFeatureCell"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

  objc_msgSend(v10, "detailText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSubtitle:", v13);

  objc_msgSend(v10, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFeatureImageView:", v14);

  v15 = objc_msgSend(v7, "separatorStyle");
  objc_msgSend(v11, "setHidingSeparator:", v15 == 0);
  objc_msgSend(v10, "imageViewSize");
  if (v16 > 0.0)
  {
    objc_msgSend(v10, "imageViewSize");
    objc_msgSend(v11, "setFeatureImageSize:");
  }
  objc_msgSend(v10, "handler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "switchControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = objc_alloc_init(MEMORY[0x24BDF6E28]);
    v21 = v20;

    objc_msgSend(v11, "setSwitchControl:", v21);
    objc_msgSend(v10, "setSwitchControl:", v21);
    v22 = objc_msgSend(v10, "isOn");
    objc_msgSend(v11, "switchControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOn:", v22);

  }
  else
  {
    objc_msgSend(v11, "setSwitchControl:", 0);
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PRXFeatureListViewController mutableFeatures](self, "mutableFeatures", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIImage)featureImage
{
  return self->_featureImage;
}

- (NSMutableArray)mutableFeatures
{
  return self->_mutableFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFeatures, 0);
  objc_storeStrong((id *)&self->_featureImage, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
