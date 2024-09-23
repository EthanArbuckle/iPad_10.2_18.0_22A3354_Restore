@implementation NCNotificationContentView

- (NCNotificationContentView)initWithStyle:(int64_t)a3
{
  NCNotificationContentView *v4;
  NCNotificationContentView *v5;
  UIEdgeInsets *p_contentInsets;
  objc_class *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  UIView *v11;
  UIView *contentView;
  NSMutableDictionary *v13;
  NSMutableDictionary *widthToFontToStringToMeasuredNumLines;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NCNotificationContentView;
  v4 = -[NCNotificationContentView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_lookStyle = a3;
    p_contentInsets = &v4->_contentInsets;
    -[NCNotificationContentView _contentInsetsForStyle:](v4, "_contentInsetsForStyle:", a3);
    *(_QWORD *)&p_contentInsets->top = v7;
    v5->_contentInsets.left = v8;
    v5->_contentInsets.bottom = v9;
    v5->_contentInsets.right = v10;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v5->_contentView;
    v5->_contentView = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    widthToFontToStringToMeasuredNumLines = v5->_widthToFontToStringToMeasuredNumLines;
    v5->_widthToFontToStringToMeasuredNumLines = v13;

    -[NCNotificationContentView addSubview:](v5, "addSubview:", v5->_contentView);
  }
  return v5;
}

- (double)_primaryTextBaselineOffsetWithBaseValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NCNotificationContentView _lazyPrimaryLabel](self, "_lazyPrimaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentView primaryText](self, "primaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  v9 = v8;

  return v9;
}

- (double)_secondaryTextBaselineOffsetWithBaseValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentView secondaryText](self, "secondaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v8), a3);
  v10 = v9;

  return v10;
}

- (double)_secondaryTextBaselineOffsetFromBottomWithBaseValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NCNotificationContentView _lazyPrimaryLabel](self, "_lazyPrimaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentView primaryText](self, "primaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  v9 = v8;

  return v9;
}

- (double)_summaryTextBaselineOffsetWithBaseValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NCNotificationContentView _lazySummaryLabel](self, "_lazySummaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentView summaryText](self, "summaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  v9 = v8;

  return v9;
}

- (UIEdgeInsets)_contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_contentInsetsForShortLook
{
  double v3;
  double v4;
  double v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAX;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v3 = 5.0;
  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v4 = 5.0;
  else
    v4 = 2.0;
  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v5 = 2.0;
  else
    v5 = 5.0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v7);

  v9 = 0.0;
  if (IsAX)
  {
    if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", 0.0))v4 = 5.0;
    else
      v4 = 2.0;
    if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v5 = 2.0;
    else
      v5 = 5.0;
    v9 = 28.0;
    v3 = 6.0;
  }
  v10 = v4;
  v11 = v3;
  v12 = v5;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)_contentInsetsForLongLook
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v3 = 15.0;
  else
    v3 = 17.0;
  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v4 = 17.0;
  else
    v4 = 15.0;
  v5 = 0.0;
  v6 = 16.0;
  v7 = v3;
  result.right = v4;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)_contentInsetsForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (a3 == 1)
    -[NCNotificationContentView _contentInsetsForLongLook](self, "_contentInsetsForLongLook");
  else
    -[NCNotificationContentView _contentInsetsForShortLook](self, "_contentInsetsForShortLook");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)topMarginToPrimaryLabelForCurrentStyle
{
  double result;
  _BOOL4 v3;

  result = 0.0;
  if (self->_lookStyle == 1)
  {
    v3 = -[NCNotificationContentView useSmallTopMargin](self, "useSmallTopMargin", 0.0);
    result = 8.0;
    if (v3)
      return -6.0;
  }
  return result;
}

- (double)_primaryTextBaselineOffsetForCurrentStyle
{
  double v2;
  void *v3;
  NSString *v4;

  v2 = 23.0;
  if (self->_lookStyle == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_NCSizeCategoryIsAX(v4))
      v2 = 22.0;
    else
      v2 = 20.0;

  }
  return v2;
}

- (double)_primarySubtitleTextBaselineOffsetForCurrentStyle
{
  int64_t lookStyle;
  void *v3;
  NSString *v4;
  _BOOL4 IsAX;
  double result;
  double v7;

  lookStyle = self->_lookStyle;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  result = 19.0;
  if (IsAX)
    result = 21.0;
  v7 = 20.0;
  if (IsAX)
    v7 = 22.0;
  if (lookStyle == 1)
    return v7;
  return result;
}

- (double)_secondaryTextBaselineOffsetForCurrentStyle
{
  int64_t lookStyle;
  void *v3;
  NSString *v4;
  _BOOL4 IsAX;
  double result;
  double v7;

  lookStyle = self->_lookStyle;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  result = 19.0;
  if (IsAX)
    result = 21.0;
  v7 = 20.0;
  if (IsAX)
    v7 = 22.0;
  if (lookStyle == 1)
    return v7;
  return result;
}

- (double)_summaryTextBaselineOffsetForCurrentStyle
{
  double v2;
  void *v3;
  NSString *v4;

  v2 = 0.0;
  if (self->_lookStyle != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_NCSizeCategoryIsAX(v4))
      v2 = 20.0;
    else
      v2 = 24.0;

  }
  return v2;
}

