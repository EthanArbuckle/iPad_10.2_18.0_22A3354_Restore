@implementation UIColor

- (id)fr_legibleForegroundColor
{
  double v2;
  BOOL v3;
  double v4;

  -[UIColor _luminance](self, "_luminance");
  v3 = v2 <= 0.7;
  v4 = 1.0;
  if (!v3)
    v4 = 0.0;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 1.0);
}

- (int64_t)fr_legibleStatusBarStyle
{
  void *v3;
  void *v4;
  double v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self, "resolvedColorWithTraitCollection:", v3));

  objc_msgSend(v4, "_luminance");
  if (v5 <= 0.7)
    v6 = 1;
  else
    v6 = 3;

  return v6;
}

+ (id)fr_colorWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6
{
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v8 = 0.0;
  FR_HSL_TO_RGB(&v10, &v9, &v8, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10, v9, v8, a6));
}

- (id)fr_offsetWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6
{
  float v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v16;
  double v17;
  double v18;
  double v19;

  v18 = 0.0;
  v19 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  -[UIColor getHue:saturation:lightness:alpha:](self, "getHue:saturation:lightness:alpha:", &v19, &v18, &v17, &v16);
  v10 = v19 + a3;
  v11 = fmodf(v10, 1.0);
  v12 = FCClamp(v18 + a4, 0.0, 1.0);
  v13 = FCClamp(v17 + a5, 0.0, 1.0);
  v14 = +[UIColor fr_colorWithHue:saturation:lightness:alpha:](UIColor, "fr_colorWithHue:saturation:lightness:alpha:", v11, v12, v13, FCClamp(v16 + a6, 0.0, 1.0));
  return (id)objc_claimAutoreleasedReturnValue(v14);
}

- (id)fr_saturate:(double)a3
{
  return -[UIColor fr_offsetWithHue:saturation:lightness:alpha:](self, "fr_offsetWithHue:saturation:lightness:alpha:", 0.0, a3, 0.0, 0.0);
}

- (id)fr_desaturate:(double)a3
{
  return -[UIColor fr_offsetWithHue:saturation:lightness:alpha:](self, "fr_offsetWithHue:saturation:lightness:alpha:", 0.0, -a3, 0.0, 0.0);
}

- (id)fr_lighten:(double)a3
{
  return -[UIColor fr_offsetWithHue:saturation:lightness:alpha:](self, "fr_offsetWithHue:saturation:lightness:alpha:", 0.0, 0.0, a3, 0.0);
}

- (id)fr_darken:(double)a3
{
  return -[UIColor fr_offsetWithHue:saturation:lightness:alpha:](self, "fr_offsetWithHue:saturation:lightness:alpha:", 0.0, 0.0, -a3, 0.0);
}

- (void)getHue:(double *)a3 saturation:(double *)a4 lightness:(double *)a5 alpha:(double *)a6
{
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v11, &v10, &v9, a6);
  FR_RGB_TO_HSL(a3, a4, a5, v11, v10, v9);
}

+ (id)fr_systemViewTintColor
{
  if (qword_1000BCC38 != -1)
    dispatch_once(&qword_1000BCC38, &stru_1000AA608);
  return (id)qword_1000BCC30;
}

+ (id)fr_keyColor
{
  return +[UIColor systemPinkColor](UIColor, "systemPinkColor");
}

+ (id)fr_keyColorHighlighted
{
  if (qword_1000BCC48 != -1)
    dispatch_once(&qword_1000BCC48, &stru_1000AA628);
  return (id)qword_1000BCC40;
}

+ (id)fr_subscriptionOnlyTextColor
{
  if (qword_1000BCC58 != -1)
    dispatch_once(&qword_1000BCC58, &stru_1000AA648);
  return (id)qword_1000BCC50;
}

+ (id)fr_savedStoriesHeaderColor
{
  if (qword_1000BCC68 != -1)
    dispatch_once(&qword_1000BCC68, &stru_1000AA668);
  return (id)qword_1000BCC60;
}

+ (id)fr_forYouStoriesHeaderColor
{
  if (qword_1000BCC78 != -1)
    dispatch_once(&qword_1000BCC78, &stru_1000AA688);
  return (id)qword_1000BCC70;
}

+ (id)fr_trendingStoriesHeaderColor
{
  if (qword_1000BCC88 != -1)
    dispatch_once(&qword_1000BCC88, &stru_1000AA6A8);
  return (id)qword_1000BCC80;
}

