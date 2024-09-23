@implementation YearMonthTransitionView

- (YearMonthTransitionView)initWithFrame:(CGRect)a3
{
  YearMonthTransitionView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)YearMonthTransitionView;
  v3 = -[YearMonthTransitionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[YearMonthTransitionView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (id)_createLabelWithFont:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[YearMonthTransitionView addSubview:](self, "addSubview:", v5);
  return v5;
}

- (void)prepareWithYearViewController:(id)a3 monthViewController:(id)a4 selectedDate:(id)a5 calendar:(id)a6 yearToMonth:(BOOL)a7 paletteView:(id)a8
{
  id v15;
  id v16;
  CompactWidthMonthViewController **p_monthViewController;
  PaletteView **p_paletteView;
  void *v19;
  unsigned int v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  double v26;
  UIView *v27;
  UIView *backgroundView;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  PaletteView *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t ImageViewFromView;
  UIView *v60;
  UIView *monthListView;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  uint64_t IsLeftToRight;
  double *v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  double v138;
  double v139;
  uint64_t v140;
  void *v141;
  CrossFadeView *v142;
  CrossFadeView *monthLabel;
  void *v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  UIView *v149;
  UIView *monthTransitionViewInYearState;
  UIView *v151;
  UIView *monthTransitionViewInMonthState;
  uint64_t v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  id v159;
  double v160;
  double v161;
  uint64_t v162;
  _QWORD v163[2];
  _QWORD v164[2];
  _BYTE buf[12];
  CGRect v166;
  CGRect v167;
  CGRect v168;

  v15 = a3;
  v16 = a4;
  v159 = a5;
  v157 = a8;
  objc_storeStrong((id *)&self->_yearViewController, a3);
  v156 = a6;
  p_monthViewController = &self->_monthViewController;
  objc_storeStrong((id *)&self->_monthViewController, a4);
  self->_yearToMonth = a7;
  p_paletteView = &self->_paletteView;
  objc_storeStrong((id *)&self->_paletteView, a8);
  if (!a7)
    objc_msgSend(v16, "setSuspendEventLoading:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v20 = objc_msgSend(v19, "showWeekNumbers");
  v21 = 0.0;
  if (v20)
    v21 = 4.0;
  self->_monthWeekViewExtent = v21;

  objc_storeStrong((id *)&self->_monthViewController, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _getMonthViewMonthContainingDate:hideMonthLabel:](self, "_getMonthViewMonthContainingDate:hideMonthLabel:", v159, 1));
  objc_storeStrong((id *)&self->_monthViewInMonthView, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "monthViewForCalendarDate:", v159));
  objc_storeStrong((id *)&self->_monthViewInYearView, v23);
  *(_QWORD *)&v24 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v25, "_monthHeaderHeight", v24);
  self->_monthHeaderHeight = v26;
  v158 = v15;
  if (objc_msgSend(v16, "dividedListMode"))
  {
    v27 = (UIView *)objc_alloc_init((Class)UIView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v27;

    -[YearMonthTransitionView bounds](self, "bounds");
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
    *(_QWORD *)buf = 0;
    v162 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scrollView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "backgroundColor"));

    if ((objc_msgSend(v16, "dividedListMode") & 1) != 0
      || !objc_msgSend(v30, "getWhite:alpha:", buf, &v162))
    {
      -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v30);
    }
    else
    {
      self->_backgroundViewMonthAlpha = 1.0 - *(double *)buf;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v31);

    }
    -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_backgroundView);

  }
  if (objc_msgSend(v16, "dividedListMode"))
  {
    v32 = 0.0;
    if (self->_yearToMonth
      && (-[PaletteView frame](*p_paletteView, "frame"),
          v34 = v33,
          v35 = *p_paletteView,
          -[PaletteView frame](*p_paletteView, "frame"),
          -[PaletteView sizeThatFits:](v35, "sizeThatFits:", v36, v37),
          v38 > v34))
    {
      v32 = v34 - v38;
      -[PaletteView layoutSubviews](*p_paletteView, "layoutSubviews");
      -[InfiniteScrollViewController viewWillLayoutSubviews](*p_monthViewController, "viewWillLayoutSubviews");
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](*p_monthViewController, "view"));
      objc_msgSend(v39, "layoutSubviews");

      -[CompactMonthViewController viewDidLayoutSubviews](*p_monthViewController, "viewDidLayoutSubviews");
      v40 = 1;
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v16, "frameOfListView");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v49, v42, v44, v46, v48);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v16, "frameOfListView");
    ImageViewFromView = createImageViewFromView(v58, 0);
    v60 = (UIView *)objc_claimAutoreleasedReturnValue(ImageViewFromView);
    monthListView = self->_monthListView;
    self->_monthListView = v60;

    -[UIView setFrame:](self->_monthListView, "setFrame:", v51, v53, v55, v57);
    if (v40)
    {
      -[PaletteView setExtraPaletteHeight:](*p_paletteView, "setExtraPaletteHeight:", v32);
      -[PaletteView layoutSubviews](*p_paletteView, "layoutSubviews");
      -[PaletteView setExtraPaletteHeight:](*p_paletteView, "setExtraPaletteHeight:", 0.0);
    }
  }
  objc_msgSend(v15, "monthFrameForCalendarDate:adjustHeightUp:", v159, 0);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v70, v63, v65, v67, v69);
  self->_monthInYearViewFrame.origin.x = v71;
  self->_monthInYearViewFrame.origin.y = v72;
  self->_monthInYearViewFrame.size.width = v73;
  self->_monthInYearViewFrame.size.height = v74;

  objc_msgSend(v22, "monthFrame");
  self->_monthInMonthViewFrame.origin.x = v75;
  self->_monthInMonthViewFrame.origin.y = v76;
  self->_monthInMonthViewFrame.size.width = v77;
  self->_monthInMonthViewFrame.size.height = v78;
  objc_msgSend(v15, "monthHeaderLocationForCalendarDate:", v159);
  v80 = v79;
  v82 = v81;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  -[YearMonthTransitionView convertPoint:fromView:](self, "convertPoint:fromView:", v83, v80, v82);
  v85 = v84;
  v87 = v86;

  -[YearMonthTransitionView addSubview:](self, "addSubview:", v22);
  objc_msgSend(v22, "monthLabelFrame");
  -[YearMonthTransitionView convertPoint:fromView:](self, "convertPoint:fromView:", v22);
  v89 = v88;
  v91 = v90;
  objc_msgSend(v22, "removeFromSuperview");
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "headerFont"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _createLabelWithFont:](self, "_createLabelWithFont:", v92));

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthViewController monthNameFont](CompactMonthViewController, "monthNameFont"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _createLabelWithFont:](self, "_createLabelWithFont:", v94));

  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "headerFont"));
  v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "monthString"));
  v155 = (void *)v96;
  if (v96)
  {
    v98 = objc_alloc((Class)NSAttributedString);
    v163[0] = NSFontAttributeName;
    v163[1] = NSKernAttributeName;
    v164[0] = v96;
    objc_msgSend(v23, "headerFontKerning");
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v164[1] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v164, v163, 2));
    v101 = objc_msgSend(v98, "initWithString:attributes:", v97, v100);

    objc_msgSend(v93, "setAttributedText:", v101);
  }
  else
  {
    v102 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "yearMonthViewHeaderFont is nil. yearMonthView = %@", buf, 0xCu);
    }
    objc_msgSend(v93, "setText:", v97);
  }
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "monthLabelText"));
  objc_msgSend(v95, "setText:", v103);

  v104 = objc_msgSend(v23, "isCurrentMonth");
  v153 = v97;
  if ((_DWORD)v104)
  {
    v106 = CalendarAppTintColor(v104, v105);
    v107 = objc_claimAutoreleasedReturnValue(v106);
  }
  else
  {
    v107 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor", v97, v155));
  }
  v108 = (void *)v107;
  objc_msgSend(v93, "setTextColor:", v107, v153);
  objc_msgSend(v95, "setTextColor:", v108);

  objc_msgSend(v93, "sizeToFit");
  *(_QWORD *)buf = 0;
  v161 = 0.0;
  v162 = 0;
  v160 = 0.0;
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "font"));
  CTFontGetLanguageAwareOutsets(v109, buf, &v161, &v162, &v160);

  v110 = objc_msgSend(v93, "frame");
  v112 = v111;
  v114 = v113;
  v116 = v115;
  v118 = v117;
  IsLeftToRight = CalInterfaceIsLeftToRight(v110);
  if ((_DWORD)IsLeftToRight)
    v120 = (double *)&v162;
  else
    v120 = (double *)buf;
  v121 = CalCeilToScreenScale(IsLeftToRight, v116 + *v120);
  objc_msgSend(v93, "setFrame:", v112, v114, v121, ceil(v118 + v161 + v160));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "monthLabel"));
  objc_msgSend(v122, "frame");
  objc_msgSend(v95, "setFrame:");
  objc_msgSend(v22, "monthLabelFrame");
  v124 = v123;
  v126 = v125;
  objc_msgSend(v95, "bounds");
  v127 = v89 + (v124 - CGRectGetWidth(v166)) * 0.5;
  objc_msgSend(v95, "bounds");
  v128 = self->_monthWeekViewExtent + v91 + (v126 - CGRectGetHeight(v167)) * 0.5;
  objc_msgSend(v93, "bounds");
  v130 = v129;
  v132 = v131;
  v133 = v87 - ceil((v161 + v160) * 0.5);
  v135 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, v134);
  if (v135 != 16)
    v133 = v133 + -0.5;
  if ((CalInterfaceIsLeftToRight(v135) & 1) == 0)
  {
    v168.origin.x = v85;
    v168.origin.y = v133;
    v168.size.width = v130;
    v168.size.height = v132;
    v85 = v85 - CGRectGetWidth(v168);
  }
  objc_msgSend(v95, "bounds");
  v137 = v136;
  v139 = v138;
  objc_msgSend(v93, "frame");
  v140 = createImageViewFromView(v93, 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
  v142 = (CrossFadeView *)objc_msgSend(objc_alloc((Class)CrossFadeView), "initWithStartView:endView:startFrame:endFrame:", v95, v141, v127, v128, v137, v139, v85, v133, v130, v132);
  monthLabel = self->_monthLabel;
  self->_monthLabel = v142;

  -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthLabel);
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  objc_msgSend(v144, "frame");
  self->_yearViewOriginalFrame.origin.x = v145;
  self->_yearViewOriginalFrame.origin.y = v146;
  self->_yearViewOriginalFrame.size.width = v147;
  self->_yearViewOriginalFrame.size.height = v148;

  objc_msgSend(v16, "setSuspendEventLoading:", 1);
  v149 = (UIView *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _captureImageOfMonthInYearView](self, "_captureImageOfMonthInYearView"));
  monthTransitionViewInYearState = self->_monthTransitionViewInYearState;
  self->_monthTransitionViewInYearState = v149;

  -[YearMonthTransitionView _captureImagesForSlidingPiecesFromMonthViewController:selectedDate:calendar:](self, "_captureImagesForSlidingPiecesFromMonthViewController:selectedDate:calendar:", v16, v159, v156);
  v151 = (UIView *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _setUpMonthViewInMonthViewFrame](self, "_setUpMonthViewInMonthViewFrame"));
  monthTransitionViewInMonthState = self->_monthTransitionViewInMonthState;
  self->_monthTransitionViewInMonthState = v151;

  -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthTransitionViewInYearState);
  -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthTransitionViewInMonthState);
  if (self->_monthBottomSlidingPiece)
    -[YearMonthTransitionView bringSubviewToFront:](self, "bringSubviewToFront:");
  if (self->_monthBottomSlidingPiece2)
    -[YearMonthTransitionView bringSubviewToFront:](self, "bringSubviewToFront:");
  objc_msgSend(v16, "setSuspendEventLoading:", 0);
  -[YearMonthTransitionView bringSubviewToFront:](self, "bringSubviewToFront:", self->_monthLabel);
  -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthListView);

}

