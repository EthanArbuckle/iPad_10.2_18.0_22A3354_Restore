@implementation InboxTableView

- (InboxTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  InboxTableView *v4;
  InboxTableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InboxTableView;
  v4 = -[InboxTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[InboxTableView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[InboxTableView setSeparatorStyle:](v5, "setSeparatorStyle:", 1);
    +[CalendarMessageCell defaultRowHeight](CalendarMessageCell, "defaultRowHeight");
    -[InboxTableView setRowHeight:](v5, "setRowHeight:");
  }
  return v5;
}

- (void)setShowNoContentString:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIContentUnavailableView *v7;
  UIContentUnavailableView *noContentView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIContentUnavailableView *v19;
  UIContentUnavailableView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  if (a3)
  {
    -[InboxTableView setSeparatorStyle:](self, "setSeparatorStyle:", 0);
    if (!self->_noContentView)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView listViewDelegate](self, "listViewDelegate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noContentStringForInboxTableView:", self));
      v28 = v4;
      objc_msgSend(v4, "setText:", v6);

      v7 = (UIContentUnavailableView *)objc_msgSend(objc_alloc((Class)UIContentUnavailableView), "initWithConfiguration:", v4);
      noContentView = self->_noContentView;
      self->_noContentView = v7;

      -[UIContentUnavailableView setTranslatesAutoresizingMaskIntoConstraints:](self->_noContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[InboxTableView addSubview:](self, "addSubview:", self->_noContentView);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIContentUnavailableView leadingAnchor](self->_noContentView, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
      v29[0] = v24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIContentUnavailableView trailingAnchor](self->_noContentView, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
      v29[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIContentUnavailableView topAnchor](self->_noContentView, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v29[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIContentUnavailableView bottomAnchor](self->_noContentView, "bottomAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v29[3] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    }
  }
  else
  {
    -[InboxTableView setSeparatorStyle:](self, "setSeparatorStyle:", 1);
    v19 = self->_noContentView;
    if (v19)
    {
      -[UIContentUnavailableView removeFromSuperview](v19, "removeFromSuperview");
      v20 = self->_noContentView;
      self->_noContentView = 0;

    }
  }
}

- (void)setPreferredBackgroundColor:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxTableView preferredBackgroundColor](self, "preferredBackgroundColor"));
  if (v5)
  {
    -[InboxTableView setBackgroundColor:](self, "setBackgroundColor:", v5);
  }
  else
  {
    if (-[InboxTableView style](self, "style"))
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
    v7 = (void *)v6;
    -[InboxTableView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (InboxTableViewDelegate)listViewDelegate
{
  return (InboxTableViewDelegate *)objc_loadWeakRetained((id *)&self->_listViewDelegate);
}

- (void)setListViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listViewDelegate, a3);
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_listViewDelegate);
  objc_storeStrong((id *)&self->_noContentView, 0);
}

@end
