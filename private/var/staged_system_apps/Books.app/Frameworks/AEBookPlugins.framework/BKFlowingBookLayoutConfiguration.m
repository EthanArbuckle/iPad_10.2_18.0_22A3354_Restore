@implementation BKFlowingBookLayoutConfiguration

- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3
{
  return -[BKFlowingBookLayoutConfiguration initWithViewController:provider:](self, "initWithViewController:provider:", a3, 0);
}

- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  BKFlowingBookPlistConfigurationEnvironment *v8;
  BKFlowingBookFontSizeConfiguration *v9;
  BKFlowingBookLayoutConfiguration *v10;
  uint64_t v11;
  BCSemanticLayoutOptions *options;

  v6 = a4;
  v7 = a3;
  v8 = -[BKFlowingBookPlistConfigurationEnvironment initWithViewController:]([BKFlowingBookPlistConfigurationEnvironment alloc], "initWithViewController:", v7);
  -[BKFlowingBookPlistConfigurationEnvironment setOverrideProvider:](v8, "setOverrideProvider:", v6);

  v9 = -[BKFlowingBookFontSizeConfiguration initWithViewController:configurationEnvironment:]([BKFlowingBookFontSizeConfiguration alloc], "initWithViewController:configurationEnvironment:", v7, v8);
  -[BKFlowingBookPlistConfigurationEnvironment setFontSizeConfiguration:](v8, "setFontSizeConfiguration:", v9);
  v10 = -[BKFlowingBookLayoutConfiguration initWithViewController:configurationEnvironment:](self, "initWithViewController:configurationEnvironment:", v7, v8);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_fontSizeConfiguration, v9);
    v11 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions current](BCSemanticLayoutOptions, "current"));
    options = v10->_options;
    v10->_options = (BCSemanticLayoutOptions *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BKFlowingBookLayoutConfiguration;
  v5 = -[BKFlowingBookLayoutConfiguration copyWithZone:](&v19, "copyWithZone:");
  if (v5)
  {
    -[BKFlowingBookLayoutConfiguration overrideFontSize](self, "overrideFontSize");
    *((_QWORD *)v5 + 4) = v6;
    *((_QWORD *)v5 + 3) = -[BKFlowingBookLayoutConfiguration layout](self, "layout");
    *((_BYTE *)v5 + 17) = self->_contentHasSpreadPages;
    *((_BYTE *)v5 + 19) = self->_disableContentSpreadPages;
    *((_BYTE *)v5 + 18) = -[BKFlowingBookLayoutConfiguration showingTOC](self, "showingTOC");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration style](self, "style"));
    v8 = objc_msgSend(v7, "copyWithZone:", a3);
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    objc_storeStrong((id *)v5 + 5, self->_options);
    v10 = -[BKFlowingBookFontSizeConfiguration copyWithZone:](self->_fontSizeConfiguration, "copyWithZone:", a3);
    v11 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v10;

    *(_QWORD *)&v12 = objc_opt_class(BKFlowingBookPlistConfigurationEnvironment).n128_u64[0];
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment", v12));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    objc_msgSend(v17, "setFontSizeConfiguration:", self->_fontSizeConfiguration);
  }
  return v5;
}

- (BOOL)isEqualToFlowingBookLayoutConfiguration:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  ContentStyle *style;
  BCSemanticLayoutOptions *options;
  unsigned __int8 v8;

  v4 = a3;
  v5 = v4;
  if (self->_overrideFontSize == *((double *)v4 + 4)
    && self->_layout == v4[3]
    && self->_contentHasSpreadPages == *((unsigned __int8 *)v4 + 17)
    && self->_disableContentSpreadPages == *((unsigned __int8 *)v4 + 19)
    && self->_showingTOC == *((unsigned __int8 *)v4 + 18)
    && ((style = self->_style, style == (ContentStyle *)v5[1]) || -[ContentStyle isEqual:](style, "isEqual:")))
  {
    options = self->_options;
    if (options == (BCSemanticLayoutOptions *)v5[5])
      v8 = 1;
    else
      v8 = -[BCSemanticLayoutOptions isEqual:](options, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BKFlowingBookLayoutConfiguration *v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = (BKFlowingBookLayoutConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class(BKFlowingBookLayoutConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && (v8.receiver = self,
          v8.super_class = (Class)BKFlowingBookLayoutConfiguration,
          -[BKFlowingBookLayoutConfiguration isEqual:](&v8, "isEqual:", v4)))
    {
      v6 = -[BKFlowingBookLayoutConfiguration isEqualToFlowingBookLayoutConfiguration:](self, "isEqualToFlowingBookLayoutConfiguration:", v4);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)invalidate
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKFlowingBookLayoutConfiguration;
  -[BKFlowingBookLayoutConfiguration invalidate](&v5, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_useOldFontStepsAndSpacing = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

  -[BKFlowingBookLayoutConfiguration fontSize](self, "fontSize");
  if (v4 > 0.0)
    self->_contentHasSpreadPages = -[BKFlowingBookLayoutConfiguration _contentHasSpreadPages](self, "_contentHasSpreadPages");
}

+ (id)_fontSizeCache
{
  if (qword_20F508 != -1)
    dispatch_once(&qword_20F508, &stru_1BF638);
  return (id)qword_20F500;
}

- (double)semanticSideInset
{
  double result;

  -[BKFlowingBookLayoutConfiguration _semanticSideInsetWithSpreadPages:](self, "_semanticSideInsetWithSpreadPages:", -[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages"));
  return result;
}

- (double)_semanticSideInsetWithSpreadPages:(BOOL)a3
{
  _BOOL8 v3;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 3)
    return 0.0;
  -[BKFlowingBookLayoutConfiguration _gutterWidthWithSpreadPages:](self, "_gutterWidthWithSpreadPages:", v3);
  v7 = v6;
  if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") != (char *)&dword_0 + 2
    && -[BKFlowingBookLayoutConfiguration _manageSafeAreaInsets](self, "_manageSafeAreaInsets"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;
    v12 = v11;

    if (v10 >= v12)
      v13 = v10;
    else
      v13 = v12;
    v7 = v7 + v13;
  }
  return ceil(v7);
}

- (double)compactFontSize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v2, "size");
  v4 = round(sqrt(v3 + -19.3649167) + 16.0);

  return v4;
}

- (double)regularFontSize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v2, "size");
  v4 = round(sqrt(v3 + -28.8790582) + 20.0);

  return v4;
}

