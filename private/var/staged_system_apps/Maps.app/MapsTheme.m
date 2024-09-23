@implementation MapsTheme

+ (Class)visualEffectClassAllowingBlur:(BOOL)a3
{
  __objc2_class **v3;
  uint64_t v4;

  v3 = (__objc2_class **)UIVisualEffectView_ptr;
  if (!a3)
    v3 = &off_101197D28;
  v4 = objc_opt_class(*v3, a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc((Class)objc_msgSend(a1, "visualEffectClassAllowingBlur:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "blurEffect"));
  v6 = objc_msgSend(v4, "initWithEffect:", v5);

  objc_msgSend(v6, "_setGroupName:", CFSTR("MapsTheme"));
  return v6;
}

+ (id)blurEffect
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((GEOConfigGetBOOL(MapsConfig_EnableThickCardMaterial, off_1014B41D8) & (v3 != (id)5)) != 0)
    v4 = 9;
  else
    v4 = 10;
  return (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v4));
}

- (void)setMapsThemeStyle:(unint64_t)a3
{
  -[MapsTheme updateMapsThemeStyleIfNeeded:](self, "updateMapsThemeStyleIfNeeded:", a3);
}

- (BOOL)updateMapsThemeStyleIfNeeded:(unint64_t)a3
{
  unint64_t mapsThemeStyle;

  mapsThemeStyle = self->_mapsThemeStyle;
  if (mapsThemeStyle != a3)
  {
    self->_mapsThemeStyle = a3;
    -[MapsTheme _updateCurrentTheme](self, "_updateCurrentTheme");
  }
  return mapsThemeStyle != a3;
}

- (BOOL)updateVisualEffectStyleIfNeeded:(unint64_t)a3
{
  unint64_t currentVisualEffectStyle;

  currentVisualEffectStyle = self->_currentVisualEffectStyle;
  if (currentVisualEffectStyle != a3)
  {
    self->_currentVisualEffectStyle = a3;
    -[MapsTheme _updateCurrentTheme](self, "_updateCurrentTheme");
  }
  return currentVisualEffectStyle != a3;
}

- (void)_updateCurrentTheme
{
  id v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *colorsForCurrentTheme;
  id v7;

  v3 = objc_msgSend((id)objc_opt_class(self), "globalThemes");
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme _mapsThemeStyleKey:](self, "_mapsThemeStyleKey:", self->_mapsThemeStyle));
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
  colorsForCurrentTheme = self->_colorsForCurrentTheme;
  self->_colorsForCurrentTheme = v5;

}

- (id)_mapsThemeStyleKey:(unint64_t)a3
{
  unint64_t currentVisualEffectStyle;
  const __CFString *v4;
  const __CFString *v5;

  currentVisualEffectStyle = self->_currentVisualEffectStyle;
  v4 = CFSTR("DarkThemeWithoutVisualEffect");
  if (a3 != 1)
    v4 = 0;
  if (!a3)
    v4 = CFSTR("StandardThemeWithoutVisualEffect");
  if (a3 == 1)
    v5 = CFSTR("DarkTheme");
  else
    v5 = 0;
  if (!a3)
    v5 = CFSTR("StandardTheme");
  if (currentVisualEffectStyle)
    v5 = 0;
  if (currentVisualEffectStyle == 1)
    return (id)v4;
  else
    return (id)v5;
}

- (MapsTheme)initWithMapsThemeStyle:(unint64_t)a3 visualEffectStyle:(unint64_t)a4
{
  MapsTheme *v6;
  MapsTheme *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *colorsForCurrentTheme;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MapsTheme;
  v6 = -[MapsTheme init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    v6->_mapsThemeStyle = a3;
    v6->_currentVisualEffectStyle = a4;
    v8 = objc_msgSend((id)objc_opt_class(v6), "globalThemes");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme _mapsThemeStyleKey:](v7, "_mapsThemeStyleKey:", v7->_mapsThemeStyle));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
    colorsForCurrentTheme = v7->_colorsForCurrentTheme;
    v7->_colorsForCurrentTheme = (NSDictionary *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7->_isRTL = objc_msgSend(v13, "userInterfaceLayoutDirection") == (id)1;

  }
  return v7;
}

