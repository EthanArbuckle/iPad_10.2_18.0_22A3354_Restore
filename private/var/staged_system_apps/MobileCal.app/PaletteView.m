@implementation PaletteView

- (void)_updateFocusBannerVisibility
{
  -[PaletteView setFocusBannerPlacement:](self, "setFocusBannerPlacement:", -[PaletteView focusBannerPlacement](self, "focusBannerPlacement"));
  -[PaletteView _updateFocusBanner](self, "_updateFocusBanner");
  -[PaletteView setNeedsLayout](self, "setNeedsLayout");
  -[PaletteView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_updateFocusBanner
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PaletteView delegate](self, "delegate"));
  -[EKUIFocusBannerView setOn:](self->_focusFilterBanner, "setOn:", objc_msgSend(v3, "focusFilterMode") == (id)1);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  int IsLeftToRight;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  EKUILabeledAvatarView *avatarView;
  int v29;
  double v30;
  EKUILabeledAvatarView *v31;
  double v32;
  double MaxX;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  void *v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat MaxY;
  double v70;
  id v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double MidX;
  uint64_t v77;
  double MidY;
  uint64_t v82;
  uint64_t v83;
  double v84;
  int *v85;
  CGFloat v86;
  void *v87;
  id v88;
  id v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  objc_super v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v104.receiver = self;
  v104.super_class = (Class)PaletteView;
  -[PaletteView layoutSubviews](&v104, "layoutSubviews");
  if (-[PaletteView suppressLayout](self, "suppressLayout"))
    return;
  -[PaletteView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView traitCollection](self, "traitCollection"));
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = -[PaletteView paletteTopMargin](self, "paletteTopMargin");
  v15 = v14;
  if (v12)
    v16 = 37.0;
  else
    v16 = 28.0;
  IsLeftToRight = CalInterfaceIsLeftToRight(v13);
  -[PaletteView safeAreaInsets](self, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  -[PaletteView safeAreaInsets](self, "safeAreaInsets");
  if (IsLeftToRight)
    v24 = v23;
  else
    v24 = v22;
  if (IsLeftToRight)
    v25 = v19;
  else
    v25 = v21;
  v26 = v24 + 16.0;
  v27 = v25 + 20.0;
  avatarView = self->_avatarView;
  if (avatarView && self->_avatarViewVisible)
  {
    v29 = CalInterfaceIsLeftToRight(-[EKUILabeledAvatarView frame](avatarView, "frame"));
    v30 = v8 - v26 - v16;
    if (v29)
      v30 = v27;
    -[EKUILabeledAvatarView setFrame:](self->_avatarView, "setFrame:", v30, v15, v16, v16);
  }
  if (self->_dateStringVisible)
  {
    -[UILabel sizeToFit](self->_dateLabel, "sizeToFit");
    v31 = self->_avatarView;
    v100 = v26;
    v102 = v4;
    if (v31 && self->_avatarViewVisible)
    {
      v32 = v10;
      -[EKUILabeledAvatarView frame](v31, "frame");
      MaxX = CGRectGetMaxX(v105);
      v34 = -[UILabel frame](self->_dateLabel, "frame");
      v36 = v35;
      v38 = v37;
      if (!v12)
      {
        -[EKUILabeledAvatarView frame](self->_avatarView, "frame");
        v15 = CGRectGetMaxY(v106) - v38 + -1.2;
      }
      if ((CalInterfaceIsLeftToRight(v34) & 1) != 0)
      {
        v39 = MaxX + 8.0;
LABEL_28:
        -[UILabel setFrame:](self->_dateLabel, "setFrame:", v39, v15, v36, v38, *(_QWORD *)&v100, *(_QWORD *)&v102);
        -[UILabel setFrame:](self->_animatableDateLabel, "setFrame:", v39, v15, v36, v38);
        v108.origin.x = v39;
        v108.origin.y = v15;
        v108.size.width = v36;
        v108.size.height = v38;
        v44 = CGRectGetMaxY(v108) + 7.0;
        if (v6 < v44)
          v6 = v44;
        v10 = v32;
        v26 = v101;
        v4 = v103;
        goto LABEL_31;
      }
      -[EKUILabeledAvatarView frame](self->_avatarView, "frame");
      v43 = CGRectGetMinX(v107) + -8.0;
    }
    else
    {
      v32 = v10;
      v40 = -[UILabel frame](self->_dateLabel, "frame", *(_QWORD *)&v26, *(_QWORD *)&v102);
      v36 = v41;
      v38 = v42;
      if ((CalInterfaceIsLeftToRight(v40) & 1) != 0)
      {
        v39 = v27;
        goto LABEL_28;
      }
      v43 = v8 - v26;
    }
    v39 = v43 - v36;
    goto LABEL_28;
  }
LABEL_31:
  if (self->_todayButtonVisible)
  {
    -[UIButton sizeToFit](self->_todayButton, "sizeToFit");
    v45 = -[UIButton frame](self->_todayButton, "frame");
    v47 = v46;
    v49 = v48;
    if (CalInterfaceIsLeftToRight(v45))
    {
      -[PaletteView frame](self, "frame");
      v27 = v50 - v47 - v26;
    }
    -[UILabel frame](self->_dateLabel, "frame");
    -[UIButton setFrame:](self->_todayButton, "setFrame:", v27, CGRectGetMidY(v109) + v49 * -0.5, v47, v49);
  }
  if (-[PaletteView weekdayHeaderFillsHalfWidth](self, "weekdayHeaderFillsHalfWidth"))
  {
    v4 = v4 + -3.0;
    v8 = v8 / 1.96;
  }
  v51 = 0.0;
  if (-[PaletteView weekdayHeaderMovedBeyondLeftEdge](self, "weekdayHeaderMovedBeyondLeftEdge"))
    v52 = v8;
  else
    v52 = 0.0;
  if (-[PaletteView weekdayHeaderVisible](self, "weekdayHeaderVisible"))
  {
    -[PaletteView _layoutDayInitialsView:](self, "_layoutDayInitialsView:", 0.0, v6);
    -[WeekDayInitialsHeaderView frame](self->_dayInitialsHeaderView, "frame");
    v54 = v53;
    v6 = v55;
    v51 = v56;
    v58 = v57;
  }
  else
  {
    v58 = 0.0;
    v54 = 0.0;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self, "dayScrubberController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));

  if (v60)
  {
    v61 = v4 - v52;
    objc_msgSend(v60, "sizeThatFits:", v8, v10);
    v62 = v6;
    v64 = v63;
    v65 = v8;
    v66 = v10;
    v68 = v67;
    v110.origin.x = v54;
    v110.origin.y = v62;
    v110.size.width = v51;
    v110.size.height = v58;
    MaxY = CGRectGetMaxY(v110);
    v70 = v68;
    v10 = v66;
    v8 = v65;
    objc_msgSend(v60, "setFrame:", v61, MaxY, v64, v70);
  }
  v71 = (id)-[PaletteView focusBannerVisible](self, "focusBannerVisible");
  if (!(_DWORD)v71)
    goto LABEL_58;
  -[EKUIFocusBannerView sizeThatFits:](self->_focusFilterBanner, "sizeThatFits:", v8, 0.0);
  v73 = v72;
  v75 = v74;
  if ((id)-[PaletteView focusBannerPlacement](self, "focusBannerPlacement") != (id)1)
  {
    -[EKUIFocusBannerView setBounds:](self->_focusFilterBanner, "setBounds:", CGPointZero.x, CGPointZero.y, v73, v75);
    -[PaletteView bounds](self, "bounds");
    MidX = CGRectGetMidX(v111);
    if (self->_dateStringVisible)
      -[UILabel frame](self->_dateLabel, "frame");
    else
      -[PaletteView bounds](self, "bounds");
    MidY = CGRectGetMidY(*(CGRect *)&v77);
    if ((CalInterfaceIsLeftToRight(v82) & 1) != 0)
    {
      v83 = 8;
      -[UILabel frame](self->_dateLabel, "frame");
      v84 = CGRectGetMaxX(v112);
      -[EKUIFocusBannerView frame](self->_focusFilterBanner, "frame");
      if (v84 > MidX + CGRectGetWidth(v113) * -0.5)
      {
        v85 = &OBJC_IVAR___PaletteView__todayButton;
LABEL_56:
        v87 = *(Class *)((char *)&self->super.super.super.isa + v83);
        v88 = *(id *)((char *)&self->super.super.super.isa + *v85);
        v89 = v87;
        objc_msgSend(v89, "frame");
        v90 = CGRectGetMaxX(v116);
        objc_msgSend(v88, "frame");
        v92 = v91;
        v94 = v93;
        v96 = v95;
        v98 = v97;

        v117.origin.x = v92;
        v117.origin.y = v94;
        v117.size.width = v96;
        v117.size.height = v98;
        MidX = v90 + (CGRectGetMinX(v117) - v90) * 0.5;

      }
    }
    else
    {
      -[EKUIFocusBannerView frame](self->_focusFilterBanner, "frame");
      v86 = MidX + CGRectGetWidth(v114) * 0.5;
      -[UILabel frame](self->_dateLabel, "frame");
      if (v86 > CGRectGetMinX(v115))
      {
        v83 = 24;
        v85 = &OBJC_IVAR___PaletteView__dateLabel;
        goto LABEL_56;
      }
    }
    v71 = -[EKUIFocusBannerView setCenter:](self->_focusFilterBanner, "setCenter:", MidX, MidY);
    goto LABEL_58;
  }
  v71 = -[EKUIFocusBannerView setFrame:](self->_focusFilterBanner, "setFrame:", 0.0, v10 - v75, v8, v75);
LABEL_58:
  if (self->_dividerLineVisible)
  {
    v99 = CalOnePixelInPoints(v71);
    -[UIView setFrame:](self->_dividerLine, "setFrame:", 0.0, v10 - v99, v8, v99);
  }

}

- (void)setDayHeaderFrames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    -[PaletteView layoutSubviews](self, "layoutSubviews");
    self->_useCustomDayFrames = 1;
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    if (CalTimeDirectionIsLeftToRight(v4, v5))
      v6 = 0;
    else
      v6 = 2;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000192FC;
    v9[3] = &unk_1001B51A0;
    v9[4] = self;
    v10 = v4;
    v7 = v4;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", v6, v9);
    -[WeekDayInitialsHeaderView setDayFrames:](self->_dayInitialsHeaderView, "setDayFrames:", v7);

  }
}