- (double)lineHeightAll:(double)a3
{
  return a3 * 1.4;
}

- (double)_fontSizeWithCurrentStyle
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[BKFlowingBookLayoutConfiguration fontSize](self, "fontSize");
  v4 = fmax(v3, 0.1);
  if (v4 > 20.0)
    v4 = 20.0;
  if (v3 <= 0.0)
    v5 = 1.0;
  else
    v5 = v4;
  -[BCSemanticLayoutOptions fontScale](self->_options, "fontScale");
  return v6 * v5;
}

- (double)_averageCharacterWidth
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKFlowingBookLayoutConfiguration _fontSizeCache](BKFlowingBookLayoutConfiguration, "_fontSizeCache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration style](self, "style"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontFamily"));

    v6 = objc_msgSend(v5, "length");
    -[BKFlowingBookLayoutConfiguration _fontSizeWithCurrentStyle](self, "_fontSizeWithCurrentStyle");
    v8 = v7;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A:%@:%.2f"), v5, *(_QWORD *)&v7));
      *(_QWORD *)&v10 = objc_opt_class(NSNumber).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v9, v10));
      v14 = BUDynamicCast(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      if (v15)
      {
        objc_msgSend(v15, "doubleValue");
        v17 = v16;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration style](self, "style"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fontFamily"));
        -[BKFlowingBookLayoutConfiguration _calculatedWidthOfFontFamily:size:cache:key:](self, "_calculatedWidthOfFontFamily:size:cache:key:", v27, v3, v9, v8);
        v29 = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration _sampleCorpus](self, "_sampleCorpus"));
        v17 = v29 / (double)(unint64_t)objc_msgSend(v30, "length");

        if (v17 <= 0.0)
        {
          v31 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            sub_11C45C(v31, v32, v33, v34, v35, v36, v37, v38);

          v17 = 6.0;
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
        -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v39, v9);

      }
    }
    else
    {
      v17 = v7 * 0.4;
    }

LABEL_16:
    return v17;
  }
  -[BKFlowingBookLayoutConfiguration _fontSizeWithCurrentStyle](self, "_fontSizeWithCurrentStyle");
  v17 = v18 * 0.4;
  if (v18 * 0.4 <= 0.0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
    v17 = 6.0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_11C45C(v3, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_16;
  }
  return v17;
}

- (double)_charactersPerLineForContentWidthRaw:(double)a3
{
  double v4;

  -[BKFlowingBookLayoutConfiguration _averageCharacterWidth](self, "_averageCharacterWidth");
  return a3 / v4;
}

- (double)_contentWidthForAvailableWidth:(double)a3 columns:(unint64_t)a4
{
  double v6;

  -[BKFlowingBookLayoutConfiguration _semanticSideInsetWithSpreadPages:](self, "_semanticSideInsetWithSpreadPages:", a4 > 1);
  return a3 - v6 * (double)(a4 + 1);
}

- (double)_charactersPerLineForContentWidth:(double)a3 columns:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;

  -[BKFlowingBookLayoutConfiguration _contentWidthForAvailableWidth:columns:](self, "_contentWidthForAvailableWidth:columns:", a4, a3);
  v6 = v5;
  -[BKFlowingBookLayoutConfiguration _charactersPerLineForContentWidthRaw:](self, "_charactersPerLineForContentWidthRaw:");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration style](self, "style"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration style](self, "style"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontFamily"));
    -[BKFlowingBookLayoutConfiguration _fontSizeAdjustmentForFontFamily:](self, "_fontSizeAdjustmentForFontFamily:", v11);
    v8 = v8 * v12;

  }
  v13 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_11C490(v13, v8, v6);

  return v8;
}

- (double)charactersPerLine
{
  void *v3;
  double v4;
  double v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "size");
  v5 = v4;

  -[BKFlowingBookLayoutConfiguration _charactersPerLineForContentWidth:columns:](self, "_charactersPerLineForContentWidth:columns:", 1, v5);
  return result;
}

- (double)noteGlyphPadding
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = 0.0;
  if (!-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v4, "safeAreaInsets");
    v3 = v5;
    v7 = v6;

    if (v3 < v7)
      v3 = v7;
  }
  -[BKFlowingBookLayoutConfiguration semanticSideInset](self, "semanticSideInset");
  v9 = v8 - v3;
  -[BKFlowingBookLayoutConfiguration noteSideLength](self, "noteSideLength");
  return floor((v9 - v10) * 0.5);
}

- (double)scrubberHeight
{
  double result;

  -[BKFlowingBookLayoutConfiguration _scrubberLength](self, "_scrubberLength");
  return result;
}