- (unint64_t)_primaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  NSString *v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;

  -[NCNotificationContentView primaryText](self, "primaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v10))
    v11 = -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines");
  else
    v11 = -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines");
  v12 = v11;

  if (v12 == 1)
    return v8;
  -[NCNotificationContentView _lazyPrimaryLabel](self, "_lazyPrimaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NCNotificationContentView _cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:](self, "_cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:", v15, v16, a3, a4);

  return v17;
}

- (unint64_t)_primaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  unint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v6))
  {
    if (!-[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines"))goto LABEL_10;
  }
  else if (!-[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines"))
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v8))
    v9 = -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines");
  else
    v9 = -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines");
  v10 = v9;

  if (a3 >= v10)
    a3 = v10;
LABEL_10:

  return a3;
}

- (CGRect)_primaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[NCNotificationContentView primaryText](self, "primaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[NCNotificationContentView _primaryTextBaselineOffsetForCurrentStyle](self, "_primaryTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    v8 = NCRectWithSize();
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (unint64_t)_primarySubtitleTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  NSString *v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;

  -[NCNotificationContentView primarySubtitleText](self, "primarySubtitleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v10))
    v11 = -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines");
  else
    v11 = -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines");
  v12 = v11;

  if (v12 == 1)
    return v8;
  -[NCNotificationContentView _lazyPrimarySubtitleLabel](self, "_lazyPrimarySubtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NCNotificationContentView _cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:](self, "_cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:", v15, v16, a3, a4);

  return v17;
}

- (unint64_t)_primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  unint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v6))
  {
    if (!-[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines"))goto LABEL_10;
  }
  else if (!-[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines"))
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (_NCSizeCategoryIsAX(v8))
    v9 = -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines");
  else
    v9 = -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines");
  v10 = v9;

  if (a3 >= v10)
    a3 = v10;
LABEL_10:

  return a3;
}

- (CGRect)_primarySubtitleLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[NCNotificationContentView primarySubtitleText](self, "primarySubtitleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[NCNotificationContentView _primarySubtitleTextBaselineOffsetForCurrentStyle](self, "_primarySubtitleTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    -[NCNotificationContentView primaryText](self, "primaryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      -[NCNotificationContentView _primaryTextBaselineOffsetForCurrentStyle](self, "_primaryTextBaselineOffsetForCurrentStyle");
      -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    }
    v10 = NCRectWithSize();
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (unint64_t)_secondaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentView secondaryText](self, "secondaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (a3 <= 0.0 || v9 == 0)
  {
    v14 = 0;
  }
  else
  {
    -[NCNotificationContentView secondaryText](self, "secondaryText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NCNotificationContentView _cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:](self, "_cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:", v12, v13, a3, a4);

  }
  return v14;
}

- (unint64_t)_secondaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  id v5;
  int64_t v6;
  unint64_t v7;

  v5 = -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
  v6 = -[NCNotificationContentView _secondaryTextNumberOfLines](self, "_secondaryTextNumberOfLines");
  if (a3 >= v6)
    v7 = v6;
  else
    v7 = a3;
  if (v6 <= 0)
    return a3;
  else
    return v7;
}

- (CGRect)_secondaryTextViewBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  double bottom;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  bottom = a4.bottom;
  -[NCNotificationContentView secondaryText](self, "secondaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[NCNotificationContentView _secondaryTextBaselineOffsetForCurrentStyle](self, "_secondaryTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _secondaryTextBaselineOffsetWithBaseValue:](self, "_secondaryTextBaselineOffsetWithBaseValue:");
    -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView secondaryText](self, "secondaryText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unui_effectiveLineHeightForText:", v12);

    -[NCNotificationContentView primaryText](self, "primaryText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      -[NCNotificationContentView _primaryTextBaselineOffsetForCurrentStyle](self, "_primaryTextBaselineOffsetForCurrentStyle");
      -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    }
    -[NCNotificationContentView _secondaryTextBaselineOffsetFromBottomWithBaseValue:](self, "_secondaryTextBaselineOffsetFromBottomWithBaseValue:", bottom);
    v15 = NCRectWithSize();
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)_summaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;

  -[NCNotificationContentView _lazySummaryLabel](self, "_lazySummaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (a3 <= 0.0 || v9 == 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v7, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCNotificationContentView _cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:](self, "_cachedNumberOfMeasuredLinesForText:withFont:forWidth:scale:", v11, v12, a3, a4);

  }
  return v13;
}

- (unint64_t)_summaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  if (a3 >= 2)
    return 2;
  else
    return a3;
}

- (CGRect)_summaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[NCNotificationContentView summaryText](self, "summaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[NCNotificationContentView _summaryTextBaselineOffsetForCurrentStyle](self, "_summaryTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _summaryTextBaselineOffsetWithBaseValue:](self, "_summaryTextBaselineOffsetWithBaseValue:");
    -[NCNotificationContentView _lazySummaryLabel](self, "_lazySummaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView summaryText](self, "summaryText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unui_effectiveLineHeightForText:", v10);

    v11 = NCRectWithSize();
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_invalidateNumberOfLinesCache
{
  -[NSMutableDictionary removeAllObjects](self->_widthToFontToStringToMeasuredNumLines, "removeAllObjects");
}

- (void)_clearCacheForFont:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary allKeys](self->_widthToFontToStringToMeasuredNumLines, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v5)
  {
    -[NSMutableDictionary objectForKey:](self->_widthToFontToStringToMeasuredNumLines, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

  }
}

- (unint64_t)_cachedNumberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forWidth:(double)a5 scale:(double)a6
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "length");
  v12 = v11 != 0;
  if (a5 > 0.0 && v11 != 0)
  {
    UIFloorToScale();
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_widthToFontToStringToMeasuredNumLines, "objectForKey:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NCNotificationContentView _invalidateNumberOfLinesCache](self, "_invalidateNumberOfLinesCache");
      -[NSMutableDictionary setObject:forKey:](self->_widthToFontToStringToMeasuredNumLines, "setObject:forKey:", v17, v16);
    }
    objc_msgSend(v17, "objectForKey:", v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v17, "setObject:forKey:", v18, v10);
    }
    objc_msgSend(v18, "objectForKey:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v12 = objc_msgSend(v19, "unsignedIntegerValue");
    }
    else
    {
      v12 = -[NCNotificationContentView _numberOfMeasuredLinesForText:withFont:forSize:](self, "_numberOfMeasuredLinesForText:withFont:forSize:", v9, v10, v15, 1.79769313e308);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v21, v9);

    }
  }

  return v12;
}

- (unint64_t)_numberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  NSStringDrawingContext *v11;
  NSStringDrawingContext *drawingContext;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  _QWORD v17[2];

  height = a5.height;
  width = a5.width;
  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!self->_drawingContext)
  {
    v11 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E0DC12A0]);
    drawingContext = self->_drawingContext;
    self->_drawingContext = v11;

    -[NSStringDrawingContext setWantsNumberOfLineFragments:](self->_drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  v16 = *MEMORY[0x1E0DC1138];
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v13, self->_drawingContext, width, height);

  v14 = -[NSStringDrawingContext numberOfLineFragments](self->_drawingContext, "numberOfLineFragments");
  return v14;
}

