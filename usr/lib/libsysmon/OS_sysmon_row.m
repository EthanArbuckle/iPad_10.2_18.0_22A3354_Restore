@implementation OS_sysmon_row

- (void)dealloc
{
  objc_super v3;

  xpc_release(self[2].super.super.super.isa);
  xpc_release(self[3].super.super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_sysmon_row;
  -[OS_sysmon_row dealloc](&v3, sel_dealloc);
}

@end
