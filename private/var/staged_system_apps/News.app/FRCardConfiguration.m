@implementation FRCardConfiguration

+ (id)cardConfiguration
{
  if (qword_10010A790 != -1)
    dispatch_once(&qword_10010A790, &stru_1000DDEA0);
  return (id)qword_10010A788;
}

- (FRCardConfiguration)init
{
  char *v2;
  FRCardConfigurationCache *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRCardConfiguration;
  v2 = -[FRCardConfiguration init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(FRCardConfigurationCache);
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    *(_OWORD *)(v2 + 8) = xmmword_1000D0CA0;
    *((_QWORD *)v2 + 3) = 0x3FF0000000000000;
  }
  return (FRCardConfiguration *)v2;
}

+ (double)bannerHeightForWidth:(double)a3
{
  return ceil(a3 * 4.0 / 3.0 - a3);
}

- (double)insetForFeed:(id)a3 sizeCategory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "backingTag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bannerImageForMask"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetHandle"));
  v10 = v9 == 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FRDynamicTypeValueScaler valueSpecifierWithXS:L:XXXL:AXXXL:](FRDynamicTypeValueScaler, "valueSpecifierWithXS:L:XXXL:AXXXL:", dbl_1000D0CB0[v10], dbl_1000D0CB0[v10], dbl_1000D0CB0[v10] * 0.5, dbl_1000D0CB0[v10] * 0.25));
  objc_msgSend(v11, "scaledValueForSizeCategory:", v5);
  v13 = v12;

  return v13;
}

- (double)lineHeightForSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.width <= 140.0;
  result = 11.0;
  if (!v3)
    return 15.0;
  return result;
}

- (double)_fontSizeForTopicTitleWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width;
  double result;

  width = a3.width;
  result = 14.0;
  if (width <= 200.0)
  {
    result = 12.0;
    if (width <= 140.0)
    {
      if (width <= 120.0)
      {
        result = 8.5;
        if (width > 110.0)
          return 10.0;
      }
      else
      {
        return 11.33;
      }
    }
  }
  return result;
}

- (double)_fontSizeForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width;
  double result;

  width = a3.width;
  result = 16.0;
  if (width <= 200.0)
  {
    result = 14.0;
    if (width <= 140.0)
    {
      if (width <= 120.0)
      {
        result = 10.5;
        if (width > 110.0)
          return 12.0;
      }
      else
      {
        return 13.33;
      }
    }
  }
  return result;
}

- (id)fontForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FRCardConfiguration _fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:", a4, a3.width, a3.height);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration cache](self, "cache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cacheFontItemForFontSize:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topicFont"));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v6, UIFontWeightSemibold));
    objc_msgSend(v8, "setTopicFont:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topicFont"));

  return v11;
}

- (id)fontForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  width = a3.width;
  v6 = a4;
  if (width <= 140.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:](FRDynamicTypeValueScaler, "valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:", 0.9, 8.5, 1.25, 1.5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:](FRDynamicTypeValueScaler, "valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:", 0.9, 11.0, 1.25, 1.5));
    if (width > 200.0)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:](FRDynamicTypeValueScaler, "valueSpecifierWithXSFactor:largeSize:XXXLFactor:AXXXLFactor:", 0.9, 12.0, 1.25, 1.5));

      v7 = (void *)v8;
    }
  }
  objc_msgSend(v7, "scaledValueForSizeCategory:", v6);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration cache](self, "cache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cacheFontItemForFontSize:", v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelFont"));
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v10, UIFontWeightBold));
    objc_msgSend(v12, "setChannelFont:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelFont"));

  return v15;
}

- (double)kerningForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double result;

  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", 1, a4, a3.width, a3.height);
  return result;
}

- (double)kerningForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double result;

  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", 0, a4, a3.width, a3.height);
  return result;
}

- (double)_kerningFeedsWhenInCardsOfSize:(CGSize)a3 isChannel:(BOOL)a4 sizeCategory:(id)a5
{
  double v5;
  double v6;

  v5 = 1.2;
  if (a4)
    v5 = 0.4;
  v6 = 0.5;
  if (a4)
    v6 = 0.0;
  if (a3.width <= 140.0)
    return v6;
  else
    return v5;
}

- (id)textColorForTag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asChannel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "theme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "foregroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ne_color"));

  if (!v7)
  {
    if (v4)
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v7 = (void *)v8;
  }
  return v7;
}

