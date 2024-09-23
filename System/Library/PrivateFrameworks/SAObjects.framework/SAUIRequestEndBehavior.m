@implementation SAUIRequestEndBehavior

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("RequestEndBehavior");
}

- (NSNumber)minimumAutoDismissalTimeInMs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minimumAutoDismissalTimeInMs"));
}

- (void)setMinimumAutoDismissalTimeInMs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minimumAutoDismissalTimeInMs"), a3);
}

- (BOOL)premptivelyResumeMedia
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("premptivelyResumeMedia"));
}

- (void)setPremptivelyResumeMedia:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("premptivelyResumeMedia"), a3);
}

@end
