@implementation SARestaurantRestaurant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.restaurant");
}

- (id)encodedClassName
{
  return CFSTR("Restaurant");
}

+ (id)restaurant
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributeSet
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributeSet"));
}

- (void)setAttributeSet:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributeSet"), a3);
}

- (NSArray)makeReservationPunchOuts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("makeReservationPunchOuts"), v3);
}

- (void)setMakeReservationPunchOuts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("makeReservationPunchOuts"), (uint64_t)a3);
}

- (NSURL)menuLink
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("menuLink"));
}

- (void)setMenuLink:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("menuLink"), a3);
}

- (NSArray)openings
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("openings"), v3);
}

- (void)setOpenings:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("openings"), (uint64_t)a3);
}

- (NSArray)orderDeliveryPunchOuts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("orderDeliveryPunchOuts"), v3);
}

- (void)setOrderDeliveryPunchOuts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("orderDeliveryPunchOuts"), (uint64_t)a3);
}

@end
