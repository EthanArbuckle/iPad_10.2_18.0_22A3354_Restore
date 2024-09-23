@implementation MonthViewOccurrence

+ (void)clearCachedFonts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)qword_1001F6600;
  qword_1001F6600 = 0;

  v3 = (void *)qword_1001F6608;
  qword_1001F6608 = 0;

  v4 = (void *)qword_1001F6618;
  qword_1001F6618 = 0;

  v5 = (void *)qword_1001F6610;
  qword_1001F6610 = 0;

  qword_1001F6620 = 0;
  qword_1001F6628 = 0;
}

+ (id)textFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1001F6600;
  if (!qword_1001F6600)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    v4 = (void *)qword_1001F6600;
    qword_1001F6600 = v3;

    v2 = (void *)qword_1001F6600;
  }
  return v2;
}

+ (id)compactTextFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)qword_1001F6608;
  if (!qword_1001F6608)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont cuik_preferredTightLeadingFontForTextStyle:](UIFont, "cuik_preferredTightLeadingFontForTextStyle:", UIFontTextStyleHeadline));
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 11.0);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontWithSize:"));
    v5 = (void *)qword_1001F6608;
    qword_1001F6608 = v4;

    v2 = (void *)qword_1001F6608;
  }
  return v2;
}

+ (id)hourFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1001F6610;
  if (!qword_1001F6610)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    v4 = (void *)qword_1001F6610;
    qword_1001F6610 = v3;

    v2 = (void *)qword_1001F6610;
  }
  return v2;
}

+ (id)compactHourFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)qword_1001F6618;
  if (!qword_1001F6618)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 11.0);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontWithSize:"));
    v5 = (void *)qword_1001F6618;
    qword_1001F6618 = v4;

    v2 = (void *)qword_1001F6618;
  }
  return v2;
}

+ (double)compactOccurrenceHeight
{
  double result;

  result = *(double *)&qword_1001F6628;
  if (*(double *)&qword_1001F6628 == 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 16.0);
    qword_1001F6628 = *(_QWORD *)&result;
  }
  return result;
}

+ (double)verticalSpaceBetweenOccurrences
{
  double result;

  result = *(double *)&qword_1001F6620;
  if (*(double *)&qword_1001F6620 == 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 3.0);
    qword_1001F6620 = *(_QWORD *)&result;
  }
  return result;
}

- (id)_titleColor
{
  void *v3;
  id v4;
  void *v5;
  NSMutableArray *cachedTitleColors;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (qword_1001F6650 != -1)
    dispatch_once(&qword_1001F6650, &stru_1001B5A88);
  if ((*((_BYTE *)self + 56) & 0x10) != 0)
  {
    if ((*((_BYTE *)self + 72) & 1) != 0)
    {
      v3 = (void *)qword_1001F6648;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ((*((_BYTE *)self + 72) & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
LABEL_12:
    v5 = v4;
    return v5;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    v3 = (void *)qword_1001F6638;
LABEL_11:
    v4 = v3;
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 56) & 8) != 0)
  {
    if ((*((_BYTE *)self + 56) & 0x20) != 0)
    {
LABEL_22:
      v3 = (void *)qword_1001F6630;
      goto LABEL_11;
    }
LABEL_8:
    v3 = (void *)qword_1001F6640;
    goto LABEL_11;
  }
  if (!self->_compact && (*((_BYTE *)self + 56) & 1) == 0 && (*((_BYTE *)self + 56) & 2) == 0)
    goto LABEL_22;
  cachedTitleColors = self->_cachedTitleColors;
  if (!cachedTitleColors)
  {
    v8 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v9 = self->_cachedTitleColors;
    self->_cachedTitleColors = v8;

    v10 = CUIKTextColorForCalendarColorForStyle(self->_color, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableArray setObject:atIndexedSubscript:](self->_cachedTitleColors, "setObject:atIndexedSubscript:", v11, 0);

    v12 = CUIKTextColorForCalendarColorForStyle(self->_color, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NSMutableArray setObject:atIndexedSubscript:](self->_cachedTitleColors, "setObject:atIndexedSubscript:", v13, 1);

    cachedTitleColors = self->_cachedTitleColors;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](cachedTitleColors, "objectAtIndexedSubscript:", objc_msgSend(v14, "userInterfaceStyle") == (id)2));

  return v5;
}

- (id)_timeColor
{
  void *v3;
  id v4;
  void *v5;
  NSMutableArray *cachedTimeColors;
  NSMutableArray *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (qword_1001F6670 != -1)
    dispatch_once(&qword_1001F6670, &stru_1001B5AA8);
  if ((*((_BYTE *)self + 72) & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    goto LABEL_8;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    v3 = (void *)qword_1001F6660;
LABEL_6:
    v4 = v3;
LABEL_8:
    v5 = v4;
    return v5;
  }
  if (!self->_compact && (*((_BYTE *)self + 56) & 1) == 0 && (*((_BYTE *)self + 56) & 2) == 0)
  {
    v3 = (void *)qword_1001F6658;
    goto LABEL_6;
  }
  cachedTimeColors = self->_cachedTimeColors;
  if (!cachedTimeColors)
  {
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v8 = self->_cachedTimeColors;
    self->_cachedTimeColors = v7;

    v9 = CUIKSecondaryTextColorForCalendarColorForStyle(self->_color, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[NSMutableArray setObject:atIndexedSubscript:](self->_cachedTimeColors, "setObject:atIndexedSubscript:", v10, 0);

    v11 = CUIKSecondaryTextColorForCalendarColorForStyle(self->_color, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSMutableArray setObject:atIndexedSubscript:](self->_cachedTimeColors, "setObject:atIndexedSubscript:", v12, 1);

    cachedTimeColors = self->_cachedTimeColors;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](cachedTimeColors, "objectAtIndexedSubscript:", objc_msgSend(v13, "userInterfaceStyle") == (id)2));

  return v5;
}

- (id)_strikeColor
{
  id v3;

  if (qword_1001F6680 != -1)
    dispatch_once(&qword_1001F6680, &stru_1001B5AC8);
  if ((*((_BYTE *)self + 72) & 1) != 0)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v3 = (id)qword_1001F6678;
  return v3;
}

- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isProposedTime:(BOOL)a6 isCompact:(BOOL)a7
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  double y;
  double x;
  id v16;
  MonthViewOccurrence *v17;
  MonthViewOccurrence *v18;
  void *v19;
  void *v20;
  CALayer *v21;
  CALayer *glowLayer;
  id v23;
  id v24;
  double v25;
  void *v26;
  CAGradientLayer *v27;
  CAGradientLayer *gradientLayer;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  _QWORD v42[4];

  v7 = a7;
  length = a5.length;
  location = a5.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v41.receiver = self;
  v41.super_class = (Class)MonthViewOccurrence;
  v17 = -[MonthViewOccurrence initWithFrame:](&v41, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_dayRange.location = location;
    v17->_dayRange.length = length;
    v17->_cachedEndRange = location + length - 1;
    v17->_isProposedTime = a6;
    if (v7)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MonthViewOccurrence compactTextFont](MonthViewOccurrence, "compactTextFont"));
    else
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MonthViewOccurrence textFont](MonthViewOccurrence, "textFont"));
    v20 = v19;
    objc_storeStrong((id *)&v18->_font, v19);

    v18->_compact = v7;
    -[MonthViewOccurrence setOccurrence:](v18, "setOccurrence:", v16);
    v21 = (CALayer *)objc_alloc_init((Class)CALayer);
    glowLayer = v18->_glowLayer;
    v18->_glowLayer = v21;

    v40 = v16;
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CALayer setBackgroundColor:](v18->_glowLayer, "setBackgroundColor:", objc_msgSend(v23, "CGColor"));

    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CALayer setShadowColor:](v18->_glowLayer, "setShadowColor:", objc_msgSend(v24, "CGColor"));

    -[CALayer setShadowOffset:](v18->_glowLayer, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
    -[CALayer setShadowRadius:](v18->_glowLayer, "setShadowRadius:", 6.0);
    LODWORD(v25) = 1032805417;
    -[CALayer setShadowOpacity:](v18->_glowLayer, "setShadowOpacity:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](v18, "layer"));
    objc_msgSend(v26, "addSublayer:", v18->_glowLayer);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](v18, "layer"));
    objc_msgSend(v39, "setValue:forKeyPath:", &__kCFBooleanTrue, CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v39, "setNeedsDisplay");
    v27 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v18->_gradientLayer;
    v18->_gradientLayer = v27;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "colorWithAlphaComponent:", 1.0)));
    v42[0] = objc_msgSend(v29, "CGColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "colorWithAlphaComponent:", 1.0)));
    v42[1] = objc_msgSend(v31, "CGColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "colorWithAlphaComponent:", 0.0)));
    v42[2] = objc_msgSend(v33, "CGColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "colorWithAlphaComponent:", 0.0)));
    v42[3] = objc_msgSend(v35, "CGColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
    -[CAGradientLayer setColors:](v18->_gradientLayer, "setColors:", v36);

    v16 = v40;
    v18->_occAlpha = 1.0;

  }
  return v18;
}

- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isCompact:(BOOL)a6
{
  return -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:](self, "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:", a4, a5.location, a5.length, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  objc_super v12;

  if (self->_occurrence)
  {
    v12.receiver = self;
    v12.super_class = (Class)MonthViewOccurrence;
    v3 = -[MonthViewOccurrence description](&v12, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent title](self->_occurrence, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_occurrence, "startCalendarDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent endCalendarDate](self->_occurrence, "endCalendarDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ '%@' %@ to %@"), v4, v5, v6, v7));

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MonthViewOccurrence;
    v9 = -[MonthViewOccurrence description](&v11, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - no occurrence set"), v4));
  }

  return v8;
}

- (void)loadViewsIfNeeded
{
  UIImageView *v3;
  UIImageView *backgroundImageView;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *dotImageView;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  TrailingFadeLabel *v14;
  TrailingFadeLabel *titleLabel;
  UILabel *v16;
  UILabel *wrappingTitleLabel;
  UILabel *v18;
  UILabel *timeLabel;

  if (!self->_backgroundImageView)
  {
    v3 = objc_opt_new(UIImageView);
    backgroundImageView = self->_backgroundImageView;
    self->_backgroundImageView = v3;

    -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_backgroundImageView);
    if ((*((_BYTE *)self + 56) & 8) != 0)
    {
      v7 = objc_opt_new(UIImageView);
      dotImageView = self->_dotImageView;
      self->_dotImageView = v7;

      v9 = *((_BYTE *)self + 56);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
      v11 = v10;
      if ((v9 & 0x20) != 0)
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CUIK_symbolColor"));
      else
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CUIK_disabledSymbolColor"));
      v13 = (void *)v12;

      -[UIImageView setTintColor:](self->_dotImageView, "setTintColor:", v13);
      -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_dotImageView);

    }
    else if ((*((_BYTE *)self + 56) & 1) != 0)
    {
      v5 = objc_opt_new(UIImageView);
      v6 = self->_dotImageView;
      self->_dotImageView = v5;

      -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_dotImageView);
    }
    v14 = objc_opt_new(TrailingFadeLabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v14;

    -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_titleLabel);
    v16 = objc_opt_new(UILabel);
    wrappingTitleLabel = self->_wrappingTitleLabel;
    self->_wrappingTitleLabel = v16;

    -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_wrappingTitleLabel);
    v18 = objc_opt_new(UILabel);
    timeLabel = self->_timeLabel;
    self->_timeLabel = v18;

    -[MonthViewOccurrence addSubview:](self, "addSubview:", self->_timeLabel);
    -[MonthViewOccurrence _updateSubviewsIfNeeded](self, "_updateSubviewsIfNeeded");
    -[MonthViewOccurrence frame](self, "frame");
    -[MonthViewOccurrence setFrame:](self, "setFrame:");
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
  {
    -[MonthViewOccurrence _updateOccurrenceWithForce:](self, "_updateOccurrenceWithForce:", 0);
    -[MonthViewOccurrence loadViewsIfNeeded](self, "loadViewsIfNeeded");
    -[MonthViewOccurrence relayoutSubviews](self, "relayoutSubviews");
  }
}

- (id)attributedTitleWithParagraphStyle:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", self->_font, NSFontAttributeName);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, NSParagraphStyleAttributeName);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _titleColor](self, "_titleColor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, NSForegroundColorAttributeName);

  if ((self->_invitationType - 3) <= 1)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &off_1001BC508, NSStrikethroughStyleAttributeName);
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrenceString](self, "occurrenceString"));
  v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v5);

  return v9;
}

