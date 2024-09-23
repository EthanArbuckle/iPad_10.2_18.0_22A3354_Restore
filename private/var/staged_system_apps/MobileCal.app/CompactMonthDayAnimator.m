@implementation CompactMonthDayAnimator

+ (Class)monthDayTransitionViewClass
{
  return (Class)objc_opt_class(MonthDayTransitionView);
}

- (CompactMonthDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9;
  id v10;
  CompactMonthDayAnimator *v11;
  CompactMonthDayAnimator *v12;
  double v13;
  id v14;
  MonthDayTransitionView *v15;
  MonthDayTransitionView *transitionView;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CompactMonthDayAnimator;
  v11 = -[CompactMonthDayAnimator init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    *(_QWORD *)&v13 = objc_opt_class(v11).n128_u64[0];
    v15 = (MonthDayTransitionView *)objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "monthDayTransitionViewClass", v13)), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator transitionView](self, "transitionView", a3));
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
  void *v12;
  unsigned int v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  id *v43;
  id *v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  void *v61;
  _QWORD v62[2];
  void *v63;
  _QWORD v64[4];
  void *v65;
  _QWORD v66[2];
  void *v67;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v59 = (void *)v7;
  if (-[CompactMonthDayAnimator reverse](self, "reverse"))
    objc_msgSend(v9, "addSubview:", v8);
  else
    objc_msgSend(v9, "insertSubview:belowSubview:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "bringSubviewToFront:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator transitionView](self, "transitionView"));
  v13 = -[CompactMonthDayAnimator reverse](self, "reverse");
  v14 = v13 == 0;
  if (v13)
    v15 = v6;
  else
    v15 = v5;
  v53 = v5;
  if (v14)
    v16 = v6;
  else
    v16 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentChildViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentChildViewController"));
  objc_msgSend(v6, "viewWillLayoutSubviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v19, "layoutSubviews");

  objc_msgSend(v6, "viewDidLayoutSubviews");
  -[PaletteView layoutSubviews](self->_paletteView, "layoutSubviews");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator model](self, "model"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectedDate"));

  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "date"));
  v58 = (void *)v8;
  v54 = v22;
  v55 = v4;
  if (-[CompactMonthDayAnimator reverse](self, "reverse"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
    objc_msgSend(v24, "layoutIfNeeded");

    objc_msgSend(v17, "showDate:animated:", v23, 0);
  }
  else
  {
    objc_msgSend(v18, "selectDate:animated:", v22, 0);
  }
  v57 = v9;
  objc_msgSend(v9, "bounds");
  objc_msgSend(v12, "setFrame:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allDayView"));
  v28 = v12;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topLabelsContainer"));
  objc_msgSend(v28, "prepareTransitionWithTopView:bottomView:allDayView:topLabelsContainer:", v25, v26, v27, v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChildViewController"));
  if (v17 == v30)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator model](self, "model"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "selectedDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subviewForDate:", v34));

    if (!v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      objc_msgSend(v36, "layoutBelowIfNeeded");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator model](self, "model"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "selectedDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subviewForDate:", v38));

    }
    objc_msgSend(v35, "layoutSubviews");

  }
  v39 = CUIKTodayDate(v31, v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v28, "prepareTransitionScrubberWithSelectedDate:todayDate:dayViewController:monthViewController:paletteView:reverse:", v23, v40, v18, v17, self->_paletteView, -[CompactMonthDayAnimator reverse](self, "reverse"));

  v56 = v28;
  objc_msgSend(v28, "setHidden:", 0);
  objc_msgSend(v6, "updatePalette:", self->_paletteView);
  objc_msgSend(v53, "setAnimatingViewTransition:", 1);
  objc_msgSend(v6, "setAnimatingViewTransition:", 1);
  v41 = -[CompactMonthDayAnimator reverse](self, "reverse");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthDayAnimator transitionView](self, "transitionView"));
  if (v41)
  {
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10010F150;
    v64[3] = &unk_1001B2C88;
    v43 = &v65;
    v44 = (id *)v66;
    v65 = v53;
    v66[0] = v6;
    v45 = &v67;
    v46 = v55;
    v66[1] = self;
    v67 = v55;
    v47 = v55;
    v48 = v6;
    v49 = v53;
    objc_msgSend(v42, "animateToMonthWithCompletion:", v64);
  }
  else
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10010F1D8;
    v60[3] = &unk_1001B2C88;
    v43 = &v61;
    v44 = (id *)v62;
    v61 = v53;
    v62[0] = v6;
    v45 = &v63;
    v46 = v55;
    v62[1] = self;
    v63 = v55;
    v50 = v55;
    v51 = v6;
    v52 = v53;
    objc_msgSend(v42, "animateToDayWithCompletion:", v60);
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
