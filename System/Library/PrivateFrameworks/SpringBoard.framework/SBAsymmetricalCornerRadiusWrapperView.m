@implementation SBAsymmetricalCornerRadiusWrapperView

- (SBAsymmetricalCornerRadiusWrapperView)initWithFrame:(CGRect)a3
{
  SBAsymmetricalCornerRadiusWrapperView *v3;
  SBAsymmetricalCornerRadiusWrapperView *v4;
  void *v5;
  uint64_t v6;
  SBHitTestExtendedView *v7;
  uint64_t v8;
  SBHitTestExtendedView *trailingCornersMaskingView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBAsymmetricalCornerRadiusWrapperView;
  v3 = -[SBHitTestExtendedView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBAsymmetricalCornerRadiusWrapperView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    v7 = [SBHitTestExtendedView alloc];
    -[SBAsymmetricalCornerRadiusWrapperView bounds](v4, "bounds");
    v8 = -[SBHitTestExtendedView initWithFrame:](v7, "initWithFrame:");
    trailingCornersMaskingView = v4->_trailingCornersMaskingView;
    v4->_trailingCornersMaskingView = (SBHitTestExtendedView *)v8;

    -[SBHitTestExtendedView setAutoresizingMask:](v4->_trailingCornersMaskingView, "setAutoresizingMask:", 18);
    -[SBHitTestExtendedView layer](v4->_trailingCornersMaskingView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v6);

    -[SBAsymmetricalCornerRadiusWrapperView addSubview:](v4, "addSubview:", v4->_trailingCornersMaskingView);
    -[SBAsymmetricalCornerRadiusWrapperView setMaskedCorners:](v4, "setMaskedCorners:", 15);
  }
  return v4;
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  BSCornerRadiusConfiguration *v4;
  BSCornerRadiusConfiguration *cornerRadiusConfiguration;
  id v6;

  v6 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    v4 = (BSCornerRadiusConfiguration *)objc_msgSend(v6, "copy");
    cornerRadiusConfiguration = self->_cornerRadiusConfiguration;
    self->_cornerRadiusConfiguration = v4;

    -[SBAsymmetricalCornerRadiusWrapperView _updateCornerRadius](self, "_updateCornerRadius");
  }

}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBAsymmetricalCornerRadiusWrapperView;
  -[SBAsymmetricalCornerRadiusWrapperView setClipsToBounds:](&v5, sel_setClipsToBounds_);
  -[SBHitTestExtendedView setClipsToBounds:](self->_trailingCornersMaskingView, "setClipsToBounds:", v3);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBAsymmetricalCornerRadiusWrapperView _updateMaskedCorners](self, "_updateMaskedCorners");
  }
}

- (NSArray)contentViews
{
  return (NSArray *)-[SBHitTestExtendedView subviews](self->_trailingCornersMaskingView, "subviews");
}

- (void)addContentView:(id)a3
{
  -[SBHitTestExtendedView addSubview:](self->_trailingCornersMaskingView, "addSubview:", a3);
}

- (void)bringContentViewToFront:(id)a3
{
  -[SBHitTestExtendedView bringSubviewToFront:](self->_trailingCornersMaskingView, "bringSubviewToFront:", a3);
}

- (void)sendContentViewToBack:(id)a3
{
  -[SBHitTestExtendedView sendSubviewToBack:](self->_trailingCornersMaskingView, "sendSubviewToBack:", a3);
}

- (void)_updateCornerRadius
{
  void *v3;
  void *v4;
  id v5;

  -[SBAsymmetricalCornerRadiusWrapperView cornerRadiusConfiguration](self, "cornerRadiusConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAsymmetricalCornerRadiusWrapperView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLeft");
  objc_msgSend(v3, "setCornerRadius:");

  -[SBHitTestExtendedView layer](self->_trailingCornersMaskingView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topRight");
  objc_msgSend(v4, "setCornerRadius:");

}

- (void)_updateMaskedCorners
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = -[SBAsymmetricalCornerRadiusWrapperView maskedCorners](self, "maskedCorners");
  v4 = v3 & 0xFFFFFFFFFFFFFFF5;
  v5 = v3 & 0xFFFFFFFFFFFFFFFALL;
  -[SBAsymmetricalCornerRadiusWrapperView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", v4);

  -[SBHitTestExtendedView layer](self->_trailingCornersMaskingView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", v5);

}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (uint64_t)trailingCornersMaskingView
{
  if (result)
    return *(_QWORD *)(result + 440);
  return result;
}

- (void)setTrailingCornersMaskingView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 440), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCornersMaskingView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
}

@end
