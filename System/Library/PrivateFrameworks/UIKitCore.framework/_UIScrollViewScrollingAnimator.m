@implementation _UIScrollViewScrollingAnimator

- (_UIScrollViewScrollingAnimator)initWithScrollView:(id)a3
{
  id v4;
  _UIScrollViewScrollingAnimator *v5;
  _UIScrollViewScrollingAnimator *v6;
  uint64_t v7;
  NSHashTable *trackedPressEvents;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIScrollViewScrollingAnimator;
  v5 = -[_UIScrollViewScrollingAnimator init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    trackedPressEvents = v6->_trackedPressEvents;
    v6->_trackedPressEvents = (NSHashTable *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIScrollViewScrollingAnimator invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewScrollingAnimator;
  -[_UIScrollViewScrollingAnimator dealloc](&v3, sel_dealloc);
}

- (BOOL)isInterestedInPress:(id)a3
{
  return scrollingKeyForPress(a3) != 0;
}

- (BOOL)handlePressEventIfInterested:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIScrollViewScrollingAnimator _keyboardHandlesPressEventForKeyInput:](self, "_keyboardHandlesPressEventForKeyInput:", v4))
  {
    goto LABEL_12;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allPresses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
  {

LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v8 |= -[_UIScrollViewScrollingAnimator _handlePressIfInterested:](self, "_handlePressIfInterested:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
    goto LABEL_12;
  -[NSHashTable addObject:](self->_trackedPressEvents, "addObject:", v4);
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)isHandlingPressEvent:(id)a3
{
  return -[NSHashTable containsObject:](self->_trackedPressEvents, "containsObject:", a3);
}

- (BOOL)finishHandlingPressEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isScrollingInteractively
    && -[NSHashTable containsObject:](self->_trackedPressEvents, "containsObject:", v4))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "allPresses", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[_UIScrollViewScrollingAnimator _scrollStateForPress:](self, "_scrollStateForPress:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11
            || objc_msgSend(v10, "phase") == 3
            || objc_msgSend(v10, "phase") == 4
            || (objc_msgSend(v10, "key"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "modifierFlags"),
                v12,
                (v13 & 0x100000) != 0))
          {
            -[_UIScrollViewScrollingAnimator _stopAnimatedScroll](self, "_stopAnimatedScroll");
            self->_isScrollingInteractively = 0;

            goto LABEL_17;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

    -[NSHashTable removeObject:](self->_trackedPressEvents, "removeObject:", v4);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)animateScrollInDirection:(unint64_t)a3 withGranularity:(unint64_t)a4
{
  id v7;

  -[_UIScrollViewScrollingAnimator cancelInteractiveScroll](self, "cancelInteractiveScroll");
  -[_UIScrollViewScrollingAnimator _scrollStateForDirection:granularity:](self, "_scrollStateForDirection:granularity:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIScrollViewScrollingAnimator _beginInteractiveAnimationForScrollState:](self, "_beginInteractiveAnimationForScrollState:", v7);
  -[_UIScrollViewScrollingAnimator _stopAnimatedScroll](self, "_stopAnimatedScroll");

}

- (void)cancelInteractiveScroll
{
  if (!self->_isAdjustingScrollViewOffset)
  {
    self->_velocity = (CGPoint)*MEMORY[0x1E0C9D538];
    -[_UIScrollViewScrollingAnimator _stopAnimatedScroll](self, "_stopAnimatedScroll");
    -[_UIScrollViewScrollingAnimator _stopDisplayLink](self, "_stopDisplayLink");
  }
}

- (void)invalidate
{
  -[_UIScrollViewScrollingAnimator _stopAnimatedScroll](self, "_stopAnimatedScroll");
  -[_UIScrollViewScrollingAnimator _stopDisplayLink](self, "_stopDisplayLink");
  objc_storeWeak((id *)&self->_scrollView, 0);
}

- (void)_beginInteractiveAnimationForScrollState:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  id v23;

  v23 = a3;
  objc_storeStrong((id *)&self->_currentScroll, a3);
  if (objc_msgSend(v23, "granularity") == 3)
  {
    -[_UIScrollViewScrollingAnimator cancelInteractiveScroll](self, "cancelInteractiveScroll");
    objc_msgSend(v23, "offset");
    v6 = self->_modelPosition.x + v5;
    v8 = v7 + self->_modelPosition.y;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", v6, v8);
    v11 = v10;
    v13 = v12;

    -[_UIScrollViewScrollingAnimator _scrollWithScrollToExtentAnimationTo:](self, "_scrollWithScrollToExtentAnimationTo:", v11, v13);
  }
  else
  {
    v14 = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(v14, "contentOffset");
    self->_modelPosition.x = v15;
    self->_modelPosition.y = v16;

    -[_UIScrollViewScrollingAnimator _interactiveScrollVelocity](self, "_interactiveScrollVelocity");
    v19 = v18 + self->_velocity.y;
    self->_velocity.x = self->_velocity.x + v17;
    self->_velocity.y = v19;
    -[_UIScrollViewScrollingAnimatorState offset](self->_currentScroll, "offset");
    v22 = v21 + self->_modelPosition.y;
    self->_idealPositionForMinimumTravel.x = self->_modelPosition.x + v20;
    self->_idealPositionForMinimumTravel.y = v22;
    -[_UIScrollViewScrollingAnimator _startDisplayLinkIfNeeded](self, "_startDisplayLinkIfNeeded");
  }

}

- (BOOL)_keyboardHandlesPressEventForKeyInput:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "type") == 4)
  {
    if ((objc_msgSend(v4, "delegateRequiresKeyEvents") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v7 = v3;
      if ((objc_msgSend(v4, "_isKeyCommand:", v7) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v7, "_unmodifiedInput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        if (v9 == 1)
        {
          objc_msgSend(v4, "inputDelegateManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "keyInputDelegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v11 != 0;

        }
        else
        {
          v5 = 0;
        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_handlePressIfInterested:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  if (!objc_msgSend(v4, "phase"))
  {
    -[_UIScrollViewScrollingAnimator _scrollStateForPress:](self, "_scrollStateForPress:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_isScrollingInteractively)
      {
        v5 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v7 = -[_UIScrollViewScrollingAnimator _rubberbandableDirections](self, "_rubberbandableDirections");
      v8 = objc_msgSend(v6, "direction");
      if ((unint64_t)(v8 - 1) > 3)
        v9 = 0;
      else
        v9 = qword_18667F3F0[v8 - 1];
      if ((v9 & v7) != 0)
      {
        v5 = 1;
        self->_isScrollingInteractively = 1;
        -[_UIScrollViewScrollingAnimator _beginInteractiveAnimationForScrollState:](self, "_beginInteractiveAnimationForScrollState:", v6);
        goto LABEL_12;
      }
    }
    v5 = 0;
    goto LABEL_12;
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (id)_scrollStateForDirection:(unint64_t)a3 granularity:(unint64_t)a4
{
  double v6;
  double v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  _UIScrollViewScrollingAnimatorState *v12;
  double v13;
  double v14;

  -[_UIScrollViewScrollingAnimator _distanceForIncrement:inDirection:](self, "_distanceForIncrement:inDirection:", a4, a3);
  v7 = v6;
  v8 = (double *)((char *)&unk_18667F340 + 8 * a3 - 8);
  if (a3 - 1 >= 4)
    v9 = (double *)(MEMORY[0x1E0C9D538] + 8);
  else
    v9 = (double *)((char *)&unk_18667F360 + 8 * a3 - 8);
  if (a3 - 1 >= 4)
    v8 = (double *)MEMORY[0x1E0C9D538];
  v10 = *v8;
  v11 = *v9;
  v12 = objc_alloc_init(_UIScrollViewScrollingAnimatorState);
  -[_UIScrollViewScrollingAnimatorState setOffset:](v12, "setOffset:", v7 * v10, v7 * v11);
  -[_UIScrollViewScrollingAnimatorState offset](v12, "offset");
  -[_UIScrollViewScrollingAnimatorState setMaximumVelocity:](v12, "setMaximumVelocity:", v13 * 25.0, v14 * 25.0);
  -[_UIScrollViewScrollingAnimatorState setDirection:](v12, "setDirection:", a3);
  -[_UIScrollViewScrollingAnimatorState setGranularity:](v12, "setGranularity:", a4);
  -[_UIScrollViewScrollingAnimatorState maximumVelocity](v12, "maximumVelocity");
  -[_UIScrollViewScrollingAnimatorState setForce:](v12, "setForce:");
  return v12;
}

- (id)_scrollStateForPress:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = scrollingKeyForPress(v4);
  if (v5
    && (v6 = v5, v7 = objc_msgSend(v4, "modifierFlags"), ((v7 >> 17) & 1) + ((v7 >> 19) & 1) + ((v7 >> 20) & 1) <= 1)
    && (v6 > 6 ? (LODWORD(v8) = -1) : (v8 = qword_18667F380[v6 - 1]), (v7 & v8 & 0x1A0000) == 0))
  {
    v11 = 2;
    switch(v6)
    {
      case 1uLL:
      case 2uLL:
        if ((*(_QWORD *)&v7 & 0x80000) != 0)
          v11 = 2;
        else
          v11 = 1;
        break;
      case 3uLL:
      case 4uLL:
        v12 = 3;
        if ((*(_QWORD *)&v7 & 0x100000) == 0)
          v12 = 1;
        if ((*(_QWORD *)&v7 & 0x80000) != 0)
          v11 = 2;
        else
          v11 = v12;
        break;
      case 5uLL:
      case 6uLL:
        break;
      case 7uLL:
      case 8uLL:
        v11 = 3;
        break;
      default:
        goto LABEL_7;
    }
    -[_UIScrollViewScrollingAnimator _scrollStateForDirection:granularity:](self, "_scrollStateForDirection:granularity:", qword_18667F3B0[v6 - 1], v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v9 = 0;
  }

  return v9;
}

- (void)_stopAnimatedScroll
{
  _UIScrollViewScrollingAnimatorState *currentScroll;
  double x;
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;
  CGFloat v18;
  CGFloat v19;
  _UIScrollViewScrollingAnimatorState *v20;

  currentScroll = self->_currentScroll;
  if (currentScroll)
  {
    x = self->_velocity.x;
    y = self->_velocity.y;
    v6 = sqrt(x * x * 0.00917431193);
    if (x >= 0.0)
      v7 = v6;
    else
      v7 = -v6;
    v8 = sqrt(y * y * 0.00917431193);
    if (y >= 0.0)
      v9 = v8;
    else
      v9 = -v8;
    v10 = self->_modelPosition.x;
    v11 = self->_modelPosition.y;
    v12 = -[_UIScrollViewScrollingAnimatorState direction](currentScroll, "direction");
    v13 = v10 + v7;
    v14 = v11 + v9;
    v15 = self->_idealPositionForMinimumTravel.x;
    v16 = self->_idealPositionForMinimumTravel.y;
    switch(v12)
    {
      case 1:
        if (v14 >= v16)
          v14 = self->_idealPositionForMinimumTravel.y;
        break;
      case 2:
        if (v14 < v16)
          v14 = self->_idealPositionForMinimumTravel.y;
        break;
      case 3:
        if (v13 >= v15)
          v13 = self->_idealPositionForMinimumTravel.x;
        break;
      case 4:
        if (v13 < v15)
          v13 = self->_idealPositionForMinimumTravel.x;
        break;
      default:
        v13 = *MEMORY[0x1E0C9D538];
        v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        break;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", v13, v14);
    self->_idealPosition.x = v18;
    self->_idealPosition.y = v19;

    v20 = self->_currentScroll;
    self->_currentScroll = 0;

  }
}

- (void)_startDisplayLinkIfNeeded
{
  UIScrollView **p_scrollView;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *displayLink;
  CADisplayLink *v11;
  CADisplayLink *v12;
  id v13;

  if (!self->_displayLink)
  {
    p_scrollView = &self->_scrollView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)p_scrollView);
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v9;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__smoothScrollDisplayLink_);
      v11 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v6 = self->_displayLink;
      self->_displayLink = v11;
    }

    v12 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

  }
}

- (void)_stopDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)_displayLinkFired:(id)a3
{
  CGPoint *v4;
  double v5;
  double v6;
  CGFloat *p_y;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint *p_idealPosition;
  double x;
  double v23;
  id WeakRetained;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint *p_velocity;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double y;
  id v41;

  v41 = a3;
  v4 = (CGPoint *)MEMORY[0x1E0C9D538];
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!self->_currentScroll)
  {
    v11 = 1.0;
    v12 = 1.0;
LABEL_21:
    p_idealPosition = &self->_idealPosition;
    p_y = &self->_idealPosition.y;
    goto LABEL_22;
  }
  p_y = &self->_modelPosition.y;
  v8 = -[_UIScrollViewScrollingAnimator _scrollableDirectionsFromOffset:](self, "_scrollableDirectionsFromOffset:", self->_modelPosition.x, self->_modelPosition.y);
  v9 = -[_UIScrollViewScrollingAnimatorState direction](self->_currentScroll, "direction") - 1;
  if (v9 > 3)
    v10 = 0;
  else
    v10 = qword_18667F3F0[v9];
  if ((v10 & v8) != 0)
  {
    if (v9 <= 3)
    {
      v5 = dbl_18667F410[v9];
      v6 = dbl_18667F430[v9];
    }
    -[_UIScrollViewScrollingAnimatorState force](self->_currentScroll, "force");
    v14 = v13;
    v16 = v15;
    v12 = v6;
    v11 = v5;
  }
  else
  {
    if (v9 >= 4)
    {
      v14 = v5 * 5000.0;
      v16 = v6 * 5000.0;
    }
    else
    {
      v14 = dbl_18667F450[v9];
      v16 = dbl_18667F470[v9];
    }
    v12 = 1.0;
    v11 = 1.0;
  }
  v17 = fabs(self->_velocity.x);
  -[_UIScrollViewScrollingAnimatorState maximumVelocity](self->_currentScroll, "maximumVelocity");
  v6 = 0.0;
  if (v17 >= fabs(v18))
    v5 = 0.0;
  else
    v5 = v14;
  v19 = fabs(self->_velocity.y);
  -[_UIScrollViewScrollingAnimatorState maximumVelocity](self->_currentScroll, "maximumVelocity");
  if (v19 < fabs(v20))
    v6 = v16;
  if (!self->_currentScroll)
    goto LABEL_21;
  p_idealPosition = &self->_modelPosition;
LABEL_22:
  x = p_idealPosition->x;
  v23 = *p_y;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_adjustedContentOffsetForContentOffset:", x, v23);
  v26 = v25;
  v28 = v27;

  p_velocity = &self->_velocity;
  v30 = v12 * ((self->_modelPosition.y - v28) * -109.0 - self->_velocity.y * 20.0);
  v31 = v5 + v11 * ((self->_modelPosition.x - v26) * -109.0 - self->_velocity.x * 20.0);
  v32 = v6 + v30;
  objc_msgSend(v41, "targetTimestamp");
  v34 = v33;
  objc_msgSend(v41, "timestamp");
  v36 = v34 - v35;
  v37 = self->_velocity.x + v31 * v36;
  v38 = self->_modelPosition.x;
  v39 = self->_velocity.y + v36 * v32;
  self->_velocity.x = v37;
  y = self->_modelPosition.y;
  self->_velocity.y = v39;
  self->_modelPosition.x = v36 * v37 + v38;
  self->_modelPosition.y = v36 * v39 + y;
  -[_UIScrollViewScrollingAnimator _scrollToContentOffset:](self, "_scrollToContentOffset:");
  if (!self->_isScrollingInteractively && p_velocity->x * p_velocity->x + self->_velocity.y * self->_velocity.y < 1.0)
  {
    -[_UIScrollViewScrollingAnimator _stopDisplayLink](self, "_stopDisplayLink");
    *p_velocity = *v4;
  }

}

- (double)_distanceForIncrement:(unint64_t)a3 inDirection:(unint64_t)a4
{
  id WeakRetained;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v7 = WeakRetained;
  v8 = 0.0;
  if (!WeakRetained)
    goto LABEL_14;
  if (a3 == 1)
  {
    objc_msgSend(WeakRetained, "zoomScale");
    v13 = 40.0;
LABEL_13:
    v8 = v12 * v13;
    goto LABEL_14;
  }
  v9 = a4 - 3;
  if (a3 == 2)
  {
    objc_msgSend(WeakRetained, "frame");
    if (v9 >= 2)
      v12 = v15;
    else
      v12 = v14;
    v13 = 0.8;
    goto LABEL_13;
  }
  if (a3 == 3)
  {
    objc_msgSend(WeakRetained, "contentSize");
    if (v9 <= 1)
      v8 = v10;
    else
      v8 = v11;
  }
LABEL_14:

  return v8;
}

- (void)_scrollToContentOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  _QWORD v7[7];

  y = a3.y;
  x = a3.x;
  self->_isAdjustingScrollViewOffset = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57___UIScrollViewScrollingAnimator__scrollToContentOffset___block_invoke;
  v7[3] = &unk_1E16B4E70;
  v7[4] = self;
  *(CGFloat *)&v7[5] = x;
  *(CGFloat *)&v7[6] = y;
  objc_msgSend(WeakRetained, "withScrollIndicatorsShownForContentOffsetChanges:", v7);

  self->_isAdjustingScrollViewOffset = 0;
}

- (void)_scrollWithScrollToExtentAnimationTo:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  _QWORD v7[7];

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___UIScrollViewScrollingAnimator__scrollWithScrollToExtentAnimationTo___block_invoke;
  v7[3] = &unk_1E16B4E70;
  v7[4] = self;
  *(CGFloat *)&v7[5] = x;
  *(CGFloat *)&v7[6] = y;
  objc_msgSend(WeakRetained, "withScrollIndicatorsShownForContentOffsetChanges:", v7);

}

- (CGPoint)_interactiveScrollVelocity
{
  UIScrollView **p_scrollView;
  id WeakRetained;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_horizontalVelocity");
  v5 = v4 * 1000.0;
  v6 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v6, "_verticalVelocity");
  v8 = v7 * 1000.0;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)_scrollableDirectionsFromOffset:(CGPoint)a3
{
  double y;
  double x;
  UIScrollView **p_scrollView;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v28;
  double v29;

  y = a3.y;
  x = a3.x;
  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "adjustedContentInset");
  v28 = v7;
  v29 = v8;
  v10 = v9;
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v13, "contentSize");
  v15 = v14;
  v17 = v16;

  v18 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;

  v23 = -v28;
  v24 = v12 + v15 - v20;
  if (v24 <= -v10)
    v24 = -v10;
  v25 = v29 + v17 - v22;
  if (v25 <= v23)
    v25 = -v28;
  v26 = y > v23;
  if (y < v25)
    v26 |= 4uLL;
  if (x > -v10)
    v26 |= 2uLL;
  if (x >= v24)
    return v26;
  else
    return v26 | 8;
}

- (unint64_t)_rubberbandableDirections
{
  UIScrollView **p_scrollView;
  id WeakRetained;
  int v4;
  unint64_t v5;
  id v6;
  int v7;

  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v4 = objc_msgSend(WeakRetained, "_canScrollWithoutBouncingY");

  if (v4)
    v5 = 5;
  else
    v5 = 0;
  v6 = objc_loadWeakRetained((id *)p_scrollView);
  v7 = objc_msgSend(v6, "_canScrollWithoutBouncingX");

  if (v7)
    return v5 | 0xA;
  else
    return v5;
}

- (BOOL)isScrollingInteractively
{
  return self->_isScrollingInteractively;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPressEvents, 0);
  objc_storeStrong((id *)&self->_currentScroll, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
