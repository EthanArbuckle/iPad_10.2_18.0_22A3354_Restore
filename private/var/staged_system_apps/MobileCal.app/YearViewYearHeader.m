@implementation YearViewYearHeader

- (YearViewYearHeader)initWithCalendarDate:(id)a3
{
  id v6;
  YearViewYearHeader *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  uint64_t v18;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)YearViewYearHeader;
  v7 = -[YearViewYearHeader init](&v17, "init");
  if (v7)
  {
    if (!v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("YearViewYearHeader.m"), 39, CFSTR("'calendarDate' must not be nil"));

    }
    objc_storeStrong((id *)&v7->_calendarDate, a3);
    v8 = objc_msgSend((id)objc_opt_class(v7), "_headerBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[YearViewYearHeader setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[YearViewYearHeader _reloadYearNumberLabel](v7, "_reloadYearNumberLabel");
    -[YearViewYearHeader _initializeThinLine](v7, "_initializeThinLine");
    -[YearViewYearHeader _updateOverlayLegend](v7, "_updateOverlayLegend");
    objc_initWeak(&location, v7);
    v18 = objc_opt_class(UITraitUserInterfaceStyle);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100070B14;
    v14[3] = &unk_1001B2418;
    objc_copyWeak(&v15, &location);
    v11 = -[YearViewYearHeader registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v10, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_opt_class(self);
  objc_msgSend(v5, "heightForWindowSize:", EKUICurrentWindowSize(self));
  v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader window](self, "window"));

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)YearViewYearHeader;
    -[YearViewYearHeader layoutSubviews](&v4, "layoutSubviews");
    -[YearViewYearHeader _layoutYearNumber](self, "_layoutYearNumber");
    -[YearViewYearHeader _layoutThinLine](self, "_layoutThinLine");
    -[YearViewYearHeader _layoutOverlayLegend](self, "_layoutOverlayLegend");
  }
  else
  {
    self->_layoutWhenJoiningViewHierarchy = 1;
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4;

  if (a3)
  {
    if (self->_layoutWhenJoiningViewHierarchy)
    {
      v4 = a3;
      EKUIPushFallbackSizingContextWithViewHierarchy(v4);
      -[YearViewYearHeader layoutSubviews](self, "layoutSubviews");
      EKUIPopFallbackSizingContextWithViewHierarchy(v4);

      self->_layoutWhenJoiningViewHierarchy = 0;
    }
  }
}

+ (double)heightForWindowSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;

  height = a3.height;
  width = a3.width;
  objc_opt_class(a1);
  objc_msgSend(v6, "headerYInsetForWindowSize:", width, height);
  v8 = v7;
  objc_opt_class(a1);
  objc_msgSend(v9, "middleHeightForWindowSize:", width, height);
  v11 = v10;
  objc_opt_class(a1);
  objc_msgSend(v12, "headerDaySpacingForWindowSize:", width, height);
  return v8 + v11 + v13;
}

- (void)setCalendarDate:(id)a3
{
  EKCalendarDate *v5;
  EKCalendarDate *v6;

  v5 = (EKCalendarDate *)a3;
  if (self->_calendarDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_calendarDate, a3);
    -[YearViewYearHeader _reloadYearNumberLabel](self, "_reloadYearNumberLabel");
    -[YearViewYearHeader _updateOverlayLegend](self, "_updateOverlayLegend");
    v5 = v6;
  }

}

- (void)localeChanged
{
  -[YearViewYearHeader _reloadYearNumberLabel](self, "_reloadYearNumberLabel");
  -[YearViewYearHeader _updateOverlayLegend](self, "_updateOverlayLegend");
}

+ (id)_headerBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (id)_thinLineColor
{
  if (qword_1001F6210 != -1)
    dispatch_once(&qword_1001F6210, &stru_1001B3648);
  return (id)qword_1001F6208;
}

- (void)_initializeThinLine
{
  NSObject *v2;
  UIView *v4;
  UIView *thinLine;
  void *v6;
  uint8_t v7[16];

  if (self->_thinLine)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "The thin line already been initialized.", v7, 2u);
    }
  }
  else
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    thinLine = self->_thinLine;
    self->_thinLine = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader _thinLineColor](self, "_thinLineColor"));
    -[UIView setBackgroundColor:](self->_thinLine, "setBackgroundColor:", v6);

    -[YearViewYearHeader addSubview:](self, "addSubview:", self->_thinLine);
  }
}