- (void)setTodayButtonVisible:(BOOL)a3
{
  _BOOL4 v3;
  UIButton *todayButton;
  UIButton *v6;
  UIButton *v7;
  UIButton *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UILargeContentViewerInteraction *v15;

  if (self->_todayButtonVisible != a3)
  {
    v3 = a3;
    todayButton = self->_todayButton;
    if (v3)
    {
      if (!todayButton)
      {
        v6 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
        v7 = self->_todayButton;
        self->_todayButton = v6;

        v8 = self->_todayButton;
        v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));
        -[UIButton setTitle:forState:](v8, "setTitle:forState:", v11, 0);

        -[UIButton addTarget:action:forControlEvents:](self->_todayButton, "addTarget:action:forControlEvents:", self, "todayTapped", 64);
        -[UIButton setPointerInteractionEnabled:](self->_todayButton, "setPointerInteractionEnabled:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView todayButtonFont](self, "todayButtonFont"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_todayButton, "titleLabel"));
        objc_msgSend(v13, "setFont:", v12);

        -[UIButton setShowsLargeContentViewer:](self->_todayButton, "setShowsLargeContentViewer:", 1);
        v14 = self->_todayButton;
        v15 = objc_opt_new(UILargeContentViewerInteraction);
        -[UIButton addInteraction:](v14, "addInteraction:", v15);

        -[UIButton setAccessibilityIdentifier:](self->_todayButton, "setAccessibilityIdentifier:", CFSTR("today-button"));
        todayButton = self->_todayButton;
      }
      -[PaletteView addSubview:](self, "addSubview:", todayButton);
    }
    else
    {
      -[UIButton removeFromSuperview](self->_todayButton, "removeFromSuperview");
    }
    self->_todayButtonVisible = v3;
  }
}

