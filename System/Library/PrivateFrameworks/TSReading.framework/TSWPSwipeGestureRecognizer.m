@implementation TSWPSwipeGestureRecognizer

- (double)p_angleDifferenceForAngle1:(double)a3 angle2:(double)a4
{
  double v4;

  TSDNormalizeAngleInRadians(a4 - a3);
  return v4 + -3.14159265;
}

- (BOOL)p_swipeDirectionValidForAngle:(double)a3 direction:(int)a4
{
  double v4;
  double v5;

  if (a4 == 1)
  {
    v4 = 3.14159265;
  }
  else if (a4 == 8)
  {
    v4 = -1.57079633;
  }
  else
  {
    v4 = 0.0;
    if (a4 == 4)
      v4 = 1.57079633;
  }
  -[TSWPSwipeGestureRecognizer p_angleDifferenceForAngle1:angle2:](self, "p_angleDifferenceForAngle1:angle2:", a3, v4);
  return v5 >= -0.785398163 && v5 <= 0.785398163;
}

- (BOOL)p_swipeDirectionValidForXDiff:(double)a3 yDiff:(double)a4
{
  double v5;
  double v6;
  int mDirection;
  BOOL v8;

  v5 = atan2(a4, a3);
  v6 = v5;
  mDirection = self->mDirection;
  if ((mDirection & 4) != 0)
  {
    if (-[TSWPSwipeGestureRecognizer p_swipeDirectionValidForAngle:direction:](self, "p_swipeDirectionValidForAngle:direction:", 4, v5))
    {
      return 1;
    }
    mDirection = self->mDirection;
  }
  if ((mDirection & 1) != 0)
  {
    v8 = 1;
    if (-[TSWPSwipeGestureRecognizer p_swipeDirectionValidForAngle:direction:](self, "p_swipeDirectionValidForAngle:direction:", 1, v6))
    {
      return v8;
    }
    mDirection = self->mDirection;
  }
  if ((mDirection & 8) != 0)
  {
    if (-[TSWPSwipeGestureRecognizer p_swipeDirectionValidForAngle:direction:](self, "p_swipeDirectionValidForAngle:direction:", 8, v6))
    {
      return 1;
    }
    mDirection = self->mDirection;
  }
  if ((mDirection & 2) == 0)
    return 0;
  return -[TSWPSwipeGestureRecognizer p_swipeDirectionValidForAngle:direction:](self, "p_swipeDirectionValidForAngle:direction:", 2, v6);
}

