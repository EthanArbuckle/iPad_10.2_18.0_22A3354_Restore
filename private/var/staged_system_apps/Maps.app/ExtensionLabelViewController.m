@implementation ExtensionLabelViewController

- (ExtensionLabelViewController)initWithTitle:(id)a3 advertisementText:(id)a4
{
  id v6;
  id v7;
  ExtensionLabelViewController *v8;
  ExtensionLabelViewController *v9;
  NSString *v10;
  NSString *advertisementText;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ExtensionLabelViewController;
  v8 = -[ExtensionLabelViewController initWithStyle:](&v13, "initWithStyle:", 1);
  v9 = v8;
  if (v8)
  {
    -[ExtensionLabelViewController setTitle:](v8, "setTitle:", v6);
    v10 = (NSString *)objc_msgSend(v7, "copy");
    advertisementText = v9->_advertisementText;
    v9->_advertisementText = v10;

  }
  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionLabelViewController;
  -[ExtensionLabelViewController viewDidLoad](&v3, "viewDidLoad");
  -[ExtensionLabelViewController configureTableView](self, "configureTableView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionLabelViewController;
  -[ExtensionLabelViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)configureTableView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setTableFooterView:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController tableView](self, "tableView"));
  v6 = objc_opt_class(AdvertisementTableViewCell);
  v7 = (objc_class *)objc_opt_class(AdvertisementTableViewCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setRowHeight:", UITableViewAutomaticDimension);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setScrollEnabled:", 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setAllowsSelection:", 0);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(AdvertisementTableViewCell);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementLabel"));
  -[ExtensionLabelViewController setLabel:](self, "setLabel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController advertisementText](self, "advertisementText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController label](self, "label"));
  objc_msgSend(v12, "setText:", v11);

  -[ExtensionLabelViewController configureLabelView](self, "configureLabelView");
  return v9;
}

- (void)configureLabelView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController label](self, "label"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController label](self, "label"));
  objc_msgSend(v5, "setFont:", v6);

}

- (id)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionLabelViewController label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)advertisementText
{
  return self->_advertisementText;
}

- (void)setAdvertisementText:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementText, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_advertisementText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
