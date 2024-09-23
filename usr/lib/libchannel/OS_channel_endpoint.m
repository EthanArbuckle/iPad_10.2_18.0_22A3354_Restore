@implementation OS_channel_endpoint

- (void)dealloc
{
  objc_super v3;

  channel_endpoint_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_endpoint;
  -[OS_channel_endpoint dealloc](&v3, sel_dealloc);
}

@end