- (double)_scrubberLength
{
  int64_t v3;
  BCSemanticLayoutOptions *options;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;

  v3 = -[BKFlowingBookLayoutConfiguration scrubberStyle](self, "scrubberStyle");
  options = self->_options;
  if (v3 == 1)
  {
    -[BCSemanticLayoutOptions scrollerScrubberHeight](options, "scrollerScrubberHeight");
  }
  else
  {
    -[BCSemanticLayoutOptions classicScrubberHeight](options, "classicScrubberHeight");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v7, "size");
    v9 = v8;

    result = fmax(v6, 44.0);
    if (v9 <= 800.0)
      return v6;
  }
  return result;
}

- (double)scrubberWidth
{
  double result;

  if ((char *)-[BKFlowingBookLayoutConfiguration scrubberStyle](self, "scrubberStyle") == (char *)&dword_0 + 1)
    -[BKFlowingBookLayoutConfiguration _scrubberLength](self, "_scrubberLength");
  else
    -[BCSemanticLayoutOptions scrubberWidth](self->_options, "scrubberWidth");
  return result;
}

- (double)_scrubberFrameHorizontalOriginY
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  double v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6 - v5;
  objc_msgSend(v3, "safeAreaInsets");
  v9 = v7 - v8;
  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v11 = v9 - v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overrideProvider"));
  v14 = objc_msgSend(v13, "isScrubberDisabled");

  if (v14)
  {
    v11 = v5 + v11;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    if (objc_msgSend(v15, "isCompactHeight"))
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
      v17 = objc_msgSend(v16, "isCompactWidth");

      if (!v17)
        goto LABEL_9;
    }
    v18 = round(v5 * 0.5 + v11);
    if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 3)
      v11 = v18 + -10.0;
    else
      v11 = v18;
  }
LABEL_9:

  return v11;
}

- (UIEdgeInsets)contentInsets
{
  void *v3;
  double v4;
  double v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
  v9 = v5 + v8;
  if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 3)
  {
    -[BKFlowingBookLayoutConfiguration noteSideLength](self, "noteSideLength");
    v9 = v9 + v10;
  }
  if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 2)
  {
    -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
    v12 = v7 + v11;
    -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
    v14 = v12 + v13;
  }
  else
  {
    objc_msgSend(v3, "size");
    v16 = v15;
    -[BKFlowingBookLayoutConfiguration _scrubberFrameHorizontalOriginY](self, "_scrubberFrameHorizontalOriginY");
    v14 = v16 - v17;
  }
  -[BKFlowingBookLayoutConfiguration semanticSideInset](self, "semanticSideInset");
  v19 = v18;

  v20 = v9;
  v21 = v19;
  v22 = v14;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (BOOL)_shouldLayoutRectInsetContentRectBySafeAreaInsets
{
  return 0;
}

- (CGRect)insetContentViewFromContentContainerFrame:(CGRect)a3 isPrimary:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double y;
  double x;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double height;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v17, "size");
  v19 = v18;

  if (width < v19)
  {
    -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
    v21 = v20 * 0.5;
    if (v4)
      v16 = v21;
    else
      v12 = v21;
  }
  v22 = x + v12;
  v23 = y + v10;
  v24 = width - (v16 + v12);
  v25 = height - (v10 + v14);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)pageLabelOnLeft
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection") != 0;

  return -[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll") ^ v4;
}

- (BOOL)tocHasSpreadPages
{
  unsigned int v3;
  void *v4;
  void *v5;

  if ((isPhone(self, a2) & 1) != 0 || -[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    if (objc_msgSend(v4, "isLandscape"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
      v3 = objc_msgSend(v5, "isCompactWidth") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (void)setDisableContentSpreadPages:(BOOL)a3
{
  self->_disableContentSpreadPages = a3;
  -[BKFlowingBookLayoutConfiguration invalidate](self, "invalidate");
}

+ (BOOL)spreadPagesAllowedWithViewportSize:(CGSize)a3 fontSizeIndex:(int64_t)a4
{
  BOOL v4;
  BOOL v5;

  v4 = a3.width > 896.0;
  if (a3.height <= 500.0)
    v4 = 0;
  v5 = a4 < 2 && v4;
  if (a3.width <= a3.height)
    return v5;
  else
    return v4;
}

- (BOOL)_manageSafeAreaInsets
{
  return 1;
}

- (BOOL)_contentHasSpreadPages
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
    return 0;
  if (-[BKFlowingBookLayoutConfiguration disableContentSpreadPages](self, "disableContentSpreadPages"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v4 = objc_msgSend(v3, "isCompactWidth");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v6, "size");
  v8 = v7;

  -[BKFlowingBookLayoutConfiguration _charactersPerLineForContentWidth:columns:](self, "_charactersPerLineForContentWidth:columns:", 1, v8);
  v10 = v9;
  -[BCSemanticLayoutOptions minCPLForSpreadPages](self->_options, "minCPLForSpreadPages");
  return v10 >= v11;
}

- (BOOL)noJustification
{
  double v2;

  -[BKFlowingBookLayoutConfiguration charactersPerLine](self, "charactersPerLine");
  return v2 < 35.0;
}

- (BOOL)noAutoHyphenation
{
  double v2;

  -[BKFlowingBookLayoutConfiguration charactersPerLine](self, "charactersPerLine");
  return v2 > 75.0;
}

- (double)snapshotArtificialGutterWidth
{
  void *v3;
  void *v4;
  unsigned int v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  if (BCViewportSize(objc_msgSend(v3, "size")) == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    v5 = objc_msgSend(v4, "isCompactHeight");

    result = 22.0;
    if (v5)
      return 27.0;
  }
  else
  {

    return 22.0;
  }
  return result;
}

- (void)setLargeSizeFactor:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration bookEnvironment](self, "bookEnvironment"));
  objc_msgSend(v4, "setLargeSizeFactor:", a3);

}

- (void)setLayout:(unint64_t)a3
{
  unsigned int v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;

  if (self->_layout != a3)
  {
    v5 = -[BKFlowingBookLayoutConfiguration allowsScrollMode](self, "allowsScrollMode");
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v6 = 1;
    else
      v6 = a3;
    if (v5)
      v6 = a3;
    self->_layout = v6;
    v7 = -[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration bookEnvironment](self, "bookEnvironment"));
    objc_msgSend(v8, "setScroll:", v7);

    -[BKFlowingBookLayoutConfiguration invalidate](self, "invalidate");
  }
}

- (void)setOverrideFontSize:(double)a3
{
  void *v5;

  if (vabdd_f64(self->_overrideFontSize, a3) > 0.00001)
  {
    self->_overrideFontSize = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration bookEnvironment](self, "bookEnvironment"));
    objc_msgSend(v5, "setFontSize:", a3);

    -[BKFlowingBookLayoutConfiguration invalidate](self, "invalidate");
  }
}

