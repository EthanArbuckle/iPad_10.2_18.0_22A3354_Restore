@implementation MTAAnalogStopwatchView

- (MTAAnalogStopwatchView)initWithFrame:(CGRect)a3
{
  MTAAnalogStopwatchView *v3;
  MTAAnalogStopwatchView *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MTAAnalogStopwatchHandView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MTAAnalogStopwatchHandView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MTAAnalogStopwatchHandView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSNumberFormatter *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)MTAAnalogStopwatchView;
  v3 = -[MTAAnalogStopwatchView initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTAAnalogStopwatchView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = objc_alloc((Class)MTUITimeView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAAnalogStopwatchView setTimeView:](v4, "setTimeView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](v4, "timeView"));
    objc_msgSend(v11, "setTextColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](v4, "timeView"));
    objc_msgSend(v12, "setTextAlignment:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](v4, "timeView"));
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](v4, "timeView"));
    objc_msgSend(v14, "setTime:", 0.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](v4, "timeView"));
    -[MTAAnalogStopwatchView addSubview:](v4, "addSubview:", v15);

    v16 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAAnalogStopwatchView setMinutesHand:](v4, "setMinutesHand:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](v4, "minutesHand"));
    objc_msgSend(v18, "setColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](v4, "minutesHand"));
    objc_msgSend(v19, "setAnchorStyle:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](v4, "minutesHand"));
    -[MTAAnalogStopwatchView addSubview:](v4, "addSubview:", v20);

    v21 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAAnalogStopwatchView setLapSecondsHand:](v4, "setLapSecondsHand:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](v4, "lapSecondsHand"));
    objc_msgSend(v23, "setColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](v4, "lapSecondsHand"));
    objc_msgSend(v24, "setHasTail:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](v4, "lapSecondsHand"));
    -[MTAAnalogStopwatchView addSubview:](v4, "addSubview:", v25);

    v26 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAAnalogStopwatchView setSecondsHand:](v4, "setSecondsHand:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](v4, "secondsHand"));
    objc_msgSend(v28, "setColor:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](v4, "secondsHand"));
    objc_msgSend(v29, "setHasTail:", 1);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](v4, "secondsHand"));
    objc_msgSend(v30, "setAnchorStyle:", 2);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](v4, "secondsHand"));
    -[MTAAnalogStopwatchView addSubview:](v4, "addSubview:", v31);

    v32 = objc_opt_new(NSNumberFormatter);
    -[MTAAnalogStopwatchView setNumberFormatter:](v4, "setNumberFormatter:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView numberFormatter](v4, "numberFormatter"));
    objc_msgSend(v33, "setNumberStyle:", 1);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView numberFormatter](v4, "numberFormatter"));
    objc_msgSend(v35, "setLocale:", v34);

  }
  return v4;
}

- (void)setElapsedTime:(double)a3
{
  double v4;
  long double v5;
  void *v6;
  long double v7;
  long double v8;
  id v9;

  self->_elapsedTime = a3;
  -[MTAAnalogStopwatchView elapsedTime](self, "elapsedTime");
  v5 = fmod(v4 / 60.0, 30.0) * 0.20943951;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](self, "minutesHand"));
  objc_msgSend(v6, "setAngle:", (double)v5);

  -[MTAAnalogStopwatchView elapsedTime](self, "elapsedTime");
  v8 = fmod(v7, 60.0) * 0.104719755;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](self, "secondsHand"));
  objc_msgSend(v9, "setAngle:", (double)v8);

}

- (void)setDisplayAdjustedElapsedTime:(double)a3
{
  id v4;

  self->_displayAdjustedElapsedTime = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v4, "setTime:", a3);

}

- (void)setCurrentLapTime:(double)a3
{
  long double v4;
  long double v5;
  id v6;

  self->_currentLapTime = a3;
  -[MTAAnalogStopwatchView currentLapTime](self, "currentLapTime");
  v5 = fmod(v4, 60.0) * 0.104719755;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](self, "lapSecondsHand"));
  objc_msgSend(v6, "setAngle:", (double)v5);

}