- (void)setDividerLineVisible:(BOOL)a3
{
  UIView *dividerLine;
  UIView *v5;
  UIView *v6;
  void *v7;

  if (self->_dividerLineVisible != a3)
  {
    self->_dividerLineVisible = a3;
    dividerLine = self->_dividerLine;
    if (a3)
    {
      if (!dividerLine)
      {
        v5 = (UIView *)objc_alloc_init((Class)UIView);
        v6 = self->_dividerLine;
        self->_dividerLine = v5;

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
        -[UIView setBackgroundColor:](self->_dividerLine, "setBackgroundColor:", v7);

        dividerLine = self->_dividerLine;
      }
      -[PaletteView addSubview:](self, "addSubview:", dividerLine);
    }
    else
    {
      -[UIView removeFromSuperview](self->_dividerLine, "removeFromSuperview");
    }
  }
}

- (void)setDateStringVisible:(BOOL)a3
{
  UILabel *dateLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *animatableDateLabel;
  UILabel *v10;

  if (self->_dateStringVisible != a3)
  {
    dateLabel = self->_dateLabel;
    if (a3)
    {
      if (!dateLabel)
      {
        v6 = -[PaletteView newDateLabel](self, "newDateLabel");
        v7 = self->_dateLabel;
        self->_dateLabel = v6;

      }
      if (!self->_animatableDateLabel)
      {
        v8 = -[PaletteView newDateLabel](self, "newDateLabel");
        animatableDateLabel = self->_animatableDateLabel;
        self->_animatableDateLabel = v8;

        -[UILabel setAlpha:](self->_animatableDateLabel, "setAlpha:", 0.0);
        -[PaletteView addSubview:](self, "addSubview:", self->_animatableDateLabel);
      }
      v10 = self->_dateLabel;
      if (self->_dateString)
      {
        -[UILabel setAttributedText:](self->_dateLabel, "setAttributedText:", self->_dateString);
        -[UILabel setAttributedText:](self->_animatableDateLabel, "setAttributedText:", self->_dateString);
        v10 = self->_dateLabel;
      }
      -[PaletteView addSubview:](self, "addSubview:", v10);
    }
    else
    {
      -[UILabel removeFromSuperview](dateLabel, "removeFromSuperview");
    }
    self->_dateStringVisible = a3;
  }
}

