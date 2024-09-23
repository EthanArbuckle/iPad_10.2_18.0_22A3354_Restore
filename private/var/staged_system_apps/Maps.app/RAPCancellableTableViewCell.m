@implementation RAPCancellableTableViewCell

- (RAPCancellableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 itemKind:(int64_t)a5
{
  RAPCancellableTableViewCell *v6;
  UIButton *v7;
  UIButton *cancelButton;
  UIButton *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[3];

  v29.receiver = self;
  v29.super_class = (Class)RAPCancellableTableViewCell;
  v6 = -[RAPCancellableTableViewCell initWithStyle:reuseIdentifier:](&v29, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v6)
  {
    v7 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = v7;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _setTouchInsets:](v6->_cancelButton, "_setTouchInsets:", -3.0, -3.0, -3.0, -3.0);
    v9 = v6->_cancelButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", 0.219999999));
    -[UIButton setTintColor:](v9, "setTintColor:", v11);

    v12 = v6->_cancelButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    -[UIButton setImage:forState:](v12, "setImage:forState:", v13, 0);

    v14 = v6->_cancelButton;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 14.0));
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v14, "setPreferredSymbolConfiguration:forImageInState:", v15, 0);

    v6->_itemKind = a5;
    -[UIButton addTarget:action:forControlEvents:](v6->_cancelButton, "addTarget:action:forControlEvents:", v6, "onCancel:", 64);
    -[RAPCancellableTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCancellableTableViewCell contentView](v6, "contentView"));
    objc_msgSend(v16, "addSubview:", v6->_cancelButton);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v6->_cancelButton, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCancellableTableViewCell safeAreaLayoutGuide](v6, "safeAreaLayoutGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v17, -15.0));
    v30[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v6->_cancelButton, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCancellableTableViewCell centerYAnchor](v6, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v30[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v6->_cancelButton, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v6->_cancelButton, "heightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v30[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
  return v6;
}

- (NSLayoutXAxisAnchor)leadingAnchorForAccessoryView
{
  return (NSLayoutXAxisAnchor *)-[UIButton leadingAnchor](self->_cancelButton, "leadingAnchor");
}

- (void)onCancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelCell:ofKind:", self, self->_itemKind);

}

- (RAPCancellableTableViewCellDelegate)delegate
{
  return (RAPCancellableTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(int64_t)a3
{
  self->_itemKind = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
