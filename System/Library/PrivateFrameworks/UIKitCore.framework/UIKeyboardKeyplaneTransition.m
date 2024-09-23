@implementation UIKeyboardKeyplaneTransition

- (void)dealloc
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  id completionBlock;
  objc_super v6;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardKeyplaneTransition;
  -[UIKeyboardKeyplaneTransition dealloc](&v6, sel_dealloc);
}

- (double)startHeight
{
  double v2;

  -[UIView bounds](self->_startView, "bounds");
  return v2;
}

- (double)endHeight
{
  double v2;

  -[UIView bounds](self->_endView, "bounds");
  return v2;
}

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[UIKeyboardKeyplaneTransition removeAllAnimations](self, "removeAllAnimations");
  -[NSMutableArray removeAllObjects](self->_transitionViews, "removeAllObjects");
  if (v11)
    objc_storeStrong((id *)&self->_startView, a4);
  if (v13)
    objc_storeStrong((id *)&self->_endView, a6);
  if (v14)
    objc_storeStrong((id *)&self->_start, a3);
  if (v12)
    objc_storeStrong((id *)&self->_end, a5);

}

- (void)addTransitionView:(id)a3 startFrame:(CGRect)a4 endFrame:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  NSMutableArray *transitionViews;
  NSMutableArray *v15;
  NSMutableArray *v16;
  double MidY;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double MidX;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v31 = a3;
  if (v31)
  {
    v32.origin.x = v12;
    v32.origin.y = v11;
    v32.size.width = v10;
    v32.size.height = v9;
    if (!CGRectIsNull(v32))
    {
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      if (!CGRectIsNull(v33))
      {
        transitionViews = self->_transitionViews;
        if (!transitionViews)
        {
          v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v16 = self->_transitionViews;
          self->_transitionViews = v15;

          transitionViews = self->_transitionViews;
        }
        -[NSMutableArray addObject:](transitionViews, "addObject:", v31);
        v34.origin.x = v12;
        v34.origin.y = v11;
        v34.size.width = v10;
        v34.size.height = v9;
        MidX = CGRectGetMidX(v34);
        v35.origin.x = v12;
        v35.origin.y = v11;
        v35.size.width = v10;
        v35.size.height = v9;
        MidY = CGRectGetMidY(v35);
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v18 = CGRectGetMidX(v36);
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        v19 = CGRectGetMidY(v37);
        objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position"), 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, MidY);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFromValue:", v21);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setToValue:", v22);

        objc_msgSend(v31, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addAnimation:forKey:", v20, CFSTR("position interpolation"));

        v24 = *MEMORY[0x1E0C9D538];
        v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24, v25, v10, v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFromValue:", v27);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24, v25, width, height);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setToValue:", v28);

        objc_msgSend(v31, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addAnimation:forKey:", v26, CFSTR("bounds interpolation"));

      }
    }
  }

}

