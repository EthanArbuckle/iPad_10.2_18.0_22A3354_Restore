@implementation CACDictationRecognizerModeOverlayView

- (CACDictationRecognizerModeOverlayView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACDictationRecognizerModeOverlayView;
  return -[CACDictationRecognizerModeOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageRect:(CGRect)a3
{
  -[CACDictationRecognizerModeOverlayView setImageRect:withColor:](self, "setImageRect:withColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageRect:(CGRect)a3 withColor:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(self->_imageRect, v11))
  {
    self->_imageRect.origin.x = x;
    self->_imageRect.origin.y = y;
    self->_imageRect.size.width = width;
    self->_imageRect.size.height = height;
    objc_storeStrong((id *)&self->_tintColor, a4);
    -[CACDictationRecognizerModeOverlayView _updateOverlayImage](self, "_updateOverlayImage");
  }

}

- (void)setDictationRecognizerMode:(int)a3
{
  if (self->_dictationRecognizerMode != a3)
  {
    self->_dictationRecognizerMode = a3;
    -[CACDictationRecognizerModeOverlayView _updateOverlayImage](self, "_updateOverlayImage");
  }
}

- (id)_createInvertedMaskedImage:(id)a3 withColor:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGImage *v11;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  CGImage *v18;
  void *v19;
  id v20;
  CGImage *v21;
  CGImage *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v28;

  v5 = (objc_class *)MEMORY[0x24BDBF660];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithImage:", v7);
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorInvert"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, *MEMORY[0x24BDBF960]);
  objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extent");
  v11 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v10);

  Width = CGImageGetWidth(v11);
  Height = CGImageGetHeight(v11);
  BitsPerComponent = CGImageGetBitsPerComponent(v11);
  BitsPerPixel = CGImageGetBitsPerPixel(v11);
  BytesPerRow = CGImageGetBytesPerRow(v11);
  DataProvider = CGImageGetDataProvider(v11);
  v18 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 1);
  objc_msgSend(v7, "_flatImageWithColor:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  v21 = (CGImage *)objc_msgSend(v20, "CGImage");

  v22 = CGImageCreateWithMask(v21, v18);
  CGImageRelease(v18);
  v23 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v7, "scale");
  v25 = v24;

  objc_msgSend(v23, "imageWithCGImage:scale:orientation:", v22, 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v22);

  return v26;
}

- (void)_updateOverlayImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CACDictationRecognizerModeOverlayView__updateOverlayImage__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__CACDictationRecognizerModeOverlayView__updateOverlayImage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "removeFromSuperview");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");

  objc_msgSend(*(id *)(a1 + 32), "frame");
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(*(id *)(a1 + 32), "_addIconContrasted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_addIconContrasted:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (void)_addIconContrasted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CGRect *p_imageRect;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v3 = a3;
  v43[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  -[CACDictationRecognizerModeOverlayView addSubview:](self, "addSubview:", v5);
  v6 = objc_alloc(MEMORY[0x24BEBD668]);
  -[CACDictationRecognizerModeOverlayView _imageForCurrentDictiationRecognizerMode](self, "_imageForCurrentDictiationRecognizerMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setContentMode:", 0);
  p_imageRect = &self->_imageRect;
  objc_msgSend(v8, "setOrigin:", self->_imageRect.origin.x, self->_imageRect.origin.y);
  v42 = v8;
  objc_msgSend(v5, "addSubview:", v8);
  if (v3)
  {
    +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_opt_new();
  }
  v11 = v10;
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCaptureOnly:", 0);

  v13 = *MEMORY[0x24BDE5BF8];
  objc_msgSend(v11, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompositingFilter:", v13);

  objc_msgSend(v5, "addSubview:", v11);
  -[CACDictationRecognizerModeOverlayView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsGroupBlending:", 0);

  -[CACDictationRecognizerModeOverlayView _imageForCurrentDictiationRecognizerMode](self, "_imageForCurrentDictiationRecognizerMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v16, "_flatImageWithColor:", v17);
  else
    -[CACDictationRecognizerModeOverlayView _createInvertedMaskedImage:withColor:](self, "_createInvertedMaskedImage:withColor:", v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v18;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v18);
  objc_msgSend(v19, "setContentMode:", 0);
  objc_msgSend(v19, "setOrigin:", p_imageRect->origin.x, p_imageRect->origin.y);
  if (v3)
  {
    objc_msgSend(v19, "frame");
    objc_msgSend(v19, "setFrame:", CACCGRectIncreasedByPercentage(v20, v21, v22, v23, 0.08));
  }
  objc_msgSend(v5, "addSubview:", v19);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  objc_msgSend(v11, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v24;
  objc_msgSend(v11, "leadingAnchor");
  v25 = v11;
  v36 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 0.0);
  v38 = v5;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v28;
  objc_msgSend(v25, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v32);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v33);
}

- (id)_imageForCurrentDictiationRecognizerMode
{
  __CFString *v2;
  void *v3;
  void *v4;

  v2 = 0;
  switch(self->_dictationRecognizerMode)
  {
    case 0:
      return v2;
    case 1:
      v2 = CFSTR("dication-mode-commandsonly");
      goto LABEL_5;
    case 2:
      v2 = CFSTR("dication-mode-numerical");
      goto LABEL_5;
    case 3:
      v2 = CFSTR("dication-mode-alphabetical");
      goto LABEL_5;
    default:
LABEL_5:
      v3 = (void *)MEMORY[0x24BEBD640];
      -[CACDictationRecognizerModeOverlayView imageBundle](self, "imageBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageNamed:inBundle:", v2, v4);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v2;
  }
}

- (id)imageBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CACDictationRecognizerModeOverlayView_imageBundle__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (imageBundle_onceToken_1 != -1)
    dispatch_once(&imageBundle_onceToken_1, block);
  return (id)imageBundle_sImageBundle_1;
}

void __52__CACDictationRecognizerModeOverlayView_imageBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageBundle_sImageBundle_1;
  imageBundle_sImageBundle_1 = v0;

}

- (CGRect)boundsForLastReload
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundsForLastReload.origin.x;
  y = self->_boundsForLastReload.origin.y;
  width = self->_boundsForLastReload.size.width;
  height = self->_boundsForLastReload.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundsForLastReload:(CGRect)a3
{
  self->_boundsForLastReload = a3;
}

- (BOOL)didUpdateItems
{
  return self->_didUpdateItems;
}

- (void)setDidUpdateItems:(BOOL)a3
{
  self->_didUpdateItems = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
