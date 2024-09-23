@implementation WAAQIView

- (void)initialize
{
  UILabel *v3;
  UILabel *aqiLabel;
  UILabel *v5;
  UILabel *aqiIndexLabel;
  UILabel *v7;
  UILabel *aqiAgencyLabel;
  UILabel *v9;
  UILabel *dash;
  WAAQIScaleView *v11;
  WAAQIScaleView *v12;
  WAAQIScaleView *aqiScaleView;
  UILabel *v14;
  UILabel *aqiCategoryLabel;
  UILabel *v16;
  UILabel *airQualityMetadataGradeLabel;
  UILabel *v18;
  UILabel *airQualityRecommendationLabel;
  UILabel *v20;
  UILabel *aqiCitationLabel;
  WAAQIViewStyler *v22;
  WAAQIViewStyler *styler;
  WAAQIAttributionStringBuilder *v24;
  WAAQIAttributionStringBuilder *attributionStringBuilder;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  aqiLabel = self->_aqiLabel;
  self->_aqiLabel = v3;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  aqiIndexLabel = self->_aqiIndexLabel;
  self->_aqiIndexLabel = v5;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  aqiAgencyLabel = self->_aqiAgencyLabel;
  self->_aqiAgencyLabel = v7;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  dash = self->_dash;
  self->_dash = v9;

  v11 = [WAAQIScaleView alloc];
  v12 = -[WAAQIScaleView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  aqiScaleView = self->_aqiScaleView;
  self->_aqiScaleView = v12;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
  aqiCategoryLabel = self->_aqiCategoryLabel;
  self->_aqiCategoryLabel = v14;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v16 = (UILabel *)objc_claimAutoreleasedReturnValue();
  airQualityMetadataGradeLabel = self->_airQualityMetadataGradeLabel;
  self->_airQualityMetadataGradeLabel = v16;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  airQualityRecommendationLabel = self->_airQualityRecommendationLabel;
  self->_airQualityRecommendationLabel = v18;

  +[WAAQIView createWeatherLabelWithLightColor:](WAAQIView, "createWeatherLabelWithLightColor:", 0);
  v20 = (UILabel *)objc_claimAutoreleasedReturnValue();
  aqiCitationLabel = self->_aqiCitationLabel;
  self->_aqiCitationLabel = v20;

  -[UILabel setNumberOfLines:](self->_aqiLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_aqiIndexLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_aqiAgencyLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_aqiCategoryLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_airQualityMetadataGradeLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_airQualityRecommendationLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_aqiCitationLabel, "setNumberOfLines:", 0);
  self->_layoutMode = 1;
  v22 = objc_alloc_init(WAAQIViewStyler);
  styler = self->_styler;
  self->_styler = v22;

  v24 = objc_alloc_init(WAAQIAttributionStringBuilder);
  attributionStringBuilder = self->_attributionStringBuilder;
  self->_attributionStringBuilder = v24;

  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiIndexLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiAgencyLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_dash);
  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiScaleView);
  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiCategoryLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_aqiCitationLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_airQualityMetadataGradeLabel);
  -[WAAQIView addSubview:](self, "addSubview:", self->_airQualityRecommendationLabel);
  self->_hideCitationString = 0;
  self->_forceHideThisEntireView = 0;
  self->_initialized = 1;
}

- (void)updateWithCity:(id)a3 layoutMode:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  WAAQIView *v9;
  uint64_t v10;

  v6 = a3;
  if (!-[WAAQIView initialized](self, "initialized"))
    -[WAAQIView initialize](self, "initialize");
  -[WAAQIView prepareForReuse](self, "prepareForReuse");
  -[WAAQIView setCity:](self, "setCity:", v6);

  -[WAAQIView setLayoutMode:](self, "setLayoutMode:", a4);
  -[WAAQIView city](self, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "aqiDataAvailabilityStatus");

  if (v8 == 2)
  {
    switch(-[WAAQIView layoutMode](self, "layoutMode"))
    {
      case 0uLL:
        -[WAAQIView setupForLayoutExtendedNoScaleView](self, "setupForLayoutExtendedNoScaleView");
        break;
      case 1uLL:
        v9 = self;
        v10 = 0;
        goto LABEL_11;
      case 2uLL:
        -[WAAQIView setupForLayoutExtendedScaleView](self, "setupForLayoutExtendedScaleView");
        break;
      case 3uLL:
        v9 = self;
        v10 = 1;
LABEL_11:
        -[WAAQIView setupForLayoutCompactScaleViewOneLinePlatterView:](v9, "setupForLayoutCompactScaleViewOneLinePlatterView:", v10);
        break;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
    -[WAAQIView setupForLayoutTemporarilyUnavailable](self, "setupForLayoutTemporarilyUnavailable");
  }
  -[WAAQIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)handleTapGesture:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  CGPoint v21;
  CGRect v22;

  v4 = a3;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "locationInView:", v20);
  v14 = v13;
  v16 = v15;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v21.x = v14;
  v21.y = v16;
  if (CGRectContainsPoint(v22, v21))
  {
    -[WAAQIView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[WAAQIView delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aqiViewAttributionLabelTapped:", self);

    }
  }

}

- (double)contentMarginFromTop
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstBaselineOffsetFromTop");
  v5 = v4;

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capHeight");
  v9 = v8;

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v5 - v9 + v11;

  return v12;
}

+ (id)createWeatherLabelWithLightColor:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDF6B68]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  +[WAAQIViewStyler shadowColor](WAAQIViewStyler, "shadowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v8);

  objc_msgSend(v5, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v5, "setShadowBlur:", 3.0);
  return v5;
}

