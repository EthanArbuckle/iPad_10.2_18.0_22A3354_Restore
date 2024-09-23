@implementation TSDAutoscroll

- (void)dealloc
{
  objc_super v3;

  self->mTarget = 0;
  -[TSDAutoscroll p_cleanup](self, "p_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)TSDAutoscroll;
  -[TSDAutoscroll dealloc](&v3, sel_dealloc);
}

- (void)setTarget:(id)a3
{
  TSDAutoscrollDelegate *mTarget;

  mTarget = self->mTarget;
  if (mTarget != a3)
  {

    self->mTarget = (TSDAutoscrollDelegate *)a3;
  }
}

+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  TSDAutoscroll *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;
  int v36;
  int v37;
  double v38;
  int v39;
  CGFloat MinX;
  char v41;
  uint64_t v42;
  int v43;
  BOOL v44;
  double v45;
  int v46;
  int v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGPoint v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_msgSend(a3, "icc");
  objc_msgSend(v7, "viewScale");
  v9 = 20.0 / v8;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "unscaledStartAutoscrollThreshold");
    v11 = v10;
    objc_msgSend(v7, "viewScale");
    v9 = v11 / v12;
  }
  objc_msgSend(v7, "visibleUnscaledRectForAutoscroll");
  v55 = CGRectInset(v54, v9, v9);
  v13 = v55.origin.x;
  v14 = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  v53.x = x;
  v53.y = y;
  if (CGRectContainsPoint(v55, v53) || !objc_msgSend(v7, "allowAutoscroll"))
    goto LABEL_45;
  if (!objc_msgSend(a3, "autoscroll"))
  {
    v17 = objc_alloc_init(TSDAutoscroll);
    objc_msgSend(a3, "setAutoscroll:", v17);

  }
  v18 = (void *)objc_msgSend((id)objc_msgSend(v7, "canvasView"), "enclosingScrollView");
  objc_msgSend(v7, "contentOffset");
  v52 = v19;
  v51 = v20;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "layerHost"), "canvasView"), "bounds");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "viewScale");
  v49 = TSDMultiplySizeScalar(v22, v24, 1.0 / v25);
  v50 = v26;
  objc_msgSend(v18, "scrollableAreaBounds");
  v28 = v27;
  v30 = v29;
  objc_msgSend(v7, "viewScale");
  v32 = TSDMultiplySizeScalar(v28, v30, 1.0 / v31);
  v34 = v33;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
    v35 = objc_msgSend(a3, "allowedAutoscrollDirections");
  else
    v35 = 15;
  v36 = objc_msgSend(v7, "allowNegativeAutoscroll");
  v37 = v36;
  v38 = v52;
  if (v52 > 0.0)
    v39 = 1;
  else
    v39 = v36;
  if ((v35 & 1) != 0)
  {
    if (v39)
    {
      v56.origin.x = v13;
      v56.origin.y = v14;
      v56.size.width = width;
      v56.size.height = height;
      MinX = CGRectGetMinX(v56);
      v38 = v52;
      if (x < MinX)
      {
        v41 = 0;
        v42 = 1;
LABEL_28:
        v45 = v51;
        goto LABEL_30;
      }
    }
  }
  v42 = 0;
  if (v38 >= 0.0)
    v43 = 1;
  else
    v43 = v37;
  v41 = 1;
  if ((v35 & 2) == 0 || !v43)
    goto LABEL_28;
  v44 = v38 < v49 - v32;
  v45 = v51;
  if (v44)
  {
    v57.origin.x = v13;
    v57.origin.y = v14;
    v57.size.width = width;
    v57.size.height = height;
    if (x >= CGRectGetMaxX(v57))
    {
      v41 = 0;
      v42 = 2;
    }
    else
    {
      v42 = 0;
    }
  }
LABEL_30:
  if (v45 > 0.0)
    v46 = 1;
  else
    v46 = v37;
  if ((v35 & 4) != 0)
  {
    if (v46)
    {
      v58.origin.x = v13;
      v58.origin.y = v14;
      v58.size.width = width;
      v58.size.height = height;
      if (y < CGRectGetMinY(v58))
      {
        v42 = v42 | 4;
        goto LABEL_47;
      }
    }
  }
  if (v45 >= 0.0)
    v47 = 1;
  else
    v47 = v37;
  if ((v35 & 8) != 0)
  {
    if (v47)
    {
      if (v45 < v50 - v34)
      {
        v59.origin.x = v13;
        v59.origin.y = v14;
        v59.size.width = width;
        v59.size.height = height;
        if (y >= CGRectGetMaxY(v59))
        {
          v42 = v42 | 8;
          goto LABEL_47;
        }
      }
    }
  }
  if ((v41 & 1) != 0)
  {
LABEL_45:
    objc_msgSend((id)objc_msgSend(a3, "autoscroll"), "invalidate");
    return;
  }
