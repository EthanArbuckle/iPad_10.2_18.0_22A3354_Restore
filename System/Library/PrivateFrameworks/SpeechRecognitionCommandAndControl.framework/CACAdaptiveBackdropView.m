@implementation CACAdaptiveBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3
{
  return -[CACAdaptiveBackdropView initWithFrame:isContrasted:](self, "initWithFrame:isContrasted:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3 isContrasted:(BOOL)a4
{
  _BOOL4 v4;
  CACAdaptiveBackdropView *v5;
  void *v6;
  CAFilter *gaussianBlurFilter;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CAFilter *luminanceMapFilter;
  id v16;
  void *v17;
  void *v18;
  CAFilter *colorMatrix;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  objc_super v28[10];
  objc_super v29;
  _QWORD v30[4];

  v4 = a4;
  v30[3] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)CACAdaptiveBackdropView;
  v5 = -[CACAdaptiveBackdropView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", &unk_24F2CEBD8, CFSTR("inputRadius"));
    gaussianBlurFilter = v5->_gaussianBlurFilter;
    v5->_gaussianBlurFilter = (CAFilter *)v6;
    v8 = v6;

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B80]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACAdaptiveBackdropView traitCollection](v5, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("luminance"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    objc_msgSend(v9, "setValue:forKey:", objc_msgSend(v14, "CGImage"), CFSTR("inputColorMap"));
    objc_msgSend(v9, "setValue:forKey:", &unk_24F2CEBE8, CFSTR("inputAmount"));
    luminanceMapFilter = v5->_luminanceMapFilter;
    v5->_luminanceMapFilter = (CAFilter *)v9;
    v16 = v9;

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CAColorMatrixMakeColorSourceOver();
    memset(v28, 0, sizeof(v28));
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v28, "{CAColorMatrix=ffffffffffffffffffff}");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("inputColorMatrix"));

    colorMatrix = v5->_colorMatrix;
    v5->_colorMatrix = (CAFilter *)v17;
    v20 = v17;

    v30[0] = v8;
    v30[1] = v16;
    v30[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACAdaptiveBackdropView layer](v5, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFilters:", v21);

    if (v4)
      CACAdaptiveBackdropContrastedGroupName();
    else
      CACAdaptiveBackdropGroupName();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACAdaptiveBackdropView layer](v5, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setGroupName:", v23);

    v25 = CACAdaptiveBackdropScale();
    -[CACAdaptiveBackdropView layer](v5, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setScale:", v25);

  }
  return v5;
}

+ (id)contrastAdaptiveBackdropViewWithFrame:(CGRect)a3
{
  return -[CACAdaptiveBackdropView initWithFrame:isContrasted:]([CACAdaptiveBackdropView alloc], "initWithFrame:isContrasted:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CAFilter)gaussianBlurFilter
{
  return self->_gaussianBlurFilter;
}

- (void)setGaussianBlurFilter:(id)a3
{
  objc_storeStrong((id *)&self->_gaussianBlurFilter, a3);
}

- (CAFilter)luminanceMapFilter
{
  return self->_luminanceMapFilter;
}

- (void)setLuminanceMapFilter:(id)a3
{
  objc_storeStrong((id *)&self->_luminanceMapFilter, a3);
}

- (CAFilter)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_colorMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_storeStrong((id *)&self->_luminanceMapFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

@end