+ (id)fr_moreForYouHeaderColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_channelIssuesHeaderColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_defaultBarColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_defaultDarkBarColor
{
  id v2;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  else
  {
    if (qword_1000BCC98 != -1)
      dispatch_once(&qword_1000BCC98, &stru_1000AA6C8);
    v2 = (id)qword_1000BCC90;
  }
  return v2;
}

+ (id)fr_defaultLightBarColor
{
  id v2;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  else
  {
    if (qword_1000BCCA8 != -1)
      dispatch_once(&qword_1000BCCA8, &stru_1000AA6E8);
    v2 = (id)qword_1000BCCA0;
  }
  return v2;
}

+ (id)fr_dynamicDefaultLightBarColor
{
  uint64_t *v2;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (qword_1000BCCB8 != -1)
      dispatch_once(&qword_1000BCCB8, &stru_1000AA708);
    v2 = &qword_1000BCCB0;
  }
  else
  {
    if (qword_1000BCCC8 != -1)
      dispatch_once(&qword_1000BCCC8, &stru_1000AA728);
    v2 = &qword_1000BCCC0;
  }
  return (id)*v2;
}

+ (id)fr_feedBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_feedSwipedCellBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)fr_feedDefaultCollectionBackgroundGradientStartColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_feedDefaultCollectionBackgroundGradientEndColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)fr_feedPremiumArticleCellBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_feedSpotlightArticleCellBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_feedCellSelectedBackgroundColor
{
  if (qword_1000BCCD8 != -1)
    dispatch_once(&qword_1000BCCD8, &stru_1000AA748);
  return (id)qword_1000BCCD0;
}

+ (id)fr_feedHeadlineNormalTitleColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_feedHeadlineNormalExcerptColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (id)fr_feedImagePlaceholderColor
{
  if (qword_1000BCCE8 != -1)
    dispatch_once(&qword_1000BCCE8, &stru_1000AA768);
  return (id)qword_1000BCCE0;
}

+ (id)fr_collectionBackgroundGradientStartColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_collectionBackgroundDefaultGradientEndColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)fr_newStoriesGlyphColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_forYouMastheadHeaderDecorationBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_articleNavigationBarBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_defaultBarTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_linkPreviewBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_searchBackgroundColor
{
  if (qword_1000BCCF8 != -1)
    dispatch_once(&qword_1000BCCF8, &stru_1000AA788);
  return (id)qword_1000BCCF0;
}

+ (id)fr_searchResultsCellSelectedBackgroundColor
{
  if (qword_1000BCD08 != -1)
    dispatch_once(&qword_1000BCD08, &stru_1000AA7A8);
  return (id)qword_1000BCD00;
}

+ (id)fr_searchNoResultsTextColor
{
  if (qword_1000BCD18 != -1)
    dispatch_once(&qword_1000BCD18, &stru_1000AA7C8);
  return (id)qword_1000BCD10;
}

+ (id)fr_searchResultsSectionHeaderBackgroundColor
{
  if (qword_1000BCD28 != -1)
    dispatch_once(&qword_1000BCD28, &stru_1000AA7E8);
  return (id)qword_1000BCD20;
}

+ (id)fr_searchResultsSectionHeaderTextColor
{
  if (qword_1000BCD38 != -1)
    dispatch_once(&qword_1000BCD38, &stru_1000AA808);
  return (id)qword_1000BCD30;
}

+ (id)fr_searchResultsCellTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)fr_searchResultsCellDetailTextColor
{
  if (qword_1000BCD48 != -1)
    dispatch_once(&qword_1000BCD48, &stru_1000AA828);
  return (id)qword_1000BCD40;
}

+ (id)fr_searchResultsCellSelectedTintColor
{
  if (qword_1000BCD58 != -1)
    dispatch_once(&qword_1000BCD58, &stru_1000AA848);
  return (id)qword_1000BCD50;
}

+ (id)fr_favoritesBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_keylineColor
{
  if (qword_1000BCD68 != -1)
    dispatch_once(&qword_1000BCD68, &stru_1000AA868);
  return (id)qword_1000BCD60;
}

+ (id)fr_topicCardBorderColorForDarkBackground
{
  if (qword_1000BCD78 != -1)
    dispatch_once(&qword_1000BCD78, &stru_1000AA888);
  return (id)qword_1000BCD70;
}

+ (id)fr_topicCardBorderColorForLightBackground
{
  if (qword_1000BCD88 != -1)
    dispatch_once(&qword_1000BCD88, &stru_1000AA8A8);
  return (id)qword_1000BCD80;
}

