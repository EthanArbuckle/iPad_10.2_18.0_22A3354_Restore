@implementation _PUScrollViewPPTScrollHelper

- (_PUScrollViewPPTScrollHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView+PhotosUI.m"), 285, CFSTR("%s is not available as initializer"), "-[_PUScrollViewPPTScrollHelper init]");

  abort();
}

- (_PUScrollViewPPTScrollHelper)initWithScrollView:(id)a3
{
  id v4;
  _PUScrollViewPPTScrollHelper *v5;
  _PUScrollViewPPTScrollHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PUScrollViewPPTScrollHelper;
  v5 = -[_PUScrollViewPPTScrollHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scrollView, v4);

  return v6;
}

- (void)scrollWithStartHandler:(id)a3 incrementHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);

  v14 = (void (**)(void))a3;
  v8 = a4;
  v9 = a5;
  v10 = getenv("CA_BENCHMARK");
  if (v10 && *v10 != 48)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__incrementScroll);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_PUScrollViewPPTScrollHelper _setDisplayLink:](self, "_setDisplayLink:", v11);
  -[_PUScrollViewPPTScrollHelper scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pu_setPPTScrollHelper:", self);
  objc_msgSend(v12, "_suppressImplicitAnimationsForScrollTest");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

  }
  else
  {
    -[_PUScrollViewPPTScrollHelper performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__incrementScroll, 0, 0.0);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[_PUScrollViewPPTScrollHelper _setLastIncrementTime:](self, "_setLastIncrementTime:");
  -[_PUScrollViewPPTScrollHelper _setIncrementHandler:](self, "_setIncrementHandler:", v8);
  -[_PUScrollViewPPTScrollHelper _setCompletionHandler:](self, "_setCompletionHandler:", v9);
  if (v14)
    v14[2]();

}

- (void)_incrementScroll
{
  double v4;
  double v5;
  double v6;
  double v7;
  void (**v8)(_QWORD, _QWORD, double);
  void *v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[_PUScrollViewPPTScrollHelper _lastIncrementTime](self, "_lastIncrementTime");
  v7 = v5 - v6;
  -[_PUScrollViewPPTScrollHelper _setLastIncrementTime:](self, "_setLastIncrementTime:", v5);
  v10 = 0;
  -[_PUScrollViewPPTScrollHelper _incrementHandler](self, "_incrementHandler");
  v8 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, char *, double))v8)[2](v8, &v10, v7);

  if (v10)
  {
    -[_PUScrollViewPPTScrollHelper _endScroll](self, "_endScroll");
  }
  else
  {
    -[_PUScrollViewPPTScrollHelper _displayLink](self, "_displayLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[_PUScrollViewPPTScrollHelper performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, 0, 0.0);
  }
}

- (void)_endScroll
{
  void *v3;
  void (**v4)(void);
  void *v5;
  id v6;

  -[_PUScrollViewPPTScrollHelper _completionHandler](self, "_completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PUScrollViewPPTScrollHelper _completionHandler](self, "_completionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[_PUScrollViewPPTScrollHelper _setIncrementHandler:](self, "_setIncrementHandler:", 0);
  -[_PUScrollViewPPTScrollHelper _setCompletionHandler:](self, "_setCompletionHandler:", 0);
  -[_PUScrollViewPPTScrollHelper _displayLink](self, "_displayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[_PUScrollViewPPTScrollHelper scrollView](self, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_reenableImplicitAnimationsAfterScrollTest");
  objc_msgSend(v6, "_pu_setPPTScrollHelper:", 0);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (CGPoint)originContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originContentOffset.x;
  y = self->_originContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setOriginContentOffset:(CGPoint)a3
{
  self->_originContentOffset = a3;
}

- (CADisplayLink)_displayLink
{
  return (CADisplayLink *)objc_loadWeakRetained((id *)&self->__displayLink);
}

- (void)_setDisplayLink:(id)a3
{
  objc_storeWeak((id *)&self->__displayLink, a3);
}

- (double)_lastIncrementTime
{
  return self->__lastIncrementTime;
}

- (void)_setLastIncrementTime:(double)a3
{
  self->__lastIncrementTime = a3;
}

- (id)_incrementHandler
{
  return self->__incrementHandler;
}

- (void)_setIncrementHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__incrementHandler, 0);
  objc_destroyWeak((id *)&self->__displayLink);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