- (double)attributedTitleHeight
{
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedTitleHeights;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  if (!self->_cachedTitleHeights)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    cachedTitleHeights = self->_cachedTitleHeights;
    self->_cachedTitleHeights = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrenceString](self, "occurrenceString"));
  v6 = -[MonthViewOccurrence textWraps](self, "textWraps");
  -[UIFont pointSize](self->_font, "pointSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %b %f"), v5, v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTitleHeights, "objectForKeyedSubscript:", v8));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitle](self, "attributedTitle"));
    objc_msgSend(v10, "size");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedTitleHeights, "setObject:forKeyedSubscript:", v12, v8);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTitleHeights, "objectForKeyedSubscript:", v8));
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  return v15;
}

- (id)attributedTitle
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  if (self->_compact)
  {
    if (-[MonthViewOccurrence textWraps](self, "textWraps"))
      v4 = 0;
    else
      v4 = 2;
  }
  else
  {
    v4 = 4;
  }
  objc_msgSend(v3, "setLineBreakMode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitleWithParagraphStyle:](self, "attributedTitleWithParagraphStyle:", v3));

  return v5;
}

- (id)attributedTitleForLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v3, "setLineBreakMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitleWithParagraphStyle:](self, "attributedTitleWithParagraphStyle:", v3));

  return v4;
}

- (id)attributedTitleForWrappingLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitleWithParagraphStyle:](self, "attributedTitleWithParagraphStyle:", v3));

  return v4;
}

- (id)attributedTime
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _timeColor](self, "_timeColor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, NSForegroundColorAttributeName);

  if (self->_compact)
    v5 = objc_claimAutoreleasedReturnValue(+[MonthViewOccurrence compactHourFont](MonthViewOccurrence, "compactHourFont"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[MonthViewOccurrence hourFont](MonthViewOccurrence, "hourFont"));
  v6 = (void *)v5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, NSFontAttributeName);

  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence timeString](self, "timeString"));
  v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v3);

  return v9;
}

- (id)pillImage
{
  __CFString *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  UIColor *v10;
  UIColor *v11;
  UIGraphicsImageRendererFormat *v12;
  id v13;
  UIColor *v19;
  _QWORD v21[4];
  UIColor *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  if (qword_1001F6690 != -1)
    dispatch_once(&qword_1001F6690, &stru_1001B5AE8);
  if ((*((_BYTE *)self + 72) & 1) != 0)
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1001B67C0, "stringByAppendingString:", CFSTR("Selected")));
  else
    v3 = &stru_1001B67C0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == (id)1)
  {
    v6 = CFSTR("Light");
  }
  else
  {
    if (v5 != (id)2)
      goto LABEL_11;
    v6 = CFSTR("Dark");
  }
  v7 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v6));

  v3 = (__CFString *)v7;
LABEL_11:
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6688, "objectForKeyedSubscript:", self->_color));
  if (!v8)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    objc_msgSend((id)qword_1001F6688, "setObject:forKeyedSubscript:", v8, self->_color);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v3));
  if (!v9)
  {
    if ((*((_BYTE *)self + 72) & 1) != 0)
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    else
      v10 = self->_color;
    v11 = v10;
    if (qword_1001F66A0 != -1)
      dispatch_once(&qword_1001F66A0, &stru_1001B5B08);
    v12 = objc_opt_new(UIGraphicsImageRendererFormat);
    -[UIGraphicsImageRendererFormat setScale:](v12, "setScale:", *(double *)&qword_1001F6698);
    -[UIGraphicsImageRendererFormat setOpaque:](v12, "setOpaque:", 0);
    -[UIGraphicsImageRendererFormat setPreferredRange:](v12, "setPreferredRange:", 1);
    v13 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v12, 1.0, 1.0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100106F34;
    v21[3] = &unk_1001B5B30;
    v23 = 0;
    v24 = 0;
    v22 = v11;
    __asm { FMOV            V0.2D, #1.0 }
    v25 = _Q0;
    v19 = v11;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithActions:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v3);

  }
  return v9;
}

- (id)backgroundImage
{
  __CFString *v3;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  void *v14;
  int invitationType;
  UIColor *v16;
  double v17;
  double v18;
  UIColor *v19;
  UIColor *v20;
  UIGraphicsImageRendererFormat *v21;
  id v22;
  double v28;
  void *v29;
  void *v30;
  UIColor *color;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  UIColor *v36;
  void *v37;
  uint64_t v38;
  unsigned int v39;
  UIColor *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  id v44;
  void *v45;
  _QWORD v47[4];
  UIColor *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;

  if (qword_1001F66B0 != -1)
    dispatch_once(&qword_1001F66B0, &stru_1001B5B50);
  if ((*((_BYTE *)self + 72) & 1) != 0)
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1001B67C0, "stringByAppendingString:", CFSTR("Selected")));
  else
    v3 = &stru_1001B67C0;
  v4 = self->_invitationType - 1;
  if (v4 <= 3)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", *(&off_1001B5BB0 + v4)));

    v3 = (__CFString *)v5;
  }
  if ((*((_BYTE *)self + 56) & 8) != 0)
    v6 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("Reminder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v8 == (id)1)
  {
    v9 = CFSTR("Light");
  }
  else
  {
    if (v8 != (id)2)
      goto LABEL_15;
    v9 = CFSTR("Dark");
  }
  v10 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v9));

  v3 = (__CFString *)v10;
LABEL_15:
  if (-[MonthViewOccurrence isNarrow](self, "isNarrow"))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("Narrow")));

    v3 = (__CFString *)v11;
  }
  v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F66A8, "objectForKeyedSubscript:", self->_color));
  if (!v12)
  {
    v12 = objc_opt_new(NSMutableDictionary);
    objc_msgSend((id)qword_1001F66A8, "setObject:forKeyedSubscript:", v12, self->_color);
  }
  v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v3));
  v14 = (void *)v13;
  if (!v13)
  {
    invitationType = self->_invitationType;
    if ((invitationType - 3) < 2)
    {
      v19 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 1.0));
    }
    else
    {
      if (invitationType == 1)
      {
        *(_QWORD *)&v28 = objc_opt_class(self).n128_u64[0];
        v30 = v29;
        color = self->_color;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", v28));
        v16 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_blendColor:withColor:alpha:", color, v32, 0.89));

        if ((*((_BYTE *)self + 72) & 1) == 0)
        {
          *(_QWORD *)&v33 = objc_opt_class(self).n128_u64[0];
          v35 = v34;
          v36 = self->_color;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", v33));
          v21 = (UIGraphicsImageRendererFormat *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_blendColor:withColor:alpha:", v36, v37, 0.34));

LABEL_37:
          v42 = EKUIScaleFactor(v38);
          v43 = CUIKCreateStripedUIImage(v16, v21, v42);
          v22 = (id)objc_claimAutoreleasedReturnValue(v43);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "resizableImageWithCapInsets:resizingMode:", 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));
LABEL_38:

          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, v3);
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      if (invitationType == 2)
      {
        v16 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", dbl_1001A19F0[(*((_BYTE *)self + 72) & 1) == 0], 1.0));
        if ((*((_BYTE *)self + 72) & 1) == 0)
        {
          v17 = 0.85;
          v18 = 1.0;
LABEL_36:
          v38 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v17, v18));
          v21 = (UIGraphicsImageRendererFormat *)v38;
          goto LABEL_37;
        }
