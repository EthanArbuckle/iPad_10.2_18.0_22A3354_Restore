@implementation BKStyleManager

+ (void)initialize
{
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[4];

  *(_QWORD *)&v3 = objc_opt_class(BKStyleManager).n128_u64[0];
  if (v4 == a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v3));
    v9[0] = BKAutoHyphenation[0];
    v9[1] = BKOptimizeLegibility[0];
    v10[0] = &__kCFBooleanTrue;
    v10[1] = &__kCFBooleanFalse;
    v10[2] = &__kCFBooleanFalse;
    v9[2] = CFSTR("BKUseOldFontStepsAndSpacing");
    v9[3] = BKStyleManagerLastStyleIndexKey;
    isPad(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
    v10[3] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
    objc_msgSend(v5, "registerDefaults:", v8);

  }
}

+ (int64_t)defaultFontSizeIndex
{
  isPad(a1, a2);
  return 3;
}

+ (id)styleManagerWithLanguage:(id)a3
{
  id v3;
  BKStyleManager *v4;

  v3 = a3;
  v4 = -[BKStyleManager initWithLanguage:]([BKStyleManager alloc], "initWithLanguage:", v3);

  return v4;
}

- (BKStyleManager)initWithLanguage:(id)a3
{
  __CFString *v4;
  BKStyleManager *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  NSString *languageSuffix;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = (__CFString *)a3;
  v26.receiver = self;
  v26.super_class = (Class)BKStyleManager;
  v5 = -[BKStyleManager init](&v26, "init");
  if (v5)
  {
    if (!-[__CFString length](v4, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));

      if (v7
        && (v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v7))) != 0)
      {
        v9 = v8;
        v10 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[__CFString languageCode](v8, "languageCode"));

        v4 = v9;
      }
      else
      {
        v10 = CFSTR("en");
      }

      v4 = (__CFString *)v10;
    }
    objc_storeStrong((id *)&v5->_language, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKStyleManager suffixForLanguage:](BKStyleManager, "suffixForLanguage:", v4));
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-%@"), v11));
      languageSuffix = v5->_languageSuffix;
      v5->_languageSuffix = (NSString *)v12;
    }
    else
    {
      languageSuffix = v5->_languageSuffix;
      v5->_languageSuffix = (NSString *)&stru_1C3088;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
    objc_msgSend(v14, "prewarmFontsForLanguage:completion:", v4, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5->_autoHyphenation = objc_msgSend(v15, "BOOLForKey:", BKAutoHyphenation[0]);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5->_legibility = objc_msgSend(v16, "BOOLForKey:", BKOptimizeLegibility[0]);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", BKStyleManagerLastStyleIndexKey));

    if (!v18 || (v19 = (int64_t)objc_msgSend(v18, "integerValue"), v5->_index = v19, v19 < 0))
    {
      *(_QWORD *)&v20 = objc_opt_class(v5).n128_u64[0];
      v5->_index = (int64_t)objc_msgSend(v21, "defaultFontSizeIndex", v20);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v22, "addObserver:", v5);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, "fontStateChanged:", BEFontStateChangedNotification, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v5, BKAutoHyphenation[0], 1, off_20E008);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, BKAutoHyphenation[0], off_20E008);

  v6.receiver = self;
  v6.super_class = (Class)BKStyleManager;
  -[BKStyleManager dealloc](&v6, "dealloc");
}

+ (BOOL)languageIsSimplifiedChinese:(id)a3
{
  return +[IMLanguageUtilities languageIsSimplifiedChinese:](IMLanguageUtilities, "languageIsSimplifiedChinese:", a3);
}

+ (id)suffixForLanguage:(id)a3
{
  return +[IMLanguageUtilities suffixForLanguage:](IMLanguageUtilities, "suffixForLanguage:", a3);
}

- (BOOL)languageIsSimplifiedChinese
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v3 = +[BKStyleManager languageIsSimplifiedChinese:](BKStyleManager, "languageIsSimplifiedChinese:", v2);

  return v3;
}

- (id)fallbackFontFamiliesForFontFamily:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontFallbackProvider fallbacksForFontFamily:language:](BKFontFallbackProvider, "fallbacksForFontFamily:language:", v4, v5));

  return v6;
}

- (void)setAutoHyphenation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_autoHyphenation != a3)
  {
    v3 = a3;
    self->_autoHyphenation = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
    v6 = objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setAutoHyphenate:", v3);
    -[BKStyleManager setStyle:](self, "setStyle:", v6);

  }
}

