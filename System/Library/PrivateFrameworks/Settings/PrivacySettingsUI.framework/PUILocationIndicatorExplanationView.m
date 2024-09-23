@implementation PUILocationIndicatorExplanationView

- (PUILocationIndicatorExplanationView)initWithSpecifier:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PUILocationIndicatorExplanationView *v9;
  id v10;
  uint64_t v11;
  UIImageView *activeIcon;
  uint64_t v13;
  UILabel *activeLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  UIImageView *recentIcon;
  uint64_t v22;
  UILabel *recentLabel;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UILabel *explanationLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v4 = a3;
  if (loadLocationFillSystemImage_onceToken != -1)
    dispatch_once(&loadLocationFillSystemImage_onceToken, &__block_literal_global_680);
  v35.receiver = self;
  v35.super_class = (Class)PUILocationIndicatorExplanationView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[PUILocationIndicatorExplanationView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3890]);
    v11 = objc_msgSend(v10, "initWithImage:", locationFillSystemImageWithSystemPurpleColor);
    activeIcon = v9->_activeIcon;
    v9->_activeIcon = (UIImageView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    activeLabel = v9->_activeLabel;
    v9->_activeLabel = (UILabel *)v13;

    PUI_LocalizedStringForLocationServices(CFSTR("ACTIVE_EXPLANATION_ITEM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_activeLabel, "setText:", v15);

    PreferencesTableViewFooterFont();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_activeLabel, "setFont:", v16);

    PreferencesTableViewFooterColor();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_activeLabel, "setTextColor:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9->_activeLabel, "setBackgroundColor:", v18);

    -[UILabel setTextAlignment:](v9->_activeLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v9->_activeLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v9->_activeLabel, "setNumberOfLines:", 0);
    v19 = objc_alloc(MEMORY[0x1E0DC3890]);
    v20 = objc_msgSend(v19, "initWithImage:", locationFillSystemImageWithSecondaryLabelColor);
    recentIcon = v9->_recentIcon;
    v9->_recentIcon = (UIImageView *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    recentLabel = v9->_recentLabel;
    v9->_recentLabel = (UILabel *)v22;

    PUI_LocalizedStringForLocationServices(CFSTR("RECENT_EXPLANATION_ITEM"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_recentLabel, "setText:", v24);

    PreferencesTableViewFooterFont();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_recentLabel, "setFont:", v25);

    -[UILabel setTextAlignment:](v9->_recentLabel, "setTextAlignment:", 4);
    PreferencesTableViewFooterColor();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_recentLabel, "setTextColor:", v26);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9->_recentLabel, "setBackgroundColor:", v27);

    -[UILabel setLineBreakMode:](v9->_recentLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v9->_recentLabel, "setNumberOfLines:", 0);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    explanationLabel = v9->_explanationLabel;
    v9->_explanationLabel = (UILabel *)v28;

    -[PUILocationIndicatorExplanationView generalExplanationItemString](v9, "generalExplanationItemString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_explanationLabel, "setText:", v30);

    PreferencesTableViewFooterFont();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_explanationLabel, "setFont:", v31);

    PreferencesTableViewFooterColor();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_explanationLabel, "setTextColor:", v32);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9->_explanationLabel, "setBackgroundColor:", v33);

    -[UILabel setTextAlignment:](v9->_explanationLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v9->_explanationLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v9->_explanationLabel, "setNumberOfLines:", 0);
    -[PUILocationIndicatorExplanationView addSubview:](v9, "addSubview:", v9->_activeIcon);
    -[PUILocationIndicatorExplanationView addSubview:](v9, "addSubview:", v9->_activeLabel);
    -[PUILocationIndicatorExplanationView addSubview:](v9, "addSubview:", v9->_recentIcon);
    -[PUILocationIndicatorExplanationView addSubview:](v9, "addSubview:", v9->_recentLabel);
    -[PUILocationIndicatorExplanationView addSubview:](v9, "addSubview:", v9->_explanationLabel);
  }

  return v9;
}