- (CGSize)_sizeThatFits:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  CGFloat Height;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  CGFloat width;
  CGSize result;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  if (a3.width <= 0.0)
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_23;
  }
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  if (self->_lookStyle)
  {
    v9 = *MEMORY[0x1E0DC49E8];
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v11 = *MEMORY[0x1E0D7D418];
    v9 = 0.0;
    v12 = *MEMORY[0x1E0D7D418];
    v10 = *MEMORY[0x1E0D7D418];
  }
  v40 = v9;
  width = a3.width;
  v15 = NCSizeApplyInsets(a3.width, a3.height, v9, v10, v12, v11);
  v17 = NCSizeApplyInsets(v15, v16, top, left, bottom, right);
  -[NCNotificationContentView thumbnail](self, "thumbnail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

LABEL_9:
    if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v20 = 50.0;
    else
      v20 = 35.0;
    v21 = -[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v22 = 15.0;
    if (v21)
      v22 = 0.0;
    v17 = v17 - (v20 + v22);
    goto LABEL_15;
  }
  -[NCNotificationContentView accessoryView](self, "accessoryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    goto LABEL_9;
LABEL_15:
  -[NCNotificationContentView window](self, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v12;
  if (v23)
  {
    -[NCNotificationContentView window](self, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = v26;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    v27 = v28;
  }

  v29 = -[NCNotificationContentView _primaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_primaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _primaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_primaryTextMeasuredNumberOfLinesForWidth:scale:", v17, v27));
  v30 = -[NCNotificationContentView _primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _primarySubtitleTextMeasuredNumberOfLinesForWidth:scale:](self, "_primarySubtitleTextMeasuredNumberOfLinesForWidth:scale:", v17, v27));
  v31 = -[NCNotificationContentView _secondaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_secondaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _secondaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_secondaryTextMeasuredNumberOfLinesForWidth:scale:", v17, v27));
  v32 = -[NCNotificationContentView _summaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_summaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _summaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_summaryTextMeasuredNumberOfLinesForWidth:scale:", v17, v27));
  -[NCNotificationContentView topMarginToPrimaryLabelForCurrentStyle](self, "topMarginToPrimaryLabelForCurrentStyle");
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  -[NCNotificationContentView _primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v29, v17, 1.79769313e308, top, left, bottom, right);
  CGRectGetHeight(v43);
  -[NCNotificationContentView _primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:", v30, v17, 1.79769313e308, top, left, bottom, right);
  CGRectGetHeight(v44);
  -[NCNotificationContentView _secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:](self, "_secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:", v31, v17, 1.79769313e308, top, left, bottom, right);
  Height = CGRectGetHeight(v45);
  v34 = right;
  v35 = bottom;
  v36 = Height;
  -[NCNotificationContentView _summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v32, v17, 1.79769313e308, top, left, v35, v34);
  CGRectGetHeight(v46);
  if (fabs(v36) < 2.22044605e-16)
    -[NCNotificationContentView _secondaryTextBaselineOffsetFromBottomWithBaseValue:](self, "_secondaryTextBaselineOffsetFromBottomWithBaseValue:", v35);
  -[NCNotificationContentView thumbnail](self, "thumbnail");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    -[NCNotificationContentView accessoryView](self, "accessoryView");

  }
  UIRoundToViewScale();
  v14 = v39 + v40 + v38;
  v13 = width;
LABEL_23:
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[NCNotificationContentView _sizeThatFits:withContentInsets:](self, "_sizeThatFits:withContentInsets:", a3.width, a3.height, self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateContentInsets
{
  UIEdgeInsets *p_contentInsets;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  p_contentInsets = &self->_contentInsets;
  -[NCNotificationContentView _contentInsetsForStyle:](self, "_contentInsetsForStyle:", self->_lookStyle);
  p_contentInsets->top = v3;
  p_contentInsets->left = v4;
  p_contentInsets->bottom = v5;
  p_contentInsets->right = v6;
}

- (void)_updateTextAttributesForPrimaryLabel:(id)a3 withStyle:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAX;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  unint64_t v17;
  id v18;

  v6 = a3;
  if (v6)
  {
    v18 = v6;
    if (a4 == 1)
    {
      v7 = (id)*MEMORY[0x1E0DC4AD0];
      v8 = 8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeCategory");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAX = _NCSizeCategoryIsAX(v10);
      v12 = (id *)MEMORY[0x1E0DC4A88];
      if (!IsAX)
        v12 = (id *)MEMORY[0x1E0DC4B10];
      v7 = *v12;

      v8 = 12;
    }
    -[NCNotificationContentView fontProvider](self, "fontProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredFontForTextStyle:hiFontStyle:", v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v14);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_NCSizeCategoryIsAX(v16))
      v17 = -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self, "maximumNumberOfPrimaryLargeTextLines");
    else
      v17 = -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self, "maximumNumberOfPrimaryTextLines");
    objc_msgSend(v18, "setNumberOfLines:", v17);

    v6 = v18;
  }

}

- (void)_updateStyleForPrimaryLabel:(id)a3 withStyle:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "mt_removeAllVisualStyling");
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

  }
  else
  {
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", v7, 0);
  }

}

- (id)_newPrimaryLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", v3, self->_lookStyle);
  return v3;
}

- (id)_lazyPrimaryLabel
{
  UILabel *primaryLabel;
  UILabel *v4;
  UILabel *v5;

  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    v4 = -[NCNotificationContentView _newPrimaryLabel](self, "_newPrimaryLabel");
    v5 = self->_primaryLabel;
    self->_primaryLabel = v4;

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_primaryLabel);
    -[NCNotificationContentView _updateStyleForPrimaryLabel:withStyle:](self, "_updateStyleForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
    primaryLabel = self->_primaryLabel;
  }
  return primaryLabel;
}

