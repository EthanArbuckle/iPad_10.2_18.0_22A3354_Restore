@implementation WFLinkRecordingEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Recording"), CFSTR("Recording"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Recordings (plural)"), CFSTR("Recordings"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Recordings"));
}

@end
