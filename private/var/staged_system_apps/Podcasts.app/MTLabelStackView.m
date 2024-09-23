@implementation MTLabelStackView

+ (double)maxHeight
{
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend((id)objc_opt_class(a1), "defaultTitleNumberOfLines");
  v4 = objc_msgSend((id)objc_opt_class(a1), "defaultSubtitleNumberOfLines");
  _objc_msgSend(a1, "maxHeightForTitleNumberOfLines:subtitleNumberOfLines:", v3, v4);
  return result;
}

+ (double)maxHeightForTitleNumberOfLines:(unint64_t)a3 subtitleNumberOfLines:(unint64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = objc_msgSend((id)objc_opt_class(a1), "defaultTitleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend((id)objc_opt_class(a1), "defaultSubtitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "lineHeight");
  v12 = v11 * (double)a3 + 0.0;
  objc_msgSend(a1, "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:", v8, v10, a3 != 1);
  v14 = v12 + v13;
  objc_msgSend(v10, "lineHeight");
  v16 = v14 + v15 * (double)a4;

  return v16;
}

+ (double)distanceBetweenLabelFrames
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v3 = objc_msgSend((id)objc_opt_class(a1), "defaultTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(a1), "defaultSubtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(a1, "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:", v4, v6, objc_msgSend((id)objc_opt_class(a1), "defaultTitleNumberOfLines") != (id)1);
  v8 = v7;

  return v8;
}

+ (double)distanceBetweenLabelFramesWithTitleFont:(id)a3 subtitleFont:(id)a4 multilineTitle:(BOOL)a5
{
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (a5)
    v6 = 19.0;
  else
    v6 = 16.0;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "_scaledValueForValue:", v6);
  v10 = v9;
  objc_msgSend(v8, "mt_offsetFromLastBaselineToBottom");
  v12 = v11;

  v13 = v10 - v12;
  objc_msgSend(v7, "mt_offsetFromFirstBaselineToTop");
  v15 = v14;

  return v13 - v15;
}

+ (id)defaultTitleTextStyle
{
  return UIFontTextStyleBody;
}

+ (id)defaultSubtitleTextStyle
{
  return UIFontTextStyleSubheadline;
}

+ (id)defaultTitleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultTitleTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)defaultSubtitleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultSubtitleTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (unint64_t)defaultTitleNumberOfLines
{
  return 1;
}

+ (unint64_t)defaultSubtitleNumberOfLines
{
  return 1;
}

- (MTLabelStackView)initWithFrame:(CGRect)a3
{
  MTLabelStackView *v3;
  NSCache *v4;
  NSCache *textSizeCache;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLabelStackView;
  v3 = -[MTLabelStackView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(NSCache);
    textSizeCache = v3->_textSizeCache;
    v3->_textSizeCache = v4;

    v3->_subtitleMaxWidth = 1.79769313e308;
    v3->_enabled = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](v3, "titleLabel"));
    -[MTLabelStackView addSubview:](v3, "addSubview:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](v3, "subtitleLabel"));
    -[MTLabelStackView addSubview:](v3, "addSubview:", v7);

    -[MTLabelStackView _updateTitleFont](v3, "_updateTitleFont");
    -[MTLabelStackView _updateSubtitleFont](v3, "_updateSubtitleFont");
  }
  return v3;
}

- (void)updateFonts
{
  -[MTLabelStackView _updateTitleFont](self, "_updateTitleFont");
  -[MTLabelStackView _updateSubtitleFont](self, "_updateSubtitleFont");
}

