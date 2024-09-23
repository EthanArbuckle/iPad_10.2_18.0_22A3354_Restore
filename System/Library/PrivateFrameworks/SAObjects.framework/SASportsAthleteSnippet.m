@implementation SASportsAthleteSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("AthleteSnippet");
}

+ (id)athleteSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)athletes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("athletes"), v3);
}

- (void)setAthletes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("athletes"), (uint64_t)a3);
}

@end
