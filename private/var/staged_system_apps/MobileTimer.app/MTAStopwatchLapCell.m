@implementation MTAStopwatchLapCell

+ (BOOL)na_supportsAutoLayout
{
  return 1;
}

- (MTAStopwatchLapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTAStopwatchLapCell *v4;
  MTAStopwatchLapCell *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  MTAStopwatchLapCell *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)MTAStopwatchLapCell;
  v4 = -[MTAStopwatchLapCell initWithStyle:reuseIdentifier:](&v37, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTAStopwatchLapCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTAStopwatchLapCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell contentView](v5, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    -[MTAStopwatchLapCell setColor:](v5, "setColor:", v8);

    v9 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapCell setLapLabel:](v5, "setLapLabel:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell lapLabel](v5, "lapLabel"));
    objc_msgSend(v14, "setTextAlignment:", 4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell lapLabel](v5, "lapLabel"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell lapLabel](v5, "lapLabel"));
    objc_msgSend(v7, "addSubview:", v17);

    v18 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapCell setTimeLabel:](v5, "setTimeLabel:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](v5, "timeLabel"));
    objc_msgSend(v19, "setTextAlignment:", 2);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](v5, "timeLabel"));
    objc_msgSend(v20, "setMinimumScaleFactor:", 0.590909091);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](v5, "timeLabel"));
    objc_msgSend(v22, "setBackgroundColor:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](v5, "timeLabel"));
    LODWORD(v24) = 1148846080;
    objc_msgSend(v23, "setContentHuggingPriority:forAxis:", 0, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](v5, "timeLabel"));
    objc_msgSend(v7, "addSubview:", v25);

    v26 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapCell setRunningTotalLabel:](v5, "setRunningTotalLabel:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](v5, "runningTotalLabel"));
    objc_msgSend(v27, "setTextAlignment:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](v5, "runningTotalLabel"));
    objc_msgSend(v28, "setMinimumScaleFactor:", 0.590909091);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](v5, "runningTotalLabel"));
    objc_msgSend(v30, "setBackgroundColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](v5, "runningTotalLabel"));
    LODWORD(v32) = 1148846080;
    objc_msgSend(v31, "setContentHuggingPriority:forAxis:", 0, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](v5, "runningTotalLabel"));
    objc_msgSend(v7, "addSubview:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v34, "addObserver:selector:name:object:", v5, "_updateForContentSizeChange", UIContentSizeCategoryDidChangeNotification, 0);

    v35 = v5;
  }

  return v5;
}

+ (double)cellHeightWithCellStyle:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStopwatchLapCell labelBaseFontForCellStyle:](MTAStopwatchLapCell, "labelBaseFontForCellStyle:"));
  v10 = 0.0;
  v11 = 0.0;
  +[MTAStopwatchLapCell lapLabelBaselineTopOffset:bottomOffset:forCellStyle:](MTAStopwatchLapCell, "lapLabelBaselineTopOffset:bottomOffset:forCellStyle:", &v11, &v10, a3);
  objc_msgSend(v4, "_scaledValueForValue:", v11);
  v6 = v5;
  objc_msgSend(v4, "_scaledValueForValue:", v10);
  v8 = v6 - v7;

  return v8;
}

