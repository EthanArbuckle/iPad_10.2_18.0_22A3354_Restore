@implementation SARestaurantOpening

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.restaurant");
}

- (id)encodedClassName
{
  return CFSTR("Opening");
}

+ (id)opening
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)bookingId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("bookingId"));
}

- (void)setBookingId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("bookingId"), a3);
}

- (SAUIAppPunchOut)makeReservationPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("makeReservationPunchOut"));
}

- (void)setMakeReservationPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("makeReservationPunchOut"), a3);
}

- (NSNumber)partySize
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("partySize"));
}

- (void)setPartySize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("partySize"), a3);
}

- (SACalendar)timeSlot
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("timeSlot"));
}

- (void)setTimeSlot:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("timeSlot"), a3);
}

@end
