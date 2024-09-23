@implementation SASpeakablePhrase

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SpeakablePhrase");
}

+ (id)speakablePhrase
{
  return objc_alloc_init((Class)a1);
}

- (NSString)phrase
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phrase"));
}

- (void)setPhrase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phrase"), a3);
}

- (NSString)pronunciation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pronunciation"));
}

- (void)setPronunciation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pronunciation"), a3);
}

@end
