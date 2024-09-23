@implementation ExpandableMacPopoverPresentationController

- (void)setMinimizedMode:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;

  if (self->_minimizedMode != a3)
  {
    self->_minimizedMode = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SCROLLING_OPENS_PLACECARD_KEY_ROTATED"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExpandableMacPopoverPresentationController scrollExpandGestureRecognizer](self, "scrollExpandGestureRecognizer"));
        objc_msgSend(v7, "addGestureRecognizer:", v8);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
      objc_msgSend(v9, "macContaineeWidth");
      v11 = v10;
      v12 = 374.0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ExpandableMacPopoverPresentationController scrollExpandGestureRecognizer](self, "scrollExpandGestureRecognizer"));
      objc_msgSend(v14, "removeGestureRecognizer:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
      objc_msgSend(v16, "heightForLayout:", 3);
      v12 = v17;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
      objc_msgSend(v9, "macContaineeWidth");
      v11 = v18;
      if (v12 > 610.0)
        v12 = 610.0;
    }

    -[MacPopoverPresentationController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v12);
  }
}

- (UIPanGestureRecognizer)scrollExpandGestureRecognizer
{
  UIPanGestureRecognizer *scrollExpandGestureRecognizer;
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;

  scrollExpandGestureRecognizer = self->_scrollExpandGestureRecognizer;
  if (!scrollExpandGestureRecognizer)
  {
    v4 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePanGesture:");
    v5 = self->_scrollExpandGestureRecognizer;
    self->_scrollExpandGestureRecognizer = v4;

    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_scrollExpandGestureRecognizer, "setAllowedScrollTypesMask:", 3);
    -[UIPanGestureRecognizer setDelegate:](self->_scrollExpandGestureRecognizer, "setDelegate:", self);
    scrollExpandGestureRecognizer = self->_scrollExpandGestureRecognizer;
  }
  return scrollExpandGestureRecognizer;
}

- (void)expandPopover
{
  -[ExpandableMacPopoverPresentationController setMinimizedMode:](self, "setMinimizedMode:", 0);
}

- (void)configurePopoverSize
{
  -[ExpandableMacPopoverPresentationController setMinimizedMode:](self, "setMinimizedMode:", 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ExpandableMacPopoverPresentationController scrollExpandGestureRecognizer](self, "scrollExpandGestureRecognizer"));

  return v6 == v5;
}

- (void)handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacPopoverPresentationController containeeViewController](self, "containeeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "translationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = fabs(v10);
  v12 = fabs(v8);
  if (v10 != 0.0 && v11 > v12)
    -[ExpandableMacPopoverPresentationController expandPopover](self, "expandPopover", v11);
}

- (BOOL)minimizedMode
{
  return self->_minimizedMode;
}

- (void)setScrollExpandGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollExpandGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollExpandGestureRecognizer, 0);
}

@end
