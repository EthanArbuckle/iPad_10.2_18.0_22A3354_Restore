@implementation STUIStatusBarDualCellularSignalView

- (STUIStatusBarCellularSignalView)topSignalView
{
  return (STUIStatusBarCellularSignalView *)objc_getProperty(self, a2, 424, 1);
}

- (STUIStatusBarCellularSignalView)bottomSignalView
{
  return (STUIStatusBarCellularSignalView *)objc_getProperty(self, a2, 432, 1);
}

- (STUIStatusBarDualCellularSignalView)initWithFrame:(CGRect)a3
{
  STUIStatusBarDualCellularSignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDualCellularSignalView;
  v3 = -[STUIStatusBarDualCellularSignalView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUIStatusBarDualCellularSignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  STUIStatusBarCellularSmallSignalView *v3;
  STUIStatusBarCellularSignalView *topSignalView;
  STUIStatusBarCellularFlatSignalView *v5;
  STUIStatusBarCellularSignalView *bottomSignalView;
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
  v3 = objc_alloc_init(STUIStatusBarCellularSmallSignalView);
  topSignalView = self->_topSignalView;
  self->_topSignalView = &v3->super;

  -[STUIStatusBarCellularSignalView setTranslatesAutoresizingMaskIntoConstraints:](self->_topSignalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_alloc_init(STUIStatusBarCellularFlatSignalView);
  bottomSignalView = self->_bottomSignalView;
  self->_bottomSignalView = &v5->super.super;

  -[STUIStatusBarCellularSignalView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomSignalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_iconSize = -1;
  -[STUIStatusBarDualCellularSignalView addSubview:](self, "addSubview:", self->_topSignalView);
  -[STUIStatusBarDualCellularSignalView addSubview:](self, "addSubview:", self->_bottomSignalView);
  -[STUIStatusBarCellularSignalView topAnchor](self->_topSignalView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDualCellularSignalView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  -[NSLayoutConstraint setIdentifier:](self->_topConstraint, "setIdentifier:", CFSTR("dualCellularTopBarConstraint"));
  -[STUIStatusBarCellularSignalView topAnchor](self->_bottomSignalView, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularSignalView bottomAnchor](self->_topSignalView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  -[NSLayoutConstraint setIdentifier:](self->_verticalInterspaceConstraint, "setIdentifier:", CFSTR("dualCellularBarSeparationConstraint"));
  v23[0] = self->_topConstraint;
  -[STUIStatusBarCellularSignalView centerXAnchor](self->_topSignalView, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDualCellularSignalView centerXAnchor](self, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  -[STUIStatusBarCellularSignalView centerXAnchor](self->_bottomSignalView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDualCellularSignalView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalInterspaceConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_bottomSignalView, 0);
  objc_storeStrong((id *)&self->_topSignalView, 0);
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBF6B0[a3 - 1];
  return result;
}

- (STUIStatusBarDualCellularSignalView)initWithCoder:(id)a3
{
  STUIStatusBarDualCellularSignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDualCellularSignalView;
  v3 = -[STUIStatusBarDualCellularSignalView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STUIStatusBarDualCellularSignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)_iconSizeDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[STUIStatusBarSignalView setRounded:](self->_topSignalView, "setRounded:", self->_rounded);
  -[STUIStatusBarSignalView setRounded:](self->_bottomSignalView, "setRounded:", self->_rounded);
  -[STUIStatusBarSignalView setIconSize:](self->_topSignalView, "setIconSize:", self->_iconSize);
  -[STUIStatusBarSignalView setIconSize:](self->_bottomSignalView, "setIconSize:", self->_iconSize);
  -[STUIStatusBarCellularSignalView _iconSizeDidChange](self->_topSignalView, "_iconSizeDidChange");
  -[STUIStatusBarCellularSignalView _iconSizeDidChange](self->_bottomSignalView, "_iconSizeDidChange");
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", self->_iconSize);
  v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  -[STUIStatusBarCellularSignalView intrinsicContentSize](self->_topSignalView, "intrinsicContentSize");
  v6 = v4 + v5;
  -[STUIStatusBarCellularSignalView intrinsicContentSize](self->_bottomSignalView, "intrinsicContentSize");
  v8 = v6 + v7;
  -[STUIStatusBarDualCellularSignalView intrinsicContentSize](self, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", (v9 - v8) * 0.5);
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  int v5;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "secondarySIMUnderBaseline");

  if (v5)
    self = (STUIStatusBarDualCellularSignalView *)self->_topSignalView;
  return self;
}

- (void)applyStyleAttributes:(id)a3
{
  int v4;
  int rounded;
  id v6;

  v6 = a3;
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self->_topSignalView, "setNeedsLargerScale:", objc_msgSend(v6, "isScaledFixedWidthBar"));
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self->_bottomSignalView, "setNeedsLargerScale:", objc_msgSend(v6, "isScaledFixedWidthBar"));
  v4 = objc_msgSend(v6, "isRounded");
  if (self->_iconSize == objc_msgSend(v6, "iconSize"))
  {
    rounded = self->_rounded;
    -[STUIStatusBarDualCellularSignalView setRounded:](self, "setRounded:", objc_msgSend(v6, "isRounded"));
    -[STUIStatusBarDualCellularSignalView setIconSize:](self, "setIconSize:", objc_msgSend(v6, "iconSize"));
    if (rounded == v4)
      goto LABEL_6;
  }
  else
  {
    -[STUIStatusBarDualCellularSignalView setRounded:](self, "setRounded:", objc_msgSend(v6, "isRounded"));
    -[STUIStatusBarDualCellularSignalView setIconSize:](self, "setIconSize:", objc_msgSend(v6, "iconSize"));
  }
  -[STUIStatusBarDualCellularSignalView _iconSizeDidChange](self, "_iconSizeDidChange");
LABEL_6:

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  +[STUIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:iconSize:](STUIStatusBarCellularSignalView, "_intrinsicContentSizeForNumberOfBars:iconSize:", -[STUIStatusBarSignalView numberOfBars](self->_topSignalView, "numberOfBars"), -[STUIStatusBarDualCellularSignalView iconSize](self, "iconSize"));
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  if (qword_1EFC01CB0 != -1)
    dispatch_once(&qword_1EFC01CB0, &__block_literal_global_7);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STUIStatusBarDualCellularSignalView topSignalView](self, "topSignalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "signalMode") == 2)
  {
    -[STUIStatusBarDualCellularSignalView topSignalView](self, "topSignalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), objc_msgSend(v5, "numberOfActiveBars"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[STUIStatusBarDualCellularSignalView bottomSignalView](self, "bottomSignalView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "signalMode") == 2)
  {
    -[STUIStatusBarDualCellularSignalView bottomSignalView](self, "bottomSignalView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), objc_msgSend(v9, "numberOfActiveBars"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[STUIStatusBarDualCellularSignalView _screen](self, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  objc_msgSend(v6, "stringByAppendingString:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("@%.1f"), *(_QWORD *)&v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_1, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIStatusBarCreateHUDDualSignalView(v17, v18, 1.0, 1.0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend((id)_MergedGlobals_1, "setObject:forKey:", v16, v15);

  }
  v19 = objc_alloc(MEMORY[0x1E0DC3418]);
  v20 = (void *)objc_msgSend(v19, "initWithTitle:image:imageInsets:", 0, v16, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v20, "setScaleImage:", 1);

  return (UIAccessibilityHUDItem *)v20;
}

void __69__STUIStatusBarDualCellularSignalView_accessibilityHUDRepresentation__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

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

@end
