@implementation UISwipeGestureRecognizer

- (void)setDirection:(UISwipeGestureRecognizerDirection)direction
{
  self->_direction = direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
}

- (UISwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UISwipeGestureRecognizer *v4;
  UISwipeGestureRecognizer *v5;
  UISwipeGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISwipeGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    _UISwipeGestureRecognizerCommonInit(v4);
    v6 = v5;
  }

  return v5;
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
  CGPoint *startLocations;
  size_t v5;
  CGPoint *v6;
  CGPoint *previousLocations;
  CGPoint *v8;

  if (self->_numberOfTouchesRequired != numberOfTouchesRequired)
  {
    self->_numberOfTouchesRequired = numberOfTouchesRequired;
    startLocations = self->_startLocations;
    v5 = 16 * numberOfTouchesRequired;
    if (startLocations)
      v6 = (CGPoint *)malloc_type_realloc(startLocations, 16 * numberOfTouchesRequired, 0x1000040451B5BE8uLL);
    else
      v6 = (CGPoint *)malloc_type_malloc(16 * numberOfTouchesRequired, 0x1000040451B5BE8uLL);
    self->_startLocations = v6;
    previousLocations = self->_previousLocations;
    if (previousLocations)
      v8 = (CGPoint *)malloc_type_realloc(previousLocations, v5, 0x1000040451B5BE8uLL);
    else
      v8 = (CGPoint *)malloc_type_malloc(v5, 0x1000040451B5BE8uLL);
    self->_previousLocations = v8;
  }
}

- (void)dealloc
{
  CGPoint *startLocations;
  CGPoint *previousLocations;
  objc_super v5;

  startLocations = self->_startLocations;
  if (startLocations)
    free(startLocations);
  previousLocations = self->_previousLocations;
  if (previousLocations)
    free(previousLocations);
  v5.receiver = self;
  v5.super_class = (Class)UISwipeGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v5, sel_dealloc);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISwipeGestureRecognizer)initWithCoder:(id)a3
{
  UISwipeGestureRecognizer *v4;
  UISwipeGestureRecognizer *v5;
  UISwipeGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISwipeGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    _UISwipeGestureRecognizerCommonInit(v4);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UISwipeGestureRecognizer.numberOfTouchesRequired")))v5->_numberOfTouchesRequired = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UISwipeGestureRecognizer.numberOfTouchesRequired"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UISwipeGestureRecognizer.direction")))
      v5->_direction = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UISwipeGestureRecognizer.direction"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numberOfTouchesRequired;
  unint64_t direction;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISwipeGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v7, sel_encodeWithCoder_);
  numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", numberOfTouchesRequired, CFSTR("UISwipeGestureRecognizer.numberOfTouchesRequired"));
  direction = self->_direction;
  if (direction != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", direction, CFSTR("UISwipeGestureRecognizer.direction"));
}