LABEL_47:
  objc_msgSend((id)objc_msgSend(a3, "autoscroll"), "startAutoscroll:unscaledPoint:directions:repeatInterval:", a3, v42, x, y, 0.035);
  v48 = (void *)objc_msgSend((id)objc_msgSend(v7, "layerHost"), "canvasView");
  objc_msgSend(v7, "convertUnscaledToBoundsPoint:", x, y);
  objc_msgSend(v48, "convertPoint:toView:", 0);
  objc_msgSend(a3, "setAutoscrollPoint:");
}

- (BOOL)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 directions:(int)a5 repeatInterval:(double)a6
{
  uint64_t v7;
  double y;
  double x;
  double v12;
  double v13;
  double v15;
  BOOL v16;
  char v17;
  BOOL v18;
  void *v19;
  NSTimer *mTimer;
  double v21;

  v7 = *(_QWORD *)&a5;
  y = a4.y;
  x = a4.x;
  if (self->mTimer && -[TSDAutoscroll target](self, "target") == a3)
  {
    -[TSDAutoscroll point](self, "point");
    if (v13 == x && v12 == y && -[TSDAutoscroll directions](self, "directions") == (_DWORD)v7)
    {
      -[TSDAutoscroll repeatInterval](self, "repeatInterval");
      if (v15 == a6)
        return 1;
    }
  }
  v17 = objc_opt_respondsToSelector();
  v18 = a6 == 0.0 || (_DWORD)v7 == 0;
  if (v18 || (v17 & 1) == 0)
  {
    -[TSDAutoscroll invalidate](self, "invalidate");
    return 0;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 0.0);
    mTimer = self->mTimer;
    if (mTimer)
    {
      -[NSTimer setFireDate:](mTimer, "setFireDate:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      self->mLastFired = v21;
      self->mTimer = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v19, self, sel_timerFired_, 0, 1, a6);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop"), "addTimer:forMode:", self->mTimer, *MEMORY[0x24BDBCA90]);
    }

    if (-[TSDAutoscroll directions](self, "directions") != (_DWORD)v7)
      -[TSDAutoscroll setCount:](self, "setCount:", 0);
    -[TSDAutoscroll setTarget:](self, "setTarget:", a3);
    -[TSDAutoscroll setPoint:](self, "setPoint:", x, y);
    -[TSDAutoscroll setDirections:](self, "setDirections:", v7);
    -[TSDAutoscroll setRepeatInterval:](self, "setRepeatInterval:", a6);
    v16 = 1;
    -[TSDAutoscroll setActive:](self, "setActive:", 1);
  }
  return v16;
}

- (void)p_cleanup
{
  NSTimer *mTimer;

  mTimer = self->mTimer;
  if (mTimer)
  {
    self->mTimer = 0;
    -[NSTimer invalidate](mTimer, "invalidate");

  }
  -[TSDAutoscrollDelegate autoscrollWillNotStart](-[TSDAutoscroll target](self, "target"), "autoscrollWillNotStart");
  -[TSDAutoscroll setTarget:](self, "setTarget:", 0);
  -[TSDAutoscroll setPoint:](self, "setPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[TSDAutoscroll setDirections:](self, "setDirections:", 0);
  -[TSDAutoscroll setRepeatInterval:](self, "setRepeatInterval:", 0.0);
  -[TSDAutoscroll setActive:](self, "setActive:", 0);
  -[TSDAutoscroll setCount:](self, "setCount:", 0);
}

- (void)invalidate
{
  if (pthread_main_np())
    -[TSDAutoscroll p_cleanup](self, "p_cleanup");
  else
    -[TSDAutoscroll performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
}

- (unint64_t)p_deltaForCount:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t result;

  if (self->mTarget && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = (double)(unint64_t)-[TSDAutoscrollDelegate maximumAutoscrollDeltaForCount:](self->mTarget, "maximumAutoscrollDeltaForCount:", a3);
  else
    v5 = 48.0;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v7 = v6 - self->mLastFired;
  -[TSDAutoscroll repeatInterval](self, "repeatInterval");
  result = (unint64_t)(v5 * (v7 / v8));
  if (a3 <= 0x18)
    return (unint64_t)(float)((float)(1.0 / (float)(26 - a3)) * (float)result);
  return result;
}

- (void)timerFired:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  float v39;
  float v40;
  float v41;
  double v42;
  float v43;
  float v44;
  double v45;
  void *v46;
  CGFloat v47;
  double v48;
  double v49;
  _QWORD v50[6];

  -[TSDAutoscroll setCount:](self, "setCount:", -[TSDAutoscroll count](self, "count", a3) + 1);
  if (-[TSDAutoscroll targetIsAutoscrolling](self, "targetIsAutoscrolling"))
    return;
  v4 = (void *)-[TSDAutoscrollDelegate icc](self->mTarget, "icc");
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "canvasView"), "enclosingScrollView");
  objc_msgSend(v4, "contentOffset");
  v7 = v6;
  v9 = v8;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "layerHost"), "canvasLayer"), "contentInset");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "viewScale");
  v15 = v14;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "layerHost"), "canvasView"), "bounds");
  v16 = 1.0 / v15;
  v19 = TSDMultiplySizeScalar(v17, v18, v16);
  v49 = v20;
  objc_msgSend(v5, "bounds");
  v23 = TSDMultiplySizeScalar(v21, v22, v16);
  v25 = v24;
  v26 = TSDMultiplyPointScalar(v13, v11, v16);
  v28 = v27;
  v29 = -[TSDAutoscroll directions](self, "directions");
  if (self->mTarget)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30 = -[TSDAutoscrollDelegate allowedAutoscrollDirections](self->mTarget, "allowedAutoscrollDirections");
      if ((v29 & ~v30) != 0)
      {
        self->mCount = 0;
        -[TSDAutoscroll setDirections:](self, "setDirections:", v30 & v29);
        v29 = -[TSDAutoscroll directions](self, "directions");
      }
    }
  }
  v31 = -[TSDAutoscroll p_deltaForCount:](self, "p_deltaForCount:", -[TSDAutoscroll count](self, "count"));
  if ((v29 & 1) != 0)
  {
    if (v7 > v26)
    {
      v36 = v7 - (double)v31;
      v37 = v26;
      v35 = fmaxf(v36, v37);
LABEL_12:
      v38 = v35;
      if ((v29 & 4) != 0)
        goto LABEL_13;
LABEL_19:
      if ((v29 & 8) != 0)
      {
        v42 = v49 - v25 + v28;
        if (v9 < v42)
        {
          v43 = v9 + (double)v31;
          v44 = v42;
          v41 = fminf(v43, v44);
          goto LABEL_22;
        }
        v29 = v29 & 0xFFFFFFF7;
      }
LABEL_24:
      v45 = v9;
      if (!(_DWORD)v29)
      {
        -[TSDAutoscroll invalidate](self, "invalidate");
        return;
      }
      goto LABEL_25;
    }
    v29 = v29 & 0xFFFFFFFE;
  }
  else if ((v29 & 2) != 0)
  {
    v32 = v19 - v23 + v26;
    if (v7 < v32)
    {
      v33 = v7 + (double)v31;
      v34 = v32;
      v35 = fminf(v33, v34);
      goto LABEL_12;
    }
    v29 = v29 & 0xFFFFFFFD;
  }
  v38 = v7;
  if ((v29 & 4) == 0)
    goto LABEL_19;
