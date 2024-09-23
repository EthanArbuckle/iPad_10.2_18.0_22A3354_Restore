@implementation PXLemonadeOneUpSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  uint64_t v5;

  static SettingsUIProvider.Module(_:sections:)(0x6564616E6F6D654CLL, 0xEE007055656E4F20, (uint64_t (*)(uint64_t))sub_1A710C0CC, &v5);
  SettingsUIModule.prototypeToolsModule.getter();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)parentSettings
{
  return +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
}

- (int64_t)version
{
  return 1;
}

- (void)setDefaultValues
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXLemonadeOneUpSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  if ((PLIsPhotosAppAnyPlatform() & 1) != 0 || (PLIsCamera() & 1) != 0)
    v3 = 1;
  else
    v3 = PLIsPreferences();
  -[PXLemonadeOneUpSettings setInternal_isOneUpRefreshEnabled:](self, "setInternal_isOneUpRefreshEnabled:", v3);
  -[PXLemonadeOneUpSettings setRequireLemonadeEnabled:](self, "setRequireLemonadeEnabled:", 1);
  -[PXLemonadeOneUpSettings setChromeLibraryScrubberEnabled:](self, "setChromeLibraryScrubberEnabled:", 1);
  -[PXLemonadeOneUpSettings setChromeLibraryScrubberHiddenWhileZoomed:](self, "setChromeLibraryScrubberHiddenWhileZoomed:", 1);
  -[PXLemonadeOneUpSettings setChromeEDRBoostBehavior:](self, "setChromeEDRBoostBehavior:", 3);
  -[PXLemonadeOneUpSettings setChromeButtonsEDRBoost:](self, "setChromeButtonsEDRBoost:", 2.0);
  -[PXLemonadeOneUpSettings setChromeTitleEDRBoost:](self, "setChromeTitleEDRBoost:", 3.0);
  -[PXLemonadeOneUpSettings setChromeShadowsOverContent:](self, "setChromeShadowsOverContent:", 0);
  -[PXLemonadeOneUpSettings setChromeShadowOpacity:](self, "setChromeShadowOpacity:", 0.5);
  -[PXLemonadeOneUpSettings setChromeButtonShadowRadius:](self, "setChromeButtonShadowRadius:", 30.0);
  -[PXLemonadeOneUpSettings setChromeTextShadowRadius:](self, "setChromeTextShadowRadius:", 10.0);
  -[PXLemonadeOneUpSettings setEnableChromeDebugHorizontalCenterGuides:](self, "setEnableChromeDebugHorizontalCenterGuides:", 0);
  -[PXLemonadeOneUpSettings setChromeDebugHorizontalCenterRadius:](self, "setChromeDebugHorizontalCenterRadius:", 60.0);
  -[PXLemonadeOneUpSettings setMinimumDurationForVideoLooping:](self, "setMinimumDurationForVideoLooping:", 1.0);
  -[PXLemonadeOneUpSettings setMinimumMarginForInsetContent:](self, "setMinimumMarginForInsetContent:", 12.0);
  -[PXLemonadeOneUpSettings setInsetContentCornerRadius:](self, "setInsetContentCornerRadius:", 5.0);
  -[PXLemonadeOneUpSettings setInsetContentBorderWidth:](self, "setInsetContentBorderWidth:", 1.0);
  -[PXLemonadeOneUpSettings setInsetContentBorderOpacityDarkMode:](self, "setInsetContentBorderOpacityDarkMode:", 0.1);
  -[PXLemonadeOneUpSettings setInsetContentBorderOpacityLightMode:](self, "setInsetContentBorderOpacityLightMode:", 0.05);
  -[PXLemonadeOneUpSettings setInsetAllContent:](self, "setInsetAllContent:", 0);
  -[PXLemonadeOneUpSettings setDebugBarKindRawValue:](self, "setDebugBarKindRawValue:", 0x7FFFFFFFFFFFFFFFLL);
  -[PXLemonadeOneUpSettings setEnableLegibilityBlur:](self, "setEnableLegibilityBlur:", 1);
  -[PXLemonadeOneUpSettings setLegibilityBlurCurve:](self, "setLegibilityBlurCurve:", 4);
  -[PXLemonadeOneUpSettings setLegibilityBlurRadius:](self, "setLegibilityBlurRadius:", 5.0);
  -[PXLemonadeOneUpSettings setLegibilityBlurDistanceToBaseline:](self, "setLegibilityBlurDistanceToBaseline:", 20.0);
  -[PXLemonadeOneUpSettings setLegibilityTintCurve:](self, "setLegibilityTintCurve:", 4);
  -[PXLemonadeOneUpSettings setLegibilityTintDistanceToBaseline:](self, "setLegibilityTintDistanceToBaseline:", 20.0);
  -[PXLemonadeOneUpSettings setLegibilityTintOpacity:](self, "setLegibilityTintOpacity:", 0.75);
  -[PXLemonadeOneUpSettings setDismissalFractionForHidingChrome:](self, "setDismissalFractionForHidingChrome:", 0.05);
  -[PXLemonadeOneUpSettings setMinimumVideoScrubberWidth:](self, "setMinimumVideoScrubberWidth:", 200.0);
  -[PXLemonadeOneUpSettings setShowPlaybackRateButton:](self, "setShowPlaybackRateButton:", 0);
  -[PXLemonadeOneUpSettings setShowAudioMixButton:](self, "setShowAudioMixButton:", 0);
  -[PXLemonadeOneUpSettings setLoopAllVideos:](self, "setLoopAllVideos:", 1);
  -[PXLemonadeOneUpSettings setEnableSideCommentsInLandscape:](self, "setEnableSideCommentsInLandscape:", 1);
  -[PXLemonadeOneUpSettings setShowChromeSafeAreaBox:](self, "setShowChromeSafeAreaBox:", 0);
  -[PXLemonadeOneUpSettings setDoubleTapFillsScreen:](self, "setDoubleTapFillsScreen:", 1);
}

