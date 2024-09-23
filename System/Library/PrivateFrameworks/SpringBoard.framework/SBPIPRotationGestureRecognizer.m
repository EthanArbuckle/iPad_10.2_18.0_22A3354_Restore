@implementation SBPIPRotationGestureRecognizer

- (SBPIPRotationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBPIPRotationGestureRecognizer *v4;
  SBPIPRotationGestureRecognizer *v5;
  CGFloat v6;
  NSMutableSet *v7;
  NSMutableSet *touches;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPIPRotationGestureRecognizer;
  v4 = -[SBPIPRotationGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumAbsoluteAccumulatedMovement.x = SBMagicHysteresisValue();
    v5->_maximumAbsoluteAccumulatedMovement.y = v6;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    touches = v5->_touches;
    v5->_touches = v7;

    v5->_accumulatedMovement = (CGPoint)*MEMORY[0x1E0C9D538];
    v5->_achievedMaximumAbsoluteAccumulatedMovement = 0;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer setDelegate:](&v3, sel_setDelegate_, a3);
}

- (SBPIPSystemGestureRecognizerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer delegate](&v3, sel_delegate);
  return (SBPIPSystemGestureRecognizerDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer touchesBegan:withEvent:](&v17, sel_touchesBegan_withEvent_, v6, a4);
  if (self->_maximumNumberOfTouches)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[NSMutableSet count](self->_touches, "count", (_QWORD)v13) >= self->_maximumNumberOfTouches)
          {

            -[SBPIPRotationGestureRecognizer setState:](self, "setState:", 5);
            goto LABEL_12;
          }
          -[NSMutableSet addObject:](self->_touches, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
LABEL_12:

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer touchesCancelled:withEvent:](&v16, sel_touchesCancelled_withEvent_, v6, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
        -[NSMutableSet removeObject:](self->_touches, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer touchesEnded:withEvent:](&v16, sel_touchesEnded_withEvent_, v6, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
        -[NSMutableSet removeObject:](self->_touches, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double x;
  BOOL v12;
  double y;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer touchesMoved:withEvent:](&v18, sel_touchesMoved_withEvent_, v6, a4);
  if (self->_failsPastHysteresis)
  {
    v7 = -[SBPIPRotationGestureRecognizer state](self, "state");
    if (!self->_achievedMaximumAbsoluteAccumulatedMovement)
    {
      v8 = SBTotalMovementForMovedTouches(self, v6) + self->_accumulatedMovement.x;
      v10 = v9 + self->_accumulatedMovement.y;
      self->_accumulatedMovement.x = v8;
      self->_accumulatedMovement.y = v10;
      if (!v7)
      {
        x = self->_maximumAbsoluteAccumulatedMovement.x;
        v12 = x <= 0.0 || v8 < x;
        if (!v12 || ((y = self->_maximumAbsoluteAccumulatedMovement.y, y > 0.0) ? (v14 = v10 < y) : (v14 = 1), !v14))
        {
          if (!self->_achievedMaximumAbsoluteAccumulatedMovement)
            self->_achievedMaximumAbsoluteAccumulatedMovement = 1;
        }
      }
    }
    -[SBPIPRotationGestureRecognizer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = self->_achievedMaximumAbsoluteAccumulatedMovement && v7 == 0;
    if (v17 && objc_msgSend(v15, "gestureRecognizerShouldFailForMovementPastHysteresis:", self))
      -[SBPIPRotationGestureRecognizer setState:](self, "setState:", 5);

  }
}

- (void)reset
{
  NSMutableSet *v3;
  NSMutableSet *touches;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPRotationGestureRecognizer;
  -[SBPIPRotationGestureRecognizer reset](&v5, sel_reset);
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  touches = self->_touches;
  self->_touches = v3;

  self->_accumulatedMovement = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_achievedMaximumAbsoluteAccumulatedMovement = 0;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (BOOL)failsPastHysteresis
{
  return self->_failsPastHysteresis;
}

- (void)setFailsPastHysteresis:(BOOL)a3
{
  self->_failsPastHysteresis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
