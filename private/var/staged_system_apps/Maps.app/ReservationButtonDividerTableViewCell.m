@implementation ReservationButtonDividerTableViewCell

- (ReservationButtonDividerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReservationButtonDividerTableViewCell *v4;
  uint64_t v5;
  UIButton *button;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v18.receiver = self;
  v18.super_class = (Class)ReservationButtonDividerTableViewCell;
  v4 = -[ReservationButtonDividerTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    button = v4->_button;
    v4->_button = (UIButton *)v5;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonDividerTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_button);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v4->_button, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonDividerTableViewCell contentView](v4, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v4->_button, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonDividerTableViewCell contentView](v4, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));

    v19[0] = v11;
    v19[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v4;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