LABEL_35:
        v18 = 0.15;
        v17 = 1.0;
        goto LABEL_36;
      }
      if ((*((_BYTE *)self + 56) & 8) != 0 && (*((_BYTE *)self + 72) & 1) != 0)
      {
        v19 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
      }
      else
      {
        v39 = -[MonthViewOccurrence isNarrow](self, "isNarrow");
        v40 = self->_color;
        if (v39)
        {
          v41 = CUIKSummaryColorForColor(v40, v8);
          v19 = (UIColor *)objc_claimAutoreleasedReturnValue(v41);
        }
        else
        {
          v19 = v40;
        }
      }
    }
    v20 = v19;
    if (qword_1001F66C0 != -1)
      dispatch_once(&qword_1001F66C0, &stru_1001B5B70);
    v21 = objc_opt_new(UIGraphicsImageRendererFormat);
    -[UIGraphicsImageRendererFormat setScale:](v21, "setScale:", *(double *)&qword_1001F66B8);
    -[UIGraphicsImageRendererFormat setOpaque:](v21, "setOpaque:", 0);
    -[UIGraphicsImageRendererFormat setPreferredRange:](v21, "setPreferredRange:", 1);
    v22 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v21, 1.0, 1.0);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100107484;
    v47[3] = &unk_1001B5B30;
    v16 = v20;
    v49 = 0;
    v50 = 0;
    v48 = v16;
    __asm { FMOV            V0.2D, #1.0 }
    v51 = _Q0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageWithActions:", v47));

    goto LABEL_38;
  }
LABEL_39:
  if (CalInterfaceIsLeftToRight(v13))
    v44 = v14;
  else
    v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageFlippedForRightToLeftLayoutDirection"));
  v45 = v44;

  return v45;
}

+ (id)_blendColor:(id)a3 withColor:(id)a4 alpha:(double)a5
{
  double v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v7 = 1.0 - a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "redComponent");
  v11 = v10;
  objc_msgSend(v8, "redComponent");
  v13 = v7 * v12 + a5 * v11;
  objc_msgSend(v9, "greenComponent");
  v15 = v14;
  objc_msgSend(v8, "greenComponent");
  v17 = v7 * v16 + a5 * v15;
  objc_msgSend(v9, "blueComponent");
  v19 = v18;

  objc_msgSend(v8, "blueComponent");
  v21 = v20;

  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v13, v17, v7 * v21 + a5 * v19, 1.0);
}

- (void)_drawBackgroundInFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 splitRightEdge;
  CGContext *CurrentContext;
  int v10;
  uint64_t IsLeftToRight;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL8 v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double MaxX;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double MinY;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  UIBezierPath *v46;
  void *v47;
  void *v48;
  id v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_splitLeftEdge)
  {
    splitRightEdge = self->_splitRightEdge;
    CurrentContext = UIGraphicsGetCurrentContext();
    if (splitRightEdge)
    {
      v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
  }
  CGContextSaveGState(CurrentContext);
  if (self->_splitLeftEdge)
  {
    v13 = 0;
  }
  else
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight(IsLeftToRight, v12);
    if ((_DWORD)IsLeftToRight)
      v13 = 5;
    else
      v13 = 10;
  }
  if (!self->_splitRightEdge)
  {
    if (CalTimeDirectionIsLeftToRight(IsLeftToRight, v12))
      v13 |= 0xAuLL;
    else
      v13 |= 5uLL;
  }
  v14 = 4.0;
  if ((*((_BYTE *)self + 56) & 1) != 0)
  {
    if (self->_compact)
      v14 = height * 0.5;
    else
      v14 = 6.0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v13, x, y, width, height, v14, v14));
  objc_msgSend(v15, "addClip");

  v10 = 1;
LABEL_19:
  if (-[MonthViewOccurrence _showBackground](self, "_showBackground"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence backgroundImage](self, "backgroundImage"));
    -[MonthViewOccurrence backgroundAlpha](self, "backgroundAlpha");
    objc_msgSend(v16, "drawInRect:blendMode:alpha:", 0, x, y, width, height, v17);

  }
  if (v10)
    CGContextRestoreGState(CurrentContext);
  v18 = -[MonthViewOccurrence isNarrow](self, "isNarrow");
  if (!v18
    && (*((_BYTE *)self + 56) & 8) == 0
    && !self->_compact
    && (*((_BYTE *)self + 72) & 1) == 0
    && (*((_BYTE *)self + 56) & 1) == 0
    && !self->_splitLeftEdge)
  {
    v19 = CalInterfaceIsLeftToRight(v18);
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
    if (v19)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v20);
      v27 = MinX + CalRoundToScreenScale(v25, v26, 3.0);
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      v27 = MaxX + CalRoundToScreenScale(v29, v30, 3.0) * -2.0;
    }
    CGContextSaveGState(CurrentContext);
    v49 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence hourFont](self, "hourFont"));
    -[MonthViewOccurrence lineHeightAdjustmentOffsetY:](self, "lineHeightAdjustmentOffsetY:", v49);
    v32 = v31;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinY = CGRectGetMinY(v50);
    v36 = v32 + MinY + CalRoundToScreenScale(v34, v35, 3.0) * 0.5;
    v39 = CalRoundToScreenScale(v37, v38, 3.0);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v40 = CGRectGetHeight(v51);
    v43 = v40 + CalRoundToScreenScale(v41, v42, 3.0) * -2.0 + -0.5;
    v46 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v27, v36, v39, v43, CalRoundToScreenScale(v44, v45, 3.0));
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    objc_msgSend(v47, "addClip");
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence pillImage](self, "pillImage"));
    objc_msgSend(v48, "drawInRect:blendMode:alpha:", 0, v27, v36, v39, v43, 1.0);

    CGContextRestoreGState(CurrentContext);
  }
}

- (id)hourFont
{
  return +[MonthViewOccurrence hourFont](MonthViewOccurrence, "hourFont");
}

- (double)lineHeightAdjustmentOffsetY:(id)a3
{
  UIFont *font;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  font = self->_font;
  v4 = a3;
  v5 = -[UIFont ascender](font, "ascender");
  v7 = CalCeilToScreenScale(v5, v6);
  objc_msgSend(v4, "ascender");
  v9 = v8;

  return v7 - CalCeilToScreenScale(v10, v9);
}

- (BOOL)isAllDay
{
  return *((_BYTE *)self + 56) & 1;
}

- (BOOL)isSingleDay
{
  return self->_dayRange.length == 1;
}

- (BOOL)isMultiDayTimed
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[MonthViewOccurrence _backgroundInsetsIgnoringSplitEdges:](self, "_backgroundInsetsIgnoringSplitEdges:", 0);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_backgroundInsetsIgnoringSplitEdges:(BOOL)a3
{
  double bottom;
  _BOOL4 compact;
  double left;
  double right;
  char IsLeftToRight;
  double top;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  bottom = UIEdgeInsetsZero.bottom;
  if (a3)
  {
    compact = self->_compact;
    if (self->_compact)
      left = 2.0;
    else
      left = 4.0;
    goto LABEL_13;
  }
  if (self->_splitLeftEdge)
  {
    left = UIEdgeInsetsZero.left;
  }
  else if (self->_compact)
  {
    left = 2.0;
  }
  else
  {
    left = 4.0;
  }
  if (!self->_splitRightEdge)
  {
    compact = self->_compact;
LABEL_13:
    if (compact)
      right = 2.0;
    else
      right = 4.0;
    goto LABEL_16;
  }
  right = UIEdgeInsetsZero.right;
LABEL_16:
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  top = 0.0;
  if ((IsLeftToRight & 1) != 0)
    v9 = right;
  else
    v9 = left;
  if ((IsLeftToRight & 1) != 0)
    v10 = bottom;
  else
    v10 = 0.0;
  if ((IsLeftToRight & 1) != 0)
    v11 = left;
  else
    v11 = right;
  if ((IsLeftToRight & 1) != 0)
    top = UIEdgeInsetsZero.top;
  result.right = v9;
  result.bottom = v10;
  result.left = v11;
  result.top = top;
  return result;
}

- (CGPoint)_offsetForDotInFrame:(CGRect)a3 withDot:(id)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  int IsLeftToRight;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  IsLeftToRight = CalInterfaceIsLeftToRight(v9);
  -[MonthViewOccurrence backgroundInsets](self, "backgroundInsets");
  if (IsLeftToRight)
    v13 = v11;
  else
    v13 = v12;
  v14 = objc_msgSend(v9, "size");
  v16 = v15;
  if ((CalInterfaceIsLeftToRight(v14) & 1) == 0)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v17 = CGRectGetWidth(v22);
    objc_msgSend(v9, "size");
    v13 = v17 - v18 - v13;
  }

  v19 = v13;
  v20 = height * 0.5 - v16 * 0.5;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)_pointForDotInFrame:(CGRect)a3 withDot:(id)a4
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.origin.y;
  x = a3.origin.x;
  v6 = -[MonthViewOccurrence _offsetForDotInFrame:withDot:](self, "_offsetForDotInFrame:withDot:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = CalRoundPointToScreenScale(v6, x + v7 + 1.0, y + v8);
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIEdgeInsets)_textInsets
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  UIImage *dotImage;
  double v9;
  double bottom;
  double v11;
  UIImage *v12;
  char IsLeftToRight;
  double top;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = -[MonthViewOccurrence _backgroundInsetsIgnoringSplitEdges:](self, "_backgroundInsetsIgnoringSplitEdges:", 1);
  v5 = v4;
  v7 = v4 + CalRoundToScreenScale(v3, v6, 3.0) * 2.0 + 3.0;
  dotImage = self->_dotImage;
  if (dotImage && ((*((_BYTE *)self + 56) & 1) == 0 || !self->_splitLeftEdge))
  {
    dotImage = (UIImage *)-[UIImage size](dotImage, "size");
    v7 = v5 + v9 + 4.0;
  }
  bottom = UIEdgeInsetsZero.bottom;
  if (self->_compact)
  {
    if ((*((_BYTE *)self + 56) & 1) != 0 && self->_splitLeftEdge)
    {
      v7 = 5.0;
      v11 = 2.0;
    }
    else
    {
      v12 = self->_dotImage;
      if (v12)
        v11 = 3.0;
      else
        v11 = 2.0;
      if (!v12)
        v7 = 4.0;
    }
  }
  else
  {
    v11 = 7.0;
  }
  IsLeftToRight = CalInterfaceIsLeftToRight(dotImage);
  top = 0.0;
  if ((IsLeftToRight & 1) != 0)
    v15 = v11;
  else
    v15 = v7;
  if ((IsLeftToRight & 1) != 0)
    v16 = bottom;
  else
    v16 = 0.0;
  if ((IsLeftToRight & 1) != 0)
    v17 = v7;
  else
    v17 = v11;
  if ((IsLeftToRight & 1) != 0)
    top = UIEdgeInsetsZero.top;
  result.right = v15;
  result.bottom = v16;
  result.left = v17;
  result.top = top;
  return result;
}