- (BOOL)requireLemonadeEnabled
{
  return self->_requireLemonadeEnabled;
}

- (void)setRequireLemonadeEnabled:(BOOL)a3
{
  self->_requireLemonadeEnabled = a3;
}

- (BOOL)chromeLibraryScrubberEnabled
{
  return self->_chromeLibraryScrubberEnabled;
}

- (void)setChromeLibraryScrubberEnabled:(BOOL)a3
{
  self->_chromeLibraryScrubberEnabled = a3;
}

- (BOOL)chromeLibraryScrubberHiddenWhileZoomed
{
  return self->_chromeLibraryScrubberHiddenWhileZoomed;
}

- (void)setChromeLibraryScrubberHiddenWhileZoomed:(BOOL)a3
{
  self->_chromeLibraryScrubberHiddenWhileZoomed = a3;
}

- (int64_t)chromeEDRBoostBehavior
{
  return self->_chromeEDRBoostBehavior;
}

- (void)setChromeEDRBoostBehavior:(int64_t)a3
{
  self->_chromeEDRBoostBehavior = a3;
}

- (double)chromeButtonsEDRBoost
{
  return self->_chromeButtonsEDRBoost;
}

- (void)setChromeButtonsEDRBoost:(double)a3
{
  self->_chromeButtonsEDRBoost = a3;
}

- (double)chromeTitleEDRBoost
{
  return self->_chromeTitleEDRBoost;
}

- (void)setChromeTitleEDRBoost:(double)a3
{
  self->_chromeTitleEDRBoost = a3;
}

- (BOOL)chromeShadowsOverContent
{
  return self->_chromeShadowsOverContent;
}

- (void)setChromeShadowsOverContent:(BOOL)a3
{
  self->_chromeShadowsOverContent = a3;
}

- (double)chromeShadowOpacity
{
  return self->_chromeShadowOpacity;
}

- (void)setChromeShadowOpacity:(double)a3
{
  self->_chromeShadowOpacity = a3;
}

- (double)chromeButtonShadowRadius
{
  return self->_chromeButtonShadowRadius;
}

- (void)setChromeButtonShadowRadius:(double)a3
{
  self->_chromeButtonShadowRadius = a3;
}

- (double)chromeTextShadowRadius
{
  return self->_chromeTextShadowRadius;
}

- (void)setChromeTextShadowRadius:(double)a3
{
  self->_chromeTextShadowRadius = a3;
}

- (BOOL)enableLegibilityBlur
{
  return self->_enableLegibilityBlur;
}

- (void)setEnableLegibilityBlur:(BOOL)a3
{
  self->_enableLegibilityBlur = a3;
}

- (int64_t)legibilityBlurCurve
{
  return self->_legibilityBlurCurve;
}

- (void)setLegibilityBlurCurve:(int64_t)a3
{
  self->_legibilityBlurCurve = a3;
}

- (double)legibilityBlurRadius
{
  return self->_legibilityBlurRadius;
}

- (void)setLegibilityBlurRadius:(double)a3
{
  self->_legibilityBlurRadius = a3;
}

- (double)legibilityBlurDistanceToBaseline
{
  return self->_legibilityBlurDistanceToBaseline;
}

- (void)setLegibilityBlurDistanceToBaseline:(double)a3
{
  self->_legibilityBlurDistanceToBaseline = a3;
}

- (int64_t)legibilityTintCurve
{
  return self->_legibilityTintCurve;
}

- (void)setLegibilityTintCurve:(int64_t)a3
{
  self->_legibilityTintCurve = a3;
}

- (double)legibilityTintDistanceToBaseline
{
  return self->_legibilityTintDistanceToBaseline;
}

- (void)setLegibilityTintDistanceToBaseline:(double)a3
{
  self->_legibilityTintDistanceToBaseline = a3;
}

- (double)legibilityTintOpacity
{
  return self->_legibilityTintOpacity;
}

- (void)setLegibilityTintOpacity:(double)a3
{
  self->_legibilityTintOpacity = a3;
}

- (BOOL)enableChromeDebugHorizontalCenterGuides
{
  return self->_enableChromeDebugHorizontalCenterGuides;
}

- (void)setEnableChromeDebugHorizontalCenterGuides:(BOOL)a3
{
  self->_enableChromeDebugHorizontalCenterGuides = a3;
}

