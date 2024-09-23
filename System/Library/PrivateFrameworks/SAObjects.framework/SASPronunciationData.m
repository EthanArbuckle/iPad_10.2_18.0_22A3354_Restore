@implementation SASPronunciationData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("PronunciationData");
}

+ (id)pronunciationData
{
  return objc_alloc_init((Class)a1);
}

- (NSString)apgId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("apgId"));
}

- (void)setApgId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("apgId"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)orthography
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("orthography"));
}

- (void)setOrthography:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("orthography"), a3);
}

- (int64_t)tokenOffset
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("tokenOffset"));
}

- (void)setTokenOffset:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("tokenOffset"), a3);
}

- (NSArray)ttsPronunciations
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ttsPronunciations"));
}

- (void)setTtsPronunciations:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ttsPronunciations"), a3);
}

- (NSString)ttsVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ttsVersion"));
}

- (void)setTtsVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ttsVersion"), a3);
}

@end
