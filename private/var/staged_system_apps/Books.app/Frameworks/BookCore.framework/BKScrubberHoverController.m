@implementation BKScrubberHoverController

- (BKScrubberHoverController)initWithScrubber:(id)a3
{
  id v4;
  BKScrubberHoverController *v5;
  UIHoverGestureRecognizer *v6;
  UIHoverGestureRecognizer *gesture;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKScrubberHoverController;
  v5 = -[BKScrubberHoverController init](&v10, "init");
  if (v5)
  {
    v6 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v5, "onHover:");
    gesture = v5->_gesture;
    v5->_gesture = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    objc_msgSend(v8, "addGestureRecognizer:", v5->_gesture);

    objc_storeWeak((id *)&v5->_scrubber, v4);
  }

  return v5;
}

- (void)onHover:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberHoverController gesture](self, "gesture"));

  if (v5 == v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrubber);
    objc_msgSend(WeakRetained, "updateHoverState");

  }
}

- (int64_t)gestureHoverState
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  int64_t v7;
  BKScrubberControl **p_scrubber;
  id WeakRetained;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  _BOOL4 v21;
  CGPoint v23;
  CGRect v24;
  CGRect v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberHoverController gesture](self, "gesture"));
  if ((char *)objc_msgSend(v3, "state") - 1 > (_BYTE *)&dword_0 + 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    if (v4
      && (objc_msgSend(v3, "locationInView:", v4), v6 = v5,
                                                   objc_msgSend(v4, "bounds"),
                                                   v6 >= CGRectGetMaxY(v24) + -100.0))
    {
      p_scrubber = &self->_scrubber;
      WeakRetained = objc_loadWeakRetained((id *)p_scrubber);
      objc_msgSend(WeakRetained, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = objc_loadWeakRetained((id *)p_scrubber);
      objc_msgSend(v3, "locationInView:", v18);
      v23.x = v19;
      v23.y = v20;
      v25.origin.x = v11;
      v25.origin.y = v13;
      v25.size.width = v15;
      v25.size.height = v17;
      v21 = CGRectContainsPoint(v25, v23);

      if (v21)
        v7 = 2;
      else
        v7 = 1;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (UIHoverGestureRecognizer)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
  objc_storeStrong((id *)&self->_gesture, a3);
}

- (BKScrubberControl)scrubber
{
  return (BKScrubberControl *)objc_loadWeakRetained((id *)&self->_scrubber);
}

- (void)setScrubber:(id)a3
{
  objc_storeWeak((id *)&self->_scrubber, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrubber);
  objc_storeStrong((id *)&self->_gesture, 0);
}

@end
