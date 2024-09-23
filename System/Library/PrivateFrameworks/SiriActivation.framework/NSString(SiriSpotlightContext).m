@implementation NSString(SiriSpotlightContext)

+ (const)stringWithSiriSpotlightContextSource:()SiriSpotlightContext
{
  const __CFString *v3;

  v3 = CFSTR("UnknownSiriSpotlightContextSource");
  if (a3 == 1)
    v3 = CFSTR("SiriSpotlightContextSourceAskSiriButton");
  if (a3)
    return v3;
  else
    return CFSTR("SiriSpotlightContextSourceQuerySuggestion");
}

@end
