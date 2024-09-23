@implementation OS_dispatch_object

- (OS_dispatch_object)init
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  id result;
  id v4;
  void (*v5)(OS_dispatch_object *, _BYTE *, uint64_t);
  _BYTE v6[2048];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  result = objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5 = (void (*)(OS_dispatch_object *, _BYTE *, uint64_t))*((_QWORD *)self->super.super.isa + 7);
    if (v5)
    {
      v5(self, v6, 2048);
    }
    else
    {
      object_getClassName(self);
      __strlcpy_chk();
    }
    result = (id)objc_msgSend(v4, "stringWithUTF8String:", "<%s: %s>");
    if (result)
      return (id)objc_msgSend(v4, "stringWithFormat:", result, object_getClassName(self), v6);
  }
  return result;
}

@end
