@implementation PBUIBokehWallpaperView

- (void)_updateGradientAndFillColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("bokehVariant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[PBUIBokehColorArbiter bokehColorForVariant:]((uint64_t)PBUIBokehColorArbiter, v4);
  +[PBUIBokehColorArbiter gradientColorsForBokehColor:]((uint64_t)PBUIBokehColorArbiter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__PBUIBokehWallpaperView__updateGradientAndFillColor__block_invoke;
  v20[3] = &unk_1E6B94728;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v20);
  if (v5 != self->_circleFillColor)
  {
    self->_circleFillColor = v5;
    +[PBUIBokehColorArbiter legibilityColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperView updateLegibilitySettingsForAverageColor:](self, "updateLegibilitySettingsForAverageColor:", v7);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_circleArray;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "setColor:", self->_circleFillColor, (_QWORD)v16);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

  }
  -[PBUIBokehWallpaperView layer](self, "layer", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v14)
  {
    -[PBUIBokehWallpaperView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColors:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __53__PBUIBokehWallpaperView__updateGradientAndFillColor__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v2 + 656) || *(_BYTE *)(v2 + 658))
  {
    v3 = *(void **)(v2 + 640);
    *(_QWORD *)(v2 + 640) = 0;

    return objc_msgSend(*(id *)(v1 + 32), "_notifyBlursInvalidated");
  }
  return result;
}

- (int64_t)userInterfaceStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "currentStyle");
  }
  else
  {
    -[PBUIBokehWallpaperView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "userInterfaceStyle");

  }
  return v5;
}

- (void)_initDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  id v7;
  CAFrameRateRange v8;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__screenDidUpdate_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    v8 = CAFrameRateRangeMake(20.0, 60.0, 30.0);
    -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
    v6 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  }
}

- (void)_destroyDisplayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (__IOSurface)_createSnapshotBuffer
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  __IOSurface *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  -[PBUIBokehWallpaperView frame](self, "frame");
  v4 = v3;
  v12[0] = *MEMORY[0x1E0CBC1E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E0CBC008];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = *MEMORY[0x1E0CBC070];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1111970369);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E0CBBF00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = *MEMORY[0x1E0CBBF10];
  v13[3] = v8;
  v13[4] = &unk_1E6BC3550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v10 = IOSurfaceCreate(v9);
  return v10;
}

