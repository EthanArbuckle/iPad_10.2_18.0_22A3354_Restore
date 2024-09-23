@implementation CACGestureLivePreviewPathEffectView

- (CACGestureLivePreviewPathEffectView)initWithFrame:(CGRect)a3
{
  CACGestureLivePreviewPathEffectView *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CACGestureLivePreviewHandwritingQuadCurvePointFIFO *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CACGestureLivePreviewPathEffectView;
  v3 = -[CACGestureLivePreviewPathEffectView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CACLogGestureRecording();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CACGestureLivePreviewPathEffectView initWithFrame:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    -[CACGestureLivePreviewPathEffectView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[CACGestureLivePreviewPathEffectView layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsHitTesting:", 0);

    -[CACGestureLivePreviewPathEffectView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDrawsAsynchronously:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACGestureLivePreviewPathEffectView setBackgroundColor:](v3, "setBackgroundColor:", v14);

    -[CACGestureLivePreviewPathEffectView setIncreasedContrastEnabled:](v3, "setIncreasedContrastEnabled:", UIAccessibilityDarkerSystemColorsEnabled());
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CACGestureLivePreviewPathEffectView setPaths:](v3, "setPaths:", v15);

    objc_initWeak(&location, v3);
    v16 = -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO initWithFIFO:scale:]([CACGestureLivePreviewHandwritingQuadCurvePointFIFO alloc], "initWithFIFO:scale:", 0, 1.0);
    -[CACGestureLivePreviewPathEffectView setPointInterpolator:](v3, "setPointInterpolator:", v16);

    v21 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v22, &location);
    -[CACGestureLivePreviewPathEffectView pointInterpolator](v3, "pointInterpolator", v21, 3221225472, __53__CACGestureLivePreviewPathEffectView_initWithFrame___block_invoke, &unk_24F2AB0B0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEmissionHandler:", &v21);

    v18 = objc_alloc_init(MEMORY[0x24BDD1698]);
    -[CACGestureLivePreviewPathEffectView setPointDecayQueue:](v3, "setPointDecayQueue:", v18);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel_accessibilityValueChanged_, *MEMORY[0x24BEBDDE8], 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __53__CACGestureLivePreviewPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
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

  v21 = *MEMORY[0x24BDAC8D0];
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "CACGestureLivePreviewHandwritingPointValue");
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

- (void)didMoveToWindow
{
  OUTLINED_FUNCTION_0_1(&dword_229A40000, a1, a3, "didMoveToWindow", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (id)_pushNewPath
{
  _CACGesturePointQueue *v3;
  void *v4;

  v3 = objc_alloc_init(_CACGesturePointQueue);
  -[CACGestureLivePreviewPathEffectView paths](self, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (id)_currentPath
{
  void *v2;
  void *v3;

  -[CACGestureLivePreviewPathEffectView paths](self, "paths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_displayLinkFired:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double Current;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CACGestureLivePreviewPathEffectView *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  CACLogGestureRecording();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CACGestureLivePreviewPathEffectView _displayLinkFired:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[CACGestureLivePreviewPathEffectView paths](self, "paths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13
    && (v13 != 1
     || (-[CACGestureLivePreviewPathEffectView _currentPath](self, "_currentPath"),
         v14 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v14, "nonSentinelPoints"),
         v15 = (void *)objc_claimAutoreleasedReturnValue(),
         v16 = objc_msgSend(v15, "count"),
         v15,
         v14,
         v16)))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = self;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[CACGestureLivePreviewPathEffectView paths](self, "paths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v21, "nonSentinelPoints");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23)
          {
            v24 = objc_msgSend(v21, "effectiveStartIndexBasedOnLength");
            Current = CFAbsoluteTimeGetCurrent();
            objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "nonSentinelPoints");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            v29 = v24;
            if (v24 < v28)
            {
              while (1)
              {
                objc_msgSend(v21, "nonSentinelPoints");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectAtIndex:", v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v31)
                  break;
                objc_msgSend(v31, "absoluteTime");
                v33 = Current - v32;
                if (v33 <= 0.3)
                  goto LABEL_17;
                objc_msgSend(v26, "addIndex:", v29);
LABEL_18:

                if (v28 == ++v29)
                  goto LABEL_19;
              }
              v33 = 0.0;
LABEL_17:
              objc_msgSend(v31, "setDecay:", v33 / 0.3);
              goto LABEL_18;
            }
LABEL_19:
            objc_msgSend(v26, "addIndexesInRange:", 0, v24);
            objc_msgSend(v21, "nonSentinelPoints");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "removeObjectsAtIndexes:", v26);

          }
          else
          {
            -[CACGestureLivePreviewPathEffectView _currentPath](v40, "_currentPath");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21 != v35)
              objc_msgSend(v39, "addObject:", v21);
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v18);
    }

    -[CACGestureLivePreviewPathEffectView paths](v40, "paths");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v39;
    objc_msgSend(v39, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObjectsInArray:", v38);

    -[CACGestureLivePreviewPathEffectView setNeedsDisplay](v40, "setNeedsDisplay");
  }
  else
  {
    -[CACGestureLivePreviewPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPaused:", 1);
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
  _CACGesturePathPoint *v14;
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
  -[CACGestureLivePreviewPathEffectView _currentPath](self, "_currentPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[CACGestureLivePreviewPathEffectView _pushNewPath](self, "_pushNewPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v11;
  objc_msgSend(v11, "nonSentinelPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(_CACGesturePathPoint);
  -[_CACGesturePathPoint setPoint:](v14, "setPoint:", x, y);
  -[_CACGesturePathPoint setForce:](v14, "setForce:", a4);
  -[_CACGesturePathPoint setRelativeTime:](v14, "setRelativeTime:", Current - self->_startTime);
  -[_CACGesturePathPoint setAbsoluteTime:](v14, "setAbsoluteTime:", Current);
  -[_CACGesturePathPoint setSentinelPoint:](v14, "setSentinelPoint:", v5);
  -[_CACGesturePathPoint setLength:](v14, "setLength:", 0.0);
  if (v13 && !v5)
  {
    objc_msgSend(v13, "point");
    v17 = CACCGPointDistance(v15, v16, x, y);
    objc_msgSend(v13, "length");
    -[_CACGesturePathPoint setLength:](v14, "setLength:", v17 + v18);
  }
  if (!v5)
  {
    objc_msgSend(v21, "nonSentinelPoints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v14);

  }
  -[CACGestureLivePreviewPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", 0);

}

- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  -[CACGestureLivePreviewPathEffectView pointInterpolator](self, "pointInterpolator", a3.x, a3.y, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPoint:", x, y, 1.0);

}

- (void)_clearPointInterpolators
{
  id v2;

  -[CACGestureLivePreviewPathEffectView pointInterpolator](self, "pointInterpolator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (void)buildOut
{
  id v3;

  self->_done = 1;
  -[CACGestureLivePreviewPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
  v3 = -[CACGestureLivePreviewPathEffectView _pushNewPath](self, "_pushNewPath");
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
  -[CACGestureLivePreviewPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
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
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = CACIsInDarkMode();
  v4 = 0.398;
  if (v3)
    v4 = 0.914;
  v5 = 0.387;
  if (v3)
    v5 = 0.895;
  if (self->_increasedContrastEnabled)
    v6 = 0.69;
  else
    v6 = 1.0;
  if (self->_increasedContrastEnabled)
    v7 = v4;
  else
    v7 = 0.67;
  if (self->_increasedContrastEnabled)
    v8 = v5;
  else
    v8 = 0.635;
  if (self->_increasedContrastEnabled)
    v9 = v5;
  else
    v9 = 0.619;
  CACLogGestureRecording();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218752;
    v16 = v9;
    v17 = 2048;
    v18 = v8;
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v6;
    _os_log_debug_impl(&dword_229A40000, v10, OS_LOG_TYPE_DEBUG, "Picked colors r:%f g:%f b:%f a:%f", (uint8_t *)&v15, 0x2Au);
  }

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGContext *CurrentContext;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  -[CACGestureLivePreviewPathEffectView _currentThemeSettings](self, "_currentThemeSettings", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBStrokeColor(CurrentContext, v5, v7, v9, v11);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CACGestureLivePreviewPathEffectView paths](self, "paths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    v38 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      v39 = v14;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
        objc_msgSend(v17, "nonSentinelPoints");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 >= 2)
        {
          v20 = objc_msgSend(v17, "effectiveStartIndexBasedOnLength");
          objc_msgSend(v17, "nonSentinelPoints");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "point");
          v24 = v23;
          objc_msgSend(v22, "point");
          CGContextMoveToPoint(CurrentContext, v24, v25);
          v26 = v20 + 1;
          while (v26 < v19)
          {
            objc_msgSend(v17, "nonSentinelPoints");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndex:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "decay");
            v30 = 1.0 - v29;
            if ((double)(v26 - v20) / (double)(v19 - v20) < v30)
              v30 = (double)(v26 - v20) / (double)(v19 - v20);
            CGContextSetLineWidth(CurrentContext, (1.0 - v30) * -62.1 + 69.0);
            objc_msgSend(v28, "point");
            v32 = v31;
            objc_msgSend(v28, "point");
            CGContextAddLineToPoint(CurrentContext, v32, v33);
            CGContextStrokePath(CurrentContext);
            objc_msgSend(v28, "point");
            v35 = v34;
            objc_msgSend(v28, "point");
            CGContextMoveToPoint(CurrentContext, v35, v36);
            if (v26 + 3 < v19 || v26 == v19 - 1)
              v26 += 3;
            else
              v26 = v19 - 1;

          }
          v15 = v38;
          v14 = v39;
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v14);
  }

}

- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)pointInterpolator
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointDecayDisplayLink, 0);
  objc_storeStrong((id *)&self->_pointDecayQueue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_pointInterpolator, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_229A40000, a1, a3, "Initialized path effect view", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_displayLinkFired:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_229A40000, a1, a3, "Display link fired", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
