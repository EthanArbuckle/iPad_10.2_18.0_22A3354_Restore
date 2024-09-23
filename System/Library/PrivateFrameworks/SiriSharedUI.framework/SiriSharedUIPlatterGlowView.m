@implementation SiriSharedUIPlatterGlowView

- (void)_updateScreenSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  -[SiriSharedUIPlatterGlowView _screen](self, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriSharedUIPlatterGlowView _screen](self, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13.receiver = self;
    v13.super_class = (Class)SiriSharedUIPlatterGlowView;
    -[SiriSharedUIPlatterGlowView setFrame:](&v13, sel_setFrame_, v6, v8, v10, v12);
    -[CALayer setFrame:](self->_colorLayer, "setFrame:", v6, v8, v10, v12);
    -[SUICIntelligentLightLayer setFrame:](self->_noiseLayer, "setFrame:", v6, v8, v10, v12);
    -[_UIIntelligenceSystemLightView setFrame:](self->_systemLightView, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIPlatterGlowView;
  -[SiriSharedUIPlatterGlowView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[SiriSharedUIPlatterGlowView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SiriSharedUIPlatterGlowView _updateScreenSize](self, "_updateScreenSize");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIPlatterGlowView;
  -[SiriSharedUIPlatterGlowView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[SiriSharedUIPlatterGlowView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriSharedUIPlatterGlowView _updateScreenSize](self, "_updateScreenSize");
    -[SiriSharedUIPlatterGlowView _createFadeLayerAnimation](self, "_createFadeLayerAnimation");
  }
  else
  {
    -[SiriSharedUIPlatterGlowView cleanupViewHierarchy](self, "cleanupViewHierarchy");
  }
}

- (void)cleanupViewHierarchy
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SUICIntelligentLightLayer *noiseLayer;
  NSArray *glowLayers;
  _UIIntelligenceSystemLightView *systemLightView;
  CALayer *colorLayer;
  CALayer *edrLayer;
  CAGradientLayer *fadeLayer;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[SUICIntelligentLightLayer invalidate](self->_noiseLayer, "invalidate");
  -[SUICIntelligentLightLayer removeFromSuperlayer](self->_noiseLayer, "removeFromSuperlayer");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[SiriSharedUIPlatterGlowView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v5);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_glowLayers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v12++), "removeFromSuperlayer");
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v10);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SiriSharedUIPlatterGlowView layer](self, "layer", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sublayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18++), "removeFromSuperlayer");
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v16);
  }

  noiseLayer = self->_noiseLayer;
  self->_noiseLayer = 0;

  glowLayers = self->_glowLayers;
  self->_glowLayers = 0;

  systemLightView = self->_systemLightView;
  self->_systemLightView = 0;

  colorLayer = self->_colorLayer;
  self->_colorLayer = 0;

  edrLayer = self->_edrLayer;
  self->_edrLayer = 0;

  fadeLayer = self->_fadeLayer;
  self->_fadeLayer = 0;

  -[SiriSharedUIPlatterGlowView removeFromSuperview](self, "removeFromSuperview");
}

- (SiriSharedUIPlatterGlowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SiriSharedUIPlatterGlowView *v7;
  SiriSharedUIPlatterGlowView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUIPlatterGlowView;
  v7 = -[SiriSharedUIPlatterGlowView initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7)
    -[SiriSharedUIPlatterGlowView _createSiriGlowToPlatter:](v7, "_createSiriGlowToPlatter:", x, y, width, height);
  return v8;
}

