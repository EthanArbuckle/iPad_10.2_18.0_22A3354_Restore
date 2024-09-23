@implementation MTAPresetCollectionViewCell

- (MTAPresetCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTAPresetCollectionViewCell *v3;
  MTAPresetCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAPresetCollectionViewCell;
  v3 = -[MTAPresetCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTAPresetCollectionViewCell setupPresetView](v3, "setupPresetView");
    -[MTAPresetCollectionViewCell setupLayoutConstraints](v4, "setupLayoutConstraints");
  }
  return v4;
}

- (void)setPresetItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  objc_msgSend(v5, "setPresetItem:", v4);

}

- (void)setupPresetView
{
  MTATimerPresetView *v3;
  MTATimerPresetView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [MTATimerPresetView alloc];
  -[MTAPresetCollectionViewCell bounds](self, "bounds");
  v4 = -[MTATimerPresetView initWithFrame:](v3, "initWithFrame:");
  -[MTAPresetCollectionViewCell setPresetView:](self, "setPresetView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  objc_msgSend(v8, "addSubview:", v7);

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
  NSMutableArray *v23;

  v23 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  -[NSMutableArray addObject:](v23, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v23, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  -[NSMutableArray addObject:](v23, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  -[NSMutableArray addObject:](v23, "addObject:", v22);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTAPresetCollectionViewCell;
  -[MTAPresetCollectionViewCell setHighlighted:](&v6, "setHighlighted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetCollectionViewCell presetView](self, "presetView"));
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (MTATimerPresetView)presetView
{
  return self->_presetView;
}

- (void)setPresetView:(id)a3
{
  objc_storeStrong((id *)&self->_presetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetView, 0);
}

@end