- (id)scaleDisplayNameForCity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "airQualityScale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView city](self, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Using displayName: %@ for city: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v4, "airQualityScale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)metadataLabelForCity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "airQualityScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedUppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)drawableScaleForCity:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "airQualityScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[WAAQIView city](self, "city");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Using scale: %@ for gradient for city: %@", (uint8_t *)&v9, 0x16u);

  }
  +[WAAQIScale scaleFromFoundationScale:](WAAQIScale, "scaleFromFoundationScale:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentScaleCategoryLabelForCity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "airQualityScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    WALogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "No scale - bailing", buf, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "airQualityCurrentScaleCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    WALogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "No current scale category - bailing", v10, 2u);
    }

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  -[NSObject categoryName](v5, "categoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

- (CGRect)adjustedFrame:(CGRect)a3 basedOnFont:(id)a4 desiredBaseline:(double)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "ascender");
  v11 = y + a5 - (y + v10);
  v12 = x;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGRect)rtlAdjustFrame:(CGRect)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat MinY;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  MinY = a3.origin.y;
  v11 = a3.origin.x;
  if (IsUIRTL())
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MaxX = CGRectGetMaxX(v18);
    v19.origin.x = v11;
    v19.origin.y = MinY;
    v19.size.width = v9;
    v19.size.height = v8;
    v13 = MaxX - CGRectGetMaxX(v19);
    v20.origin.x = v11;
    v20.origin.y = MinY;
    v20.size.width = v9;
    v20.size.height = v8;
    MinY = CGRectGetMinY(v20);
    v11 = v13;
  }
  v14 = v11;
  v15 = MinY;
  v16 = v9;
  v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", 0);

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", 0);

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", 0);

  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", 0);

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", 0);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[WAAQIView setHideCitationString:](self, "setHideCitationString:", 0);
  -[WAAQIView setForceHideThisEntireView:](self, "setForceHideThisEntireView:", 0);
}

- (BOOL)shouldInsertGlyphImage:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "airQualityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dataOrigination");

  if (v5 > 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "airQualityLearnMoreURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }

  return v7;
}

- (void)setupForLayoutTemporarilyUnavailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[WAAQIView city](self, "city");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[WAAQIView styler](self, "styler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView metadataLabelForCity:](self, "metadataLabelForCity:", v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styledAQIMetadataSourceText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[WAAQIView styler](self, "styler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView scaleDisplayNameForCity:](self, "scaleDisplayNameForCity:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styledAQIMetadataSourceText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

  -[WAAQIView styler](self, "styler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AQI_VIEW_STATUS_UNAVAILABLE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styledAQIMetadataGradeText:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAttributedText:", v14);

  -[WAAQIView styler](self, "styler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AQI_VIEW_RECOMMENDATION_STATUS_UNAVAILABLE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "styledAQIMetadataCitationText:attribution:shouldInsertGlyph:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAttributedText:", v19);

}

- (void)setupForLayoutCompactScaleViewOneLinePlatterView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = a3;
  -[WAAQIView city](self, "city");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScale:", v5);

    v7 = !WAIsShortDevice();
    if (v3)
      v8 = 3;
    else
      v8 = 1;
    -[WAAQIView styler](self, "styler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AQI_SHORT_STRING"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styledAQIText:mode:", v11, v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedText:", v12);

    -[WAAQIView aqiLabel](self, "aqiLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 1);

    WANumberFormatterForDisplayingAQI();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "airQualityIdx");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromNumber:", v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v30, "airQualityScaleIsNumerical") & 1) == 0)
    {

      v17 = &stru_24DD9EDF8;
    }
    -[WAAQIView currentScaleCategoryLabelForCity:](self, "currentScaleCategoryLabelForCity:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "airQualityIdx");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAQI:", v20);

    -[WAAQIView styler](self, "styler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "styledAQILocalizedIndexText:mode:", v17, v8, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttributedText:", v23);

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNumberOfLines:", 1);

    -[WAAQIView styler](self, "styler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "styledAQICategoryText:mode:", v18, v8, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAttributedText:", v27);

    -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNumberOfLines:", 1);

  }
  else
  {
    -[WAAQIView setForceHideThisEntireView:](self, "setForceHideThisEntireView:", 1);
  }

}

- (void)setupForLayoutCompactScaleViewTwoLinesPlatterView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v3 = a3;
  -[WAAQIView prepareForReuse](self, "prepareForReuse");
  -[WAAQIView city](self, "city");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v5;
    objc_msgSend(v6, "setScale:", v5);

    v7 = !WAIsShortDevice();
    if (v3)
      v8 = 4;
    else
      v8 = 2;
    -[WAAQIView styler](self, "styler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AQI_SHORT_STRING"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styledAQIText:mode:", v11, v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WANumberFormatterForDisplayingAQI();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "airQualityIdx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAAQIView currentScaleCategoryLabelForCity:](self, "currentScaleCategoryLabelForCity:", v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "airQualityIdx");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAQI:", v18);

    -[WAAQIView styler](self, "styler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "styledAQILocalizedIndexText:mode:", v15, v8, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAAQIView styler](self, "styler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "styledAQICategoryText:mode:", v16, v8, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAAQIView styler](self, "styler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "styledAQICategoryText:mode:", CFSTR(" "), v8, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAAQIView styler](self, "styler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "styledDashWithLabelColor:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc_init(MEMORY[0x24BDD1688]);
    objc_msgSend(v28, "appendAttributedString:", v12);
    objc_msgSend(v28, "appendAttributedString:", v25);
    if (objc_msgSend(v32, "airQualityScaleIsNumerical"))
    {
      objc_msgSend(v28, "appendAttributedString:", v21);
      objc_msgSend(v28, "appendAttributedString:", v25);
    }
    objc_msgSend(v28, "appendAttributedString:", v27);
    objc_msgSend(v28, "appendAttributedString:", v25);
    objc_msgSend(v28, "appendAttributedString:", v23);
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAttributedText:", v28);

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setNumberOfLines:", 0);

    v5 = v31;
  }
  else
  {
    -[WAAQIView setForceHideThisEntireView:](self, "setForceHideThisEntireView:", 1);
  }

}

- (void)setupForLayoutExtendedScaleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  -[WAAQIView setHideRecommendationString:](self, "setHideRecommendationString:", 1);
  -[WAAQIView setHideCitationString:](self, "setHideCitationString:", 0);
  -[WAAQIView city](self, "city");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScale:", v3);

    -[WAAQIView styler](self, "styler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView metadataLabelForCity:](self, "metadataLabelForCity:", v38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styledAQIMetadataSourceText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v7);

    -[WAAQIView styler](self, "styler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView scaleDisplayNameForCity:](self, "scaleDisplayNameForCity:", v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styledAQIMetadataSourceText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v11);

    objc_msgSend(v38, "airQualityIdx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAQI:", v14);

    -[WAAQIView currentScaleCategoryLabelForCity:](self, "currentScaleCategoryLabelForCity:", v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "airQualityScaleIsNumerical"))
    {
      WANumberFormatterForDisplayingAQI();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "airQualityIdx");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromNumber:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("AQI_INDEX_STRING"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v21, v19, v16);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = v16;
    }
    -[WAAQIView styler](self, "styler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "styledAQIMetadataGradeText:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v25, "setAttributedText:", v24);

    -[WAAQIView city](self, "city");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "airQualityAttribution");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_msgSend(v27, "isValid");

    if ((v25 & 1) != 0)
    {
      -[WAAQIView attributionStringBuilder](self, "attributionStringBuilder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView city](self, "city");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "buildAttributionStringFromCity:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[WAAQIView city](self, "city");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[WAAQIView shouldInsertGlyphImage:](self, "shouldInsertGlyphImage:", v31);

      -[WAAQIView styler](self, "styler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView city](self, "city");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "airQualityAttribution");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "styledAQIMetadataCitationText:attribution:shouldInsertGlyph:", v30, v35, v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAttributedText:", v36);

    }
    else
    {
      -[WAAQIView setHideCitationString:](self, "setHideCitationString:", 1);
    }

  }
  else
  {
    -[WAAQIView setForceHideThisEntireView:](self, "setForceHideThisEntireView:", 1);
  }

}

- (void)setupForLayoutExtendedNoScaleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  -[WAAQIView setHideRecommendationString:](self, "setHideRecommendationString:", 0);
  -[WAAQIView setHideCitationString:](self, "setHideCitationString:", 0);
  -[WAAQIView city](self, "city");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "airQualityScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAAQIView styler](self, "styler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView metadataLabelForCity:](self, "metadataLabelForCity:", v39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "styledAQIMetadataSourceText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);

    -[WAAQIView styler](self, "styler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView scaleDisplayNameForCity:](self, "scaleDisplayNameForCity:", v39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "styledAQIMetadataSourceText:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v10);

    -[WAAQIView currentScaleCategoryLabelForCity:](self, "currentScaleCategoryLabelForCity:", v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "airQualityScaleIsNumerical"))
    {
      WANumberFormatterForDisplayingAQI();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "airQualityIdx");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AQI_INDEX_STRING"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v17, v15, v12);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = v12;
    }
    -[WAAQIView styler](self, "styler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "styledAQIMetadataGradeText:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttributedText:", v20);

    objc_msgSend(v39, "airQualityRecommendation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && !objc_msgSend(v39, "airQualityForceHideRecommendation"))
    {
      -[WAAQIView styler](self, "styler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "styledAQIMetadataRecommendationText:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAttributedText:", v24);

    }
    else
    {
      -[WAAQIView setHideRecommendationString:](self, "setHideRecommendationString:", 1);
    }
    -[WAAQIView city](self, "city");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "airQualityAttribution");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isValid");

    if ((v28 & 1) != 0)
    {
      -[WAAQIView attributionStringBuilder](self, "attributionStringBuilder");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView city](self, "city");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "buildAttributionStringFromCity:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[WAAQIView city](self, "city");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WAAQIView shouldInsertGlyphImage:](self, "shouldInsertGlyphImage:", v32);

      -[WAAQIView styler](self, "styler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView city](self, "city");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "airQualityAttribution");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "styledAQIMetadataCitationText:attribution:shouldInsertGlyph:", v31, v36, v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAttributedText:", v37);

    }
    else
    {
      -[WAAQIView setHideCitationString:](self, "setHideCitationString:", 1);
    }

  }
  else
  {
    -[WAAQIView setForceHideThisEntireView:](self, "setForceHideThisEntireView:", 1);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WAAQIView city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "aqiDataAvailabilityStatus");

  if (v7 == 2)
  {
    -[WAAQIView sizeForAQIAvailableThatFits:](self, "sizeForAQIAvailableThatFits:", width, height);
  }
  else if (v7 == 1)
  {
    -[WAAQIView sizeForAQITemporarilyUnavailableThatFits:](self, "sizeForAQITemporarilyUnavailableThatFits:", width, height);
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeForAQIAvailableThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  WAAQIView *v8;
  double v9;
  double v10;
  uint64_t v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  switch(-[WAAQIView layoutMode](self, "layoutMode"))
  {
    case 0uLL:
      -[WAAQIView sizeForLayoutWithoutScaleViewThatFits:](self, "sizeForLayoutWithoutScaleViewThatFits:", width, height);
      break;
    case 1uLL:
      v8 = self;
      v9 = width;
      v10 = height;
      v11 = 0;
      goto LABEL_7;
    case 2uLL:
      -[WAAQIView sizeForExtendedLayoutWithScaleViewThatFits:](self, "sizeForExtendedLayoutWithScaleViewThatFits:", width, height);
      break;
    case 3uLL:
      v8 = self;
      v9 = width;
      v10 = height;
      v11 = 1;
LABEL_7:
      -[WAAQIView sizeForCompactOneLineLayoutWithScaleViewThatFits:platterView:](v8, "sizeForCompactOneLineLayoutWithScaleViewThatFits:platterView:", v11, v9, v10);
      break;
    default:
      v6 = *MEMORY[0x24BDBF148];
      v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
      break;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeForCompactOneLineLayoutWithScaleViewThatFits:(CGSize)a3 platterView:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView");
  v9 = 0.0;
  v10 = 0.0;
  if (!v8)
  {
    -[WAAQIView aqiLabel](self, "aqiLabel", 0.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", width, height);
    v13 = v12;

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeThatFits:", width, height);
    v16 = v15;

    -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeThatFits:", width, height);
    v19 = v18;

    if (floor(width - v13 - v16 - v19 + -24.0) <= 130.0)
    {
      -[WAAQIView sizeForTwoLineLayoutWithScaleViewTheFits:platterView:](self, "sizeForTwoLineLayoutWithScaleViewTheFits:platterView:", v4, width, height);
    }
    else
    {
      v20 = WAIsShortDevice();
      if (v20)
        v21 = 9.0;
      else
        v21 = 16.0;
      if (v20)
        v22 = 10.0;
      else
        v22 = 19.0;
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "attributedText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "wa_font");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "capHeight");
      v27 = v26;

      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attributedText");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "wa_font");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "capHeight");
      v32 = v31;

      if (v27 >= v32)
        v33 = v32;
      else
        v33 = v27;
      v10 = v21 + v22 + v33;
      v9 = width;
    }
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeForTwoLineLayoutWithScaleViewTheFits:(CGSize)a3 platterView:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat width;
  BOOL v7;
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
  void *v18;
  void *v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double Height;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGSize result;
  CGRect v35;

  v4 = a4;
  width = a3.width;
  v7 = -[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView", a3.width, a3.height);
  v8 = 0.0;
  v9 = 0.0;
  if (!v7)
  {
    -[WAAQIView setupForLayoutCompactScaleViewTwoLinesPlatterView:](self, "setupForLayoutCompactScaleViewTwoLinesPlatterView:", v4, 0.0, 0.0);
    -[WAAQIView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeToFit");

    v20 = WAIsShortDevice();
    if (v20)
      v21 = 8.0;
    else
      v21 = 11.0;
    if (v20)
      v22 = 11.0;
    else
      v22 = 12.0;
    if (v20)
      v23 = 11.0;
    else
      v23 = 10.0;
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    Height = CGRectGetHeight(v35);
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributedText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "wa_font");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "descender");
    v30 = Height + v29;

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "intrinsicContentSize");
    v33 = v32;

    v9 = v22 + v21 + v23 + v30 + v33;
    v8 = width;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeForAQITemporarilyUnavailableThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGSize result;

  width = a3.width;
  -[WAAQIView bounds](self, "bounds", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[WAAQIView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[WAAQIView bounds](self, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  -[WAAQIView bounds](self, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeToFit");

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sizeToFit");

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sizeToFit");

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sizeToFit");

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "attributedText");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "wa_font");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "ascender");
  v49 = v48;

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "attributedText");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "wa_font");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "ascender");
  v54 = v53;

  if (v49 >= v54)
    v54 = v49;
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "attributedText");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "wa_font");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "descender");
  v59 = v58;
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "frame");
  v62 = v59 + v61;

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "attributedText");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "wa_font");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "descender");
  v67 = v66;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "frame");
  v70 = v67 + v69;

  v71 = v54 + 6.0 + 1.0 + v62 + v70 + 9.0;
  v72 = width;
  result.height = v71;
  result.width = v72;
  return result;
}

- (CGSize)sizeForExtendedLayoutWithScaleViewThatFits:(CGSize)a3
{
  double width;
  BOOL v5;
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
  void *v16;
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
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  double v59;
  double v60;
  _BOOL4 v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  CGSize result;

  width = a3.width;
  v5 = -[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView", a3.width, a3.height);
  v6 = 0.0;
  v7 = 0.0;
  if (!v5)
  {
    -[WAAQIView bounds](self, "bounds", 0.0, 0.0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    -[WAAQIView bounds](self, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    -[WAAQIView bounds](self, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

    -[WAAQIView bounds](self, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

    -[WAAQIView bounds](self, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    -[WAAQIView aqiLabel](self, "aqiLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "sizeToFit");

    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sizeToFit");

    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sizeToFit");

    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "sizeToFit");

    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "sizeToFit");

    v58 = -[WAAQIView hideRecommendationString](self, "hideRecommendationString");
    v59 = 9.0;
    v60 = 0.0;
    if (v58)
      v59 = 0.0;
    v108 = v59;
    v61 = -[WAAQIView hideCitationString](self, "hideCitationString");
    v62 = 8.0;
    if (v61)
      v62 = 0.0;
    -[WAAQIView aqiLabel](self, "aqiLabel", *(_QWORD *)&v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "attributedText");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "wa_font");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "ascender");
    v67 = v66;

    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "attributedText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "wa_font");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "ascender");
    v72 = v71;

    if (v67 >= v72)
      v73 = v67;
    else
      v73 = v72;
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "attributedText");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "wa_font");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "descender");
    v78 = v77;
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "frame");
    v81 = v78 + v80;

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "intrinsicContentSize");
    v84 = v83;

    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "attributedText");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "wa_font");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "descender");
    v89 = v88;
    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "frame");
    v92 = v89 + v91;

    if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
    {
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "attributedText");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "wa_font");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "descender");
      v97 = v96;
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "frame");
      v60 = v97 + v99;

    }
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "frame");
    v102 = v101;
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "frame");
    v105 = v102 + v104 + 10.0;

    v106 = v73 + v73 + 1.0;
    if (v105 < width)
      v106 = v73;
    v7 = v60 + v107 + v92 + v108 + v84 + v81 + v106 + 6.0 + 1.0 + 10.0 + 9.0;
    v6 = width;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeForLayoutWithoutScaleViewThatFits:(CGSize)a3
{
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat width;
  CGSize result;

  width = a3.width;
  -[WAAQIView bounds](self, "bounds", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[WAAQIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[WAAQIView bounds](self, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  -[WAAQIView bounds](self, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  -[WAAQIView bounds](self, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sizeToFit");

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sizeToFit");

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sizeToFit");

  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sizeToFit");

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sizeToFit");

  v54 = -[WAAQIView hideCitationString](self, "hideCitationString");
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "attributedText");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "wa_font");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "ascender");
  v59 = v58;

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "attributedText");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "wa_font");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "ascender");
  v64 = v63;

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "attributedText");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "wa_font");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "descender");
  v69 = v68;
  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "frame");
  v72 = v71;

  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "attributedText");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "wa_font");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "descender");
  v77 = v76;
  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "frame");
  v80 = v79;

  v81 = 0.0;
  if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
  {
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "attributedText");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "wa_font");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "descender");
    v86 = v85;
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "frame");
    v81 = v86 + v88;

  }
  if (v59 >= v64)
    v89 = v59;
  else
    v89 = v64;
  v90 = 8.0;
  if (v54)
    v90 = 0.0;
  v91 = v90 + v89 + 6.0 + 1.0 + v69 + v72 + 10.0 + v77 + v80 + v81 + 9.0;
  v92 = width;
  result.height = v91;
  result.width = v92;
  return result;
}

