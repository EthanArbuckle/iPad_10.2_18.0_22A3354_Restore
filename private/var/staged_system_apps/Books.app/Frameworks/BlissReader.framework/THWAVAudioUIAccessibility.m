@implementation THWAVAudioUIAccessibility

- (void)thaxConfigureHiddenAudioPlayButton
{
  id v2;

  v2 = -[THWAVAudioUIAccessibility _thaxHiddenPlayButton](self, "_thaxHiddenPlayButton");
  objc_msgSend(v2, "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.description")));
  objc_msgSend(v2, "setAccessibilityTraits:", UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton);
}

- (id)_thaxHiddenPlayButton
{
  return -[THWAVAudioUIAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("hiddenPlayButton"));
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAVAudioUI");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THWAVTransportUIAccessibility, a2);
}

- (void)layout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUIAccessibility;
  -[THWAVTransportUIAccessibility layout](&v3, "layout");
  if (-[THWAVAudioUIAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxConfigureAudioPlayButton", &OBJC_PROTOCOL___THWAVAudioUIAccessibilityExtras))-[THWAVAudioUIAccessibility thaxConfigureAudioPlayButton](self, "thaxConfigureAudioPlayButton");
  if (-[THWAVAudioUIAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxConfigureHiddenAudioPlayButton", &OBJC_PROTOCOL___THWAVAudioUIAccessibilityExtras))-[THWAVAudioUIAccessibility thaxConfigureHiddenAudioPlayButton](self, "thaxConfigureHiddenAudioPlayButton");
}

@end