- (id)_timeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone calendarTimeZone](NSTimeZone, "calendarTimeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v6));

  if ((CUIKShow24Hours() & 1) != 0 || objc_msgSend(v7, "hour") != (id)12 || objc_msgSend(v7, "minute"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v9 = CUIKStringForTime(v8, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v14, v13));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Noon"), &stru_1001B67C0, 0));
  }
  v11 = (void *)v10;

  return v11;
}

- (double)widthDrawingTime:(id)a3 textRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t IsLeftToRight;
  double v25;
  double MinX;
  double MaxX;
  void *v28;
  double MidY;
  double v30;
  CGFloat rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _timeColor](self, "_timeColor"));
  objc_msgSend(v10, "set");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence hourFont](self, "hourFont"));
  v12 = -[MonthViewOccurrence lineHeightAdjustmentOffsetY:](self, "lineHeightAdjustmentOffsetY:", v11);
  v14 = height - v13;
  v16 = CalRoundToScreenScale(v12, v15, y + v13);
  v18 = CalCeilToScreenScale(v17, v14);
  if (CalInterfaceIsLeftToRight(v19))
    v20 = 2;
  else
    v20 = 0;
  objc_msgSend(v9, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v11, 2, v20, x, v16, width, v18);
  v22 = v21;

  IsLeftToRight = CalInterfaceIsLeftToRight(v23);
  v25 = x;
  if ((_DWORD)IsLeftToRight)
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v25 = CGRectGetMaxX(v33) - v22;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    v34.origin.x = v25;
    v34.origin.y = v16;
    v34.size.width = v22;
    v34.size.height = v18;
    rect = height;
    MinX = CGRectGetMinX(v34);
    v35.origin.x = v25;
    v35.origin.y = v16;
    v35.size.width = v22;
    v35.size.height = v18;
    MaxX = CGRectGetMaxX(v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _strikeColor](self, "_strikeColor"));
    objc_msgSend(v28, "set");

    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = rect;
    MidY = CGRectGetMidY(v36);
    v37.origin.x = CalRoundRectToScreenScale(MinX, MidY, MaxX - MinX, 0.5);
    UIRectFillUsingBlendMode(v37, kCGBlendModeNormal);
  }
  v30 = CalCeilToScreenScale(IsLeftToRight, v22 + -3.0);

  return v30;
}

- (void)setDrawsTimeString:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 72);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)self + 72) = v3 & 0xFD | v4;
    -[MonthViewOccurrence _updateTimeStrings](self, "_updateTimeStrings");
  }
}

- (BOOL)drawsTimeString
{
  if ((*((_BYTE *)self + 72) & 2) != 0)
    return 1;
  else
    return -[MonthViewOccurrence drawsTimeAtBottom](self, "drawsTimeAtBottom");
}

- (void)drawInFrame:(CGRect)a3 context:(CGContext *)a4 traitCollection:(id)a5
{
  -[MonthViewOccurrence _drawInFrame:traitCollection:](self, "_drawInFrame:traitCollection:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)addFadeMaskForRect:(CGRect)a3 leftSide:(BOOL)a4 start:(double)a5 end:(double)a6 withContext:(CGContext *)a7
{
  _BOOL4 v10;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGColorSpace *DeviceGray;
  CGContext *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const __CFArray *v23;
  CGGradient *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGContext *v28;
  CGGradient *v29;
  CGFloat v30;
  CGImage *Image;
  CGFloat locations[4];
  _QWORD v33[4];
  CGRect v34;

  v10 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v16 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, DeviceGray, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  v19 = objc_retainAutorelease(v17);
  v33[0] = objc_msgSend(v19, "CGColor");
  v20 = objc_retainAutorelease(v19);
  v33[1] = objc_msgSend(v20, "CGColor");
  v21 = objc_retainAutorelease(v18);
  v33[2] = objc_msgSend(v21, "CGColor");
  v22 = objc_retainAutorelease(v21);
  v33[3] = objc_msgSend(v22, "CGColor");
  v23 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  locations[0] = 0.0;
  locations[1] = 1.0 - a5 / width;
  locations[2] = 1.0 - a6 / width;
  locations[3] = 1.0;
  v24 = CGGradientCreateWithColors(DeviceGray, v23, locations);
  if (v10)
  {
    v25 = CGPointZero.x;
    v26 = CGPointZero.y;
    v27 = 0.0;
    v28 = v16;
    v29 = v24;
    v30 = width;
  }
  else
  {
    v30 = CGPointZero.x;
    v27 = CGPointZero.y;
    v26 = 0.0;
    v28 = v16;
    v29 = v24;
    v25 = width;
  }
  CGContextDrawLinearGradient(v28, v29, *(CGPoint *)&v30, *(CGPoint *)&v25, 0);
  CGGradientRelease(v24);
  CGColorSpaceRelease(DeviceGray);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  CGContextSaveGState(a7);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGContextClipToMask(a7, v34, Image);
  CGImageRelease(Image);

}

- (void)_drawString:(id)a3 inTextRect:(CGRect)a4 withTrailingFade:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v11;
  CGContext *CurrentContext;
  int v13;
  id v14;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, height);
  if (v5 && v11 > width || -[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge"))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CalInterfaceIsLeftToRight(CurrentContext);
    -[MonthViewOccurrence addFadeMaskForRect:leftSide:start:end:withContext:](self, "addFadeMaskForRect:leftSide:start:end:withContext:", v13 ^ 1u, CurrentContext, x, y, width, height, 14.0, 2.0);
    objc_msgSend(v14, "drawInRect:", x, y, width, height);
    CGContextRestoreGState(CurrentContext);
  }
  else
  {
    objc_msgSend(v14, "drawInRect:", x, y, width, height);
  }

}

- (CGRect)textFrameForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double x;
  CGRect result;

  height = a3.size.height;
  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  if (self->_compact)
  {
    +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
    if (height < v7)
      height = v7;
  }
  -[MonthViewOccurrence _textInsets](self, "_textInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[EKEvent isAllDay](self->_occurrence, "isAllDay")
    || (v16 = v9 + v13, self->_compact) && !-[MonthViewOccurrence textWraps](self, "textWraps"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitle](self, "attributedTitle"));
    objc_msgSend(v17, "size");
    v19 = (height - v18) * 0.5;

    v20 = fmax(v19, 0.0);
    v9 = CalRoundToScreenScale(v21, v22, v20);
    v13 = CalRoundToScreenScale(v23, v24, v20);
    v16 = v9 + v13;
  }
  v25 = -[MonthViewOccurrence textWraps](self, "textWraps");
  if (v25)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, CalRoundToScreenScale(v25, v26, 1.25));
    v9 = v27;
    v28 = height - (v13 + v27);
    +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
    v30 = v29;
    +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
    v32 = v31 + v30 * 2.0;
    if (v28 >= v32)
      v33 = v32;
    else
      v33 = v28;
  }
  else
  {
    v33 = height - v16;
  }
  v34 = width - (v11 + v15);
  v35 = x + v11;
  v36 = y + v9;
  result.size.height = v33;
  result.size.width = v34;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)timeFrameForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MonthViewOccurrence _textInsets](self, "_textInsets");
  v8 = x + v7;
  v11 = width - (v7 + v10);
  v13 = y + v9 + height - (v9 + v12);
  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  v15 = v13 - v14;
  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  v17 = v16;
  v18 = v8;
  v19 = v15;
  v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_drawInFrame:(CGRect)a3 traitCollection:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;
  CGContext *CurrentContext;
  _BOOL8 v13;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  UIImage *dotImage;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  int v39;
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
  void *v50;
  void *v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  int v56;
  void *v57;
  NSMutableArray *subOccurrences;
  NSMutableArray *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  void *v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[MonthViewOccurrence _updateOccurrenceWithForce:](self, "_updateOccurrenceWithForce:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v9);
  v11 = objc_msgSend(v9, "userInterfaceStyle");
  if (v11 != (id)self->_lastUserInterfaceStyle)
  {
    self->_lastUserInterfaceStyle = (int64_t)v11;
    -[MonthViewOccurrence _updateColorsForUserInterfaceStyle:](self, "_updateColorsForUserInterfaceStyle:", v11);
    -[MonthViewOccurrence _updateDotImage](self, "_updateDotImage");
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  if (-[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge")
    || -[MonthViewOccurrence fadeRightEdge](self, "fadeRightEdge"))
  {
    v13 = -[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge");
    if (v13 && (CalInterfaceIsLeftToRight(v13), (v14 & 1) != 0))
    {
      v15 = 1;
    }
    else
    {
      v16 = -[MonthViewOccurrence fadeRightEdge](self, "fadeRightEdge");
      if (v16)
      {
        CalInterfaceIsLeftToRight(v16);
        v15 = v17 ^ 1u;
      }
      else
      {
        v15 = 0;
      }
    }
    -[MonthViewOccurrence addFadeMaskForRect:leftSide:start:end:withContext:](self, "addFadeMaskForRect:leftSide:start:end:withContext:", v15, CurrentContext, x, y, width, height, 8.0, 0.0);
  }
  -[MonthViewOccurrence backgroundInsets](self, "backgroundInsets");
  -[MonthViewOccurrence _drawBackgroundInFrame:](self, "_drawBackgroundInFrame:", x + v21, y + v18, width - (v21 + v19), height - (v18 + v20));
  v22 = -[MonthViewOccurrence isNarrow](self, "isNarrow");
  v23 = v22;
  dotImage = self->_dotImage;
  if (!dotImage)
    goto LABEL_21;
  if ((*((_BYTE *)self + 56) & 1) == 0)
  {
    if ((v22 & 1) != 0)
      goto LABEL_39;
    goto LABEL_20;
  }
  if (self->_splitLeftEdge)
    v25 = 1;
  else
    v25 = v22;
  if ((v25 & 1) == 0)
  {
LABEL_20:
    -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_dotImage, x, y, width, height);
    -[UIImage drawAtPoint:blendMode:alpha:](dotImage, "drawAtPoint:blendMode:alpha:", 0);
  }
LABEL_21:
  if ((v23 & 1) == 0)
  {
    -[MonthViewOccurrence textFrameForFrame:](self, "textFrameForFrame:", x, y, width, height);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    if (-[MonthViewOccurrence drawsTimeString](self, "drawsTimeString")
      && !-[EKEvent isAllDay](self->_occurrence, "isAllDay"))
    {
      v65 = v33;
      if (self->_endTimeString)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence endTimeString](self, "endTimeString"));
        -[MonthViewOccurrence widthDrawingTime:textRect:](self, "widthDrawingTime:textRect:", v34, v27, v29, v31, v33);
        v36 = v35;

        v31 = v31 - v36;
        CalInterfaceIsLeftToRight(v37);
        v38 = -0.0;
        if (!v39)
          v38 = v36;
        v27 = v27 + v38;
      }
      if (self->_timeString)
      {
        v33 = v65;
        if (-[MonthViewOccurrence drawsTimeAtBottom](self, "drawsTimeAtBottom"))
        {
          -[MonthViewOccurrence timeFrameForFrame:](self, "timeFrameForFrame:", x, y, width, height);
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 1.0);
          v49 = v43 + v48;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTime](self, "attributedTime"));
          -[MonthViewOccurrence _drawString:inTextRect:withTrailingFade:](self, "_drawString:inTextRect:withTrailingFade:", v50, 0, v41, v49, v45, v47);

        }
        else
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence timeString](self, "timeString"));
          -[MonthViewOccurrence widthDrawingTime:textRect:](self, "widthDrawingTime:textRect:", v51, v27, v29, v31, v65);
          v53 = v52;

          v31 = v31 - v53;
          CalInterfaceIsLeftToRight(v54);
          v55 = -0.0;
          if (!v56)
            v55 = v53;
          v27 = v27 + v55;
        }
      }
      else
      {
        v33 = v65;
      }
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitle](self, "attributedTitle"));
    if (-[MonthViewOccurrence textWraps](self, "textWraps"))
      objc_msgSend(v57, "drawWithRect:options:context:", 33, 0, v27, v29, v31, v33);
    else
      -[MonthViewOccurrence _drawString:inTextRect:withTrailingFade:](self, "_drawString:inTextRect:withTrailingFade:", v57, self->_compact, v27, v29, v31, v33);

  }