- (void)p_recordTouches:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  TSUPointerKeyDictionary *mStartLocations;
  void *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!-[TSUPointerKeyDictionary objectForKeyedSubscript:](self->mStartLocations, "objectForKeyedSubscript:", v9))
        {
          mStartLocations = self->mStartLocations;
          v11 = (void *)MEMORY[0x24BDD1968];
          objc_msgSend(v9, "locationInView:", objc_msgSend(v9, "view"));
          -[TSUPointerKeyDictionary setObject:forUncopiedKey:](mStartLocations, "setObject:forUncopiedKey:", objc_msgSend(v11, "valueWithCGPoint:"), v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v12 = -[TSUPointerKeyDictionary count](self->mStartLocations, "count");
  if (self->mTouchCountAttained < v12)
    self->mTouchCountAttained = v12;
}

- (BOOL)p_touchWasSwipe:(id)a3 movedFarOut:(BOOL *)a4
{
  void *v7;
  double v8;
  double v9;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;

  *a4 = 0;
  v7 = (void *)-[TSUPointerKeyDictionary objectForKeyedSubscript:](self->mStartLocations, "objectForKeyedSubscript:");
  if (v7)
  {
    objc_msgSend(v7, "getValue:", &v13);
    objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
    if ((v9 - v14) * (v9 - v14) + (v8 - v13) * (v8 - v13) >= 2500.0)
    {
      *a4 = 1;
      return -[TSWPSwipeGestureRecognizer p_swipeDirectionValidForXDiff:yDiff:](self, "p_swipeDirectionValidForXDiff:yDiff:");
    }
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSwipeGestureRecognizer p_touchWasSwipe:movedFarOut:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSwipeGestureRecognizer.mm"), 109, CFSTR("invalid nil value for '%s'"), "value");
  }
  return 0;
}

- (CGPoint)locationInView:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint result;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSUPointerKeyDictionary count](self->mStartLocations, "count");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)-[TSUPointerKeyDictionary allKeys](self->mStartLocations, "allKeys", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "locationInView:", a3);
        v10 = v10 + v13;
        v11 = v11 + v14;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  v15 = v10 / (double)v5;
  v16 = v11 / (double)v5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v6;
  TSUPointerKeyDictionary *mStartLocations;
  unint64_t v8;
  unint64_t mNumberOfTouchesRequired;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPSwipeGestureRecognizer;
  -[TSWPSwipeGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, a3, a4);
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  self->mStartTime = v6;
  mStartLocations = self->mStartLocations;
  if (!mStartLocations)
  {
    mStartLocations = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    self->mStartLocations = mStartLocations;
  }
  -[TSUPointerKeyDictionary removeAllObjects](mStartLocations, "removeAllObjects");
  -[TSWPSwipeGestureRecognizer p_recordTouches:](self, "p_recordTouches:", a3);
  v8 = objc_msgSend(a3, "count");
  mNumberOfTouchesRequired = self->mNumberOfTouchesRequired;
  if (!objc_msgSend((id)-[TSWPSwipeGestureRecognizer delegate](self, "delegate"), "gestureRecognizerShouldBegin:", self)|| v8 > mNumberOfTouchesRequired)
  {
    -[TSWPSwipeGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)TSWPSwipeGestureRecognizer;
  -[TSWPSwipeGestureRecognizer touchesMoved:withEvent:](&v17, sel_touchesMoved_withEvent_, a3, a4);
  -[TSWPSwipeGestureRecognizer p_recordTouches:](self, "p_recordTouches:", a3);
  if (self->mTouchCountAttained <= self->mNumberOfTouchesRequired
    && (objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp"), v6 - self->mStartTime <= 0.150000006))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(a3);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = 0;
          if (!-[TSWPSwipeGestureRecognizer p_touchWasSwipe:movedFarOut:](self, "p_touchWasSwipe:movedFarOut:", v11, &v12))
          {
            if (v12)
              -[TSWPSwipeGestureRecognizer setState:](self, "setState:", 5);
          }
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[TSWPSwipeGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  double v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[TSWPSwipeGestureRecognizer p_recordTouches:](self, "p_recordTouches:");
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  if (v7 - self->mStartTime <= 0.150000006)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(a3);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          v14 = -[TSWPSwipeGestureRecognizer p_touchWasSwipe:movedFarOut:](self, "p_touchWasSwipe:movedFarOut:", v13, &v27);
          if (v27)
            v15 = v14;
          else
            v15 = 0;
          v10 |= v15;
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }
    v16 = -[TSUPointerKeyDictionary count](self->mStartLocations, "count");
    if (v16 == objc_msgSend(a3, "count"))
    {
      if (((self->mTouchCountAttained == self->mNumberOfTouchesRequired) & v10) != 0)
        v17 = 3;
      else
        v17 = 5;
      -[TSWPSwipeGestureRecognizer setState:](self, "setState:", v17);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(a3);
          -[TSUPointerKeyDictionary removeObjectForKey:](self->mStartLocations, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        }
        v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v19);
    }
  }
  else
  {
    -[TSWPSwipeGestureRecognizer setState:](self, "setState:", 5);
  }
  v22.receiver = self;
  v22.super_class = (Class)TSWPSwipeGestureRecognizer;
  -[TSWPSwipeGestureRecognizer touchesEnded:withEvent:](&v22, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPSwipeGestureRecognizer;
  -[TSWPSwipeGestureRecognizer reset](&v3, sel_reset);
  -[TSWPSwipeGestureRecognizer delegate](self, "delegate");
  objc_msgSend((id)TSUProtocolCast(), "didReset:", self);
  self->mStartTime = -1.0;
  self->mTouchCountAttained = 0;
  -[TSUPointerKeyDictionary removeAllObjects](self->mStartLocations, "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPSwipeGestureRecognizer;
  -[TSWPSwipeGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfTouchesRequired
{
  return self->mNumberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->mNumberOfTouchesRequired = a3;
}

- (int)direction
{
  return self->mDirection;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

@end
