@implementation PUILocationIndicatorSystemExplanationView

- (PUILocationIndicatorSystemExplanationView)initWithSpecifier:(id)a3
{
  PUILocationIndicatorSystemExplanationView *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  UILabel *additionalInfoLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUILocationIndicatorSystemExplanationView;
  v3 = -[PUILocationIndicatorExplanationView initWithSpecifier:](&v14, sel_initWithSpecifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPaired");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3990]);
      v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      additionalInfoLabel = v3->_additionalInfoLabel;
      v3->_additionalInfoLabel = (UILabel *)v7;

      PUI_LocalizedStringForLocationServices(CFSTR("WATCH_EXPLANATION_ITEM"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v3->_additionalInfoLabel, "setText:", v9);

      PreferencesTableViewFooterFont();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v3->_additionalInfoLabel, "setFont:", v10);

      -[UILabel setTextAlignment:](v3->_additionalInfoLabel, "setTextAlignment:", 0);
      PreferencesTableViewFooterColor();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v3->_additionalInfoLabel, "setTextColor:", v11);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v3->_additionalInfoLabel, "setBackgroundColor:", v12);

      -[UILabel setLineBreakMode:](v3->_additionalInfoLabel, "setLineBreakMode:", 0);
      -[UILabel setNumberOfLines:](v3->_additionalInfoLabel, "setNumberOfLines:", 0);
      -[PUILocationIndicatorSystemExplanationView addSubview:](v3, "addSubview:", v3->_additionalInfoLabel);
    }
  }
  return v3;
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUILocationIndicatorSystemExplanationView;
  -[PUILocationIndicatorExplanationView layoutForWidth:inTableView:](&v16, sel_layoutForWidth_inTableView_, a4);
  if (self->_additionalInfoLabel)
  {
    -[UIImageView frame](self->super._recentIcon, "frame");
    -[UILabel frame](self->super._recentLabel, "frame");
    PSRoundToPixel();
    -[UILabel frame](self->super._recentLabel, "frame");
    v7 = v6;
    -[UILabel frame](self->_additionalInfoLabel, "frame");
    PSRoundToPixel();
    v9 = v8;
    -[UILabel text](self->_additionalInfoLabel, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_additionalInfoLabel, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v11, -[UILabel lineBreakMode](self->_additionalInfoLabel, "lineBreakMode"), a3 - v7 - v7, 1.79769313e308);
    v13 = v12;
    v15 = v14;

    -[UILabel setFrame:](self->_additionalInfoLabel, "setFrame:", v7, v9, v13, v15);
  }
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (self->_additionalInfoLabel)
  {
    -[PUILocationIndicatorSystemExplanationView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", a4, a3);
    -[UILabel frame](self->_additionalInfoLabel, "frame");
    return v5 + v6 + 24.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUILocationIndicatorSystemExplanationView;
    -[PUILocationIndicatorExplanationView preferredHeightForWidth:inTableView:](&v8, sel_preferredHeightForWidth_inTableView_, a4, a3);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfoLabel, 0);
}

@end
