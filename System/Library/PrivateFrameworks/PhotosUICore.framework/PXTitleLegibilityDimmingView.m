@implementation PXTitleLegibilityDimmingView

- (PXTitleLegibilityDimmingView)initWithFrame:(CGRect)a3
{
  PXTitleLegibilityDimmingView *v3;
  void *v4;
  void *v5;
  CABackdropLayer *v6;
  CABackdropLayer *backdropLayer;
  CABackdropLayer *v8;
  void *v9;
  void *v10;
  CALayer *v11;
  void *v12;
  CALayer *filterLayer;
  CALayer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v20[5];
  objc_super v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PXTitleLegibilityDimmingView;
  v3 = -[PXTitleLegibilityDimmingView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTitleLegibilityDimmingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXTitleLegibilityDimmingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PXTitleLegibilityDimmingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E0CD2708]);
    backdropLayer = v3->_backdropLayer;
    v3->_backdropLayer = v6;
    v8 = v6;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = xmmword_1A7C0C2E0;
    v20[1] = xmmword_1A7C0C2F0;
    v20[2] = xmmword_1A7C0C300;
    v20[3] = xmmword_1A7C0C310;
    v20[4] = xmmword_1A7C0C320;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, *MEMORY[0x1E0CD2D20]);
    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setFilters:](v11, "setFilters:", v12);

    filterLayer = v3->_filterLayer;
    v3->_filterLayer = v11;
    v14 = v11;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("onOrderIn");
    v22[1] = CFSTR("onOrderOut");
    v23[0] = v15;
    v23[1] = v15;
    v22[2] = CFSTR("sublayers");
    v22[3] = CFSTR("contents");
    v23[2] = v15;
    v23[3] = v15;
    v22[4] = CFSTR("bounds");
    v22[5] = CFSTR("position");
    v23[4] = v15;
    v23[5] = v15;
    v22[6] = CFSTR("hidden");
    v23[6] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setActions:](v8, "setActions:", v16);
    -[CALayer setActions:](v14, "setActions:", v16);
    -[PXTitleLegibilityDimmingView layer](v3, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v8);

    -[PXTitleLegibilityDimmingView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v14);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  -[PXTitleLegibilityDimmingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CALayer setFrame:](self->_filterLayer, "setFrame:", v4, v6, v8, v10);
  v11.receiver = self;
  v11.super_class = (Class)PXTitleLegibilityDimmingView;
  -[PXTitleLegibilityDimmingView layoutSubviews](&v11, sel_layoutSubviews);
}

- (void)setGradientImageName:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v5 = self->_gradientImageName;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v9);

  if (!v8)
  {
    objc_storeStrong((id *)&self->_gradientImageName, a3);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v9);
    v6 = (NSString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setContents:](self->_filterLayer, "setContents:", -[NSString CGImage](v6, "CGImage"));
LABEL_4:

  }
}

- (void)setUserData:(id)a3
{
  id v4;

  objc_msgSend(a3, "gradientImageName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTitleLegibilityDimmingView setGradientImageName:](self, "setGradientImageName:", v4);

}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (NSCopying)userData
{
  return self->_userData;
}

- (NSString)gradientImageName
{
  return self->_gradientImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientImageName, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_filterLayer, 0);
}

@end