- (void)animateToMonthViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[YearMonthTransitionView _setToYearState](self, "_setToYearState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = -[YearMonthTransitionView _animateZoomToMonthState](self, "_animateZoomToMonthState");
  if (UIAnimationDragCoefficient(v6, v7) <= 1.5)
    v10 = 750000000;
  else
    v10 = (uint64_t)(UIAnimationDragCoefficient(v8, v9) * 0.9 * 1000000000.0);
  v11 = dispatch_time(0, v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F82FC;
  v13[3] = &unk_1001B2D80;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

}

- (void)animateToYearViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[YearMonthTransitionView _setToMonthState](self, "_setToMonthState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = -[YearMonthTransitionView _animateZoomToYearState](self, "_animateZoomToYearState");
  if (UIAnimationDragCoefficient(v6, v7) <= 1.5)
    v10 = 750000000;
  else
    v10 = (uint64_t)(UIAnimationDragCoefficient(v8, v9) * 0.9 * 1000000000.0);
  v11 = dispatch_time(0, v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F8434;
  v13[3] = &unk_1001B2D80;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

}

- (double)animationDuration
{
  return 0.75;
}

- (void)_animationComplete
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  _OWORD v12[3];

  -[YearMonthTransitionView _haltAnimations](self, "_haltAnimations");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[UIView setHidden:](self->_monthViewInYearView, "setHidden:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v5, "setTransform:", v12);

  x = self->_yearViewOriginalFrame.origin.x;
  y = self->_yearViewOriginalFrame.origin.y;
  width = self->_yearViewOriginalFrame.size.width;
  height = self->_yearViewOriginalFrame.size.height;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  objc_msgSend(v11, "setFrame:", x, y, width, height);

}

- (void)_setToYearState
{
  void *v3;
  CGRect *p_monthInYearViewFrame;
  UIView *v5;
  void *v6;
  double width;
  double v8;
  CGFloat x;
  double v10;
  CGFloat MaxY;
  CGRect v12;
  CGRect v13;

  -[CrossFadeView setToEndState](self->_monthLabel, "setToEndState");
  -[UIView setHidden:](self->_monthViewInYearView, "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  -[YearMonthTransitionView _calculateYearFrameForYearViewZoom](self, "_calculateYearFrameForYearViewZoom");
  scaleViewToFrame(v3);

  p_monthInYearViewFrame = &self->_monthInYearViewFrame;
  scaleViewToFrame(self->_monthTransitionViewInYearState);
  v5 = -[UIViewController view](self->_yearViewController, "view", scaleViewToFrame(self->_monthTransitionViewInMonthState).n128_f64[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[UIView setAlpha:](self->_monthTransitionViewInYearState, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_monthTransitionViewInMonthState, "setAlpha:", 0.0);
  width = self->_monthInYearViewFrame.size.width;
  v8 = width / width;
  if (width == 0.0)
    v8 = 0.0;
  x = p_monthInYearViewFrame->origin.x;
  v12.origin.y = self->_monthInYearViewFrame.origin.y;
  v10 = v8 * self->_bottomSlidingStartFrame.size.height;
  v12.origin.x = p_monthInYearViewFrame->origin.x;
  v12.size.width = self->_monthInYearViewFrame.size.width;
  v12.size.height = self->_monthInYearViewFrame.size.height;
  MaxY = CGRectGetMaxY(v12);
  scaleViewToFrame(self->_monthTopSlidingPiece);
  scaleViewToFrame(self->_monthBottomSlidingPiece);
  if (self->_monthBottomSlidingPiece2)
  {
    v13.origin.x = x;
    v13.origin.y = MaxY;
    v13.size.width = width;
    v13.size.height = v10;
    CGRectGetMaxY(v13);
    scaleViewToFrame(self->_monthBottomSlidingPiece2);
    -[UIView setAlpha:](self->_monthBottomSlidingPiece2, "setAlpha:", 0.0);
  }
  -[UIView setAlpha:](self->_monthTopSlidingPiece, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_monthBottomSlidingPiece, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  -[CompactWidthMonthViewController updatePalette:](self->_monthViewController, "updatePalette:", self->_paletteView);
  -[PaletteView setAlpha:](self->_paletteView, "setAlpha:", 0.0);
}

- (void)_setToMonthState
{
  void *v3;
  UIView *v4;
  void *v5;
  UIView *monthBottomSlidingPiece2;

  -[CrossFadeView setToStartState](self->_monthLabel, "setToStartState");
  -[UIView setHidden:](self->_monthViewInYearView, "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  -[YearMonthTransitionView _calculateMonthFrameForYearViewZoom](self, "_calculateMonthFrameForYearViewZoom");
  scaleViewToFrame(v3);

  scaleViewToFrame(self->_monthTransitionViewInYearState);
  v4 = -[UIViewController view](self->_yearViewController, "view", scaleViewToFrame(self->_monthTransitionViewInMonthState).n128_f64[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[UIView setAlpha:](self->_monthTransitionViewInYearState, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_monthTransitionViewInMonthState, "setAlpha:", 1.0);
  scaleViewToFrame(self->_monthTopSlidingPiece);
  scaleViewToFrame(self->_monthBottomSlidingPiece);
  monthBottomSlidingPiece2 = self->_monthBottomSlidingPiece2;
  if (monthBottomSlidingPiece2)
  {
    scaleViewToFrame(monthBottomSlidingPiece2);
    -[UIView setAlpha:](self->_monthBottomSlidingPiece, "setAlpha:", 1.0);
  }
  -[UIView setAlpha:](self->_monthTopSlidingPiece, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_monthBottomSlidingPiece, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", self->_backgroundViewMonthAlpha);
  -[PaletteView setAlpha:](self->_paletteView, "setAlpha:", 1.0);
}

- (void)_animateZoomToYearState
{
  UIView *monthListView;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[7];
  _QWORD v17[5];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F8B10;
  v17[3] = &unk_1001B2538;
  v17[4] = self;
  animateNavigationPreferringFRR(v17);
  monthListView = self->_monthListView;
  if (monthListView)
  {
    -[UIView frame](monthListView, "frame");
    v5 = v4;
    monthListView = (UIView *)-[YearMonthTransitionView frame](self, "frame");
    v7 = v6;
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v8 = springAnimationDuration(monthListView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000F8B28;
  v16[3] = &unk_1001B2810;
  v16[4] = self;
  v16[5] = v5;
  v16[6] = v7;
  v10 = navigationAnimationsPreferringFRR(v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v9, v11, 0, v8, 0.0);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F8D08;
  v15[3] = &unk_1001B2538;
  v15[4] = self;
  v12 = navigationAnimationsPreferringFRR(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F8D80;
  v14[3] = &unk_1001B25D0;
  v14[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v13, v14, 0.25, 0.15);

}

- (void)_animateZoomToMonthState
{
  UIView *monthListView;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[7];
  _QWORD v27[5];
  _QWORD v28[5];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000F8FD8;
  v28[3] = &unk_1001B2538;
  v28[4] = self;
  animateNavigationPreferringFRR(v28);
  monthListView = self->_monthListView;
  if (monthListView)
  {
    -[UIView frame](monthListView, "frame");
    v5 = v4;
    v7 = v6;
    -[UIView frame](self->_monthListView, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[YearMonthTransitionView frame](self, "frame");
    monthListView = (UIView *)-[UIView setFrame:](self->_monthListView, "setFrame:", v9, v14, v11, v13);
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v15 = springAnimationDuration(monthListView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000F8FF0;
  v27[3] = &unk_1001B2538;
  v27[4] = self;
  v17 = navigationAnimationsPreferringFRR(v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v16, v18, 0, v15, 0.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000F916C;
  v26[3] = &unk_1001B2810;
  v26[4] = self;
  v26[5] = v5;
  v26[6] = v7;
  v20 = navigationAnimationsPreferringFRR(v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v19, v21, 0, 0.75, 0.0);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000F91B8;
  v25[3] = &unk_1001B2538;
  v25[4] = self;
  v22 = navigationAnimationsPreferringFRR(v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000F9260;
  v24[3] = &unk_1001B25D0;
  v24[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v23, v24, 0.25, 0.0);

}

- (CGRect)_calculateMonthFrameForYearViewZoom
{
  double x;
  double y;
  double height;
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
  double v16;
  CGRect result;

  x = self->_monthInYearViewFrame.origin.x;
  y = self->_monthInYearViewFrame.origin.y;
  height = self->_monthInYearViewFrame.size.height;
  v5 = self->_monthInMonthViewFrame.origin.x;
  v6 = self->_monthInMonthViewFrame.origin.y;
  v7 = self->_monthInMonthViewFrame.size.height;
  -[YearMonthTransitionView _calculateYearFrameForYearViewZoom](self, "_calculateYearFrameForYearViewZoom");
  v12 = v7 / height;
  if (height == 0.0)
    v12 = 0.0;
  v13 = v12 * v10;
  v14 = v12 * v11;
  v15 = v5 - v12 * (x - v8);
  v16 = v6 - v12 * (y - v9);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_calculateYearFrameForYearViewZoom
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_yearViewOriginalFrame.origin.x;
  y = self->_yearViewOriginalFrame.origin.y;
  width = self->_yearViewOriginalFrame.size.width;
  height = self->_yearViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_setUpMonthViewInMonthViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[YearMonthTransitionMonthView monthFrameInMonthView](self->_monthViewInMonthView, "monthFrameInMonthView");
  v4 = v3;
  v6 = v5;
  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v3, v5, v7, v8);
  objc_msgSend(v9, "setClipsToBounds:", 1);
  objc_msgSend(v9, "addSubview:", self->_monthViewInMonthView);
  -[YearMonthTransitionMonthView frame](self->_monthViewInMonthView, "frame");
  -[YearMonthTransitionMonthView setFrame:](self->_monthViewInMonthView, "setFrame:", -v4, -v6);
  return v9;
}

- (id)_captureImageOfMonthInYearView
{
  -[UIView convertRect:fromView:](self->_monthViewInYearView, "convertRect:fromView:", self, self->_monthInYearViewFrame.origin.x, self->_monthInYearViewFrame.origin.y, self->_monthInYearViewFrame.size.width, self->_monthInYearViewFrame.size.height);
  return (id)createImageViewFromView(self->_monthViewInYearView, 1);
}

- (void)_captureImagesForSlidingPiecesFromMonthViewController:(id)a3 selectedDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a5;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSDateComponents);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));

  objc_msgSend(v8, "setMonth:", 1);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v8, v9, 0));
  objc_msgSend(v8, "setMonth:", -1);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v8, v9, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "timeZone"));
  v36 = (void *)v10;
  v13 = objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v10, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "timeZone"));
  v35 = (void *)v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v11, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _getMonthViewMonthContainingDate:hideMonthLabel:](self, "_getMonthViewMonthContainingDate:hideMonthLabel:", v15, 0));
  v34 = (void *)v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _getMonthViewMonthContainingDate:hideMonthLabel:](self, "_getMonthViewMonthContainingDate:hideMonthLabel:", v13, 0));
  -[YearMonthTransitionView _monthFrameForMonthBefore:anchorMonth:](self, "_monthFrameForMonthBefore:anchorMonth:", v16, self->_monthViewInMonthView);
  objc_msgSend(v16, "setFrame:");
  -[YearMonthTransitionView _monthFrameForMonthAfter:anchorMonth:](self, "_monthFrameForMonthAfter:anchorMonth:", v17, self->_monthViewInMonthView);
  objc_msgSend(v17, "setFrame:");
  if (v16)
  {
    objc_msgSend(v16, "frame");
    self->_topSlidingStartFrame.origin.x = v18;
    self->_topSlidingStartFrame.origin.y = v19;
    self->_topSlidingStartFrame.size.width = v20;
    self->_topSlidingStartFrame.size.height = v21;
    objc_storeStrong((id *)&self->_monthTopSlidingPiece, v16);
    -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthTopSlidingPiece);
  }
  if (v17)
  {
    objc_msgSend(v17, "frame");
    self->_bottomSlidingStartFrame.origin.x = v22;
    self->_bottomSlidingStartFrame.origin.y = v23;
    self->_bottomSlidingStartFrame.size.width = v24;
    self->_bottomSlidingStartFrame.size.height = v25;
    objc_storeStrong((id *)&self->_monthBottomSlidingPiece, v17);
    -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthBottomSlidingPiece);
  }
  objc_msgSend(v8, "setMonth:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v8, v9, 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "timeZone"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v26, v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView _getMonthViewMonthContainingDate:hideMonthLabel:](self, "_getMonthViewMonthContainingDate:hideMonthLabel:", v28, 0));
  if (v29)
  {
    -[YearMonthTransitionView _monthFrameForMonthAfter:anchorMonth:](self, "_monthFrameForMonthAfter:anchorMonth:", v29, v17);
    objc_msgSend(v29, "setFrame:");
    objc_msgSend(v29, "frame");
    self->_bottomSliding2StartFrame.origin.x = v30;
    self->_bottomSliding2StartFrame.origin.y = v31;
    self->_bottomSliding2StartFrame.size.width = v32;
    self->_bottomSliding2StartFrame.size.height = v33;
    self->_bottomSliding2StartFrame.origin.y = CGRectGetMaxY(self->_bottomSlidingStartFrame);
    objc_storeStrong((id *)&self->_monthBottomSlidingPiece2, v29);
    -[YearMonthTransitionView addSubview:](self, "addSubview:", self->_monthBottomSlidingPiece2);
  }

}

- (void)_haltAnimations
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CrossFadeView haltAnimation](self->_monthLabel, "haltAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  recursiveAnimationRemove(v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_yearViewController, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "removeAllAnimations");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_monthTransitionViewInYearState, "layer"));
  objc_msgSend(v8, "removeAllAnimations");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_monthTransitionViewInMonthState, "layer"));
  objc_msgSend(v9, "removeAllAnimations");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_monthTopSlidingPiece, "layer"));
  objc_msgSend(v10, "removeAllAnimations");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_monthBottomSlidingPiece, "layer"));
  objc_msgSend(v11, "removeAllAnimations");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_monthBottomSlidingPiece2, "layer"));
  objc_msgSend(v12, "removeAllAnimations");

}