LABEL_39:
  subOccurrences = self->_subOccurrences;
  if (subOccurrences)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v59 = subOccurrences;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v64, "occFrame");
          objc_msgSend(v64, "_drawInFrame:traitCollection:", v9);
        }
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v61);
    }

  }
  if (-[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge")
    || -[MonthViewOccurrence fadeRightEdge](self, "fadeRightEdge"))
  {
    CGContextRestoreGState(CurrentContext);
  }
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v10);

}

- (void)_updateOccurrenceWithForce:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *occurrenceString;
  double v10;
  uint64_t v11;
  NSString *v12;
  NSString *v13;
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
  if (v5 && (a3 || !self->_updateOccurrenceHasBeenCalled))
  {
    v14 = v5;
    -[MonthViewOccurrence _updateOccurrenceBackgroundParameters](self, "_updateOccurrenceBackgroundParameters");
    -[MonthViewOccurrence _updateColorsForUserInterfaceStyle:](self, "_updateColorsForUserInterfaceStyle:", self->_lastUserInterfaceStyle);
    -[MonthViewOccurrence _updateDotImage](self, "_updateDotImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent title](self->_occurrence, "title"));
    if (v6)
    {
      v7 = CUIKDisplayedTitleForEvent(self->_occurrence);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
      occurrenceString = self->_occurrenceString;
      self->_occurrenceString = v8;
    }
    else
    {
      *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
      occurrenceString = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](occurrenceString, "localizedStringForKey:value:table:", CFSTR("Untitled event"), CFSTR("New Event"), 0));
      v13 = self->_occurrenceString;
      self->_occurrenceString = v12;

    }
    -[MonthViewOccurrence _updateTimeStrings](self, "_updateTimeStrings");
    -[MonthViewOccurrence _updateSubviewsIfNeeded](self, "_updateSubviewsIfNeeded");
    self->_updateOccurrenceHasBeenCalled = 1;

    v5 = v14;
  }

}

- (void)_updateSubviewsIfNeeded
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_backgroundImageView)
  {
    if (-[MonthViewOccurrence _showBackground](self, "_showBackground"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence backgroundImage](self, "backgroundImage"));
      -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v3);

    }
    else
    {
      -[UIImageView setImage:](self->_backgroundImageView, "setImage:", 0);
    }
    -[UIImageView setClipsToBounds:](self->_backgroundImageView, "setClipsToBounds:", 1);
    v4 = -[MonthViewOccurrence backGroundCornerMask](self, "backGroundCornerMask");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_backgroundImageView, "layer"));
    objc_msgSend(v5, "setMaskedCorners:", v4);

    -[MonthViewOccurrence backgroundAlpha](self, "backgroundAlpha");
    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
    -[MonthViewOccurrence _updateDotImageView](self, "_updateDotImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitleForLabel](self, "attributedTitleForLabel"));
    -[TrailingFadeLabel setAttributedText:](self->_titleLabel, "setAttributedText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTitleForWrappingLabel](self, "attributedTitleForWrappingLabel"));
    -[UILabel setAttributedText:](self->_wrappingTitleLabel, "setAttributedText:", v7);

    if (self->_timeString)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence attributedTime](self, "attributedTime"));
      -[UILabel setAttributedText:](self->_timeLabel, "setAttributedText:", v8);

    }
  }
}

- (void)_updateDotImageView
{
  -[UIImageView setImage:](self->_dotImageView, "setImage:", self->_dotImage);
  -[UIImageView sizeToFit](self->_dotImageView, "sizeToFit");
}

- (BOOL)_showBackground
{
  _BOOL4 v2;

  if ((*((_BYTE *)self + 72) & 1) != 0 || self->_compact || (*((_BYTE *)self + 56) & 1) != 0)
    LOBYTE(v2) = 1;
  else
    return (*((unsigned __int8 *)self + 56) >> 1) & 1;
  return v2;
}

- (BOOL)isNarrow
{
  _BOOL4 v3;
  double height;
  double v5;

  v3 = -[MonthViewOccurrence compact](self, "compact");
  if (v3)
  {
    height = self->_occFrame.size.height;
    +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
    LOBYTE(v3) = height < v5;
  }
  return v3;
}

- (BOOL)textWraps
{
  _BOOL4 v3;
  double height;
  double v5;

  v3 = -[MonthViewOccurrence compact](self, "compact");
  if (v3)
  {
    height = self->_occFrame.size.height;
    +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
    LOBYTE(v3) = height > v5 + v5;
  }
  return v3;
}

- (BOOL)drawsTimeAtBottom
{
  _BOOL4 v3;
  double height;
  double v5;

  v3 = -[MonthViewOccurrence compact](self, "compact");
  if (v3)
  {
    v3 = -[MonthViewOccurrence textWraps](self, "textWraps");
    if (v3)
    {
      height = self->_occFrame.size.height;
      +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
      LOBYTE(v3) = height > v5 * 2.5;
    }
  }
  return v3;
}

- (double)radius
{
  double v3;
  double v4;
  double v5;

  -[MonthViewOccurrence bounds](self, "bounds");
  v4 = fmin(v3 * 0.5, 4.0);
  if ((*((_BYTE *)self + 56) & 1) != 0 && self->_compact && !-[MonthViewOccurrence isNarrow](self, "isNarrow"))
  {
    -[MonthViewOccurrence bounds](self, "bounds");
    return v5 * 0.5;
  }
  return v4;
}

