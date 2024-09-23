@implementation SAGuidanceGuideSection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("GuideSection");
}

+ (id)guideSection
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)guideUtterances
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("guideUtterances"));
}

- (void)setGuideUtterances:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("guideUtterances"), a3);
}

- (NSString)sectionName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sectionName"));
}

- (void)setSectionName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sectionName"), a3);
}

@end