- (MapsTheme)init
{
  return -[MapsTheme initWithMapsThemeStyle:visualEffectStyle:](self, "initWithMapsThemeStyle:visualEffectStyle:", 0, 0);
}

+ (id)globalThemes
{
  if (qword_1014D2BF0 != -1)
    dispatch_once(&qword_1014D2BF0, &stru_1011BE808);
  return (id)qword_1014D2BE8;
}

+ (id)sharedTheme
{
  if (qword_1014D2C00 != -1)
    dispatch_once(&qword_1014D2C00, &stru_1011BE828);
  return (id)qword_1014D2BF8;
}

- (void)applyAppearance
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend((id)objc_opt_class(self), "blurEffect");
  v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v5, 7));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITableView appearance](UITableView, "appearance"));
  objc_msgSend(v4, "setSeparatorEffect:", v3);

}

+ (UIImage)locationImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 17.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithConfiguration:", v3));

  return (UIImage *)v4;
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4
{
  return -[MapsTheme lazyLoadingImageWithKey:imageName:supportRTL:](self, "lazyLoadingImageWithKey:imageName:supportRTL:", a3, a4, 0);
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 supportRTL:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme keyColor](self, "keyColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme lazyLoadingImageWithKey:imageName:imageColor:supportRTL:](self, "lazyLoadingImageWithKey:imageName:imageColor:supportRTL:", v9, v8, v10, v5));

  return v11;
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 imageColor:(id)a5 supportRTL:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  MapsTheme *v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_colorsForCurrentTheme, "objectForKeyedSubscript:", v10));
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10062A588;
    v17[3] = &unk_1011BE890;
    v18 = v12;
    v21 = a6;
    v19 = v11;
    v20 = self;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MapsTheme lazyLoadingImageWithKey:factory:](self, "lazyLoadingImageWithKey:factory:", v10, v17));

  }
  return v15;
}

- (id)lazyLoadingImageWithKey:(id)a3 factory:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *colorsForCurrentTheme;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_colorsForCurrentTheme, "objectForKeyedSubscript:", v6));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme _mapsThemeStyleKey:](self, "_mapsThemeStyleKey:", self->_mapsThemeStyle));
    v10 = objc_msgSend((id)objc_opt_class(self), "globalThemes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v6));
    if (v13)
    {
      v8 = (void *)v13;
      v14 = v12;
    }
    else
    {
      v15 = v7[2](v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v6);
      v14 = (NSDictionary *)objc_msgSend(v16, "copy");

      v17 = objc_msgSend((id)objc_opt_class(self), "globalThemes");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v9);

    }
    colorsForCurrentTheme = self->_colorsForCurrentTheme;
    self->_colorsForCurrentTheme = v14;

  }
  return v8;
}

- (id)_navigationTrayImageWithImageName:(id)a3 key:(id)a4 supportRTL:(BOOL)a5
{
  return -[MapsTheme lazyLoadingImageWithKey:imageName:imageColor:supportRTL:](self, "lazyLoadingImageWithKey:imageName:imageColor:supportRTL:", a4, a3, 0, a5);
}

- (int64_t)activityIndicatorStyle
{
  return 100;
}

- (int64_t)statusBarStyle
{
  return self->_mapsThemeStyle != 0;
}

- (NSString)vibrantTopFilter
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_colorsForCurrentTheme, "objectForKeyedSubscript:", CFSTR("VibrantTopFilterKey"));
}

- (NSString)vibrantBackgroundFilter
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_colorsForCurrentTheme, "objectForKeyedSubscript:", CFSTR("VibrantBackgroundFilterKey"));
}

- (unint64_t)interfaceStyleIntent
{
  unint64_t mapsThemeStyle;

  mapsThemeStyle = self->_mapsThemeStyle;
  if (mapsThemeStyle)
    return 2 * (mapsThemeStyle == 1);
  else
    return 1;
}

- (unint64_t)infoCardThemeType
{
  if (-[MapsTheme visualEffectStyle](self, "visualEffectStyle")
    && (id)-[MapsTheme visualEffectStyle](self, "visualEffectStyle") != (id)1)
  {
    return 0;
  }
  if (-[MapsTheme mapsThemeStyle](self, "mapsThemeStyle"))
    return 2;
  return 1;
}

- (int64_t)textFieldKeyboardAppearance
{
  if (self->_mapsThemeStyle)
    return 1;
  else
    return 2;
}

