@implementation OS_channel_rt

- (void)dealloc
{
  objc_super v3;

  channel_rt_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_rt;
  -[OS_channel dealloc](&v3, sel_dealloc);
}

@end
