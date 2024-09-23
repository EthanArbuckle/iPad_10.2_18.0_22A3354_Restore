@implementation BKSwipeGestureRecognizer

- (CGPoint)centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  void *i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGPoint result;

  v4 = a4;
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (!v4 || (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "phase") <= 2)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
          objc_msgSend(v13, "locationInView:", 0);
          objc_msgSend(v14, "convertPoint:toWindow:", 0);
          v16 = v15;
          v18 = v17;

          v9 = v9 + v16;
          v10 = v10 + v18;
          v11 = v11 + 1.0;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
    v19 = 0.0;
    v20 = 0.0;
    if (v11 > 0.0)
    {
      v19 = v9 / v11;
      v20 = v10 / v11;
    }
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
  }

  v21 = v19;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (BKSwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  BKSwipeGestureRecognizer *v4;
  BKSwipeGestureRecognizer *v5;
  NSMutableArray *v6;
  NSMutableArray *touches;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSwipeGestureRecognizer;
  v4 = -[BKSwipeGestureRecognizer initWithTarget:action:](&v9, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumDuration = 0.5;
    v4->_minimumPrimaryMovement = 50.0;
    v4->_maximumPrimaryMovement = 3.40282347e38;
    v4->_minimumSecondaryMovement = 0.0;
    v4->_maximumSecondaryMovement = 200.0;
    v4->_rateOfMinimumMovementDecay = 0.06;
    v4->_rateOfMaximumMovementDecay = 0.02;
    v4->_direction = 1;
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    touches = v5->_touches;
    v5->_touches = v6;

    -[BKSwipeGestureRecognizer setNumberOfTouchesRequired:](v5, "setNumberOfTouchesRequired:", 1);
  }
  return v5;
}

- (CGPoint)startPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSwipeGestureRecognizer view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSwipeGestureRecognizer view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "convertPoint:fromWindow:", 0, self->_startLocation.x, self->_startLocation.y);
  objc_msgSend(v3, "convertPoint:fromView:", 0);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)reset
{
  objc_super v3;

  self->_startLocation = CGPointZero;
  *((_BYTE *)self + 120) &= ~1u;
  -[NSMutableArray removeAllObjects](self->_touches, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)BKSwipeGestureRecognizer;
  -[BKSwipeGestureRecognizer reset](&v3, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id AssociatedObject;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  NSNumber *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = a3;
  v6 = v5;
  if ((*((_BYTE *)self + 120) & 1) == 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          AssociatedObject = objc_getAssociatedObject(v11, &unk_2E47D0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

          if (!v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
            objc_msgSend(v11, "locationInView:", 0);
            objc_msgSend(v14, "convertPoint:toWindow:", 0);
            v16 = v15;
            v18 = v17;

            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v16, v18));
            objc_setAssociatedObject(v11, &unk_2E47D0, v19, (char *)&dword_0 + 1);

          }
          v20 = objc_getAssociatedObject(v11, &unk_2E47D1);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (!v21)
          {
            v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CACurrentMediaTime());
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            objc_setAssociatedObject(v11, &unk_2E47D1, v23, (char *)&dword_0 + 1);

          }
          -[NSMutableArray addObject:](self->_touches, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }
    -[BKSwipeGestureRecognizer centroidOfTouches:excludingEnded:](self, "centroidOfTouches:excludingEnded:", self->_touches, 1);
    self->_startLocation.x = v24;
    self->_startLocation.y = v25;
  }

}

