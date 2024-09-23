@implementation SAReplayRequestFromDMHypothesis

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ReplayRequestFromDMHypothesis");
}

- (NSData)dmHypothesis
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dmHypothesis"));
}

- (void)setDmHypothesis:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dmHypothesis"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
