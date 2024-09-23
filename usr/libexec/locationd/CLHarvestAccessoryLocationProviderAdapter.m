@implementation CLHarvestAccessoryLocationProviderAdapter

- (CLHarvestAccessoryLocationProviderAdapter)initWithMonitorGpsExternal:(void *)a3
{
  CLHarvestAccessoryLocationProviderAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLHarvestAccessoryLocationProviderAdapter;
  result = -[CLHarvestAccessoryLocationProviderAdapter init](&v5, "init");
  if (result)
  {
    result->_monitorGpsExternal = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)accessoryDidConnect:(id)a3
{
  (*(void (**)(void *, id))(*(_QWORD *)self->_monitorGpsExternal + 64))(self->_monitorGpsExternal, a3);
}

- (void)accessoryDidDisconnect:(id)a3
{
  (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_monitorGpsExternal + 64))(self->_monitorGpsExternal, 0);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
