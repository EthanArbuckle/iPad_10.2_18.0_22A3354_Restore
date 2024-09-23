@implementation OS_sysmon_table

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  xpc_release(self[2].super.super.super.isa);
  xpc_release(self[3].super.super.super.isa);
  if (self[4].super.super.super.isa)
  {
    v3 = 0;
    do
    {

      v3 = (objc_class *)((char *)v3 + 1);
    }
    while (v3 < self[4].super.super.super.isa);
  }
  free(self[5].super.super.super.isa);
  v4.receiver = self;
  v4.super_class = (Class)OS_sysmon_table;
  -[OS_sysmon_table dealloc](&v4, sel_dealloc);
}

@end
