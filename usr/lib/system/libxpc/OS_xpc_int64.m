@implementation OS_xpc_int64

- (OS_xpc_int64)retain
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
    return (OS_xpc_int64 *)_os_object_retain();
  return self;
}

- (void)release
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
    _os_object_release_without_xref_dispose();
}

- (BOOL)retainWeakReference
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (((unint64_t)self & 0x8000000000000000) != 0)
    return 1;
  v6 = v2;
  v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return -[OS_object retainWeakReference](&v5, sel_retainWeakReference);
}

- (BOOL)allowsWeakReference
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (((unint64_t)self & 0x8000000000000000) != 0)
    return 1;
  v6 = v2;
  v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return -[OS_object allowsWeakReference](&v5, sel_allowsWeakReference);
}

- (unint64_t)retainCount
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (((unint64_t)self & 0x8000000000000000) != 0)
    return -1;
  v6 = v2;
  v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return -[OS_object retainCount](&v5, sel_retainCount);
}

@end
