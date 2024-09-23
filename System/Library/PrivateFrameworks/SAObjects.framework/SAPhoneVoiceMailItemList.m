@implementation SAPhoneVoiceMailItemList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("VoiceMailItemList");
}

+ (id)voiceMailItemList
{
  return objc_alloc_init((Class)a1);
}

@end