- (PBUIBokehWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  PBUIBokehWallpaperView *v18;
  PBUIBokehWallpaperView *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *options;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSMutableArray *circleArray;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  objc_super v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PBUIBokehWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v50, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  v19 = v18;
  if (!v18)
    goto LABEL_10;
  -[PBUIBokehWallpaperView layer](v18, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSortsSublayers:", 1);

  v19->_snapshotBuffer = -[PBUIBokehWallpaperView _createSnapshotBuffer](v19, "_createSnapshotBuffer");
  v19->_contentIsVisible = 1;
  -[PBUIBokehWallpaperView _handleVariantChange](v19, "_handleVariantChange");
  objc_msgSend(v17, "proceduralWallpaperOptions");
  v21 = objc_claimAutoreleasedReturnValue();
  options = v19->_options;
  v19->_options = (NSDictionary *)v21;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.springboard")))
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v19, sel__screenDimmed_, CFSTR("SBLockScreenDimmedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v19, sel__screenUndimmed_, CFSTR("SBLockScreenUndimmedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v19, sel__wallpaperDidChange_, CFSTR("SBFWallpaperDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v19, sel__thermalStateDidChange_, *MEMORY[0x1E0CB3050], 0);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

  if (v27)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = objc_claimAutoreleasedReturnValue();
  circleArray = v19->_circleArray;
  v19->_circleArray = (NSMutableArray *)v32;

  -[PBUIBokehWallpaperView _updateGradientAndFillColor](v19, "_updateGradientAndFillColor");
  -[PBUIBokehWallpaperView bounds](v19, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  if (v43 == 1)
  {
    UIRectCenteredRect();
    v35 = v44;
    v37 = v45;
    v39 = v46;
    v41 = v47;
    v48 = v47 / 22.0 * 1.3;
  }
  else
  {
    v48 = v41 / 28.0;
  }
  -[PBUIBokehWallpaperView _addBokehCircles:inBounds:](v19, "_addBokehCircles:inBounds:", (uint64_t)v48, v35, v37, v39, v41);
  -[PBUIWallpaperView setParallaxEnabled:](v19, "setParallaxEnabled:", 0);
  -[PBUIBokehWallpaperView _toggleCircleAnimations:](v19, "_toggleCircleAnimations:", 0);
  -[PBUIBokehWallpaperView setWallpaperAnimationEnabled:](v19, "setWallpaperAnimationEnabled:", 1);
  v19->_blursNeedInvalidation = 1;
LABEL_10:

  return v19;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAGradientLayer)layer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIBokehWallpaperView layer](&v3, sel_layer);
  return (CAGradientLayer *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIWallpaperView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (-[PBUIWallpaperView wallpaperAnimationEnabled](self, "wallpaperAnimationEnabled"))
    -[PBUIBokehWallpaperView setWallpaperAnimationEnabled:](self, "setWallpaperAnimationEnabled:", 1);
}

- (void)_addBokehCircles:(int64_t)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  int64_t v9;
  PBUIBokehWallpaperCircle *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v9 = a3;
    do
    {
      v10 = -[PBUIBokehWallpaperCircle initWithSuperviewBounds:color:]([PBUIBokehWallpaperCircle alloc], "initWithSuperviewBounds:color:", self->_circleFillColor, x, y, width, height);
      -[NSMutableArray addObject:](self->_circleArray, "addObject:", v10);

      --v9;
    }
    while (v9);
  }
  -[PBUIBokehWallpaperView layer](self, "layer", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupBlending:", 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v12 = -[PBUIBokehWallpaperView _lowPowerModeIsEnabled](self, "_lowPowerModeIsEnabled");
  v13 = -[PBUIBokehWallpaperView _thermalStateIsCritical](self, "_thermalStateIsCritical");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_circleArray;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = *MEMORY[0x1E0CD2DD8];
    v19 = v12 || v13;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v21, "randomize", (_QWORD)v23);
        objc_msgSend(v21, "setCompositingFilter:", v18);
        if (v19)
          objc_msgSend(v21, "configureAnimationsWithPhase:", (float)((float)((float)((float)rand() * 4.6566e-10) * 26.0) + 8.0));
        -[PBUIBokehWallpaperView layer](self, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSublayer:", v21);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)_layerIsOutOfBounds:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGPoint v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  objc_msgSend(v3, "superviewBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "size");
  v13 = -v12;
  objc_msgSend(v3, "size");
  v15 = -v14;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v27 = CGRectInset(v26, v13, v15);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  objc_msgSend(v3, "position");
  v21 = v20;
  v23 = v22;

  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v25.x = v21;
  v25.y = v23;
  return !CGRectContainsPoint(v28, v25);
}

- (void)_correctGyroValues:(double *)a3 y:(double *)a4
{
  uint64_t v6;
  double v7;
  double v8;

  v6 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  switch(v6)
  {
    case 4:
      v7 = *a3;
      *a3 = *a4;
      break;
    case 3:
      v8 = *a3;
      *a3 = -*a4;
      goto LABEL_8;
    case 2:
      *a3 = -*a3;
      v7 = *a4;
      break;
    default:
      return;
  }
  v8 = -v7;
LABEL_8:
  *a4 = v8;
}

- (void)_thermalStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PBUIBokehWallpaperView__thermalStateDidChange___block_invoke;
  block[3] = &unk_1E6B94728;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__PBUIBokehWallpaperView__thermalStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thermalState") != 3;

  return objc_msgSend(*(id *)(a1 + 32), "setWallpaperAnimationEnabled:", v3);
}

- (BOOL)_lowPowerModeIsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.springboard")))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLowPowerModeEnabled");

    return v8;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

  if (v6)
    goto LABEL_4;
  return 0;
}

- (BOOL)_thermalStateIsCritical
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.springboard")))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

    if (!v6)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "thermalState") == 3;

  return v8;
}

