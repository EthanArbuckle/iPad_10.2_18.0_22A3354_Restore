@implementation THWAVTransportUIAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAVTransportUI");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (UIButton)thaxPlayButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWAVTransportUIAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("playButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THWDetailSliderAccessibility)thaxScrubber
{
  void *v3;
  THWDetailSliderAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWDetailSliderAccessibility);
  result = (THWDetailSliderAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAVTransportUIAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrubber")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIsMoviePlaying
{
  return objc_msgSend(-[THWAVTransportUIAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("transportController")), "tsaxBoolValueForKey:", CFSTR("movieIsPlaying"));
}

- (void)play
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  -[THWAVTransportUIAccessibility play](&v3, "play");
  -[THWAVTransportUIAccessibility _thaxConfigurePlayButton](self, "_thaxConfigurePlayButton");
}

- (void)pause
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  -[THWAVTransportUIAccessibility pause](&v3, "pause");
  -[THWAVTransportUIAccessibility _thaxConfigurePlayButton](self, "_thaxConfigurePlayButton");
}

- (void)layout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUIAccessibility;
  -[THWAVTransportUIAccessibility layout](&v3, "layout");
  -[THWAVTransportUIAccessibility _thaxConfigurePlayButton](self, "_thaxConfigurePlayButton");
  if (-[THWAVTransportUIAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxConfigureViewsForConfigurationChange", &OBJC_PROTOCOL___THWAVTransportUIAccessibilityExtras))-[THWAVTransportUIAccessibility thaxConfigureViewsForConfigurationChange](self, "thaxConfigureViewsForConfigurationChange");
}

- (void)_thaxConfigurePlayButton
{
  const __CFString *v3;
  NSString *v4;

  if (-[THWAVTransportUIAccessibility thaxIsMoviePlaying](self, "thaxIsMoviePlaying"))
    v3 = CFSTR("av.pause.description");
  else
    v3 = CFSTR("av.play.description");
  v4 = THAccessibilityLocalizedString((uint64_t)v3);
  if (-[THWAVTransportUIAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxConfigurePlayButton:", &OBJC_PROTOCOL___THWAVTransportUIAccessibilityExtras))-[THWAVTransportUIAccessibility thaxConfigurePlayButton:](self, "thaxConfigurePlayButton:", v4);
}

- (void)thaxConfigureViewsForConfigurationChange
{
  -[THWDetailSliderAccessibility setAccessibilityLabel:](-[THWAVTransportUIAccessibility thaxScrubber](self, "thaxScrubber"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("av.trackposition.description")));
  if (!-[THUISliderAccessibility thaxValueHandler](-[THWAVTransportUIAccessibility thaxScrubber](self, "thaxScrubber"), "thaxValueHandler"))-[THUISliderAccessibility thaxSetValueHandler:](-[THWAVTransportUIAccessibility thaxScrubber](self, "thaxScrubber"), "thaxSetValueHandler:", &stru_43C7E8);
}

- (void)thaxConfigurePlayButton:(id)a3
{
  UIButton *v4;

  -[UIButton setAccessibilityLabel:](-[THWAVTransportUIAccessibility thaxPlayButton](self, "thaxPlayButton"), "setAccessibilityLabel:", a3);
  v4 = -[THWAVTransportUIAccessibility thaxPlayButton](self, "thaxPlayButton");
  -[UIButton setAccessibilityTraits:](v4, "setAccessibilityTraits:", UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton);
}

@end