- (void)_animateView:(id)a3 toFrame:(CGRect)a4
{
  id v4;

  v4 = (id)springAnimateViewFrame(a3, 2, 0, (__n128)a4.origin, *(__n128 *)&a4.origin.y, (__n128)a4.size, *(__n128 *)&a4.size.height);
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  id v4;

  v4 = (id)springAnimateViewPosition(a3, 2, 0, (__n128)a4, *(__n128 *)&a4.y);
}

- (void)_animateView:(id)a3 toBounds:(CGRect)a4
{
  id v4;

  v4 = (id)springAnimateViewBounds(a3, 2, 0, (__n128)a4.origin, *(__n128 *)&a4.origin.y, (__n128)a4.size, *(__n128 *)&a4.size.height);
}

- (void)_animateView:(id)a3 toAlpha:(double)a4
{
  id v4;

  v4 = (id)springAnimateViewAlpha(a3, 2, 0, a4);
}

- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v13 = objc_alloc_init((Class)CABasicAnimation);
  objc_msgSend(v13, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v7, "alpha");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v13, "setFromValue:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v13, "setToValue:", v9);

  objc_msgSend(v13, "setDuration:", UIAnimationDragCoefficient(v10, v11) * a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v12, "addAnimation:forKey:", v13, CFSTR("opacity"));

  objc_msgSend(v7, "setAlpha:", a4);
}

