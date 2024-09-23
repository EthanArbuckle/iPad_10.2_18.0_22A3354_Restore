@implementation SAVCSAddResultsToContentShelf

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("AddResultsToContentShelf");
}

+ (id)addResultsToContentShelf
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentShelfViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentShelfViewId"));
}

- (void)setContentShelfViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentShelfViewId"), a3);
}

- (NSArray)fetchMoreResultsCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("fetchMoreResultsCommands"), &unk_1EE77C568);
}

- (void)setFetchMoreResultsCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("fetchMoreResultsCommands"), (uint64_t)a3);
}

- (int64_t)pageNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("pageNumber"));
}

- (void)setPageNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("pageNumber"), a3);
}

- (NSArray)results
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("results"), v3);
}

- (void)setResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("results"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