- (void)setSubtitleMaxWidth:(double)a3
{
  if (self->_subtitleMaxWidth != a3)
  {
    self->_subtitleMaxWidth = a3;
    -[MTLabelStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_enabled = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setEnabled:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)MTLabelStackView;
  -[MTLabelStackView layoutSubviews](&v17, "layoutSubviews");
  -[MTLabelStackView bounds](self, "bounds");
  v4 = v3;
  -[MTLabelStackView titleHeightForWidth:](self, "titleHeightForWidth:", v3);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[MTLabelStackView distanceBetweenLabelFrames](self, "distanceBetweenLabelFrames");
  v9 = v8;
  -[MTLabelStackView subtitleMaxWidth](self, "subtitleMaxWidth");
  if (v4 >= v10)
    v11 = v10;
  else
    v11 = v4;
  -[MTLabelStackView subtitleHeightForWidth:](self, "subtitleHeightForWidth:", v11);
  v13 = v12;
  v14 = 0.0;
  if (-[MTLabelStackView mt_isRTL](self, "mt_isRTL"))
  {
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v4;
    v18.size.height = v6;
    v14 = CGRectGetMaxX(v18) - v11;
  }
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v4;
  v19.size.height = v6;
  v15 = v9 + CGRectGetMaxY(v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v16, "setFrame:", v14, v15, v11, v13);

  -[MTLabelStackView _notifyDelegateIfHeightChanged](self, "_notifyDelegateIfHeightChanged");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[MTLabelStackView heightForWidth:](self, "heightForWidth:", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)heightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[MTLabelStackView titleHeightForWidth:](self, "titleHeightForWidth:");
  v6 = v5;
  -[MTLabelStackView distanceBetweenLabelFrames](self, "distanceBetweenLabelFrames");
  v8 = v7;
  -[MTLabelStackView subtitleMaxWidth](self, "subtitleMaxWidth");
  if (v9 > a3)
    v9 = a3;
  -[MTLabelStackView subtitleHeightForWidth:](self, "subtitleHeightForWidth:", v9);
  return v6 + v8 + v10;
}

- (double)distanceBetweenLabelFrames
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      return 0.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));

    objc_msgSend((id)objc_opt_class(self), "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:", v3, v8, (id)-[MTLabelStackView titleNumberOfLines](self, "titleNumberOfLines") != (id)1);
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)titleHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", CFSTR("title")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_textSizeCache, "objectForKey:", v5));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));

    -[NSCache setObject:forKey:](self->_textSizeCache, "setObject:forKey:", v6, v5);
  }
  objc_msgSend(v6, "floatValue");
  v10 = v9;

  return v10;
}

- (double)subtitleHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", CFSTR("subtitle")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_textSizeCache, "objectForKey:", v5));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));

    -[NSCache setObject:forKey:](self->_textSizeCache, "setObject:forKey:", v6, v5);
  }
  objc_msgSend(v6, "floatValue");
  v10 = v9;

  return v10;
}

- (id)sizeCacheKeyForLabel:(id)a3 width:(double)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%f"), a3, *(_QWORD *)&a4);
}

- (void)_updateTitleFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextStyle](self, "titleTextStyle"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v5);

  -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
}

- (void)_updateSubtitleFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextStyle](self, "subtitleTextStyle"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v4, "setFont:", v5);

  -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
}

- (void)_heightWillChange
{
  self->_heightWillChange = 1;
  -[MTLabelStackView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_notifyDelegateIfHeightChanged
{
  id v3;

  if (self->_heightWillChange)
  {
    self->_heightWillChange = 0;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView delegate](self, "delegate"));
    objc_msgSend(v3, "labelStackViewDidChangeHeight:", self);

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "setText:", v10);

    -[MTLabelStackView bounds](self, "bounds");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", CFSTR("title"), v9));
    -[NSCache removeObjectForKey:](self->_textSizeCache, "removeObjectForKey:", v5);
    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
LABEL_4:

  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v8, "setText:", v10);

    -[MTLabelStackView bounds](self, "bounds");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", CFSTR("subtitle"), v9));
    -[NSCache removeObjectForKey:](self->_textSizeCache, "removeObjectForKey:", v5);
    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
