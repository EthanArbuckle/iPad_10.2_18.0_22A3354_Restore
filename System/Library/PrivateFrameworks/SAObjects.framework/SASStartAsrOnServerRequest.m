@implementation SASStartAsrOnServerRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartAsrOnServerRequest");
}

- (NSNumber)runCamFtm
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("runCamFtm"));
}

- (void)setRunCamFtm:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("runCamFtm"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
