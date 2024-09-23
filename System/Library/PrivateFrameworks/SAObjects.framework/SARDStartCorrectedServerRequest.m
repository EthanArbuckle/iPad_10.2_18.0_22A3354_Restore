@implementation SARDStartCorrectedServerRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("StartCorrectedServerRequest");
}

- (NSString)interactionIdToBeCorrected
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionIdToBeCorrected"));
}

- (void)setInteractionIdToBeCorrected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionIdToBeCorrected"), a3);
}

- (NSString)utteranceToBeCorrected
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utteranceToBeCorrected"));
}

- (void)setUtteranceToBeCorrected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utteranceToBeCorrected"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
