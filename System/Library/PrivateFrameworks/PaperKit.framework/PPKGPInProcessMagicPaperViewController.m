@implementation PPKGPInProcessMagicPaperViewController

+ (void)preload
{
  if (preload_onceToken != -1)
    dispatch_once(&preload_onceToken, &__block_literal_global_3);
}

id __49__PPKGPInProcessMagicPaperViewController_preload__block_invoke()
{
  getGPAppleConnectTokenProviderClass();
  getGPInProcessMagicPaperViewControllerClass();
  return getGPRecipeClass();
}

- (PPKGPInProcessMagicPaperViewController)initWithTokenProvider:(id)a3
{
  id v4;
  PPKGPInProcessMagicPaperViewController *v5;
  PPKGPInProcessMagicPaperViewController *v6;
  void *v7;
  PPKGPAppleConnectAuthenticator *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPKGPInProcessMagicPaperViewController;
  v5 = -[PPKGPInProcessMagicPaperViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[PPKGPInProcessMagicPaperViewController setTokenProvider:](v5, "setTokenProvider:", v4);
    v7 = (void *)objc_msgSend(objc_alloc((Class)getGPInProcessMagicPaperViewControllerClass()), "initForMagicWandDrawingInFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = -[PPKGPAppleConnectAuthenticator initWithTokenProvider:]([PPKGPAppleConnectAuthenticator alloc], "initWithTokenProvider:", v4);
    v9 = (void *)objc_msgSend(objc_alloc((Class)getGPAppleConnectTokenProviderClass()), "initWithAuthenticatingProtocol:", v8);
    objc_msgSend(v7, "setAppleConnectTokenProvider:", v9);

    objc_msgSend(v7, "setDelegate:", v6);
    -[PPKGPInProcessMagicPaperViewController setMagicPaperVC:](v6, "setMagicPaperVC:", v7);

  }
  return v6;
}

- (id)_getOrCreateRecipe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)getGPRecipeClass()), "initWithPromptElements:sourceImage:", MEMORY[0x1E0C9AA60], 0);
    -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecipe:", v4);

  }
  objc_msgSend(v4, "drawOnImageRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v7 = (void *)getGPDrawOnImageRecipeClass_softClass;
    v14 = getGPDrawOnImageRecipeClass_softClass;
    if (!getGPDrawOnImageRecipeClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getGPDrawOnImageRecipeClass_block_invoke;
      v10[3] = &unk_1EA839030;
      v10[4] = &v11;
      __getGPDrawOnImageRecipeClass_block_invoke((uint64_t)v10);
      v7 = (void *)v12[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v11, 8);
    v6 = (void *)objc_msgSend([v8 alloc], "initWithBaseImage:sketchImage:sketchMask:sketchComplexityMeasure:drawOnImageAssignmentOptions:", 0, 0, 0, 1, 1.0);
    objc_msgSend(v4, "setDrawOnImageRecipe:", v6);
  }

  return v4;
}

- (void)viewDidLoad
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PPKGPInProcessMagicPaperViewController;
  -[PPKGPInProcessMagicPaperViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPKGPInProcessMagicPaperViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKGPInProcessMagicPaperViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  objc_msgSend(v4, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKGPInProcessMagicPaperViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  objc_msgSend(v4, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKGPInProcessMagicPaperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v8;
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKGPInProcessMagicPaperViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v13);

  v14 = (void *)objc_opt_new();
  -[PPKGPInProcessMagicPaperViewController setDiscreteUndoManager:](self, "setDiscreteUndoManager:", v14);

}

- (NSData)encodedRecipe
{
  void *v2;
  void *v3;
  void *v4;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setEncodedRecipe:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalMetadata:", v4);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipe:", v6);

}