- (void)setWallpaperAnimationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  UIImage *cachedSnapshotImage;
  UIImage *v11;
  UIImage *v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIWallpaperView setWallpaperAnimationEnabled:](&v13, sel_setWallpaperAnimationEnabled_);
  if (-[PBUIWallpaperView _isVisible](self, "_isVisible"))
  {
    if (self->_contentIsVisible || !v3)
      goto LABEL_9;
  }
  else if (!v3)
  {
LABEL_9:
    if (-[PBUIWallpaperView _isVisible](self, "_isVisible"))
    {
      cachedSnapshotImage = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      -[PBUIBokehWallpaperView snapshotImage](self, "snapshotImage");
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v12 = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = v11;

    }
    if ((((self->_displayLink == 0) ^ v3) & 1) == 0)
    {
      if (self->_blursNeedInvalidation)
      {
        -[PBUIWallpaperView _notifyBlursInvalidated](self, "_notifyBlursInvalidated");
        self->_blursNeedInvalidation = 0;
      }
      if (v3)
      {
        if (self->_contentIsVisible
          && !-[PBUIBokehWallpaperView _lowPowerModeIsEnabled](self, "_lowPowerModeIsEnabled")
          && !-[PBUIBokehWallpaperView _thermalStateIsCritical](self, "_thermalStateIsCritical"))
        {
          -[PBUIBokehWallpaperView _toggleCircleAnimations:](self, "_toggleCircleAnimations:", 1);
          -[PBUIBokehWallpaperView _initDisplayLink](self, "_initDisplayLink");
        }
      }
      else
      {
        -[PBUIBokehWallpaperView _destroyDisplayLink](self, "_destroyDisplayLink");
        -[PBUIBokehWallpaperView _toggleCircleAnimations:](self, "_toggleCircleAnimations:", 0);
      }
    }
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard")))
  {

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

  if ((v9 & 1) == 0)
    goto LABEL_9;
}

- (void)_toggleCircleAnimations:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_circleArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAnimationsEnabled:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateOrientationIfNeeded
{
  size_t Width;
  size_t Height;
  double v5;
  int v6;
  BOOL v7;
  UIImage *cachedSnapshotImage;
  CGRect v10;
  CGRect v11;

  Width = IOSurfaceGetWidth(self->_snapshotBuffer);
  Height = IOSurfaceGetHeight(self->_snapshotBuffer);
  -[PBUIBokehWallpaperView frame](self, "frame");
  v5 = CGRectGetWidth(v10);
  -[PBUIBokehWallpaperView frame](self, "frame");
  v6 = (Width < Height) ^ (v5 < CGRectGetHeight(v11));
  if (Height)
    v7 = Width == 0;
  else
    v7 = 1;
  if (v7 || v6 != 0)
  {
    CFRelease(self->_snapshotBuffer);
    self->_snapshotBuffer = -[PBUIBokehWallpaperView _createSnapshotBuffer](self, "_createSnapshotBuffer");
    cachedSnapshotImage = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = 0;

  }
}

- (void)_handleVariantChange
{
  _BOOL4 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIWallpaperView _handleVariantChange](&v4, sel__handleVariantChange);
  v3 = -[PBUIWallpaperView variant](self, "variant") == 0;
  if (self->_isOnLockScreen != v3)
    self->_isOnLockScreen = v3;
  -[PBUIBokehWallpaperView _updateVariantStatus](self, "_updateVariantStatus");
}

- (void)_screenDidUpdate:(id)a3
{
  id v4;
  UIImage *cachedSnapshotImage;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  UIImage *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PBUIWallpaperView _isVisible](self, "_isVisible"))
  {
    cachedSnapshotImage = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = 0;

    self->_blursNeedInvalidation = 1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.699999988);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_circleArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[PBUIBokehWallpaperView _layerIsOutOfBounds:](self, "_layerIsOutOfBounds:", v11, (_QWORD)v13))
          {
            objc_msgSend(v11, "randomize");
          }
          else
          {
            objc_msgSend(v4, "duration");
            objc_msgSend(v11, "updatePositionWithTime:dx:dy:lockScreen:", self->_isOnLockScreen);
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    if (self->_hasSingleVariant)
    {
      v12 = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      self->_blursNeedInvalidation = 1;
    }
    -[PBUIBokehWallpaperView setWallpaperAnimationEnabled:](self, "setWallpaperAnimationEnabled:", 0);
  }

}

- (void)_wallpaperDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  PBUIWallpaperConfigurationManager *v11;

  v11 = objc_alloc_init(PBUIWallpaperConfigurationManager);
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](v11, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", -[PBUIWallpaperView variant](self, "variant"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proceduralWallpaperOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("bokehVariant"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("bokehVariant"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_options, v5);
    -[PBUIBokehWallpaperView _updateGradientAndFillColor](self, "_updateGradientAndFillColor");
  }

}

- (id)_computeAverageColor
{
  return +[PBUIBokehColorArbiter legibilityColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, self->_circleFillColor);
}

- (void)_screenDimmed:(id)a3
{
  self->_contentIsVisible = 0;
}

- (void)_screenUndimmed:(id)a3
{
  self->_contentIsVisible = 1;
  -[PBUIBokehWallpaperView setWallpaperAnimationEnabled:](self, "setWallpaperAnimationEnabled:", 1);
}