+ (id)fr_topicCardBorderColorForParentBackgroundColor:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "fr_colorBin") == (id)2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardBorderColorForDarkBackground](UIColor, "fr_topicCardBorderColorForDarkBackground"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardBorderColorForLightBackground](UIColor, "fr_topicCardBorderColorForLightBackground"));
  return v3;
}

+ (id)fr_topicCardDividerColorForDarkBackground
{
  if (qword_1000BCD98 != -1)
    dispatch_once(&qword_1000BCD98, &stru_1000AA8C8);
  return (id)qword_1000BCD90;
}

+ (id)fr_topicCardDividerColorForLightBackground
{
  if (qword_1000BCDA8 != -1)
    dispatch_once(&qword_1000BCDA8, &stru_1000AA8E8);
  return (id)qword_1000BCDA0;
}

+ (id)fr_topicCardDividerColorForParentBackgroundColor:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "fr_colorBin") == (id)2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardDividerColorForDarkBackground](UIColor, "fr_topicCardDividerColorForDarkBackground"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardDividerColorForLightBackground](UIColor, "fr_topicCardDividerColorForLightBackground"));
  return v3;
}

+ (id)fr_topicCardTextColorForDarkBackground
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)fr_topicCardTextColorForLightBackground
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

+ (id)fr_topicCardTextColorForParentBackgroundColor:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "fr_colorBin") == (id)2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardTextColorForDarkBackground](UIColor, "fr_topicCardTextColorForDarkBackground"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_topicCardTextColorForLightBackground](UIColor, "fr_topicCardTextColorForLightBackground"));
  return v3;
}

+ (id)fr_offlineViewTextColor
{
  if (qword_1000BCDB8 != -1)
    dispatch_once(&qword_1000BCDB8, &stru_1000AA908);
  return (id)qword_1000BCDB0;
}

+ (id)fr_offlineViewBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)fr_purchasingSpinnerViewBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.97254902, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0274509804, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_dynamicColor:withDarkStyleVariant:](UIColor, "fr_dynamicColor:withDarkStyleVariant:", v2, v3));

  return v4;
}

+ (id)fr_dynamicColor:(id)a3 withDarkStyleVariant:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011B98;
  v10[3] = &unk_1000AA930;
  v11 = a4;
  v12 = v5;
  v6 = v5;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v10));

  return v8;
}