- (double)nonInteractiveDuration
{
  return 0.0;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)cancelNonInteractiveAnimation
{
  void *v3;
  id v4;

  -[UIKeyboardKeyplaneTransition completionBlock](self, "completionBlock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeyplaneTransition setCompletionBlock:](self, "setCompletionBlock:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)updateWithProgress:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[UIView layer](self->_startView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setSpeed:", v6);

  -[UIView layer](self->_endView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setSpeed:", v8);

  self->_currentProgress = a3;
  if (a3 <= 1.0)
    v9 = a3;
  else
    v9 = 1.0;
  if (a3 < 0.0)
    v9 = 0.0;
  if (self->_initiallyAtEnd)
    v10 = 1.0 - v9;
  else
    v10 = v9;
  -[UIView layer](self->_startView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeOffset:", v10);

  -[UIView layer](self->_endView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeOffset:", v10);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_transitionViews;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "layer", (_QWORD)v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = 0;
        objc_msgSend(v19, "setSpeed:", v20);

        objc_msgSend(v18, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTimeOffset:", v10);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  -[UIKeyboardKeyplaneTransition transitionDelegate](self, "transitionDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeyplaneTransition startHeight](self, "startHeight");
  v24 = v23;
  -[UIKeyboardKeyplaneTransition endHeight](self, "endHeight");
  objc_msgSend(v22, "updateProgress:startHeight:endHeight:", v10, v24, v25);

}

- (void)removeAllAnimations
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIView layer](self->_startView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setSpeed:", v4);

  -[UIView layer](self->_endView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setSpeed:", v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_transitionViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "layer", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeAnimationForKey:", CFSTR("position interpolation"));

        objc_msgSend(v12, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeAnimationForKey:", CFSTR("bounds interpolation"));

        objc_msgSend(v12, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = 1.0;
        objc_msgSend(v15, "setSpeed:", v16);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)finalizeTransition
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  -[UIKeyboardKeyplaneTransition removeAllAnimations](self, "removeAllAnimations");
  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  -[UIKeyboardKeyplaneTransition completionBlock](self, "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardKeyplaneTransition completionBlock](self, "completionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[UIKeyboardKeyplaneTransition setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
  -[UIKeyboardKeyplaneTransition transitionDelegate](self, "transitionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionDidFinish:", 1);

}

- (void)transitionToFinalState:(id)a3
{
  double v4;
  double finishProgress;
  double finishDuration;
  double v7;

  objc_msgSend(a3, "timestamp");
  finishProgress = self->_finishProgress;
  if (vabdd_f64(self->_currentProgress, finishProgress) < 0.01
    || (finishDuration = self->_finishDuration, v7 = v4 - self->_finalTransitionStartTime, v7 >= finishDuration))
  {
    -[UIKeyboardKeyplaneTransition finalizeTransition](self, "finalizeTransition");
  }
  else
  {
    -[UIKeyboardKeyplaneTransition updateWithProgress:](self, "updateWithProgress:", self->_liftOffProgress + v7 / finishDuration * (finishProgress - self->_liftOffProgress));
  }
}

- (void)finishWithProgress:(double)a3 completionBlock:(id)a4
{
  double v6;
  double currentProgress;
  BOOL v8;
  double v9;
  void *v10;
  void *v11;
  CADisplayLink *v12;
  CADisplayLink *displayLink;
  CADisplayLink *v14;
  id v15;

  -[UIKeyboardKeyplaneTransition setCompletionBlock:](self, "setCompletionBlock:", a4);
  v6 = 1.0 - a3;
  if (!self->_initiallyAtEnd)
    v6 = a3;
  currentProgress = self->_currentProgress;
  self->_liftOffProgress = currentProgress;
  self->_finishProgress = v6;
  v8 = currentProgress >= 0.0 && currentProgress <= 1.0;
  v9 = 3.0;
  if (!v8)
    v9 = 9.0;
  self->_finishDuration = vabdd_f64(currentProgress, v6) / v9;
  self->_finalTransitionStartTime = CACurrentMediaTime();
  -[UIView window](self->_startView, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayLinkWithTarget:selector:", self, sel_transitionToFinalState_);
  v12 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v12;

  v14 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

}

- (BOOL)canDisplayTransitionFromKeyplane:(id)a3 toKeyplane:(id)a4
{
  return self->_start == a3 && self->_end == a4;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (void)setKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_keyboard, a3);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (UIKeyboardKeyplaneTransitionDelegate)transitionDelegate
{
  return (UIKeyboardKeyplaneTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitionDelegate);
}

- (void)setTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitionDelegate, a3);
}

- (BOOL)initiallyAtEnd
{
  return self->_initiallyAtEnd;
}

- (void)setInitiallyAtEnd:(BOOL)a3
{
  self->_initiallyAtEnd = a3;
}

- (UIKBKeyViewAnimator)keyViewAnimator
{
  return self->_keyViewAnimator;
}

- (void)setKeyViewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_keyViewAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_transitionViews, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
