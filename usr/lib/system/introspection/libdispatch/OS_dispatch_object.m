@implementation OS_dispatch_object

- (OS_dispatch_object)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  id result;
  id v4;
  void (*v5)(OS_dispatch_object *, _BYTE *, uint64_t);
  const char *ClassName;
  _BYTE v7[2048];

  result = objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5 = (void (*)(OS_dispatch_object *, _BYTE *, uint64_t))*((_QWORD *)self->super.super.isa + 7);
    if (v5)
    {
      v5(self, v7, 2048);
    }
    else
    {
      ClassName = object_getClassName(self);
      __strlcpy_chk(v7, ClassName, 2048, 2048);
    }
    result = objc_msgSend(v4, "stringWithUTF8String:", "<%s: %s>");
    if (result)
      return objc_msgSend(v4, "stringWithFormat:", result, object_getClassName(self), v7);
  }
  return result;
}

@end
