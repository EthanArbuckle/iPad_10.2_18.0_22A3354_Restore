@implementation OS_dispatch_mach

- (OS_dispatch_mach)init
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  j___dispatch_queue_xref_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if ((WORD2(self[14].super.super.super.isa) & 0x10) != 0)
    *((_QWORD *)self[11].super.super.super.isa + 6) = 195952365;
  v9.receiver = self;
  v9.super_class = (Class)OS_dispatch_mach;
  -[OS_object _xref_dispose](&v9, sel__xref_dispose);
}

@end
