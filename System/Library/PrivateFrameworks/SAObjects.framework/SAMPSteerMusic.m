@implementation SAMPSteerMusic

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SteerMusic");
}

+ (id)steerMusic
{
  return objc_alloc_init((Class)a1);
}

- (SAMPCollection)currentListeningToCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentListeningToCollection"));
}

- (void)setCurrentListeningToCollection:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentListeningToCollection"), a3);
}

- (SAMPMediaItem)currentListeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentListeningToItem"));
}

- (void)setCurrentListeningToItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentListeningToItem"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (NSString)steerableBlob
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("steerableBlob"));
}

- (void)setSteerableBlob:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("steerableBlob"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
