@implementation RoutePlanningTransitionController

- (void)dealloc
{
  objc_super v3;

  -[RoutePlanningTransitionController stopTransition](self, "stopTransition");
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningTransitionController;
  -[RoutePlanningTransitionController dealloc](&v3, "dealloc");
}

- (RoutePlanningTransitionController)initWithScrollView:(id)a3
{
  id v4;
  RoutePlanningTransitionController *v5;
  RoutePlanningTransitionController *v6;
  id WeakRetained;
  void *v8;
  RoutePlanningTransitionController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningTransitionController;
  v5 = -[RoutePlanningTransitionController init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    v5->_showMaximumContentWhenExpanding = 1;
    objc_storeWeak((id *)&v5->_scrollView, v4);
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "panGestureRecognizer"));
      objc_msgSend(v8, "addTarget:action:", v6, "_panGestureRecognizerAction:");

    }
    v9 = v6;
  }

  return v6;
}

- (RoutePlanningTransitionContext)currentTransitionContext
{
  return self->_context;
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (a3)
      -[RoutePlanningTransitionController startTransition](self, "startTransition");
    else
      -[RoutePlanningTransitionController stopTransition](self, "stopTransition");
  }
}

- (void)setCardDragEnabled:(BOOL)a3
{
  if (self->_cardDragEnabled != a3)
  {
    self->_cardDragEnabled = a3;
    if (!a3)
      -[RoutePlanningTransitionController _terminateCardDragIfNeeded](self, "_terminateCardDragIfNeeded");
  }
}

- (double)_tableHeight
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  CGRect v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentInset");
  v7 = Height - v6;

  return v7;
}

- (double)_scrollYForMediumHeight
{
  double scrollYForMediumHeight;
  void *v3;
  double v4;
  double v5;

  scrollYForMediumHeight = self->_scrollYForMediumHeight;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentInset");
  v5 = scrollYForMediumHeight - v4;

  return v5;
}

- (double)_scrollYForFullHeight
{
  double scrollYForFullHeight;
  void *v3;
  double v4;
  double v5;

  scrollYForFullHeight = self->_scrollYForFullHeight;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentInset");
  v5 = scrollYForFullHeight - v4;

  return v5;
}

- (double)_pinnedScrollY
{
  double pinnedScrollY;
  void *v3;
  double v4;
  double v5;

  pinnedScrollY = self->_pinnedScrollY;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentInset");
  v5 = pinnedScrollY - v4;

  return v5;
}

- (void)startTransition
{
  void *v3;
  RoutePlanningTransitionContext *v4;
  RoutePlanningTransitionContext *context;
  void *v6;
  char Card;
  void *v8;
  void *v9;
  void *v10;
  double heightOfRowToKeepVisible;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *scrollViewMinimumHeightConstraint;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  id v16;
  NSObject *v17;
  RoutePlanningTransitionContext *v18;
  int v19;
  RoutePlanningTransitionContext *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController delegate](self, "delegate"));
  v4 = (RoutePlanningTransitionContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionContextForTransitionController:", self));
  context = self->_context;
  self->_context = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController delegate](self, "delegate"));
  objc_msgSend(v6, "transitionControllerWillStart:", self);

  -[RoutePlanningTransitionController _tableHeight](self, "_tableHeight");
  -[RoutePlanningTransitionController _resetValuesToStartTransitionFromTableHeight:](self, "_resetValuesToStartTransitionFromTableHeight:");
  Card = -[ContainerViewController delaysFirstCardPresentation]_0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
  v10 = v9;
  heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
  if ((Card & 1) != 0)
  {
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", heightOfRowToKeepVisible));
    scrollViewMinimumHeightConstraint = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = v12;

  }
  else
  {
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", heightOfRowToKeepVisible));
    v15 = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = v14;

    -[NSLayoutConstraint setActive:](self->_scrollViewMinimumHeightConstraint, "setActive:", 1);
  }
  v16 = sub_1004E11A8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = self->_context;
    v19 = 138412290;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Starting transition with %@", (uint8_t *)&v19, 0xCu);
  }

}