- (BOOL)_canFastSnapshotYear
{
  return self->_yearToMonth;
}

- (BOOL)_canFastSnapshotMonth
{
  return !self->_yearToMonth;
}

- (CGRect)_monthFrameForMonthBefore:(id)a3 anchorMonth:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "frame");
  v14 = v13;
  objc_msgSend(v6, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  v23 = v14 - CGRectGetHeight(v30);
  objc_msgSend(v5, "topInset");
  v25 = v24;

  v26 = v23 + v25;
  v27 = v8;
  v28 = v10;
  v29 = v12;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

- (CGRect)_monthFrameForMonthAfter:(id)a3 anchorMonth:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  MaxY = CGRectGetMaxY(v28);
  objc_msgSend(v6, "topInset");
  v23 = v22;

  v24 = MaxY - v23;
  v25 = v8;
  v26 = v10;
  v27 = v12;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

- (id)_getMonthViewMonthContainingDate:(id)a3 hideMonthLabel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  YearMonthTransitionMonthView *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  id v11;
  double y;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  uint64_t SnapshotFromView;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  uint64_t v58;
  double v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  NSMutableArray *v64;
  void *v65;
  double width;
  NSMutableArray *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  void *i;
  void *v74;
  void *v75;
  float v76;
  double v77;
  double MaxY;
  double v79;
  YearMonthTransitionMonthView *v80;
  void *v81;
  double v82;
  double x;
  double v84;
  void *v85;
  void *v86;
  NSMutableArray *v87;
  id v88;
  id v89;
  uint64_t v90;
  void *j;
  id v93;
  NSMutableArray *v94;
  int v95;
  id v96;
  void *v97;
  YearMonthTransitionView *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(YearMonthTransitionMonthView);
  -[YearMonthTransitionMonthView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  v94 = objc_opt_new(NSMutableArray);
  v8 = objc_opt_new(NSMutableArray);
  v93 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForMonth"));
  v10 = objc_msgSend(v9, "copy");

  v11 = v10;
  y = CGRectNull.origin.y;
  v13 = objc_msgSend(v11, "month");
  v96 = v11;
  v98 = self;
  if (v13 == objc_msgSend(v11, "month"))
  {
    v14 = 0;
    v15 = 0;
    v95 = !v4;
    v16 = -1;
    v17 = 0.0;
    v18 = v11;
    v100 = 0;
    while (1)
    {
      v101 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self->_monthViewController, "subviewForDate:", v18));
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "layoutIfNeeded");
        if (v16 < 0)
        {
          objc_msgSend(v20, "frame");
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
          -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v29, v22, v24, v26, v28);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;

          v113.origin.x = v31;
          v113.origin.y = v33;
          v113.size.width = v35;
          v113.size.height = v37;
          if (!CGRectIsNull(v113))
          {
            y = v33;
            v16 = v15;
          }
        }
        objc_msgSend(v20, "bounds");
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        objc_msgSend(v20, "setBounds:", v38, v40 - self->_monthWeekViewExtent);
        objc_opt_class(CompactMonthWeekView);
        v47 = v18;
        if ((objc_opt_isKindOfClass(v20, v46) & 1) != 0)
          v48 = v20;
        else
          v48 = 0;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "monthNameLabel"));
        v50 = objc_msgSend(v49, "isHidden");

        if ((v95 | v50) == 1)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "snapshotViewAfterScreenUpdates:", v98->_yearToMonth));
        }
        else
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "monthNameLabel"));
          objc_msgSend(v52, "setHidden:", 1);

          objc_msgSend(v20, "bounds");
          SnapshotFromView = createSnapshotFromView(v20, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue(SnapshotFromView);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "monthNameLabel"));
          objc_msgSend(v54, "setHidden:", 0);

        }
        v18 = v47;
        objc_msgSend(v20, "setBounds:", v39, v41, v43, v45);
        self = v98;
        if (v51)
        {
          objc_msgSend(v20, "frame");
          objc_msgSend(v51, "setFrame:");
          -[NSMutableArray addObject:](v94, "addObject:", v51);
          v55 = v18;
          objc_msgSend(v20, "topInset");
          *(float *)&v56 = v56;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v56));
          -[NSMutableArray addObject:](v8, "addObject:", v57);

          v18 = v55;
        }

        v11 = v96;
      }
      if (!v100)
      {
        objc_opt_class(CompactMonthWeekView);
        if ((objc_opt_isKindOfClass(v20, v58) & 1) == 0)
        {
          v100 = 0;
          if (v15)
            goto LABEL_21;
LABEL_20:
          objc_msgSend(v20, "topInset");
          v17 = v59;
          goto LABEL_21;
        }
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "monthNameLabel"));
      }
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v60 = v18;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self->_monthViewController, "calendarDateForSubviewBelowSubviewWithCalendarDate:", v60));
      ++v15;

      v61 = v60;
      v62 = objc_msgSend(v18, "month");
      v63 = objc_msgSend(v11, "month");
      v14 = v61;
      if (v62 != v63)
        goto LABEL_26;
    }
  }
  v100 = 0;
  v61 = 0;
  v17 = 0.0;
  v16 = -1;
  v18 = v11;