- (int64_t)blurDarkeningAppearance
{
  if (self->_mapsThemeStyle)
    return 1;
  else
    return 2;
}

- (int64_t)selectionBackgroundAppearance
{
  if (self->_mapsThemeStyle)
    return 1;
  else
    return 4;
}

- (BOOL)isCurrentThemeSatellite
{
  return self->_mapsThemeStyle != 0;
}

- (id)statusIndicatorTextColorForStyleDefault:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  return v3;
}

- (id)statusIndicatorTextColorForStyleLightContent:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.400000006));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  return v3;
}

- (id)statusIndicatorBackgroundColor:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("StatusIndicatorHighlightedColorKey")));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme blueButtonBackgroundColor:](self, "blueButtonBackgroundColor:", 0));
  return v3;
}

- (UIColor)transitSchedulesOnTimeStopTimeTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (UIColor)transitSchedulesPastStopTextColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (UIColor)transitSchedulesPastStopLinkColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("TransitSchedulesPastDepartureLinkColor"));
}

- (UIColor)backgroundColorForModalFormSheet
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("BackgroundColorForModalFormSheet"));
}

- (id)colorForTag:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_colorsForCurrentTheme, "objectForKeyedSubscript:", a3);
}

- (UIColor)keyColor
{
  return (UIColor *)+[UIColor _maps_keyColor](UIColor, "_maps_keyColor");
}

- (UIColor)darkKeyColor
{
  return (UIColor *)+[UIColor _maps_darkKeyColor](UIColor, "_maps_darkKeyColor");
}

- (id)blackCircleButtonBackgroundColor:(unint64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", dbl_100E39A40[a3 == 1], 1.0));
}

- (id)closeXColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)textFieldAtomSelectionBackgroundColor
{
  return (UIColor *)+[UIColor _maps_keyColor](UIColor, "_maps_keyColor");
}

- (UIColor)navSignGuidanceManeuverColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)navResumeRouteBannerBackgroundColor
{
  return (UIColor *)+[UIColor _maps_keyColor](UIColor, "_maps_keyColor");
}

- (UIColor)navResumeRouteBannerHighlightColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_colorBlendedWithColor:", v3));

  return (UIColor *)v4;
}

- (UIColor)navSignGuidanceManeuverAccentColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.321568638, 1.0);
}

+ (UIColor)weatherWidgetTextColor
{
  return +[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("WeatherWidgetTextColor"));
}

- (id)fadedGrayButtonBackgroundColor:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0500000007));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.300000012));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_colorBlendedWithColor:", v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("FadedGrayButtonColorKey")));
  }
  return v5;
}

+ (UIColor)ugcGlyphButtonViewMutedBackgroundColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

+ (UIColor)ugcGlyphButtonViewMutedGlyphColor
{
  return +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
}

+ (UIColor)ugcGlyphButtonViewUnselectedBackgroundColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

+ (UIColor)ugcGlyphButtonViewUnselectedGlyphColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (UIColor)ugcGlyphButtonViewSelectedGlyphColor
{
  return (UIColor *)+[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
}

+ (UIColor)ugcGlyphButtonViewSelectedBackgroundColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

+ (UIColor)ugcAddPhotoCellBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.0500000007));

  return (UIColor *)v3;
}

+ (UIColor)ugcPOIEnrichmentEditorBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.0500000007));

  return (UIColor *)v3;
}

+ (UIColor)ugcLegalAttributionLinkColor
{
  return (UIColor *)+[MapsTheme _colorWithAssetCatalogName:](MapsTheme, "_colorWithAssetCatalogName:", CFSTR("UGCUnselectedGlyphColor"));
}

+ (UIColor)ugcPhotoCarouselCellBackgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

+ (UIColor)ugcHairlineColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.100000001));

  return (UIColor *)v3;
}

+ (id)_colorWithAssetCatalogName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", v3, v4, 0));

  return v5;
}

+ (UIColor)floatingControlsTintColor
{
  return (UIColor *)+[MapsTheme _colorWithAssetCatalogName:](MapsTheme, "_colorWithAssetCatalogName:", CFSTR("FloatingControlsTintColor"));
}

+ (UIColor)apertureKeyColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.4992, 0.8017, 0.999, 1.0);
}

