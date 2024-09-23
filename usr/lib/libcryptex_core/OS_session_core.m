@implementation OS_session_core

- (void)dealloc
{
  objc_super v3;

  _session_core_dealloc(self);
  v3.receiver = self;
  v3.super_class = (Class)OS_session_core;
  -[OS_session_core dealloc](&v3, sel_dealloc);
}

@end
