@implementation _UIDatePickerOverlayPlatterView

- (_UIDatePickerOverlayPlatterView)initWithDatePicker:(id)a3 accessoryView:(id)a4
{
  id v6;
  id v7;
  _UIDatePickerOverlayPlatterView *v8;
  _UIDatePickerOverlayPlatterView *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _UICutoutShadowView *v14;
  void *v15;
  _UIRoundedRectShadowView *shadowView;
  _UICutoutShadowView *v17;
  void *v18;
  UIView *v19;
  UIView *backgroundView;
  UIView *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UIDatePickerOverlayPlatterView;
  v8 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 1);
    -[UIView setClipsToBounds:](v9, "setClipsToBounds:", 0);
    -[UIView layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v6, "_style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "overlayPlatterCornerRadius");
    v13 = v12;

    v14 = -[_UIRoundedRectShadowView initWithCornerRadius:]([_UICutoutShadowView alloc], "initWithCornerRadius:", v13);
    -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    -[UIView bounds](v9, "bounds");
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](v14, "frameWithContentWithFrame:");
    -[UIImageView setFrame:](v14, "setFrame:");
    objc_msgSend(v6, "_style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setHidden:](v14, "setHidden:", objc_msgSend(v15, "overlayPlatterWantsShadowView") ^ 1);

    -[UIView addSubview:](v9, "addSubview:", v14);
    shadowView = v9->_shadowView;
    v9->_shadowView = &v14->super;
    v17 = v14;

    objc_msgSend(v6, "_style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createOverlayBackgroundView");
    v19 = (UIView *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](v9, "addSubview:", v19);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v19;
    v21 = v19;

    objc_storeStrong((id *)&v9->_accessoryView, a4);
    -[_UIDatePickerOverlayPlatterView replaceDatePicker:](v9, "replaceDatePicker:", v6);
  }

  return v9;
}

