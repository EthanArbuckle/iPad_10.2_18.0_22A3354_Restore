@implementation ATXProactiveSuggestionFeedbackTypes

+ (id)stringForUIFeedbackEngagementType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("abandoned");
  if (a3 == 1)
    v3 = CFSTR("dismissed");
  if (a3 == 2)
    return CFSTR("engaged");
  else
    return (id)v3;
}

@end