- (void)_reloadYearNumberLabel
{
  UILabel *v3;
  UILabel *yearNumber;
  double v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t IsThisYear;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  CGRect v32;
  CGRect v33;

  if (!self->_yearNumber)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    yearNumber = self->_yearNumber;
    self->_yearNumber = v3;

    *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_headerBackgroundColor", v5));
    -[UILabel setBackgroundColor:](self->_yearNumber, "setBackgroundColor:", v7);

    -[YearViewYearHeader addSubview:](self, "addSubview:", self->_yearNumber);
  }
  v8 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v8, "setAlignment:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](self, "calendarDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
  IsThisYear = CUIKNSDateIsThisYear();
  if ((IsThisYear & 1) != 0)
  {
    v13 = CalendarAppTintColor(IsThisYear, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v15 = (void *)v14;

  v30[0] = NSFontAttributeName;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader yearNumberFont](self, "yearNumberFont"));
  v31[0] = v16;
  v31[1] = v8;
  v30[1] = NSParagraphStyleAttributeName;
  v30[2] = NSForegroundColorAttributeName;
  v31[2] = v15;
  v30[3] = NSKernAttributeName;
  -[YearViewYearHeader yearNumberKerning](self, "yearNumberKerning");
  *(float *)&v17 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  v31[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 4));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader _yearString](self, "_yearString"));
  v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v20, v19);
  -[UILabel setAttributedText:](self->_yearNumber, "setAttributedText:", v21);
  -[UILabel sizeToFit](self->_yearNumber, "sizeToFit");
  -[UILabel frame](self->_yearNumber, "frame");
  v23 = v22;
  v25 = v24;
  -[UILabel bounds](self->_yearNumber, "bounds");
  v26 = CGRectGetWidth(v32) + 10.0;
  -[UILabel bounds](self->_yearNumber, "bounds");
  -[UILabel setFrame:](self->_yearNumber, "setFrame:", v23, v25, v26, CGRectGetHeight(v33));
  *(_QWORD *)&v27 = objc_opt_class(self).n128_u64[0];
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_headerBackgroundColor", v27));
  -[UILabel setBackgroundColor:](self->_yearNumber, "setBackgroundColor:", v29);

  -[YearViewYearHeader setNeedsLayout](self, "setNeedsLayout");
  -[YearViewYearHeader setNeedsDisplay](self, "setNeedsDisplay");

}

- (id)_yearString
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarIdentifier"));
  v5 = objc_msgSend(NSCalendarIdentifierJapanese, "isEqualToString:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](self, "calendarDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    v8 = objc_msgSend(v3, "component:fromDate:", 2, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](self, "calendarDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForEndOfYear"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
    v12 = objc_msgSend(v3, "component:fromDate:", 2, v11);

    if (v8 != v12)
    {
      self->_showingMultiEraYear = 1;
      *(_QWORD *)&v16 = objc_opt_class(self).n128_u64[0];
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v17, v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ / %@"), &stru_1001B67C0, 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](self, "calendarDate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "date"));
      v21 = CUIKStringForYear();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      v24 = CUIKStringForYear();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v22, v25));

      goto LABEL_6;
    }

  }
  self->_showingMultiEraYear = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](self, "calendarDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
  v14 = CUIKStringForYear();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
LABEL_6:

  return v15;
}