- (void)stopTransition
{
  id v3;
  NSObject *v4;
  NSLayoutConstraint *scrollViewMinimumHeightConstraint;
  void *v6;
  RoutePlanningTransitionContext *context;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  double v26;
  __int16 v27;
  double v28;

  if (self->_context)
  {
    v3 = sub_1004E11A8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stopping transition", (uint8_t *)&v25, 2u);
    }

    -[NSLayoutConstraint setActive:](self->_scrollViewMinimumHeightConstraint, "setActive:", 0);
    scrollViewMinimumHeightConstraint = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController delegate](self, "delegate"));
    objc_msgSend(v6, "transitionControllerWillFinish:", self);

    if (self->_isPanningTable)
      goto LABEL_5;
    -[RoutePlanningTransitionController _tableHeight](self, "_tableHeight");
    v9 = v8;
    if (!-[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout")
      || !-[RoutePlanningTransitionController _isClosestToFullHeight:](self, "_isClosestToFullHeight:", v9))
    {
      -[RoutePlanningTransitionController _updateScrollYForMediumHeightIfNeeded:](self, "_updateScrollYForMediumHeightIfNeeded:", 0);
      if (-[RoutePlanningTransitionController _isClosestToFullHeight:](self, "_isClosestToFullHeight:", v9))
        -[RoutePlanningTransitionController _scrollYForFullHeight](self, "_scrollYForFullHeight");
      else
        -[RoutePlanningTransitionController _scrollYForMediumHeight](self, "_scrollYForMediumHeight");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v12, "contentOffset");
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      v16 = vabdd_f64(v14, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traitCollection"));
      objc_msgSend(v17, "displayScale");
      v18 = 1.0;
      if (v19 >= 1.0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traitCollection"));
        objc_msgSend(v20, "displayScale");
        v18 = v21;

      }
      if (v16 > 1.0 / v18)
      {
        v22 = sub_1004E11A8();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v25 = 134218240;
          v26 = v11;
          v27 = 2048;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Setting final offset: %#.5lf (current: %#.5lf)", (uint8_t *)&v25, 0x16u);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
        objc_msgSend(v24, "setContentOffset:animated:", 1, 0.0, v11);

      }
LABEL_5:
      context = self->_context;
      self->_context = 0;

    }
  }
}

- (void)_updateScrollYForMediumHeightIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  double scrollYForMediumHeight;
  unsigned int v10;
  uint64_t v11;
  double v12;
  id v13;
  NSObject *v14;
  double pinnedScrollY;
  int v16;
  double v17;
  __int16 v18;
  double v19;

  v3 = a3;
  -[RoutePlanningTransitionContext currentFrameOrigin](self->_context, "currentFrameOrigin");
  v6 = v5;
  if (self->_scrollYForMediumHeight != v5)
  {
    v7 = sub_1004E11A8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      scrollYForMediumHeight = self->_scrollYForMediumHeight;
      v16 = 134218240;
      v17 = scrollYForMediumHeight;
      v18 = 2048;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updating scrollYForMediumHeight (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v16, 0x16u);
    }

    self->_scrollYForMediumHeight = v6;
    -[RoutePlanningTransitionController _updateScrollYForFullHeightIfNeeded](self, "_updateScrollYForFullHeightIfNeeded");
    if (v3)
    {
      v10 = -[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout");
      v11 = 24;
      if (v10)
        v11 = 32;
      v12 = *(double *)((char *)&self->super.isa + v11);
      if (vabdd_f64(v12, self->_pinnedScrollY) > 2.22044605e-16)
      {
        v13 = sub_1004E11A8();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          pinnedScrollY = self->_pinnedScrollY;
          v16 = 134218240;
          v17 = pinnedScrollY;
          v18 = 2048;
          v19 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Updating pinnedScrollY (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v16, 0x16u);
        }

        self->_pinnedScrollY = v12;
      }
    }
  }
}

