@implementation RTLearnedLocationManagerNotificationDidUpdate

- (RTLearnedLocationManagerNotificationDidUpdate)initWithIntervalSinceLastUpdate:(double)a3
{
  RTLearnedLocationManagerNotificationDidUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTLearnedLocationManagerNotificationDidUpdate;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_intervalSinceLastUpdate = a3;
  return result;
}

- (id)description
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedLocationManagerNotificationDidUpdate intervalSinceLastUpdate](self, "intervalSinceLastUpdate");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("intervalSinceLastUpdate, %.2f"), v3);
}

- (double)intervalSinceLastUpdate
{
  return self->_intervalSinceLastUpdate;
}

- (void)setIntervalSinceLastUpdate:(double)a3
{
  self->_intervalSinceLastUpdate = a3;
}

@end
