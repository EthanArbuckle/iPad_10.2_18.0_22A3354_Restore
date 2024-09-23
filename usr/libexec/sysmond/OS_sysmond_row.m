@implementation OS_sysmond_row

- (void)dealloc
{
  Class isa;
  unint64_t i;
  void *v5;
  objc_super v6;

  xpc_release(self[2].super.super.super.isa);
  isa = self[3].super.super.super.isa;
  if (isa)
  {
    for (i = 0; i < (unint64_t)isa; ++i)
    {
      v5 = (void *)*((_QWORD *)self[4].super.super.super.isa + i);
      if (v5)
      {
        xpc_release(v5);
        isa = self[3].super.super.super.isa;
      }
    }
  }
  free(self[4].super.super.super.isa);
  v6.receiver = self;
  v6.super_class = (Class)OS_sysmond_row;
  -[OS_sysmond_row dealloc](&v6, "dealloc");
}

@end
