@implementation CompactMonthListAnimator

- (CompactMonthListAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9;
  id v10;
  CompactMonthListAnimator *v11;
  CompactMonthListAnimator *v12;
  CGSize size;
  CGPoint v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CompactMonthListAnimator;
  v11 = -[CompactMonthListAnimator init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->_reverse = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_paletteView, a4);
    size = CGRectNull.size;
    v12->_monthSplittingCutOutArea.origin = CGRectNull.origin;
    v12->_monthSplittingCutOutArea.size = size;
    v14 = CGPointZero;
    v12->_listViewNormalLocation = CGPointZero;
    v12->_monthViewSplittingLocation = v14;
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  return 0.65;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v44 = (void *)v8;
  if (-[CompactMonthListAnimator reverse](self, "reverse"))
    objc_msgSend(v9, "addSubview:", v8);
  else
    objc_msgSend(v9, "insertSubview:belowSubview:", v8, v7);
  v10 = -[CompactMonthListAnimator reverse](self, "reverse");
  v11 = v10 == 0;
  if (v10)
    v12 = v6;
  else
    v12 = v5;
  if (v11)
    v13 = v6;
  else
    v13 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentChildViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentChildViewController"));
  objc_storeStrong((id *)&self->_monthViewController, v14);
  objc_storeStrong((id *)&self->_listViewController, v15);
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  objc_msgSend(v6, "viewWillLayoutSubviews");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v25, "layoutSubviews");

  objc_msgSend(v6, "viewDidLayoutSubviews");
  -[PaletteView layoutSubviews](self->_paletteView, "layoutSubviews");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "date"));
  v43 = v9;
  if (-[CompactMonthListAnimator reverse](self, "reverse"))
    objc_msgSend(v14, "showDate:animated:", v27, 0);
  else
    objc_msgSend(v15, "selectDate:animated:", v26, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));

  if (v14 == v28)
  {
    v42 = v7;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subviewForDate:", v29));

    if (!v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
      objc_msgSend(v31, "layoutBelowIfNeeded");

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subviewForDate:", v32));

    }
    objc_msgSend(v30, "layoutSubviews");

    v7 = v42;
  }
  objc_msgSend(v14, "frameForWeekContainingDate:", v27);
  self->_monthSplittingCutOutArea.origin.x = v35;
  self->_monthSplittingCutOutArea.origin.y = v33 + v34;
  self->_monthSplittingCutOutArea.size.width = v36;
  self->_monthSplittingCutOutArea.size.height = 1.0;
  self->_monthViewSplittingLocation = self->_monthSplittingCutOutArea.origin;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController view](self->_listViewController, "view"));
  objc_msgSend(v37, "frame");
  self->_listViewNormalLocation.x = v38;
  self->_listViewNormalLocation.y = v39;

  objc_msgSend(v14, "updatePalette:", self->_paletteView);
  -[PaletteView layoutSubviews](self->_paletteView, "layoutSubviews");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayInitialsHeaderView](self->_paletteView, "dayInitialsHeaderView"));
  objc_msgSend(v40, "frame");
  -[CompactMonthListAnimator setWeekDayInitialsMonth:](self, "setWeekDayInitialsMonth:");

  self->_animating = 1;
  if (-[CompactMonthListAnimator reverse](self, "reverse"))
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10003D7F4;
    v47[3] = &unk_1001B2538;
    v41 = &v48;
    v48 = v4;
    -[CompactMonthListAnimator animateToMonthWithCompletion:inContext:](self, "animateToMonthWithCompletion:inContext:", v47, v4);
  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10003D840;
    v45[3] = &unk_1001B2538;
    v41 = &v46;
    v46 = v4;
    -[CompactMonthListAnimator animateToListWithCompletion:inContext:](self, "animateToListWithCompletion:inContext:", v45, v4);
  }

}

- (void)_terminateAnimationsAfterDelay
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 600000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D900;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];

  v5 = a3;
  if (-[CompactMonthListAnimator animating](self, "animating"))
    -[CompactMonthListAnimator _haltAnimations](self, "_haltAnimations");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  -[CompactMonthListAnimator monthSplittingCutOutArea](self, "monthSplittingCutOutArea");
  objc_msgSend(v6, "enterAnimationSplitStateWithCutOutArea:topBoundary:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[CompactMonthListAnimator monthViewSplittingLocation](self, "monthViewSplittingLocation");
  v13 = v12;
  v15 = v14 - v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  objc_msgSend(v16, "setSplitStateOpen:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v18, "setAlpha:", 1.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v26, "setFrame:", v13, v15, v22, v24);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  objc_msgSend(v28, "setAlpha:", 0.0);

  v30 = springAnimationDuration(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10003DD18;
  v61[3] = &unk_1001B2538;
  v61[4] = self;
  v32 = navigationAnimationsPreferringFRR(v61);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10003DE40;
  v60[3] = &unk_1001B25D0;
  v60[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v31, v33, v60, v30, 0.0);

  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dayInitialsHeaderView"));
  objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "dayInitialsHeaderView"));
  objc_msgSend(v45, "setAlpha:", 1.0);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "dateLabel"));
  objc_msgSend(v47, "setHidden:", 1);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "animatableDateLabel"));
  objc_msgSend(v49, "setAlpha:", 1.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v50, "setSuppressLayout:", 1);

  v52 = springAnimationDuration(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10003DF04;
  v59[3] = &unk_1001B2538;
  v59[4] = self;
  v54 = navigationAnimationsPreferringFRR(v59);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10003DFF4;
  v57[3] = &unk_1001B2D00;
  v57[4] = self;
  v58 = v5;
  v56 = v5;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v53, v55, v57, v52, 0.0);

}

- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  _QWORD v62[7];

  v5 = a3;
  if (-[CompactMonthListAnimator animating](self, "animating"))
    -[CompactMonthListAnimator _haltAnimations](self, "_haltAnimations");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  -[CompactMonthListAnimator monthSplittingCutOutArea](self, "monthSplittingCutOutArea");
  objc_msgSend(v6, "enterAnimationSplitStateWithCutOutArea:topBoundary:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[CompactMonthListAnimator monthViewSplittingLocation](self, "monthViewSplittingLocation");
  v13 = v12;
  v15 = v14 - v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  objc_msgSend(v16, "setSplitStateOpen:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v18, "setAlpha:", 0.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;

  -[CompactMonthListAnimator listViewNormalLocation](self, "listViewNormalLocation");
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
  objc_msgSend(v30, "setFrame:", v26, v28, v22, v24);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  objc_msgSend(v32, "setAlpha:", 1.0);

  v34 = springAnimationDuration(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10003E4E0;
  v62[3] = &unk_1001B2810;
  v62[4] = self;
  v62[5] = v13;
  *(double *)&v62[6] = v15;
  v36 = navigationAnimationsPreferringFRR(v62);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v35, v37, 0, v34, 0.0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dateLabel"));
  objc_msgSend(v39, "setHidden:", 1);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "animatableDateLabel"));
  objc_msgSend(v41, "setAlpha:", 0.0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dayInitialsHeaderView"));
  objc_msgSend(v43, "setAlpha:", 0.0);

  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v45 = v44;
  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v47 = v46;
  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v49 = v48;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dayInitialsHeaderView"));
  objc_msgSend(v51, "setFrame:", v45, 0.0, v47, v49);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v52, "setSuppressLayout:", 1);

  v54 = springAnimationDuration(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10003E5FC;
  v61[3] = &unk_1001B2538;
  v61[4] = self;
  v56 = navigationAnimationsPreferringFRR(v61);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10003E6E0;
  v59[3] = &unk_1001B2D00;
  v59[4] = self;
  v60 = v5;
  v58 = v5;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v55, v57, v59, v54, 0.0);

}

- (void)_haltAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "removeAllAnimations");

  -[CompactWidthMonthViewController endAnimationSplitState](self->_monthViewController, "endAnimationSplitState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController view](self->_listViewController, "view"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  x = self->_listViewNormalLocation.x;
  y = self->_listViewNormalLocation.y;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController view](self->_listViewController, "view"));
  objc_msgSend(v13, "setFrame:", x, y, v8, v10);

  self->_animating = 0;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (CompactWidthMonthViewController)monthViewController
{
  return self->_monthViewController;
}

- (void)setMonthViewController:(id)a3
{
  objc_storeStrong((id *)&self->_monthViewController, a3);
}

- (CompactListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_listViewController, a3);
}

- (CGPoint)listViewNormalLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_listViewNormalLocation.x;
  y = self->_listViewNormalLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setListViewNormalLocation:(CGPoint)a3
{
  self->_listViewNormalLocation = a3;
}

- (CGPoint)monthViewSplittingLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_monthViewSplittingLocation.x;
  y = self->_monthViewSplittingLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMonthViewSplittingLocation:(CGPoint)a3
{
  self->_monthViewSplittingLocation = a3;
}

- (CGRect)monthSplittingCutOutArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_monthSplittingCutOutArea.origin.x;
  y = self->_monthSplittingCutOutArea.origin.y;
  width = self->_monthSplittingCutOutArea.size.width;
  height = self->_monthSplittingCutOutArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMonthSplittingCutOutArea:(CGRect)a3
{
  self->_monthSplittingCutOutArea = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (CGRect)weekDayInitialsMonth
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_weekDayInitialsMonth.origin.x;
  y = self->_weekDayInitialsMonth.origin.y;
  width = self->_weekDayInitialsMonth.size.width;
  height = self->_weekDayInitialsMonth.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setWeekDayInitialsMonth:(CGRect)a3
{
  self->_weekDayInitialsMonth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