- (id)attributedStringForTag:(id)a3 boundsSize:(CGSize)a4 sizeCategory:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  _QWORD v28[4];

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asChannel"));

  -[FRCardConfiguration lineHeightForSize:](self, "lineHeightForSize:", width, height);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v9, width, height));
  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", v11 != 0, v9, width, height);
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
  v18 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v19) = 1036831949;
  objc_msgSend(v18, "setHyphenationFactor:", v19);
  objc_msgSend(v18, "setAlignment:", 1);
  objc_msgSend(v18, "setMinimumLineHeight:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration textColorForTag:](self, "textColorForTag:", v10));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));

  if (!v11)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uppercaseString"));

    v21 = (void *)v25;
    if (v25)
      goto LABEL_3;
LABEL_5:
    v24 = 0;
    goto LABEL_6;
  }
  if (!v21)
    goto LABEL_5;
LABEL_3:
  v22 = objc_alloc((Class)NSAttributedString);
  v27[0] = kCTTrackingAttributeName;
  v27[1] = NSParagraphStyleAttributeName;
  v28[0] = v17;
  v28[1] = v18;
  v27[2] = NSForegroundColorAttributeName;
  v27[3] = NSFontAttributeName;
  v28[2] = v20;
  v28[3] = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
  v24 = objc_msgSend(v22, "initWithString:attributes:", v21, v23);

LABEL_6:
  return v24;
}

- (CGRect)bannerFrameForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(self, a2), "bannerHeightForWidth:", a3.width);
  *(float *)&v5 = v5;
  v6 = floorf(*(float *)&v5);
  v7 = height - v6;
  v8 = 0.0;
  v9 = width;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)logoInsetsForBannerSize:(CGSize)a3 logoAspectRatio:(double)a4
{
  double v4;
  double v5;
  double height;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  if (a4 <= 6.66)
  {
    if (a3.height <= 0.0 || a3.width <= 0.0)
    {
      v5 = a3.width * 0.5;
      v7 = a3.width * 0.1111;
    }
    else
    {
      v8 = dbl_1000D0CD0[a3.width < 150.0];
      v9 = fmax(v8 / 6.66 * a4, 0.0);
      if (v8 < v9)
        v9 = dbl_1000D0CD0[a3.width < 150.0];
      v10 = a3.width * (dbl_1000D0CC0[a3.width < 150.0] - v9);
      v5 = floor((a3.width - v10 * a4) * 0.5);
      v7 = floor((a3.height - v10) * 0.5);
    }
  }
  else
  {
    v4 = floor(a3.width * 0.113);
    v5 = floor(a3.width * 0.1391);
    if (a3.width < 150.0)
      v5 = v4;
    height = a3.width * 0.1;
    if (height >= a3.height)
      height = a3.height;
    v7 = fmax(floor((a3.height - height) * 0.5), 0.0);
  }
  v11 = v5;
  v12 = v7;
  result.right = v5;
  result.bottom = v12;
  result.left = v11;
  result.top = v7;
  return result;
}

- (double)gridSpacingForWidth:(double)a3
{
  double v3;
  double v4;

  v3 = 9.0;
  if (a3 <= 834.0)
  {
    v3 = 8.0;
    if (a3 <= 750.0)
    {
      v3 = 7.0;
      v4 = 5.0;
      if (a3 > 320.0)
        v4 = 7.0;
      if (a3 <= 400.0)
        return v4;
    }
  }
  return v3;
}

- (UIEdgeInsets)gridInsetsForWidth:(double)a3
{
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v4 = 9.0;
  if (a3 <= 1112.0)
  {
    if (a3 <= 834.0)
    {
      if (a3 <= 768.0)
      {
        v5 = a3 <= 750.0 && a3 <= 400.0;
        v4 = 8.0;
        if (v5)
        {
          v4 = 5.0;
          if (a3 > 320.0)
            v4 = 8.0;
        }
      }
    }
    else
    {
      v4 = 8.0;
    }
  }
  v6 = v4;
  v7 = v4;
  v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v4;
  return result;
}

- (unint64_t)numberOfColumnsForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  unint64_t v13;
  CGRect v17;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = CGRectGetWidth(a3);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = CGRectGetHeight(v17);
  v13 = 3;
  if (!v6)
    v13 = 4;
  if (v11 > v12 && a5 == 0 || a5 == 2)
    return 5;
  else
    return v13;
}