- (void)setFocusBannerPlacement:(unint64_t)a3
{
  unsigned int v4;
  void *v5;
  _BOOL4 v6;
  EKUIFocusBannerView *focusFilterBanner;
  EKUIFocusBannerView *v8;
  EKUIFocusBannerView *v9;
  unint64_t focusBannerPlacement;
  _BOOL8 v11;

  self->_focusBannerPlacement = a3;
  v4 = -[PaletteView focusBannerVisible](self, "focusBannerVisible");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIFocusBannerView superview](self->_focusFilterBanner, "superview"));
  v6 = v5 == 0;

  if (((v4 ^ v6) & 1) == 0)
  {
    focusFilterBanner = self->_focusFilterBanner;
    if (v4)
    {
      if (!focusFilterBanner)
      {
        v8 = (EKUIFocusBannerView *)objc_alloc_init((Class)EKUIFocusBannerView);
        v9 = self->_focusFilterBanner;
        self->_focusFilterBanner = v8;

        -[EKUIFocusBannerView setAutoresizingMask:](self->_focusFilterBanner, "setAutoresizingMask:", 0);
        -[EKUIFocusBannerView setDelegate:](self->_focusFilterBanner, "setDelegate:", self);
        focusFilterBanner = self->_focusFilterBanner;
      }
      -[PaletteView addSubview:](self, "addSubview:", focusFilterBanner);
      -[PaletteView _updateFocusBanner](self, "_updateFocusBanner");
    }
    else
    {
      -[EKUIFocusBannerView removeFromSuperview](self->_focusFilterBanner, "removeFromSuperview");
    }
  }
  focusBannerPlacement = self->_focusBannerPlacement;
  v11 = focusBannerPlacement != 1;
  -[EKUIFocusBannerView setShowDividers:](self->_focusFilterBanner, "setShowDividers:", focusBannerPlacement == 1);
  -[EKUIFocusBannerView setLayout:](self->_focusFilterBanner, "setLayout:", v11);
  -[EKUIFocusBannerView setDisallowAccessibilityTextSizes:](self->_focusFilterBanner, "setDisallowAccessibilityTextSizes:", v11);
}

- (void)setWeekdayHeaderVisible:(BOOL)a3
{
  WeekDayInitialsHeaderView *dayInitialsHeaderView;
  id v5;
  WeekDayInitialsHeaderView *v6;
  WeekDayInitialsHeaderView *v7;

  if (self->_weekdayHeaderVisible != a3)
  {
    self->_weekdayHeaderVisible = a3;
    dayInitialsHeaderView = self->_dayInitialsHeaderView;
    if (a3)
    {
      if (!dayInitialsHeaderView)
      {
        v5 = -[PaletteView _generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:](self, "_generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:", EKUICurrentWindowInterfaceParadigm_SupportsLargeWeekdayNamesInNavigationPalette());
        v6 = (WeekDayInitialsHeaderView *)objc_claimAutoreleasedReturnValue(v5);
        v7 = self->_dayInitialsHeaderView;
        self->_dayInitialsHeaderView = v6;

        dayInitialsHeaderView = self->_dayInitialsHeaderView;
      }
      -[PaletteView addSubview:](self, "addSubview:", dayInitialsHeaderView);
    }
    else
    {
      -[WeekDayInitialsHeaderView removeFromSuperview](self->_dayInitialsHeaderView, "removeFromSuperview");
    }
    -[WeekDayInitialsHeaderView sizeToFit](self->_dayInitialsHeaderView, "sizeToFit");
  }
}

