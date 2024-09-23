@implementation OS_channel_dispatch

- (void)dealloc
{
  objc_super v3;

  channel_dispatch_dispose((id *)&self->super.super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_dispatch;
  -[OS_channel dealloc](&v3, sel_dealloc);
}

- (void)_xref_dispose
{
  objc_super v3;

  channel_dispatch_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_dispatch;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

@end