- (ContentStyle)style
{
  return self->_style;
}

- (id)_sampleCorpus
{
  return CFSTR("The quick brown fox jumped over the lazy dog. The sphinx of black the quartz judge my vow.");
}

- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4
{
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Width;
  NSObject *v20;
  NSAttributedStringKey v22;
  void *v23;
  CGRect v24;

  v6 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ui-serif")) & 1) != 0)
  {
    v7 = CFSTR(".AppleSystemUIFontSerif");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("system-ui")))
      goto LABEL_6;
    v7 = CFSTR(".AppleSystemUIFont");
  }

  v6 = (__CFString *)v7;
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v6, a4));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration _sampleCorpus](self, "_sampleCorpus"));
    v22 = NSFontAttributeName;
    v23 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, 1.79769313e308, 1.79769313e308);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v16;
    v24.size.height = v18;
    Width = CGRectGetWidth(v24);
  }
  else
  {
    v20 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_11C514((uint64_t)v6, v20);

    Width = 0.0;
  }

  return Width;
}

- (id)_cacheKeyForFontFamily:(id)a3 size:(double)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%.2f"), a3, *(_QWORD *)&a4);
}

- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4 cache:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  *(_QWORD *)&v13 = objc_opt_class(NSNumber).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10, v13));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
  }
  else
  {
    -[BKFlowingBookLayoutConfiguration _calculatedWidthOfFontFamily:size:](self, "_calculatedWidthOfFontFamily:size:", v10, a4);
    v20 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v12);

  }
  return v20;
}

- (double)_fontSizeAdjustmentForFontFamily:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  NSObject *v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;

  v4 = a3;
  -[BKFlowingBookLayoutConfiguration _fontSizeWithCurrentStyle](self, "_fontSizeWithCurrentStyle");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKFlowingBookLayoutConfiguration _fontSizeCache](BKFlowingBookLayoutConfiguration, "_fontSizeCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration _cacheKeyForFontFamily:size:](self, "_cacheKeyForFontFamily:size:", v4, v6));
  *(_QWORD *)&v9 = objc_opt_class(NSNumber).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8, v9));
  v13 = BUDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
  }
  else
  {
    if (objc_msgSend(v4, "length"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration _cacheKeyForFontFamily:size:](self, "_cacheKeyForFontFamily:size:", CFSTR(".AppleSystemUIFontSerif"), v6));
      -[BKFlowingBookLayoutConfiguration _calculatedWidthOfFontFamily:size:cache:key:](self, "_calculatedWidthOfFontFamily:size:cache:key:", CFSTR(".AppleSystemUIFontSerif"), v7, v17, v6);
      v19 = v18;
      -[BKFlowingBookLayoutConfiguration _calculatedWidthOfFontFamily:size:](self, "_calculatedWidthOfFontFamily:size:", v4, v6);
      v21 = fabs(v20);
      v22 = fabs(v19) < 0.00000011920929 || v21 < 0.00000011920929;
      v23 = v20 / v19;
      if (v22)
        v16 = 1.0;
      else
        v16 = v23;

    }
    else
    {
      v16 = 1.0;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v27 = 138412802;
      v28 = v4;
      v29 = 2048;
      v30 = v6;
      v31 = 2048;
      v32 = v16;
      _os_log_debug_impl(&dword_0, v24, OS_LOG_TYPE_DEBUG, "Font factor for [%@] at %.2f is %.2f", (uint8_t *)&v27, 0x20u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v8);

  }
  return v16;
}