LABEL_26:
  v64 = v94;
  if (-[NSMutableArray count](v94, "count"))
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v94, "firstObject"));
    v99 = v61;
    v97 = v65;
    if (v65)
    {
      objc_msgSend(v65, "frame");
      CGRectGetMinY(v114);
    }
    width = CGRectZero.size.width;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v67 = v94;
    v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
    v102 = v18;
    if (v68)
    {
      v69 = v68;
      v70 = 0;
      v71 = *(_QWORD *)v108;
      v72 = 0.0;
      do
      {
        for (i = 0; i != v69; i = (char *)i + 1)
        {
          if (*(_QWORD *)v108 != v71)
            objc_enumerationMutation(v67);
          v74 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v74, "frame");
          objc_msgSend(v74, "setFrame:");
          if ((uint64_t)i + v70 < v16)
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v8, "objectAtIndex:", (char *)i + v70));
            objc_msgSend(v75, "floatValue");
            v77 = v76;

            objc_msgSend(v74, "bounds");
            v72 = v72 + CGRectGetHeight(v115) - v77;
          }
          objc_msgSend(v74, "frame");
          MaxY = CGRectGetMaxY(v116);
          objc_msgSend(v74, "bounds");
          v79 = CGRectGetWidth(v117);
          if (v79 >= width)
            width = v79;
        }
        v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
        v70 += (uint64_t)i;
      }
      while (v69);
      v64 = v94;
      v11 = v96;
    }
    else
    {
      MaxY = CGRectZero.size.height;
      v72 = 0.0;
    }

    v81 = v93;
    v61 = v99;
    if (v16 < 0)
    {
      x = CGRectZero.origin.x;
      v82 = CGRectZero.origin.y;
    }
    else
    {
      v82 = y - v72;
      -[YearMonthTransitionMonthView setHasValidOrigin:](v7, "setHasValidOrigin:", 1);
      x = 0.0;
    }
    if (-[CompactWidthMonthViewController dividedListMode](v98->_monthViewController, "dividedListMode"))
    {
      -[CompactWidthMonthViewController showDateVerticalOffsetForDate:](v98->_monthViewController, "showDateVerticalOffsetForDate:", v93);
      MaxY = MaxY + v84;
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](v98->_monthViewController, "scrollView"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "backgroundColor"));
    -[YearMonthTransitionMonthView setBackgroundColor:](v7, "setBackgroundColor:", v86);

    -[YearMonthTransitionMonthView setTopInset:](v7, "setTopInset:", v17);
    -[YearMonthTransitionMonthView setFrame:](v7, "setFrame:", x, v82, width, MaxY);
    -[YearMonthTransitionMonthView setMonthLabel:](v7, "setMonthLabel:", v100);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v87 = v67;
    v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v89; j = (char *)j + 1)
        {
          if (*(_QWORD *)v104 != v90)
            objc_enumerationMutation(v87);
          -[YearMonthTransitionMonthView addSubview:](v7, "addSubview:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)j));
        }
        v89 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
      }
      while (v89);
    }

    -[YearMonthTransitionMonthView setWeekViews:](v7, "setWeekViews:", v87);
    v80 = v7;

    v18 = v102;
  }
  else
  {
    v80 = 0;
    v81 = v93;
  }

  return v80;
}

