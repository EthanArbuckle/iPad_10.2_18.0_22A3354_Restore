@implementation NSBundle(SiriUIUtilities)

- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities
{
  return objc_msgSend(a1, "assistantUILocalizedStringForKey:value:table:", a3, 0, 0);
}

- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities table:
{
  return objc_msgSend(a1, "assistantUILocalizedStringForKey:value:table:", a3, 0, a4);
}

@end