- (void)_updateForContentSizeChange
{
  UILabel *timeLabel;
  void *v4;
  UILabel *runningTotalLabel;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MTAStopwatchLapCell labelBaseFontForCellStyle:](MTAStopwatchLapCell, "labelBaseFontForCellStyle:", -[MTAStopwatchLapCell lapStyle](self, "lapStyle")));
  -[UILabel setFont:](self->_lapLabel, "setFont:", v7);
  timeLabel = self->_timeLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mtui_fontByAddingTimeFontAttributes"));
  -[UILabel setFont:](timeLabel, "setFont:", v4);

  runningTotalLabel = self->_runningTotalLabel;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mtui_fontByAddingTimeFontAttributes"));
  -[UILabel setFont:](runningTotalLabel, "setFont:", v6);

  -[MTAStopwatchLapCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLapStyle:(unint64_t)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_lapStyle != a3)
  {
    self->_lapStyle = a3;
    +[MTAStopwatchLapCell lapLabelBaselineTopOffset:bottomOffset:forCellStyle:](MTAStopwatchLapCell, "lapLabelBaselineTopOffset:bottomOffset:forCellStyle:", &self->_lapLabelDefaultBaselineTopOffset, &self->_lapLabelDefaultBaselineBottomOffset, a3);
    v4 = self->_lapStyle == 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](self, "runningTotalLabel"));
    objc_msgSend(v5, "setHidden:", v4);

    v11 = (id)objc_claimAutoreleasedReturnValue(+[MTAStopwatchLapCell labelBaseFontForCellStyle:](MTAStopwatchLapCell, "labelBaseFontForCellStyle:", -[MTAStopwatchLapCell lapStyle](self, "lapStyle")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell lapLabel](self, "lapLabel"));
    objc_msgSend(v6, "setFont:", v11);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mtui_fontByAddingTimeFontAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](self, "timeLabel"));
    objc_msgSend(v8, "setFont:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mtui_fontByAddingTimeFontAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](self, "runningTotalLabel"));
    objc_msgSend(v10, "setFont:", v9);

  }
}

+ (void)lapLabelBaselineTopOffset:(double *)a3 bottomOffset:(double *)a4 forCellStyle:(unint64_t)a5
{
  unint64_t v5;
  double v6;
  double v7;

  if (a3 && a4)
  {
    v5 = a5 - 2;
    if (a5 - 2 > 2)
    {
      v7 = -16.0;
      v6 = 28.0;
    }
    else
    {
      v6 = dbl_10007A828[v5];
      v7 = dbl_10007A840[v5];
    }
    *a3 = v6;
    *a4 = v7;
  }
}

+ (id)textStyleForCellStyle:(unint64_t)a3
{
  id *v3;

  if (a3 - 2 > 2)
    v3 = (id *)&UIFontTextStyleBody;
  else
    v3 = (id *)*(&off_100099A40 + a3 - 2);
  return *v3;
}

+ (id)labelBaseFontForCellStyle:(unint64_t)a3
{
  id *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (id *)&UIContentSizeCategoryAccessibilityExtraLarge;
  if (a3 == 2)
    v4 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  v5 = (NSString *)*v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));

  if (UIContentSizeCategoryCompareToCategory(v7, v5) == NSOrderedDescending)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v5));
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStopwatchLapCell textStyleForCellStyle:](MTAStopwatchLapCell, "textStyleForCellStyle:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v8));

  return v10;
}

- (void)layoutSubviews
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  double Width;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MidX;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v51.receiver = self;
  v51.super_class = (Class)MTAStopwatchLapCell;
  -[MTAStopwatchLapCell layoutSubviews](&v51, "layoutSubviews");
  v3 = -[MTAStopwatchLapCell mtui_isRTL](self, "mtui_isRTL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell lapLabel](self, "lapLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell timeLabel](self, "timeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell contentView](self, "contentView"));
  v7 = objc_msgSend((id)objc_opt_class(self), "lapLabelTextForNumber:", self->_lap);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell color](self, "color"));
  objc_msgSend(v4, "setTextColor:", v9);

  v10 = FormatTime(0, 1, self->_time);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v5, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell color](self, "color"));
  objc_msgSend(v5, "setTextColor:", v12);

  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v4, "bounds");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v5, "bounds");
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStopwatchLapCell labelBaseFontForCellStyle:](MTAStopwatchLapCell, "labelBaseFontForCellStyle:", -[MTAStopwatchLapCell lapStyle](self, "lapStyle")));
  -[MTAStopwatchLapCell lapLabelDefaultBaselineTopOffset](self, "lapLabelDefaultBaselineTopOffset");
  objc_msgSend(v21, "_scaledValueForValue:");
  v23 = v22;
  objc_msgSend(v4, "_lastLineBaseline");
  v25 = v23 - v24;
  if (v3)
  {
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v52);
    -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
    v28 = Width - v27;
    v53.origin.x = CGRectZero.origin.x;
    v53.origin.y = v25;
    v53.size.width = v14;
    v53.size.height = v16;
    v29 = v28 - CGRectGetWidth(v53);
  }
  else
  {
    -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
    v29 = v30;
  }
  objc_msgSend(v4, "setFrame:", v29, v25, v14, v16);
  if ((id)-[MTAStopwatchLapCell lapStyle](self, "lapStyle") == (id)1)
  {
    if (v3)
    {
      -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
      v32 = v31;
    }
    else
    {
      objc_msgSend(v6, "bounds");
      v45 = CGRectGetWidth(v56);
      -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
      v47 = v45 - v46;
      objc_msgSend(v5, "bounds");
      v32 = v47 - CGRectGetWidth(v57);
    }
    objc_msgSend(v5, "setFrame:", v32, v25, v18, v20);
  }
  else
  {
    objc_msgSend(v6, "bounds");
    MidX = CGRectGetMidX(v54);
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "setFrame:", MidX + CGRectGetWidth(v55) * -0.5, v25, v18, v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell runningTotalLabel](self, "runningTotalLabel"));
    -[MTAStopwatchLapCell runningTotal](self, "runningTotal");
    v36 = FormatTime(0, 1, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    objc_msgSend(v34, "setText:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapCell color](self, "color"));
    objc_msgSend(v34, "setTextColor:", v38);

    objc_msgSend(v34, "sizeToFit");
    objc_msgSend(v34, "bounds");
    v40 = v39;
    v42 = v41;
    if (v3)
    {
      -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
      v44 = v43;
    }
    else
    {
      objc_msgSend(v6, "bounds");
      v48 = CGRectGetWidth(v58);
      -[MTAStopwatchLapCell separatorInset](self, "separatorInset");
      v50 = v48 - v49;
      objc_msgSend(v34, "bounds");
      v44 = v50 - CGRectGetWidth(v59);
    }
    objc_msgSend(v34, "setFrame:", v44, v25, v40, v42);

  }
}

