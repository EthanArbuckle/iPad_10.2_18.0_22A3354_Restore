@implementation UIKeyboardPathEffectView

- (UIKeyboardPathEffectView)initWithFrame:(CGRect)a3
{
  UIKeyboardPathEffectView *v3;
  UIKeyboardPathEffectView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UIKBHandwritingQuadCurvePointFIFO *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardPathEffectView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDrawsAsynchronously:", 1);

    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[UIKeyboardPathEffectView setIncreasedContrastEnabled:](v4, "setIncreasedContrastEnabled:", _AXDarkenSystemColors() != 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIKeyboardPathEffectView setPaths:](v4, "setPaths:", v8);

    objc_initWeak(&location, v4);
    v9 = -[UIKBHandwritingQuadCurvePointFIFO initWithFIFO:scale:]([UIKBHandwritingQuadCurvePointFIFO alloc], "initWithFIFO:scale:", 0, 1.0);
    -[UIKeyboardPathEffectView setPointInterpolator:](v4, "setPointInterpolator:", v9);

    v14 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v15, &location);
    -[UIKeyboardPathEffectView pointInterpolator](v4, "pointInterpolator", v14, 3221225472, __42__UIKeyboardPathEffectView_initWithFrame___block_invoke, &unk_1E16D91F0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEmissionHandler:", &v14);

    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[UIKeyboardPathEffectView setPointDecayQueue:](v4, "setPointDecayQueue:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_accessibilityValueChanged_, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__UIKeyboardPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "UIKBHandwritingPointValue");
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

- (int)textEffectsVisibilityLevel
{
  return 210;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C99860];
    objc_msgSend(v4, "removeFromRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);

  }
  else
  {
    v6 = *MEMORY[0x1E0C99860];
  }
  -[UIView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardPathEffectView setPointDecayDisplayLink:](self, "setPointDecayDisplayLink:", v9);

  -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPaused:", 1);

  -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addToRunLoop:forMode:", v11, v6);

}

- (id)_pushNewPath
{
  _PointQueue *v3;
  void *v4;

  v3 = objc_alloc_init(_PointQueue);
  -[UIKeyboardPathEffectView paths](self, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (id)_currentPath
{
  void *v2;
  void *v3;

  -[UIKeyboardPathEffectView paths](self, "paths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_displayLinkFired:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  double Current;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id obja;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardPathEffectView paths](self, "paths", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4
    && (v4 != 1
     || (-[UIKeyboardPathEffectView _currentPath](self, "_currentPath"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "nonSentinelPoints"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "count"),
         v6,
         v5,
         v7)))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[UIKeyboardPathEffectView paths](self, "paths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v12, "nonSentinelPoints");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14)
          {
            v15 = objc_msgSend(v12, "effectiveStartIndexBasedOnLength");
            Current = CFAbsoluteTimeGetCurrent();
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "nonSentinelPoints");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            v20 = v15;
            if (v15 < v19)
            {
              while (1)
              {
                objc_msgSend(v12, "nonSentinelPoints");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndex:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v22)
                  break;
                objc_msgSend(v22, "absoluteTime");
                v24 = Current - v23;
                if (v24 <= 0.7)
                  goto LABEL_15;
                objc_msgSend(v17, "addIndex:", v20);
LABEL_16:

                if (v19 == ++v20)
                  goto LABEL_17;
              }
              v24 = 0.0;
LABEL_15:
              objc_msgSend(v22, "setDecay:", v24 / 0.7);
              goto LABEL_16;
            }
LABEL_17:
            objc_msgSend(v17, "addIndexesInRange:", 0, v15);
            objc_msgSend(v12, "nonSentinelPoints");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObjectsAtIndexes:", v17);

          }
          else
          {
            -[UIKeyboardPathEffectView _currentPath](self, "_currentPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 != v26)
              objc_msgSend(v29, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v9);
    }

    -[UIKeyboardPathEffectView paths](self, "paths");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObjectsInArray:", v28);

    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
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
  _PathPoint *v14;
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
  -[UIKeyboardPathEffectView _currentPath](self, "_currentPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[UIKeyboardPathEffectView _pushNewPath](self, "_pushNewPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v11;
  objc_msgSend(v11, "nonSentinelPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(_PathPoint);
  -[_PathPoint setPoint:](v14, "setPoint:", x, y);
  -[_PathPoint setForce:](v14, "setForce:", a4);
  -[_PathPoint setRelativeTime:](v14, "setRelativeTime:", Current - self->_startTime);
  -[_PathPoint setAbsoluteTime:](v14, "setAbsoluteTime:", Current);
  -[_PathPoint setSentinelPoint:](v14, "setSentinelPoint:", v5);
  -[_PathPoint setLength:](v14, "setLength:", 0.0);
  if (v13 && !v5)
  {
    objc_msgSend(v13, "point");
    v17 = hypot(x - v15, y - v16);
    objc_msgSend(v13, "length");
    -[_PathPoint setLength:](v14, "setLength:", v17 + v18);
  }
  if (!v5)
  {
    objc_msgSend(v21, "nonSentinelPoints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v14);

  }
  -[UIKeyboardPathEffectView pointDecayDisplayLink](self, "pointDecayDisplayLink");
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
  -[UIKeyboardPathEffectView pointInterpolator](self, "pointInterpolator", a3.x, a3.y, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPoint:", x, y, 1.0);

}

- (void)_clearPointInterpolators
{
  id v2;

  -[UIKeyboardPathEffectView pointInterpolator](self, "pointInterpolator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (void)buildOut
{
  id v3;

  self->_done = 1;
  -[UIKeyboardPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
  v3 = -[UIKeyboardPathEffectView _pushNewPath](self, "_pushNewPath");
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
  -[UIKeyboardPathEffectView _clearPointInterpolators](self, "_clearPointInterpolators");
}

- (int64_t)keyboardAppearance
{
  void *v2;
  void *v3;
  int64_t v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardAppearance");

  return v4;
}

- (void)accessibilityValueChanged:(id)a3
{
  self->_increasedContrastEnabled = _AXDarkenSystemColors() != 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v3 = -[UIKeyboardPathEffectView keyboardAppearance](self, "keyboardAppearance") == 1;
  v4 = dbl_1866819F0[v3];
  if (self->_increasedContrastEnabled)
    v5 = 0.69;
  else
    v5 = 1.0;
  v6 = dbl_186681A00[v3];
  if (!self->_increasedContrastEnabled)
    v4 = 0.67;
  v7 = 0.635;
  if (self->_increasedContrastEnabled)
    v7 = dbl_186681A00[v3];
  else
    v6 = 0.619;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v7;
  result.var0 = v6;
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
  _QWORD *ContextStack;
  CGContext *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  unint64_t v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardPathEffectView _currentThemeSettings](self, "_currentThemeSettings", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v13 = 0;
  else
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetRGBStrokeColor(v13, v5, v7, v9, v11);
  CGContextSetLineCap(v13, kCGLineCapRound);
  CGContextSetLineJoin(v13, kCGLineJoinRound);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[UIKeyboardPathEffectView paths](self, "paths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    do
    {
      v17 = 0;
      v41 = v15;
      do
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v17);
        objc_msgSend(v18, "nonSentinelPoints", v41);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20 >= 2)
        {
          v21 = objc_msgSend(v18, "effectiveStartIndexBasedOnLength");
          objc_msgSend(v18, "nonSentinelPoints");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndex:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "point");
          v25 = v24;
          objc_msgSend(v23, "point");
          CGContextMoveToPoint(v13, v25, v26);
          v27 = v21 + 1;
          if (v21 + 1 < v20)
          {
            v28 = (double)(v20 - v21);
            v29 = (double)v21;
            do
            {
              objc_msgSend(v18, "nonSentinelPoints");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectAtIndex:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "decay");
              v33 = 19.7 - (1.0 - ((double)v27 - (v32 * v28 + v29)) / v28) * 19.7;
              if (v33 > 0.0)
              {
                CGContextSetLineWidth(v13, v33);
                objc_msgSend(v31, "point");
                v35 = v34;
                objc_msgSend(v31, "point");
                CGContextAddLineToPoint(v13, v35, v36);
                CGContextStrokePath(v13);
              }
              objc_msgSend(v31, "point");
              v38 = v37;
              objc_msgSend(v31, "point");
              CGContextMoveToPoint(v13, v38, v39);
              if (v27 + 3 < v20 || v27 == v20 - 1)
                v27 += 3;
              else
                v27 = v20 - 1;

            }
            while (v27 < v20);
          }

          v15 = v41;
        }
        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v15);
  }

}

- (UIKBHandwritingQuadCurvePointFIFO)pointInterpolator
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

@end
