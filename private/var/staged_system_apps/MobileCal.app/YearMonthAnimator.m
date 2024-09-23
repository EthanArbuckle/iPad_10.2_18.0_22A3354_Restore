@implementation YearMonthAnimator

- (YearMonthAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9;
  id v10;
  YearMonthAnimator *v11;
  YearMonthTransitionView *v12;
  YearMonthTransitionView *transitionView;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)YearMonthAnimator;
  v11 = -[YearMonthAnimator init](&v15, "init");
  if (v11)
  {
    v12 = -[YearMonthTransitionView initWithFrame:]([YearMonthTransitionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    transitionView = v11->_transitionView;
    v11->_transitionView = v12;

    v11->_reverse = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v11->_paletteView, a4);
  }

  return v11;
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator transitionView](self, "transitionView", a3));
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  void *v63;
  void *v64;
  YearMonthAnimator *v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  _QWORD v70[2];
  void *v71;
  id v72;
  id v73;
  id v74;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v59 = (void *)v8;
  v60 = (void *)v7;
  if (-[YearMonthAnimator reverse](self, "reverse"))
    objc_msgSend(v9, "addSubview:", v8);
  else
    objc_msgSend(v9, "insertSubview:belowSubview:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator transitionView](self, "transitionView"));
  objc_msgSend(v9, "bringSubviewToFront:", v11);

  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator transitionView](self, "transitionView"));
  v21 = -[YearMonthAnimator reverse](self, "reverse");
  v22 = v21 == 0;
  if (v21)
    v23 = v6;
  else
    v23 = v5;
  if (v22)
    v24 = v6;
  else
    v24 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentChildViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentChildViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator model](self, "model"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectedDate"));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "date"));

  if (-[YearMonthAnimator reverse](self, "reverse"))
    v30 = v25;
  else
    v30 = v26;
  v57 = (void *)v29;
  objc_msgSend(v30, "showDate:animated:", v29, 0);
  objc_msgSend(v26, "forceUpdateListView");
  v31 = objc_msgSend(v6, "view");
  objc_msgSend(v6, "viewWillLayoutSubviews");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v32, "layoutSubviews");

  objc_msgSend(v6, "viewDidLayoutSubviews");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator selectedDate](self, "selectedDate"));
  if (v33)
    goto LABEL_19;
  if (-[YearMonthAnimator reverse](self, "reverse"))
  {
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateForCurrentMonthOnScreen"));
    v33 = (void *)v34;
    if (v34)
      goto LABEL_19;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator model](self, "model"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "selectedDate"));

    if (v33)
      goto LABEL_19;
  }
  v36 = CUIKTodayComponents(v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator model](self, "model"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "eventStore"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "timeZone"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v37, v38));

LABEL_19:
  objc_msgSend(v9, "bounds");
  objc_msgSend(v61, "setFrame:");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator model](self, "model"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "calendar"));
  objc_msgSend(v61, "prepareWithYearViewController:monthViewController:selectedDate:calendar:yearToMonth:paletteView:", v25, v26, v33, v40, !self->_reverse, self->_paletteView);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v41, "setHidden:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  objc_msgSend(v42, "setHidden:", 0);

  objc_msgSend(v61, "setHidden:", 0);
  objc_msgSend(v5, "setAnimatingViewTransition:", 1);
  objc_msgSend(v6, "setAnimatingViewTransition:", 1);
  LODWORD(v40) = -[YearMonthAnimator reverse](self, "reverse");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthAnimator transitionView](self, "transitionView"));
  if ((_DWORD)v40)
  {
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10008BA5C;
    v69[3] = &unk_1001B3948;
    v44 = (id *)v70;
    v70[0] = v25;
    v70[1] = self;
    v71 = v5;
    v72 = v6;
    v73 = v4;
    v74 = v26;
    v45 = v4;
    v46 = v6;
    v47 = v5;
    v48 = v26;
    v49 = v25;
    objc_msgSend(v43, "animateToYearViewWithCompletion:", v69);

    v50 = v71;
  }
  else
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10008BB1C;
    v62[3] = &unk_1001B3948;
    v44 = &v63;
    v63 = v25;
    v64 = v26;
    v65 = self;
    v66 = v5;
    v67 = v6;
    v68 = v4;
    v51 = v4;
    v52 = v6;
    v53 = v5;
    v54 = v26;
    v55 = v25;
    objc_msgSend(v43, "animateToMonthViewWithCompletion:", v62);

    v50 = v64;
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

- (YearMonthTransitionView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionView, a3);
}

- (EKCalendarDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDate, a3);
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
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