- (double)chromeDebugHorizontalCenterRadius
{
  return self->_chromeDebugHorizontalCenterRadius;
}

- (void)setChromeDebugHorizontalCenterRadius:(double)a3
{
  self->_chromeDebugHorizontalCenterRadius = a3;
}

- (double)minimumMarginForInsetContent
{
  return self->_minimumMarginForInsetContent;
}

- (void)setMinimumMarginForInsetContent:(double)a3
{
  self->_minimumMarginForInsetContent = a3;
}

- (double)insetContentCornerRadius
{
  return self->_insetContentCornerRadius;
}

- (void)setInsetContentCornerRadius:(double)a3
{
  self->_insetContentCornerRadius = a3;
}

- (double)insetContentBorderWidth
{
  return self->_insetContentBorderWidth;
}

- (void)setInsetContentBorderWidth:(double)a3
{
  self->_insetContentBorderWidth = a3;
}

- (double)insetContentBorderOpacityDarkMode
{
  return self->_insetContentBorderOpacityDarkMode;
}

- (void)setInsetContentBorderOpacityDarkMode:(double)a3
{
  self->_insetContentBorderOpacityDarkMode = a3;
}

- (double)insetContentBorderOpacityLightMode
{
  return self->_insetContentBorderOpacityLightMode;
}

- (void)setInsetContentBorderOpacityLightMode:(double)a3
{
  self->_insetContentBorderOpacityLightMode = a3;
}

- (BOOL)insetAllContent
{
  return self->_insetAllContent;
}

- (void)setInsetAllContent:(BOOL)a3
{
  self->_insetAllContent = a3;
}

- (double)minimumVideoScrubberWidth
{
  return self->_minimumVideoScrubberWidth;
}

- (void)setMinimumVideoScrubberWidth:(double)a3
{
  self->_minimumVideoScrubberWidth = a3;
}

- (BOOL)showPlaybackRateButton
{
  return self->_showPlaybackRateButton;
}

- (void)setShowPlaybackRateButton:(BOOL)a3
{
  self->_showPlaybackRateButton = a3;
}

- (BOOL)showAudioMixButton
{
  return self->_showAudioMixButton;
}

- (void)setShowAudioMixButton:(BOOL)a3
{
  self->_showAudioMixButton = a3;
}

- (BOOL)loopAllVideos
{
  return self->_loopAllVideos;
}

- (void)setLoopAllVideos:(BOOL)a3
{
  self->_loopAllVideos = a3;
}

- (double)minimumDurationForVideoLooping
{
  return self->_minimumDurationForVideoLooping;
}

- (void)setMinimumDurationForVideoLooping:(double)a3
{
  self->_minimumDurationForVideoLooping = a3;
}

- (BOOL)doubleTapFillsScreen
{
  return self->_doubleTapFillsScreen;
}

- (void)setDoubleTapFillsScreen:(BOOL)a3
{
  self->_doubleTapFillsScreen = a3;
}

- (double)dismissalFractionForHidingChrome
{
  return self->_dismissalFractionForHidingChrome;
}

- (void)setDismissalFractionForHidingChrome:(double)a3
{
  self->_dismissalFractionForHidingChrome = a3;
}

- (BOOL)enableSideCommentsInLandscape
{
  return self->_enableSideCommentsInLandscape;
}

- (void)setEnableSideCommentsInLandscape:(BOOL)a3
{
  self->_enableSideCommentsInLandscape = a3;
}

- (int64_t)debugBarKindRawValue
{
  return self->_debugBarKindRawValue;
}

- (void)setDebugBarKindRawValue:(int64_t)a3
{
  self->_debugBarKindRawValue = a3;
}

- (BOOL)showChromeSafeAreaBox
{
  return self->_showChromeSafeAreaBox;
}

- (void)setShowChromeSafeAreaBox:(BOOL)a3
{
  self->_showChromeSafeAreaBox = a3;
}

- (BOOL)internal_isOneUpRefreshEnabled
{
  return self->_internal_isOneUpRefreshEnabled;
}

- (void)setInternal_isOneUpRefreshEnabled:(BOOL)a3
{
  self->_internal_isOneUpRefreshEnabled = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32709 != -1)
    dispatch_once(&sharedInstance_onceToken_32709, &__block_literal_global_32710);
  return (id)sharedInstance_sharedInstance_32711;
}

+ (BOOL)isOneUpRefreshEnabled
{
  void *v2;
  BOOL v3;
  char v4;
  void *v5;

  v3 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  if (!v3)
  {
    +[PXLemonadeOneUpSettings sharedInstance](PXLemonadeOneUpSettings, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "requireLemonadeEnabled") & 1) != 0)
    {
      v4 = 0;
LABEL_5:

      return v4;
    }
  }
  +[PXLemonadeOneUpSettings sharedInstance](PXLemonadeOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "internal_isOneUpRefreshEnabled");

  if (!v3)
    goto LABEL_5;
  return v4;
}

void __41__PXLemonadeOneUpSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneUpSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_32711;
  sharedInstance_sharedInstance_32711 = v0;

}

@end
