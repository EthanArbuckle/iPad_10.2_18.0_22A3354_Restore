@implementation TUIKeyboardPathEffectView

- (TUIKeyboardPathEffectView)initWithFrame:(CGRect)a3
{
  TUIKeyboardPathEffectView *v3;
  TUIKeyboardPathEffectView *v4;
  void *v5;
  void *v6;
  id v7;
  TUIKBHandwritingQuadCurvePointFIFO *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUIKeyboardPathEffectView;
  v3 = -[TUIKeyboardPathEffectView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUIKeyboardPathEffectView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[TUIKeyboardPathEffectView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyboardPathEffectView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[TUIKeyboardPathEffectView setIncreasedContrastEnabled:](v4, "setIncreasedContrastEnabled:", UIAccessibilityDarkerSystemColorsEnabled());
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyboardPathEffectView setPaths:](v4, "setPaths:", v7);

    objc_initWeak(&location, v4);
    v8 = -[TUIKBHandwritingQuadCurvePointFIFO initWithFIFO:scale:]([TUIKBHandwritingQuadCurvePointFIFO alloc], "initWithFIFO:scale:", 0, 1.0);
    -[TUIKeyboardPathEffectView setPointInterpolator:](v4, "setPointInterpolator:", v8);

    v13 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v14, &location);
    -[TUIKeyboardPathEffectView pointInterpolator](v4, "pointInterpolator", v13, 3221225472, __43__TUIKeyboardPathEffectView_initWithFrame___block_invoke, &unk_1E24FABC8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEmissionHandler:", &v13);

    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[TUIKeyboardPathEffectView setPointDecayQueue:](v4, "setPointDecayQueue:", v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel_accessibilityValueChanged_, *MEMORY[0x1E0DC4508], 0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)createMTKViewIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  if (!-[TUIKeyboardPathEffectView createdMTKView](self, "createdMTKView"))
  {
    -[TUIKeyboardPathEffectView _currentPath](self, "_currentPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nonSentinelPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[TUIKeyboardPathEffectView setCreatedMTKView:](self, "setCreatedMTKView:", 1);
      dispatch_get_global_queue(33, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke;
      block[3] = &unk_1E24FC068;
      block[4] = self;
      dispatch_async(v6, block);

    }
  }
}

- (int)textEffectsVisibilityLevel
{
  return *MEMORY[0x1E0DC54B0];
}

- (void)didMoveToWindow
{
  id v2;

  -[TUIKeyboardPathEffectView renderer](self, "renderer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaused:", 1);

}

- (id)_pushNewPath
{
  _TUIPointQueue *v3;
  void *v4;

  v3 = objc_alloc_init(_TUIPointQueue);
  -[TUIKeyboardPathEffectView paths](self, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (id)_currentPath
{
  void *v2;
  void *v3;

  -[TUIKeyboardPathEffectView paths](self, "paths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updatePaths
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  double Current;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  id obja;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[TUIKeyboardPathEffectView paths](self, "paths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3
    && (v3 != 1
     || (-[TUIKeyboardPathEffectView _currentPath](self, "_currentPath"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v4, "nonSentinelPoints"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = objc_msgSend(v5, "count"),
         v5,
         v4,
         v6)))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[TUIKeyboardPathEffectView paths](self, "paths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v11, "nonSentinelPoints");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v14 = objc_msgSend(v11, "effectiveStartIndexBasedOnLength");
            Current = CFAbsoluteTimeGetCurrent();
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "nonSentinelPoints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            v19 = v14;
            if (v14 < v18)
            {
              while (1)
              {
                objc_msgSend(v11, "nonSentinelPoints");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectAtIndex:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v21)
                  break;
                objc_msgSend(v21, "absoluteTime");
                v23 = Current - v22;
                if (v23 <= 0.7)
                  goto LABEL_15;
                objc_msgSend(v16, "addIndex:", v19);
LABEL_16:

                if (v18 == ++v19)
                  goto LABEL_17;
              }
              v23 = 0.0;
LABEL_15:
              objc_msgSend(v21, "setDecay:", v23 / 0.7);
              goto LABEL_16;
            }
LABEL_17:
            objc_msgSend(v16, "addIndexesInRange:", 0, v14);
            objc_msgSend(v11, "nonSentinelPoints");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObjectsAtIndexes:", v16);

          }
          else
          {
            -[TUIKeyboardPathEffectView _currentPath](self, "_currentPath");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11 != v25)
              objc_msgSend(v28, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }

    -[TUIKeyboardPathEffectView paths](self, "paths");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeObjectsInArray:", v27);

    -[TUIKeyboardPathEffectView setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    -[TUIKeyboardPathEffectView renderer](self, "renderer");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "setPaused:", 1);

  }
}

- (void)_addDrawingPoint:(CGPoint)a3 force:(double)a4 sentinel:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  CFAbsoluteTime Current;
  void *v11;
  void *v12;
  void *v13;
  _TUIPathPoint *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  Current = CFAbsoluteTimeGetCurrent();
  if (self->_startTime == 0.0)
    self->_startTime = Current;
  -[TUIKeyboardPathEffectView _currentPath](self, "_currentPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[TUIKeyboardPathEffectView _pushNewPath](self, "_pushNewPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v11;
  objc_msgSend(v11, "nonSentinelPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(_TUIPathPoint);
  -[_TUIPathPoint setPoint:](v14, "setPoint:", x, y);
  -[_TUIPathPoint setForce:](v14, "setForce:", a4);
  -[_TUIPathPoint setRelativeTime:](v14, "setRelativeTime:", Current - self->_startTime);
  -[_TUIPathPoint setAbsoluteTime:](v14, "setAbsoluteTime:", Current);
  -[_TUIPathPoint setSentinelPoint:](v14, "setSentinelPoint:", v5);
  -[_TUIPathPoint setLength:](v14, "setLength:", 0.0);
  if (v13 && !v5)
  {
    objc_msgSend(v13, "point");
    v17 = hypot(x - v15, y - v16);
    objc_msgSend(v13, "length");
    -[_TUIPathPoint setLength:](v14, "setLength:", v17 + v18);
  }
  if (!v5)
  {
    objc_msgSend(v21, "nonSentinelPoints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v14);

  }
  -[TUIKeyboardPathEffectView renderer](self, "renderer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", 0);

}

- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5
{
  double y;
  double x;
  id v8;

  y = a3.y;
  x = a3.x;
  -[TUIKeyboardPathEffectView createMTKViewIfNecessary](self, "createMTKViewIfNecessary", a3.x, a3.y, a4, a5);
  -[TUIKeyboardPathEffectView pointInterpolator](self, "pointInterpolator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPoint:", x, y, 1.0);

}

- (void)_clearPointInterpolators
{
  id v2;

  -[TUIKeyboardPathEffectView pointInterpolator](self, "pointInterpolator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (void)buildOut
{
  id v3;

  self->_done = 1;
  -[TUIKeyboardPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
  v3 = -[TUIKeyboardPathEffectView _pushNewPath](self, "_pushNewPath");
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
  -[TUIKeyboardPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
}

- (int64_t)keyboardAppearance
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardAppearance");

  return v4;
}

- (void)accessibilityValueChanged:(id)a3
{
  self->_increasedContrastEnabled = UIAccessibilityDarkerSystemColorsEnabled();
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  int64_t v8;
  _BOOL4 increasedContrastEnabled;
  double v10;
  BOOL v11;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (-[TUIKeyboardPathEffectView keyboardAppearance](self, "keyboardAppearance") == 1)
  {
    v3 = !self->_increasedContrastEnabled;
    if (self->_increasedContrastEnabled)
      v4 = 0.69;
    else
      v4 = 1.0;
    v5 = dbl_18C80CD50[!self->_increasedContrastEnabled];
    v6 = dbl_18C80CD60[!self->_increasedContrastEnabled];
    v7 = (double *)&unk_18C80CD70;
LABEL_20:
    v10 = v7[v3];
    goto LABEL_21;
  }
  v8 = -[TUIKeyboardPathEffectView keyboardAppearance](self, "keyboardAppearance");
  increasedContrastEnabled = self->_increasedContrastEnabled;
  if (v8 != 13)
  {
    v11 = !increasedContrastEnabled;
    v3 = !increasedContrastEnabled;
    if (v11)
      v4 = 1.0;
    else
      v4 = 0.69;
    v5 = dbl_18C80CD20[v3];
    v6 = dbl_18C80CD30[v3];
    v7 = (double *)&unk_18C80CD40;
    goto LABEL_20;
  }
  if (self->_increasedContrastEnabled)
    v4 = 0.69;
  else
    v4 = 0.5;
  v6 = 1.0;
  if (self->_increasedContrastEnabled)
    v5 = 0.398;
  else
    v5 = 1.0;
  if (self->_increasedContrastEnabled)
    v6 = 0.387;
  v10 = v6;
LABEL_21:
  result.var3 = v4;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[TUIKeyboardPathEffectView bounds](self, "bounds");
  -[MTKView setFrame:](self->_mtkView, "setFrame:");
  -[TUIKeyboardPathEffectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(MEMORY[0x1E0DC3938], "isKeyboardProcess"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    v10 = fmax(v9, 1.0);
  }
  else
  {
    v10 = 1.4;
  }
  -[MTKView setDrawableSize:](self->_mtkView, "setDrawableSize:", v4 * v10, v6 * v10);
}

- (id)pathsToRender
{
  float64_t v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v6;

  -[TUIKeyboardPathEffectView _currentThemeSettings](self, "_currentThemeSettings");
  v4.f64[1] = v3;
  v6.f64[1] = v5;
  -[TUIKeyboardPathRenderer setPathColor:](self->_renderer, "setPathColor:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v4).i64);
  -[TUIKeyboardPathEffectView updatePaths](self, "updatePaths");
  return (id)-[NSMutableArray copy](self->_paths, "copy");
}

- (TUIKBHandwritingQuadCurvePointFIFO)pointInterpolator
{
  return self->_pointInterpolator;
}

- (void)setPointInterpolator:(id)a3
{
  objc_storeStrong((id *)&self->_pointInterpolator, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (NSMutableIndexSet)pointDecayQueue
{
  return self->_pointDecayQueue;
}

- (void)setPointDecayQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pointDecayQueue, a3);
}

- (CADisplayLink)pointDecayDisplayLink
{
  return self->_pointDecayDisplayLink;
}

- (void)setPointDecayDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_pointDecayDisplayLink, a3);
}

- (TUIKeyboardPathRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (MTKView)mtkView
{
  return self->_mtkView;
}

- (void)setMtkView:(id)a3
{
  objc_storeStrong((id *)&self->_mtkView, a3);
}

- (BOOL)createdMTKView
{
  return self->_createdMTKView;
}

- (void)setCreatedMTKView:(BOOL)a3
{
  self->_createdMTKView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtkView, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_pointDecayDisplayLink, 0);
  objc_storeStrong((id *)&self->_pointDecayQueue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_pointInterpolator, 0);
}

void __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v2 = MTLCreateSystemDefaultDevice();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke_2;
  v4[3] = &unk_1E24FC1F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUIKeyboardPathRenderer *v8;
  void *v9;
  TUIKeyboardPathRenderer *v10;
  void *v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x1E0CC6C50]);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:device:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setMtkView:", v3);

  objc_msgSend(*(id *)(a1 + 32), "mtkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", 0);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "mtkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = [TUIKeyboardPathRenderer alloc];
  objc_msgSend(*(id *)(a1 + 32), "mtkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUIKeyboardPathRenderer initWithMTKView:generatePipelineDescriptors:](v8, "initWithMTKView:generatePipelineDescriptors:", v9, 0);
  objc_msgSend(*(id *)(a1 + 32), "setRenderer:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "renderer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDatasource:", v11);

}

void __43__TUIKeyboardPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = (id *)(a1 + 32);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "TUIKBHandwritingPointValue");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        WeakRetained = objc_loadWeakRetained(v7);
        objc_msgSend(WeakRetained, "_addDrawingPoint:force:sentinel:", 0, v10, v12, v14);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

@end
