@implementation __SwiftNativeNSStringBase

- (__SwiftNativeNSStringBase)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__SwiftNativeNSStringBase;
  return -[__SwiftNativeNSStringBase init](&v4, sel_init, a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (__SwiftNativeNSStringBase)retain
{
  uint64_t v2;
  char *v3;

  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  return self;
}

- (BOOL)_tryRetain
{
  const char *v2;
  char *v3;

  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (BOOL)allowsWeakReference
{
  return swift_isDeallocating((uint64_t)self) ^ 1;
}

- (BOOL)retainWeakReference
{
  const char *v2;
  char *v3;

  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (void)_setWeaklyReferenced
{
  Class isa;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    v3 = (unint64_t *)&self[1];
    v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3))
            return;
        }
        else
        {
          __clrex();
        }
        v4 = v5;
      }
    }
    if (__stxr((unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, v3))
      goto LABEL_10;
  }
}

- (void)_noteAssociatedObjects
{
  Class isa;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    v3 = (unint64_t *)&self[1];
    v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3))
            return;
        }
        else
        {
          __clrex();
        }
        v4 = v5;
      }
    }
    if (__stxr((unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, v3))
      goto LABEL_10;
  }
}

@end