- (void)relayoutSubviews
{
  double v3;
  void *v4;
  UILabel **p_wrappingTitleLabel;
  double v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UILabel **p_timeLabel;
  id *p_titleLabel;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL8 v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MidX;
  UILabel *v46;
  double v47;
  double v48;
  id v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  -[MonthViewOccurrence frame](self, "frame");
  if (v3 != 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));

    if (v4)
    {
      p_wrappingTitleLabel = &self->_wrappingTitleLabel;
      -[UILabel alpha](self->_wrappingTitleLabel, "alpha");
      v7 = v6 > 0.0;
      v8 = -[MonthViewOccurrence bounds](self, "bounds");
      v11 = CalRoundToScreenScale(v8, v9, v10);
      +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
      if (v11 >= v12)
      {
        if (self->_dotImage)
          -[UIImageView setAlpha:](self->_dotImageView, "setAlpha:", 1.0);
        if (-[MonthViewOccurrence textWraps](self, "textWraps"))
        {
          -[UILabel setAlpha:](*p_wrappingTitleLabel, "setAlpha:", 1.0);
          p_titleLabel = (id *)&self->_titleLabel;
          v7 = 1;
        }
        else
        {
          -[TrailingFadeLabel setAlpha:](self->_titleLabel, "setAlpha:", 1.0);
          p_titleLabel = (id *)&self->_wrappingTitleLabel;
        }
        v13 = 0.0;
        objc_msgSend(*p_titleLabel, "setAlpha:", 0.0);
        v16 = -[MonthViewOccurrence drawsTimeAtBottom](self, "drawsTimeAtBottom");
        p_timeLabel = &self->_timeLabel;
        if (v16)
          v13 = 1.0;
      }
      else
      {
        v13 = 0.0;
        -[TrailingFadeLabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
        -[UIImageView setAlpha:](self->_dotImageView, "setAlpha:", 0.0);
        -[UILabel setAlpha:](self->_timeLabel, "setAlpha:", 0.0);
        p_timeLabel = &self->_wrappingTitleLabel;
      }
      -[UILabel setAlpha:](*p_timeLabel, "setAlpha:", v13);
      -[MonthViewOccurrence backgroundInsets](self, "backgroundInsets");
      v18 = v17;
      v20 = v19;
      -[MonthViewOccurrence bounds](self, "bounds");
      v22 = v21 - v18 - v20;
      -[MonthViewOccurrence bounds](self, "bounds");
      -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v18, 0.0, v22);
      -[MonthViewOccurrence radius](self, "radius");
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_backgroundImageView, "layer"));
      objc_msgSend(v25, "setCornerRadius:", v24);

      -[MonthViewOccurrence bounds](self, "bounds");
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      -[MonthViewOccurrence bounds](self, "bounds");
      -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_dotImage);
      v27 = v26;
      v29 = v28;
      -[UIImage size](self->_dotImage, "size");
      v31 = v27 + v30 * 0.5;
      -[UIImage size](self->_dotImage, "size");
      -[UIImageView setCenter:](self->_dotImageView, "setCenter:", v31, v29 + v32 * 0.5);
      v33 = (*((_BYTE *)self + 56) & 1) != 0 && self->_splitLeftEdge;
      -[UIImageView setHidden:](self->_dotImageView, "setHidden:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrenceString](self, "occurrenceString"));

      if (v34)
      {
        -[MonthViewOccurrence bounds](self, "bounds");
        -[MonthViewOccurrence textFrameForFrame:](self, "textFrameForFrame:");
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        -[TrailingFadeLabel frame](self->_titleLabel, "frame");
        if (v40 == v44 && v42 == v43)
        {
          v64.origin.x = v36;
          v64.origin.y = v38;
          v64.size.width = v40;
          v64.size.height = v42;
          MidX = CGRectGetMidX(v64);
          v65.origin.x = v36;
          v65.origin.y = v38;
          v65.size.width = v40;
          v65.size.height = v42;
          -[TrailingFadeLabel setCenter:](self->_titleLabel, "setCenter:", MidX, CGRectGetMidY(v65));
        }
        else
        {
          -[TrailingFadeLabel setFrame:](self->_titleLabel, "setFrame:", v36, v38, v40, v42);
        }
        v46 = *p_wrappingTitleLabel;
        if (v7)
        {
          -[UILabel setHidden:](v46, "setHidden:", 0);
          -[UILabel setNumberOfLines:](*p_wrappingTitleLabel, "setNumberOfLines:", 0);
          -[UILabel sizeToFit](*p_wrappingTitleLabel, "sizeToFit");
          -[UILabel setNumberOfLines:](*p_wrappingTitleLabel, "setNumberOfLines:", 2);
          -[UILabel frame](*p_wrappingTitleLabel, "frame");
          if (v47 <= v42)
          {
            v49 = -[UILabel frame](*p_wrappingTitleLabel, "frame");
            v42 = v50;
            v48 = CalRoundToScreenScale(v49, v51, 1.25);
          }
          else
          {
            v48 = -1.5;
          }
          +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v48);
          -[UILabel setFrame:](*p_wrappingTitleLabel, "setFrame:", v36, v52, v40, v42);
        }
        else
        {
          -[UILabel setHidden:](v46, "setHidden:", 1);
        }
      }
      if (self->_timeString)
      {
        -[MonthViewOccurrence bounds](self, "bounds");
        -[MonthViewOccurrence timeFrameForFrame:](self, "timeFrameForFrame:");
        v54 = v53;
        v56 = v55;
        v58 = v57;
        v60 = v59;
        -[UILabel frame](self->_timeLabel, "frame");
        if (v58 == v62 && v60 == v61)
        {
          v66.origin.x = v54;
          v66.origin.y = v56;
          v66.size.width = v58;
          v66.size.height = v60;
          v63 = CGRectGetMidX(v66);
          v67.origin.x = v54;
          v67.origin.y = v56;
          v67.size.width = v58;
          v67.size.height = v60;
          -[UILabel setCenter:](self->_timeLabel, "setCenter:", v63, CGRectGetMidY(v67));
        }
        else
        {
          -[UILabel setFrame:](self->_timeLabel, "setFrame:", v54, v56, v58, v60);
        }
      }
      -[MonthViewOccurrence _updateFadeWidth](self, "_updateFadeWidth");
      -[MonthViewOccurrence _updateFadeVisibility](self, "_updateFadeVisibility");
      -[MonthViewOccurrence _updateFadeDirection](self, "_updateFadeDirection");
    }
  }
}

- (void)_updateFadeWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  -[MonthViewOccurrence bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  -[MonthViewOccurrence bounds](self, "bounds");
  v4 = -8.0 / v3;
  -[MonthViewOccurrence bounds](self, "bounds");
  v11[0] = &off_1001BCA60;
  v5 = v4 + 1.0;
  v7 = -0.0 / v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 + 1.0));
  v11[2] = v9;
  v11[3] = &off_1001BCA70;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));
  -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v10);

  -[CAGradientLayer setNeedsDisplay](self->_gradientLayer, "setNeedsDisplay");
}

- (void)_updateFadeDirection
{
  _BOOL8 v3;
  char v4;
  _BOOL8 v5;
  int v6;
  double v7;
  double v8;

  v3 = -[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge");
  if (v3 && (CalInterfaceIsLeftToRight(v3), (v4 & 1) != 0)
    || (v5 = -[MonthViewOccurrence fadeRightEdge](self, "fadeRightEdge")) && (CalInterfaceIsLeftToRight(v5), !v6))
  {
    v7 = 1.0;
    v8 = 0.0;
  }
  else
  {
    v7 = 0.0;
    v8 = 1.0;
  }
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v7, 0.0);
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", v8, 0.0);
}

- (void)_updateFadeVisibility
{
  CAGradientLayer *gradientLayer;
  void *v4;
  CAGradientLayer *v5;
  id v6;

  if (-[MonthViewOccurrence fadeLeftEdge](self, "fadeLeftEdge")
    || -[MonthViewOccurrence fadeRightEdge](self, "fadeRightEdge"))
  {
    gradientLayer = self->_gradientLayer;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](self, "layer"));
    v6 = v4;
    v5 = gradientLayer;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](self, "layer"));
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setMask:", v5);

}

- (unint64_t)backGroundCornerMask
{
  unint64_t v3;
  unint64_t result;

  if (self->_splitLeftEdge)
  {
    v3 = 0;
    result = 0;
    if (self->_splitRightEdge)
      return result;
    goto LABEL_3;
  }
  if (((uint64_t (*)(void))CalTimeDirectionIsLeftToRight)())
    v3 = 5;
  else
    v3 = 10;
  result = v3;
  if (!self->_splitRightEdge)
  {
LABEL_3:
    if (CalTimeDirectionIsLeftToRight(result, a2))
      return v3 | 0xA;
    else
      return v3 | 5;
  }
  return result;
}

- (double)backgroundAlpha
{
  double result;
  unsigned int v3;

  result = 1.0;
  if ((*((_BYTE *)self + 72) & 1) == 0)
  {
    v3 = -[MonthViewOccurrence isNarrow](self, "isNarrow", 1.0);
    result = 0.25;
    if (v3)
      return 1.0;
  }
  return result;
}

- (void)setDrawBackgroundWithLayer:(BOOL)a3
{
  _BOOL8 v3;
  UIView *v5;
  UIView *backgroundView;
  UIImageView **p_backgroundImageView;

  if (self->_drawBackgroundWithLayer != a3)
  {
    v3 = a3;
    self->_drawBackgroundWithLayer = a3;
    if (a3)
    {
      v5 = objc_opt_new(UIView);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      p_backgroundImageView = &self->_backgroundImageView;
      -[MonthViewOccurrence insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_backgroundView, self->_backgroundImageView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      p_backgroundImageView = &self->_backgroundImageView;
    }
    -[UIImageView setHidden:](*p_backgroundImageView, "setHidden:", v3);
  }
}

- (void)updateBackgroundWithEdgeInsets:(UIEdgeInsets)a3 color:(id)a4 alpha:(double)a5 cornerMask:(unint64_t)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v13 = a4;
  -[MonthViewOccurrence bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", left + v14, top + v15, v16 - (left + right), v17 - (top + bottom));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v13);

  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", a5);
  -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v18, "setMaskedCorners:", a6);

  -[MonthViewOccurrence radius](self, "radius");
  v20 = v19;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v21, "setCornerRadius:", v20);

}

- (void)_updateOccurrenceBackgroundParameters
{
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
  self->_invitationType = 0;
  v7 = (id)v3;
  v4 = CUIKEventParticipantStatusForDisplay();
  if ((v4 - 1) < 3)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
  v6 = objc_msgSend(v5, "status");

  if (v6 == (id)3)
  {
    v4 = 4;
LABEL_4:
    self->_invitationType = v4;
  }

}