- (void)updateTransitionWithHeight:(double)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  double pinnedScrollY;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  double v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;

  if (self->_isPinningScrollY)
  {
    if (!-[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout", a3)
      || !self->_isPanningTable
      || -[RoutePlanningTransitionController _shouldDragCardForPanEvent](self, "_shouldDragCardForPanEvent"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v4, "layoutIfNeeded");

      v5 = sub_1004E11A8();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        pinnedScrollY = self->_pinnedScrollY;
        *(_DWORD *)buf = 134217984;
        v31 = pinnedScrollY;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Update. Setting contentOffset to pinnedScrollY: %#.5lf", buf, 0xCu);
      }

      -[RoutePlanningTransitionController _pinnedScrollY](self, "_pinnedScrollY");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v10, "setContentOffset:", 0.0, v9);

    }
  }
  else
  {
    -[RoutePlanningTransitionController _tableHeight](self, "_tableHeight", a3);
    v29 = 0.0;
    -[RoutePlanningTransitionController _getScrollY:forTableHeight:](self, "_getScrollY:forTableHeight:", &v29);
    v11 = v29;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    v14 = UIRoundToViewScale(v12, v13, v11);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    objc_msgSend(v15, "contentOffset");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    v19 = vabdd_f64(v14, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
    objc_msgSend(v20, "displayScale");
    v21 = 1.0;
    if (v22 >= 1.0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
      objc_msgSend(v23, "displayScale");
      v21 = v24;

    }
    v25 = sub_1004E11A8();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
    if (v19 <= 1.0 / v21)
    {
      if (v27)
      {
        *(_DWORD *)buf = 134218240;
        v31 = v14;
        v32 = 2048;
        v33 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Update. No change to contentOffset.y: %#.5lf (unrounded: %#.5lf)", buf, 0x16u);
      }
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 134218496;
        v31 = v14;
        v32 = 2048;
        v33 = v29;
        v34 = 2048;
        v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Update. Setting contentOffset to %#.5lf (unrounded: %#.5lf, previous: %#.5lf)", buf, 0x20u);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v28, "layoutIfNeeded");

      v26 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      -[NSObject setContentOffset:](v26, "setContentOffset:", 0.0, v14);
    }

  }
}

- (void)setForceMinimumScrollViewHeight:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
    -[NSLayoutConstraint setActive:](self->_scrollViewMinimumHeightConstraint, "setActive:", v3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  id v14;
  NSObject *v15;
  double pinnedScrollY;
  int v17;
  double v18;

  y = a4.y;
  v8 = a3;
  if (!-[RoutePlanningTransitionController isTransitioning](self, "isTransitioning"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    if (y <= 0.0)
      v10 = 7;
    else
      v10 = 8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController delegate](self, "delegate"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v10, objc_msgSend(v11, "currentUITargetForAnalytics"), 0);

  }
  if (-[RoutePlanningTransitionController isTransitioning](self, "isTransitioning") && a5 && self->_isPinningScrollY)
  {
    -[RoutePlanningTransitionController _pinnedScrollY](self, "_pinnedScrollY");
    v13 = v12;
    objc_msgSend(v8, "setContentOffset:", 0.0, v12);
    a5->x = 0.0;
    a5->y = v13;
    v14 = sub_1004E11A8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      pinnedScrollY = self->_pinnedScrollY;
      v17 = 134217984;
      v18 = pinnedScrollY;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Will end dragging. Providing target offset of pinnedScrollY: %#.5lf", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  double pinnedScrollY;
  double v8;
  int v9;
  double v10;

  v4 = a3;
  if (-[RoutePlanningTransitionController isTransitioning](self, "isTransitioning") && self->_isPinningScrollY)
  {
    objc_msgSend(v4, "stopScrollingAndZooming");
    v5 = sub_1004E11A8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      pinnedScrollY = self->_pinnedScrollY;
      v9 = 134217984;
      v10 = pinnedScrollY;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Decelerating. Setting contentOffset to pinnedScrollY: %#.5lf", (uint8_t *)&v9, 0xCu);
    }

    -[RoutePlanningTransitionController _pinnedScrollY](self, "_pinnedScrollY");
    objc_msgSend(v4, "setContentOffset:", 0.0, v8);
  }

}