- (void)hideEverything
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[WAAQIView dash](self, "dash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[WAAQIView aqiScaleView](self, "aqiScaleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  WAAQIView *v5;
  uint64_t v6;

  -[WAAQIView hideEverything](self, "hideEverything");
  -[WAAQIView city](self, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aqiDataAvailabilityStatus");

  if (v4 == 1)
  {
    -[WAAQIView layoutForModeAQITemporarilyUnavailable](self, "layoutForModeAQITemporarilyUnavailable");
  }
  else if (v4 == 2)
  {
    switch(-[WAAQIView layoutMode](self, "layoutMode"))
    {
      case 0uLL:
        -[WAAQIView layoutForModeWithoutScale](self, "layoutForModeWithoutScale");
        break;
      case 1uLL:
        v5 = self;
        v6 = 0;
        goto LABEL_10;
      case 2uLL:
        -[WAAQIView layoutForExtendedModeWithScale](self, "layoutForExtendedModeWithScale");
        break;
      case 3uLL:
        v5 = self;
        v6 = 1;
LABEL_10:
        -[WAAQIView layoutForCompactModeWithScaleInPlatterView:](v5, "layoutForCompactModeWithScaleInPlatterView:", v6);
        break;
      default:
        return;
    }
  }
}

- (void)layoutForCompactModeWithScaleInPlatterView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
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
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
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
  double v104;
  double v105;
  void *v106;
  void *v107;
  CGFloat v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
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
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  CGFloat rect;
  double v155;
  double v156;
  double v157;
  id v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;

  v3 = a3;
  if (!-[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView"))
  {
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView bounds](self, "bounds");
    objc_msgSend(v5, "sizeThatFits:", v6, v7);
    v9 = v8;

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView bounds](self, "bounds");
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    v14 = v13;

    -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIView bounds](self, "bounds");
    objc_msgSend(v15, "sizeThatFits:", v16, v17);
    v19 = v18;

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intrinsicContentSize");
    v22 = v21;

    if (v14 <= 0.0)
      v23 = 16.0;
    else
      v23 = 24.0;
    -[WAAQIView bounds](self, "bounds");
    v25 = floor(v24 - v9 - v14 - v19 - v23);
    if (v25 <= 130.0)
    {
      -[WAAQIView layoutForTwoLinesLayoutWithScaleInPlatterView:](self, "layoutForTwoLinesLayoutWithScaleInPlatterView:", v3);
    }
    else
    {
      v155 = v25;
      v156 = v22;
      if (WAIsShortDevice())
        v26 = 9.0;
      else
        v26 = 16.0;
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sizeToFit");

      -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sizeToFit");

      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sizeToFit");

      -[WAAQIView aqiLabel](self, "aqiLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 0);

      -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 0);

      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHidden:", 0);

      -[WAAQIView aqiScaleView](self, "aqiScaleView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 0);

      -[WAAQIView bounds](self, "bounds");
      v34 = CGRectGetMaxY(v159) - v26;
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v37 = v36;
      v39 = v38;

      v40 = *MEMORY[0x24BDBEFB0];
      -[WAAQIView frame](self, "frame");
      v42 = v41 * 0.5 - v39 * 0.5;
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "attributedText");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "wa_font");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = v34;
      -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v45, v40, v42, v37, v39, v34);
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;

      -[WAAQIView bounds](self, "bounds");
      rect = v51;
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v47, v49, v51, v53, v54, v55, v56, v57);
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v65 = v64;
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

      -[WAAQIView aqiLabel](self, "aqiLabel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "frame");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;

      -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "frame");
      v78 = v77;

      if (v78 > 0.0)
      {
        -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "frame");
        v81 = v80;
        v83 = v82;

        v160.origin.x = v47;
        v160.origin.y = v49;
        v160.size.width = rect;
        v160.size.height = v53;
        v84 = CGRectGetMaxX(v160) + 8.0;
        -[WAAQIView frame](self, "frame");
        v86 = v85 * 0.5 - v83 * 0.5;
        -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "attributedText");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "wa_font");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v89, v84, v86, v81, v83, v157);
        v69 = v90;
        v71 = v91;
        v73 = v92;
        v75 = v93;

        -[WAAQIView bounds](self, "bounds");
        -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v69, v71, v73, v75, v94, v95, v96, v97);
        v99 = v98;
        v101 = v100;
        v103 = v102;
        v105 = v104;
        -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setFrame:", v99, v101, v103, v105);

      }
      -[WAAQIView aqiScaleView](self, "aqiScaleView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "frame");

      v161.origin.x = v69;
      v161.origin.y = v71;
      v161.size.width = v73;
      v161.size.height = v75;
      v108 = CGRectGetMaxX(v161) + 8.0;
      v162.origin.x = v69;
      v162.origin.y = v71;
      v162.size.width = v73;
      v162.size.height = v75;
      v109 = CGRectGetMaxY(v162) - v75 * 0.5 - v156 * 0.5;
      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v108, v109, v155, v156, v110, v111, v112, v113);
      v115 = v114;
      v117 = v116;
      v119 = v118;
      v121 = v120;
      -[WAAQIView aqiScaleView](self, "aqiScaleView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "setFrame:", v115, v117, v119, v121);

      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "frame");
      v125 = v124;
      v127 = v126;

      v163.origin.x = v108;
      v163.origin.y = v109;
      v163.size.width = v155;
      v163.size.height = v156;
      v128 = CGRectGetMaxX(v163) + 8.0;
      -[WAAQIView frame](self, "frame");
      v130 = v129 * 0.5 - v127 * 0.5;
      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "attributedText");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "wa_font");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v133, v128, v130, v125, v127, v157);
      v135 = v134;
      v137 = v136;
      v139 = v138;
      v141 = v140;

      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v135, v137, v139, v141, v142, v143, v144, v145);
      v147 = v146;
      v149 = v148;
      v151 = v150;
      v153 = v152;
      -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
      v158 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setFrame:", v147, v149, v151, v153);

    }
  }
}

