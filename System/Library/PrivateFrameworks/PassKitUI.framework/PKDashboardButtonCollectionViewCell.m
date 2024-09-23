@implementation PKDashboardButtonCollectionViewCell

- (PKDashboardButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardButtonCollectionViewCell *v3;
  PKDashboardButtonCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardButtonCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardButtonCollectionViewCell createSubviews](v3, "createSubviews");
    -[PKDashboardCollectionViewCell setMaskType:](v4, "setMaskType:", 3);
    v4->_enabled = 1;
    -[PKDashboardButtonCollectionViewCell _updateTextColor](v4, "_updateTextColor");
  }
  return v4;
}

- (void)createSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *activityIndicator;
  id v7;
  void *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *disclosureView;
  UIImageView *v12;
  id v13;

  -[PKDashboardButtonCollectionViewCell contentView](self, "contentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  -[PKDashboardButtonCollectionViewCell _resetFonts](self, "_resetFonts");
  objc_msgSend(v13, "addSubview:", self->_titleLabel);
  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v5;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
  objc_msgSend(v13, "addSubview:", self->_activityIndicator);
  v7 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIChevronImage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v9, "setTintColor:", v10);

  disclosureView = self->_disclosureView;
  self->_disclosureView = v9;
  v12 = v9;

  -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 1);
  objc_msgSend(v13, "addSubview:", self->_disclosureView);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardButtonCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKDashboardButtonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDashboardButtonCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[PKDashboardButtonCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, v6, v7, width + v8 * -2.0, height);
  v11 = fmin(height, 44.0);
  if (v10 < 44.0)
    v10 = v11;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setShowActivity:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;

  if (((!self->_showActivity ^ a3) & 1) == 0)
  {
    self->_showActivity = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
      -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (((!self->_enabled ^ a3) & 1) == 0)
  {
    self->_enabled = a3;
    -[PKDashboardButtonCollectionViewCell _updateTextColor](self, "_updateTextColor");
  }
}

- (void)setStyle:(unint64_t)a3
{
  uint64_t v4;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_7:
        -[PKDashboardButtonCollectionViewCell _updateTextColor](self, "_updateTextColor");
        -[PKDashboardButtonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      v4 = 0;
    }
    else
    {
      v4 = 1;
    }
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:", v4);
    goto LABEL_7;
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a4;
  width = a3.size.width;
  v7 = a3.size.width + -24.0;
  v8 = a3.size.height + -24.0;
  if ((-[UIImageView isHidden](self->_disclosureView, "isHidden") & 1) == 0)
  {
    -[UIImageView sizeToFit](self->_disclosureView, "sizeToFit");
    -[UIImageView frame](self->_disclosureView, "frame");
    v10 = v9;
    if (!v4)
    {
      UIRectCenteredYInRect();
      -[UIImageView setFrame:](self->_disclosureView, "setFrame:");
    }
    v7 = v7 - v10 + -12.0;
  }
  -[UIActivityIndicatorView sizeToFit](self->_activityIndicator, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_activityIndicator, "frame");
  v12 = v11;
  if (!v4)
  {
    UIRectCenteredYInRect();
    v12 = v13;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7 - v12 + -12.0, v8);
  UIRectCenteredYInRect();
  v15 = v14;
  if (!v4)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v16 = v15 + 24.0;
  v17 = width;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)_updateTextColor
{
  unint64_t style;
  UILabel *titleLabel;
  uint64_t v4;
  id v5;

  style = self->_style;
  if (style == 1)
  {
    titleLabel = self->_titleLabel;
    if (self->_enabled)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    goto LABEL_5;
  }
  if (!style)
  {
    titleLabel = self->_titleLabel;
    if (self->_enabled)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
LABEL_5:
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v4;
    -[UILabel setTextColor:](titleLabel, "setTextColor:");

  }
}

- (void)_resetFonts
{
  UILabel *titleLabel;
  id v3;

  titleLabel = self->_titleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardButtonCollectionViewCell;
  -[PKDashboardButtonCollectionViewCell traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKDashboardButtonCollectionViewCell traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        -[PKDashboardButtonCollectionViewCell _resetFonts](self, "_resetFonts");
        -[PKDashboardButtonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }

}

- (BOOL)showActivity
{
  return self->_showActivity;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