- (void)_updateOverlayLegend
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  UIView *v8;
  UIView *overlayLegendYearStartLine;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  UIView *v14;
  UIView *overlayLegendMonthStartLine;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  UILabel *v20;
  UILabel *overlayLegendYearStartLabel;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *overlayLegendMonthStartLabel;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4 != 0;

  if (self->_showingOverlayLegend == v5)
  {
    if (!v4)
      goto LABEL_12;
  }
  else
  {
    self->_showingOverlayLegend = v5;
    if (!v4)
    {
      -[YearViewYearHeader _removeOverlayLegend](self, "_removeOverlayLegend");
      goto LABEL_12;
    }
    v8 = objc_opt_new(UIView);
    overlayLegendYearStartLine = self->_overlayLegendYearStartLine;
    self->_overlayLegendYearStartLine = v8;

    v12 = CalendarAppTintColor(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[UIView setBackgroundColor:](self->_overlayLegendYearStartLine, "setBackgroundColor:", v13);

    -[YearViewYearHeader addSubview:](self, "addSubview:", self->_overlayLegendYearStartLine);
    v14 = objc_opt_new(UIView);
    overlayLegendMonthStartLine = self->_overlayLegendMonthStartLine;
    self->_overlayLegendMonthStartLine = v14;

    v18 = CalendarAppTintColor(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[UIView setBackgroundColor:](self->_overlayLegendMonthStartLine, "setBackgroundColor:", v19);

    -[YearViewYearHeader addSubview:](self, "addSubview:", self->_overlayLegendMonthStartLine);
    v20 = objc_opt_new(UILabel);
    overlayLegendYearStartLabel = self->_overlayLegendYearStartLabel;
    self->_overlayLegendYearStartLabel = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UILabel setTextColor:](self->_overlayLegendYearStartLabel, "setTextColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader overlayLegendFont](self, "overlayLegendFont"));
    -[UILabel setFont:](self->_overlayLegendYearStartLabel, "setFont:", v23);

    -[YearViewYearHeader addSubview:](self, "addSubview:", self->_overlayLegendYearStartLabel);
    v24 = objc_opt_new(UILabel);
    overlayLegendMonthStartLabel = self->_overlayLegendMonthStartLabel;
    self->_overlayLegendMonthStartLabel = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UILabel setTextColor:](self->_overlayLegendMonthStartLabel, "setTextColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader overlayLegendFont](self, "overlayLegendFont"));
    -[UILabel setFont:](self->_overlayLegendMonthStartLabel, "setFont:", v27);

    v6 = -[YearViewYearHeader addSubview:](self, "addSubview:", self->_overlayLegendMonthStartLabel);
  }
  v28 = CUIKGetOverlayCalendar(v6, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_calendarDate, "date"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "components:fromDate:", 24, v30));
  if (objc_msgSend(v31, "day") != (id)1
    || objc_msgSend(v31, "month") != (id)1
    || objc_msgSend(v31, "isLeapMonth"))
  {
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dateByAddingUnit:value:toDate:options:", 4, 1, v30, 1024));

    v30 = (void *)v32;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayYearStringForDate:inCalendar:](CUIKDateStrings, "overlayYearStringForDate:inCalendar:", v30, v29));
  -[UILabel setText:](self->_overlayLegendYearStartLabel, "setText:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:](CUIKDateStrings, "overlayFirstDayOfLunarMonthLocalizedStringInCalendar:", v29));
  -[UILabel setText:](self->_overlayLegendMonthStartLabel, "setText:", v34);

LABEL_12:
  -[YearViewYearHeader setNeedsLayout](self, "setNeedsLayout");
}

- (void)_removeOverlayLegend
{
  UIView *overlayLegendYearStartLine;
  UIView *overlayLegendMonthStartLine;
  UILabel *overlayLegendYearStartLabel;
  UILabel *overlayLegendMonthStartLabel;

  -[UIView removeFromSuperview](self->_overlayLegendYearStartLine, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_overlayLegendMonthStartLine, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_overlayLegendYearStartLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_overlayLegendMonthStartLabel, "removeFromSuperview");
  overlayLegendYearStartLine = self->_overlayLegendYearStartLine;
  self->_overlayLegendYearStartLine = 0;

  overlayLegendMonthStartLine = self->_overlayLegendMonthStartLine;
  self->_overlayLegendMonthStartLine = 0;

  overlayLegendYearStartLabel = self->_overlayLegendYearStartLabel;
  self->_overlayLegendYearStartLabel = 0;

  overlayLegendMonthStartLabel = self->_overlayLegendMonthStartLabel;
  self->_overlayLegendMonthStartLabel = 0;

}

- (void)_layoutThinLine
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double MaxY;
  double v14;
  CGRect v15;

  v3 = -[YearViewYearHeader bounds](self, "bounds");
  v5 = v4;
  v7 = CalRoundToScreenScale(v3, v6, 1.5);
  v9 = CalOnePixelInPoints(v8);
  v12 = CalRoundToScreenScale(v10, v11, v9);
  -[UILabel frame](self->_yearNumber, "frame");
  MaxY = CGRectGetMaxY(v15);
  -[YearViewYearHeader heightBetweenLineAndNumber](self, "heightBetweenLineAndNumber");
  -[UIView setFrame:](self->_thinLine, "setFrame:", v7, MaxY + v14, v5 - v7, v12);
}