- (void)setOptimizeLegibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_legibility != a3)
  {
    v3 = a3;
    self->_legibility = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
    v6 = objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setOptimizeLegibility:", v3);
    -[BKStyleManager setStyle:](self, "setStyle:", v6);

  }
}

- (id)presets
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presetsForLanguage:", v4));

  return v5;
}

- (void)setStyle:(id)a3
{
  ContentStyle *style;
  id v6;

  v6 = a3;
  if (!-[ContentStyle isEqual:](self->_style, "isEqual:"))
  {
    style = self->_style;
    objc_storeStrong((id *)&self->_style, a3);
    -[BKStyleManager storeDefaultStyle:](self, "storeDefaultStyle:", v6);
    if (style)
      -[BKStyleManager notifyStyleChanged](self, "notifyStyleChanged");
  }

}

- (id)_defaultFontName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultFontNameForLanguage:", v4));

  return v5;
}

- (id)_presetsForFontName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presetSettingsForFontFamily:language:", v4, v6));

  return v7;
}

- (id)styleForFont:(id)a3 presetIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  ContentStyle *v12;
  void *v13;
  unsigned __int8 v14;
  int64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double Width;
  double Height;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  CGRect v33;
  CGRect v34;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _presetsForFontName:](self, "_presetsForFontName:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "count");
    v10 = (char *)a4;
    if ((unint64_t)v9 <= a4)
      v10 = (char *)objc_msgSend(v8, "count", a4) - 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v10));
    v12 = -[ContentStyle initWithFontFamily:andDetails:]([ContentStyle alloc], "initWithFontFamily:andDetails:", v6, v11);
    -[ContentStyle setAutoHyphenate:](v12, "setAutoHyphenate:", -[BKStyleManager autoHyphenation](self, "autoHyphenation"));
    -[ContentStyle setOptimizeLegibility:](v12, "setOptimizeLegibility:", -[BKStyleManager optimizeLegibility](self, "optimizeLegibility"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

    if ((v14 & 1) == 0)
    {
      if ((unint64_t)a4 >= 0xE)
        v15 = 14;
      else
        v15 = a4;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v16, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v33.origin.x = v18;
      v33.origin.y = v20;
      v33.size.width = v22;
      v33.size.height = v24;
      Width = CGRectGetWidth(v33);
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      Height = CGRectGetHeight(v34);
      if (Width < Height)
        Height = Width;
      if (Height >= 320.0)
      {
        v28 = 1;
        v27 = 3;
        while (v28 != 4)
        {
          v29 = dbl_172DD0[v28++];
          if (v29 > Height)
          {
            v27 = v28 - 2;
            break;
          }
        }
      }
      else
      {
        v27 = 1;
      }
      v30 = dbl_172DF0[v27] * dbl_172D58[v15];
      *(float *)&v30 = v30;
      -[ContentStyle setFontSize:](v12, "setFontSize:", v30);
      LODWORD(v31) = 1.0;
      -[ContentStyle setLineHeight:](v12, "setLineHeight:", v31);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (float)fontSizeForFont:(id)a3 category:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  float v10;
  float v11;

  v6 = qword_20F5A8;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&qword_20F5A8, &stru_1C0F58);
  v9 = objc_msgSend((id)qword_20F5A0, "indexOfObject:", v7);

  -[BKStyleManager fontSizeForFont:presetIndex:](self, "fontSizeForFont:presetIndex:", v8, v9);
  v11 = v10;

  return v11;
}

- (float)fontSizeForFont:(id)a3 presetIndex:(int64_t)a4
{
  void *v4;
  void *v5;
  float v6;
  float v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", a3, a4));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fontSize");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }

  return v7;
}

- (id)fonts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontsForLanguage:", v4));

  return v5;
}

- (id)fontForFontFamily:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontFromFamilyName:language:", v4, v6));

  return v7;
}

- (id)fontFaceMappings
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager language](self, "language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presetPostscriptsLookupForLanguage:", v4));

  return v5;
}

- (NSString)font
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontFamily"));

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_1C3088;
  return (NSString *)v4;
}

- (id)_detailsForFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager fonts](self, "fonts", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isFontPreregistered:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _detailsForFont:](self, "_detailsForFont:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "kind") != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isFontAvailable:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _detailsForFont:](self, "_detailsForFont:", a3));
  v4 = objc_msgSend(v3, "isAvailable");

  return v4;
}

- (void)setFont:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v5 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v10, self->_index));
    -[BKStyleManager setStyle:](self, "setStyle:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontFamily"));
    objc_msgSend(v7, "observer:didChangeFont:", self, v9);

  }
}

- (float)fontSize
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
  objc_msgSend(v2, "fontSize");
  v4 = v3;

  return v4;
}