- (void)_resetValuesToStartTransitionFromTableHeight:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  double heightOfRowToKeepVisible;
  double scrollViewHeightForFullLayout;
  double scrollYForMediumHeight;
  unsigned int v15;
  __CFString *v16;
  __CFString *v17;
  double scrollYForFullHeight;
  double pinnedScrollY;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;

  -[RoutePlanningTransitionContext heightToFrame](self->_context, "heightToFrame", a3);
  self->_heightOfRowToKeepVisible = v4;
  -[RoutePlanningTransitionContext currentFrameOrigin](self->_context, "currentFrameOrigin");
  self->_scrollYForMediumHeight = v5;
  -[RoutePlanningTransitionContext tableViewHeightForFullLayout](self->_context, "tableViewHeightForFullLayout");
  self->_scrollViewHeightForFullLayout = v6;
  if (-[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout"))
  {
    -[RoutePlanningTransitionContext initialOffsetY](self->_context, "initialOffsetY");
    self->_scrollYForFullHeight = v7;
  }
  else
  {
    -[RoutePlanningTransitionController _updateScrollYForFullHeightIfNeeded](self, "_updateScrollYForFullHeightIfNeeded");
  }
  v8 = -[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout");
  v9 = 24;
  if (v8)
    v9 = 32;
  *(_QWORD *)&self->_pinnedScrollY = *(Class *)((char *)&self->super.isa + v9);
  v10 = sub_1004E11A8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
    scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
    scrollYForMediumHeight = self->_scrollYForMediumHeight;
    v15 = -[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout");
    v16 = CFSTR("NO");
    if (v15)
      v16 = CFSTR("YES");
    v17 = v16;
    scrollYForFullHeight = self->_scrollYForFullHeight;
    pinnedScrollY = self->_pinnedScrollY;
    v20 = 134219266;
    v21 = heightOfRowToKeepVisible;
    v22 = 2048;
    v23 = scrollYForMediumHeight;
    v24 = 2048;
    v25 = scrollViewHeightForFullLayout;
    v26 = 2112;
    v27 = v17;
    v28 = 2048;
    v29 = scrollYForFullHeight;
    v30 = 2048;
    v31 = pinnedScrollY;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Reset values: heightOfRowToKeepVisible: %#.5lf, scrollYForMediumHeight: %#.5lf, scrollViewHeightForFullLayout: %#.5lf, initiatedFromFullLayout: %@, scrollYForFullHeight: %#.5lf, pinnedScrollY: %#.5lf", (uint8_t *)&v20, 0x3Eu);

  }
}

- (void)_updateScrollYForFullHeightIfNeeded
{
  double scrollYForMediumHeight;
  double scrollViewHeightForFullLayout;
  double v5;
  double v6;
  BOOL v7;

  if (!-[RoutePlanningTransitionContext initiatedFromFullLayout](self->_context, "initiatedFromFullLayout"))
  {
    scrollYForMediumHeight = self->_scrollYForMediumHeight;
    if (self->_showMaximumContentWhenExpanding)
    {
      scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
      v5 = scrollYForMediumHeight + self->_heightOfRowToKeepVisible;
      v6 = v5 - scrollViewHeightForFullLayout;
      v7 = v5 > scrollViewHeightForFullLayout;
      scrollYForMediumHeight = 0.0;
      if (v7)
        scrollYForMediumHeight = v6;
    }
    self->_scrollYForFullHeight = scrollYForMediumHeight;
  }
}

- (void)_getScrollY:(double *)a3 forTableHeight:(double)a4
{
  double heightOfRowToKeepVisible;
  uint64_t v8;
  id v9;
  NSObject *v10;
  double v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  NSObject *v16;
  id v17;
  double v18;
  double scrollViewHeightForFullLayout;
  double v20;
  id v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  uint32_t v31;
  uint64_t v32;
  id v33;
  double v34;
  int v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;

  if (a3)
  {
    -[RoutePlanningTransitionController _updateScrollYForMediumHeightIfNeeded:](self, "_updateScrollYForMediumHeightIfNeeded:", 1);
    heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
    if (heightOfRowToKeepVisible <= a4)
    {
      scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
      if (scrollViewHeightForFullLayout > heightOfRowToKeepVisible)
      {
        v20 = (a4 - heightOfRowToKeepVisible) / (scrollViewHeightForFullLayout - heightOfRowToKeepVisible);
        v21 = sub_1004E11A8();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = self->_heightOfRowToKeepVisible;
          v24 = self->_scrollViewHeightForFullLayout;
          v35 = 134219008;
          v36 = v20 * 100.0;
          v37 = 2048;
          v38 = a4;
          v39 = 2048;
          v40 = v23;
          v41 = 2048;
          v42 = v24;
          v43 = 2048;
          v44 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "percentMediumToFull (table is taller): percentMediumToFull: %3.1lf%% | [(%#.5lf - %1.5lf) / (%#.5lf - %#.5lf)]", (uint8_t *)&v35, 0x34u);
        }

        -[RoutePlanningTransitionController _scrollYForMediumHeight](self, "_scrollYForMediumHeight");
        v26 = v25;
        -[RoutePlanningTransitionController _scrollYForFullHeight](self, "_scrollYForFullHeight");
        v28 = v27;
        *a3 = v26 + v20 * (v27 - v26);
        v29 = sub_1004E11A8();
        v10 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        v30 = *a3;
        v35 = 134219008;
        v36 = v30;
        v37 = 2048;
        v38 = v26;
        v39 = 2048;
        v40 = v20;
        v41 = 2048;
        v42 = v28;
        v43 = 2048;
        v44 = v26;
        v12 = "scrollY (table is taller): scrollY: %#.5lf | [%#.5lf + %1.2lf * (%#.5lf - %#.5lf)]";
        v13 = v10;
        v14 = OS_LOG_TYPE_DEBUG;
        v31 = 52;
        goto LABEL_18;
      }
      -[RoutePlanningTransitionController _scrollYForMediumHeight](self, "_scrollYForMediumHeight");
      *(_QWORD *)a3 = v32;
      v33 = sub_1004E11A8();
      v10 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v34 = *a3;
        v35 = 134217984;
        v36 = v34;
        v12 = "scrollY (table is taller, but scrollViewHeight is smaller than heightToKeepVisible): %#.5lf";
        v13 = v10;
        v14 = OS_LOG_TYPE_FAULT;
        goto LABEL_17;
      }
    }
    else
    {
      -[RoutePlanningTransitionController _scrollYForMediumHeight](self, "_scrollYForMediumHeight");
      *(_QWORD *)a3 = v8;
      v9 = sub_1004E11A8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = *a3;
        v35 = 134217984;
        v36 = v11;
        v12 = "scrollY (cell is taller): %#.5lf";
        v13 = v10;
        v14 = OS_LOG_TYPE_DEBUG;
LABEL_17:
        v31 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v35, v31);
      }
    }
