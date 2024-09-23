@implementation WLQRCodeListViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLQRCodeListViewController;
  -[OBTableWelcomeController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLQRCodeListViewController;
  -[WLQRCodeListViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (!self->_attempts)
  {
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didLoadAndroidStore:selected:canceled:inAttempts:", 0, 0, 1, 0);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_qrcodes, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WLQRCodeListViewCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WLQRCodeListViewCell"));
    objc_msgSend(v7, "setAccessoryType:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  -[NSArray objectAtIndex:](self->_qrcodes, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *qrcodes;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WLQRCodeViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  qrcodes = self->_qrcodes;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](qrcodes, "objectAtIndex:", v8);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  WLLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[WLQRCodeViewController initWithTitle:detailText:symbolName:]([WLQRCodeViewController alloc], "initWithTitle:detailText:symbolName:", v9, v13, CFSTR("qrcode"));
  -[WLQRCodeViewController setQrcode:](v14, "setQrcode:", v18);
  -[WLQRCodeListViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pushViewController:animated:", v14, 1);

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "code");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didLoadAndroidStore:selected:canceled:inAttempts:", v17, 1, 0, self->_attempts);

  ++self->_attempts;
}

- (NSArray)qrcodes
{
  return self->_qrcodes;
}

- (void)setQrcodes:(id)a3
{
  objc_storeStrong((id *)&self->_qrcodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrcodes, 0);
}

@end
