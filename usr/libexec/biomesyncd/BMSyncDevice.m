@implementation BMSyncDevice

+ (id)currentDevice
{
  if (qword_10007BE50 != -1)
    dispatch_once(&qword_10007BE50, &stru_100069378);
  return (id)qword_10007BE48;
}

- (int64_t)platform
{
  return self->_platform;
}

@end
