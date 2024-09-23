@implementation MTATimerBaseCollectionViewCell

- (MTATimerBaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTATimerBaseCollectionViewCell *v3;
  MTATimerControlsView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MTATimerBaseCollectionViewCell;
  v3 = -[MTATimerBaseCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[MTATimerControlsView initWithDelegate:style:timerControlState:]([MTATimerControlsView alloc], "initWithDelegate:style:timerControlState:", v3, -[MTATimerBaseCollectionViewCell defaultViewStyle](v3, "defaultViewStyle"), 1);
    -[MTATimerBaseCollectionViewCell setTimerControlsView:](v3, "setTimerControlsView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](v3, "timerControlsView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](v3, "timerControlsView"));
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v3->_timerControlsView);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v18, "setBackgroundColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](v3, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
    objc_msgSend(v20, "setCornerRadius:", 16.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](v3, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v22, "setMasksToBounds:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](v3, "timerControlsView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    objc_msgSend(v23, "applyBackgroundColor:", v24);

    -[MTATimerBaseCollectionViewCell setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)setupConstraints
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
  NSMutableArray *v23;

  v23 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  -[NSMutableArray addObject:](v23, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v23, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  -[NSMutableArray addObject:](v23, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  -[NSMutableArray addObject:](v23, "addObject:", v22);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);
}

+ (double)cellHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v2, "lineHeight");
  v4 = v3 * 3.0 + 7.0 + 115.0;
  objc_msgSend(v2, "_scaledValueForValue:", 8.0);
  v6 = v4 + v5 + 31.0 + 53.0 + 100.0;

  return v6;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (unint64_t)defaultViewStyle
{
  return 6;
}

- (MTATimerControlsView)timerControlsView
{
  return self->_timerControlsView;
}

- (void)setTimerControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_timerControlsView, a3);
}

- (MTATimerCollectionViewCellDelegate)delegate
{
  return (MTATimerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerControlsView, 0);
}

@end
