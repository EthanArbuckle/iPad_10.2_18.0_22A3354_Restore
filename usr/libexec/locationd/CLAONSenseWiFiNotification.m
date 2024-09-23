@implementation CLAONSenseWiFiNotification

- (CLAONSenseWiFiNotification)init
{
  CLAONSenseWiFiNotification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAONSenseWiFiNotification;
  result = -[CLAONSenseWiFiNotification init](&v3, "init");
  result->type = 12;
  result->data = 0;
  return result;
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (void)data
{
  return self->data;
}

- (void)setData:(void *)a3
{
  self->data = a3;
}

@end
