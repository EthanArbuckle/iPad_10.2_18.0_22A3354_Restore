@implementation CRLAXQuickSpeak

+ (id)crlaxTargetClassName
{
  return CFSTR("AXQuickSpeak");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (BOOL)isSpeaking
{
  objc_super v4;

  if (-[CRLAccessibility shouldFakeQuickSpeakAlwaysSpeaking](+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"), "shouldFakeQuickSpeakAlwaysSpeaking"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLAXQuickSpeak;
  return -[CRLAXQuickSpeak isSpeaking](&v4, "isSpeaking");
}

@end
