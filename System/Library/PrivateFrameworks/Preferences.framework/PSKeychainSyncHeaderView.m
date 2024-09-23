@implementation PSKeychainSyncHeaderView

- (PSKeychainSyncHeaderView)initWithSpecifier:(id)a3
{
  PSKeychainSyncHeaderView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  void *v8;
  int v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *detailLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  UILabel *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PSKeychainSyncHeaderView;
  v3 = -[PSKeychainSyncHeaderView init](&v29, sel_init, a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    v6 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunningInBuddy");

    v10 = v3->_titleLabel;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v10, "setTextColor:", v11);

      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v12, "sf_isiPad");

      v13 = v3->_titleLabel;
      if ((_DWORD)v11)
        objc_msgSend(MEMORY[0x1E0CEA5E8], "_thinSystemFontOfSize:", 48.0);
      else
        objc_msgSend(MEMORY[0x1E0CEA5E8], "_lightSystemFontOfSize:", 30.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v13, "setFont:", v15);

      -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v10, "setTextColor:", v14);

    }
    -[PSKeychainSyncHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v16;

    v18 = v3->_detailLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UILabel setNumberOfLines:](v3->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_detailLabel, "setLineBreakMode:", 0);
    v20 = v3->_detailLabel;
    v21 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_referenceBounds");
    v23 = 16.0;
    if (v24 == 480.0)
      v23 = 14.0;
    objc_msgSend(v21, "systemFontOfSize:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v25);

    -[UILabel setTextAlignment:](v3->_detailLabel, "setTextAlignment:", 1);
    if (v9)
    {
      v26 = v3->_titleLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    }
    else
    {
      v26 = v3->_detailLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    -[PSKeychainSyncHeaderView addSubview:](v3, "addSubview:", v3->_detailLabel);
  }
  return v3;
}

- (void)setUsesCompactLayout:(BOOL)a3
{
  self->_usesCompactLayout = a3;
  -[PSKeychainSyncHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDetailText:(id)a3
{
  -[UILabel setText:](self->_detailLabel, "setText:", a3);
  -[PSKeychainSyncHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[PSKeychainSyncHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double MaxY;
  double v14;
  void *v15;
  uint64_t v16;
  CGRect v17;

  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 18.0;
  if (objc_msgSend(v3, "isRunningInBuddy"))
    v5 = 6.0;
  else
    v5 = 18.0;

  -[UILabel text](self->_titleLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v9 = v8;
    v11 = v10;
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isRunningInBuddy"))
      v4 = 6.0;

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 20.0, v4, v9, v11);
    v17.origin.x = 20.0;
    v17.origin.y = v4;
    v17.size.width = v9;
    v17.size.height = v11;
    MaxY = CGRectGetMaxY(v17);
    v14 = 11.0;
    if (!self->_usesCompactLayout)
      v14 = 15.0;
    v5 = MaxY + v14;
  }
  -[UILabel text](self->_detailLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    -[UILabel frame](self->_detailLabel, "frame");
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", 20.0, v5);
  }
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  double v31;

  v4 = 0.0;
  if (a3 > 0.0)
  {
    -[PSKeychainSyncHeaderView frame](self, "frame", a4);
    v8 = v7;
    v10 = v9;
    -[UILabel text](self->_titleLabel, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    -[UILabel text](self->_detailLabel, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v12)
    {
      -[UILabel frame](self->_titleLabel, "frame");
      v16 = v15;
      v18 = v17;
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 + -40.0, 1.79769313e308);
      v20 = v19;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v16, v18, a3 + -40.0, v19);
      v4 = v20 + 0.0;
      if (!v14)
      {
LABEL_10:
        +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isRunningInBuddy");
        v30 = 18.0;
        v31 = 6.0;
        if (v29)
          v30 = 6.0;
        if (!self->_usesCompactLayout)
          v31 = 30.0;
        v4 = v4 + v30 + v31;

        goto LABEL_15;
      }
    }
    else if (!v14)
    {
LABEL_15:
      -[PSKeychainSyncHeaderView setFrame:](self, "setFrame:", v8, v10, a3, v4);
      return v4;
    }
    -[UILabel frame](self->_detailLabel, "frame");
    v22 = v21;
    v24 = v23;
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", a3 + -40.0, 1.79769313e308);
    v26 = v25;
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v22, v24, a3 + -40.0, v25);
    v4 = v4 + v26;
    if (v12)
    {
      v27 = 11.0;
      if (!self->_usesCompactLayout)
        v27 = 15.0;
      v4 = v4 + v27;
    }
    goto LABEL_10;
  }
  return v4;
}

- (BOOL)usesCompactLayout
{
  return self->_usesCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