- (CGSize)itemSizeForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[FRCardConfiguration numberOfColumnsForCollectionViewBounds:isCompact:orientation:](self, "numberOfColumnsForCollectionViewBounds:isCompact:orientation:", a4, a5);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetWidth(v22);
  -[FRCardConfiguration gridSpacingForWidth:](self, "gridSpacingForWidth:");
  v13 = v12;
  -[FRCardConfiguration insetsForCollectionViewBounds:](self, "insetsForCollectionViewBounds:", x, y, width, height);
  v16 = floor((v11 - v14 - v15 - v13 * (double)(v10 - 1)) / (double)v10);
  objc_msgSend((id)objc_opt_class(self, v17), "bannerHeightForWidth:", v16);
  v19 = v18 + v16;
  v20 = v16;
  result.height = v19;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)insetsForCollectionViewBounds:(CGRect)a3
{
  CGFloat Width;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  Width = CGRectGetWidth(a3);
  -[FRCardConfiguration gridInsetsForWidth:](self, "gridInsetsForWidth:", Width);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)topicTitleTopMarginForCardSize:(CGSize)a3
{
  return dbl_1000D0CE0[a3.width > 140.0];
}

- (double)horizontalDividerWidthForCardSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.width <= 140.0;
  result = 40.0;
  if (!v3)
    return 60.0;
  return result;
}

- (double)spaceBetweenTopicTitleAndHorizontalDividerForCardSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.width <= 140.0;
  result = 3.0;
  if (!v3)
    return 4.0;
  return result;
}

- (double)spaceBetweenHorizontalDividerAndTopicNameForCardSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.width <= 140.0;
  result = 3.0;
  if (!v3)
    return 6.0;
  return result;
}

- (id)topicTitleAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];

  height = a3.height;
  width = a3.width;
  v9 = a4;
  -[FRCardConfiguration _fontSizeForTopicTitleWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicTitleWhenInCardsOfSize:sizeCategory:", a5, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v11, "setAlignment:", 1);
  v18[0] = v10;
  v17[0] = NSFontAttributeName;
  v17[1] = NSParagraphStyleAttributeName;
  v12 = objc_msgSend(v11, "copy");
  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  if (v9)
  {
    v14 = objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "setObject:forKey:", v9, NSForegroundColorAttributeName);
    v15 = objc_msgSend(v14, "copy");

    v13 = v15;
  }

  return v13;
}

- (id)topicTextAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[2];
  _QWORD v23[2];

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v10, width, height));
  v12 = 16.0;
  if (width <= 200.0)
  {
    v12 = 14.0;
    if (width <= 140.0)
    {
      v12 = 13.0;
      if (width <= 120.0)
      {
        if (width <= 110.0)
          v12 = 10.0;
        else
          v12 = 12.0;
      }
    }
  }
  -[FRCardConfiguration _fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:", v10, width, height);
  v14 = v13;

  v15 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v15, "setAlignment:", 1);
  objc_msgSend(v15, "setLineSpacing:", v12 - v14);
  LODWORD(v16) = 1036831949;
  objc_msgSend(v15, "setHyphenationFactor:", v16);
  v23[0] = v11;
  v22[0] = NSFontAttributeName;
  v22[1] = NSParagraphStyleAttributeName;
  v17 = objc_msgSend(v15, "copy");
  v23[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

  if (v9)
  {
    v19 = objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "setObject:forKey:", v9, NSForegroundColorAttributeName);
    v20 = objc_msgSend(v19, "copy");

    v18 = v20;
  }

  return v18;
}

+ (CGSize)textMargin
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.0;
  v3 = 4.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)topicFrameForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGRect v8;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(self, a2), "textMargin");
  v7 = 12.0;
  if (width <= 140.0)
    v7 = 8.0;
  v8.size.width = width + (v7 + v5) * -2.0;
  v8.size.height = height + (v7 + v6) * -2.0;
  v8.origin.x = (width - v8.size.width) * 0.5;
  v8.origin.y = (height - v8.size.height) * 0.5;
  return CGRectIntegral(v8);
}