- (void)handleLocaleChange
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v3, "handleLocaleChange");

  -[MTAAnalogStopwatchView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  void *v50;
  CGFloat Height;
  double v52;
  void *v53;
  double v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v55.receiver = self;
  v55.super_class = (Class)MTAAnalogStopwatchView;
  -[MTAAnalogStopwatchView layoutSubviews](&v55, "layoutSubviews");
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v54 = 0.0;
  v3 = CGRectGetHeight(v56) / 311.0;
  -[MTAAnalogStopwatchView _minutesCircleCenter:](self, "_minutesCircleCenter:", &v54);
  v5 = v4;
  v7 = v6;
  v8 = UIRoundToViewScale(v3 + v3);
  v9 = v5 - v54;
  v10 = v7 - v54;
  v11 = v54 + v54;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](self, "minutesHand"));
  objc_msgSend(v12, "setFrame:", v9, v10, v11, v11);

  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](self, "secondsHand"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](self, "lapSecondsHand"));
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView minutesHand](self, "minutesHand"));
  objc_msgSend(v31, "setWidth:", v8);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView secondsHand](self, "secondsHand"));
  objc_msgSend(v32, "setWidth:", v8);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView lapSecondsHand](self, "lapSecondsHand"));
  objc_msgSend(v33, "setWidth:", v8);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v3 * 20.0, UIFontWeightRegular));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mtui_fontByAddingTimeFontAttributes"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v36, "setTime:", 359999.0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v37, "setFont:", v35);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v38, "sizeToFit");

  -[MTAAnalogStopwatchView elapsedTime](self, "elapsedTime");
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v41, "setTime:", v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v42, "frame");
  v44 = v43;
  v46 = v45;
  v48 = v47;

  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v49 = CGRectGetMidX(v57) + v46 * -0.5;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v50, "setFrame:", v49, v44, v46, v48);

  -[MTAAnalogStopwatchView bounds](self, "bounds");
  Height = CGRectGetHeight(v58);
  v52 = UIRoundToViewScale(Height * 0.72);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView timeView](self, "timeView"));
  objc_msgSend(v53, "_setFirstLineBaselineFrameOriginY:", v52);

  -[MTAAnalogStopwatchView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGPoint)_minutesCircleCenter:(double *)a3
{
  CGFloat v5;
  double v6;
  CGFloat MidX;
  CGFloat MidY;
  double v9;
  double v10;
  CGPoint result;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v5 = CGRectGetWidth(v12) * 0.5;
  v6 = UIRoundToViewScale(v5 * 0.56 * 0.5);
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  MidX = CGRectGetMidX(v13);
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  MidY = CGRectGetMidY(v14);
  v9 = UIRoundToViewScale(MidY + v5 * -0.36);
  if (a3)
    *a3 = v6;
  v10 = MidX;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGFloat MidX;
  CGFloat MidY;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  double v19;
  UIBezierPath *v20;
  double v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  double v46;
  double v47;
  UIBezierPath *v48;
  double v49;
  double v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  CGContext *c;
  CGAffineTransform v67;
  CGAffineTransform v68;
  double v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  CGRect v77;
  CGRect v78;
  CGRect v79;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  MidX = CGRectGetMidX(v77);
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  MidY = CGRectGetMidY(v78);
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v8 = v7;
  -[MTAAnalogStopwatchView bounds](self, "bounds");
  v9 = CGRectGetHeight(v79) / 311.0;
  CGContextSaveGState(CurrentContext);
  c = CurrentContext;
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  v10 = v8 * -0.5;
  CGAffineTransformMakeRotation(&v72, 0.0261799388);
  v11 = v72.ty + v10 * v72.d + v72.b * 0.0 - v10;
  v12 = sqrt((v72.tx + v10 * v72.c + v72.a * 0.0) * (v72.tx + v10 * v72.c + v72.a * 0.0) + v11 * v11) * 0.5;
  v75[0] = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v9 * 26.0));
  v76[0] = v13;
  v75[1] = NSForegroundColorAttributeName;
  v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV015ForegroundColorB0OAA19AttributedStringKeyADMc_ptr;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v76[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v76, v75, 2));

  v17 = 1;
  v18 = 7.0;
  v19 = 13.0;
  do
  {
    v20 = objc_opt_new(UIBezierPath);
    -[UIBezierPath moveToPoint:](v20, "moveToPoint:", 0.0, v10);
    if ((v17 & 3) != 0)
      v21 = v18;
    else
      v21 = v19;
    v22 = v10 + v9 * v21;
    -[UIBezierPath addLineToPoint:](v20, "addLineToPoint:", 0.0, v22);
    CGAffineTransformMakeRotation(&v71, (double)v17 * 0.0261799388);
    -[UIBezierPath applyTransform:](v20, "applyTransform:", &v71);
    -[UIBezierPath setLineWidth:](v20, "setLineWidth:", v12);
    HIDWORD(v23) = -858993459 * v17;
    LODWORD(v23) = HIDWORD(v23);
    if ((v23 >> 2) < 0xCCCCCCD)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_stopwatchMajorTickMarkColor](UIColor, "mtui_stopwatchMajorTickMarkColor"));
      objc_msgSend(v24, "setStroke");
      -[UIBezierPath stroke](v20, "stroke");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView numberFormatter](self, "numberFormatter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17 >> 2));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringFromNumber:", v26));

      v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV015ForegroundColorB0OAA19AttributedStringKeyADMc_ptr;
      objc_msgSend(v27, "sizeWithAttributes:", v16);
      v29 = v28;
      v30 = v22 + 5.0;
      v32 = v31 * 0.5;
      v33 = v30 + v31 * 0.5;
      CGAffineTransformMakeRotation(&v70, (double)v17 * 0.0261799388);
      v34 = v70.tx + v33 * v70.c + v70.a * 0.0;
      v35 = v33 * v70.d;
      v19 = 13.0;
      v36 = v29 * 0.5;
      v18 = 7.0;
      objc_msgSend(v27, "drawAtPoint:withAttributes:", v16, v34 - v36, v70.ty + v35 + v70.b * 0.0 - v32);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_stopwatchMinorTickMarkColor](UIColor, "mtui_stopwatchMinorTickMarkColor"));
      objc_msgSend(v24, "setStroke");
      -[UIBezierPath stroke](v20, "stroke");
    }

    ++v17;
  }
  while (v17 != 241);

  CGContextRestoreGState(c);
  v69 = 0.0;
  -[MTAAnalogStopwatchView _minutesCircleCenter:](self, "_minutesCircleCenter:", &v69);
  v38 = v37;
  v40 = v39;
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, v38, v40);
  v41 = UICeilToViewScale(self, v9);
  v73[0] = NSFontAttributeName;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v9 * 14.0));
  v73[1] = NSForegroundColorAttributeName;
  v74[0] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v74[1] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 2));

  v45 = 1;
  v46 = 5.0;
  v47 = 8.0;
  do
  {
    v48 = objc_opt_new(UIBezierPath);
    -[UIBezierPath moveToPoint:](v48, "moveToPoint:", 0.0, -v69);
    if ((v45 & 1) != 0)
      v49 = v46;
    else
      v49 = v47;
    v50 = v9 * v49;
    -[UIBezierPath addLineToPoint:](v48, "addLineToPoint:", 0.0, v9 * v49 - v69);
    CGAffineTransformMakeRotation(&v68, (double)v45 * 0.104719755);
    -[UIBezierPath applyTransform:](v48, "applyTransform:", &v68);
    -[UIBezierPath setLineWidth:](v48, "setLineWidth:", v41);
    v51 = v14[345];
    HIDWORD(v52) = -858993459 * v45;
    LODWORD(v52) = HIDWORD(v52);
    if ((v52 >> 1) < 0x1999999A)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "mtui_stopwatchMajorTickMarkColor"));
      objc_msgSend(v53, "setStroke");
      -[UIBezierPath stroke](v48, "stroke");
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchView numberFormatter](self, "numberFormatter"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v45 >> 1));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringFromNumber:", v55));

      v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV015ForegroundColorB0OAA19AttributedStringKeyADMc_ptr;
      objc_msgSend(v56, "sizeWithAttributes:", v44);
      v58 = v57;
      v59 = v50 - v69 + 3.0;
      v61 = v60 * 0.5;
      v62 = v60 * 0.5 + v59;
      CGAffineTransformMakeRotation(&v67, (double)v45 * 0.104719755);
      v63 = v67.tx + v62 * v67.c + v67.a * 0.0;
      v64 = v62 * v67.d;
      v47 = 8.0;
      v65 = v58 * 0.5;
      v46 = 5.0;
      objc_msgSend(v56, "drawAtPoint:withAttributes:", v44, v63 - v65, v67.ty + v64 + v67.b * 0.0 - v61);

    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "mtui_stopwatchMinorTickMarkColor"));
      objc_msgSend(v53, "setStroke");
      -[UIBezierPath stroke](v48, "stroke");
    }

    ++v45;
  }
  while (v45 != 61);

  CGContextRestoreGState(c);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)displayAdjustedElapsedTime
{
  return self->_displayAdjustedElapsedTime;
}

- (double)currentLapTime
{
  return self->_currentLapTime;
}

- (MTAAnalogStopwatchHandView)minutesHand
{
  return self->_minutesHand;
}

- (void)setMinutesHand:(id)a3
{
  objc_storeStrong((id *)&self->_minutesHand, a3);
}

- (MTAAnalogStopwatchHandView)secondsHand
{
  return self->_secondsHand;
}

- (void)setSecondsHand:(id)a3
{
  objc_storeStrong((id *)&self->_secondsHand, a3);
}

- (MTAAnalogStopwatchHandView)lapSecondsHand
{
  return self->_lapSecondsHand;
}

- (void)setLapSecondsHand:(id)a3
{
  objc_storeStrong((id *)&self->_lapSecondsHand, a3);
}

- (MTUITimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_lapSecondsHand, 0);
  objc_storeStrong((id *)&self->_secondsHand, 0);
  objc_storeStrong((id *)&self->_minutesHand, 0);
}

@end