- (void)setStyle:(id)a3
{
  ContentStyle *v5;
  ContentStyle **p_style;
  NSObject *v7;
  ContentStyle *v8;
  int v9;
  ContentStyle *v10;

  v5 = (ContentStyle *)a3;
  p_style = &self->_style;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    -[ContentStyle setOverrideProvider:](v5, "setOverrideProvider:", self);
    v7 = objc_claimAutoreleasedReturnValue(+[BCSemanticLayoutOptions logger](BCSemanticLayoutOptions, "logger"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_style;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Style changed to:%@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (double)fontSize
{
  double overrideFontSize;
  float v4;
  double v5;
  void *v6;
  double v7;

  overrideFontSize = self->_overrideFontSize;
  if (overrideFontSize <= 0.0)
  {
    -[ContentStyle fontSize](self->_style, "fontSize");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v6, "size");
    +[BKFlowingBookFontSizeConfiguration fontSizeFactorForViewportSize:useOldFontStepsAndSpacing:](BKFlowingBookFontSizeConfiguration, "fontSizeFactorForViewportSize:useOldFontStepsAndSpacing:", self->_useOldFontStepsAndSpacing);
    overrideFontSize = v7 * v5;

  }
  return overrideFontSize;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v18[4];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BKFlowingBookLayoutConfiguration;
  v3 = -[BKFlowingBookLayoutConfiguration description](&v19, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
  v18[0] = v5;
  v18[1] = v6;
  v18[2] = v7;
  v18[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v18, "{UIEdgeInsets=dddd}"));
  -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll")));
  -[BKFlowingBookLayoutConfiguration fontSize](self, "fontSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  if (-[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[BKFlowingBookLayoutConfiguration noJustification](self, "noJustification"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[BKFlowingBookLayoutConfiguration noAutoHyphenation](self, "noAutoHyphenation"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nBCFlowingBookLayoutConfiguration: contentInsets:%@ gutterWidth:%@ isScroll:%@ fontSize:%@ contentHasSpreadPages:%@ noJustification:%@ noAutoHyphenation:%@"), v4, v9, v10, v11, v12, v13, v14, v15));

  return v16;
}

- (double)headerToolbarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overrideProvider"));
  objc_msgSend(v3, "topBarHeight");
  v5 = v4;

  return v5;
}

- (double)noteSideLength
{
  return 32.0;
}

- (double)footerToolbarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overrideProvider"));
  objc_msgSend(v3, "bottomBarHeight");
  v5 = v4;

  return v5;
}

- (double)scrubberLeftRightInset
{
  double result;
  double v4;

  if ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 3)
  {
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
  }
  else
  {
    -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
    return v4;
  }
  return result;
}

- (double)scrubberVerticalInset
{
  return 16.0;
}

- (double)toolbarButtonMargin
{
  return 20.0;
}

- (UIEdgeInsets)bookCoverEdgeInsets
{
  void *v3;
  unsigned int v4;
  void *v5;
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
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v4 = objc_msgSend(v3, "isCompactHeight");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v5, "statusBarHeight");
  v7 = v6;
  -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
  v9 = v8;
  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v11 = v10;

  if (v4)
    v12 = 18.0;
  else
    v12 = 32.0;
  v13 = 82.0;
  if (v4)
    v13 = 38.0;
  v14 = v7 + v12 + v9;
  v15 = v11 + v12;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGRect)contentContainerFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v6, "size");
  v8 = v7;

  v9 = 0.0;
  v10 = 0.0;
  v11 = v5;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)leftContentContainerFrameForTwoUp
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "size");
  v5 = v4 * 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v6, "size");
  v8 = v7;

  v9 = 0.0;
  v10 = 0.0;
  v11 = v5;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)rightContentContainerFrameForTwoUp
{
  void *v3;
  double v4;
  double x;
  void *v6;
  double v7;
  double width;
  void *v9;
  double v10;
  CGFloat height;
  double y;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[BKFlowingBookLayoutConfiguration hasSpreadPages](self, "hasSpreadPages"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v3, "size");
    x = v4 * 0.5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v6, "size");
    width = v7 * 0.5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v9, "size");
    height = v10;

    y = 0.0;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v13 = x;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = y;
  result.origin.x = v13;
  return result;
}

- (UIEdgeInsets)upsellContentInsets
{
  void *v3;
  double v4;
  double v5;
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
  double v16;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
    v9 = v5 + v8;
    -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
    v11 = v7 + v10;
    -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
    v13 = v11 + v12 * 0.5;
    v14 = 0.0;
    v15 = 0.0;
    v16 = v9;
  }
  else
  {
    -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
    UIEdgeInsetsAdd(15);
  }
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v16;
  return result;
}

- (double)gutterWidth
{
  double result;

  -[BKFlowingBookLayoutConfiguration _gutterWidthWithSpreadPages:](self, "_gutterWidthWithSpreadPages:", -[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages"));
  return result;
}

- (double)_gutterWidthWithSpreadPages:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v5, "size");
  v7 = v6;

  -[BCSemanticLayoutOptions sideInsetFactor](self->_options, "sideInsetFactor");
  v9 = v7 * v8;
  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "scale");
    +[AEAnnotationMarker imageSizeForScale:](AEAnnotationMarker, "imageSizeForScale:");
    v12 = v11;

    if (v12 + 6.0 >= v9 * 0.666666667)
      v9 = v12 + 6.0;
    else
      v9 = v9 * 0.666666667;
  }
  v13 = ceil(v9);
  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v14, "safeAreaInsetsAdjustingForNotch:", 0);
    v16 = v15;
    v18 = v17;

    if (v16 >= v18)
      v18 = v16;
    -[BKFlowingBookLayoutConfiguration _averageCharacterWidth](self, "_averageCharacterWidth");
    v20 = v19;
    -[BCSemanticLayoutOptions minCPLForSpreadPages](self->_options, "minCPLForSpreadPages");
    v22 = floor((v7 + v18 * -2.0 - v20 * (v21 + 5.0)) * 0.5);
    if (v13 < v22)
      return v22;
  }
  return v13;
}