- (void)setWeekdayHeaderFillsHalfWidth:(BOOL)a3
{
  self->_weekdayHeaderFillsHalfWidth = a3;
}

- (void)setUseCustomDayFrames:(BOOL)a3
{
  self->_useCustomDayFrames = a3;
  -[WeekDayInitialsHeaderView setUseCustomDayFrames:](self->_dayInitialsHeaderView, "setUseCustomDayFrames:");
}

- (void)setDayScrubberController:(id)a3
{
  DayNavigationViewController *v5;
  DayNavigationViewController **p_dayScrubberController;
  DayNavigationViewController *dayScrubberController;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double Width;
  void *v38;
  DayNavigationViewController *v39;
  CGRect v40;

  v5 = (DayNavigationViewController *)a3;
  p_dayScrubberController = &self->_dayScrubberController;
  dayScrubberController = self->_dayScrubberController;
  v39 = v5;
  if (dayScrubberController != v5)
  {
    if (dayScrubberController)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](dayScrubberController, "view"));
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView superview](self, "superview"));
      objc_msgSend(v17, "frame");
      v19 = v10 + v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView superview](self, "superview"));
      objc_msgSend(v20, "frame");
      v22 = v12 + v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v23, "setFrame:", v19, v22, v14, v16);

      -[DayNavigationViewController removeFromParentViewController](*p_dayScrubberController, "removeFromParentViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v24, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_dayScrubberController, a3);
    if (*p_dayScrubberController)
    {
      v25 = objc_claimAutoreleasedReturnValue(-[PaletteView window](self, "window"));
      v26 = (void *)v25;
      if (v25)
        EKUIPushFallbackSizingContextWithViewHierarchy(v25);
      -[DayNavigationViewController removeFromParentViewController](*p_dayScrubberController, "removeFromParentViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v27, "removeFromSuperview");

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      -[PaletteView addSubview:](self, "addSubview:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v29, "sizeToFit");

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;

      -[PaletteView bounds](self, "bounds");
      Width = CGRectGetWidth(v40);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](*p_dayScrubberController, "view"));
      objc_msgSend(v38, "setFrame:", v32, v34, Width, v36);

      -[PaletteView safeAreaInsets](self, "safeAreaInsets");
      -[DayNavigationViewController setPaletteSafeAreaInsets:](*p_dayScrubberController, "setPaletteSafeAreaInsets:");
      if (v26)
        EKUIPopFallbackSizingContextWithViewHierarchy(v26);

    }
  }

}

- (BOOL)hasContent
{
  BOOL v3;
  void *v4;

  if (-[PaletteView weekdayHeaderVisible](self, "weekdayHeaderVisible"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self, "dayScrubberController"));
  if (v4
    || -[PaletteView todayButtonVisible](self, "todayButtonVisible")
    || -[PaletteView dateStringVisible](self, "dateStringVisible"))
  {
    v3 = 1;
  }
  else
  {
    v3 = -[PaletteView focusBannerVisible](self, "focusBannerVisible");
  }

  return v3;
}

- (BOOL)weekdayHeaderFillsHalfWidth
{
  return self->_weekdayHeaderFillsHalfWidth;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_todayButtonVisible || self->_dateStringVisible)
  {
    -[PaletteView paletteTopMargin](self, "paletteTopMargin");
    v7 = v6;
    -[UIButton sizeThatFits:](self->_todayButton, "sizeThatFits:", width, height);
    v9 = v8;
    -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", width, height);
    if (v9 >= v10)
      v11 = v9;
    else
      v11 = v10;
    v12 = v7 + v11 + 7.0;
  }
  else
  {
    v12 = 0.0;
  }
  if (-[PaletteView weekdayHeaderVisible](self, "weekdayHeaderVisible"))
  {
    -[WeekDayInitialsHeaderView sizeThatFits:](self->_dayInitialsHeaderView, "sizeThatFits:", width, height);
    v12 = v12 + v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self, "dayScrubberController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));

  if (v15)
  {
    objc_msgSend(v15, "sizeThatFits:", width, height);
    v12 = v12 + v16;
  }
  if (-[PaletteView focusBannerVisible](self, "focusBannerVisible")
    && (id)-[PaletteView focusBannerPlacement](self, "focusBannerPlacement") == (id)1)
  {
    -[EKUIFocusBannerView sizeThatFits:](self->_focusFilterBanner, "sizeThatFits:", width, 0.0);
    v12 = v12 + v17;
  }
  -[PaletteView extraPaletteHeight](self, "extraPaletteHeight");
  v19 = v12 + v18;

  v20 = width;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)weekdayHeaderVisible
{
  return self->_weekdayHeaderVisible;
}

