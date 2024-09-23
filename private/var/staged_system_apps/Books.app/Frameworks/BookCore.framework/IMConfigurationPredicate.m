@implementation IMConfigurationPredicate

+ (id)phoneSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 320.0, 480.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iPhone Display Class Size"));
  return v2;
}

+ (id)tallPhoneSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 320.0, 568.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iPhone Display Class Size"));
  return v2;
}

+ (id)largePhoneSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 375.0, 667.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("largePhone Display Class Size"));
  return v2;
}

+ (id)megaPhoneSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 414.0, 736.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPhone Display Class Size"));
  return v2;
}

+ (id)superPhonePortraitExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 375.0, 812.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("superPhone Portrait Size"));
  return v2;
}

+ (id)superPhoneLandscapeExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 812.0, 375.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("superPhone Landscape Size"));
  return v2;
}

+ (id)superMegaPhonePortraitExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 414.0, 896.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("superMegaPhone Portrait Size"));
  return v2;
}

+ (id)superMegaPhoneLandscapeExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 896.0, 414.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("superMegaPhone Landscape Size"));
  return v2;
}

+ (id)proMaxPhoneLandscapeExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 926.0, 428.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("proMaxPhone Landscape Size"));
  return v2;
}

+ (id)iPadSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 768.0, 1024.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iPad Display Class Size"));
  return v2;
}

+ (id)iPad10SizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 834.0, 1112.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iPad10 Display Class Size"));
  return v2;
}

+ (id)iPadOtherSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 834.0, 1194.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iPad Other Display Class Size"));
  return v2;
}

+ (id)megaPadSizeClassPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForDisplayClassSize:](IMSizeConfigurationPredicate, "predicateForDisplayClassSize:", 1024.0, 1366.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Display Class Size"));
  return v2;
}

+ (id)megaPadPortraitOneThirdExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 375.0, 1024.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Portrait One Third Size"));
  return v2;
}

+ (id)megaPadPortraitOneHalfExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 678.0, 1024.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Portrait One Half Size"));
  return v2;
}

+ (id)megaPadPortraitTwoThirdsExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 981.0, 1024.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Portrait Two Thirds Size"));
  return v2;
}

+ (id)megaPadPortraitTwoFifthsExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 375.0, 1366.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Portrait Two Fifths Size"));
  return v2;
}

+ (id)megaPadPortraitThreeFifthsExactSizePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSizeConfigurationPredicate predicateForExactSize:](IMSizeConfigurationPredicate, "predicateForExactSize:", 639.0, 1366.0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("megaPad Portrait Three Fifths Size"));
  return v2;
}

+ (id)portraitPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMOrientationConfigurationPredicate portraitPredicate](IMOrientationConfigurationPredicate, "portraitPredicate"));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("Portrait"));
  return v2;
}

+ (id)landscapePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMOrientationConfigurationPredicate landscapePredicate](IMOrientationConfigurationPredicate, "landscapePredicate"));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("Landscape"));
  return v2;
}

+ (IMConfigurationPredicate)predicateWithBlock:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMBlockConfigurationPredicate predicateWithBlock:](IMBlockConfigurationPredicate, "predicateWithBlock:", a3));
  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("block"));
  return (IMConfigurationPredicate *)v3;
}

+ (IMConfigurationPredicate)predicateWithTraitCollection:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMTraitCollectionConfigurationPredicate predicateWithTraitCollection:](IMTraitCollectionConfigurationPredicate, "predicateWithTraitCollection:", a3));
  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("traitCollection"));
  return (IMConfigurationPredicate *)v3;
}

+ (id)compactWidthPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));

  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Compact Width"));
  return v3;
}

+ (id)regularWidthPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));

  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Regular Width"));
  return v3;
}

+ (id)compactHeightPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithVerticalSizeClass:](UITraitCollection, "traitCollectionWithVerticalSizeClass:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));

  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Compact Height"));
  return v3;
}

+ (id)regularHeightPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithVerticalSizeClass:](UITraitCollection, "traitCollectionWithVerticalSizeClass:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));

  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Regular Height"));
  return v3;
}

+ (id)iOSPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMOSConfigurationPredicate iOSPredicate](IMOSConfigurationPredicate, "iOSPredicate"));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("iOS"));
  return v2;
}

+ (id)OSXPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMOSConfigurationPredicate OSXPredicate](IMOSConfigurationPredicate, "OSXPredicate"));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("OSX"));
  return v2;
}

+ (id)truePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMBoolValueConfigurationPredicate predicateWithValue:](IMBoolValueConfigurationPredicate, "predicateWithValue:", 1));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("TRUE"));
  return v2;
}

+ (id)falsePredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMBoolValueConfigurationPredicate predicateWithValue:](IMBoolValueConfigurationPredicate, "predicateWithValue:", 0));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("FALSE"));
  return v2;
}

+ (id)defaultPredicate
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMBoolValueConfigurationPredicate predicateWithValue:](IMBoolValueConfigurationPredicate, "predicateWithValue:", 1));
  objc_msgSend(v2, "setDebugIdentifier:", CFSTR("DEFAULT"));
  return v2;
}

- (IMConfigurationPredicate)init
{
  IMConfigurationPredicate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMConfigurationPredicate;
  result = -[IMConfigurationPredicate init](&v3, "init");
  if (result)
    result->_score = 1;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfigurationPredicate debugIdentifier](self, "debugIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  return v3;
}

- (BOOL)evaluateWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = BCIMLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[IMConfigurationPredicate evaluateWithContext:]";
    v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/Configuration/IMConfi"
          "gurationPredicate.m";
    v12 = 1024;
    v13 = 290;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v8, 0x1Cu);
  }

  v5 = BCIMLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"This is an abstract method\", (uint8_t *)&v8, 2u);
  }

  return 0;
}

- (int64_t)score
{
  return self->_score;
}

- (void)setScore:(int64_t)a3
{
  self->_score = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_debugIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

+ (id)readingModePagedPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bk_traitCollectionWithReadingMode:](UITraitCollection, "bk_traitCollectionWithReadingMode:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));
  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Reading Mode Paged"));

  return v3;
}

+ (id)readingModeVerticalScrollPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bk_traitCollectionWithReadingMode:](UITraitCollection, "bk_traitCollectionWithReadingMode:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));
  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Reading Mode Vertical Scroll"));

  return v3;
}

+ (id)readingModeHorizontalScrollPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bk_traitCollectionWithReadingMode:](UITraitCollection, "bk_traitCollectionWithReadingMode:", 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate predicateWithTraitCollection:](IMConfigurationPredicate, "predicateWithTraitCollection:", v2));
  objc_msgSend(v3, "setDebugIdentifier:", CFSTR("Reading Mode Horizontal Scroll"));

  return v3;
}

@end
