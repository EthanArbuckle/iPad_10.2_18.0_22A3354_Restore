@implementation SAGKSummaryPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("SummaryPod");
}

+ (id)summaryPod
{
  return objc_alloc_init((Class)a1);
}

- (NSString)caption
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("caption"));
}

- (void)setCaption:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("caption"), a3);
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