- (double)startPoint
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_convertPointFromSceneReferenceSpace:", a1[46], a1[47]);
  objc_msgSend(v2, "convertPoint:fromView:", 0);
  v5 = v4;

  return v5;
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  self->_startLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_failed = 0;
  -[NSMutableArray removeAllObjects](self->_touches, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)UISwipeGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CGPoint *startLocations;
  _QWORD *p_x;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CGPoint *previousLocations;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_failed
    || (v6 = -[NSMutableArray count](self->_touches, "count", a3, a4),
        objc_msgSend(a3, "count") + v6 > self->_numberOfTouchesRequired))
  {
    self->_failed = 1;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = a3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          startLocations = self->_startLocations;
          p_x = (_QWORD *)&startLocations[-[NSMutableArray count](self->_touches, "count", (_QWORD)v26)].x;
          objc_msgSend(v12, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "locationInView:", 0);
          objc_msgSend(v15, "_convertPointToSceneReferenceSpace:");
          *p_x = v16;
          p_x[1] = v17;

          previousLocations = self->_previousLocations;
          v19 = (_QWORD *)&previousLocations[-[NSMutableArray count](self->_touches, "count")].x;
          objc_msgSend(v12, "window");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "locationInView:", 0);
          objc_msgSend(v20, "_convertPointToSceneReferenceSpace:");
          *v19 = v21;
          v19[1] = v22;

          -[NSMutableArray addObject:](self->_touches, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", self->_touches, 1);
    self->_startLocation.x = v23;
    self->_startLocation.y = v24;
    v25 = _TimestampForTouches(self->_touches);
    self->_startTime = v25;
    self->_previousTime = v25;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGPoint *previousLocations;
  double minimumPrimaryMovement;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double maximumPrimaryMovement;
  double v38;
  double v39;
  double minimumSecondaryMovement;
  double v41;
  double maximumSecondaryMovement;
  double v43;
  unint64_t direction;
  unint64_t v45;
  unint64_t v46;
  double v47;
  double v48;
  double v49;
  double *p_x;
  BOOL v51;
  double v52;
  double v53;
  BOOL v55;
  uint64_t v56;
  UISwipeGestureRecognizer *v57;
  uint64_t v58;
  unint64_t v59;
  NSMutableArray *obj;
  double v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = _TimestampForTouches(self->_touches);
  if (v5 - self->_startTime > self->_maximumDuration
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    goto LABEL_63;
  }
  if (!self->_failed)
  {
    v6 = -[NSMutableArray count](self->_touches, "count") == self->_numberOfTouchesRequired;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = self->_touches;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (!v7)
      goto LABEL_60;
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v64;
    v61 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v62 = *MEMORY[0x1E0C9D538];
    while (1)
    {
      v11 = 0;
      v59 = v9;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v11);
        objc_msgSend(v13, "window");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "locationInView:", 0);
        objc_msgSend(v14, "_convertPointToSceneReferenceSpace:");
        v16 = v15;
        v18 = v17;

        v19 = &self->_startLocations[v12];
        v20 = v16 - v19->x;
        v21 = v18 - v19->y;
        -[UIGestureRecognizer view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "_convertPointFromSceneReferenceSpace:", v20, v21);
          objc_msgSend(v22, "convertPoint:fromView:", 0);
          v26 = v25;
          v28 = v27;
          objc_msgSend(v24, "_convertPointFromSceneReferenceSpace:", v62, v61);
          objc_msgSend(v22, "convertPoint:fromView:", 0);
          v20 = v26 - v29;
          v21 = v28 - v30;
        }
        previousLocations = self->_previousLocations;
        minimumPrimaryMovement = self->_minimumPrimaryMovement;
        v33 = fmin(v5 - self->_startTime, 0.5);
        v34 = 1.0 - v33 * (1.0 - self->_rateOfMinimumMovementDecay);
        v35 = minimumPrimaryMovement * v34;
        v36 = minimumPrimaryMovement == 3.40282347e38;
        maximumPrimaryMovement = self->_maximumPrimaryMovement;
        if (v36)
          v35 = 3.40282347e38;
        v38 = 1.0 - v33 * (1.0 - self->_rateOfMaximumMovementDecay);
        if (maximumPrimaryMovement == 3.40282347e38)
          v39 = 3.40282347e38;
        else
          v39 = maximumPrimaryMovement * v38;
        minimumSecondaryMovement = self->_minimumSecondaryMovement;
        v41 = v34 * minimumSecondaryMovement;
        if (minimumSecondaryMovement == 3.40282347e38)
          v41 = 3.40282347e38;
        maximumSecondaryMovement = self->_maximumSecondaryMovement;
        v43 = v38 * maximumSecondaryMovement;
        if (maximumSecondaryMovement == 3.40282347e38)
          v43 = 3.40282347e38;
        direction = self->_direction;
        v45 = direction & 3;
        if (v45 == 2)
        {
          if (v20 > self->_maximumOppositeMovement)
            goto LABEL_35;
        }
        else if (v45 == 1 && v20 < -self->_maximumOppositeMovement)
        {
LABEL_35:
          LODWORD(v45) = 0;
LABEL_36:
          self->_failed = 1;
          goto LABEL_37;
        }
        v46 = direction & 0xC;
        if (v46 == 8)
        {
          if (v21 < -self->_maximumOppositeMovement)
            goto LABEL_35;
        }
        else if (v46 == 4 && v21 > self->_maximumOppositeMovement)
        {
          goto LABEL_35;
        }
        v47 = v5 - self->_previousTime;
        if (v47 < 0.01)
          v47 = 0.01;
        if (v45)
        {
          v48 = fabs(v20);
          if (v48 > v39)
            goto LABEL_35;
          v49 = fabs(v21);
          if (v49 > v43)
            goto LABEL_35;
          v51 = v48 < v35 || v49 < v41;
          if (!v51 && fabs((v16 - previousLocations[v12].x) / v47) >= self->_minimumPrimaryMovementRate)
          {
            LODWORD(v45) = 1;
            if (!v46)
              goto LABEL_37;
            goto LABEL_46;
          }
          LODWORD(v45) = 0;
        }
        if (!v46)
          goto LABEL_37;
