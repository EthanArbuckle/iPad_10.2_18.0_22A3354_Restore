@implementation TPSDetailPane

- (TPSDetailPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TPSDetailPane *v7;
  uint64_t v8;
  UITableView *tableView;
  uint64_t v10;
  UITableViewCell *tableViewCell;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)TPSDetailPane;
  v7 = -[PSEditingPane initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 1, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v8;

    -[UITableView setAllowsSelection:](v7->_tableView, "setAllowsSelection:", 0);
    -[UITableView setDataSource:](v7->_tableView, "setDataSource:", v7);
    -[UITableView setScrollEnabled:](v7->_tableView, "setScrollEnabled:", 0);
    -[UITableView reloadData](v7->_tableView, "reloadData");
    -[TPSDetailPane addSubview:](v7, "addSubview:", v7->_tableView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("TPSDetailTableViewCell"));
    tableViewCell = v7->_tableViewCell;
    v7->_tableViewCell = (UITableViewCell *)v10;

    -[UITableViewCell textLabel](v7->_tableViewCell, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[TPSDetailPane tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSDetailPane frame](self, "frame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "frame");
  v4 = v3;
  objc_msgSend(v8, "rectForSection:", 0);
  v6 = v4 - v5;
  objc_msgSend(MEMORY[0x1E0CEA6C8], "defaultSize");
  objc_msgSend(v8, "setContentInset:", floor((v6 - v7) * 0.5), 0.0, 0.0, 0.0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)preferenceValue
{
  void *v2;
  void *v3;
  void *v4;

  -[TPSDetailPane tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPreferenceValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSDetailPane tableViewCell](self, "tableViewCell");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