- (void)_updateVariantStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PBUIWallpaperConfigurationManager *v12;

  v12 = objc_alloc_init(PBUIWallpaperConfigurationManager);
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](v12, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proceduralWallpaperOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bokehVariant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](v12, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", 1, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proceduralWallpaperOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("bokehVariant"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", v6);
  if (self->_hasSingleVariant != v11)
    self->_hasSingleVariant = v11;

}

- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  int64_t var7;
  double var3;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _QWORD v33[3];

  v7 = a5;
  v33[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = v11;
  var7 = a4->var7;
  if (var7 == 1)
  {
    v16 = (void *)MEMORY[0x1E0CEAB40];
    v33[0] = v11;
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "traitCollectionWithTraitsFromCollections:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
    goto LABEL_13;
  }
  if (var7)
  {
LABEL_13:
    a4->var3 = 1.79769313e308;
    +[PBUIBokehColorArbiter colorSwatchForBokehColor:]((uint64_t)PBUIBokehColorArbiter, self->_circleFillColor);
    v20 = objc_claimAutoreleasedReturnValue();

    v27.receiver = self;
    v27.super_class = (Class)PBUIBokehWallpaperView;
    v21 = *(_OWORD *)&a4->var2;
    v28 = *(_OWORD *)&a4->var0;
    v29 = v21;
    v22 = *(_OWORD *)&a4->var6;
    v30 = *(_OWORD *)&a4->var4;
    v31 = v22;
    -[PBUIWallpaperView _generateImageFromImage:forBackdropParameters:includeTint:traitCollection:](&v27, sel__generateImageFromImage_forBackdropParameters_includeTint_traitCollection_, v20, &v28, v7, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)v20;
    goto LABEL_16;
  }
  if (a4->var0 == -2
    && a4->var1 == *MEMORY[0x1E0CEBF20]
    && !a4->var2
    && ((var3 = a4->var3, var3 == 1.79769313e308) || var3 == 0.0)
    && a4->var4 == 1.79769313e308
    && a4->var5 == 1.79769313e308
    && a4->var6 == 1.79769313e308)
  {
    -[PBUIBokehWallpaperView snapshotImage](self, "snapshotImage");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PBUIBokehWallpaperView;
    v24 = *(_OWORD *)&a4->var2;
    v28 = *(_OWORD *)&a4->var0;
    v29 = v24;
    v25 = *(_OWORD *)&a4->var6;
    v30 = *(_OWORD *)&a4->var4;
    v31 = v25;
    -[PBUIWallpaperView _generateImageFromImage:forBackdropParameters:includeTint:traitCollection:](&v32, sel__generateImageFromImage_forBackdropParameters_includeTint_traitCollection_, v10, &v28, v7, v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v15;
LABEL_16:

  return v23;
}

- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3
{
  return 0;
}

- (BOOL)isContentStatic
{
  return 0;
}

- (id)snapshotImage
{
  UIImage *cachedSnapshotImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  cachedSnapshotImage = self->_cachedSnapshotImage;
  if (!cachedSnapshotImage)
  {
    -[PBUIBokehWallpaperView _updateOrientationIfNeeded](self, "_updateOrientationIfNeeded");
    v4 = (void *)MEMORY[0x1E0CEA638];
    -[PBUIBokehWallpaperView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pbui_imageSnapshotFromLayer:buffer:", v5, self->_snapshotBuffer);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = v6;

    cachedSnapshotImage = self->_cachedSnapshotImage;
  }
  return cachedSnapshotImage;
}

- (id)cacheGroup
{
  return 0;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5;
  NSDictionary *options;
  void *v7;
  BOOL v8;

  v5 = a3;
  if (objc_msgSend(v5, "wallpaperType") == 2)
  {
    options = self->_options;
    objc_msgSend(v5, "proceduralWallpaperOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSDictionary isEqualToDictionary:](options, "isEqualToDictionary:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)wallpaperType
{
  return 2;
}

+ (BOOL)allowsParallax
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.springboard")))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SBLockScreenDimmedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("SBLockScreenUndimmedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("SBWallpaperDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3050], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3048], 0);

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

  if (v7)
    goto LABEL_4;
LABEL_5:
  CFRelease(self->_snapshotBuffer);
  v13.receiver = self;
  v13.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIWallpaperView dealloc](&v13, sel_dealloc);
}

- (void)invalidate
{
  -[PBUIBokehWallpaperView setWallpaperAnimationEnabled:](self, "setWallpaperAnimationEnabled:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSnapshotImage, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_circleArray, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
