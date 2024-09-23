@implementation OS_voucher

- (OS_voucher)init
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (OS_voucher)retain
{
  unsigned int *v2;
  int v3;

  v2 = (unsigned int *)&self[1].super.super.isa + 1;
  do
    v3 = __ldxr(v2);
  while (__stxr(v3 + 1, v2));
  if (v3 <= 0)
    dispatch_group_notify_VARIANT_mp_cold_3();
  return self;
}

- (void)release
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  int v9;

  v8 = (unsigned int *)&self[1].super.super.isa + 1;
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 - 1, v8));
  if (v9 <= 1)
  {
    if (v9 != 1)
      _dispatch_async_redirect_invoke_cold_1();
    j___voucher_xref_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  j___voucher_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_voucher;
  -[OS_voucher dealloc](&v9, sel_dealloc);
}

- (id)debugDescription
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v10[2048];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  result = objc_lookUpClass("NSString");
  if (result)
  {
    v9 = result;
    j___voucher_debug((uint64_t)self, (uint64_t)v10, 2048, v4, v5, v6, v7, v8);
    result = (id)objc_msgSend(v9, "stringWithUTF8String:", "<%s: %s>");
    if (result)
      return (id)objc_msgSend(v9, "stringWithFormat:", result, object_getClassName(self), v10);
  }
  return result;
}

@end