- (DayNavigationViewController)dayScrubberController
{
  return self->_dayScrubberController;
}

- (double)extraPaletteHeight
{
  return self->_extraPaletteHeight;
}

- (BOOL)weekdayHeaderMovedBeyondLeftEdge
{
  return self->_weekdayHeaderMovedBeyondLeftEdge;
}

- (void)_layoutDayInitialsView:(CGPoint)a3
{
  double y;
  double x;
  WeekDayInitialsHeaderView *dayInitialsHeaderView;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  -[PaletteView bounds](self, "bounds");
  -[WeekDayInitialsHeaderView sizeThatFits:](dayInitialsHeaderView, "sizeThatFits:", v7, v8);
  -[WeekDayInitialsHeaderView setFrame:](self->_dayInitialsHeaderView, "setFrame:", x, y, v9, v10);
}

- (BOOL)focusBannerVisible
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;

  v3 = -[PaletteView focusBannerPlacement](self, "focusBannerPlacement");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "focusFilterMode");

    LOBYTE(v3) = v6 && (v4 != 2 || !-[PaletteView shouldHideInlineFocusBanner](self, "shouldHideInlineFocusBanner"));
  }
  return v3;
}

- (unint64_t)focusBannerPlacement
{
  return self->_focusBannerPlacement;
}

