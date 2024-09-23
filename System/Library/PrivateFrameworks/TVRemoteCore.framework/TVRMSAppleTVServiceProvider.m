@implementation TVRMSAppleTVServiceProvider

- (id)searchType
{
  return CFSTR("_appletv-v2._tcp.");
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  return 2;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRMSAppleTVServiceProvider;
  return (id)-[TVRMSBonjourServiceProvider serviceTypeFromTXTDictionary:](&v4, sel_serviceTypeFromTXTDictionary_, a3) == (id)2;
}

@end
