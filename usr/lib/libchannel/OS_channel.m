@implementation OS_channel

- (void)dealloc
{
  objc_super v3;

  Channel::assert_recv_sane((Channel *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel;
  -[OS_channel dealloc](&v3, sel_dealloc);
}

@end
