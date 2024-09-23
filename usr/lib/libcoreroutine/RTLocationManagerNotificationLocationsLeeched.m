@implementation RTLocationManagerNotificationLocationsLeeched

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leechedLocations, 0);
}

- (RTLocationManagerNotificationLocationsLeeched)initWithLocations:(id)a3
{
  id v5;
  RTLocationManagerNotificationLocationsLeeched *v6;
  RTLocationManagerNotificationLocationsLeeched *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTLocationManagerNotificationLocationsLeeched;
  v6 = -[RTNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_leechedLocations, a3);

  return v7;
}

- (NSArray)leechedLocations
{
  return self->_leechedLocations;
}

@end