+ (void)ensureLapFormatter
{
  id v2;
  void *v3;
  id v4;

  if (!qword_1000BFD00)
  {
    v2 = objc_alloc_init((Class)NSNumberFormatter);
    v3 = (void *)qword_1000BFD00;
    qword_1000BFD00 = (uint64_t)v2;

    objc_msgSend((id)qword_1000BFD00, "setNumberStyle:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    objc_msgSend((id)qword_1000BFD00, "setLocale:", v4);

  }
}

+ (void)resetLapFormatter
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;

  if (qword_1000BFD00)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000BFD00, "locale"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v4 = objc_msgSend(v2, "isEqual:", v3);

    if ((v4 & 1) == 0)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
      objc_msgSend((id)qword_1000BFD00, "setLocale:", v5);

    }
  }
}

+ (id)lapLabelTextForNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "ensureLapFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LAP_NUMBER_STOPWATCH"), &stru_10009A4D0, 0));

  v6 = (void *)qword_1000BFD00;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromNumber:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8));

  return v9;
}

+ (void)handleLocaleChange
{
  ResetTimeFormatter(a1, a2);
  _objc_msgSend(a1, "resetLapFormatter");
}

- (id)_accessibilityFormatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5
{
  return (id)FormatTime(a4, a5, a3);
}

- (int64_t)lap
{
  return self->_lap;
}

- (void)setLap:(int64_t)a3
{
  self->_lap = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (unint64_t)lapStyle
{
  return self->_lapStyle;
}

- (double)runningTotal
{
  return self->_runningTotal;
}

- (void)setRunningTotal:(double)a3
{
  self->_runningTotal = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UILabel)lapLabel
{
  return self->_lapLabel;
}

- (void)setLapLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lapLabel, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UILabel)runningTotalLabel
{
  return self->_runningTotalLabel;
}

- (void)setRunningTotalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_runningTotalLabel, a3);
}

- (double)lapLabelDefaultBaselineTopOffset
{
  return self->_lapLabelDefaultBaselineTopOffset;
}

- (void)setLapLabelDefaultBaselineTopOffset:(double)a3
{
  self->_lapLabelDefaultBaselineTopOffset = a3;
}

- (double)lapLabelDefaultBaselineBottomOffset
{
  return self->_lapLabelDefaultBaselineBottomOffset;
}

- (void)setLapLabelDefaultBaselineBottomOffset:(double)a3
{
  self->_lapLabelDefaultBaselineBottomOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTotalLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_lapLabel, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
