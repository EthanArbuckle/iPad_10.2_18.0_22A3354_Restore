@implementation TSDTextInputResponder(SXAccessibility)

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:()SXAccessibility withSender:
{
  return NSSelectorFromString(CFSTR("_accessibilitySpeak:")) == a3
      || NSSelectorFromString(CFSTR("_accessibilityPauseSpeaking:")) == a3;
}

@end
