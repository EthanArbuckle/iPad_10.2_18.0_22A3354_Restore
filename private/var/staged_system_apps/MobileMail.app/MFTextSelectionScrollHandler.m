@implementation MFTextSelectionScrollHandler

- (MFTextSelectionScrollHandler)initWithScrollView:(id)a3
{
  id v5;
  MFTextSelectionScrollHandler *v6;
  MFTextSelectionScrollHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTextSelectionScrollHandler;
  v6 = -[MFTextSelectionScrollHandler init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scrollView, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MFTextSelectionScrollHandler _reset](self, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)MFTextSelectionScrollHandler;
  -[MFTextSelectionScrollHandler dealloc](&v3, "dealloc");
}

- (void)handleTextSelectionChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (self->_isListeningForTouches)
    {
      self->_isMovingCursor = 1;
    }
    else
    {
      self->_isListeningForTouches = 1;
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      objc_copyWeak(&v7, &location);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler window](self, "window", _NSConcreteStackBlock, 3221225472, sub_1001ACCC8, &unk_100522CF0));
      objc_msgSend(v5, "setTouchEventListener:", &v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[MFTextSelectionScrollHandler _reset](self, "_reset");
  }

}

- (void)handleTouchEvents:(id)a3
{
  UITouch *textSelectionTouch;
  id *p_textSelectionTouch;
  void *v6;
  UITouch *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  p_textSelectionTouch = (id *)&self->_textSelectionTouch;
  textSelectionTouch = self->_textSelectionTouch;
  if (textSelectionTouch)
    goto LABEL_8;
  if (objc_msgSend(v14, "count") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "anyObject"));
    if (objc_msgSend(v6, "tapCount"))
      objc_storeStrong((id *)&self->_textSelectionTouch, v6);

  }
  textSelectionTouch = (UITouch *)*p_textSelectionTouch;
  if (*p_textSelectionTouch)
  {
LABEL_8:
    if ((id)-[UITouch phase](textSelectionTouch, "phase") == (id)4
      || objc_msgSend(*p_textSelectionTouch, "phase") == (id)3)
    {
      self->_isMovingCursor = 0;
      v7 = self->_textSelectionTouch;
      self->_textSelectionTouch = 0;

    }
    v8 = *p_textSelectionTouch;
    if (*p_textSelectionTouch && self->_isMovingCursor)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
      objc_msgSend(v8, "locationInView:", v9);
      v11 = v10;
      v13 = v12;

      -[MFTextSelectionScrollHandler _scrollForTouchLocation:](self, "_scrollForTouchLocation:", v11, v13);
    }
  }

}

- (void)_scrollForTouchLocation:(CGPoint)a3
{
  double y;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;

  y = a3.y;
  self->_scrollOffsetIncrement = self->_scrollOffsetIncrement + 0.2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  if (y + -100.0 <= v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
    objc_msgSend(v14, "contentOffset");
    v16 = v15 - self->_scrollOffsetIncrement;

    -[MFTextSelectionScrollHandler _minScrollOffset](self, "_minScrollOffset");
    if (v16 >= v17)
      v17 = v16;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
    objc_msgSend(v8, "contentOffset");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
    objc_msgSend(v11, "bounds");
    v13 = v10 + v12;

    if (y + 100.0 < v13)
    {
      self->_scrollOffsetIncrement = 0.0;
      return;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
    objc_msgSend(v18, "contentOffset");
    v20 = v19 + self->_scrollOffsetIncrement;

    -[MFTextSelectionScrollHandler _maxScrollOffset](self, "_maxScrollOffset");
    if (v20 < v17)
      v17 = v20;
  }
  -[MFTextSelectionScrollHandler _setContentOffsetY:](self, "_setContentOffsetY:", v17);
}

- (void)_setContentOffsetY:(double)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentOffset");
  objc_msgSend(v4, "setContentOffset:animated:", 0);

  v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AD0A4;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)_maxScrollOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v9, "bounds");
  v11 = v5 + v8 - v10;

  return v11;
}

- (double)_minScrollOffset
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  objc_msgSend(v2, "contentInset");
  v4 = -v3;

  return v4;
}

- (id)window
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler scrollView](self, "scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  return v3;
}

- (void)_reset
{
  void *v3;
  UITouch *textSelectionTouch;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTextSelectionScrollHandler window](self, "window"));
  objc_msgSend(v3, "setTouchEventListener:", 0);

  textSelectionTouch = self->_textSelectionTouch;
  self->_textSelectionTouch = 0;

  *(_WORD *)&self->_isListeningForTouches = 0;
  self->_scrollOffsetIncrement = 0.0;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)isListeningForTouches
{
  return self->_isListeningForTouches;
}

- (void)setIsListeningForTouches:(BOOL)a3
{
  self->_isListeningForTouches = a3;
}

- (BOOL)isMovingCursor
{
  return self->_isMovingCursor;
}

- (void)setIsMovingCursor:(BOOL)a3
{
  self->_isMovingCursor = a3;
}

- (UITouch)textSelectionTouch
{
  return self->_textSelectionTouch;
}

- (void)setTextSelectionTouch:(id)a3
{
  objc_storeStrong((id *)&self->_textSelectionTouch, a3);
}

- (double)scrollOffsetIncrement
{
  return self->_scrollOffsetIncrement;
}

- (void)setScrollOffsetIncrement:(double)a3
{
  self->_scrollOffsetIncrement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionTouch, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
