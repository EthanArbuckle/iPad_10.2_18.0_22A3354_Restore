@implementation WGWidgetListEditViewTableViewCell

- (WGWidgetListEditViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WGWidgetListEditViewTableViewCell *v4;
  WGWidgetListEditViewTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImageView *dotImageView;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WGWidgetListEditViewTableViewCell;
  v4 = -[WGWidgetListEditViewTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WGWidgetListEditViewTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "_systemGroupBackgroundCellColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[WGWidgetListEditViewTableViewCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setDrawsAsBackdropOverlay:", 0);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("circle.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.525490196, 0.941176471, 1.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_flatImageWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithSize:", 6.0, 6.0);
    dotImageView = v5->_dotImageView;
    v5->_dotImageView = (UIImageView *)v12;

    -[UIImageView setImage:](v5->_dotImageView, "setImage:", v11);
    -[WGWidgetListEditViewTableViewCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_dotImageView);

  }
  return v5;
}

- (void)setWidgetEnabled:(BOOL)a3
{
  self->_widgetEnabled = a3;
  -[WGWidgetListEditViewTableViewCell setShowsDot:](self, "setShowsDot:", -[WGWidgetListEditViewTableViewCell showsDot](self, "showsDot") & !a3);
}

- (void)setShowsDot:(BOOL)a3
{
  self->_showsDot = a3;
  -[UIImageView setHidden:](self->_dotImageView, "setHidden:", !a3);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  char IsAccessibilityContentSizeCategory;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  UIImageView *dotImageView;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat rect;
  CGFloat v43;
  CGFloat v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v45.receiver = self;
  v45.super_class = (Class)WGWidgetListEditViewTableViewCell;
  -[WGWidgetListEditViewTableViewCell layoutSubviews](&v45, sel_layoutSubviews);
  -[WGWidgetListEditViewTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  -[WGWidgetListEditViewTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v43 = v10;
  v44 = v9;
  rect = v11;

  -[WGWidgetListEditViewTableViewCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v8;
  if (v21)
  {
    BSRectWithSize();
    if (-[WGWidgetListEditViewTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v46.origin.x = v8;
      v46.size.width = v43;
      v46.origin.y = v44;
      v46.size.height = rect;
      CGRectGetMaxX(v46);
    }
    if ((IsAccessibilityContentSizeCategory & 1) == 0)
    {
      v47.origin.x = v8;
      v47.size.width = v43;
      v47.origin.y = v44;
      v47.size.height = rect;
      CGRectGetHeight(v47);
    }
    objc_msgSend(v12, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    BSRectWithSize();
    v40 = _WGMainScreenScale();
    UIRectCenteredIntegralRectScale();
    v14 = v23;
    v16 = v24;
    v18 = v25;
    v20 = v26;

    objc_msgSend(v12, "setContentMode:", 9, *(_QWORD *)&v40);
    objc_msgSend(v12, "setFrame:", v14, v16, v18, v20);
  }
  -[WGWidgetListEditViewTableViewCell textLabel](self, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if (-[WGWidgetListEditViewTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v48.origin.x = v8;
    v48.size.width = v43;
    v48.origin.y = v44;
    v48.size.height = rect;
    v34 = CGRectGetMaxX(v48) - v31 + -12.0;
    objc_msgSend(v12, "image");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      v34 = v34 + -32.0;
  }
  else
  {
    v34 = 12.0;
    if ((IsAccessibilityContentSizeCategory & 1) == 0)
    {
      objc_msgSend(v12, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v49.origin.x = v14;
        v49.origin.y = v16;
        v49.size.width = v18;
        v49.size.height = v20;
        v34 = CGRectGetMaxX(v49) + 12.0;
      }

    }
  }
  objc_msgSend(v27, "setFrame:", v34, v29, v31, v33);
  v37 = 5.0;
  if (-[WGWidgetListEditViewTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v50.origin.x = v41;
    v50.size.width = v43;
    v50.origin.y = v44;
    v50.size.height = rect;
    v37 = CGRectGetMaxX(v50) + -5.0;
  }
  dotImageView = self->_dotImageView;
  v51.origin.x = v14;
  v51.origin.y = v16;
  v51.size.width = v18;
  v51.size.height = v20;
  CGRectGetMidY(v51);
  WGRoundToMainScreenScale();
  -[UIImageView setCenter:](dotImageView, "setCenter:", v37, v39);
  v52.origin.x = v41;
  v52.size.width = v43;
  v52.origin.y = v44;
  v52.size.height = rect;
  -[WGWidgetListEditViewTableViewCell setSeparatorInset:](self, "setSeparatorInset:", *MEMORY[0x24BDF7DE0], CGRectGetMinX(v52) + 12.0, *MEMORY[0x24BDF7DE0], *MEMORY[0x24BDF7DE0]);

}

- (BOOL)isWidgetEnabled
{
  return self->_widgetEnabled;
}

- (BOOL)showsDot
{
  return self->_showsDot;
}

- (UIButton)insertWidgetAccessoryButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_insertWidgetAccessoryButton);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_insertWidgetAccessoryButton);
  objc_storeStrong((id *)&self->_dotImageView, 0);
}

@end