- (void)_layoutYearNumber
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxX;
  id v14;
  double v15;
  CGRect v16;
  CGRect v17;

  v3 = -[UILabel frame](self->_yearNumber, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = 0.0;
  if ((CalInterfaceIsLeftToRight(v3) & 1) == 0)
  {
    -[YearViewYearHeader bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    v12 = MaxX - CGRectGetWidth(v17);
  }
  objc_opt_class(self);
  objc_msgSend(v14, "headerYInsetForWindowSize:", EKUICurrentWindowSize(self));
  -[UILabel setFrame:](self->_yearNumber, "setFrame:", v12, v15, v9, v11);
}

- (void)_layoutOverlayLegend
{
  id v3;
  double v4;
  double v5;
  int IsLeftToRight;
  uint64_t v7;
  double MaxX;
  double v12;
  double v13;
  double Width;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double MinX;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double MidY;
  id v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  id v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat x;
  CGFloat y;
  CGFloat v74;
  CGFloat height;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
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

  if (self->_showingOverlayLegend)
  {
    -[UILabel sizeToFit](self->_overlayLegendYearStartLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_overlayLegendMonthStartLabel, "sizeToFit");
    v3 = -[YearViewYearHeader overlayLegendLineLength](self, "overlayLegendLineLength");
    v5 = v4;
    IsLeftToRight = CalInterfaceIsLeftToRight(v3);
    -[YearViewYearHeader bounds](self, "bounds");
    v98 = v5;
    if (IsLeftToRight)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v7);
      -[YearViewYearHeader overlayLegendRightInset](self, "overlayLegendRightInset");
      v13 = MaxX - v12;
      -[UILabel frame](self->_overlayLegendYearStartLabel, "frame");
      Width = CGRectGetWidth(v99);
      -[UILabel frame](self->_overlayLegendMonthStartLabel, "frame");
      v15 = v13 - fmax(Width, CGRectGetWidth(v100));
      -[YearViewYearHeader overlayLegendSpacing](self, "overlayLegendSpacing");
      v96 = v15 - v16 - v5;
      v17 = v15;
      -[UIView frame](self->_thinLine, "frame", *(_QWORD *)&v96);
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v7);
      -[YearViewYearHeader overlayLegendSpacing](self, "overlayLegendSpacing");
      v24 = MinX + v23;
      -[UILabel frame](self->_overlayLegendYearStartLabel, "frame");
      v25 = CGRectGetWidth(v101);
      -[UILabel frame](self->_overlayLegendMonthStartLabel, "frame");
      v26 = v24 + fmax(v25, CGRectGetWidth(v102));
      -[YearViewYearHeader overlayLegendSpacing](self, "overlayLegendSpacing");
      v28 = v26 - v27;
      -[UILabel frame](self->_overlayLegendYearStartLabel, "frame");
      v17 = v28 - CGRectGetWidth(v103);
      -[YearViewYearHeader overlayLegendSpacing](self, "overlayLegendSpacing");
      v30 = v26 - v29;
      -[UILabel frame](self->_overlayLegendMonthStartLabel, "frame");
      v15 = v30 - CGRectGetWidth(v104);
      -[UIView frame](self->_thinLine, "frame", *(_QWORD *)&v26);
    }
    MinY = CGRectGetMinY(*(CGRect *)&v18);
    -[UILabel frame](self->_overlayLegendYearStartLabel, "frame");
    v33 = v32;
    v35 = v34;
    -[YearViewYearHeader overlayLegendYearBaseline](self, "overlayLegendYearBaseline");
    v37 = MinY - v36;
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_overlayLegendYearStartLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v39 = v37 - v38;
    -[UILabel setFrame:](self->_overlayLegendYearStartLabel, "setFrame:", v17, v37 - v38, v33, v35);
    -[UILabel frame](self->_overlayLegendMonthStartLabel, "frame");
    v41 = v40;
    v43 = v42;
    -[YearViewYearHeader overlayLegendMonthBaseline](self, "overlayLegendMonthBaseline");
    v45 = MinY - v44;
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_overlayLegendMonthStartLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v47 = v45 - v46;
    -[UILabel setFrame:](self->_overlayLegendMonthStartLabel, "setFrame:", v15, v47, v41, v43);
    v105.origin.x = v17;
    v105.origin.y = v39;
    v105.size.width = v33;
    v105.size.height = v35;
    MidY = CGRectGetMidY(v105);
    v49 = -[YearViewYearHeader overlayLegendYearLineThickness](self, "overlayLegendYearLineThickness");
    v52 = CalRoundToScreenScale(v49, v51, MidY - v50 * 0.5);
    -[YearViewYearHeader overlayLegendYearLineThickness](self, "overlayLegendYearLineThickness");
    -[UIView setFrame:](self->_overlayLegendYearStartLine, "setFrame:", v97, v52, v98, v53);
    v106.origin.x = v15;
    v106.origin.y = v47;
    v106.size.width = v41;
    v106.size.height = v43;
    v54 = CGRectGetMidY(v106);
    v55 = -[YearViewYearHeader overlayLegendMonthLineThickness](self, "overlayLegendMonthLineThickness");
    v58 = CalRoundToScreenScale(v55, v57, v54 - v56 * 0.5);
    -[YearViewYearHeader overlayLegendMonthLineThickness](self, "overlayLegendMonthLineThickness");
    -[UIView setFrame:](self->_overlayLegendMonthStartLine, "setFrame:", v97, v58, v98, v59);
    if (self->_showingMultiEraYear)
    {
      -[UILabel frame](self->_overlayLegendYearStartLabel, "frame");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      -[UIView frame](self->_overlayLegendYearStartLine, "frame");
      v114.origin.x = v68;
      v114.origin.y = v69;
      v114.size.width = v70;
      v114.size.height = v71;
      v107.origin.x = v61;
      v107.origin.y = v63;
      v107.size.width = v65;
      v107.size.height = v67;
      v108 = CGRectUnion(v107, v114);
      x = v108.origin.x;
      y = v108.origin.y;
      v74 = v108.size.width;
      height = v108.size.height;
      -[UIView frame](self->_overlayLegendMonthStartLine, "frame");
      v115.origin.x = v76;
      v115.origin.y = v77;
      v115.size.width = v78;
      v115.size.height = v79;
      v109.origin.x = x;
      v109.origin.y = y;
      v109.size.width = v74;
      v109.size.height = height;
      v110 = CGRectUnion(v109, v115);
      v80 = v110.origin.x;
      v81 = v110.origin.y;
      v82 = v110.size.width;
      v83 = v110.size.height;
      -[UILabel frame](self->_overlayLegendMonthStartLabel, "frame");
      v116.origin.x = v84;
      v116.origin.y = v85;
      v116.size.width = v86;
      v116.size.height = v87;
      v111.origin.x = v80;
      v111.origin.y = v81;
      v111.size.width = v82;
      v111.size.height = v83;
      v112 = CGRectUnion(v111, v116);
      v88 = v112.origin.x;
      v89 = v112.origin.y;
      v90 = v112.size.width;
      v91 = v112.size.height;
      -[UILabel frame](self->_yearNumber, "frame");
      v117.origin.x = v92;
      v117.origin.y = v93;
      v117.size.width = v94;
      v117.size.height = v95;
      v113.origin.x = v88;
      v113.origin.y = v89;
      v113.size.width = v90;
      v113.size.height = v91;
      if (CGRectIntersectsRect(v113, v117))
      {
        -[YearViewYearHeader _removeOverlayLegend](self, "_removeOverlayLegend");
        self->_showingOverlayLegend = 0;
      }
    }
  }
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (UIFont)yearNumberFont
{
  return self->_yearNumberFont;
}

