@implementation RTLearnedLocationManagerNotificationAvailabilityDidChange

- (RTLearnedLocationManagerNotificationAvailabilityDidChange)initWithAvailability:(BOOL)a3
{
  RTLearnedLocationManagerNotificationAvailabilityDidChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTLearnedLocationManagerNotificationAvailabilityDidChange;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_available = a3;
  return result;
}

- (id)description
{
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[RTLearnedLocationManagerNotificationAvailabilityDidChange available](self, "available");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("available, %@"), v4);
}

- (BOOL)available
{
  return self->_available;
}

@end
