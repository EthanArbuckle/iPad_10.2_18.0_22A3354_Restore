@implementation OS_voucher

- (OS_voucher)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
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
    -[OS_voucher retain].cold.1();
  return self;
}

- (void)release
{
  qword_61228 = (uint64_t)"API MISUSE: Voucher over-release";
  __break(1u);
}

- (void)dealloc
{
  objc_super v3;

  _voucher_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_voucher;
  -[OS_voucher dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  id result;
  id v4;
  char __str[2048];

  result = objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    _voucher_debug((uint64_t)self, __str, 0x800uLL);
    result = objc_msgSend(v4, "stringWithUTF8String:", "<%s: %s>");
    if (result)
      return objc_msgSend(v4, "stringWithFormat:", result, object_getClassName(self), __str);
  }
  return result;
}

- (void)retain
{
  qword_61228 = (uint64_t)"API MISUSE: Voucher resurrection";
  __break(1u);
}

@end
