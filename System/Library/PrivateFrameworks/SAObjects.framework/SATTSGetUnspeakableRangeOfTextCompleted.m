@implementation SATTSGetUnspeakableRangeOfTextCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("GetUnspeakableRangeOfTextCompleted");
}

+ (id)getUnspeakableRangeOfTextCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)results
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("results"));
}

- (void)setResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("results"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
