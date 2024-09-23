@implementation PUHeadroomVariableBlurView

- (PUHeadroomVariableBlurView)initWithFrame:(CGRect)a3
{
  PUHeadroomVariableBlurView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CAFilter *blurFilter;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PUHeadroomVariableBlurView;
  v3 = -[PUHeadroomVariableBlurView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C18]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHeadroomVariableBlurView backdropLayer](v3, "backdropLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v4);

    -[PUHeadroomVariableBlurView backdropLayer](v3, "backdropLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsHitTesting:", 0);

    -[PUHeadroomVariableBlurView backdropLayer](v3, "backdropLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F00]);
    v8 = objc_claimAutoreleasedReturnValue();
    blurFilter = v3->_blurFilter;
    v3->_blurFilter = (CAFilter *)v8;

    -[CAFilter setValue:forKey:](v3->_blurFilter, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    -[CAFilter setValue:forKey:](v3->_blurFilter, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputDither"));
    -[CAFilter setEnabled:](v3->_blurFilter, "setEnabled:", 1);
    v14[0] = v3->_blurFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHeadroomVariableBlurView backdropLayer](v3, "backdropLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v10);

    -[PUHeadroomVariableBlurView _updateBlurProperties](v3, "_updateBlurProperties");
  }
  return v3;
}

- (void)_updateBlurProperties
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;

  +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blurMaskHeight");
  v5 = v4;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 1.0, v4);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PUHeadroomVariableBlurView__updateBlurProperties__block_invoke;
  v16[3] = &unk_1E58AA748;
  v17 = v3;
  v18 = v5;
  v6 = v3;
  objc_msgSend(v15, "imageWithActions:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomVariableBlurView setCurrentBlurMaskImage:](self, "setCurrentBlurMaskImage:", v7);

  +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blurRadius");
  v10 = v9;

  -[PUHeadroomVariableBlurView backdropLayer](self, "backdropLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomVariableBlurView currentBlurMaskImage](self, "currentBlurMaskImage");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setValue:forKeyPath:", objc_msgSend(v12, "CGImage"), CFSTR("filters.variableBlur.inputMaskImage"));

  -[PUHeadroomVariableBlurView backdropLayer](self, "backdropLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKeyPath:", v14, CFSTR("filters.variableBlur.inputRadius"));

}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (UIImage)currentBlurMaskImage
{
  return self->_currentBlurMaskImage;
}

- (void)setCurrentBlurMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentBlurMaskImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBlurMaskImage, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
}

void __51__PUHeadroomVariableBlurView__updateBlurProperties__block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  id v4;
  CGColorSpace *v5;
  id v6;
  id v7;
  const __CFArray *v8;
  CGFloat v9;
  CGGradient *v10;
  CGContext *v11;
  CGFloat locations[2];
  _QWORD v13[3];
  CGPoint v14;
  CGPoint v15;

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0C9D970];
  v4 = a2;
  v5 = CGColorSpaceCreateWithName(v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[0] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[1] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "blurMaskTopLocation");
  locations[0] = v9;
  locations[1] = 1.0;
  v10 = CGGradientCreateWithColors(v5, v8, locations);
  v11 = (CGContext *)objc_msgSend(v4, "CGContext");

  v15.y = *(CGFloat *)(a1 + 40);
  v14.x = 0.0;
  v14.y = 0.0;
  v15.x = 0.0;
  CGContextDrawLinearGradient(v11, v10, v14, v15, 2u);
  CGGradientRelease(v10);
  CGColorSpaceRelease(v5);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