- (id)_maps_colorNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", v3));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0));

  }
  return v4;
}

- (UIColor)imageBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ImageBackgroundColorKey"));
}

- (UIColor)imageBorderColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ImageBorderColorKey"));
}

- (UIColor)disabledTitleColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("DisabledTitleColorKey"));
}

- (UIColor)hairlineBorderColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("HairlineBorderColorKey"));
}

- (UIColor)searchBarPlaceHolderColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("SearchBarPlaceHolderColorKey"));
}

- (UIColor)tableViewCellHighlightedOverlayColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("TableViewCellHighlightedOverlayColorKey"));
}

- (UIColor)childItemButtonBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ChildItemButtonBackgroundColorKey"));
}

- (UIColor)textFieldAtomSelectionTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("TextFieldAtomSelectionTextColorKey"));
}

- (UIColor)autocompleteSectionTitleTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("AutocompleteSectionTitleTextColor"));
}

- (UIColor)steppingSignButtonTitleColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("SteppingSignButtonTitleColor"));
}

- (id)greenButtonTitleColor:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("GreenButtonHighlightedTitleColorKey");
  else
    v3 = CFSTR("GreenButtonTitleColorKey");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)blueButtonTitleColor:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("BlueButtonHighlightedTitleColorKey");
  else
    v3 = CFSTR("BlueButtonTitleColorKey");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)fadedGrayButtonTitleColor:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("FadedGrayButtonTitleColorKey");
  else
    v3 = CFSTR("FadedGrayButtonHighlightedTitleColorKey");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (UIColor)progressBarTrackTintColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ProgressBarTrackTintColorKey"));
}

- (UIColor)progressBarDarkFillTintColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ProgressBarDarkFillTintColorKey"));
}

- (UIColor)progressBarLightFillTintColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ProgressBarLightFillTintColorKey"));
}

- (UIColor)navigationFeatureCellBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavigationFeatureCellBackgroundColor"));
}

- (UIColor)navigationFeatureCellForegroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavigationFeatureCellForegroundColor"));
}

- (UIColor)navigationFeatureCellHighlightedOverlayColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavigationFeatureCellHighlightedOverlayColor"));
}

- (UIColor)navResumeButtonColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavResumeButtonColor"));
}

- (UIColor)navSignPrimaryColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavSignPrimaryColor"));
}

- (UIColor)navSignSecondaryColor
{
  if (qword_1014D2C10 != -1)
    dispatch_once(&qword_1014D2C10, &stru_1011BE8B0);
  return (UIColor *)(id)qword_1014D2C08;
}

- (UIColor)navSignMajorTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavSignMajorTextColor"));
}

- (UIColor)navSignMinorTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavSignMinorTextColor"));
}

- (UIColor)navSignTertiaryTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavSignTertiaryTextColor"));
}

- (UIColor)navSignLaneGuidanceDividerColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavSignLaneGuidanceDividerColor"));
}

- (UIColor)navButtonPrimaryColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavButtonPrimaryColor"));
}

- (UIColor)navDirectionStepPrimaryColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavDirectionStepPrimaryColor"));
}

- (UIColor)navDirectionStepSecondaryColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavDirectionStepSecondaryColor"));
}

- (UIColor)navTrayTitleTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("NavTrayTitleTextColor"));
}

- (UIColor)parkedCarSectionHeaderColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ParkedCarSectionHeaderColor"));
}

- (UIColor)parkedCarNotePlaceholderColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ParkedCarNotePlaceholderColor"));
}

- (UIColor)addPhotoPlaceholderBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("AddPhotoPlaceholderBackgroundColor"));
}

- (UIColor)addPhotoPlaceholderForegroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("AddPhotoPlaceholderForegroundColor"));
}

- (UIColor)reservationsGrayColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("ReservationsGrayColor"));
}

- (UIColor)orbHintPhaseBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("OrbHintPhaseBackgroundColorKey"));
}