LABEL_13:
  if (v9 <= v28)
  {
    v29 = v29 & 0xFFFFFFFB;
    goto LABEL_24;
  }
  v39 = v9 - (double)v31;
  v40 = v28;
  v41 = fmaxf(v39, v40);
LABEL_22:
  v45 = v41;
LABEL_25:
  -[TSDAutoscroll target](self, "target");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDAutoscroll setTargetIsAutoscrolling:](self, "setTargetIsAutoscrolling:", 1);
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __28__TSDAutoscroll_timerFired___block_invoke;
    v50[3] = &unk_24D82A5C8;
    v50[4] = self;
    v50[5] = v4;
    if ((-[TSDAutoscrollDelegate autoscrollWithDirection:proposedContentOffset:completionBlock:](-[TSDAutoscroll target](self, "target"), "autoscrollWithDirection:proposedContentOffset:completionBlock:", v29, v50, v38, v45) & 1) != 0)return;
    -[TSDAutoscroll setTargetIsAutoscrolling:](self, "setTargetIsAutoscrolling:", 0);
  }
  objc_msgSend(v4, "setContentOffset:animated:", 0, v38, v45);
  v46 = (void *)objc_msgSend(v4, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v46, "interactiveCanvasController:didScrollForAutoscroll:", v4, self);
  self->mLastAutoscrollDelta.x = TSDSubtractPoints(v38, v45, v7);
  self->mLastAutoscrollDelta.y = v47;
  -[TSDAutoscrollDelegate updateAfterAutoscroll:](self->mTarget, "updateAfterAutoscroll:", self);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->mLastFired = v48;
}

uint64_t __28__TSDAutoscroll_timerFired___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setTargetIsAutoscrolling:", 0);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "interactiveCanvasController:didScrollForAutoscroll:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateAfterAutoscroll:");
}

- (TSDAutoscrollDelegate)target
{
  return self->mTarget;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->mPoint.x;
  y = self->mPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
}

- (int)directions
{
  return self->mDirections;
}

- (void)setDirections:(int)a3
{
  self->mDirections = a3;
}

- (double)repeatInterval
{
  return self->mRepeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->mRepeatInterval = a3;
}

- (unint64_t)count
{
  return self->mCount;
}

- (void)setCount:(unint64_t)a3
{
  self->mCount = a3;
}

- (BOOL)active
{
  return self->mActive;
}

- (void)setActive:(BOOL)a3
{
  self->mActive = a3;
}

- (CGPoint)lastAutoscrollDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastAutoscrollDelta.x;
  y = self->mLastAutoscrollDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)targetIsAutoscrolling
{
  return self->mTargetIsAutoscrolling;
}

- (void)setTargetIsAutoscrolling:(BOOL)a3
{
  self->mTargetIsAutoscrolling = a3;
}

@end
