@implementation _UIColorWelliOSVisualStyle

- (_UIColorWelliOSVisualStyle)initWithColorWell:(id)a3
{
  _UIColorWelliOSVisualStyle *v3;
  _UIColorWelliOSVisualStyle *v4;
  uint64_t v5;
  UIButton *button;
  UIImageView *v7;
  void *v8;
  uint64_t v9;
  UIView *gradientView;
  UIView *v11;
  UIView *borderView;
  UIView *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIColorWelliOSVisualStyle;
  v3 = -[_UIColorWellVisualStyle initWithColorWell:](&v18, sel_initWithColorWell_, a3);
  v4 = v3;
  if (v3)
  {
    -[_UIColorWellVisualStyle setWantsSystemDragAndDrop:](v3, "setWantsSystemDragAndDrop:", 1);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v5;

    v7 = [UIImageView alloc];
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIColorWell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIImageView initWithImage:](v7, "initWithImage:", v8);
    gradientView = v4->_gradientView;
    v4->_gradientView = (UIView *)v9;

    v11 = objc_alloc_init(UIView);
    borderView = v4->_borderView;
    v4->_borderView = v11;

    v13 = v4->_borderView;
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = v4->_button;
    -[_UIColorWellVisualStyle selectedColor](v4, "selectedColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView addSubview:](v4, "addSubview:", v4->_gradientView);
    -[UIView addSubview:](v4, "addSubview:", v4->_borderView);
    -[UIView addSubview:](v4, "addSubview:", v4->_button);
    -[UIView setAutoresizingMask:](v4->_gradientView, "setAutoresizingMask:", 18);
    -[UIView setAutoresizingMask:](v4->_button, "setAutoresizingMask:", 18);
    -[UIControl addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel__invokeColorPicker_, 64);
    -[UIControl addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_touchDown_, 1);
    -[UIControl addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_touchUp_, 480);
    -[_UIColorWellVisualStyle setWantsExtraTouchInsets:](v4, "setWantsExtraTouchInsets:", 1);
  }
  return v4;
}

- (void)setSelectedColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIColorWelliOSVisualStyle;
  -[_UIColorWellVisualStyle setSelectedColor:](&v4, sel_setSelectedColor_, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  UIButton *button;
  void *v23;
  void *v24;
  UIView *borderView;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v37.receiver = self;
  v37.super_class = (Class)_UIColorWelliOSVisualStyle;
  -[UIView layoutSubviews](&v37, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView bounds](self, "bounds");
  v4 = fmax(fmin(v3, 36.0), 28.0);
  -[UIView bounds](self, "bounds");
  v6 = fmax(fmin(v5, 36.0), 28.0);
  -[UIView bounds](self, "bounds");
  v9 = v8 + (v7 - v6) * 0.5;
  v12 = v11 + (v10 - v4) * 0.5;
  -[UIView setFrame:](self->_gradientView, "setFrame:", v9, v12, v6, v4);
  v38.origin.x = v9;
  v38.origin.y = v12;
  v38.size.width = v6;
  v38.size.height = v4;
  v39 = CGRectInset(v38, 3.0, 3.0);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  v39.origin.x = v9;
  v39.origin.y = v12;
  v39.size.width = v6;
  v39.size.height = v4;
  v40 = CGRectInset(v39, 5.0, 5.0);
  v17 = v40.origin.x;
  v18 = v40.origin.y;
  v19 = v40.size.width;
  v20 = v40.size.height;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIView setFrame:](self->_borderView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_button, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41.origin.x = v17;
  v41.origin.y = v18;
  v41.size.width = v19;
  v41.size.height = v20;
  objc_msgSend(v21, "setCornerRadius:", CGRectGetWidth(v41) * 0.5);

  button = self->_button;
  -[_UIColorWellVisualStyle selectedColor](self, "selectedColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](button, "setBackgroundColor:", v23);

  -[UIView layer](self->_borderView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  objc_msgSend(v24, "setCornerRadius:", CGRectGetWidth(v42) * 0.5);

  borderView = self->_borderView;
  -[_UIColorWellVisualStyle selectedColor](self, "selectedColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    v27 = 1.0;
  else
    v27 = 0.0;
  -[UIView setAlpha:](borderView, "setAlpha:", v27);

  if (self->_isSelected)
    v28 = 0.5;
  else
    v28 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", v28);
  -[UIView bounds](self->_button, "bounds");
  v31 = (v30 + -44.0) * 0.5;
  if (v30 + -44.0 > 0.0)
    v31 = 0.0;
  if (v29 + -44.0 <= 0.0)
    v32 = (v29 + -44.0) * 0.5;
  else
    v32 = 0.0;
  -[UIView _setTouchInsets:](self->_button, "_setTouchInsets:", v32, v31, v32, v31);
  -[UIView bounds](self, "bounds");
  v35 = (v34 + -44.0) * 0.5;
  if (v34 + -44.0 > 0.0)
    v35 = 0.0;
  if (v33 + -44.0 <= 0.0)
    v36 = (v33 + -44.0) * 0.5;
  else
    v36 = 0.0;
  -[UIView _setTouchInsets:](self, "_setTouchInsets:", v36, v35, v36, v35);
}

- (void)touchDown:(id)a3
{
  self->_isSelected = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (void)touchUp:(id)a3
{
  self->_isSelected = 0;
  -[UIView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (double)_widthForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  result = 36.0;
  if (v3 == 1)
    return 28.0;
  return result;
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIColorWelliOSVisualStyle _widthForTraitCollection:](self, "_widthForTraitCollection:", v4);
  v6 = v5;

  v7 = v6;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIColorWelliOSVisualStyle;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_invokeColorPicker:(id)a3
{
  id v3;

  -[_UIColorWellVisualStyle colorWell](self, "colorWell", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleRequestedColorPickerPresentation");

}

- (id)dragPreviewParameters
{
  UIDragPreviewParameters *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v25;

  v3 = objc_alloc_init(UIDragPreviewParameters);
  -[_UIColorWellVisualStyle selectedColor](self, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView frame](self->_button, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView layer](self->_button, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cornerRadius");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewParameters setVisiblePath:](v3, "setVisiblePath:", v15);

  }
  else
  {
    -[UIView frame](self->_gradientView, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[UIView frame](self->_gradientView, "frame");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, CGRectGetWidth(v25) * 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewParameters setVisiblePath:](v3, "setVisiblePath:", v13);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
