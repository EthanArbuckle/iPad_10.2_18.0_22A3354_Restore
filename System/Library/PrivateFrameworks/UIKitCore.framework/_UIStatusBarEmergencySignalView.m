@implementation _UIStatusBarEmergencySignalView

+ (double)_fontSizeForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_186683810[a3 - 1];
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_186683898[a3 - 1];
  return result;
}

- (void)_commonInit
{
  UIImageView *v3;
  UIImageView *sosView;
  _UIStatusBarCellularFlatSignalView *v5;
  _UIStatusBarCellularSignalView *signalView;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *topConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *verticalInterspaceConstraint;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(UIImageView);
  sosView = self->_sosView;
  self->_sosView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_sosView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_alloc_init(_UIStatusBarCellularFlatSignalView);
  signalView = self->_signalView;
  self->_signalView = &v5->super.super;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_signalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_iconSize = -1;
  -[UIView addSubview:](self, "addSubview:", self->_sosView);
  -[UIView addSubview:](self, "addSubview:", self->_signalView);
  -[UIView topAnchor](self->_sosView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  -[NSLayoutConstraint setIdentifier:](self->_topConstraint, "setIdentifier:", CFSTR("sosCellularTopConstraint"));
  -[UIView topAnchor](self->_signalView, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView lastBaselineAnchor](self->_sosView, "lastBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  -[NSLayoutConstraint setIdentifier:](self->_verticalInterspaceConstraint, "setIdentifier:", CFSTR("sosCellularSeparationConstraint"));
  v23[0] = self->_topConstraint;
  -[UIView centerXAnchor](self->_sosView, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  -[UIView centerXAnchor](self->_signalView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);
}

- (_UIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3
{
  _UIStatusBarEmergencySignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarEmergencySignalView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIStatusBarEmergencySignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (_UIStatusBarEmergencySignalView)initWithCoder:(id)a3
{
  _UIStatusBarEmergencySignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarEmergencySignalView;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[_UIStatusBarEmergencySignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)_iconSizeDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend((id)objc_opt_class(), "_fontSizeForIconSize:", self->_iconSize);
  +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("sos"), v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_sosView, "setImage:", v3);

  -[_UIStatusBarSignalView setRounded:](self->_signalView, "setRounded:", self->_rounded);
  -[_UIStatusBarSignalView setIconSize:](self->_signalView, "setIconSize:", self->_iconSize);
  -[_UIStatusBarCellularSignalView _iconSizeDidChange](self->_signalView, "_iconSizeDidChange");
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", self->_iconSize);
  v5 = v4;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  objc_msgSend((id)objc_opt_class(), "_fontSizeForIconSize:", self->_iconSize);
  v7 = v5 + v6;
  -[_UIStatusBarCellularSignalView intrinsicContentSize](self->_signalView, "intrinsicContentSize");
  v9 = v7 + v8;
  -[_UIStatusBarEmergencySignalView intrinsicContentSize](self, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", (v10 - v9) * 0.5);

}

- (void)applyStyleAttributes:(id)a3
{
  int v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self->_signalView, "setNeedsLargerScale:", objc_msgSend(v7, "isScaledFixedWidthBar"));
  v4 = objc_msgSend(v7, "isRounded");
  v5 = self->_iconSize != objc_msgSend(v7, "iconSize") || self->_rounded != v4;
  -[_UIStatusBarEmergencySignalView setRounded:](self, "setRounded:", objc_msgSend(v7, "isRounded"));
  -[_UIStatusBarEmergencySignalView setIconSize:](self, "setIconSize:", objc_msgSend(v7, "iconSize"));
  objc_msgSend(v7, "imageTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_sosView, "setTintColor:", v6);

  if (v5)
    -[_UIStatusBarEmergencySignalView _iconSizeDidChange](self, "_iconSizeDidChange");

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  +[_UIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](_UIStatusBarCellularSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", -[_UIStatusBarSignalView numberOfBars](self->_signalView, "numberOfBars"), -[_UIStatusBarEmergencySignalView iconSize](self, "iconSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  UIAccessibilityHUDItem *v16;

  if (qword_1ECD7ACC0 != -1)
    dispatch_once(&qword_1ECD7ACC0, &__block_literal_global_215_3);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_UIStatusBarEmergencySignalView signalView](self, "signalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "signalMode") == 2)
  {
    -[_UIStatusBarEmergencySignalView signalView](self, "signalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), objc_msgSend(v5, "numberOfActiveBars"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  -[UIView alpha](self->_sosView, "alpha");
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%.1f@%.1f"), v10, *(_QWORD *)&v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7ACB8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("Split_SOS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView alpha](self->_sosView, "alpha");
    UIStatusBarCreateHUDDualSignalView(v13, v14, v15, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend((id)qword_1ECD7ACB8, "setObject:forKey:", v12, v11);

  }
  v16 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v12, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setScaleImage:](v16, "setScaleImage:", 1);

  return v16;
}

- (UIImageView)sosView
{
  return (UIImageView *)objc_getProperty(self, a2, 424, 1);
}

- (_UIStatusBarCellularSignalView)signalView
{
  return (_UIStatusBarCellularSignalView *)objc_getProperty(self, a2, 432, 1);
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)verticalInterspaceConstraint
{
  return self->_verticalInterspaceConstraint;
}

- (void)setVerticalInterspaceConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalInterspaceConstraint, a3);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalInterspaceConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_sosView, 0);
}

@end