- (double)yearNumberKerning
{
  return self->_yearNumberKerning;
}

- (UIFont)overlayLegendFont
{
  return self->_overlayLegendFont;
}

- (double)overlayLegendRightInset
{
  return self->_overlayLegendRightInset;
}

- (double)overlayLegendYearBaseline
{
  return self->_overlayLegendYearBaseline;
}

- (double)overlayLegendMonthBaseline
{
  return self->_overlayLegendMonthBaseline;
}

- (double)overlayLegendSpacing
{
  return self->_overlayLegendSpacing;
}

- (double)overlayLegendLineLength
{
  return self->_overlayLegendLineLength;
}

- (double)overlayLegendYearLineThickness
{
  return self->_overlayLegendYearLineThickness;
}

- (double)overlayLegendMonthLineThickness
{
  return self->_overlayLegendMonthLineThickness;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayLegendFont, 0);
  objc_storeStrong((id *)&self->_yearNumberFont, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_overlayLegendMonthStartLabel, 0);
  objc_storeStrong((id *)&self->_overlayLegendYearStartLabel, 0);
  objc_storeStrong((id *)&self->_overlayLegendMonthStartLine, 0);
  objc_storeStrong((id *)&self->_overlayLegendYearStartLine, 0);
  objc_storeStrong((id *)&self->_thinLine, 0);
  objc_storeStrong((id *)&self->_yearNumber, 0);
}

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  uint64_t v3;
  double result;

  v3 = sub_10002E49C((uint64_t)a1);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  uint64_t v3;
  double result;

  v3 = sub_10002E49C((uint64_t)a1);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  uint64_t v3;
  double result;

  v3 = sub_10002E49C((uint64_t)a1);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (double)yearNumberHeaderFontSize
{
  uint64_t v2;
  double result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (double)heightBetweenLineAndNumber
{
  uint64_t v2;
  double result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

@end