- (id)_getWeekContainingDate:(id)a3 prevDate:(id)a4
{
  id v6;
  id v7;
  CompactWidthMonthViewController *monthViewController;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Width;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v6 = a3;
  v7 = a4;
  monthViewController = self->_monthViewController;
  if (v7)
    v9 = -[CompactWidthMonthViewController newBottomViewBelowViewWithCalendarDate:](monthViewController, "newBottomViewBelowViewWithCalendarDate:", v7);
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController createInitialViewForDate:](monthViewController, "createInitialViewForDate:", v6));
  v10 = v9;
  objc_msgSend(v9, "sizeToFit");
  objc_msgSend(v10, "bounds");
  if (fabs(CGRectGetWidth(v17)) < 2.22044605e-16)
  {
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    -[YearMonthTransitionView bounds](self, "bounds");
    Width = CGRectGetWidth(v18);
    objc_msgSend(v10, "bounds");
    objc_msgSend(v10, "setFrame:", v12, v14, Width, CGRectGetWidth(v19));
  }
  objc_msgSend(v10, "layoutIfNeeded");

  return v10;
}

+ (double)_monthHeaderHeight
{
  double result;

  +[CompactMonthWeekView headerHeight](CompactMonthWeekView, "headerHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthListView, 0);
  objc_storeStrong((id *)&self->_yearInMonthCoveringView, 0);
  objc_storeStrong((id *)&self->_monthViewInYearView, 0);
  objc_storeStrong((id *)&self->_monthViewInMonthView, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
  objc_storeStrong((id *)&self->_yearViewController, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_monthBottomSlidingPiece2, 0);
  objc_storeStrong((id *)&self->_monthBottomSlidingPiece, 0);
  objc_storeStrong((id *)&self->_monthTopSlidingPiece, 0);
  objc_storeStrong((id *)&self->_monthTransitionViewInMonthState, 0);
  objc_storeStrong((id *)&self->_monthTransitionViewInYearState, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