- (void)_updateDotImage
{
  UIImage *dotImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  void *v11;
  UIImage *v12;
  UIImage *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImage *v22;
  void *v23;
  double v24;
  void *v25;
  UIImage *v26;
  UIImage *v27;
  UIImage *v28;
  UIImage *v29;
  UIColor *color;
  void *v31;
  void *v32;
  void *v33;
  UIImage *v34;
  UIImage *v35;
  _QWORD v36[5];
  _QWORD v37[2];

  if (qword_1001F66D0 != -1)
    dispatch_once(&qword_1001F66D0, &stru_1001B5B90);
  if (self->_compact
    && +[CompactMonthWeekView usesRoundedRectInsteadOfCircle](CompactMonthWeekView, "usesRoundedRectInsteadOfCircle"))
  {
    dotImage = self->_dotImage;
    self->_dotImage = 0;

    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

  if (!v5 || objc_msgSend(v5, "type") != (id)1)
  {
    v14 = *((_BYTE *)self + 56);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "CUIK_symbolName"));

    if ((v14 & 8) != 0)
    {
      if ((*((_BYTE *)self + 72) & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      }
      else
      {
        v18 = *((_BYTE *)self + 56);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
        v20 = v19;
        if ((v18 & 0x20) != 0)
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CUIK_symbolColor"));
        else
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CUIK_disabledSymbolColor"));
        v23 = (void *)v21;

      }
      -[UIFont pointSize](self->_font, "pointSize");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 2, v24 + -1.0));
      v26 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v16, v25));
      v27 = self->_dotImage;
      self->_dotImage = v26;

      v28 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage flattenedImageWithColor:](self->_dotImage, "flattenedImageWithColor:", v23));
      v29 = self->_dotImage;
      self->_dotImage = v28;

    }
    else
    {
      if (!v16 || !self->_color)
      {
        v22 = self->_dotImage;
        self->_dotImage = 0;

LABEL_25:
        goto LABEL_26;
      }
      if ((*((_BYTE *)self + 72) & 1) != 0)
        v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      else
        v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v23 = (void *)v17;
      color = self->_color;
      v37[0] = v17;
      v37[1] = color;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v31));

      -[UIFont pointSize](self->_font, "pointSize");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configurationByApplyingConfiguration:", v32));
      v34 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v16, v33));
      v35 = self->_dotImage;
      self->_dotImage = v34;

    }
    goto LABEL_25;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSemiConstantCache sharedInstance](CUIKSemiConstantCache, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "symbolImage:forFont:", v7, self->_font));
  v9 = self->_dotImage;
  self->_dotImage = v8;

  v10 = self->_dotImage;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage flattenedImageWithColor:](v10, "flattenedImageWithColor:", v11));
  v13 = self->_dotImage;
  self->_dotImage = v12;

LABEL_26:
  if (self->_dotImageView)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100109D30;
    v36[3] = &unk_1001B2538;
    v36[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v36);
  }

}

- (void)_updateTimeStrings
{
  NSString *timeString;
  NSString *endTimeString;
  NSString *v5;
  NSString *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  id v13;

  timeString = self->_timeString;
  self->_timeString = 0;

  endTimeString = self->_endTimeString;
  self->_endTimeString = 0;

  if (-[MonthViewOccurrence isSingleDay](self, "isSingleDay"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_occurrence, "startCalendarDate"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _timeString:](self, "_timeString:"));
    v6 = self->_timeString;
    self->_timeString = v5;
  }
  else
  {
    if (self->_splitRightEdge)
      return;
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ends %@"), &stru_1001B67C0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent endCalendarDate](self->_occurrence, "endCalendarDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence _timeString:](self, "_timeString:", v9));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v10));
    v12 = self->_endTimeString;
    self->_endTimeString = v11;

  }
}

- (void)setSelected:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 72);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 72) = v3 & 0xFE | a3;
    -[MonthViewOccurrence _updateColorsForUserInterfaceStyle:](self, "_updateColorsForUserInterfaceStyle:", self->_lastUserInterfaceStyle);
    -[MonthViewOccurrence _updateDotImage](self, "_updateDotImage");
  }
}

- (BOOL)selected
{
  MonthViewOccurrence **p_parent;
  id WeakRetained;
  id v5;
  unsigned __int8 v6;

  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (!WeakRetained)
    return *((_BYTE *)self + 72) & 1;
  v5 = objc_loadWeakRetained((id *)p_parent);
  v6 = objc_msgSend(v5, "selected");

  return v6;
}

- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3
{
  EKEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIColor **p_color;
  EKEvent *v14;

  v5 = self->_occurrence;
  v14 = v5;
  if ((*((_BYTE *)self + 56) & 4) == 0)
  {
    if ((*((_BYTE *)self + 56) & 8) != 0)
    {
      v11 = CUIKIntegrationEventBackgroundColor();
      v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v12 = CUIKAdjustedColorForColor(v6, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v5, "calendar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayColor"));
      v8 = CUIKAdjustedColorForColor(v7, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    }
    if (v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  v10 = CUIKBirthdayMonthCalendarColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v9)
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
LABEL_9:
  p_color = &self->_color;
  if (!*p_color || (objc_msgSend(v9, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_color, v9);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_occFrame;
  double v9;
  double v11;
  _BOOL4 v12;
  double v13;
  void *v14;
  void *v15;
  CALayer *v16;
  double MidX;
  CGFloat MidY;
  CALayer *glowLayer;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_occFrame = &self->_occFrame;
  if (!CGRectEqualToRect(a3, self->_occFrame))
  {
    v9 = p_occFrame->size.height;
    if (width == p_occFrame->size.width && height == v9)
    {
      p_occFrame->origin.x = x;
      p_occFrame->origin.y = y;
      p_occFrame->size.width = width;
      p_occFrame->size.height = height;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MidX = CGRectGetMidX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      MidY = CGRectGetMidY(v22);
      v20.receiver = self;
      v20.super_class = (Class)MonthViewOccurrence;
      -[MonthViewOccurrence setCenter:](&v20, "setCenter:", MidX, MidY);
      glowLayer = self->_glowLayer;
      -[MonthViewOccurrence bounds](self, "bounds");
      -[CALayer setFrame:](glowLayer, "setFrame:");
    }
    else
    {
      if (self->_color && self->_compact)
      {
        +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
        v12 = v9 >= v11;
        +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
        if (((v12 ^ (height < v13)) & 1) == 0)
        {
          p_occFrame->origin.x = x;
          p_occFrame->origin.y = y;
          p_occFrame->size.width = width;
          p_occFrame->size.height = height;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence backgroundImage](self, "backgroundImage"));
          -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v14);

          -[MonthViewOccurrence backgroundAlpha](self, "backgroundAlpha");
          -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
        }
      }
      p_occFrame->origin.x = x;
      p_occFrame->origin.y = y;
      p_occFrame->size.width = width;
      p_occFrame->size.height = height;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](self, "layer"));
      objc_msgSend(v15, "setFrame:", x, y, width, height);

      v16 = self->_glowLayer;
      -[MonthViewOccurrence bounds](self, "bounds");
      -[CALayer setFrame:](v16, "setFrame:");
      -[MonthViewOccurrence relayoutSubviews](self, "relayoutSubviews");
    }
  }
}

- (CGRect)occFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_occFrame.origin.x;
  y = self->_occFrame.origin.y;
  width = self->_occFrame.size.width;
  height = self->_occFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlpha:(double)a3
{
  objc_super v3;

  self->_occAlpha = a3;
  v3.receiver = self;
  v3.super_class = (Class)MonthViewOccurrence;
  -[MonthViewOccurrence setAlpha:](&v3, "setAlpha:");
}

- (double)occAlpha
{
  return self->_occAlpha;
}

- (void)setOccurrence:(id)a3
{
  EKEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  unsigned int v13;
  char v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  EKEvent *v24;

  v5 = (EKEvent *)a3;
  if (self->_occurrence != v5)
  {
    v24 = v5;
    objc_storeStrong((id *)&self->_occurrence, a3);
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFE | -[EKEvent isAllDay](v24, "isAllDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone calendarTimeZone](NSTimeZone, "calendarTimeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar CalGregorianCalendarForTimeZone:](NSCalendar, "CalGregorianCalendarForTimeZone:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startDate](v24, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent endDate](v24, "endDate"));
    if (objc_msgSend(v7, "cal_isMultidayEventForUIWithStartDate:endDate:", v8, v9))
      v10 = 2;
    else
      v10 = 0;
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFD | v10;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v24, "calendar"));
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFB | (4 * (objc_msgSend(v11, "type") == (id)4));

    if (-[EKEvent isReminderIntegrationEvent](v24, "isReminderIntegrationEvent"))
      v12 = 8;
    else
      v12 = 0;
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xF7 | v12;
    v13 = -[EKEvent completed](v24, "completed");
    v14 = 0;
    if (v13)
      v15 = 16;
    else
      v15 = 0;
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xEF | v15;
    if ((*((_BYTE *)self + 56) & 8) != 0)
    {
      if (-[EKEvent CUIK_reminderShouldBeEditable](v24, "CUIK_reminderShouldBeEditable"))
        v14 = 32;
      else
        v14 = 0;
    }
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xDF | v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v24, "calendar"));
    if (objc_msgSend(v16, "isHolidayCalendar"))
      v17 = 64;
    else
      v17 = 0;
    *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xBF | v17;

    if ((*((_BYTE *)self + 56) & 4) != 0)
    {
      *((_BYTE *)self + 56) |= 4u;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v24, "calendar"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "source"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appGroupIdentifier"));
      if ((objc_msgSend(v20, "isEqualToString:", EKSourceBirthdaysAppGroupID) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v24, "calendar"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "externalID"));
        if (objc_msgSend(v22, "isEqualToString:", EKBirthdayCalendarExternalIdentifier))
          v23 = 4;
        else
          v23 = 0;
        *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFB | v23;

      }
      else
      {
        *((_BYTE *)self + 56) &= ~4u;
      }

    }
    v5 = v24;
  }

}

- (id)occurrence
{
  return self->_occurrence;
}

- (void)updateView
{
  -[MonthViewOccurrence _updateOccurrenceWithForce:](self, "_updateOccurrenceWithForce:", 1);
}

