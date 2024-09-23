@implementation OS_dnssd_object

- (id)redactedDescription
{
  OS_dnssd_object *isa;
  uint64_t (*v3)(void);
  const char *v4;
  char *v5;
  __CFString *v6;

  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa)
      break;
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0x8000100u);
        free(v5);
        return v6;
      }
      break;
    }
  }
  v6 = 0;
  return v6;
}

- (void)dealloc
{
  Class i;
  void (*v4)(OS_dnssd_object *, SEL);
  objc_super v5;

  for (i = self[2].super.super.isa; i; i = *(Class *)i)
  {
    v4 = (void (*)(OS_dnssd_object *, SEL))*((_QWORD *)i + 3);
    if (v4)
      v4(self, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_dnssd_object;
  -[OS_dnssd_object dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  OS_dnssd_object *isa;
  uint64_t (*v3)(void);
  const char *v4;
  char *v5;
  __CFString *v6;

  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa)
      break;
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0x8000100u);
        free(v5);
        return (NSString *)v6;
      }
      break;
    }
  }
  v6 = 0;
  return (NSString *)v6;
}

- (NSString)debugDescription
{
  OS_dnssd_object *isa;
  uint64_t (*v3)(void);
  const char *v4;
  char *v5;
  __CFString *v6;

  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa)
      break;
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0x8000100u);
        free(v5);
        return (NSString *)v6;
      }
      break;
    }
  }
  v6 = 0;
  return (NSString *)v6;
}

@end