+ (id)fr_colorComponentsFromString:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" ")));
  if ((unint64_t)objc_msgSend(v3, "count") < 3)
  {
    v20 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v4, "floatValue");
    v6 = (float)(v5 / 255.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v7, "floatValue");
    v9 = (float)(v8 / 255.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 2));
    objc_msgSend(v10, "floatValue");
    v12 = (float)(v11 / 255.0);

    v13 = 1.0;
    if ((unint64_t)objc_msgSend(v3, "count") >= 4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
      objc_msgSend(v14, "floatValue");
      v13 = (float)(v15 / 255.0);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v22[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    v22[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v22[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    v22[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));

  }
  return v20;
}

- (BOOL)isSimilarToColor:(id)a3
{
  return -[UIColor _isSimilarToColor:withinPercentage:](self, "_isSimilarToColor:withinPercentage:", a3, 0.2);
}

- (BOOL)isAboutEqualToColor:(id)a3
{
  id v4;
  CGColorSpace *DeviceRGB;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[5];

  v4 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100011F30;
  v21[3] = &unk_1000AA950;
  v21[4] = DeviceRGB;
  v6 = objc_retainBlock(v21);
  v7 = ((uint64_t (*)(_QWORD *, UIColor *))v6[2])(v6, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = ((uint64_t (*)(_QWORD *, id))v6[2])(v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  CGColorSpaceRelease(DeviceRGB);
  v19 = 0.0;
  v20 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  objc_msgSend(v8, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  objc_msgSend(v10, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  v11 = vabdd_f64(v20, v16) < 0.00999999978
     && vabdd_f64(v19, v15) < 0.00999999978
     && vabdd_f64(v18, v14) < 0.00999999978
     && vabdd_f64(v17, v13) < 0.3;

  return v11;
}

- (BOOL)isEqualToColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  CGColorSpace *DeviceRGB;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[5];

  v4 = (UIColor *)a3;
  if (self == v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = v4;
    if (v4)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000121BC;
      v20[3] = &unk_1000AA950;
      v20[4] = DeviceRGB;
      v7 = objc_retainBlock(v20);
      v8 = ((uint64_t (*)(_QWORD *, UIColor *))v7[2])(v7, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = ((uint64_t (*)(_QWORD *, UIColor *))v7[2])(v7, v5);
      self = (UIColor *)objc_claimAutoreleasedReturnValue(v10);

      CGColorSpaceRelease(DeviceRGB);
      v18 = 0.0;
      v19 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      objc_msgSend(v9, "getRed:green:blue:alpha:", &v19, &v18, &v17, &v16);
      v14 = 0.0;
      v15 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
      LOBYTE(v5) = vcvtad_u64_f64(v19 * 255.0) == vcvtad_u64_f64(v15 * 255.0)
                && vcvtad_u64_f64(v18 * 255.0) == vcvtad_u64_f64(v14 * 255.0)
                && vcvtad_u64_f64(v17 * 255.0) == vcvtad_u64_f64(v13 * 255.0)
                && vabdd_f64(v16, v12) < 0.00999999978;

    }
    else
    {
      self = 0;
    }
  }

  return (char)v5;
}

+ (id)fr_colorByInterpolatingFromColor:(id)a3 toColor:(id)a4 percent:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  UIColor *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v19 = 0.0;
  v20 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v7 = a4;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  objc_msgSend(v7, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);

  v8 = FCMix(v20, v16, a5);
  v9 = FCMix(v19, v15, a5);
  v10 = FCMix(v18, v14, a5);
  v11 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v8, v9, v10, FCMix(v17, v13, a5));
  return (id)objc_claimAutoreleasedReturnValue(v11);
}

- (void)_getRGBA:(id)a3
{
  void (**v4)(_QWORD, double, double, double, double);
  double v5;
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = (void (**)(_QWORD, double, double, double, double))a3;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
  v4[2](v4, v8, v7, v6, v5);

}

- (void)_getHSBA:(id)a3
{
  void (**v4)(_QWORD, double, double, double, double);
  double v5;
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = (void (**)(_QWORD, double, double, double, double))a3;
  -[UIColor getHue:saturation:brightness:alpha:](self, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);
  v4[2](v4, v8, v7, v6, v5);

}

- (id)fr_description
{
  NSMutableString *v3;
  NSMutableString *v4;
  id v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, double, double, double, double);
  void *v10;
  NSMutableString *v11;
  _QWORD v12[4];
  NSMutableString *v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012538;
  v12[3] = &unk_1000AA978;
  v3 = objc_opt_new(NSMutableString);
  v13 = v3;
  -[UIColor _getRGBA:](self, "_getRGBA:", v12);
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000125FC;
  v10 = &unk_1000AA978;
  v11 = v3;
  v4 = v3;
  -[UIColor _getHSBA:](self, "_getHSBA:", &v7);
  v5 = -[NSMutableString copy](v4, "copy", v7, v8, v9, v10);

  return v5;
}

- (void)print
{
  -[UIColor _getRGBA:](self, "_getRGBA:", &stru_1000AA9B8);
  -[UIColor _getHSBA:](self, "_getHSBA:", &stru_1000AA9D8);
}

- (double)red
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012A1C;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getRGBA:](self, "_getRGBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)green
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012AD4;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getRGBA:](self, "_getRGBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)blue
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012B8C;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getRGBA:](self, "_getRGBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)alpha
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012C44;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getRGBA:](self, "_getRGBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)hue
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012CFC;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getHSBA:](self, "_getHSBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)saturation
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012DB4;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getHSBA:](self, "_getHSBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)brightness
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012E6C;
  v4[3] = &unk_1000AAA00;
  v4[4] = &v5;
  -[UIColor _getHSBA:](self, "_getHSBA:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)fr_colorBin
{
  void *v3;
  unsigned __int8 v4;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = -[UIColor _isSimilarToColor:withinPercentage:](self, "_isSimilarToColor:withinPercentage:", v3, 0.2);

  if ((v4 & 1) != 0)
    return 0;
  -[UIColor _luminance](self, "_luminance");
  if (v6 > 0.3)
    return 1;
  else
    return 2;
}

+ (id)fr_plusLEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = a3;
  v6 = a4;
  v22 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  v19 = 0.0;
  if (v5)
  {
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);

  }
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  if (v6)
  {
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v8, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);

  }
  v9 = v18 * v15 + v22 * v19;
  if (v9 > 1.0)
    v9 = 1.0;
  v10 = v15 * v17 + v21 * v19;
  if (v10 > 1.0)
    v10 = 1.0;
  v11 = v15 * v16 + v20 * v19;
  if (v11 > 1.0)
    v11 = 1.0;
  v12 = v19 + v15;
  if (v19 + v15 > 1.0)
    v12 = 1.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v9, v10, v11, v12, *(_QWORD *)&v15));

  return v13;
}

