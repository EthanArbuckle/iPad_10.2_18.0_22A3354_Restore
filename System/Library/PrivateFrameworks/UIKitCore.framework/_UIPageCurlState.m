@implementation _UIPageCurlState

- (_UIPageCurlState)initWithPageCurl:(id)a3 andCurlType:(int64_t)a4 fromLocation:(CGPoint)a5 withReferenceLocation:(CGPoint)a6 inDirection:(int64_t)a7 withView:(id)a8 revealingView:(id)a9 completion:(id)a10 finally:(id)a11
{
  CGFloat y;
  CGFloat x;
  CGFloat v17;
  CGFloat v18;
  id v22;
  id v23;
  id v24;
  _UIPageCurlState *v25;
  _UIPageCurlState *v26;
  int64_t curlType;
  uint64_t v29;
  uint64_t v30;
  id finally;
  id v33;
  objc_super v34;

  y = a6.y;
  x = a6.x;
  v17 = a5.y;
  v18 = a5.x;
  v33 = a3;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v34.receiver = self;
  v34.super_class = (Class)_UIPageCurlState;
  v25 = -[_UITransitionState initWithTransitionDirection:completion:](&v34, sel_initWithTransitionDirection_completion_, a7, a10);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_pageCurl, a3);
    v26->_curlType = a4;
    v26->_initialLocation.x = v18;
    v26->_initialLocation.y = v17;
    v26->_referenceLocation.x = x;
    v26->_referenceLocation.y = y;
    objc_storeStrong((id *)&v26->_frontView, a8);
    objc_storeStrong((id *)&v26->_backView, a9);
    curlType = v26->_curlType;
    if (curlType == 4 || curlType == 1)
      v29 = 1;
    else
      v29 = 2;
    v26->_curlState = v29;
    v26->_willComplete = 1;
    v30 = objc_msgSend(v24, "copy");
    finally = v26->_finally;
    v26->_finally = (id)v30;

  }
  return v26;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPageCurlState finally](self, "finally");
  v3.receiver = self;
  v3.super_class = (Class)_UIPageCurlState;
  -[_UIPageCurlState dealloc](&v3, sel_dealloc);
}

- (void)invalidatePageCurl
{
  _UIPageCurl *pageCurl;

  pageCurl = self->_pageCurl;
  self->_pageCurl = 0;

}

- (CGRect)_pageViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[_UIPageCurlState pageCurl](self, "pageCurl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pageViewFrame:", -[_UITransitionState transitionDirection](self, "transitionDirection") == 1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIView)frontPageView
{
  UIView *frontPageView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  _UIPageCurl *pageCurl;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_frontView)
  {
    frontPageView = self->_frontPageView;
    if (frontPageView)
    {
      -[_UIPageCurlState _pageViewFrame](self, "_pageViewFrame");
      -[UIView setFrame:](frontPageView, "setFrame:");
    }
    else
    {
      v4 = [UIView alloc];
      -[_UIPageCurlState _pageViewFrame](self, "_pageViewFrame");
      v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
      v6 = self->_frontPageView;
      self->_frontPageView = v5;

      pageCurl = self->_pageCurl;
      -[UIView layer](self->_frontPageView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPageCurl _ensureCurlFilterOnLayer:](pageCurl, "_ensureCurlFilterOnLayer:", v8);

      if (self->_backView)
      {
        -[UIView layer](self->_frontPageView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKeyPath:", CFSTR("filters.curl"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("inputBackEnabled"));

      }
    }
  }
  return self->_frontPageView;
}

- (UIView)backPageView
{
  UIView *backPageView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  _UIPageCurl *pageCurl;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CATransform3D v18;
  CATransform3D v19;
  CATransform3D v20;

  if (self->_backView)
  {
    backPageView = self->_backPageView;
    if (backPageView)
    {
      -[_UIPageCurlState _pageViewFrame](self, "_pageViewFrame");
      -[UIView setFrame:](backPageView, "setFrame:");
    }
    else
    {
      v4 = [UIView alloc];
      -[_UIPageCurlState _pageViewFrame](self, "_pageViewFrame");
      v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
      v6 = self->_backPageView;
      self->_backPageView = v5;

      pageCurl = self->_pageCurl;
      -[UIView layer](self->_backPageView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPageCurl _ensureCurlFilterOnLayer:](pageCurl, "_ensureCurlFilterOnLayer:", v8);

      -[UIView layer](self->_backPageView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_backPageView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_UIPageCurl _spineLocation](self->_pageCurl, "_spineLocation");
      memset(&v18, 0, sizeof(v18));
      CATransform3DMakeScale(&v18, -1.0, 1.0, 1.0);
      if (v11 <= 0x20 && ((1 << v11) & 0x100000104) != 0)
      {
        v19 = v18;
        CATransform3DRotate(&v20, &v19, 3.14159265, 0.0, 0.0, 1.0);
        v18 = v20;
      }
      objc_msgSend(v9, "setSublayerTransform:", &v18);

      -[UIView layer](self->_backPageView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKeyPath:", CFSTR("filters.curl"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("inputFrontEnabled"));

      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "setValue:forKey:", objc_msgSend(v16, "CGColor"), CFSTR("inputBackColor0"));

    }
  }
  return self->_backPageView;
}

