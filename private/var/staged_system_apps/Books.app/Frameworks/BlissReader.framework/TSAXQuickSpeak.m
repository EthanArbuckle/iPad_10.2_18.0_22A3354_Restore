@implementation TSAXQuickSpeak

+ (id)tsaxTargetClassName
{
  return CFSTR("AXQuickSpeak");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isSpeaking
{
  objc_super v4;

  if (-[TSAccessibility shouldFakeQuickSpeakAlwaysSpeaking](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "shouldFakeQuickSpeakAlwaysSpeaking"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSAXQuickSpeak;
  return -[TSAXQuickSpeak isSpeaking](&v4, "isSpeaking");
}

@end
