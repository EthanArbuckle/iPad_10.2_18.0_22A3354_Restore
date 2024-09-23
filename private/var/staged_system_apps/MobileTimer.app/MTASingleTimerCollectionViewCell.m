@implementation MTASingleTimerCollectionViewCell

- (MTASingleTimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTASingleTimerCollectionViewCell *v3;
  MTASingleTimerCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTASingleTimerCollectionViewCell;
  v3 = -[MTASingleTimerCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTASingleTimerCollectionViewCell setupControlsView](v3, "setupControlsView");
    -[MTASingleTimerCollectionViewCell setupLayoutConstraints](v4, "setupLayoutConstraints");
  }
  -[MTASingleTimerCollectionViewCell setHoverStyle:](v4, "setHoverStyle:", 0);
  return v4;
}

- (void)setupControlsView
{
  MTATimerControlsView *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[MTATimerControlsView initWithDelegate:style:timerControlState:]([MTATimerControlsView alloc], "initWithDelegate:style:timerControlState:", 0, 4, 0);
  -[MTASingleTimerCollectionViewCell setControlsView:](self, "setControlsView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  objc_msgSend(v6, "addSubview:", v5);

}

- (void)setupLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;

  v27 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v27, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v27, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v27, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v27, "addObject:", v26);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTASingleTimerCollectionViewCell;
  -[MTASingleTimerCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  objc_msgSend(v3, "setStateNeedsReset:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTASingleTimerCollectionViewCell controlsView](self, "controlsView"));
  objc_msgSend(v4, "resetLayout");

}

- (MTATimerControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsView, a3);
}

- (UIView)timerView
{
  return self->_timerView;
}

- (void)setTimerView:(id)a3
{
  objc_storeStrong((id *)&self->_timerView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_timerView, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
}

@end
