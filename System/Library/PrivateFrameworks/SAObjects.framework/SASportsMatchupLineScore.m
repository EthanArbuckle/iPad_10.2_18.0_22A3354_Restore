@implementation SASportsMatchupLineScore

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("MatchupLineScore");
}

+ (id)matchupLineScore
{
  return objc_alloc_init((Class)a1);
}

- (NSString)period
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("period"));
}

- (void)setPeriod:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("period"), a3);
}

- (NSString)score
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("score"));
}

- (void)setScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("score"), a3);
}

@end