- (void)layoutForTwoLinesLayoutWithScaleInPlatterView:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
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
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
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
  id v63;
  id v64;
  CGRect v65;

  v3 = a3;
  if (!-[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView"))
  {
    -[WAAQIView setupForLayoutCompactScaleViewTwoLinesPlatterView:](self, "setupForLayoutCompactScaleViewTwoLinesPlatterView:", v3);
    -[WAAQIView hideEverything](self, "hideEverything");
    -[WAAQIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeToFit");

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

    v17 = WAIsShortDevice();
    v18 = 8.0;
    if (!v17)
      v18 = 11.0;
    v62 = v18;
    if (v17)
      v19 = 11.0;
    else
      v19 = 10.0;
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intrinsicContentSize");
    v63 = v21;

    -[WAAQIView frame](self, "frame");
    v61 = v22;
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;

    v28 = *MEMORY[0x24BDBEFB0];
    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v28, v19, v25, v27, v29, v30, v31, v32);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);

    -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "attributedText");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "wa_font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descender");
    v46 = v45;
    v65.origin.x = v28;
    v65.origin.y = v19;
    v65.size.width = v25;
    v65.size.height = v27;
    v47 = v46 + CGRectGetMaxY(v65);

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frame");

    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v28, v62 + v47, v61, *(double *)&v63, v49, v50, v51, v52);
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", v54, v56, v58, v60);

  }
}

- (void)layoutForModeAQITemporarilyUnavailable
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
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
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
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  id v132;
  CGRect v133;
  CGRect v134;

  -[WAAQIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

  -[WAAQIView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeToFit");

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

  -[WAAQIView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sizeToFit");

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", 0);

  -[WAAQIView bounds](self, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sizeToFit");

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setHidden:", 0);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "frame");
  v49 = v48;
  v51 = v50;

  v52 = *MEMORY[0x24BDBEFB0];
  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, 6.0, v49, v51, v53, v54, v55, v56);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "frame");
  v68 = v67;
  v70 = v69;

  -[WAAQIView bounds](self, "bounds");
  v71 = CGRectGetMaxX(v133) - v68;
  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v71, 6.0, v68, v70, v72, v73, v74, v75);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFrame:", v77, v79, v81, v83);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "attributedText");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "wa_font");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "ascender");
  v89 = v88;

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "frame");
  v92 = v91;
  v94 = v93;

  v95 = v89 + 1.0;
  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, v95, v92, v94, v96, v97, v98, v99);
  v101 = v100;
  v103 = v102;
  v105 = v104;
  v107 = v106;
  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "attributedText");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "wa_font");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "descender");
  v113 = v112;
  v134.origin.x = v52;
  v134.origin.y = v95;
  v134.size.width = v92;
  v134.size.height = v94;
  v114 = v113 + CGRectGetMaxY(v134);

  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "frame");
  v117 = v116;
  v119 = v118;

  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, v114 + 1.0, v117, v119, v120, v121, v122, v123);
  v125 = v124;
  v127 = v126;
  v129 = v128;
  v131 = v130;
  -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
  v132 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setFrame:", v125, v127, v129, v131);

}

