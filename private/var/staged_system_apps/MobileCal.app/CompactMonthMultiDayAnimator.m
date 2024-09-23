@implementation CompactMonthMultiDayAnimator

+ (Class)monthMultiDayTransitionViewClass
{
  return (Class)objc_opt_class(MonthDayTransitionView);
}

- (CompactMonthMultiDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9;
  id v10;
  CompactMonthMultiDayAnimator *v11;
  CompactMonthMultiDayAnimator *v12;
  double v13;
  id v14;
  MonthDayTransitionView *v15;
  MonthDayTransitionView *transitionView;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CompactMonthMultiDayAnimator;
  v11 = -[CompactMonthMultiDayAnimator init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    *(_QWORD *)&v13 = objc_opt_class(v11).n128_u64[0];
    v15 = (MonthDayTransitionView *)objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "monthMultiDayTransitionViewClass", v13)), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    transitionView = v12->_transitionView;
    v12->_transitionView = v15;

    v12->_reverse = a5;
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeStrong((id *)&v12->_paletteView, a4);
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator transitionView](self, "transitionView", a3));
  objc_msgSend(v3, "animationDuration");
  v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id *v40;
  id *v41;
  id *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  void *v57;
  _QWORD v58[2];
  id v59;
  _QWORD v60[4];
  void *v61;
  _QWORD v62[2];
  id v63;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v52 = (void *)v7;
  if (-[CompactMonthMultiDayAnimator reverse](self, "reverse"))
    objc_msgSend(v9, "addSubview:", v8);
  else
    objc_msgSend(v9, "insertSubview:belowSubview:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "bringSubviewToFront:", v11);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator transitionView](self, "transitionView"));
  v12 = -[CompactMonthMultiDayAnimator reverse](self, "reverse");
  v13 = v12 == 0;
  if (v12)
    v14 = v6;
  else
    v14 = v5;
  if (v13)
    v15 = v6;
  else
    v15 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentChildViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentChildViewController"));
  objc_msgSend(v6, "viewWillLayoutSubviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v18, "layoutSubviews");

  objc_msgSend(v6, "viewDidLayoutSubviews");
  -[PaletteView layoutSubviews](self->_paletteView, "layoutSubviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator model](self, "model"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectedDate"));

  v21 = v20;
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "date"));
  v51 = (void *)v8;
  v54 = (void *)v22;
  if (-[CompactMonthMultiDayAnimator reverse](self, "reverse"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view", v21));
    objc_msgSend(v23, "layoutIfNeeded");

    objc_msgSend(v16, "showDate:animated:", v22, 0);
  }
  else
  {
    objc_msgSend(v17, "selectDate:animated:", v21, 0, v21);
  }
  objc_msgSend(v9, "bounds");
  v24 = v55;
  objc_msgSend(v55, "setFrame:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v55, "prepareTransitionWithTopView:bottomView:allDayView:topLabelsContainer:", v25, v26, 0, 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));
  v53 = v17;
  if (v16 == v27)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator model](self, "model"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "selectedDate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subviewForDate:", v31));

    if (!v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      objc_msgSend(v33, "layoutBelowIfNeeded");

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator model](self, "model"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "selectedDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subviewForDate:", v35));

    }
    objc_msgSend(v32, "layoutSubviews");

    v17 = v53;
    v24 = v55;
  }
  v50 = v9;
  v36 = CUIKTodayDate(v28, v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  objc_msgSend(v24, "prepareTransitionScrubberWithSelectedDate:todayDate:dayViewController:monthViewController:paletteView:reverse:", v54, v37, v17, v16, self->_paletteView, -[CompactMonthMultiDayAnimator reverse](self, "reverse"));

  objc_msgSend(v24, "setHidden:", 0);
  objc_msgSend(v6, "updatePalette:", self->_paletteView);
  objc_msgSend(v5, "setAnimatingViewTransition:", 1);
  objc_msgSend(v6, "setAnimatingViewTransition:", 1);
  v38 = -[CompactMonthMultiDayAnimator reverse](self, "reverse");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthMultiDayAnimator transitionView](self, "transitionView"));
  if (v38)
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1000A9EC8;
    v60[3] = &unk_1001B2C88;
    v40 = &v61;
    v41 = (id *)v62;
    v61 = v5;
    v62[0] = v6;
    v42 = &v63;
    v62[1] = self;
    v63 = v4;
    v43 = v4;
    v44 = v6;
    v45 = v5;
    objc_msgSend(v39, "animateToMonthWithCompletion:", v60);
  }
  else
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000A9F1C;
    v56[3] = &unk_1001B2C88;
    v40 = &v57;
    v41 = (id *)v58;
    v57 = v5;
    v58[0] = v6;
    v42 = &v59;
    v58[1] = self;
    v59 = v4;
    v46 = v4;
    v47 = v6;
    v48 = v5;
    objc_msgSend(v39, "animateToDayWithCompletion:", v56);
  }

}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (MonthDayTransitionView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionView, a3);
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
