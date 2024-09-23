@implementation RTStoreNotificationAvailabilityDidChange

- (RTStoreNotificationAvailabilityDidChange)initWithAvailability:(unint64_t)a3
{
  RTStoreNotificationAvailabilityDidChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStoreNotificationAvailabilityDidChange;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_availability = a3;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_availability);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("available, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)availability
{
  return self->_availability;
}

@end