- (NSString)primaryText
{
  return -[UILabel text](self->_primaryLabel, "text");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NCNotificationContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationContentView _lazyPrimaryLabel](self, "_lazyPrimaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _clearCacheForFont:](self, "_clearCacheForFont:", v7);

    objc_msgSend(v6, "setText:", v8);
    self->_hasUpdatedContent = 1;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)_lazyPrimarySubtitleLabel
{
  UILabel *primarySubtitleLabel;
  UILabel *v4;
  UILabel *v5;

  primarySubtitleLabel = self->_primarySubtitleLabel;
  if (!primarySubtitleLabel)
  {
    v4 = -[NCNotificationContentView _newPrimaryLabel](self, "_newPrimaryLabel");
    v5 = self->_primarySubtitleLabel;
    self->_primarySubtitleLabel = v4;

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_primarySubtitleLabel);
    -[NCNotificationContentView _updateStyleForPrimaryLabel:withStyle:](self, "_updateStyleForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
    primarySubtitleLabel = self->_primarySubtitleLabel;
  }
  return primarySubtitleLabel;
}

- (NSString)primarySubtitleText
{
  return -[UILabel text](self->_primarySubtitleLabel, "text");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NCNotificationContentView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationContentView _lazyPrimarySubtitleLabel](self, "_lazyPrimarySubtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _clearCacheForFont:](self, "_clearCacheForFont:", v7);

    objc_msgSend(v6, "setText:", v8);
    self->_hasUpdatedContent = 1;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)_lazyThumbnailImageView
{
  UIImageView *thumbnailImageView;
  UIImageView *v4;
  UIImageView *v5;

  thumbnailImageView = self->_thumbnailImageView;
  if (!thumbnailImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_thumbnailImageView;
    self->_thumbnailImageView = v4;

    -[UIImageView setClipsToBounds:](self->_thumbnailImageView, "setClipsToBounds:", 1);
    -[NCNotificationContentView _configureThumbnailAsContactImage:](self, "_configureThumbnailAsContactImage:", -[NCNotificationContentView isThumbnailContactImage](self, "isThumbnailContactImage"));
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_thumbnailImageView);
    -[NCNotificationContentView _updateContentModeForThumbnailImage:](self, "_updateContentModeForThumbnailImage:", self->_thumbnailImageView);
    -[NCNotificationContentView _updateStyleForThumbnailImage:withStyle:](self, "_updateStyleForThumbnailImage:withStyle:", self->_thumbnailImageView, self->_lookStyle);
    thumbnailImageView = self->_thumbnailImageView;
  }
  return thumbnailImageView;
}

- (void)_updateTextAttributesForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAX;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  unint64_t v15;
  id v16;

  v5 = a3;
  if (v5)
  {
    v16 = v5;
    if (self->_lookStyle == 1)
    {
      v6 = (id)*MEMORY[0x1E0DC4A88];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAX = _NCSizeCategoryIsAX(v8);
      v10 = (id *)MEMORY[0x1E0DC4A88];
      if (!IsAX)
        v10 = (id *)MEMORY[0x1E0DC4B10];
      v6 = *v10;

    }
    -[NCNotificationContentView fontProvider](self, "fontProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontForTextStyle:hiFontStyle:", v6, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_NCSizeCategoryIsAX(v14))
      v15 = -[NCNotificationContentView maximumNumberOfSecondaryLargeTextLines](self, "maximumNumberOfSecondaryLargeTextLines");
    else
      v15 = -[NCNotificationContentView maximumNumberOfSecondaryTextLines](self, "maximumNumberOfSecondaryTextLines");
    objc_msgSend(v16, "nc_setNumberOfLines:", v15);

    v5 = v16;
  }

}

- (unint64_t)_secondaryTextNumberOfLines
{
  void *v2;
  unint64_t v3;

  if (self->_lookStyle != 1)
    return -[UILabel numberOfLines](self->_secondaryLabel, "numberOfLines");
  -[UITextView textContainer](self->_secondaryTextView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  void *v4;
  NSString *v5;
  BOOL IsAX;

  if (self->_maximumNumberOfPrimaryTextLines != a3)
  {
    self->_maximumNumberOfPrimaryTextLines = a3;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAX = _NCSizeCategoryIsAX(v5);

    if (!IsAX)
    {
      -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
      -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
    }
  }
}

- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAX;

  if (self->_maximumNumberOfPrimaryLargeTextLines != a3)
  {
    self->_maximumNumberOfPrimaryLargeTextLines = a3;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAX = _NCSizeCategoryIsAX(v5);

    if (IsAX)
    {
      -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
      -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
    }
  }
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  void *v4;
  NSString *v5;
  BOOL IsAX;
  id v7;

  if (self->_maximumNumberOfSecondaryTextLines != a3)
  {
    self->_maximumNumberOfSecondaryTextLines = a3;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAX = _NCSizeCategoryIsAX(v5);

    if (!IsAX)
    {
      -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v7, self->_lookStyle);

    }
  }
}

- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAX;
  id v7;

  if (self->_maximumNumberOfSecondaryLargeTextLines != a3)
  {
    self->_maximumNumberOfSecondaryLargeTextLines = a3;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAX = _NCSizeCategoryIsAX(v5);

    if (IsAX)
    {
      -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v7, self->_lookStyle);

    }
  }
}

- (void)_updateStyleForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "mt_removeAllVisualStyling");
    if (self->_lookStyle == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTextColor:", v6);

    }
    else
    {
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", v7, 0);
    }
    v5 = v7;
  }

}

- (void)_configureTextSupportingView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setContentMode:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)_newSecondaryLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  objc_msgSend(v3, "_setTextAlignmentFollowsWritingDirection:", 1);
  -[NCNotificationContentView _configureTextSupportingView:](self, "_configureTextSupportingView:", v3);
  -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v3, self->_lookStyle);
  return v3;
}

