@implementation OS_session

- (void)dealloc
{
  objc_super v3;

  _session_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_session;
  -[OS_session dealloc](&v3, sel_dealloc);
}

@end
