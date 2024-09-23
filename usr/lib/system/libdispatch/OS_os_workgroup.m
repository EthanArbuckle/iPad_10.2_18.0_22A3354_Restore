@implementation OS_os_workgroup

- (OS_os_workgroup)init
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

  j___os_workgroup_xref_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_os_workgroup;
  -[OS_object _xref_dispose](&v9, sel__xref_dispose);
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

  j___os_workgroup_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_os_workgroup;
  -[OS_os_workgroup dealloc](&v9, sel_dealloc);
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
    j___os_workgroup_debug((uint64_t)self, (uint64_t)v10, 2048, v4, v5, v6, v7, v8);
    return (id)objc_msgSend(v9, "stringWithUTF8String:", v10);
  }
  return result;
}

@end