- (id)generalExplanationItemString
{
  return PUI_LocalizedStringForLocationServices(CFSTR("GENERAL_EXPLANATION_ITEM"));
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;

  objc_msgSend(a4, "_backgroundInset");
  v7 = v6 + 12.0;
  -[UIImageView frame](self->_activeIcon, "frame");
  v9 = v8;
  v59 = v10;
  -[UILabel frame](self->_activeLabel, "frame");
  -[UIImageView frame](self->_recentIcon, "frame");
  v12 = v11;
  v58 = v13;
  -[UILabel frame](self->_recentLabel, "frame");
  -[UILabel frame](self->_explanationLabel, "frame");
  -[UILabel text](self->_explanationLabel, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_explanationLabel, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v15, -[UILabel lineBreakMode](self->_explanationLabel, "lineBreakMode"), a3 + (v7 + 4.0) * -2.0, 1.79769313e308);
  v57 = v16;
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceLayoutDirection");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v23 = v7 + 4.0;
    else
      v23 = v7;
    v56 = v9 + v23;
  }
  else
  {
    v56 = v7 + 4.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "userInterfaceLayoutDirection");

  if (v25)
    v26 = a3 - v7 - v9;
  else
    v26 = v7;
  PSRoundToPixel();
  v28 = v27;
  PSRoundToPixel();
  v55 = v18;
  v30 = v29;
  PSRoundToPixel();
  v54 = v12;
  v32 = a3 + v7 * -2.0 + -10.0 - v31;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "userInterfaceLayoutDirection");

  v35 = v30 + 10.0;
  if (v34)
    v35 = v7;
  v53 = v35;
  -[UILabel text](self->_activeLabel, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_activeLabel, "font");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v37, -[UILabel lineBreakMode](self->_activeLabel, "lineBreakMode"), v32, 1.79769313e308);
  v51 = v38;
  v52 = v39;

  PSRoundToPixel();
  v41 = v40;
  -[UILabel text](self->_recentLabel, "text");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_recentLabel, "font");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v43, -[UILabel lineBreakMode](self->_recentLabel, "lineBreakMode"), v32, 1.79769313e308);
  v45 = v44;
  v50 = v46;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "userInterfaceLayoutDirection");

  if (v48 == 1)
    v49 = v32;
  else
    v49 = v57;
  if (v48 == 1)
    v45 = v32;
  else
    v32 = v51;
  -[UIImageView setFrame:](self->_activeIcon, "setFrame:", v26, v28, v9, v59);
  -[UILabel setFrame:](self->_activeLabel, "setFrame:", v53, v28 + -3.0, v32, v52);
  -[UIImageView setFrame:](self->_recentIcon, "setFrame:", v26, v41, v54, v58);
  -[UILabel setFrame:](self->_recentLabel, "setFrame:", v53, v41 + -3.0, v45, v50);
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v56, 12.0, v49, v55);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUILocationIndicatorExplanationView;
  -[PUILocationIndicatorExplanationView layoutSubviews](&v6, sel_layoutSubviews);
  -[PUILocationIndicatorExplanationView bounds](self, "bounds");
  v4 = v3;
  -[PUILocationIndicatorExplanationView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationIndicatorExplanationView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", v5, v4);

}

- (double)preferredHeightForWidth:(double)a3
{
  __assert_rtn("-[PUILocationIndicatorExplanationView preferredHeightForWidth:]", "PUILocationServicesListController.m", 307, "0");
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PUILocationIndicatorExplanationView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", a4, a3);
  -[UIImageView frame](self->_recentIcon, "frame");
  v7 = v5 + v6;
  -[UILabel frame](self->_recentLabel, "frame");
  v10 = v8 + v9;
  if (v7 >= v8 + v9)
    v10 = v7;
  return v10 + 24.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_recentLabel, 0);
  objc_storeStrong((id *)&self->_recentIcon, 0);
  objc_storeStrong((id *)&self->_activeLabel, 0);
  objc_storeStrong((id *)&self->_activeIcon, 0);
}

@end
