@implementation SBHStackConfigurationApertureView

- (SBHStackConfigurationApertureView)initWithFrame:(CGRect)a3 iconViewBackgroundType:(int64_t)a4
{
  SBHStackConfigurationApertureView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SBHStackConfigurationApertureView;
  v5 = -[SBHStackConfigurationApertureView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D47498];
    SBHBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("stackConfigurationForeground"), v7, 0, 0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "setGroupNameBase:", CFSTR("Widget-Stack-Configuration-FG"));
    -[SBHStackConfigurationApertureView addSubview:](v5, "addSubview:", v8);
    objc_storeStrong((id *)&v5->_backgroundMaterialView, v8);
    v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v10, "setAutoresizingMask:", 18);
    -[SBHStackConfigurationApertureView addSubview:](v5, "addSubview:", v10);
    objc_storeStrong((id *)&v5->_backgroundFilterView, v10);
    -[SBHStackConfigurationApertureView _updateBackgroundFilterView](v5, "_updateBackgroundFilterView");
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)-[SBHStackConfigurationApertureView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v12, sel__updateBackgroundFilterView);

    -[SBHStackConfigurationApertureView traitCollection](v5, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconView componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:](SBIconView, "componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:", a4, v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "setAutoresizingMask:", 18);
      -[SBHStackConfigurationApertureView addSubview:](v5, "addSubview:", v15);
      objc_storeStrong((id *)&v5->_backgroundStackMatchingView, v15);
    }
    -[SBHStackConfigurationApertureView layer](v5, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    v5->_usesConcentricCorners = 0;
  }
  return v5;
}

- (void)setUsesConcentricCorners:(BOOL)a3
{
  if (self->_usesConcentricCorners != a3)
  {
    self->_usesConcentricCorners = a3;
    -[SBHStackConfigurationApertureView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHStackConfigurationApertureView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSSet)backgroundViews
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_backgroundFilterView, self->_backgroundMaterialView, 0);
}

- (UIView)widgetStackMatchingBackgroundView
{
  return self->_backgroundStackMatchingView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double height;
  double width;
  double continuousCornerRadius;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBHStackConfigurationApertureView;
  -[SBHStackConfigurationApertureView layoutSubviews](&v18, sel_layoutSubviews);
  -[SBHStackConfigurationApertureView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  width = self->_iconImageInfo.size.width;
  height = self->_iconImageInfo.size.height;
  continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  -[SBIconListView iconContentScale](self->_iconListView, "iconContentScale");
  v11 = v10;
  if (-[SBHStackConfigurationApertureView usesConcentricCorners](self, "usesConcentricCorners"))
  {
    -[SBHStackConfigurationApertureView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = continuousCornerRadius + (v4 - width * v11) * 0.5;
  }
  else
  {
    if (width <= height)
      v15 = width;
    else
      v15 = height;
    if (v15 == 0.0)
      v16 = 0.0;
    else
      v16 = continuousCornerRadius / v15;
    -[SBHStackConfigurationApertureView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4 <= v6)
      v17 = v4;
    else
      v17 = v6;
    v14 = v16 * v17;
  }
  objc_msgSend(v12, "setCornerRadius:", v14);

  UIEdgeInsetsMakeWithEdges();
  -[SBIconListView setAdditionalLayoutInsets:](self->_iconListView, "setAdditionalLayoutInsets:");
}

- (void)_updateBackgroundFilterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBHStackConfigurationApertureView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = dbl_1D0193040[v4 == 2];
  if (v4 == 2)
    v8 = (_QWORD *)MEMORY[0x1E0CD2E98];
  else
    v8 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  objc_msgSend(v5, "colorWithAlphaComponent:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView setBackgroundColor:](self->_backgroundFilterView, "setBackgroundColor:", v11);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_backgroundFilterView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompositingFilter:", v9);

}

- (BOOL)usesConcentricCorners
{
  return self->_usesConcentricCorners;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (void)setIconListView:(id)a3
{
  objc_storeStrong((id *)&self->_iconListView, a3);
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_contentScrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_backgroundFilterView, 0);
  objc_storeStrong((id *)&self->_backgroundStackMatchingView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end