- (void)layoutForExtendedModeWithScale
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
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  CGFloat v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  void *v173;
  double MaxY;
  void *v175;
  double v176;
  double v177;
  double v178;
  double v179;
  CGFloat v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  double v197;
  double v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  id v217;
  id v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;

  if (!-[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView"))
  {
    -[WAAQIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    -[WAAQIView aqiLabel](self, "aqiLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeToFit");

    -[WAAQIView aqiLabel](self, "aqiLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    -[WAAQIView bounds](self, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeToFit");

    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 0);

    -[WAAQIView bounds](self, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sizeToFit");

    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setHidden:", 0);

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 0);

    if (!-[WAAQIView hideRecommendationString](self, "hideRecommendationString"))
    {
      -[WAAQIView bounds](self, "bounds");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "sizeToFit");

      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setHidden:", 0);

    }
    if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
    {
      -[WAAQIView bounds](self, "bounds");
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "sizeToFit");

      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setHidden:", 0);

    }
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "intrinsicContentSize");
    v217 = v60;

    -[WAAQIView frame](self, "frame");
    v216 = v61;
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "frame");
    v64 = v63;
    v66 = v65;

    v67 = *MEMORY[0x24BDBEFB0];
    -[WAAQIView bounds](self, "bounds");
    v68 = 6.0;
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, 6.0, v64, v66, v69, v70, v71, v72);
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v80 = v79;
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFrame:", v74, v76, v78, v80);

    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "frame");
    v84 = v83;
    v86 = v85;

    -[WAAQIView aqiLabel](self, "aqiLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "frame");
    v89 = v88;
    -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "frame");
    v92 = v89 + v91 + 10.0;
    -[WAAQIView bounds](self, "bounds");
    v94 = v93;

    if (v92 >= v94)
    {
      -[WAAQIView aqiLabel](self, "aqiLabel");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "attributedText");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "wa_font");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "ascender");
      v118 = v117 + 6.0;

      v113 = v118 + 1.0;
      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v118 + 1.0, v84, v86, v119, v120, v121, v122);
      v124 = v123;
      v126 = v125;
      v128 = v127;
      v130 = v129;
      -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "setFrame:", v124, v126, v128, v130);

      -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "attributedText");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "wa_font");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "ascender");
      v68 = v132;
    }
    else
    {
      -[WAAQIView bounds](self, "bounds");
      v95 = CGRectGetMaxX(v219) - v84;
      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v95, 6.0, v84, v86, v96, v97, v98, v99);
      v101 = v100;
      v103 = v102;
      v105 = v104;
      v107 = v106;
      -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

      -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "attributedText");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "wa_font");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "ascender");
      v113 = v112;
    }
    v133 = v113 + v68;

    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "frame");
    v136 = v135;
    v138 = v137;

    v139 = v133 + 1.0;
    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v133 + 1.0, v136, v138, v140, v141, v142, v143);
    v145 = v144;
    v147 = v146;
    v149 = v148;
    v151 = v150;
    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setFrame:", v145, v147, v149, v151);

    -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "attributedText");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "wa_font");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "descender");
    v157 = v156;
    v220.origin.x = v67;
    v220.origin.y = v139;
    v220.size.width = v136;
    v220.size.height = v138;
    v158 = v157 + CGRectGetMaxY(v220);

    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "frame");

    v160 = v158 + 10.0;
    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v160, v216, *(double *)&v217, v161, v162, v163, v164);
    v166 = v165;
    v168 = v167;
    v170 = v169;
    v172 = v171;
    -[WAAQIView aqiScaleView](self, "aqiScaleView");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "setFrame:", v166, v168, v170, v172);

    v221.origin.x = v67;
    v221.origin.y = v160;
    v221.size.width = v216;
    *(_QWORD *)&v221.size.height = v217;
    MaxY = CGRectGetMaxY(v221);
    if (!-[WAAQIView hideRecommendationString](self, "hideRecommendationString"))
    {
      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "frame");
      v177 = v176;
      v179 = v178;

      v180 = MaxY + 10.0;
      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v180, v177, v179, v181, v182, v183, v184);
      v186 = v185;
      v188 = v187;
      v190 = v189;
      v192 = v191;
      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "setFrame:", v186, v188, v190, v192);

      -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "attributedText");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "wa_font");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "descender");
      v198 = v197;
      v222.origin.x = v67;
      v222.origin.y = v180;
      v222.size.width = v177;
      v222.size.height = v179;
      MaxY = v198 + CGRectGetMaxY(v222);

    }
    if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
    {
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "frame");
      v201 = v200;
      v203 = v202;

      -[WAAQIView bounds](self, "bounds");
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, MaxY + 8.0, v201, v203, v204, v205, v206, v207);
      v209 = v208;
      v211 = v210;
      v213 = v212;
      v215 = v214;
      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v218 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setFrame:", v209, v211, v213, v215);

    }
  }
}

- (void)layoutForModeWithoutScale
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
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double MaxX;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  CGFloat v134;
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
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  id v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;

  -[WAAQIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[WAAQIView aqiLabel](self, "aqiLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

  -[WAAQIView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeToFit");

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

  -[WAAQIView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sizeToFit");

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", 0);

  if (!-[WAAQIView hideRecommendationString](self, "hideRecommendationString"))
  {
    -[WAAQIView bounds](self, "bounds");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sizeToFit");

    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setHidden:", 0);

  }
  if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
  {
    -[WAAQIView bounds](self, "bounds");
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "sizeToFit");

    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 0);

  }
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v60 = v59;
  v62 = v61;

  v63 = *MEMORY[0x24BDBEFB0];
  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, 6.0, v60, v62, v64, v65, v66, v67);
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  -[WAAQIView aqiLabel](self, "aqiLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "frame");
  v79 = v78;
  v81 = v80;

  -[WAAQIView bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v171);
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "frame");
  v85 = MaxX - v84;

  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v85, 6.0, v79, v81, v86, v87, v88, v89);
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v97 = v96;
  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setFrame:", v91, v93, v95, v97);

  -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "attributedText");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "wa_font");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "ascender");
  v103 = v102 + 6.0;

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "frame");
  v106 = v105;
  v108 = v107;

  v109 = v103 + 1.0;
  -[WAAQIView bounds](self, "bounds");
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v109, v106, v108, v110, v111, v112, v113);
  v115 = v114;
  v117 = v116;
  v119 = v118;
  v121 = v120;
  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setFrame:", v115, v117, v119, v121);

  -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "attributedText");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "wa_font");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "descender");
  v127 = v126;
  v172.origin.x = v63;
  v172.origin.y = v109;
  v172.size.width = v106;
  v172.size.height = v108;
  v128 = v127 + CGRectGetMaxY(v172);

  if (!-[WAAQIView hideRecommendationString](self, "hideRecommendationString"))
  {
    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "frame");
    v131 = v130;
    v133 = v132;

    v134 = v128 + 10.0;
    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v134, v131, v133, v135, v136, v137, v138);
    v140 = v139;
    v142 = v141;
    v144 = v143;
    v146 = v145;
    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setFrame:", v140, v142, v144, v146);

    -[WAAQIView airQualityRecommendationLabel](self, "airQualityRecommendationLabel");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "attributedText");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "wa_font");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "descender");
    v152 = v151;
    v173.origin.x = v63;
    v173.origin.y = v134;
    v173.size.width = v131;
    v173.size.height = v133;
    v128 = v152 + CGRectGetMaxY(v173);

  }
  if (!-[WAAQIView hideCitationString](self, "hideCitationString"))
  {
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "frame");
    v155 = v154;
    v157 = v156;

    -[WAAQIView bounds](self, "bounds");
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v128 + 8.0, v155, v157, v158, v159, v160, v161);
    v163 = v162;
    v165 = v164;
    v167 = v166;
    v169 = v168;
    -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
    v170 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "setFrame:", v163, v165, v167, v169);

  }
}

