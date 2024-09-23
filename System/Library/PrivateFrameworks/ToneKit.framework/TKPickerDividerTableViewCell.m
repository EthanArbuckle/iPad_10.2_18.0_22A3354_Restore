@implementation TKPickerDividerTableViewCell

- (TKPickerDividerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TKPickerDividerTableViewCell *v4;
  id v5;
  uint64_t v6;
  UIView *dividerView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TKPickerDividerTableViewCell;
  v4 = -[TKPickerDividerTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[TKPickerDividerTableViewCell _dividerViewFrame](v4, "_dividerViewFrame");
    v6 = objc_msgSend(v5, "initWithFrame:");
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v6;

    -[TKPickerDividerTableViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_dividerView);

  }
  return v4;
}

- (UIColor)contentBackgroundColor
{
  return -[UIView backgroundColor](self->_dividerView, "backgroundColor");
}

- (void)setContentBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_dividerView, "setBackgroundColor:", a3);
}

- (void)setContentBackdropOverlayBlendMode:(int64_t)a3
{
  if (self->_contentBackdropOverlayBlendMode != a3)
  {
    self->_contentBackdropOverlayBlendMode = a3;
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_dividerView, "_setDrawsAsBackdropOverlayWithBlendMode:");
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKPickerDividerTableViewCell;
  -[TKPickerDividerTableViewCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void)layoutSubviews
{
  UIView *dividerView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKPickerDividerTableViewCell;
  -[TKPickerDividerTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  dividerView = self->_dividerView;
  -[TKPickerDividerTableViewCell _dividerViewFrame](self, "_dividerViewFrame");
  -[UIView setFrame:](dividerView, "setFrame:");
}

- (CGRect)_dividerViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[TKPickerDividerTableViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TKPickerDividerTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPickerDividerTableViewCell convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[TKPickerDividerTableViewCell window](self, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "scale");
  v23 = v19 + -1.0 / v22;

  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (int64_t)contentBackdropOverlayBlendMode
{
  return self->_contentBackdropOverlayBlendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerView, 0);
}

@end