LABEL_4:

  }
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (NSString)titleTextStyle
{
  NSString *titleTextStyle;
  id v4;

  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle)
    return titleTextStyle;
  v4 = objc_msgSend((id)objc_opt_class(self), "defaultTitleTextStyle");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setTitleTextStyle:(id)a3
{
  NSString *v5;
  NSString *titleTextStyle;
  unsigned __int8 v7;
  NSString *v8;

  v5 = (NSString *)a3;
  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](titleTextStyle, "isEqualToString:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextStyle, a3);
      -[MTLabelStackView _updateTitleFont](self, "_updateTitleFont");
      v5 = v8;
    }
  }

}

- (NSString)subtitleTextStyle
{
  NSString *subtitleTextStyle;
  id v4;

  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle)
    return subtitleTextStyle;
  v4 = objc_msgSend((id)objc_opt_class(self), "defaultSubtitleTextStyle");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setSubtitleTextStyle:(id)a3
{
  NSString *v5;
  NSString *subtitleTextStyle;
  unsigned __int8 v7;
  NSString *v8;

  v5 = (NSString *)a3;
  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](subtitleTextStyle, "isEqualToString:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextStyle, a3);
      -[MTLabelStackView _updateSubtitleFont](self, "_updateSubtitleFont");
      v5 = v8;
    }
  }

}

- (UIColor)titleTextColor
{
  UIColor *titleTextColor;

  titleTextColor = self->_titleTextColor;
  if (titleTextColor)
    return titleTextColor;
  else
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
}

- (void)setTitleTextColor:(id)a3
{
  UIColor *v5;
  UIColor *titleTextColor;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)a3;
  titleTextColor = self->_titleTextColor;
  if (titleTextColor != v5)
  {
    v10 = v5;
    v7 = -[UIColor isEqual:](titleTextColor, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextColor, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextColor](self, "titleTextColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
      objc_msgSend(v9, "setTextColor:", v8);

      v5 = v10;
    }
  }

}

- (UIColor)subtitleTextColor
{
  UIColor *subtitleTextColor;

  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor)
    return subtitleTextColor;
  else
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue(+[UIColor cellSecondaryTextColor](UIColor, "cellSecondaryTextColor"));
}

- (void)setSubtitleTextColor:(id)a3
{
  UIColor *v5;
  UIColor *subtitleTextColor;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)a3;
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor != v5)
  {
    v10 = v5;
    v7 = -[UIColor isEqual:](subtitleTextColor, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextColor, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextColor](self, "subtitleTextColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v9, "setTextColor:", v8);

      v5 = v10;
    }
  }

}

- (unint64_t)titleNumberOfLines
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  v3 = objc_msgSend(v2, "numberOfLines");

  return (unint64_t)v3;
}

- (void)setTitleNumberOfLines:(unint64_t)a3
{
  void *v5;

  if (-[MTLabelStackView titleNumberOfLines](self, "titleNumberOfLines") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setNumberOfLines:", a3);

    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
  }
}

- (unint64_t)subtitleNumberOfLines
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  v3 = objc_msgSend(v2, "numberOfLines");

  return (unint64_t)v3;
}

- (void)setSubtitleNumberOfLines:(unint64_t)a3
{
  void *v5;

  if (-[MTLabelStackView subtitleNumberOfLines](self, "subtitleNumberOfLines") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v5, "setNumberOfLines:", a3);

    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
  }
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", objc_msgSend((id)objc_opt_class(self), "defaultTitleNumberOfLines"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextColor](self, "titleTextColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextStyle](self, "titleTextStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v7));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", objc_msgSend((id)objc_opt_class(self), "defaultSubtitleNumberOfLines"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextColor](self, "subtitleTextColor"));
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextStyle](self, "subtitleTextStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v7));
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (MTLabelStackViewDelegate)delegate
{
  return (MTLabelStackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)subtitleMaxWidth
{
  return self->_subtitleMaxWidth;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_textSizeCache, 0);
}

@end
