@implementation CuratedCollectionFooterActionTableViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (CuratedCollectionFooterActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CuratedCollectionFooterActionTableViewCell *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionFooterActionTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CuratedCollectionFooterActionTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CuratedCollectionFooterActionTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v8);

    -[CuratedCollectionFooterActionTableViewCell initializeSubviews](v4, "initializeSubviews");
  }
  return v4;
}

- (void)initializeSubviews
{
  UILabel *v3;
  UILabel *actionTitleLabel;
  void *v5;
  void *v6;
  void *v7;
  MUCirclePlatterView *v8;
  MUCirclePlatterView *platterView;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  actionTitleLabel = self->_actionTitleLabel;
  self->_actionTitleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_actionTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_actionTitleLabel, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UILabel setTextColor:](self->_actionTitleLabel, "setTextColor:", v6);

  -[UILabel setNumberOfLines:](self->_actionTitleLabel, "setNumberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_actionTitleLabel, "setAccessibilityIdentifier:", CFSTR("ActionTitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_actionTitleLabel);

  v8 = (MUCirclePlatterView *)objc_msgSend(objc_alloc((Class)MUCirclePlatterView), "initWithFrame:", 0.0, 0.0, 37.0, 37.0);
  platterView = self->_platterView;
  self->_platterView = v8;

  -[MUCirclePlatterView setTranslatesAutoresizingMaskIntoConstraints:](self->_platterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[MUCirclePlatterView setGlyphColor:](self->_platterView, "setGlyphColor:", v10);

  -[MUCirclePlatterView setContentMode:](self->_platterView, "setContentMode:", 1);
  -[MUCirclePlatterView setAccessibilityIdentifier:](self->_platterView, "setAccessibilityIdentifier:", CFSTR("PlatterView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_platterView);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_actionTitleLabel, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 16.0));
  v43[0] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_actionTitleLabel, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 16.0));
  v43[1] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_actionTitleLabel, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -16.0));
  v43[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_actionTitleLabel, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MUCirclePlatterView leadingAnchor](self->_platterView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -16.0));
  v43[3] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MUCirclePlatterView centerYAnchor](self->_platterView, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v43[4] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MUCirclePlatterView trailingAnchor](self->_platterView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v12, -16.0));
  v43[5] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MUCirclePlatterView widthAnchor](self->_platterView, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 37.0));
  v43[6] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MUCirclePlatterView heightAnchor](self->_platterView, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 37.0));
  v43[7] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 60.0));
  v43[8] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionFooterActionTableViewCell;
  -[CuratedCollectionFooterActionTableViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell actionTitleLabel](self, "actionTitleLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell platterView](self, "platterView"));
  objc_msgSend(v4, "setGlyph:", 0);

}

- (void)setActionItem:(id)a3
{
  CuratedCollectionFooterActionItem **p_actionItem;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  p_actionItem = &self->_actionItem;
  objc_storeStrong((id *)&self->_actionItem, a3);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionItem title](*p_actionItem, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell actionTitleLabel](self, "actionTitleLabel"));
  objc_msgSend(v8, "setText:", v7);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionItem glyph](*p_actionItem, "glyph"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionFooterActionTableViewCell platterView](self, "platterView"));
  objc_msgSend(v9, "setGlyph:", v10);

}

- (CuratedCollectionFooterActionItem)actionItem
{
  return self->_actionItem;
}

- (UILabel)actionTitleLabel
{
  return self->_actionTitleLabel;
}

- (void)setActionTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_actionTitleLabel, a3);
}

- (MUCirclePlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_actionTitleLabel, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end
