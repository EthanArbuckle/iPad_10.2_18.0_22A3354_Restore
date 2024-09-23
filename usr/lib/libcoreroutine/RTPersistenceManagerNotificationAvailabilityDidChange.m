@implementation RTPersistenceManagerNotificationAvailabilityDidChange

- (RTPersistenceManagerNotificationAvailabilityDidChange)initWithAvailability:(unint64_t)a3
{
  RTPersistenceManagerNotificationAvailabilityDidChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTPersistenceManagerNotificationAvailabilityDidChange;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_availability = a3;
  return result;
}

- (id)description
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[RTPersistenceManagerNotificationAvailabilityDidChange availability](self, "availability");
  v4 = CFSTR("Unknown");
  if (v3 == 1)
    v4 = CFSTR("Unavailable");
  if (v3 == 2)
    v4 = CFSTR("Available");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("availability, %@"), v4);
}

- (unint64_t)availability
{
  return self->_availability;
}

@end