- (BOOL)_checkForSwipeWithDelta:(CGPoint)a3 time:(double)a4
{
  double minimumPrimaryMovement;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double maximumPrimaryMovement;
  double v10;
  double v11;
  double minimumSecondaryMovement;
  double v13;
  double v14;
  double maximumSecondaryMovement;
  double v16;
  double v17;
  unint64_t direction;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v24;
  double v25;
  BOOL v27;

  minimumPrimaryMovement = self->_minimumPrimaryMovement;
  v5 = fmin(a4, 0.5);
  v6 = 1.0 - v5 * (1.0 - self->_rateOfMinimumMovementDecay);
  v7 = minimumPrimaryMovement * v6;
  v8 = minimumPrimaryMovement == 3.40282347e38;
  maximumPrimaryMovement = self->_maximumPrimaryMovement;
  if (v8)
    v7 = 3.40282347e38;
  v10 = 1.0 - v5 * (1.0 - self->_rateOfMaximumMovementDecay);
  if (maximumPrimaryMovement == 3.40282347e38)
    v11 = 3.40282347e38;
  else
    v11 = maximumPrimaryMovement * v10;
  minimumSecondaryMovement = self->_minimumSecondaryMovement;
  v13 = v6 * minimumSecondaryMovement;
  if (minimumSecondaryMovement == 3.40282347e38)
    v14 = 3.40282347e38;
  else
    v14 = v13;
  maximumSecondaryMovement = self->_maximumSecondaryMovement;
  v16 = v10 * maximumSecondaryMovement;
  if (maximumSecondaryMovement == 3.40282347e38)
    v17 = 3.40282347e38;
  else
    v17 = v16;
  direction = self->_direction;
  v19 = direction & 3;
  if (v19 == 1 && a3.x < 0.0)
    goto LABEL_23;
  if (v19 == 2 && a3.x > 0.0)
    goto LABEL_23;
  v20 = direction & 0xC;
  if (v20 == 4 && a3.y > 0.0)
    goto LABEL_23;
  if (v20 == 8 && a3.y < 0.0)
    goto LABEL_23;
  if (v19)
  {
    v21 = fabs(a3.x);
    if (v21 > v11 || (v22 = fabs(a3.y), v22 > v17))
    {
LABEL_23:
      LOBYTE(v19) = 0;
LABEL_24:
      *((_BYTE *)self + 120) |= 1u;
      return v19;
    }
    LOBYTE(v19) = v22 >= v14 && v21 >= v7;
  }
  if (!v20)
    return v19;
  v24 = fabs(a3.y);
  v25 = fabs(a3.x);
  if (v24 > v11 || v25 > v17)
    goto LABEL_24;
  v27 = v24 >= v7;
  if (v25 < v14)
    v27 = 0;
  LOBYTE(v19) = v27 | v19;
  return v19;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  double y;
  NSMutableArray *v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id AssociatedObject;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  double v40;
  BKSwipeGestureRecognizer *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v5 = CACurrentMediaTime();
  if ((unint64_t)-[NSMutableArray count](self->_touches, "count") < self->_numberOfTouchesRequired)
  {
    -[BKSwipeGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  if ((*((_BYTE *)self + 120) & 1) == 0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = self->_touches;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v44;
      y = CGPointZero.y;
      do
      {
        v12 = v6;
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v12);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
          objc_msgSend(v14, "locationInView:", 0);
          objc_msgSend(v15, "convertPoint:toWindow:", 0);
          v17 = v16;
          v19 = v18;

          AssociatedObject = objc_getAssociatedObject(v14, &unk_2E47D0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
          objc_msgSend(v21, "CGPointValue");
          v23 = v17 - v22;
          v25 = v19 - v24;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKSwipeGestureRecognizer view](self, "view"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "window"));

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKSwipeGestureRecognizer view](self, "view"));
            objc_msgSend(v27, "convertPoint:fromWindow:", 0, v23, v25);
            objc_msgSend(v28, "convertPoint:fromView:", 0);
            v30 = v29;
            v32 = v31;

            v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKSwipeGestureRecognizer view](self, "view"));
            objc_msgSend(v27, "convertPoint:fromWindow:", 0, CGPointZero.x, y);
            objc_msgSend(v33, "convertPoint:fromView:", 0);
            v35 = v34;
            v37 = v36;

            v23 = v30 - v35;
            v25 = v32 - v37;
          }
          if (sqrt(v25 * v25 + v23 * v23) > 10.0)
          {
            v38 = objc_getAssociatedObject(v14, &unk_2E47D1);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            objc_msgSend(v39, "doubleValue");
            v9 |= -[BKSwipeGestureRecognizer _checkForSwipeWithDelta:time:](self, "_checkForSwipeWithDelta:time:", v23, v25, v5 - v40);

          }
        }
        v6 = v12;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v8);

      if ((v9 & 1) != 0)
      {
        v41 = self;
        v42 = 3;
LABEL_20:
        -[BKSwipeGestureRecognizer setState:](v41, "setState:", v42);
        return;
      }
    }
    else
    {

    }
    if ((*((_BYTE *)self + 120) & 1) == 0)
      return;
    v41 = self;
    v42 = 5;
    goto LABEL_20;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_setAssociatedObject(v10, &unk_2E47D0, 0, (char *)&dword_0 + 1);
        objc_setAssociatedObject(v10, &unk_2E47D1, 0, (char *)&dword_0 + 1);
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (-[NSMutableArray count](self->_touches, "count"))
    *((_BYTE *)self + 120) |= 1u;
  else
    -[BKSwipeGestureRecognizer setState:](self, "setState:", 5);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_setAssociatedObject(v10, &unk_2E47D0, 0, (char *)&dword_0 + 1);
        objc_setAssociatedObject(v10, &unk_2E47D1, 0, (char *)&dword_0 + 1);
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (-[NSMutableArray count](self->_touches, "count"))
    *((_BYTE *)self + 120) |= 1u;
  else
    -[BKSwipeGestureRecognizer setState:](self, "setState:", 5);

}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "convertPoint:fromWindow:", 0, self->_startLocation.x, self->_startLocation.y);
  objc_msgSend(v4, "convertPoint:fromView:", 0);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (unint64_t)numberOfTouches
{
  return (unint64_t)-[NSMutableArray count](self->_touches, "count");
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  NSMutableArray *touches;
  id v6;
  void *v7;
  id AssociatedObject;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  touches = self->_touches;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](touches, "objectAtIndex:", a3));
  AssociatedObject = objc_getAssociatedObject(v7, &unk_2E47D0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  objc_msgSend(v9, "CGPointValue");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  objc_msgSend(v14, "convertPoint:fromWindow:", 0, v11, v13);
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_appendSubclassDescription:(id)a3
{
  id v4;
  unint64_t numberOfTouchesRequired;
  unint64_t direction;
  int v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  numberOfTouchesRequired = self->_numberOfTouchesRequired;
  v9 = v4;
  if (numberOfTouchesRequired != 1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("; numberOfTouchesRequired = %lu"), numberOfTouchesRequired);
    v4 = v9;
  }
  if (self->_direction)
  {
    objc_msgSend(v4, "appendString:", CFSTR("; direction = "));
    direction = self->_direction;
    if ((direction & 1) != 0)
    {
      objc_msgSend(v9, "appendString:", CFSTR("right"));
      v8 = self->_direction;
      if ((v8 & 2) == 0)
      {
        if ((v8 & 4) == 0)
          goto LABEL_16;
        goto LABEL_11;
      }
      objc_msgSend(v9, "appendString:", CFSTR(","));
    }
    else if ((direction & 2) == 0)
    {
      v4 = v9;
      if ((direction & 4) == 0)
      {
        v7 = 0;
        if ((direction & 8) == 0)
          goto LABEL_20;
        goto LABEL_17;
      }
LABEL_12:
      objc_msgSend(v9, "appendString:", CFSTR("up"));
      v4 = v9;
      v7 = 1;
      if ((self->_direction & 8) == 0)
        goto LABEL_20;
LABEL_17:
      if (v7)
        objc_msgSend(v9, "appendString:", CFSTR(","));
      objc_msgSend(v9, "appendString:", CFSTR("down"));
      v4 = v9;
      goto LABEL_20;
    }
    objc_msgSend(v9, "appendString:", CFSTR("left"));
    v8 = self->_direction;
    if ((v8 & 4) == 0)
    {
LABEL_16:
      v7 = 1;
      v4 = v9;
      if ((v8 & 8) == 0)
        goto LABEL_20;
      goto LABEL_17;
    }
LABEL_11:
    objc_msgSend(v9, "appendString:", CFSTR(","));
    goto LABEL_12;
  }
LABEL_20:

}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (double)minimumPrimaryMovement
{
  return self->_minimumPrimaryMovement;
}