- (CGRect)bookCoverRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  if (-[BKFlowingBookLayoutConfiguration configurationHasABookCover](self, "configurationHasABookCover"))
  {
    -[BKFlowingBookLayoutConfiguration bookCoverEdgeInsets](self, "bookCoverEdgeInsets");
    v4 = v3;
    -[BKFlowingBookLayoutConfiguration bookCoverEdgeInsets](self, "bookCoverEdgeInsets");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v7, "size");
    v9 = v8 * 0.5;
    -[BKFlowingBookLayoutConfiguration bookCoverEdgeInsets](self, "bookCoverEdgeInsets");
    v11 = v9 + v10 * -2.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v12, "size");
    v14 = v13;
    -[BKFlowingBookLayoutConfiguration bookCoverEdgeInsets](self, "bookCoverEdgeInsets");
    v16 = v15;
    -[BKFlowingBookLayoutConfiguration bookCoverEdgeInsets](self, "bookCoverEdgeInsets");
    v26.size.height = v14 - (v16 + v17);
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v11;
    v27 = CGRectIntegral(v26);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)headerFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v6, "size");
  v8 = v7;
  -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
  v10 = v9;

  v11 = 0.0;
  v12 = v5;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)topLeftToolbarFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat height;
  double v9;
  double width;
  double v11;
  double v12;
  double v13;
  CGRect result;

  if (-[BKFlowingBookLayoutConfiguration configurationHasATopLeftToolbar](self, "configurationHasATopLeftToolbar"))
  {
    -[BKFlowingBookLayoutConfiguration headerFrame](self, "headerFrame");
    x = v3;
    y = v5;
    height = v7;
    -[BKFlowingBookLayoutConfiguration headerFrame](self, "headerFrame");
    width = round(v9 * 0.5);
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v11 = x;
  v12 = y;
  v13 = height;
  result.size.height = v13;
  result.size.width = width;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)topRightToolbarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration headerFrame](self, "headerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[BKFlowingBookLayoutConfiguration configurationHasATopLeftToolbar](self, "configurationHasATopLeftToolbar"))
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    v8 = round(CGRectGetWidth(v15) * 0.5);
    v4 = v8;
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)footerFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  if (!-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    if (objc_msgSend(v13, "isCompactWidth"))
    {

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
      v15 = objc_msgSend(v14, "isCompactHeight");

      if (!v15)
      {
        -[BKFlowingBookLayoutConfiguration scrubberFrame](self, "scrubberFrame");
        v17 = (v12 + CGRectGetMidY(v21) - v7) * 0.5;
        goto LABEL_6;
      }
    }
  }
  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v17 = v12 - v16 - v5;
LABEL_6:
  v18 = 0.0;
  v19 = v10;
  v20 = v7;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (CGRect)bottomLeftToolbarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat Height;
  CGFloat MinX;
  CGFloat MinY;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  if (-[BKFlowingBookLayoutConfiguration configurationHasABottomLeftToolbar](self, "configurationHasABottomLeftToolbar"))
  {
    -[BKFlowingBookLayoutConfiguration footerFrame](self, "footerFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
    v12 = v11;
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v14 = v12 - v13;
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    v15 = CGRectGetWidth(v23) * 0.5 - v12;
    -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
    v17 = v15 - v16 * 0.5;
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v19 = v17 + v18 * 2.0;
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    Height = CGRectGetHeight(v24);
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    MinX = CGRectGetMinX(v25);
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    MinY = CGRectGetMinY(v26);
    v27.origin.y = 0.0;
    v27.origin.x = v14;
    v27.size.width = v19;
    v27.size.height = Height;
    v28 = CGRectOffset(v27, MinX, MinY);
    return CGRectIntegral(v28);
  }
  else
  {
    result.origin.x = CGRectZero.origin.x;
    result.origin.y = CGRectZero.origin.y;
    result.size.width = CGRectZero.size.width;
    result.size.height = CGRectZero.size.height;
  }
  return result;
}

- (CGRect)bottomRightToolbarFrame
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat MinY;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
  v4 = v3;
  -[BKFlowingBookLayoutConfiguration footerFrame](self, "footerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[BKFlowingBookLayoutConfiguration configurationHasABottomLeftToolbar](self, "configurationHasABottomLeftToolbar"))
  {
    -[BKFlowingBookLayoutConfiguration footerFrame](self, "footerFrame");
    v14 = v13;
    -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
    v16 = (v15 + v14) * 0.5;
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v18 = v16 - v17;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    MinY = CGRectGetMinY(v25);
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    v20 = CGRectGetWidth(v26) * 0.5 - v4;
    -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
    v22 = v20 - v21 * 0.5;
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v24 = v22 + v23 * 2.0;
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    v28.size.height = CGRectGetHeight(v27);
    v28.origin.x = v18;
    v28.origin.y = MinY;
    v28.size.width = v24;
    return CGRectIntegral(v28);
  }
  else
  {
    -[BKFlowingBookLayoutConfiguration bottomFullWidthToolbarFrame](self, "bottomFullWidthToolbarFrame");
  }
  return result;
}

- (CGRect)bottomFullWidthToolbarFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MinX;
  CGFloat MinY;
  void *v17;
  double v18;
  CGFloat width;
  CGFloat Height;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
  v4 = v3;
  v6 = v5;
  -[BKFlowingBookLayoutConfiguration footerFrame](self, "footerFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v33.origin.x = v8;
    v33.origin.y = v10;
    v33.size.width = v12;
    v33.size.height = v14;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = v8;
    v34.origin.y = v10;
    v34.size.width = v12;
    v34.size.height = v14;
    MinY = CGRectGetMinY(v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v17, "size");
    width = v18;
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.width = v12;
    v35.size.height = v14;
    Height = CGRectGetHeight(v35);

  }
  else
  {
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v22 = v4 - v21;
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    v23 = CGRectGetWidth(v36) - v4 - v6;
    -[BKFlowingBookLayoutConfiguration toolbarButtonMargin](self, "toolbarButtonMargin");
    v25 = v23 + v24 * 2.0;
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    v26 = CGRectGetHeight(v37);
    v38.origin.x = v8;
    v38.origin.y = v10;
    v38.size.width = v12;
    v38.size.height = v14;
    v27 = CGRectGetMinX(v38);
    v39.origin.x = v8;
    v39.origin.y = v10;
    v39.size.width = v12;
    v39.size.height = v14;
    v28 = CGRectGetMinY(v39);
    v40.origin.y = 0.0;
    v40.origin.x = v22;
    v40.size.width = v25;
    v40.size.height = v26;
    v41 = CGRectOffset(v40, v27, v28);
    MinX = v41.origin.x;
    MinY = v41.origin.y;
    width = v41.size.width;
    Height = v41.size.height;
  }
  v29 = MinX;
  v30 = MinY;
  v31 = width;
  v32 = Height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)bottomBackgoundBarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration footerFrame](self, "footerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v11, "size");
  v13 = v12;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v14 = v13 - CGRectGetMinY(v19);

  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)hiddenBottomLeftToolbarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration bottomLeftToolbarFrame](self, "bottomLeftToolbarFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (!CGRectIsEmpty(v16))
    {
      -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
      v6 = v6 + v11 * -0.5;
    }
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)hiddenBottomRightToolbarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[BKFlowingBookLayoutConfiguration bottomRightToolbarFrame](self, "bottomRightToolbarFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (!CGRectIsEmpty(v16))
    {
      -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
      v6 = v6 + v11 * -0.5;
    }
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)scrubberStyle
{
  return 0;
}

- (CGRect)scrubberFrame
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  -[BKFlowingBookLayoutConfiguration _scrubberFrameHorizontalOriginY](self, "_scrubberFrameHorizontalOriginY");
  v5 = v4;
  v6 = -[BKFlowingBookLayoutConfiguration layout](self, "layout");
  -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
  v8 = v7;
  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v10 = v9;
  -[BKFlowingBookLayoutConfiguration scrubberLeftRightInset](self, "scrubberLeftRightInset");
  v12 = v11;
  -[BKFlowingBookLayoutConfiguration scrubberVerticalInset](self, "scrubberVerticalInset");
  v14 = v13;
  -[BKFlowingBookLayoutConfiguration scrubberWidth](self, "scrubberWidth");
  v16 = v15;
  -[BKFlowingBookLayoutConfiguration scrubberHeight](self, "scrubberHeight");
  v18 = BKScrubberFrame(v3, v6, v5, v8, v10, v12, v14, v16, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)scrubberCalloutWidth
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  v4 = objc_msgSend(v3, "isCompactWidth");

  if (!v4)
    return 403.0;
  if (-[BKFlowingBookLayoutConfiguration isScroll](self, "isScroll"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v5, "size");
    v7 = v6 + -60.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v7 - v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v10 - v12;

  }
  else
  {
    -[BKFlowingBookLayoutConfiguration scrubberFrame](self, "scrubberFrame");
    return v14;
  }
  return v13;
}

- (double)bookmarkHotspotDimension
{
  return 66.0;
}

- (BOOL)wantTranslucentToolbars
{
  return (char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 2;
}

- (BOOL)_useCompactStrings
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  if ((objc_msgSend(v3, "isCompactWidth") & 1) != 0)
  {

LABEL_6:
    LOBYTE(v9) = 1;
    return v9;
  }
  -[BKFlowingBookLayoutConfiguration contentLayoutSize](self, "contentLayoutSize");
  v5 = v4;
  v6 = kIMConfigurationSize_megaPhone;

  if (v5 <= v6)
    goto LABEL_6;
  v9 = isPhone(v7, v8);
  if (v9)
    LOBYTE(v9) = -[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages");
  return v9;
}

- (NSString)lastPageInChapterString
{
  unsigned int v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = -[BKFlowingBookLayoutConfiguration _useCompactStrings](self, "_useCompactStrings");
  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
    v6 = CFSTR("Last page");
  else
    v6 = CFSTR("Last page in this chapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1C3088, 0));

  return (NSString *)v7;
}

- (id)singularPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", a3, 0));
  LODWORD(self) = -[BKFlowingBookLayoutConfiguration _useCompactStrings](self, "_useCompactStrings");
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)self)
    v8 = CFSTR("%@ page left");
  else
    v8 = CFSTR("%@ page left in this chapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1C3088, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4));
  return v10;
}

- (id)pluralPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", a3, 0));
  LODWORD(self) = -[BKFlowingBookLayoutConfiguration _useCompactStrings](self, "_useCompactStrings");
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)self)
    v8 = CFSTR("%@ pages left");
  else
    v8 = CFSTR("%@ pages left in this chapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1C3088, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4));
  return v10;
}

- (id)backToPageWithPageTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v4 = a3;
  LODWORD(self) = -[BKFlowingBookLayoutConfiguration _useCompactStrings](self, "_useCompactStrings");
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)self)
    v8 = CFSTR("Back to p.%@");
  else
    v8 = CFSTR("Back to page %@");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1C3088, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4));
  return v10;
}

- (id)goToPageWithPageTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v4 = a3;
  LODWORD(self) = -[BKFlowingBookLayoutConfiguration _useCompactStrings](self, "_useCompactStrings");
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)self)
    v8 = CFSTR("Go to p.%@");
  else
    v8 = CFSTR("Go to page %@");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1C3088, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v4));
  return v10;
}

- (double)pageLabelVerticalOffset
{
  return 18.0;
}