+ (id)fr_plusDEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v5 = a3;
  v6 = a4;
  v26 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v23 = 0.0;
  if (v5)
  {
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);

  }
  v21 = 0.0;
  v22 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  if (v6)
  {
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v8, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);

  }
  v9 = 1.0 - v26 * v23 + 1.0 - v22 * v19;
  if (v9 <= 1.0)
    v10 = 1.0 - v9;
  else
    v10 = 0.0;
  v11 = 1.0 - v25 * v23 + 1.0 - v21 * v19;
  if (v11 <= 1.0)
    v12 = 1.0 - v11;
  else
    v12 = 0.0;
  v13 = 1.0 - v24 * v23 + 1.0 - v20 * v19;
  if (v13 <= 1.0)
    v14 = 1.0 - v13;
  else
    v14 = 0.0;
  v15 = 1.0 - v23 + 1.0 - v19;
  if (v15 <= 1.0)
    v16 = 1.0 - v15;
  else
    v16 = 0.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10, v12, v14, v16, *(_QWORD *)&v19));

  return v17;
}

+ (id)fr_accessoryColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  if (!v7)
LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
LABEL_4:
  v8 = objc_msgSend(v5, "fr_colorBin");
  if ((unint64_t)v8 < 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.4));
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor fr_plusLEffectWithForegroundColor:backgroundColor:](UIColor, "fr_plusLEffectWithForegroundColor:backgroundColor:", v9, v7));
LABEL_9:
    v11 = (void *)v10;
    goto LABEL_12;
  }
  if (v8 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.4));
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor fr_plusDEffectWithForegroundColor:backgroundColor:](UIColor, "fr_plusDEffectWithForegroundColor:backgroundColor:", v9, v7));
    goto LABEL_9;
  }
  v9 = 0;
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)fr_subscriptionGlyphColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (char *)objc_msgSend(v7, "fr_colorBin");
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.960784314, 0.635294118, 0.105882353, 1.0));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fr_accessoryColorForTextColor:backgroundColor:", v6, v7));
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

+ (id)fr_likeLikeGlyphCellColor
{
  if (qword_1000BCDC8 != -1)
    dispatch_once(&qword_1000BCDC8, &stru_1000AAA20);
  return (id)qword_1000BCDC0;
}

+ (id)fr_likeDislikeGlyphCellColor
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

+ (id)fr_saveGlyphCellColor
{
  if (qword_1000BCDD8 != -1)
    dispatch_once(&qword_1000BCDD8, &stru_1000AAA40);
  return (id)qword_1000BCDD0;
}

+ (id)fr_colorBetweenGradientColors:(id)a3 andColor:(id)a4 atPosition:(double)a5
{
  id v7;
  id v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "red");
  v10 = v9;
  objc_msgSend(v7, "red");
  v12 = v11;
  objc_msgSend(v8, "red");
  v14 = v10 + a5 * (v12 - v13);
  objc_msgSend(v8, "green");
  v16 = v15;
  objc_msgSend(v7, "green");
  v18 = v17;
  objc_msgSend(v8, "green");
  v20 = v16 + a5 * (v18 - v19);
  objc_msgSend(v8, "blue");
  v22 = v21;
  objc_msgSend(v7, "blue");
  v24 = v23;

  objc_msgSend(v8, "blue");
  v26 = v25;

  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v14, v20, v22 + a5 * (v24 - v26), 1.0);
}

+ (id)fr_referredUserInterstitialAndWelcomeToNewsRedColor
{
  if (qword_1000BCDE8 != -1)
    dispatch_once(&qword_1000BCDE8, &stru_1000AAA60);
  return (id)qword_1000BCDE0;
}

+ (id)fr_followingInstructionTextColor
{
  if (qword_1000BCDF8 != -1)
    dispatch_once(&qword_1000BCDF8, &stru_1000AAA80);
  return (id)qword_1000BCDF0;
}

+ (id)gradientColorForImage:(id)a3
{
  return +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", a3);
}

- (id)fr_ensureVisibleOnBackgroundColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIColor *v9;
  UIColor *v10;

  v4 = a3;
  -[UIColor _luminance](self, "_luminance");
  if (v5 >= 0.85 && (objc_msgSend(v4, "_luminance"), v6 >= 0.85))
  {
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  else
  {
    -[UIColor _luminance](self, "_luminance");
    if (v7 <= 0.15 && (objc_msgSend(v4, "_luminance"), v8 <= 0.15))
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    else
      v9 = self;
  }
  v10 = v9;

  return v10;
}

@end
