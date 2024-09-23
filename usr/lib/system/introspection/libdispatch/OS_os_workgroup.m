@implementation OS_os_workgroup

- (OS_os_workgroup)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  objc_super v3;

  _os_workgroup_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup;
  -[OS_object _xref_dispose](&v3, "_xref_dispose");
}

- (void)dealloc
{
  objc_super v3;

  _os_workgroup_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup;
  -[OS_os_workgroup dealloc](&v3, "dealloc");
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
    _os_workgroup_debug((uint64_t)self, __str, 0x800uLL);
    return objc_msgSend(v4, "stringWithUTF8String:", __str);
  }
  return result;
}

@end