- (void)setFontSize:(float)a3
{
  float v5;
  void *v6;
  double v7;
  id v8;

  -[BKStyleManager fontSize](self, "fontSize");
  if (v5 != a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
    v8 = objc_msgSend(v6, "copy");

    *(float *)&v7 = a3;
    objc_msgSend(v8, "setFontSize:", v7);
    -[BKStyleManager setStyle:](self, "setStyle:", v8);

  }
}

- (void)reloadCurrentStyle
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v4, self->_index));
  -[BKStyleManager setStyle:](self, "setStyle:", v3);

}

- (float)lineHeight
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
  objc_msgSend(v2, "lineHeight");
  v4 = v3;

  return v4;
}

- (void)setLineHeight:(float)a3
{
  float v5;
  void *v6;
  double v7;
  id v8;

  -[BKStyleManager lineHeight](self, "lineHeight");
  if (v5 != a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
    v8 = objc_msgSend(v6, "copy");

    *(float *)&v7 = a3;
    objc_msgSend(v8, "setLineHeight:", v7);
    -[BKStyleManager setStyle:](self, "setStyle:", v8);

  }
}

- (int64_t)fontSizeIndex
{
  return self->_index;
}

- (int64_t)_maxFontStepsForFont:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _presetsForFontName:](self, "_presetsForFontName:", v4));
  v8 = objc_msgSend(v7, "count");
  v9 = 15;
  if ((unint64_t)v8 < 0xF)
    v9 = (uint64_t)v8;
  if (v6)
    v10 = (int64_t)v8;
  else
    v10 = v9;

  return v10;
}

- (BOOL)canIncreaseFontSize
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v5 = -[BKStyleManager _maxFontStepsForFont:](self, "_maxFontStepsForFont:", v4);

  return self->_index < v5 - 1;
}

- (BOOL)canDecreaseFontSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));

  if (!v3)
    return 0;
  if ((isPad(v4, v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = v9;

    v6 = 2;
    if (v10 >= 2.0)
      v6 = 0;
  }
  return self->_index > v6;
}

- (void)setDefaultFontSize
{
  void *v3;
  id v4;
  double v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "integerForKey:", BKStyleManagerLastStyleIndexKey);

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(v6, "defaultFontSizeIndex", v5);
  if (v4 != v7)
  {
    v8 = v7;
    self->_index = (int64_t)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v9, self->_index));
    -[BKStyleManager setStyle:](self, "setStyle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v11, "setInteger:forKey:", self->_index, BKStyleManagerLastStyleIndexKey);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    v13 = v12;
    if ((uint64_t)v4 >= (uint64_t)v8)
      objc_msgSend(v12, "observerDidDecreaseFontSize:", self);
    else
      objc_msgSend(v12, "observerDidIncreaseFontSize:", self);

  }
}

- (void)increaseFontSize
{
  -[BKStyleManager increaseFontSizeNotifyingCoordinator:](self, "increaseFontSizeNotifyingCoordinator:", 1);
}

- (void)increaseFontSizeNotifyingCoordinator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t index;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKStyleManager _presetsForFontName:](self, "_presetsForFontName:", v5));

  index = self->_index;
  v7 = (char *)objc_msgSend(v12, "count") - 1;
  if (index + 1 < (unint64_t)v7)
    v7 = (char *)(index + 1);
  self->_index = (int64_t)v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v8, self->_index));
  -[BKStyleManager setStyle:](self, "setStyle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "setInteger:forKey:", self->_index, BKStyleManagerLastStyleIndexKey);

  if (v3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v11, "observerDidIncreaseFontSize:", self);

  }
}

- (void)decreaseFontSize
{
  -[BKStyleManager decreaseFontSizeNotifyingCoordinator:](self, "decreaseFontSizeNotifyingCoordinator:", 1);
}

- (void)decreaseFontSizeNotifyingCoordinator:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if ((isPad(self, a2) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    v8 = v7;

    v5 = 2;
    if (v8 >= 2.0)
      v5 = 0;
  }
  if (self->_index - 1 > v5)
    v5 = self->_index - 1;
  self->_index = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v9, self->_index));
  -[BKStyleManager setStyle:](self, "setStyle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "setInteger:forKey:", self->_index, BKStyleManagerLastStyleIndexKey);

  if (v3)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v12, "observerDidDecreaseFontSize:", self);

  }
}

- (void)notifyStyleChanged
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  NSMutableDictionary *v7;

  v7 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager style](self, "style"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v3, BKStyleManagerNewStyleUserInfoKey[0]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = BKStyleManagerDidChangeStyleNotification[0];
  v6 = -[NSMutableDictionary copy](v7, "copy");
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, self, v6);

}

