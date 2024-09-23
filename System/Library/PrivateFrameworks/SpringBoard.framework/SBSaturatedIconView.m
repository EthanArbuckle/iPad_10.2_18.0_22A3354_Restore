@implementation SBSaturatedIconView

- (SBSaturatedIconView)initWithImage:(id)a3
{
  SBSaturatedIconView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBSaturatedIconView;
  v3 = -[SBSaturatedIconView initWithImage:](&v13, sel_initWithImage_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", &unk_1E91CF768, CFSTR("inputBias"));
    objc_msgSend(v4, "setValue:forKey:", &unk_1E91CF778, CFSTR("inputAmount"));
    -[SBSaturatedIconView setContentMode:](v3, "setContentMode:", 1);
    -[SBSaturatedIconView setAlpha:](v3, "setAlpha:", 0.899999976);
    -[SBSaturatedIconView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v6);

    -[SBSaturatedIconView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2E80]);

    -[SBSaturatedIconView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldRasterize:", 1);

    -[SBSaturatedIconView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRasterizationScale:", SBScreenScale());

    -[SBSaturatedIconView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[SBSaturatedIconView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBSaturatedIconView image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