LABEL_46:
        v52 = fabs(v21);
        v51 = v52 <= v39;
        v53 = fabs(v20);
        if (!v51 || v53 > v43)
          goto LABEL_36;
        v55 = v52 < v35 || v53 < v41;
        if (!v55 && fabs((v18 - previousLocations[v12].y) / v47) >= self->_minimumPrimaryMovementRate)
          LODWORD(v45) = 1;
LABEL_37:
        v6 &= v45;
        p_x = &previousLocations[v12].x;
        *p_x = v16;
        p_x[1] = v18;

        ++v11;
        ++v12;
      }
      while (v8 != v11);
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      v8 = v56;
      v9 = v59 + v11;
      if (!v56)
      {
LABEL_60:

        if (v6)
        {
          v57 = self;
          v58 = 3;
          goto LABEL_64;
        }
        if (self->_failed)
        {
LABEL_63:
          v57 = self;
          v58 = 5;
LABEL_64:
          -[UIGestureRecognizer setState:](v57, "setState:", v58);
        }
        break;
      }
    }
  }
  self->_previousTime = v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](self->_touches, "count"))
    self->_failed = 1;
  else
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](self->_touches, "count"))
    self->_failed = 1;
  else
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (CGPoint)locationInView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  objc_msgSend(a3, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", self->_startLocation.x, self->_startLocation.y);
  objc_msgSend(a3, "convertPoint:fromView:", 0);
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
  return -[NSMutableArray count](self->_touches, "count");
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  objc_msgSend(a4, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", self->_startLocations[a3].x, self->_startLocations[a3].y);
  objc_msgSend(a4, "convertPoint:fromView:", 0);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)_appendSubclassDescription:(id)a3
{
  unint64_t direction;
  unint64_t v6;

  if (self->_numberOfTouchesRequired != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; numberOfTouchesRequired = %lu"), self->_numberOfTouchesRequired);
  if (!self->_direction)
    return;
  objc_msgSend(a3, "appendString:", CFSTR("; direction = "));
  direction = self->_direction;
  if ((direction & 1) != 0)
  {
    objc_msgSend(a3, "appendString:", CFSTR("right"));
    v6 = self->_direction;
    if ((v6 & 2) == 0)
    {
      if ((v6 & 4) != 0)
      {
LABEL_15:
        objc_msgSend(a3, "appendString:", CFSTR(","));
LABEL_16:
        objc_msgSend(a3, "appendString:", CFSTR("up"));
        if ((self->_direction & 8) == 0)
          return;
LABEL_17:
        objc_msgSend(a3, "appendString:", CFSTR(","));
LABEL_18:
        objc_msgSend(a3, "appendString:", CFSTR("down"));
        return;
      }
LABEL_11:
      if ((v6 & 8) == 0)
        return;
      goto LABEL_17;
    }
    objc_msgSend(a3, "appendString:", CFSTR(","));
LABEL_14:
    objc_msgSend(a3, "appendString:", CFSTR("left"));
    v6 = self->_direction;
    if ((v6 & 4) != 0)
      goto LABEL_15;
    goto LABEL_11;
  }
  if ((direction & 2) != 0)
    goto LABEL_14;
  if ((direction & 4) != 0)
    goto LABEL_16;
  if ((direction & 8) != 0)
    goto LABEL_18;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 10;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (NSUInteger)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (UISwipeGestureRecognizerDirection)direction
{
  return self->_direction;
}

@end