- (id)_newSecondaryTextView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setSelectable:", self->_lookStyle == 1);
  objc_msgSend(v3, "setDataDetectorTypes:", 3);
  objc_msgSend(v3, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  -[NCNotificationContentView _configureTextSupportingView:](self, "_configureTextSupportingView:", v3);
  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v3, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 4);

  -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v3, self->_lookStyle);
  objc_msgSend(v3, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSynchronizesAlignmentToDirection:", 1);

  objc_msgSend(v3, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLimitsLayoutForSuspiciousContents:", 1);

  if (self->_lookStyle == 1)
    objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (id)_secondaryTextSupportingView
{
  int *v2;

  if (self->_lookStyle == 1)
    v2 = &OBJC_IVAR___NCNotificationContentView__secondaryTextView;
  else
    v2 = &OBJC_IVAR___NCNotificationContentView__secondaryLabel;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)_lazySecondaryLabel
{
  UILabel *secondaryLabel;
  UILabel *v4;
  UILabel *v5;

  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    if (self->_lookStyle == 1)
    {
      secondaryLabel = 0;
    }
    else
    {
      v4 = -[NCNotificationContentView _newSecondaryLabel](self, "_newSecondaryLabel");
      v5 = self->_secondaryLabel;
      self->_secondaryLabel = v4;

      -[UIView addSubview:](self->_contentView, "addSubview:", self->_secondaryLabel);
      -[NCNotificationContentView _updateStyleForSecondaryTextSupportingView:withStyle:](self, "_updateStyleForSecondaryTextSupportingView:withStyle:", self->_secondaryLabel, self->_lookStyle);
      secondaryLabel = self->_secondaryLabel;
    }
  }
  return secondaryLabel;
}

- (id)_lazySecondaryTextView
{
  UITextView *secondaryTextView;
  UITextView *v4;
  UITextView *v5;

  secondaryTextView = self->_secondaryTextView;
  if (!secondaryTextView)
  {
    if (self->_lookStyle == 1)
    {
      v4 = -[NCNotificationContentView _newSecondaryTextView](self, "_newSecondaryTextView");
      v5 = self->_secondaryTextView;
      self->_secondaryTextView = v4;

      -[UIView addSubview:](self->_contentView, "addSubview:", self->_secondaryTextView);
      -[NCNotificationContentView _updateStyleForSecondaryTextSupportingView:withStyle:](self, "_updateStyleForSecondaryTextSupportingView:withStyle:", self->_secondaryTextView, self->_lookStyle);
      secondaryTextView = self->_secondaryTextView;
    }
    else
    {
      secondaryTextView = 0;
    }
  }
  return secondaryTextView;
}

- (id)_lazySecondaryTextSupportingView
{
  void *v3;

  -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_lookStyle == 1)
      -[NCNotificationContentView _lazySecondaryTextView](self, "_lazySecondaryTextView");
    else
      -[NCNotificationContentView _lazySecondaryLabel](self, "_lazySecondaryLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSAttributedString)secondaryText
{
  void *v2;
  void *v3;

  -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NCNotificationContentView secondaryText](self, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _clearCacheForFont:](self, "_clearCacheForFont:", v7);

    -[NCNotificationContentView _lazySecondaryTextSupportingView](self, "_lazySecondaryTextSupportingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v10);
    objc_msgSend(v8, "setTextColor:", v9);
    -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v8, self->_lookStyle);
    self->_hasUpdatedContent = 1;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_updateTextAttributesForSummaryLabel:(id)a3 withStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v7 = a3;
    -[NCNotificationContentView fontProvider](self, "fontProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    objc_msgSend(v7, "setNumberOfLines:", 2);
  }
}

- (void)_updateStyleForSummaryLabel:(id)a3 withStyle:(int64_t)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "mt_removeAllVisualStyling");
  -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", v5, 1);

}

- (id)_newSummaryLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D01920]);
  -[NCNotificationContentView _updateTextAttributesForSummaryLabel:withStyle:](self, "_updateTextAttributesForSummaryLabel:withStyle:", v3, self->_lookStyle);
  return v3;
}

- (id)_lazySummaryLabel
{
  BSUIEmojiLabelView *summaryLabel;
  BSUIEmojiLabelView *v4;
  BSUIEmojiLabelView *v5;

  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    v4 = -[NCNotificationContentView _newSummaryLabel](self, "_newSummaryLabel");
    v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    -[NCNotificationContentView _updateStyleForSummaryLabel:withStyle:](self, "_updateStyleForSummaryLabel:withStyle:", self->_summaryLabel, self->_lookStyle);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_summaryLabel);
    -[BSUIEmojiLabelView setAccessibilityIdentifier:](self->_summaryLabel, "setAccessibilityIdentifier:", CFSTR("summary-label"));
    summaryLabel = self->_summaryLabel;
  }
  return summaryLabel;
}

- (NSString)summaryText
{
  return (NSString *)-[BSUIEmojiLabelView text](self->_summaryLabel, "text");
}

- (void)setSummaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NCNotificationContentView summaryText](self, "summaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationContentView _lazySummaryLabel](self, "_lazySummaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _clearCacheForFont:](self, "_clearCacheForFont:", v7);

    objc_msgSend(v6, "setText:", v8);
    self->_hasUpdatedContent = 1;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (UIImage)thumbnail
{
  return -[UIImageView image](self->_thumbnailImageView, "image");
}