- (void)addFrontPageContent
{
  UIView *frontView;
  UIView *frontPageView;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[UIView addSubview:](self->_frontPageView, "addSubview:", self->_frontView);
  frontView = self->_frontView;
  frontPageView = self->_frontPageView;
  -[UIView center](frontPageView, "center");
  v6 = v5;
  v8 = v7;
  -[UIView superview](self->_frontPageView, "superview");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](frontPageView, "convertPoint:fromView:", v9, v6, v8);
  -[UIView setCenter:](frontView, "setCenter:");

}

- (void)addBackPageContent
{
  UIView *backView;
  UIView *backPageView;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[UIView addSubview:](self->_backPageView, "addSubview:", self->_backView);
  backView = self->_backView;
  backPageView = self->_backPageView;
  -[UIView center](backPageView, "center");
  v6 = v5;
  v8 = v7;
  -[UIView superview](self->_backPageView, "superview");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](backPageView, "convertPoint:fromView:", v9, v6, v8);
  -[UIView setCenter:](backView, "setCenter:");

}

- (void)setCurlState:(int64_t)a3 willComplete:(BOOL)a4
{
  int64_t curlType;
  void *v10;

  curlType = self->_curlType;
  if (curlType == 4 || curlType == 1)
  {
    if (self->_curlState != 1)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 420, CFSTR("Inconsistent curl state: current=%ld, updated=%ld"), self->_curlState, a3);

    }
  }
  else if (self->_curlState > a3)
  {
    goto LABEL_9;
  }
  self->_curlState = a3;
  self->_willComplete = a4;
}

- (BOOL)hasPendingAnimations
{
  return self->_completionCount != 0;
}

- (void)incrementCompletionCount
{
  ++self->_completionCount;
}

- (void)finally
{
  void (**finally)(id, SEL);

  finally = (void (**)(id, SEL))self->_finally;
  if (finally)
  {
    finally[2](finally, a2);
    finally = (void (**)(id, SEL))self->_finally;
  }
  self->_finally = 0;

}

- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPageCurlState;
  -[_UITransitionState cleanupWithFinishedState:completedState:](&v5, sel_cleanupWithFinishedState_completedState_, a3, a4);
  -[UIView removeFromSuperview](self->_frontPageView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_backPageView, "removeFromSuperview");
  -[_UIPageCurlState finally](self, "finally");
}

- (void)cleanup
{
  -[_UIPageCurlState cleanupWithFinishedState:completedState:](self, "cleanupWithFinishedState:completedState:", self->_finished, self->_willComplete);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  int64_t v7;
  int64_t curlState;
  id v9;

  v6 = a3;
  v7 = self->_completionCount - 1;
  self->_completionCount = v7;
  if (!v7)
  {
    curlState = self->_curlState;
    if ((curlState | 4) == 5)
    {
      self->_finished = a4;
      v9 = v6;
      -[_UIPageCurl _pageCurlAnimationDidStop:withState:](self->_pageCurl, "_pageCurlAnimationDidStop:withState:", v6, self);
      v6 = v9;
    }
    else if (curlState >= 3)
    {
      self->_curlState = 4;
    }
  }

}

- (int64_t)_effectiveTransitionDirection
{
  _BOOL4 willComplete;
  int64_t result;

  willComplete = self->_willComplete;
  result = -[_UITransitionState transitionDirection](self, "transitionDirection");
  if (!willComplete)
    return result == 0;
  return result;
}

- (BOOL)isCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  BOOL result;
  objc_super v10;

  if (-[_UIPageCurlState curlType](self, "curlType") != 1
    && -[_UIPageCurlState curlType](self, "curlType") != 4
    && -[_UIPageCurlState curlState](self, "curlState") != 5)
  {
    return 0;
  }
  v7 = -[_UIPageCurlState curlType](self, "curlType");
  v8 = v7;
  if (a3 <= 2 && v7 < 3 || (result = 0, a3 >= 3) && v8 >= 3)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIPageCurlState;
    return -[_UITransitionState isCompatibleWithTransitionInDirection:](&v10, sel_isCompatibleWithTransitionInDirection_, a4);
  }
  return result;
}

- (_UIPageCurl)pageCurl
{
  return self->_pageCurl;
}

- (int64_t)curlType
{
  return self->_curlType;
}

- (CGPoint)initialLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)referenceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_referenceLocation.x;
  y = self->_referenceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIView)frontView
{
  return self->_frontView;
}

- (UIView)backView
{
  return self->_backView;
}

- (int64_t)curlState
{
  return self->_curlState;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finally, 0);
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_frontView, 0);
  objc_storeStrong((id *)&self->_backPageView, 0);
  objc_storeStrong((id *)&self->_frontPageView, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
}

@end