- (PaletteViewDelegate)delegate
{
  return (PaletteViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PaletteView;
  -[PaletteView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3)
    -[PaletteView _focusConfigurationChanged](self, "_focusConfigurationChanged");
}

- (void)setShouldHideInlineFocusBanner:(BOOL)a3
{
  if (self->_shouldHideInlineFocusBanner != a3)
  {
    self->_shouldHideInlineFocusBanner = a3;
    -[PaletteView _updateFocusBannerVisibility](self, "_updateFocusBannerVisibility");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAvatarViewVisible:(BOOL)a3
{
  EKUILabeledAvatarView *avatarView;

  self->_avatarViewVisible = a3;
  avatarView = self->_avatarView;
  if (avatarView)
  {
    -[EKUILabeledAvatarView setAlpha:](avatarView, "setAlpha:", (double)a3);
    -[PaletteView setNeedsLayout](self, "setNeedsLayout");
    -[PaletteView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (id)_generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:(BOOL)a3
{
  __objc2_class **v3;

  v3 = off_1001B1660;
  if (!a3)
    v3 = off_1001B13C0;
  return objc_alloc_init(*v3);
}

- (void)_focusConfigurationChanged
{
  -[PaletteView _updateFocusBannerVisibility](self, "_updateFocusBannerVisibility");
}

- (PaletteView)initWithBarPalette:(id)a3
{
  id v4;
  PaletteView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v12.receiver = self;
  v12.super_class = (Class)PaletteView;
  v5 = -[PaletteView initWithFrame:](&v12, "initWithFrame:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PaletteView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_storeWeak((id *)&v5->_containingPalette, v4);
    objc_msgSend(v4, "setClipsToBounds:", 0);

    -[PaletteView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "_localeChanged:", CUIKLocaleChangedNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "_contentSizeCategoryChanged", UIContentSizeCategoryDidChangeNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, "_focusConfigurationChanged", CUIKCalendarModelFocusModeConfigurationChangedNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PaletteView;
  -[PaletteView dealloc](&v4, "dealloc");
}

- (void)safeAreaInsetsDidChange
{
  -[PaletteView safeAreaInsets](self, "safeAreaInsets");
  -[DayNavigationViewController setPaletteSafeAreaInsets:](self->_dayScrubberController, "setPaletteSafeAreaInsets:");
}

- (double)paletteTopMargin
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  int v11;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v6, "horizontalSizeClass") == (id)1)
  {
    -[PaletteView bounds](self, "bounds");
    v8 = v7 <= v5 + 1.0;
  }
  else
  {
    v8 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10)
    v11 = v8;
  else
    v11 = 1;
  result = 16.0;
  if (v11)
    return 6.0;
  return result;
}

- (void)setWeekdayHeaderMovedBeyondLeftEdge:(BOOL)a3
{
  self->_weekdayHeaderMovedBeyondLeftEdge = a3;
}

- (void)removeAllContent
{
  -[PaletteView setWeekdayHeaderVisible:](self, "setWeekdayHeaderVisible:", 0);
  -[PaletteView setDayScrubberController:](self, "setDayScrubberController:", 0);
  -[PaletteView setWeekdayHeaderFillsHalfWidth:](self, "setWeekdayHeaderFillsHalfWidth:", 0);
  -[PaletteView setWeekdayHeaderMovedBeyondLeftEdge:](self, "setWeekdayHeaderMovedBeyondLeftEdge:", 0);
  -[PaletteView setExtraPaletteHeight:](self, "setExtraPaletteHeight:", 0.0);
  -[PaletteView setTodayButtonVisible:](self, "setTodayButtonVisible:", 0);
  -[PaletteView setDateStringVisible:](self, "setDateStringVisible:", 0);
  -[PaletteView setDateString:](self, "setDateString:", 0);
  -[PaletteView setFocusBannerPlacement:](self, "setFocusBannerPlacement:", 0);
}

- (void)focusBannerViewToggled:(id)a3
{
  uint64_t v4;
  id v5;

  if (objc_msgSend(a3, "on"))
    v4 = 1;
  else
    v4 = 2;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PaletteView delegate](self, "delegate"));
  objc_msgSend(v5, "setFocusFilterMode:", v4);

}

- (void)setExtraPaletteHeight:(double)a3
{
  if (self->_extraPaletteHeight != a3)
    self->_extraPaletteHeight = a3;
}

- (void)updateForChangeToTraitCollection:(id)a3
{
  WeekDayInitialsHeaderView *dayInitialsHeaderView;
  _BOOL8 v5;
  WeekDayInitialsHeaderView *v6;
  WeekDayInitialsHeaderView *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  -[PaletteView setWeekdayHeaderVisible:](self, "setWeekdayHeaderVisible:", 0);
  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  self->_dayInitialsHeaderView = 0;

  self->_weekdayHeaderFillsHalfWidth = 0;
  self->_weekdayHeaderMovedBeyondLeftEdge = 0;
  if (v9)
  {
    v5 = objc_msgSend(v9, "horizontalSizeClass") == (id)2 && objc_msgSend(v9, "verticalSizeClass") == (id)2;
    v6 = (WeekDayInitialsHeaderView *)objc_claimAutoreleasedReturnValue(-[PaletteView _generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:](self, "_generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:", v5));
    v7 = self->_dayInitialsHeaderView;
    self->_dayInitialsHeaderView = v6;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PaletteView setAvatarViewVisible:](self, "setAvatarViewVisible:", objc_msgSend(WeakRetained, "paletteShouldShowAvatarView"));

}

- (id)newDateLabel
{
  id v2;
  UILargeContentViewerInteraction *v3;

  v2 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);
  objc_msgSend(v2, "setShowsLargeContentViewer:", 1);
  v3 = objc_opt_new(UILargeContentViewerInteraction);
  objc_msgSend(v2, "addInteraction:", v3);

  return v2;
}

- (void)setDateString:(id)a3
{
  NSAttributedString *v4;
  UILabel *v5;
  UILabel *dateLabel;
  UILabel *v7;
  UILabel *animatableDateLabel;
  NSAttributedString *dateString;
  NSAttributedString *v10;

  v4 = (NSAttributedString *)a3;
  if (!self->_dateLabel)
  {
    v5 = -[PaletteView newDateLabel](self, "newDateLabel");
    dateLabel = self->_dateLabel;
    self->_dateLabel = v5;

  }
  if (!self->_animatableDateLabel)
  {
    v7 = -[PaletteView newDateLabel](self, "newDateLabel");
    animatableDateLabel = self->_animatableDateLabel;
    self->_animatableDateLabel = v7;

    -[UILabel setAlpha:](self->_animatableDateLabel, "setAlpha:", 0.0);
    -[PaletteView addSubview:](self, "addSubview:", self->_animatableDateLabel);
  }
  -[UILabel setAttributedText:](self->_dateLabel, "setAttributedText:", v4);
  -[UILabel setAttributedText:](self->_animatableDateLabel, "setAttributedText:", v4);
  dateString = self->_dateString;
  self->_dateString = v4;
  v10 = v4;

  -[UILabel sizeToFit](self->_dateLabel, "sizeToFit");
  -[UILabel sizeToFit](self->_animatableDateLabel, "sizeToFit");

}

- (void)setAvatarContact:(id)a3
{
  id v4;
  EKUILabeledAvatarView *avatarView;
  EKUILabeledAvatarView *v6;
  EKUILabeledAvatarView *v7;
  id v8;
  id v9;

  v4 = a3;
  avatarView = self->_avatarView;
  v9 = v4;
  if (!avatarView)
  {
    v6 = (EKUILabeledAvatarView *)objc_msgSend(objc_alloc((Class)EKUILabeledAvatarView), "initWithPlacement:options:", 0, 0);
    v7 = self->_avatarView;
    self->_avatarView = v6;

    v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "avatarTapped");
    -[EKUILabeledAvatarView addGestureRecognizer:](self->_avatarView, "addGestureRecognizer:", v8);
    -[PaletteView addSubview:](self, "addSubview:", self->_avatarView);

    v4 = v9;
    avatarView = self->_avatarView;
  }
  -[EKUILabeledAvatarView setContact:](avatarView, "setContact:", v4);

}

- (UIView)avatarView
{
  return (UIView *)self->_avatarView;
}

- (void)todayTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PaletteView delegate](self, "delegate"));
  objc_msgSend(v3, "paletteTodayButtonTapped:", self);

}