- (BOOL)isAccessibilityElement
{
  return !-[WAAQIView forceHideThisEntireView](self, "forceHideThisEntireView")
      && -[WAAQIView layoutMode](self, "layoutMode") != 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  if (-[WAAQIView layoutMode](self, "layoutMode") - 1 > 2)
  {
    v4 = 0;
  }
  else
  {
    -[WAAQIView aqiLabel](self, "aqiLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)accessibilityValue
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = -[WAAQIView layoutMode](self, "layoutMode");
  if (v3 != 3)
  {
    if (v3 == 2)
    {
      -[WAAQIView airQualityMetadataGradeLabel](self, "airQualityMetadataGradeLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[WAAQIView aqiAgencyLabel](self, "aqiAgencyLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[WAAQIView aqiCitationLabel](self, "aqiCitationLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributedText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "waaxArrayByIgnoringNilElementsWithCount:", 3, v5, v7, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    if (v3 != 1)
    {
      v9 = 0;
      return v9;
    }
  }
  -[WAAQIView aqiIndexLabel](self, "aqiIndexLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WAAQIView aqiCategoryLabel](self, "aqiCategoryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "waaxArrayByIgnoringNilElementsWithCount:", 2, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (WAAQIViewDelegate)delegate
{
  return (WAAQIViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)aqiLabel
{
  return self->_aqiLabel;
}

- (void)setAqiLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aqiLabel, a3);
}

- (UILabel)aqiIndexLabel
{
  return self->_aqiIndexLabel;
}

- (void)setAqiIndexLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aqiIndexLabel, a3);
}

- (UILabel)aqiAgencyLabel
{
  return self->_aqiAgencyLabel;
}

- (void)setAqiAgencyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aqiAgencyLabel, a3);
}

- (UILabel)dash
{
  return self->_dash;
}

- (void)setDash:(id)a3
{
  objc_storeStrong((id *)&self->_dash, a3);
}

- (WAAQIScaleView)aqiScaleView
{
  return self->_aqiScaleView;
}

- (void)setAqiScaleView:(id)a3
{
  objc_storeStrong((id *)&self->_aqiScaleView, a3);
}

- (UILabel)aqiCategoryLabel
{
  return self->_aqiCategoryLabel;
}

- (void)setAqiCategoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aqiCategoryLabel, a3);
}

- (UILabel)airQualityMetadataGradeLabel
{
  return self->_airQualityMetadataGradeLabel;
}

- (void)setAirQualityMetadataGradeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityMetadataGradeLabel, a3);
}

- (UILabel)airQualityRecommendationLabel
{
  return self->_airQualityRecommendationLabel;
}

- (void)setAirQualityRecommendationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityRecommendationLabel, a3);
}

- (UILabel)aqiCitationLabel
{
  return self->_aqiCitationLabel;
}

- (void)setAqiCitationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_aqiCitationLabel, a3);
}

- (WAAQIViewStyler)styler
{
  return self->_styler;
}

- (void)setStyler:(id)a3
{
  objc_storeStrong((id *)&self->_styler, a3);
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (WAAQIAttributionStringBuilder)attributionStringBuilder
{
  return self->_attributionStringBuilder;
}

- (void)setAttributionStringBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_attributionStringBuilder, a3);
}

- (BOOL)hideCitationString
{
  return self->_hideCitationString;
}

- (void)setHideCitationString:(BOOL)a3
{
  self->_hideCitationString = a3;
}

- (BOOL)hideRecommendationString
{
  return self->_hideRecommendationString;
}

- (void)setHideRecommendationString:(BOOL)a3
{
  self->_hideRecommendationString = a3;
}

- (BOOL)forceHideThisEntireView
{
  return self->_forceHideThisEntireView;
}

- (void)setForceHideThisEntireView:(BOOL)a3
{
  self->_forceHideThisEntireView = a3;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionStringBuilder, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_storeStrong((id *)&self->_aqiCitationLabel, 0);
  objc_storeStrong((id *)&self->_airQualityRecommendationLabel, 0);
  objc_storeStrong((id *)&self->_airQualityMetadataGradeLabel, 0);
  objc_storeStrong((id *)&self->_aqiCategoryLabel, 0);
  objc_storeStrong((id *)&self->_aqiScaleView, 0);
  objc_storeStrong((id *)&self->_dash, 0);
  objc_storeStrong((id *)&self->_aqiAgencyLabel, 0);
  objc_storeStrong((id *)&self->_aqiIndexLabel, 0);
  objc_storeStrong((id *)&self->_aqiLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