- (void)replaceDatePicker:(id)a3
{
  id v5;
  id *p_datePicker;
  _UIDatePickerStyle *v7;
  _UIDatePickerStyle *datePickerStyle;
  void *v9;
  UIStackView *v10;
  void *v11;
  void *v12;
  UIView *v13;
  void *v14;
  void *v15;
  UIView *contentView;
  void *v17;
  id v18;
  void *v19;
  NSLayoutConstraint *contentWidthConstraint;
  NSLayoutConstraint *contentHeightConstraint;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  p_datePicker = (id *)&self->_datePicker;
  objc_storeStrong((id *)&self->_datePicker, a3);
  objc_msgSend(v5, "_style");
  v7 = (_UIDatePickerStyle *)objc_claimAutoreleasedReturnValue();
  datePickerStyle = self->_datePickerStyle;
  self->_datePickerStyle = v7;

  -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [UIStackView alloc];
    v22[0] = v5;
    -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIStackView initWithArrangedSubviews:](v10, "initWithArrangedSubviews:", v12);

    -[UIView setAxis:](v13, "setAxis:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIDatePickerOverlayPlatterView datePickerStyle](self, "datePickerStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerOverlayPlatterView backgroundView](self, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:toOverlayBackgroundView:", v13, v15);

    contentView = self->_contentView;
    self->_contentView = v13;

  }
  else
  {
    -[_UIDatePickerOverlayPlatterView datePickerStyle](self, "datePickerStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *p_datePicker;
    -[_UIDatePickerOverlayPlatterView backgroundView](self, "backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:toOverlayBackgroundView:", v18, v19);

    objc_storeStrong((id *)&self->_contentView, *p_datePicker);
  }
  contentWidthConstraint = self->_contentWidthConstraint;
  self->_contentWidthConstraint = 0;

  contentHeightConstraint = self->_contentHeightConstraint;
  self->_contentHeightConstraint = 0;

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *contentWidthConstraint;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *contentHeightConstraint;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
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
  objc_super v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)_UIDatePickerOverlayPlatterView;
  -[UIView updateConstraints](&v39, sel_updateConstraints);
  if (!self->_contentWidthConstraint)
  {
    -[_UIDatePickerOverlayPlatterView preferredContentSize](self, "preferredContentSize");
    v4 = v3;
    v6 = v5;
    -[UIView widthAnchor](self->_contentView, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", v4);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentWidthConstraint = self->_contentWidthConstraint;
    self->_contentWidthConstraint = v8;

    -[UIView heightAnchor](self->_contentView, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", v6);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v11;

    -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_style");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_appliedInsetsToEdgeOfContent");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "overlayPlatterPaddingForAppliedInsets:datePickerMode:", objc_msgSend(v23, "datePickerMode"), v16, v18, v20, v22);
    v25 = v24;
    v27 = v26;

    v28 = (void *)MEMORY[0x1E0D156E0];
    -[_UIDatePickerOverlayPlatterView contentWidthConstraint](self, "contentWidthConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v29;
    -[_UIDatePickerOverlayPlatterView contentHeightConstraint](self, "contentHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v30;
    -[UIView leftAnchor](self->_contentView, "leftAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v33;
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v37);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerOverlayPlatterView;
  -[UIView layoutSubviews](&v13, sel_layoutSubviews);
  -[_UIDatePickerOverlayPlatterView shadowView](self, "shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v3, "frameWithContentWithFrame:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIDatePickerOverlayPlatterView shadowView](self, "shadowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;

  -[UIDatePicker _style](self->_datePicker, "_style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idealLayoutFittingSizeForDatePickerMode:", objc_msgSend(v4, "datePickerMode"));
  v6 = v5;
  v8 = v7;

  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "datePickerMode"))
  {
    -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "datePickerMode");

    if (v11 != 3)
    {
      -[NSLayoutConstraint setActive:](self->_contentWidthConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_contentHeightConstraint, "setActive:", 0);
      -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = 1148846080;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8, v13, v14);
      v6 = v15;
      v8 = v16;

      -[NSLayoutConstraint setActive:](self->_contentWidthConstraint, "setActive:", 1);
      -[NSLayoutConstraint setActive:](self->_contentHeightConstraint, "setActive:", 1);
    }
  }
  else
  {

  }
  -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeToFit");

    -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v8 = v8 + CGRectGetHeight(v23);

  }
  v20 = v6;
  v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)preferredPlatterSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", self);
  -[_UIDatePickerOverlayPlatterView preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  v6 = v5;
  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_appliedInsetsToEdgeOfContent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "overlayPlatterDefaultMargin");
  v19 = v18;
  objc_msgSend(v17, "overlayPlatterDefaultMargin");
  v21 = v20 + v20 - (v9 + v13);
  if (-[_UIDatePickerOverlayPlatterView accessoryViewIgnoresDefaultInsets](self, "accessoryViewIgnoresDefaultInsets"))
  {
    -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "overlayPlatterDefaultMargin");
      v21 = v21 - (v23 - v13);
    }
  }
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v25 = UISizeRoundToScale(v4 + v19 + v19 - (v11 + v15), v6 + v21, v24);
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;

  height = a3.size.height;
  width = a3.size.width;
  self->_contentBounds = a3;
  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_style");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "overlayPlatterDefaultMargin");
  v29 = v7;
  objc_msgSend(v30, "overlayPlatterDefaultMargin");
  v28 = v8;
  objc_msgSend(v30, "overlayPlatterDefaultMargin");
  v10 = v9;
  objc_msgSend(v30, "overlayPlatterDefaultMargin");
  v12 = v11;
  -[_UIDatePickerOverlayPlatterView datePicker](self, "datePicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_appliedInsetsToEdgeOfContent");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[_UIDatePickerOverlayPlatterView accessoryView](self, "accessoryView");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = -[_UIDatePickerOverlayPlatterView accessoryViewIgnoresDefaultInsets](self, "accessoryViewIgnoresDefaultInsets");

    if (v24)
    {
      objc_msgSend(v30, "overlayPlatterDefaultMargin");
      v19 = v25;
    }
  }
  -[_UIDatePickerOverlayPlatterView contentWidthConstraint](self, "contentWidthConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", width - (v28 - v17 + v12 - v21));

  -[_UIDatePickerOverlayPlatterView contentHeightConstraint](self, "contentHeightConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setConstant:", height - (v29 - v15 + v10 - v19));

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)prepareDatePickerTransitionWithDatePicker:(id)a3
{
  void *v4;
  UIView *v5;
  UIView *previousContentView;
  id v7;

  v7 = a3;
  -[_UIDatePickerOverlayPlatterView previousContentView](self, "previousContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[UIDatePicker resignFirstResponder](self->_datePicker, "resignFirstResponder");
  if (v7)
  {
    -[_UIDatePickerOverlayPlatterView contentView](self, "contentView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    previousContentView = self->_previousContentView;
    self->_previousContentView = v5;

    objc_msgSend(v7, "setAlpha:", 0.0);
    -[_UIDatePickerOverlayPlatterView replaceDatePicker:](self, "replaceDatePicker:", v7);
  }

}

- (void)datePickerTransitionAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[_UIDatePickerOverlayPlatterView previousContentView](self, "previousContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerOverlayPlatterView previousContentView](self, "previousContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[_UIDatePickerOverlayPlatterView contentView](self, "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

  }
}

- (void)datePickerTransitionCompletion
{
  void *v3;
  void *v4;
  UIView *previousContentView;

  -[_UIDatePickerOverlayPlatterView previousContentView](self, "previousContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerOverlayPlatterView previousContentView](self, "previousContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    previousContentView = self->_previousContentView;
    self->_previousContentView = 0;

  }
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (BOOL)accessoryViewIgnoresDefaultInsets
{
  return self->_accessoryViewIgnoresDefaultInsets;
}

- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3
{
  self->_accessoryViewIgnoresDefaultInsets = a3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_UIRoundedRectShadowView)shadowView
{
  return self->_shadowView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIView)previousContentView
{
  return self->_previousContentView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (_UIDatePickerStyle)datePickerStyle
{
  return self->_datePickerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePickerStyle, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_previousContentView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