- (void)verifySelectedFont
{
  id v2;

  v2 = -[BKStyleManager fonts](self, "fonts");
}

- (id)defaultStyleWithOriginalFonts:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager languageSuffix](self, "languageSuffix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "integerForKey:", BKStyleManagerLastStyleIndexKey);

  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", &stru_1C3088, v7));
    if (v8)
      goto LABEL_25;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), BKStyleManagerLastFontKey, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForKey:", v9));

  if (-[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR(".SFUIText")))
  {

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = CFSTR("-apple-system");
    objc_msgSend(v12, "setObject:forKey:", CFSTR("-apple-system"), v9);

  }
  if (!-[__CFString length](v11, "length") && !objc_msgSend(v5, "length"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", BKStyleManagerLastStyleKey));

    if (!v14)
    {
LABEL_19:

      goto LABEL_20;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ContentStyle fontNameFromSummaryString:](ContentStyle, "fontNameFromSummaryString:", v14));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v15, v7));
    if (v22)
    {
      v16 = v15;
    }
    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Verdana")) & 1) != 0)
    {
      v16 = CFSTR("Seravek");
    }
    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Baskerville")) & 1) != 0
           || (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Georgia")) & 1) != 0)
    {
      v16 = CFSTR("Iowan Old Style");
    }
    else
    {
      if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Cochin")) & 1) == 0)
        goto LABEL_16;
      v16 = CFSTR("Athelas");
    }

    v11 = (__CFString *)v16;
LABEL_16:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v17, "removeObjectForKey:", BKStyleManagerLastStyleKey);

    if (-[__CFString length](v11, "length"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v18, "setObject:forKey:", v11, v9);

    }
    goto LABEL_19;
  }
LABEL_20:
  if (!-[__CFString length](v11, "length"))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[BKStyleManager _defaultFontName](self, "_defaultFontName"));

    v11 = (__CFString *)v19;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v11, v7));
  if (!v8)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _defaultFontName](self, "_defaultFontName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v20, v7));

  }
LABEL_25:
  objc_msgSend(v8, "setAutoHyphenate:", -[BKStyleManager autoHyphenation](self, "autoHyphenation"));
  objc_msgSend(v8, "setOptimizeLegibility:", -[BKStyleManager optimizeLegibility](self, "optimizeLegibility"));

  return v8;
}

- (void)storeDefaultStyle:(id)a3
{
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontFamily"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = BKStyleManagerLastFontKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager languageSuffix](self, "languageSuffix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontFamily"));
    objc_msgSend(v9, "setObject:forKey:", v10, v8);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD);
  objc_super v15;
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_20E008 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_A25C4;
    v18[3] = &unk_1C0F80;
    v19 = v12;
    v20 = v10;
    objc_copyWeak(&v21, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_A2670;
        block[3] = &unk_1BEC70;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKStyleManager;
    -[BKStyleManager observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)fontStateChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = _AEBookPluginsFontCacheLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "StateChanged for font: %@", (uint8_t *)&v14, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager font](self, "font"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9 && (objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 4))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager _defaultFontName](self, "_defaultFontName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKStyleManager styleForFont:presetIndex:](self, "styleForFont:presetIndex:", v10, 0));

    v12 = _AEBookPluginsFontCacheLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Setting fallback style for font: %@ to %@", (uint8_t *)&v14, 0x16u);
    }

    -[BKStyleManager setStyle:](self, "setStyle:", v11);
  }

}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
  if (-[BKStyleManager canIncreaseFontSize](self, "canIncreaseFontSize", a3, a4))
    -[BKStyleManager increaseFontSizeNotifyingCoordinator:](self, "increaseFontSizeNotifyingCoordinator:", 0);
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
  if (-[BKStyleManager canDecreaseFontSize](self, "canDecreaseFontSize", a3, a4))
    -[BKStyleManager decreaseFontSizeNotifyingCoordinator:](self, "decreaseFontSizeNotifyingCoordinator:", 0);
}

- (NSString)language
{
  return self->_language;
}

- (ContentStyle)style
{
  return self->_style;
}

- (BOOL)autoHyphenation
{
  return self->_autoHyphenation;
}

- (BOOL)optimizeLegibility
{
  return self->_legibility;
}

- (NSString)languageSuffix
{
  return self->_languageSuffix;
}

- (void)setLanguageSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)addedPresetFonts
{
  return self->_addedPresetFonts;
}

- (void)setAddedPresetFonts:(BOOL)a3
{
  self->_addedPresetFonts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageSuffix, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