LABEL_19:

    return;
  }
  v15 = sub_1004318FC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v35 = 136315650;
    v36 = COERCE_DOUBLE("-[RoutePlanningTransitionController _getScrollY:forTableHeight:]");
    v37 = 2080;
    v38 = COERCE_DOUBLE("RoutePlanningTransitionController.m");
    v39 = 1024;
    LODWORD(v40) = 324;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v35, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v17 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols")));
      v35 = 138412290;
      v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v35, 0xCu);

    }
    goto LABEL_19;
  }
}

- (BOOL)_isClosestToFullHeight:(double)a3
{
  return self->_heightOfRowToKeepVisible
       + (self->_scrollViewHeightForFullLayout - self->_heightOfRowToKeepVisible) * 0.5 <= a3;
}

- (void)_panGestureRecognizerAction:(id)a3
{
  char *v4;
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = (char *)objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    self->_isPanningTable = 0;
    goto LABEL_9;
  }
  if (v4 == (char *)2)
  {
    if (-[RoutePlanningTransitionController _shouldDragCardForPanEvent](self, "_shouldDragCardForPanEvent"))
    {
LABEL_8:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v7, "translationInView:", v5);
      -[RoutePlanningTransitionController _initiateCardDragIfNeededWithInitialVerticalTranslation:](self, "_initiateCardDragIfNeededWithInitialVerticalTranslation:", v6);

      goto LABEL_10;
    }