- (BOOL)hasSpreadPages
{
  if (-[BKFlowingBookLayoutConfiguration showingTOC](self, "showingTOC"))
    return -[BKFlowingBookLayoutConfiguration tocHasSpreadPages](self, "tocHasSpreadPages");
  else
    return -[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages");
}

- (BOOL)allowsScrollMode
{
  return 1;
}

- (BOOL)isScroll
{
  return -[BKFlowingBookLayoutConfiguration allowsScrollMode](self, "allowsScrollMode")
      && ((char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 2
       || (char *)-[BKFlowingBookLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 3);
}

- (BOOL)usePaginationLineGrid
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKEpubPaginationLineGridEnabled"));

  return v3;
}

- (CGSize)__layoutSizeForSpreadPages:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
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
  CGSize result;
  CGRect v32;
  CGRect v33;

  v3 = a3;
  -[BKFlowingBookLayoutConfiguration contentContainerFrame](self, "contentContainerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[BKFlowingBookLayoutConfiguration contentInsets](self, "contentInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  Height = v12 - (v15 + v19);
  if (-[BKFlowingBookLayoutConfiguration _shouldLayoutRectInsetContentRectBySafeAreaInsets](self, "_shouldLayoutRectInsetContentRectBySafeAreaInsets"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v21, "safeAreaInsets");
    v14 = v14 + v22;
    v16 = v16 + v23;
    v18 = v18 - (v22 + v24);
    Height = Height - (v23 + v25);

  }
  if (v3)
  {
    v32.origin.x = v14;
    v32.origin.y = v16;
    v32.size.width = v18;
    v32.size.height = Height;
    Width = CGRectGetWidth(v32);
    -[BKFlowingBookLayoutConfiguration gutterWidth](self, "gutterWidth");
    v28 = round((Width - v27) * 0.5);
    v33.origin.x = v14;
    v33.origin.y = v16;
    v33.size.width = v18;
    v33.size.height = Height;
    Height = CGRectGetHeight(v33);
    v18 = v28;
  }
  v29 = v18;
  v30 = Height;
  result.height = v30;
  result.width = v29;
  return result;
}

- (CGSize)layoutSize
{
  double v2;
  double v3;
  CGSize result;

  -[BKFlowingBookLayoutConfiguration __layoutSizeForSpreadPages:](self, "__layoutSizeForSpreadPages:", -[BKFlowingBookLayoutConfiguration hasSpreadPages](self, "hasSpreadPages"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)contentLayoutSize
{
  id v3;
  double v4;
  double v5;
  __n128 v6;
  __n128 v7;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  __int16 v17;
  BKFlowingBookLayoutConfiguration *v18;
  CGSize v19;
  CGSize result;

  v3 = -[BKFlowingBookLayoutConfiguration __layoutSizeForSpreadPages:](self, "__layoutSizeForSpreadPages:", -[BKFlowingBookLayoutConfiguration contentHasSpreadPages](self, "contentHasSpreadPages"));
  v4 = v6.n128_f64[0];
  v5 = v7.n128_f64[0];
  v6.n128_u64[0] = qword_20F510;
  v7.n128_u64[0] = qword_20F518;
  if (*(double *)&qword_20F510 != v4 || *(double *)&qword_20F518 != v5)
  {
    qword_20F510 = *(_QWORD *)&v4;
    qword_20F518 = *(_QWORD *)&v5;
    v9 = BKSemanticLayoutInternalLog(v3, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19.width = v4;
      v19.height = v5;
      v11 = NSStringFromCGSize(v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "contentLayoutSize: %@. %@", (uint8_t *)&v15, 0x16u);

    }
  }
  v13 = v4;
  v14 = v5;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)insetTOCorCoverViewFromContentContainerFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  double x;
  void *v8;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;
  v12 = v11;

  -[BKFlowingBookLayoutConfiguration headerToolbarHeight](self, "headerToolbarHeight");
  v14 = v10 + v13;
  -[BKFlowingBookLayoutConfiguration footerToolbarHeight](self, "footerToolbarHeight");
  v16 = v12 + v15;
  v17 = x + 0.0;
  v18 = y + v14;
  v19 = height - (v14 + v16);
  v20 = width;
  result.size.height = v19;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (double)overrideFontSize
{
  return self->_overrideFontSize;
}

- (BOOL)showingTOC
{
  return self->_showingTOC;
}

- (void)setShowingTOC:(BOOL)a3
{
  self->_showingTOC = a3;
}

- (BOOL)disableContentSpreadPages
{
  return self->_disableContentSpreadPages;
}

- (BOOL)contentHasSpreadPages
{
  return self->_contentHasSpreadPages;
}

- (BCSemanticLayoutOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration
{
  return self->_fontSizeConfiguration;
}

- (void)setFontSizeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_fontSizeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontSizeConfiguration, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (double)be_pageLength
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;

  -[BKFlowingBookLayoutConfiguration contentLayoutSize](self, "contentLayoutSize");
  v4 = v3;
  v6 = v5;
  switch(-[BKFlowingBookLayoutConfiguration layout](self, "layout"))
  {
    case 0uLL:
    case 4uLL:
      v7 = _AEBookPluginsPageTurnLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKFlowingBookLayoutConfiguration layout](self, "layout")));
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Unexpected layout configuration %@ -- returning pageLength for paginated layout", (uint8_t *)&v11, 0xCu);

      }
      break;
    case 1uLL:
    case 3uLL:
      return v4;
    case 2uLL:
      v4 = v6;
      break;
    default:
      v4 = 0.0;
      break;
  }
  return v4;
}

@end
