@implementation SUSUIFakeSUAutoInstallOperation

- (id)forecast
{
  return objc_alloc_init(SUSUIFakeSUAutoInstallForecast);
}

- (id)id
{
  NSUUID *v2;
  NSUUID *uuid;

  if (!self->_uuid)
  {
    v2 = (NSUUID *)(id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    uuid = self->_uuid;
    self->_uuid = v2;

  }
  return self->_uuid;
}

- (BOOL)isExpired
{
  return 0;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (BOOL)isCanceled
{
  return self->_cancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
