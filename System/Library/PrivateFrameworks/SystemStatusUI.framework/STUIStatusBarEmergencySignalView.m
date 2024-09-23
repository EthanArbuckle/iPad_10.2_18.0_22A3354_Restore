@implementation STUIStatusBarEmergencySignalView

- (UIImageView)sosView
{
  return (UIImageView *)objc_getProperty(self, a2, 424, 1);
}

- (STUIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3
{
  STUIStatusBarEmergencySignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarEmergencySignalView;
  v3 = -[STUIStatusBarEmergencySignalView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUIStatusBarEmergencySignalView _commonInit](v3, "_commonInit");
  return v3;
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

- (void)_commonInit
{
  UIImageView *v3;
  UIImageView *sosView;
  STUIStatusBarCellularFlatSignalView *v5;
  STUIStatusBarCellularSignalView *signalView;
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
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  sosView = self->_sosView;
  self->_sosView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_sosView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_alloc_init(STUIStatusBarCellularFlatSignalView);
  signalView = self->_signalView;
  self->_signalView = &v5->super.super;

  -[STUIStatusBarCellularSignalView setTranslatesAutoresizingMaskIntoConstraints:](self->_signalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_iconSize = -1;
  -[STUIStatusBarEmergencySignalView addSubview:](self, "addSubview:", self->_sosView);
  -[STUIStatusBarEmergencySignalView addSubview:](self, "addSubview:", self->_signalView);
  -[UIImageView topAnchor](self->_sosView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarEmergencySignalView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  -[NSLayoutConstraint setIdentifier:](self->_topConstraint, "setIdentifier:", CFSTR("sosCellularTopConstraint"));
  -[STUIStatusBarCellularSignalView topAnchor](self->_signalView, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView lastBaselineAnchor](self->_sosView, "lastBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  -[NSLayoutConstraint setIdentifier:](self->_verticalInterspaceConstraint, "setIdentifier:", CFSTR("sosCellularSeparationConstraint"));
  v23[0] = self->_topConstraint;
  -[UIImageView centerXAnchor](self->_sosView, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarEmergencySignalView centerXAnchor](self, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  -[STUIStatusBarCellularSignalView centerXAnchor](self->_signalView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarEmergencySignalView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
}

- (void)applyStyleAttributes:(id)a3
{
  int v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self->_signalView, "setNeedsLargerScale:", objc_msgSend(v7, "isScaledFixedWidthBar"));
  v4 = objc_msgSend(v7, "isRounded");
  v5 = self->_iconSize != objc_msgSend(v7, "iconSize") || self->_rounded != v4;
  -[STUIStatusBarEmergencySignalView setRounded:](self, "setRounded:", objc_msgSend(v7, "isRounded"));
  -[STUIStatusBarEmergencySignalView setIconSize:](self, "setIconSize:", objc_msgSend(v7, "iconSize"));
  objc_msgSend(v7, "imageTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_sosView, "setTintColor:", v6);

  if (v5)
    -[STUIStatusBarEmergencySignalView _iconSizeDidChange](self, "_iconSizeDidChange");

}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void)_iconSizeDidChange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend((id)objc_opt_class(), "_fontSizeForIconSize:", self->_iconSize);
  objc_msgSend(v3, "configurationWithPointSize:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("sos"), v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_sosView, "setImage:", v4);

  -[STUIStatusBarSignalView setRounded:](self->_signalView, "setRounded:", self->_rounded);
  -[STUIStatusBarSignalView setIconSize:](self->_signalView, "setIconSize:", self->_iconSize);
  -[STUIStatusBarCellularSignalView _iconSizeDidChange](self->_signalView, "_iconSizeDidChange");
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", self->_iconSize);
  v6 = v5;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  objc_msgSend((id)objc_opt_class(), "_fontSizeForIconSize:", self->_iconSize);
  v8 = v6 + v7;
  -[STUIStatusBarCellularSignalView intrinsicContentSize](self->_signalView, "intrinsicContentSize");
  v10 = v8 + v9;
  -[STUIStatusBarEmergencySignalView intrinsicContentSize](self, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", (v11 - v10) * 0.5);

}

+ (double)_fontSizeForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBF738[a3 - 1];
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  +[STUIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](STUIStatusBarCellularSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", -[STUIStatusBarSignalView numberOfBars](self->_signalView, "numberOfBars"), -[STUIStatusBarEmergencySignalView iconSize](self, "iconSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBF7C0[a3 - 1];
  return result;
}

- (STUIStatusBarCellularSignalView)signalView
{
  return (STUIStatusBarCellularSignalView *)objc_getProperty(self, a2, 432, 1);
}

- (STUIStatusBarEmergencySignalView)initWithCoder:(id)a3
{
  STUIStatusBarEmergencySignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarEmergencySignalView;
  v3 = -[STUIStatusBarEmergencySignalView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STUIStatusBarEmergencySignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  void *v17;

  if (qword_1EFC01CC0 != -1)
    dispatch_once(&qword_1EFC01CC0, &__block_literal_global_209);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STUIStatusBarEmergencySignalView signalView](self, "signalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "signalMode") == 2)
  {
    -[STUIStatusBarEmergencySignalView signalView](self, "signalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), objc_msgSend(v5, "numberOfActiveBars"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[STUIStatusBarEmergencySignalView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  -[UIImageView alpha](self->_sosView, "alpha");
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%.1f@%.1f"), v10, *(_QWORD *)&v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1EFC01CB8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("Split_SOS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView alpha](self->_sosView, "alpha");
    UIStatusBarCreateHUDDualSignalView(v13, v14, v15, 1.0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend((id)qword_1EFC01CB8, "setObject:forKey:", v12, v11);

  }
  v16 = objc_alloc(MEMORY[0x1E0DC3418]);
  v17 = (void *)objc_msgSend(v16, "initWithTitle:image:imageInsets:", 0, v12, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v17, "setScaleImage:", 1);

  return (UIAccessibilityHUDItem *)v17;
}

void __66__STUIStatusBarEmergencySignalView_accessibilityHUDRepresentation__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1EFC01CB8;
  qword_1EFC01CB8 = (uint64_t)v0;

}

- (BOOL)rounded
{
  return self->_rounded;
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
