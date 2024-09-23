@implementation SAMovieShowtime

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("Showtime");
}

+ (id)showtime
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)buyTicketsPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("buyTicketsPunchout"));
}

- (void)setBuyTicketsPunchout:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("buyTicketsPunchout"), a3);
}

- (NSNumber)childTicketQuantity
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("childTicketQuantity"));
}

- (void)setChildTicketQuantity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("childTicketQuantity"), a3);
}

- (BOOL)is3d
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("is3d"));
}

- (void)setIs3d:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("is3d"), a3);
}

- (BOOL)isImax
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isImax"));
}

- (void)setIsImax:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isImax"), a3);
}

- (NSNumber)regularTicketQuantity
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("regularTicketQuantity"));
}

- (void)setRegularTicketQuantity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("regularTicketQuantity"), a3);
}

- (NSNumber)seniorTicketQuantity
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seniorTicketQuantity"));
}

- (void)setSeniorTicketQuantity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seniorTicketQuantity"), a3);
}

- (SACalendar)showtime
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("showtime"));
}

- (void)setShowtime:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("showtime"), a3);
}

@end
