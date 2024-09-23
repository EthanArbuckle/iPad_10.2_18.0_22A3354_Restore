@implementation CuratedCollectionActionTableViewCell

- (CuratedCollectionActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CuratedCollectionActionTableViewCell *v4;
  CuratedCollectionActionTableViewCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionActionTableViewCell;
  v4 = -[CuratedCollectionActionTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CuratedCollectionActionTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CuratedCollectionActionTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[CuratedCollectionActionTableViewCell _createSubviews](v5, "_createSubviews");
    -[CuratedCollectionActionTableViewCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)_createSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CuratedCollectionActionTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = sub_1002A8AA0(self);
  if (self->_alwaysUseLightForegroundColors)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (id)v5;
  v6 = 2 * (v4 == 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MUGroupedActionsRowViewConfiguration defaultConfiguration](MUGroupedActionsRowViewConfiguration, "defaultConfiguration"));
  objc_msgSend(v7, "setTintColor:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.100000001));
  objc_msgSend(v7, "setItemBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003));
  objc_msgSend(v7, "setItemHighlightColor:", v9);

  objc_msgSend(v7, "setUseVibrancy:", 0);
  v10 = objc_msgSend(objc_alloc((Class)MUPlaceCardActionsRowView), "initWithConfiguration:style:", v7, v6);
  -[CuratedCollectionActionTableViewCell setActionRowView:](self, "setActionRowView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  objc_msgSend(v11, "setPreservesSuperviewLayoutMargins:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  objc_msgSend(v15, "addSubview:", v16);

}

- (void)_setupConstraints
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  _QWORD v30[4];

  v3 = sub_1002A8AA0(self);
  if (v3 == 5)
    v4 = 5.0;
  else
    v4 = 16.0;
  if (v3 == 5)
    v5 = -5.0;
  else
    v5 = 0.0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, v4));
  v30[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, v5));
  v30[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v7));
  v30[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  LODWORD(v13) = 1112276992;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:priority:", v12, -v4, v13));
  v30[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v16, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v17, "setPreservesSuperviewLayoutMargins:", 0);

}

- (void)layoutMarginsDidChange
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionActionTableViewCell;
  -[CuratedCollectionActionTableViewCell layoutMarginsDidChange](&v4, "layoutMarginsDidChange");
  -[CuratedCollectionActionTableViewCell bounds](self, "bounds");
  -[CuratedCollectionActionTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3
{
  -[CuratedCollectionActionTableViewCell setAlwaysUseLightForegroundColors:animated:](self, "setAlwaysUseLightForegroundColors:animated:", a3, 0);
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  CuratedCollectionActionTableViewCell *v14;
  _QWORD v15[5];

  if (self->_alwaysUseLightForegroundColors != a3)
  {
    v4 = a4;
    self->_alwaysUseLightForegroundColors = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
    -[CuratedCollectionActionTableViewCell _createSubviews](self, "_createSubviews");
    -[CuratedCollectionActionTableViewCell _setupConstraints](self, "_setupConstraints");
    -[CuratedCollectionActionTableViewCell _resetActionRow](self, "_resetActionRow");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100BF22DC;
    v15[3] = &unk_1011AC860;
    v15[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
    v8 = 0.0;
    objc_msgSend(v7, "setAlpha:", 0.0);

    if (v4)
      v8 = 0.2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100BF22E4;
    v12[3] = &unk_1011AC8B0;
    v13 = v6;
    v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BF2330;
    v10[3] = &unk_1011AE8F8;
    v11 = v13;
    v9 = v13;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v10, v8);

  }
}

- (void)configureWithModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell model](self, "model"));

  v5 = v6;
  if (v4 != v6)
  {
    -[CuratedCollectionActionTableViewCell setModel:](self, "setModel:", v6);
    -[CuratedCollectionActionTableViewCell _resetActionRow](self, "_resetActionRow");
    v5 = v6;
  }

}

- (void)_resetActionRow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  objc_msgSend(v5, "setActionManager:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionTableViewCell actionRowView](self, "actionRowView"));
  objc_msgSend(v6, "reload");

}

- (BOOL)alwaysUseLightForegroundColors
{
  return self->_alwaysUseLightForegroundColors;
}

- (MUPlaceCardActionsRowView)actionRowView
{
  return self->_actionRowView;
}

- (void)setActionRowView:(id)a3
{
  objc_storeStrong((id *)&self->_actionRowView, a3);
}

- (CuratedCollectionActionCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_actionRowView, 0);
}

@end
