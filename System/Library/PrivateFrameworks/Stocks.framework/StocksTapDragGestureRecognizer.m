@implementation StocksTapDragGestureRecognizer

- (StocksTapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  StocksTapDragGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StocksTapDragGestureRecognizer;
  result = -[StocksTapDragGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_minimumNumberOfTouches = 1;
    result->_maximumNumberOfTouches = 1;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
  NSMutableSet *touches;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableSet *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  NSTimer *v34;
  NSTimer *touchDelayTimer;
  CGPoint *p_startingPosition;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  NSTimer *v41;
  StocksTapDragGestureRecognizer *v42;
  uint64_t v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;
  CGPoint v57;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = a4;
  if (CGRectEqualToRect(self->_touchableBounds, *MEMORY[0x24BDBF090]))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v44 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          -[StocksTapDragGestureRecognizer view](self, "view", v44);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "locationInView:", v14);
          v57.x = v15;
          v57.y = v16;
          v17 = CGRectContainsPoint(self->_touchableBounds, v57);

          if (v17)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v10);
    }

    v6 = v44;
  }
  touches = self->_touches;
  if (!touches)
  {
    if (objc_msgSend(v7, "count") <= self->_maximumNumberOfTouches)
    {
      v33 = v7;
      v28 = self->_touches;
      self->_touches = v33;
    }
    else
    {
      v26 = v6;
      v27 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v7, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "subarrayWithRange:", 0, self->_maximumNumberOfTouches);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v27;
      v6 = v26;
      objc_msgSend(v30, "setWithArray:", v29);
      v31 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v32 = self->_touches;
      self->_touches = v31;

    }
    if (-[NSMutableSet count](self->_touches, "count") < self->_minimumNumberOfTouches)
      goto LABEL_43;
    if (-[NSMutableSet count](self->_touches, "count") == 1 && self->_requiredPressDelay > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_touchDelayTimerFired_, 0, 0);
      v34 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      touchDelayTimer = self->_touchDelayTimer;
      self->_touchDelayTimer = v34;

      p_startingPosition = &self->_startingPosition;
      -[NSMutableSet anyObject](self->_touches, "anyObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[StocksTapDragGestureRecognizer view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "locationInView:", v38);
      p_startingPosition->x = v39;
      p_startingPosition->y = v40;

      goto LABEL_43;
    }
LABEL_41:
    v42 = self;
    v43 = 1;
    goto LABEL_42;
  }
  if (-[NSMutableSet count](touches, "count") >= self->_maximumNumberOfTouches)
    goto LABEL_43;
  v44 = v6;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        if (-[NSMutableSet count](self->_touches, "count", v44) >= self->_maximumNumberOfTouches)
        {
          -[StocksTapDragGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v25, v45);
        }
        else
        {
          -[NSMutableSet addObject:](self->_touches, "addObject:", v25);
          v22 = 1;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  v41 = self->_touchDelayTimer;
  if (v41)
  {
    -[NSTimer fire](v41, "fire");
    v6 = v44;
    goto LABEL_43;
  }
  v6 = v44;
  if (!-[StocksTapDragGestureRecognizer state](self, "state")
    && -[NSMutableSet count](self->_touches, "count") >= self->_minimumNumberOfTouches)
  {
    goto LABEL_41;
  }
  if ((v22 & 1) != 0 && -[StocksTapDragGestureRecognizer state](self, "state") == 2)
  {
    v42 = self;
    v43 = 2;
LABEL_42:
    -[StocksTapDragGestureRecognizer setState:](v42, "setState:", v43, v44);
  }
LABEL_43:

}

- (void)touchDelayTimerFired:(id)a3
{
  NSTimer *touchDelayTimer;

  -[NSTimer invalidate](self->_touchDelayTimer, "invalidate", a3);
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  -[StocksTapDragGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSTimer *touchDelayTimer;
  double v12;
  NSTimer *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StocksTapDragGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer)
  {
    v12 = vabdd_f64(v10, self->_startingPosition.y);
    if (vabdd_f64(v8, self->_startingPosition.x) > 5.0 || v12 > 5.0)
    {
      -[NSTimer invalidate](touchDelayTimer, "invalidate", v12);
      v14 = self->_touchDelayTimer;
      self->_touchDelayTimer = 0;

    }
  }
  if (-[NSMutableSet intersectsSet:](self->_touches, "intersectsSet:", v15)
    && -[StocksTapDragGestureRecognizer state](self, "state") == 2)
  {
    -[StocksTapDragGestureRecognizer setState:](self, "setState:", 2);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = -[NSMutableSet intersectsSet:](self->_touches, "intersectsSet:", v8);
  v6 = v8;
  if (v5)
  {
    -[NSMutableSet minusSet:](self->_touches, "minusSet:", v8);
    if (-[NSMutableSet count](self->_touches, "count") >= self->_minimumNumberOfTouches)
    {
      v7 = 2;
    }
    else if (self->_touchDelayTimer)
    {
      v7 = 5;
    }
    else
    {
      v7 = 3;
    }
    -[StocksTapDragGestureRecognizer setState:](self, "setState:", v7);
    v6 = v8;
  }

}

- (void)reset
{
  NSMutableSet *touches;
  NSTimer *touchDelayTimer;

  touches = self->_touches;
  self->_touches = 0;

  -[NSTimer invalidate](self->_touchDelayTimer, "invalidate");
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  self->_startingPosition = (CGPoint)*MEMORY[0x24BDBEFB0];
}

- (NSSet)touches
{
  return &self->_touches->super;
}

- (double)requiredPressDelay
{
  return self->_requiredPressDelay;
}

- (void)setRequiredPressDelay:(double)a3
{
  self->_requiredPressDelay = a3;
}

- (unint64_t)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  self->_minimumNumberOfTouches = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (CGRect)touchableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_touchableBounds.origin.x;
  y = self->_touchableBounds.origin.y;
  width = self->_touchableBounds.size.width;
  height = self->_touchableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTouchableBounds:(CGRect)a3
{
  self->_touchableBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
}

@end