- (void)setThumbnail:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NCNotificationContentView thumbnail](self, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationContentView _lazyThumbnailImageView](self, "_lazyThumbnailImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);
    -[NCNotificationContentView _updateContentModeForThumbnailImage:](self, "_updateContentModeForThumbnailImage:", self->_thumbnailImageView);
    -[NCNotificationContentView _updateStyleForThumbnailImage:withStyle:](self, "_updateStyleForThumbnailImage:withStyle:", self->_thumbnailImageView, self->_lookStyle);
    self->_hasUpdatedContent = 1;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setThumbnailIsContactImage:(BOOL)a3
{
  if (self->_thumbnailIsContactImage != a3)
  {
    self->_thumbnailIsContactImage = a3;
    -[NCNotificationContentView _configureThumbnailAsContactImage:](self, "_configureThumbnailAsContactImage:");
  }
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return 0;
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return 0;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return 0;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (void)_updateContentModeForThumbnailImage:(id)a3
{
  UIImageView *thumbnailImageView;
  uint64_t v4;
  id v5;

  thumbnailImageView = self->_thumbnailImageView;
  objc_msgSend(a3, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSymbolImage"))
    v4 = 4;
  else
    v4 = 1;
  -[UIImageView setContentMode:](thumbnailImageView, "setContentMode:", v4);

}

- (void)_updateStyleForThumbnailImage:(id)a3 withStyle:(int64_t)a4
{
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "mt_removeAllVisualStyling");
  objc_msgSend(v8, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSymbolImage");

  if (a4 != 1 && v7)
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", v8, 0);

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *accessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  v7 = v5;
  if (accessoryView != v5)
  {
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[UIView addSubview:](self->_contentView, "addSubview:", v7);
  }

}

- (void)setUseSmallTopMargin:(BOOL)a3
{
  if (self->_useSmallTopMargin != a3)
  {
    self->_useSmallTopMargin = a3;
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BSUIFontProvider)fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[NCNotificationContentView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (void)setFontProvider:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fontProvider, a3);
    -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
    -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
    -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v5, self->_lookStyle);

    -[NCNotificationContentView _updateTextAttributesForSummaryLabel:withStyle:](self, "_updateTextAttributesForSummaryLabel:withStyle:", self->_summaryLabel, self->_lookStyle);
    -[NCNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGRect)_frameForThumbnailInRect:(CGRect)a3 withContentViewInsets:(UIEdgeInsets)a4
{
  double right;
  double left;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  right = a4.right;
  left = a4.left;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom))
  {
    v11 = -[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v12 = 0.0;
    if (v11)
      v12 = 15.0;
    v13 = v12 - left;
  }
  else
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v14 = CGRectGetWidth(v21);
    if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v15 = 15.0;
    else
      v15 = 0.0;
    v16 = v14 - v15 + -35.0;
    if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v17 = 0.0;
    else
      v17 = 15.0;
    v13 = v16 - v17 - right;
  }
  v18 = 35.0;
  v19 = 0.0;
  v20 = 35.0;
  result.size.height = v20;
  result.size.width = v18;
  result.origin.y = v19;
  result.origin.x = v13;
  return result;
}

- (void)_configureThumbnailAsContactImage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD *v8;
  id v9;

  v3 = a3;
  -[UIImageView layer](self->_thumbnailImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 17.5;
  if (v3)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CD2A60];
  }
  else
  {
    v7 = 3.0;
    v8 = (_QWORD *)MEMORY[0x1E0CD2A68];
  }
  objc_msgSend(v5, "setCornerRadius:", v7);

  -[UIImageView layer](self->_thumbnailImageView, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerCurve:", *v8);

}

- (void)layoutSubviews
{
  _QWORD v3[5];
  CGRect v4;

  -[NCNotificationContentView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__NCNotificationContentView_layoutSubviews__block_invoke;
    v3[3] = &unk_1E8D1B568;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
    if (self->_hasUpdatedContent)
    {
      -[NCNotificationContentView pl_performCrossFadeIfNecessary](self, "pl_performCrossFadeIfNecessary");
      self->_hasUpdatedContent = 0;
    }
  }
}

uint64_t __43__NCNotificationContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviews");
}