- (void)dealloc
{
  SUICIntelligentLightLayer *noiseLayer;
  SUICIntelligentLightLayer *v4;
  objc_super v5;

  noiseLayer = self->_noiseLayer;
  if (noiseLayer)
  {
    -[SUICIntelligentLightLayer invalidate](noiseLayer, "invalidate");
    -[SUICIntelligentLightLayer removeFromSuperlayer](self->_noiseLayer, "removeFromSuperlayer");
    v4 = self->_noiseLayer;
    self->_noiseLayer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SiriSharedUIPlatterGlowView;
  -[SiriSharedUIPlatterGlowView dealloc](&v5, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = -a3.origin.x;
  v9 = -a3.origin.y;
  -[SiriSharedUIPlatterGlowView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v24.receiver = self;
  v24.super_class = (Class)SiriSharedUIPlatterGlowView;
  -[SiriSharedUIPlatterGlowView setFrame:](&v24, sel_setFrame_, v8, v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_glowLayers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15++), "setFrame:", x, y, width, height, (_QWORD)v20);
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }

  -[SiriSharedUIPlatterGlowView frame](self, "frame");
  v17 = fmin(fmax(width + width, height), v16);
  v18 = x - (v17 - width) * 0.5;
  v19 = y - (v17 - height) * 0.5;
  -[CAGradientLayer frame](self->_fadeLayer, "frame");
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v17;
  v28.size.height = v17;
  if (!CGRectEqualToRect(v27, v28))
    -[CAGradientLayer setFrame:](self->_fadeLayer, "setFrame:", v18, v19, v17, v17);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_glowLayers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setBounds:", x, y, width, height, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_setContinuousCornerRadius:(double)a3
{
  NSArray *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_glowLayers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setCornerRadius:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_createILLayerWithPalette:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = objc_alloc_init(MEMORY[0x1E0DA7A30]);
  -[SiriSharedUIPlatterGlowView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SiriSharedUIPlatterGlowView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "setFrame:", v9, v11, v13, v15);
  }
  objc_msgSend(v5, "setColorPalette:", a3);
  objc_msgSend(v5, "setMasksToBounds:", 0);
  return v5;
}

- (void)_createSiriGlowToPlatter:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _UIIntelligenceSystemLightView *v17;
  _UIIntelligenceSystemLightView *systemLightView;
  CALayer *v19;
  CALayer *colorLayer;
  SUICIntelligentLightLayer *v21;
  SUICIntelligentLightLayer *noiseLayer;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  CALayer *v31;
  void *v32;
  id v33;
  double v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  double v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  double v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  double v52;
  CAGradientLayer *v53;
  CAGradientLayer *fadeLayer;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  NSArray *v60;
  NSArray *glowLayers;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  char v67[80];
  _QWORD v68[3];
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[SiriSharedUIPlatterGlowView setFrame:](self, "setFrame:", x, y, width, height);
  -[SiriSharedUIPlatterGlowView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v66 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v66, "setName:", CFSTR("SiriPlatterGlowMask"));
  objc_msgSend(v66, "setAllowsHitTesting:", 0);
  v65 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v65, "setName:", CFSTR("RoundRectMask"));
  objc_msgSend(v65, "setAllowsHitTesting:", 0);
  v17 = (_UIIntelligenceSystemLightView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4238]), "initWithFrame:preferringAudioReactivity:", 0, v10, v12, v14, v16);
  systemLightView = self->_systemLightView;
  self->_systemLightView = v17;

  -[_UIIntelligenceSystemLightView layer](self->_systemLightView, "layer");
  v19 = (CALayer *)objc_claimAutoreleasedReturnValue();
  colorLayer = self->_colorLayer;
  self->_colorLayer = v19;

  -[SiriSharedUIPlatterGlowView _createILLayerWithPalette:](self, "_createILLayerWithPalette:", 500);
  v21 = (SUICIntelligentLightLayer *)objc_claimAutoreleasedReturnValue();
  noiseLayer = self->_noiseLayer;
  self->_noiseLayer = v21;

  -[SUICIntelligentLightLayer setPaused:](self->_noiseLayer, "setPaused:", 0);
  v23 = *MEMORY[0x1E0CD2C88];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CD2D90];
  objc_msgSend(v24, "setValue:forKey:", &unk_1EA8ADA58, *MEMORY[0x1E0CD2D90]);
  v28 = v25;
  v63 = v25;
  objc_msgSend(v25, "setValue:forKey:", &unk_1EA8ADA70, v27);
  v62 = v26;
  objc_msgSend(v26, "setValue:forKey:", &unk_1EA8ADA88, v27);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB3B18];
  CAColorMatrixMakeMultiplyColor();
  objc_msgSend(v29, "valueWithCAColorMatrix:", v67);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setValue:forKey:", v30, *MEMORY[0x1E0CD2D20]);

  objc_msgSend(v64, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2CA8]);
  v31 = self->_colorLayer;
  v72[0] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setFilters:](v31, "setFilters:", v32);

  v33 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v33, "setName:", CFSTR("RoundRect-BlurLarge"));
  objc_msgSend(v33, "setFrame:", x, y, width, height);
  objc_msgSend(v33, "setMasksToBounds:", 0);
  objc_msgSend(v33, "setAllowsHitTesting:", 0);
  objc_msgSend(v33, "setCornerRadius:", 25.0);
  objc_msgSend(v33, "setBorderWidth:", 10.0);
  objc_msgSend(v33, "borderWidth");
  objc_msgSend(v33, "setBorderOffset:", v34 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "setBorderColor:", objc_msgSend(v36, "CGColor"));

  v71 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFilters:", v37);

  v38 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v38, "setName:", CFSTR("RoundRect-BlurMedium"));
  objc_msgSend(v38, "setFrame:", x, y, width, height);
  objc_msgSend(v38, "setMasksToBounds:", 0);
  objc_msgSend(v38, "setAllowsHitTesting:", 0);
  objc_msgSend(v38, "setCornerRadius:", 25.0);
  objc_msgSend(v38, "setBorderWidth:", 4.0);
  objc_msgSend(v38, "borderWidth");
  objc_msgSend(v38, "setBorderOffset:", v39 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v38, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v38, "setBorderColor:", objc_msgSend(v41, "CGColor"));

  v70 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFilters:", v42);

  v43 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v43, "setName:", CFSTR("RoundRect-BlurSmall"));
  objc_msgSend(v43, "setFrame:", x, y, width, height);
  objc_msgSend(v43, "setMasksToBounds:", 0);
  objc_msgSend(v43, "setAllowsHitTesting:", 0);
  objc_msgSend(v43, "setCornerRadius:", 25.0);
  objc_msgSend(v43, "setBorderWidth:", 3.0);
  objc_msgSend(v43, "borderWidth");
  objc_msgSend(v43, "setBorderOffset:", v44 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.05);
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v43, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v43, "setBorderColor:", objc_msgSend(v46, "CGColor"));

  v69 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFilters:", v47);

  v48 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v48, "setName:", CFSTR("RoundRect-Inside"));
  objc_msgSend(v48, "setFrame:", x, y, width, height);
  objc_msgSend(v48, "setMasksToBounds:", 0);
  objc_msgSend(v48, "setAllowsHitTesting:", 0);
  objc_msgSend(v48, "setCornerRadius:", 25.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v48, "setBackgroundColor:", objc_msgSend(v49, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", &unk_1EA8ADB38);
  objc_msgSend(v50, "setToValue:", &unk_1EA8ADB48);
  objc_msgSend(v50, "setDuration:", 2.3);
  objc_msgSend(v50, "setBeginTime:", CACurrentMediaTime() + 1.0);
  objc_msgSend(v50, "setRemovedOnCompletion:", 0);
  objc_msgSend(v50, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTimingFunction:", v51);

  objc_msgSend(v48, "addAnimation:forKey:", v50, CFSTR("opacityAnimation"));
  -[CALayer setAllowsGroupBlending:](self->_colorLayer, "setAllowsGroupBlending:", 0);
  LODWORD(v52) = 5.0;
  -[CALayer setGain:](self->_colorLayer, "setGain:", v52);
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v53 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  fadeLayer = self->_fadeLayer;
  self->_fadeLayer = v53;

  -[CAGradientLayer setName:](self->_fadeLayer, "setName:", CFSTR("Fade In/Out Mask Layer"));
  -[CAGradientLayer setFrame:](self->_fadeLayer, "setFrame:", x, y, width, height);
  -[CAGradientLayer setMasksToBounds:](self->_fadeLayer, "setMasksToBounds:", 0);
  -[CAGradientLayer setAllowsHitTesting:](self->_fadeLayer, "setAllowsHitTesting:", 0);
  -[CAGradientLayer setType:](self->_fadeLayer, "setType:", *MEMORY[0x1E0CD2F58]);
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68[0] = objc_msgSend(v55, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68[1] = objc_msgSend(v56, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68[2] = objc_msgSend(v57, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_fadeLayer, "setColors:", v58);

  -[CAGradientLayer setStartPoint:](self->_fadeLayer, "setStartPoint:", 0.5, 0.5);
  -[CAGradientLayer setEndPoint:](self->_fadeLayer, "setEndPoint:", 1.0, 1.0);
  -[CAGradientLayer setLocations:](self->_fadeLayer, "setLocations:", &unk_1EA8AD9C8);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C48]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setCompositingFilter:](self->_fadeLayer, "setCompositingFilter:", v59);

  objc_msgSend(v66, "addSublayer:", self->_noiseLayer);
  objc_msgSend(v66, "addSublayer:", v65);
  objc_msgSend(v66, "addSublayer:", v48);
  objc_msgSend(v66, "addSublayer:", self->_fadeLayer);
  objc_msgSend(v65, "addSublayer:", v43);
  objc_msgSend(v65, "addSublayer:", v38);
  objc_msgSend(v65, "addSublayer:", v33);
  objc_msgSend(v65, "setCompositingFilter:", *MEMORY[0x1E0CD2E50]);
  -[CALayer setMask:](self->_colorLayer, "setMask:", v66);
  -[SiriSharedUIPlatterGlowView addSubview:](self, "addSubview:", self->_systemLightView);
  -[SiriSharedUIPlatterGlowView _updateScreenSize](self, "_updateScreenSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v43, v38, v33, v48, 0);
  v60 = (NSArray *)objc_claimAutoreleasedReturnValue();
  glowLayers = self->_glowLayers;
  self->_glowLayers = v60;

}

- (void)_createFadeLayerAnimation
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriSharedUIPlatterGlowView frame](self, "frame");
  objc_msgSend(v3, "numberWithDouble:", v4 * 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v5);

  objc_msgSend(v13, "setToValue:", &unk_1EA8ADAA0);
  objc_msgSend(v13, "setDuration:", 2.5);
  v6 = *MEMORY[0x1E0CD3038];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimingFunction:", v7);

  -[CAGradientLayer addAnimation:forKey:](self->_fadeLayer, "addAnimation:forKey:", v13, CFSTR("positonAnimation"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", &unk_1EA8ADB58);
  objc_msgSend(v8, "setToValue:", &unk_1EA8ADB68);
  objc_msgSend(v8, "setDuration:", 2.5);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  v9 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v10);

  -[CAGradientLayer addAnimation:forKey:](self->_fadeLayer, "addAnimation:forKey:", v8, CFSTR("scaleAnimation"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", &unk_1EA8ADA88);
  objc_msgSend(v11, "setToValue:", &unk_1EA8ADAA0);
  objc_msgSend(v11, "setDuration:", 3.0);
  objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime() + 2.0);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(v11, "setFillMode:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v12);

  objc_msgSend(v11, "setDelegate:", self);
  -[CAGradientLayer addAnimation:forKey:](self->_fadeLayer, "addAnimation:forKey:", v11, CFSTR("opacityAnimation"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  CAGradientLayer *fadeLayer;
  id v6;
  void *v7;
  int v8;

  if (a4)
  {
    fadeLayer = self->_fadeLayer;
    v6 = a3;
    -[CAGradientLayer animationForKey:](fadeLayer, "animationForKey:", CFSTR("opacityAnimation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
      -[SiriSharedUIPlatterGlowView removeFromSuperview](self, "removeFromSuperview");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLightView, 0);
  objc_storeStrong((id *)&self->_noiseLayer, 0);
  objc_storeStrong((id *)&self->_fadeLayer, 0);
  objc_storeStrong((id *)&self->_edrLayer, 0);
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_glowLayers, 0);
}

@end