LABEL_9:
    -[RoutePlanningTransitionController _terminateCardDragIfNeeded](self, "_terminateCardDragIfNeeded");
    goto LABEL_10;
  }
  if (v4 == (char *)1)
  {
    self->_isPanningTable = 1;
    if (-[RoutePlanningTransitionController _shouldDragCardForPanEvent](self, "_shouldDragCardForPanEvent"))
      goto LABEL_8;
  }
LABEL_10:

}

- (void)_initiateCardDragIfNeededWithInitialVerticalTranslation:(double)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  if (!self->_isPinningScrollY)
  {
    self->_isPinningScrollY = 1;
    self->_scrollViewPanGestureTranslationBeforeCardDrag = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    v5 = objc_msgSend(v4, "showsVerticalScrollIndicator");

    if (v5)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);

    }
  }
}

- (void)_terminateCardDragIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  if (self->_isPinningScrollY)
  {
    self->_isPinningScrollY = 0;
    self->_scrollViewPanGestureTranslationBeforeCardDrag = 0.0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    v4 = objc_msgSend(v3, "showsVerticalScrollIndicator");

    if ((v4 & 1) == 0)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
      objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 1);

    }
  }
}

- (BOOL)_shouldDragCardForPanEvent
{
  void *v2;
  void *v3;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  unsigned int v10;
  char v11;
  double scrollViewHeightForFullLayout;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;

  if (!-[RoutePlanningTransitionController isCardDragEnabled](self, "isCardDragEnabled"))
    return 0;
  -[RoutePlanningTransitionController _tableHeight](self, "_tableHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  v9 = UIRoundToViewScale(v7, v8, v6);

  v10 = -[RoutePlanningTransitionController isTransitioning](self, "isTransitioning");
  v11 = v10;
  if (v10)
  {
    scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController delegate](self, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitionContextForTransitionController:", self));
    objc_msgSend(v3, "tableViewHeightForFullLayout");
    scrollViewHeightForFullLayout = v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  v16 = UIRoundToViewScale(v14, v15, scrollViewHeightForFullLayout);

  if ((v11 & 1) == 0)
  {

  }
  if (v9 < v16)
  {
    if (v9 != 0.0)
      return 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "panGestureRecognizer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
    objc_msgSend(v18, "translationInView:", v19);
    v21 = v20;

    goto LABEL_12;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "panGestureRecognizer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v23, "translationInView:", v24);
  v26 = v25;

  if (v26 <= 0.0)
    return 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionController scrollView](self, "scrollView"));
  objc_msgSend(v17, "contentOffset");
  v21 = v27;
LABEL_12:
  v28 = v21 <= 0.0;

  return v28;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (BOOL)isCardDragEnabled
{
  return self->_cardDragEnabled;
}

- (BOOL)showMaximumContentWhenExpanding
{
  return self->_showMaximumContentWhenExpanding;
}

- (void)setShowMaximumContentWhenExpanding:(BOOL)a3
{
  self->_showMaximumContentWhenExpanding = a3;
}

- (ContaineeProtocol)delegate
{
  return (ContaineeProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_scrollViewMinimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