- (void)avatarTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PaletteView delegate](self, "delegate"));
  objc_msgSend(v3, "paletteAvatarViewTapped:", self);

}

- (void)_localeChanged:(id)a3
{
  WeekDayInitialsHeaderView *dayInitialsHeaderView;

  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  if (self->_weekdayHeaderVisible)
  {
    -[WeekDayInitialsHeaderView setNeedsDisplay](self->_dayInitialsHeaderView, "setNeedsDisplay", a3);
  }
  else
  {
    self->_dayInitialsHeaderView = 0;

  }
}

- (void)_contentSizeCategoryChanged
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView todayButtonFont](self, "todayButtonFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_todayButton, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  -[UIButton sizeToFit](self->_todayButton, "sizeToFit");
}

- (id)todayButtonFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EKUIConstrainedFontUtilities constrainedFontForTextStyle:minimumContentSizeCategory:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:minimumContentSizeCategory:maximumContentSizeCategory:traitCollection:", UIFontTextStyleSubheadline, UIContentSizeCategoryLarge, UIContentSizeCategoryExtraExtraExtraLarge, v2));

  return v3;
}

- (BOOL)useCustomDayFrames
{
  return self->_useCustomDayFrames;
}

- (BOOL)todayButtonVisible
{
  return self->_todayButtonVisible;
}

- (BOOL)dateStringVisible
{
  return self->_dateStringVisible;
}

- (BOOL)dividerLineVisible
{
  return self->_dividerLineVisible;
}

- (BOOL)opaqueBackground
{
  return self->_opaqueBackground;
}

- (void)setOpaqueBackground:(BOOL)a3
{
  self->_opaqueBackground = a3;
}

- (BOOL)shouldHideInlineFocusBanner
{
  return self->_shouldHideInlineFocusBanner;
}

- (NSAttributedString)dateString
{
  return self->_dateString;
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (BOOL)suppressLayout
{
  return self->_suppressLayout;
}

- (void)setSuppressLayout:(BOOL)a3
{
  self->_suppressLayout = a3;
}

- (_UINavigationBarPalette)containingPalette
{
  return (_UINavigationBarPalette *)objc_loadWeakRetained((id *)&self->_containingPalette);
}

- (WeekDayInitialsHeaderView)dayInitialsHeaderView
{
  return self->_dayInitialsHeaderView;
}

- (void)setDayInitialsHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_dayInitialsHeaderView, a3);
}

- (UILabel)animatableDateLabel
{
  return self->_animatableDateLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayInitialsHeaderView, 0);
  objc_destroyWeak((id *)&self->_containingPalette);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_dayScrubberController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusFilterBanner, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_todayButton, 0);
  objc_storeStrong((id *)&self->_animatableDateLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