- (void)setMinimumPrimaryMovement:(double)a3
{
  self->_minimumPrimaryMovement = a3;
}

- (double)maximumPrimaryMovement
{
  return self->_maximumPrimaryMovement;
}

- (void)setMaximumPrimaryMovement:(double)a3
{
  self->_maximumPrimaryMovement = a3;
}

- (double)minimumSecondaryMovement
{
  return self->_minimumSecondaryMovement;
}

- (void)setMinimumSecondaryMovement:(double)a3
{
  self->_minimumSecondaryMovement = a3;
}

- (double)maximumSecondaryMovement
{
  return self->_maximumSecondaryMovement;
}

- (void)setMaximumSecondaryMovement:(double)a3
{
  self->_maximumSecondaryMovement = a3;
}

- (double)rateOfMinimumMovementDecay
{
  return self->_rateOfMinimumMovementDecay;
}

- (void)setRateOfMinimumMovementDecay:(double)a3
{
  self->_rateOfMinimumMovementDecay = a3;
}

- (double)rateOfMaximumMovementDecay
{
  return self->_rateOfMaximumMovementDecay;
}

- (void)setRateOfMaximumMovementDecay:(double)a3
{
  self->_rateOfMaximumMovementDecay = a3;
}

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_numberOfTouchesRequired = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