- (void)_layoutSubviews
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double left;
  double right;
  int v37;
  double v38;
  int v39;
  double v40;
  double v41;
  int v42;
  unint64_t v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  unint64_t v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  char v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  unint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  UITextView *secondaryTextView;
  UITextView *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  unint64_t v111;
  CGFloat v112;
  double v114;
  double v115;
  CGFloat MinY;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  CGFloat v148;
  double v149;
  double v150;
  double rect;
  id v152;
  double v153;
  double Width;
  double v155;
  CGFloat v156;
  double v157;
  double v158;
  double bottom;
  double top;
  double v161;
  double v162;
  double v163;
  double v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;

  -[NCNotificationContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationContentView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NCNotificationContentView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v15 = v16;
  }
  v161 = v15;

  if (self->_lookStyle)
  {
    v17 = *MEMORY[0x1E0DC49E8];
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v19 = *MEMORY[0x1E0D7D418];
    v17 = 0.0;
    v20 = *MEMORY[0x1E0D7D418];
    v18 = *MEMORY[0x1E0D7D418];
  }
  NCRectApplyInsets();
  v149 = v22;
  v150 = v21;
  v163 = v24;
  v164 = v23;
  -[NCNotificationContentView thumbnail](self, "thumbnail");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    -[NCNotificationContentView accessoryView](self, "accessoryView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v42 = 0;
      v155 = *MEMORY[0x1E0C9D648];
      v157 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      rect = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v148 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      left = self->_contentInsets.left;
      right = self->_contentInsets.right;
      bottom = self->_contentInsets.bottom;
      top = self->_contentInsets.top;
      goto LABEL_19;
    }
  }
  -[NCNotificationContentView _frameForThumbnailInRect:withContentViewInsets:](self, "_frameForThumbnailInRect:withContentViewInsets:", v4, v6, v8, v10, v17, v18, v20, v19);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  left = self->_contentInsets.left;
  top = self->_contentInsets.top;
  right = self->_contentInsets.right;
  bottom = self->_contentInsets.bottom;
  v37 = -[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (-[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v38 = 50.0;
  else
    v38 = 35.0;
  v39 = -[NCNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v40 = 15.0;
  if (v39)
    v40 = 0.0;
  v41 = v38 + v40;
  v155 = v28;
  v157 = v30;
  rect = v32;
  v148 = v34;
  if (v37)
    left = left + v41;
  else
    right = right + v41;
  v42 = 1;
LABEL_19:
  v162 = left;
  NCRectApplyInsets();
  Width = CGRectGetWidth(v165);
  v43 = -[NCNotificationContentView _primaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_primaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _primaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_primaryTextMeasuredNumberOfLinesForWidth:scale:", Width, v161));
  v153 = right;
  -[NCNotificationContentView _primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v43, v164, v163, top, left, bottom, right);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[UILabel setBounds:](self->_primaryLabel, "setBounds:");
  -[NCNotificationContentView topMarginToPrimaryLabelForCurrentStyle](self, "topMarginToPrimaryLabelForCurrentStyle");
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  -[NCNotificationContentView _primaryTextBaselineOffsetForCurrentStyle](self, "_primaryTextBaselineOffsetForCurrentStyle");
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_primaryLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v166.origin.x = v45;
  v166.origin.y = v47;
  v166.size.width = v49;
  v166.size.height = v51;
  CGRectGetWidth(v166);
  v167.origin.x = v45;
  v167.origin.y = v47;
  v167.size.width = v49;
  v167.size.height = v51;
  CGRectGetHeight(v167);
  UIRectIntegralWithScale();
  v146 = v53;
  v147 = v52;
  v144 = v55;
  v145 = v54;
  if (v43)
    v56 = v42;
  else
    v56 = 0;
  if (v56 == 1)
  {
    -[UILabel font](self->_primaryLabel, "font");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "capHeight");
    UICeilToScale();
    v157 = v58;

LABEL_25:
    v59 = right;
    -[UILabel font](self->_primaryLabel, "font");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView primaryText](self, "primaryText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "unui_effectiveLineHeightForText:", v61);

    goto LABEL_26;
  }
  if (v43)
    goto LABEL_25;
  v59 = right;
LABEL_26:
  v62 = -[NCNotificationContentView _primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _primarySubtitleTextMeasuredNumberOfLinesForWidth:scale:](self, "_primarySubtitleTextMeasuredNumberOfLinesForWidth:scale:", Width, v161));
  -[NCNotificationContentView _primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:", v62, v164, v163, top, v162, bottom, v59);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  -[UILabel setBounds:](self->_primarySubtitleLabel, "setBounds:");
  if (v43)
  {
    -[NCNotificationContentView _primarySubtitleTextBaselineOffsetForCurrentStyle](self, "_primarySubtitleTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  }
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_primarySubtitleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v168.origin.x = v64;
  v168.origin.y = v66;
  v168.size.width = v68;
  v168.size.height = v70;
  CGRectGetWidth(v168);
  v169.origin.x = v64;
  v169.origin.y = v66;
  v169.size.width = v68;
  v169.size.height = v70;
  CGRectGetHeight(v169);
  UIRectIntegralWithScale();
  v142 = v72;
  v143 = v71;
  v140 = v74;
  v141 = v73;
  if (v43)
    v75 = 1;
  else
    v75 = v42 ^ 1;
  if ((v75 & 1) != 0 || !v62)
  {
    v78 = v153;
    if (!v62)
      goto LABEL_36;
  }
  else
  {
    -[UILabel font](self->_primarySubtitleLabel, "font");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "capHeight");
    UICeilToScale();
    v157 = v77;

    v56 = 1;
    v78 = v153;
  }
  -[UILabel font](self->_primarySubtitleLabel, "font");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentView primarySubtitleText](self, "primarySubtitleText");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "unui_effectiveLineHeightForText:", v80);

LABEL_36:
  v81 = -[NCNotificationContentView _secondaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_secondaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _secondaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_secondaryTextMeasuredNumberOfLinesForWidth:scale:", Width, v161));
  -[NCNotificationContentView _secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:](self, "_secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:", v81, v164, v163, top, v162, bottom, v78);
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;
  -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
  v152 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setBounds:", v83, v85, v87, v89);
  if (v43 | v62)
  {
    -[NCNotificationContentView _secondaryTextBaselineOffsetForCurrentStyle](self, "_secondaryTextBaselineOffsetForCurrentStyle");
    -[NCNotificationContentView _secondaryTextBaselineOffsetWithBaseValue:](self, "_secondaryTextBaselineOffsetWithBaseValue:");
  }
  secondaryTextView = self->_secondaryTextView;
  if (secondaryTextView
    && (-[UITextView textContainerInset](secondaryTextView, "textContainerInset"),
        (v91 = self->_secondaryTextView) != 0))
  {
    -[UITextView layoutManager](v91, "layoutManager");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "baselineOffsetForGlyphAtIndex:", 0);

  }
  else
  {
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_secondaryLabel, "_firstLineBaselineOffsetFromBoundsTop");
  }
  v170.origin.x = v83;
  v170.origin.y = v85;
  v170.size.width = v87;
  v170.size.height = v89;
  CGRectGetWidth(v170);
  v171.origin.x = v83;
  v171.origin.y = v85;
  v171.size.width = v87;
  v171.size.height = v89;
  CGRectGetHeight(v171);
  v93 = v162;
  v94 = v161;
  UIRectIntegralWithScale();
  v96 = v95;
  v98 = v97;
  v138 = v100;
  v139 = v99;
  if (((v56 | v42 ^ 1) & 1) != 0)
  {
    v101 = v155;
    v102 = v157;
    v103 = v153;
  }
  else
  {
    -[NCNotificationContentView secondaryText](self, "secondaryText");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "length");

    v101 = v155;
    v102 = v157;
    v103 = v153;
    if (v105)
    {
      objc_msgSend(v152, "font");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "capHeight");
      UICeilToScale();
      v102 = v107;

    }
  }
  v156 = v101;
  if (v81)
  {
    objc_msgSend(v152, "font");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView secondaryText](self, "secondaryText");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "string");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "unui_effectiveLineHeightForText:", v110);

  }
  v111 = v62 + v43 + v81;
  if (v42)
  {
    if (v111 == 1)
    {
      v135 = _NCMainScreenScale();
      UIRectCenteredYInRectScale();
      v94 = v161;
      v93 = v162;
    }
    else
    {
      UIRectIntegralWithScale();
    }
    v156 = v112;
    rect = v114;
    v148 = v115;
    MinY = CGRectGetMinY(*(CGRect *)&v112);
    v102 = (double)((int)MinY & ~((int)MinY >> 31));
  }
  -[NCNotificationContentView _summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", -[NCNotificationContentView _summaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_summaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _summaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_summaryTextMeasuredNumberOfLinesForWidth:scale:", Width, v94, *(_QWORD *)&v135)), v164, v163, top, v93, bottom, v103);
  v118 = v117;
  v120 = v119;
  v122 = v121;
  v124 = v123;
  -[BSUIEmojiLabelView setBounds:](self->_summaryLabel, "setBounds:");
  v136 = v98;
  v137 = v96;
  v158 = v102;
  if (v111 <= 1)
  {
    v126 = v156;
    v172.origin.x = v156;
    v172.origin.y = v102;
    v172.size.width = rect;
    v125 = v148;
    v172.size.height = v148;
    CGRectGetMaxY(v172);
  }
  else
  {
    v125 = v148;
    v126 = v156;
  }
  -[NCNotificationContentView _summaryTextBaselineOffsetForCurrentStyle](self, "_summaryTextBaselineOffsetForCurrentStyle");
  -[NCNotificationContentView _summaryTextBaselineOffsetWithBaseValue:](self, "_summaryTextBaselineOffsetWithBaseValue:");
  -[BSUIEmojiLabelView _firstLineBaselineOffsetFromBoundsTop](self->_summaryLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v173.origin.x = v118;
  v173.origin.y = v120;
  v173.size.width = v122;
  v173.size.height = v124;
  CGRectGetWidth(v173);
  v174.origin.x = v118;
  v174.origin.y = v120;
  v174.size.width = v122;
  v174.size.height = v124;
  CGRectGetHeight(v174);
  UIRectIntegralWithScale();
  v128 = v127;
  v130 = v129;
  v132 = v131;
  v134 = v133;
  -[UIView setFrame:](self->_contentView, "setFrame:", v150, v149, v164, v163);
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v147, v146, v145, v144);
  -[UILabel setFrame:](self->_primarySubtitleLabel, "setFrame:", v143, v142, v141, v140);
  objc_msgSend(v152, "setFrame:", v137, v136, v139, v138);
  -[BSUIEmojiLabelView setFrame:](self->_summaryLabel, "setFrame:", v128, v130, v132, v134);
  -[UIImageView setFrame:](self->_thumbnailImageView, "setFrame:", v126, v158, rect, v125);
  -[UIView setFrame:](self->_accessoryView, "setFrame:", v126, v158, rect, v125);

}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1)
    return self->_visualStylingProvider;
  else
    return 0;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FE38;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v10;
  void *v11;
  void *v12;
  MTVisualStylingProvider *v13;

  v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1)
  {
    p_visualStylingProvider = &self->_visualStylingProvider;
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v7)
    {
      v13 = v7;
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_primaryLabel);
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](*p_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_primarySubtitleLabel);
      v10 = *p_visualStylingProvider;
      -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v10, "stopAutomaticallyUpdatingView:", v11);

      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](*p_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_summaryLabel);
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](*p_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_thumbnailImageView);
      objc_storeStrong((id *)&self->_visualStylingProvider, a3);
      -[NCNotificationContentView _updateStyleForPrimaryLabel:withStyle:](self, "_updateStyleForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
      -[NCNotificationContentView _updateStyleForPrimaryLabel:withStyle:](self, "_updateStyleForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
      -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationContentView _updateStyleForSecondaryTextSupportingView:withStyle:](self, "_updateStyleForSecondaryTextSupportingView:withStyle:", v12, self->_lookStyle);

      -[NCNotificationContentView _updateStyleForSummaryLabel:withStyle:](self, "_updateStyleForSummaryLabel:withStyle:", self->_summaryLabel, self->_lookStyle);
      -[NCNotificationContentView _updateStyleForThumbnailImage:withStyle:](self, "_updateStyleForThumbnailImage:withStyle:", self->_thumbnailImageView, self->_lookStyle);
      -[NCNotificationContentView setNeedsDisplay](self, "setNeedsDisplay");
      v7 = v13;
    }
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationContentView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v5);

    }
    -[NCNotificationContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BSUIFontProvider *fontProvider;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[NCNotificationContentView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    -[NCNotificationContentView _updateContentInsets](self, "_updateContentInsets");
    -[NCNotificationContentView _invalidateNumberOfLinesCache](self, "_invalidateNumberOfLinesCache");
    -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primaryLabel, self->_lookStyle);
    -[NCNotificationContentView _updateTextAttributesForPrimaryLabel:withStyle:](self, "_updateTextAttributesForPrimaryLabel:withStyle:", self->_primarySubtitleLabel, self->_lookStyle);
    -[NCNotificationContentView _secondaryTextSupportingView](self, "_secondaryTextSupportingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView _updateTextAttributesForSecondaryTextSupportingView:withStyle:](self, "_updateTextAttributesForSecondaryTextSupportingView:withStyle:", v8, self->_lookStyle);

    -[NCNotificationContentView _updateTextAttributesForSummaryLabel:withStyle:](self, "_updateTextAttributesForSummaryLabel:withStyle:", self->_summaryLabel, self->_lookStyle);
  }

  return v6 ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationContentView;
  -[NCNotificationContentView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (-[NCNotificationContentView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    -[NCNotificationContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD block[4];
  id v14;

  v9 = a4;
  if (!a6 && self->_secondaryTextView == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "notificationContentView:willInteractWithURL:", self, v9);
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NCNotificationContentView_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    block[3] = &unk_1E8D1B568;
    v14 = v9;
    dispatch_async(v11, block);

  }
  return 0;
}

void __80__NCNotificationContentView_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "isValid"))
  {
    objc_msgSend(v3, "setShowUIPrompt:", 1);
    objc_msgSend(v3, "URL");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v4;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D22DA8];
  v8[0] = *MEMORY[0x1E0D22D88];
  v8[1] = v6;
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v2, v7, 0);

}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationContentView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationContentView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationContentView *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__NCNotificationContentView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8D1B3A0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __67__NCNotificationContentView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("primaryText"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primarySubtitleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("primarySubtitleText"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "secondaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v7, CFSTR("secondaryText"), 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "thumbnail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v10, CFSTR("thumbnail"), 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v13, CFSTR("accessoryView"), 1);

  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfPrimaryTextLines"), CFSTR("maximumNumberOfPrimaryTextLines"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfPrimaryLargeTextLines"), CFSTR("maximumNumberOfPrimaryLargeTextLines"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfSecondaryTextLines"), CFSTR("maximumNumberOfSecondaryTextLines"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfSecondaryLargeTextLines"), CFSTR("maximumNumberOfSecondaryLargeTextLines"));
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return self->_maximumNumberOfSecondaryTextLines;
}

- (UILabel)_secondaryLabel
{
  return self->_secondaryLabel;
}

- (UITextView)_secondaryTextView
{
  return self->_secondaryTextView;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NCNotificationContentViewDelegate)delegate
{
  return (NCNotificationContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isThumbnailContactImage
{
  return self->_thumbnailIsContactImage;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return self->_maximumNumberOfPrimaryTextLines;
}

- (unint64_t)maximumNumberOfPrimaryLargeTextLines
{
  return self->_maximumNumberOfPrimaryLargeTextLines;
}

- (unint64_t)maximumNumberOfSecondaryLargeTextLines
{
  return self->_maximumNumberOfSecondaryLargeTextLines;
}

- (BOOL)useSmallTopMargin
{
  return self->_useSmallTopMargin;
}

- (void)_setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (void)_setPrimarySubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primarySubtitleLabel, a3);
}

- (void)_setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_secondaryTextView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_widthToFontToStringToMeasuredNumLines, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