+ (__CVBuffer)_createPixelBufferFromUIImage:(id)a3 pixelFormat:(unsigned int)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  const __CFDictionary *v18;
  __CVBuffer *v19;
  id v20;
  CGColorSpaceRef DeviceRGB;
  id v22;
  CGColorSpace *v23;
  CVPixelBufferRef v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "CIImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (v22 = objc_retainAutorelease(v5), objc_msgSend(v22, "CGImage"))
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", objc_msgSend(objc_retainAutorelease(v22), "CGImage"))) != 0)
  {
    objc_msgSend(v6, "extent");
    if ((uint64_t)v7 != 512 || (objc_msgSend(v6, "extent"), (uint64_t)v8 != 512))
    {
      objc_msgSend(MEMORY[0x1E0C9DDB8], "lanczosScaleTransformFilter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputImage:", v6);
      objc_msgSend(v6, "extent");
      v11 = v10;
      objc_msgSend(v6, "extent");
      if (v11 >= v12)
        v13 = v11;
      else
        v13 = v12;
      v14 = 512.0 / v13;
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setScale:", v14);
      LODWORD(v15) = 1.0;
      objc_msgSend(v9, "setAspectRatio:", v15);
      objc_msgSend(v9, "outputImage");
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v16;
    }
    v25 = 0;
    v28 = *MEMORY[0x1E0CA8FF0];
    v26 = *MEMORY[0x1E0CBBF10];
    v27 = &unk_1EA8771C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x200uLL, 0x200uLL, a4, v18, &v25))
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
      if (a4 == 1111970369)
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
      else
        DeviceRGB = CGColorSpaceCreateDeviceGray();
      v23 = DeviceRGB;
      if (DeviceRGB)
      {
        objc_msgSend(v20, "render:toCVPixelBuffer:bounds:colorSpace:", v6, v25, DeviceRGB, 0.0, 0.0, 512.0, 512.0);
        CGColorSpaceRelease(v23);
        v19 = v25;
      }
      else
      {
        v19 = 0;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_uiImageFromPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  void *v4;
  void *v5;
  double Width;
  uint64_t v7;
  CGImage *v8;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    Width = (double)CVPixelBufferGetWidth(v3);
    v7 = objc_msgSend(v5, "createCGImage:fromRect:", v4, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(v3));
    if (v7)
    {
      v8 = (CGImage *)v7;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v7);
      v3 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v8);
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)setState:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getGPMagicPaperStateClass_softClass;
  v18 = getGPMagicPaperStateClass_softClass;
  if (!getGPMagicPaperStateClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getGPMagicPaperStateClass_block_invoke;
    v14[3] = &unk_1EA839030;
    v14[4] = &v15;
    __getGPMagicPaperStateClass_block_invoke((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = [v6 alloc];
  objc_msgSend(v4, "frame");
  v12 = (void *)objc_msgSend(v7, "initWithFrame:isEditing:", objc_msgSend(v4, "isEditing"), v8, v9, v10, v11);
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setState:", v12);

}

- (UIImage)sourceImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawOnImageRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v4, "baseImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setSourceImage:(id)a3
{
  void *v4;
  __CVBuffer *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:pixelFormat:](PPKGPInProcessMagicPaperViewController, "_createPixelBufferFromUIImage:pixelFormat:", v8, 1111970369);
  else
    v5 = 0;
  objc_msgSend(v4, "drawOnImageRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseImage:", v5);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipe:", v4);

}

- (UIImage)sketchImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawOnImageRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v4, "sketchImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setSketchImage:(id)a3
{
  id v4;
  __CVBuffer *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:pixelFormat:](PPKGPInProcessMagicPaperViewController, "_createPixelBufferFromUIImage:pixelFormat:", v4, 1111970369);

  objc_msgSend(v8, "drawOnImageRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSketchImage:", v5);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipe:", v8);

}

- (UIImage)sketchMask
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawOnImageRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v4, "sketchMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setSketchMask:(id)a3
{
  id v4;
  __CVBuffer *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:pixelFormat:](PPKGPInProcessMagicPaperViewController, "_createPixelBufferFromUIImage:pixelFormat:", v4, 1278226488);

  objc_msgSend(v8, "drawOnImageRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSketchMask:", v5);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipe:", v8);

}

- (double)sketchComplexityMeasure
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawOnImageRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sketchComplexityMeasure");
  v6 = v5;

  return v6;
}

- (void)setSketchComplexityMeasure:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawOnImageRecipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSketchComplexityMeasure:", a3);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipe:", v7);

}

- (double)magicViewFullHeightForKeyboardScrolling
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0.0;
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "magicViewFullHeightForKeyboardScrolling");
  v7 = v6;

  return v7;
}

- (void)startSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startSelectionWithPath:atPencilLocation:", a3, x, y);

}

- (void)updateSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSelectionWithPath:atPencilLocation:", a3, x, y);

}

- (void)finishSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishSelectionWithPath:atPencilLocation:", a3, x, y);

}

- (id)promptElements
{
  void *v2;
  void *v3;

  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promptElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPromptElements:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController _getOrCreateRecipe](self, "_getOrCreateRecipe");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPromptElements:", v4);

  -[PPKGPInProcessMagicPaperViewController magicPaperVC](self, "magicPaperVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipe:", v6);

}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isTitle == false"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v9, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)getGPPromptElementClass()), "initWithText:", v9);
    objc_msgSend(v8, "setIsTitle:", 1);
    objc_msgSend(v7, "addObject:", v8);

  }
  -[PPKGPInProcessMagicPaperViewController setPromptElements:](self, "setPromptElements:", v7);

}