- (CGRect)topicTextRect:(id)a3 cardSize:(CGSize)a4 textPadPath:(id *)a5
{
  double height;
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uppercaseString"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration topicTextAttributesForCardSize:textColor:sizeCategory:](self, "topicTextAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height));
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v15, 0, v11, v13);
  v18 = floor((width - v17) * 0.5);
  v20 = floor((height - v19) * 0.5);
  v21 = ceil(v17);
  v22 = ceil(v19);
  if (a5)
  {
    objc_msgSend((id)objc_opt_class(self, v16), "textMargin");
    v24 = -v23;
    v26 = -v25;
    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v21;
    v31.size.height = v22;
    v32 = CGRectInset(v31, v24, v26);
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height, 2.5));
  }

  v27 = v18;
  v28 = v20;
  v29 = v21;
  v30 = v22;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGSize)topicTextSize:(id)a3 cardSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration topicTextAttributesForCardSize:textColor:sizeCategory:](self, "topicTextAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height));
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, v9, v11);
  v15 = ceil(v14);
  v17 = ceil(v16);

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)topicTitleTextSize:(id)a3 cardSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration topicTitleAttributesForCardSize:textColor:sizeCategory:](self, "topicTitleAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height));
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, v9, v11);
  v15 = ceil(v14);
  v17 = ceil(v16);

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (id)_gradientCGColors
{
  if (qword_10010A7A0 != -1)
    dispatch_once(&qword_10010A7A0, &stru_1000DDEC0);
  return (id)qword_10010A798;
}

- (id)gradientLayerWithChin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "_gradientCGColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setColors:", v8);

  objc_msgSend(v5, "setStartPoint:", 0.5, 0.0);
  objc_msgSend(v5, "setEndPoint:", 0.5, 1.0);
  if (v3)
    v9 = &off_1000E4A78;
  else
    v9 = &off_1000E4A90;
  objc_msgSend(v5, "setLocations:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v10, "cardCornerRadius");
  objc_msgSend(v5, "setCornerRadius:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  objc_msgSend(v5, "setBorderWidth:", 1.0 / v12);

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15)));
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v13, "CGColor"));

  return v5;
}

- (id)_placeholderOfSize:(CGSize)a3 withChin:(BOOL)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  CGSize v13;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration gradientLayerWithChin:](self, "gradientLayerWithChin:", a4));
  v7 = v6;
  if (width >= 0.0)
    v8 = width;
  else
    v8 = -width;
  if (height >= 0.0)
    v9 = height;
  else
    v9 = -height;
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  v13.width = width;
  v13.height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  objc_msgSend(v7, "renderInContext:", UIGraphicsGetCurrentContext());
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v11;
}

- (id)placeholderTopicImageForCardOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration cache](self, "cache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cacheImageItemForCardSize:", width, height));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topicPlaceholderImage"));
  if (v8)
    goto LABEL_5;
  if (width > 0.0 && height > 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration _placeholderOfSize:withChin:](self, "_placeholderOfSize:withChin:", 0, width, height));
    objc_msgSend(v7, "setTopicPlaceholderImage:", v9);

LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topicPlaceholderImage"));
  }

  return v8;
}

- (id)placeholderChannelImageForCardOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration cache](self, "cache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cacheImageItemForCardSize:", width, height));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "channelPlaceholderImage"));
  if (v8)
    goto LABEL_5;
  if (width > 0.0 && height > 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfiguration _placeholderOfSize:withChin:](self, "_placeholderOfSize:withChin:", 1, width, height));
    objc_msgSend(v7, "setChannelPlaceholderImage:", v9);

LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "channelPlaceholderImage"));
  }

  return v8;
}

- (void)prewarmConfigurationForCardSize:(CGSize)a3 sizeCategory:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  height = a3.height;
  width = a3.width;
  v11 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (width > 0.0 && height > 0.0)
  {
    v7 = -[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v11, width, height);
    v8 = -[FRCardConfiguration fontForChannelFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForChannelFeedsWhenInCardsOfSize:sizeCategory:", v11, width, height);
    v9 = -[FRCardConfiguration placeholderTopicImageForCardOfSize:](self, "placeholderTopicImageForCardOfSize:", width, height);
    v10 = -[FRCardConfiguration placeholderChannelImageForCardOfSize:](self, "placeholderChannelImageForCardOfSize:", width, height);
  }

}

- (double)cardCornerRadius
{
  return self->_cardCornerRadius;
}

- (double)materialBlurRadius
{
  return self->_materialBlurRadius;
}

- (double)materialColorAlpha
{
  return self->_materialColorAlpha;
}

- (FRCardConfigurationCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
