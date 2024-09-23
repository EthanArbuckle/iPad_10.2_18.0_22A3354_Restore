@implementation SAUpdateReadingState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UpdateReadingState");
}

+ (id)updateReadingState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)items
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("items"));
}

- (void)setItems:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("items"), a3);
}

- (NSString)readingStateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("readingStateId"));
}

- (void)setReadingStateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("readingStateId"), a3);
}

- (int64_t)updatedGroupIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("updatedGroupIndex"));
}

- (void)setUpdatedGroupIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("updatedGroupIndex"), a3);
}

- (int64_t)updatedItemIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("updatedItemIndex"));
}

- (void)setUpdatedItemIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("updatedItemIndex"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