- (id)suggestions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PPKGPInProcessMagicPaperViewController_suggestions__block_invoke;
  v7[3] = &unk_1EA8394D0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __53__PPKGPInProcessMagicPaperViewController_suggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "needsSuggestableConceptsExtraction"))
  {
    objc_msgSend(v4, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (void)addSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (_QWORD)v14))
        {
          v13 = (void *)objc_msgSend(objc_alloc((Class)getGPPromptElementClass()), "initWithText:", v12);
          objc_msgSend(v13, "setNeedsSuggestableConceptsExtraction:", 1);
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[PPKGPInProcessMagicPaperViewController setPromptElements:](self, "setPromptElements:", v6);
}

- (void)setSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsSuggestableConceptsExtraction == false"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "length", (_QWORD)v16))
        {
          v15 = (void *)objc_msgSend(objc_alloc((Class)getGPPromptElementClass()), "initWithText:", v14);
          objc_msgSend(v15, "setNeedsSuggestableConceptsExtraction:", 1);
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[PPKGPInProcessMagicPaperViewController setPromptElements:](self, "setPromptElements:", v8);
}

- (id)concepts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPKGPInProcessMagicPaperViewController_concepts__block_invoke;
  v7[3] = &unk_1EA8394D0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __50__PPKGPInProcessMagicPaperViewController_concepts__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "needsConceptsExtraction"))
  {
    objc_msgSend(v4, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (void)addConcepts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (_QWORD)v14))
        {
          v13 = (void *)objc_msgSend(objc_alloc((Class)getGPPromptElementClass()), "initWithText:", v12);
          objc_msgSend(v13, "setNeedsConceptsExtraction:", 1);
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[PPKGPInProcessMagicPaperViewController setPromptElements:](self, "setPromptElements:", v6);
}

- (void)setConcepts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PPKGPInProcessMagicPaperViewController promptElements](self, "promptElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsConceptsExtraction == false"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "length", (_QWORD)v16))
        {
          v15 = (void *)objc_msgSend(objc_alloc((Class)getGPPromptElementClass()), "initWithText:", v14);
          objc_msgSend(v15, "setNeedsConceptsExtraction:", 1);
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[PPKGPInProcessMagicPaperViewController setPromptElements:](self, "setPromptElements:", v8);
}

+ (id)decodeRecipeData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  UIImage *v13;
  void *v14;
  UIImage *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getGPGenerationRecipeDataClass_softClass;
  v23 = getGPGenerationRecipeDataClass_softClass;
  if (!getGPGenerationRecipeDataClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getGPGenerationRecipeDataClass_block_invoke;
    v19[3] = &unk_1EA839030;
    v19[4] = &v20;
    __getGPGenerationRecipeDataClass_block_invoke((uint64_t)v19);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithUnderlyingData:", v3);
  objc_msgSend(v7, "getRecipeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("inputDict"));
    objc_msgSend(v7, "getDrawOnImageRecipe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "baseImage"))
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v10, "baseImage"));
        v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIImagePNGRepresentation(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sourceImage"));

      }
      if (objc_msgSend(v10, "sketchImage"))
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v10, "sketchImage"));
        v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIImagePNGRepresentation(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("sketchImage"));

      }
      if (objc_msgSend(v10, "sketchMask"))
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", objc_msgSend(v10, "sketchMask"));
        v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIImagePNGRepresentation(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("sketchMask"));

      }
    }
    v17 = v4;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PPKGPInProcessMagicPaperViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "magicPaperViewController:didGenerateImage:", self, v6);

}

- (void)magicPaperViewControllerDidCancel:(id)a3
{
  id v4;

  -[PPKGPInProcessMagicPaperViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "magicPaperViewControllerDidCancel:", self);

}

- (PPKGPInProcessMagicPaperViewControllerDelegate)delegate
{
  return (PPKGPInProcessMagicPaperViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GPInProcessMagicPaperViewController)magicPaperVC
{
  return self->_magicPaperVC;
}

- (void)setMagicPaperVC:(id)a3
{
  objc_storeStrong((id *)&self->_magicPaperVC, a3);
}

- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider
{
  return (PPKMagicGenerativePlaygroundTokenProvider *)objc_loadWeakRetained((id *)&self->_tokenProvider);
}

- (void)setTokenProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tokenProvider, a3);
}

- (NSUndoManager)discreteUndoManager
{
  return self->_discreteUndoManager;
}

- (void)setDiscreteUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_discreteUndoManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discreteUndoManager, 0);
  objc_destroyWeak((id *)&self->_tokenProvider);
  objc_storeStrong((id *)&self->_magicPaperVC, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
