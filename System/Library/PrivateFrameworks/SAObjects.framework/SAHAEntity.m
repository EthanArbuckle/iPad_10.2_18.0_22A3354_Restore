@implementation SAHAEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("Entity");
}

+ (id)entity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)accessory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accessory"));
}

- (void)setAccessory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accessory"), a3);
}

- (NSURL)accessoryIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("accessoryIdentifier"));
}

- (void)setAccessoryIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("accessoryIdentifier"), a3);
}

- (NSArray)attributes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributes"));
}

- (void)setAttributes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributes"), a3);
}

- (NSNumber)currentDevice
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentDevice"));
}

- (void)setCurrentDevice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentDevice"), a3);
}

- (NSString)entityType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("entityType"));
}

- (void)setEntityType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("entityType"), a3);
}

- (NSString)groupType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupType"));
}

- (void)setGroupType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupType"), a3);
}

- (NSString)hashedRouteUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUID"));
}

- (void)setHashedRouteUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUID"), a3);
}

- (NSString)home
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("home"));
}

- (void)setHome:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("home"), a3);
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("homeIdentifier"));
}

- (void)setHomeIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("homeIdentifier"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSURL)primaryServiceIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("primaryServiceIdentifier"));
}

- (void)setPrimaryServiceIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("primaryServiceIdentifier"), a3);
}

- (NSArray)relatedEntityIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("relatedEntityIdentifiers"));
}

- (void)setRelatedEntityIdentifiers:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("relatedEntityIdentifiers"), a3);
}

- (NSString)room
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("room"));
}

- (void)setRoom:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("room"), a3);
}

- (NSURL)roomIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("roomIdentifier"));
}

- (void)setRoomIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("roomIdentifier"), a3);
}

- (NSArray)sceneActions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("sceneActions"), v3);
}

- (void)setSceneActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("sceneActions"), (uint64_t)a3);
}

- (NSString)sceneType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sceneType"));
}

- (void)setSceneType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sceneType"), a3);
}

- (NSString)serviceGroup
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceGroup"));
}

- (void)setServiceGroup:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceGroup"), a3);
}

- (NSArray)serviceGroupIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("serviceGroupIdentifiers"));
}

- (void)setServiceGroupIdentifiers:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("serviceGroupIdentifiers"), a3);
}

- (NSString)serviceSubType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceSubType"));
}

- (void)setServiceSubType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceSubType"), a3);
}

- (NSString)serviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceType"));
}

- (void)setServiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceType"), a3);
}

- (NSArray)status
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSArray)targetAttributes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("targetAttributes"));
}

- (void)setTargetAttributes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("targetAttributes"), a3);
}

- (NSString)zone
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("zone"));
}

- (void)setZone:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("zone"), a3);
}

- (NSArray)zoneIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("zoneIdentifiers"));
}

- (void)setZoneIdentifiers:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("zoneIdentifiers"), a3);
}

@end