- (void)setSplitLeftEdge:(BOOL)a3 splitRightEdge:(BOOL)a4
{
  _BOOL4 splitRightEdge;

  splitRightEdge = self->_splitRightEdge;
  self->_splitLeftEdge = a3;
  self->_splitRightEdge = a4;
  if (splitRightEdge != a4)
    -[MonthViewOccurrence _updateTimeStrings](self, "_updateTimeStrings");
}

- (id)lengthForSorting
{
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_dayRange.length);
}

- (unint64_t)length
{
  return self->_dayRange.length;
}

- (unint64_t)startRange
{
  return self->_dayRange.location;
}

- (unint64_t)endRange
{
  return self->_cachedEndRange;
}

- (unint64_t)gapBetweenBlock:(id)a3
{
  MonthViewOccurrence *v4;
  unint64_t v5;
  MonthViewOccurrence *v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;

  v4 = (MonthViewOccurrence *)a3;
  v5 = -[MonthViewOccurrence startRange](self, "startRange");
  if (v5 <= -[MonthViewOccurrence endRange](v4, "endRange"))
  {
    v7 = -[MonthViewOccurrence startRange](v4, "startRange");
    v8 = -[MonthViewOccurrence endRange](self, "endRange");
    v6 = v4;
    if (v7 <= v8)
    {
      v10 = -1;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = self;
    self = v4;
  }
  v9 = -[MonthViewOccurrence startRange](v6, "startRange");
  v10 = v9 - (_BYTE *)-[MonthViewOccurrence endRange](self, "endRange");
LABEL_6:

  return v10;
}

- (double)startTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (void)addSegmentWithFrame:(CGRect)a3 splitLeftEdge:(BOOL)a4 splitRightEdge:(BOOL)a5 fadeLeftEdge:(BOOL)a6 fadeRightEdge:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  MonthViewOccurrence *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *subOccurrences;
  MonthViewOccurrence *v20;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_subOccurrences)
  {
    v16 = [MonthViewOccurrence alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence occurrence](self, "occurrence"));
    v20 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isCompact:](v16, "initWithFrame:occurrence:forDayRange:isCompact:", v17, self->_dayRange.location, self->_dayRange.length, -[MonthViewOccurrence compact](self, "compact"), x, y, width, height);

    -[MonthViewOccurrence setParent:](v20, "setParent:", self);
    -[MonthViewOccurrence setHidden:](v20, "setHidden:", -[MonthViewOccurrence hidden](self, "hidden"));
    -[MonthViewOccurrence setSplitLeftEdge:splitRightEdge:](v20, "setSplitLeftEdge:splitRightEdge:", v10, v9);
    -[MonthViewOccurrence setFadeLeftEdge:](v20, "setFadeLeftEdge:", v8);
    -[MonthViewOccurrence setFadeRightEdge:](v20, "setFadeRightEdge:", v7);
    -[NSMutableArray addObject:](self->_subOccurrences, "addObject:", v20);

  }
  else
  {
    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subOccurrences = self->_subOccurrences;
    self->_subOccurrences = v18;

    -[MonthViewOccurrence setFrame:](self, "setFrame:", x, y, width, height);
    self->_splitLeftEdge = v10;
    self->_splitRightEdge = v9;
    -[MonthViewOccurrence setFadeLeftEdge:](self, "setFadeLeftEdge:", v8);
    -[MonthViewOccurrence setFadeRightEdge:](self, "setFadeRightEdge:", v7);
  }
}

- (void)resetSegments
{
  NSMutableArray *subOccurrences;

  subOccurrences = self->_subOccurrences;
  self->_subOccurrences = 0;

}

- (CGRect)intersectingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  NSMutableArray *subOccurrences;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *i;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MonthViewOccurrence frame](self, "frame");
  v45.origin.x = v8;
  v45.origin.y = v9;
  v45.size.width = v10;
  v45.size.height = v11;
  v33 = x;
  v34 = y;
  v42.origin.x = x;
  v42.origin.y = y;
  v35 = width;
  v36 = height;
  v42.size.width = width;
  v42.size.height = height;
  if (CGRectIntersectsRect(v42, v45))
  {
    -[MonthViewOccurrence frame](self, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    subOccurrences = self->_subOccurrences;
    if (subOccurrences)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = subOccurrences;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        v25 = CGRectZero.origin.y;
        v26 = CGRectZero.size.width;
        v27 = CGRectZero.size.height;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "intersectingRect:", v33, v34, v35, v36, *(_QWORD *)&v33, *(_QWORD *)&v34, *(_QWORD *)&v35, *(_QWORD *)&v36, (_QWORD)v37);
            v13 = v43.origin.x;
            v15 = v43.origin.y;
            v17 = v43.size.width;
            v19 = v43.size.height;
            v46.origin.x = CGRectZero.origin.x;
            v46.origin.y = v25;
            v46.size.width = v26;
            v46.size.height = v27;
            if (!CGRectEqualToRect(v43, v46))
            {

              goto LABEL_15;
            }
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v23)
            continue;
          break;
        }
      }

    }
    v13 = CGRectZero.origin.x;
    v15 = CGRectZero.origin.y;
    v17 = CGRectZero.size.width;
    v19 = CGRectZero.size.height;
  }
LABEL_15:
  v29 = v13;
  v30 = v15;
  v31 = v17;
  v32 = v19;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)isPointInView:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  NSMutableArray *subOccurrences;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat width;
  CGFloat height;
  void *i;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  CGPoint v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  -[MonthViewOccurrence frame](self, "frame");
  v27 = x;
  v28 = y;
  v34.x = x;
  v34.y = y;
  if (CGRectContainsPoint(v35, v34))
  {
    -[MonthViewOccurrence frame](self, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    subOccurrences = self->_subOccurrences;
    if (subOccurrences)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = subOccurrences;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        v19 = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        height = CGRectZero.size.height;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "isPointInView:", v27, v28, *(_QWORD *)&v27, *(_QWORD *)&v28, (_QWORD)v29);
            v7 = v36.origin.x;
            v9 = v36.origin.y;
            v11 = v36.size.width;
            v13 = v36.size.height;
            v38.origin.x = CGRectZero.origin.x;
            v38.origin.y = v19;
            v38.size.width = width;
            v38.size.height = height;
            if (!CGRectEqualToRect(v36, v38))
            {

              goto LABEL_15;
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v17)
            continue;
          break;
        }
      }

    }
    v7 = CGRectZero.origin.x;
    v9 = CGRectZero.origin.y;
    v11 = CGRectZero.size.width;
    v13 = CGRectZero.size.height;
  }
LABEL_15:
  v23 = v7;
  v24 = v9;
  v25 = v11;
  v26 = v13;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)isPointInSymbol:(CGPoint)a3
{
  double x;
  id v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;

  if (!self->_dotImage)
    return 0;
  x = a3.x;
  v5 = -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_occFrame.origin.x, self->_occFrame.origin.y, self->_occFrame.size.width, self->_occFrame.size.height);
  v7 = v6;
  *(_QWORD *)&v8 = CalInterfaceIsLeftToRight(v5).n128_u64[0];
  if (!v9)
    return x >= v7;
  -[UIImage size](self->_dotImage, "size", v8);
  return x <= v7 + v10;
}

- (BOOL)isTentative
{
  return self->_invitationType == 1;
}

- (BOOL)needsReply
{
  return self->_invitationType == 2;
}

- (BOOL)isDeclined
{
  return self->_invitationType == 3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (BOOL)drawsEmpty
{
  return self->_drawsEmpty;
}

- (void)setDrawsEmpty:(BOOL)a3
{
  self->_drawsEmpty = a3;
}

- (BOOL)splitLeftEdge
{
  return self->_splitLeftEdge;
}

- (void)setSplitLeftEdge:(BOOL)a3
{
  self->_splitLeftEdge = a3;
}

- (BOOL)splitRightEdge
{
  return self->_splitRightEdge;
}

- (void)setSplitRightEdge:(BOOL)a3
{
  self->_splitRightEdge = a3;
}

- (BOOL)fadeLeftEdge
{
  return self->_fadeLeftEdge;
}

- (void)setFadeLeftEdge:(BOOL)a3
{
  self->_fadeLeftEdge = a3;
}

- (BOOL)fadeRightEdge
{
  return self->_fadeRightEdge;
}

- (void)setFadeRightEdge:(BOOL)a3
{
  self->_fadeRightEdge = a3;
}

- (double)firstWidth
{
  return self->_firstWidth;
}

- (void)setFirstWidth:(double)a3
{
  self->_firstWidth = a3;
}

- (_NSRange)dayRange
{
  _NSRange *p_dayRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_dayRange = &self->_dayRange;
  location = self->_dayRange.location;
  length = p_dayRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDayRange:(_NSRange)a3
{
  self->_dayRange = a3;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (MonthViewOccurrence)parent
{
  return (MonthViewOccurrence *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (UIInteraction)appEntityInteraction
{
  return self->_appEntityInteraction;
}

- (void)setAppEntityInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_appEntityInteraction, a3);
}

- (BOOL)drawBackgroundWithLayer
{
  return self->_drawBackgroundWithLayer;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIImage)dotImage
{
  return self->_dotImage;
}

- (void)setDotImage:(id)a3
{
  objc_storeStrong((id *)&self->_dotImage, a3);
}

- (NSString)occurrenceString
{
  return self->_occurrenceString;
}

- (void)setOccurrenceString:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceString, a3);
}

- (NSString)timeString
{
  return self->_timeString;
}

- (void)setTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_timeString, a3);
}

- (NSString)endTimeString
{
  return self->_endTimeString;
}

- (void)setEndTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_endTimeString, a3);
}

- (BOOL)compact
{
  return self->_compact;
}

- (void)setCompact:(BOOL)a3
{
  self->_compact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeString, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_occurrenceString, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_appEntityInteraction, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_cachedTitleHeights, 0);
  objc_storeStrong((id *)&self->_cachedTimeColors, 0);
  objc_storeStrong((id *)&self->_cachedTitleColors, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_wrappingTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_dotImageView, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
  objc_storeStrong((id *)&self->_subOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
}

@end