- (id)ridesharingRatingStarColorOn:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("RidesharingRatingStarOnColor");
  else
    v3 = CFSTR("RidesharingRatingStarOffColor");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)ridesharingTippingOptionsBackgroundColor:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("RidesharingTippingOptionsBackgroundSelectedColor");
  else
    v3 = CFSTR("RidesharingTippingOptionsBackgroundUnselectedColor");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)ridesharingTippingOptionsForegroundColor:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("RidesharingTippingOptionsForegroundSelectedColor");
  else
    v3 = CFSTR("RidesharingTippingOptionsForegroundUnselectedColor");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)ridesharingTippingOptionsForegroundCurrencyColor:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("RidesharingTippingOptionsForegroundCurrencySelectedColor");
  else
    v3 = CFSTR("RidesharingTippingOptionsForegroundCurrencyUnselectedColor");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (id)flyoverTourButtonBackgroundColor:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("FlyoverTourButtonBackgroundSelectedColor");
  else
    v3 = CFSTR("FlyoverTourButtonBackgroundUnselectedColor");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", v3));
}

- (UIColor)venueFloorPickerTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("VenueFloorPickerTextColor"));
}

- (UIColor)venueFloorPickerLackingSearchResultsTextColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("VenueFloorPickerLackingSearchResultsTextColor"));
}

- (UIColor)venueFloorPickerHighlightColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("VenueFloorPickerHighlightColor"));
}

- (UIColor)favoriteCollectionIconColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("FavoriteCollectionIconColor"));
}

- (UIColor)favoriteCollectionIconBackgroundColor
{
  return (UIColor *)-[MapsTheme _maps_colorNamed:](self, "_maps_colorNamed:", CFSTR("FavoriteCollectionIconBackgroundColor"));
}

- (UIColor)vibrantTopColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("VibrantTopColorKey"));
}

- (UIColor)vibrantBackgroundColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("VibrantBackgroundColorKey"));
}

- (UIColor)controlBackgroundColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("ControlBackgroundColorKey"));
}

- (UIColor)dynamicControlBackgroundColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062B288;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D2C20 != -1)
    dispatch_once(&qword_1014D2C20, block);
  return (UIColor *)(id)qword_1014D2C18;
}

- (UIColor)groupTableViewBackgroundColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("GroupTableViewBackgroundColorKey"));
}

- (UIColor)groupTableViewCellBackgroundColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("GroupTableViewCellBackgroundColorKey"));
}

- (UIColor)groupTableViewHairlineColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("GroupTableViewHairlineColor"));
}

- (UIColor)hairlineColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("HairLineColorKey"));
}

- (UIColor)dynamicHairlineColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10062B4D8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D2C30 != -1)
    dispatch_once(&qword_1014D2C30, block);
  return (UIColor *)(id)qword_1014D2C28;
}

- (UIColor)controlTintColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("controlTintColorKey"));
}

- (id)greenButtonBackgroundColor:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("GreenButtonHighlightedColorKey");
  else
    v3 = CFSTR("GreenButtonColorKey");
  return (id)objc_claimAutoreleasedReturnValue(-[MapsTheme colorForTag:](self, "colorForTag:", v3));
}

- (id)blueButtonBackgroundColor:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("BlueButtonHighlightedColorKey")));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
  return v3;
}

- (UIColor)navEndButtonTitleColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)navEndButtonBackgroundColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("kNavEndButtonBackgroundColor"));
}

- (UIColor)navEndButtonBackgroundHighlightedColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.282352954, 0.282352954, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_colorBlendedWithColor:", v3));

  return (UIColor *)v4;
}

- (UIColor)navPauseButtonTitleColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (UIColor)navPauseButtonBackgroundColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

- (UIColor)navPauseButtonBackgroundHighlightedColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_colorBlendedWithColor:", v3));

  return (UIColor *)v4;
}

- (UIColor)navResumeButtonHighlightedColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("NavResumeButtonHighlightedColor"));
}

- (UIColor)navTraySecondaryTextColor
{
  return (UIColor *)-[MapsTheme colorForTag:](self, "colorForTag:", CFSTR("kNavTraySecondaryTextColor"));
}

- (unint64_t)visualEffectStyle
{
  return self->_visualEffectStyle;
}

- (BOOL)showLightContentForListStep
{
  return self->_showLightContentForListStep;
}

- (UIColor)browseTitleBackgroundColor
{
  return self->_browseTitleBackgroundColor;
}

- (unint64_t)mapsThemeStyle
{
  return self->_mapsThemeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseTitleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_colorsForCurrentTheme, 0);
}

@end
