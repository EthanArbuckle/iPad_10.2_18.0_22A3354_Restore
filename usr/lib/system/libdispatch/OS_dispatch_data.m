@implementation OS_dispatch_data

+ (id)allocWithZone:(_NSZone *)a3
{
  return _dispatch_objc_alloc((objc_class *)a1, 64);
}

- (OS_dispatch_data)init
{
  return -[OS_dispatch_data initWithBytes:length:copy:freeWhenDone:bytesAreVM:](self, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", 0, 0, 0, 0, 0);
}

- (OS_dispatch_data)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  uint64_t v7;
  uint64_t v10;
  const dispatch_block_t *v11;

  if (a5)
  {
    v10 = 0;
  }
  else
  {
    if (a6)
    {
      if (a7)
        v11 = &_dispatch_data_destructor_vm_deallocate;
      else
        v11 = &_dispatch_data_destructor_free;
    }
    else
    {
      v11 = (const dispatch_block_t *)&_dispatch_data_destructor_none;
    }
    v10 = (uint64_t)*v11;
  }
  j___dispatch_data_init_with_bytes((uint64_t)self, (uint64_t)a3, a4, v10, a5, a6, a7, v7);
  return self;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (__cdecl *v9)(void *);
  Class isa;
  NSObject *global_queue_0;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  objc_super v20;

  j___dispatch_data_dispose((uint64_t)self, 0, v2, v3, v4, v5, v6, v7);
  isa = self[2].super.isa;
  v9 = (void (__cdecl *)(void *))self[3].super.isa;
  global_queue_0 = self[1].super.isa;
  v20.receiver = self;
  v20.super_class = (Class)OS_dispatch_data;
  -[OS_dispatch_data dealloc](&v20, sel_dealloc);
  if (v9)
    v19 = isa == 0;
  else
    v19 = 1;
  if (!v19)
  {
    if (!global_queue_0)
      global_queue_0 = dispatch_get_global_queue_0(0, 0);
    dispatch_async_f(global_queue_0, isa, v9);
  }
  if (global_queue_0)
    _os_object_release_internal_0((uint64_t)global_queue_0, v12, v13, v14, v15, v16, v17, v18);
}

- (BOOL)_bytesAreVM
{
  return self[5].super.isa == (Class)&__block_literal_global_30;
}

- (void)_setContext:(void *)a3
{
  self[2].super.isa = (Class)a3;
}

- (void)_getContext
{
  return self[2].super.isa;
}

- (void)_setFinalizer:(void *)a3
{
  self[3].super.isa = (Class)a3;
}

- (void)_setTargetQueue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  j___dispatch_data_set_target_queue((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (NSString)debugDescription
{
  NSString *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;

  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    -[OS_dispatch_data debugDescription].cold.1(self, result, (uint64_t *)&v9, v4, v5, v6, v7, v8);
    return v9;
  }
  return result;
}

- (unint64_t)length
{
  return (unint64_t)self[6].super.isa;
}

- (BOOL)_isCompact
{
  Class isa;
  Class v3;
  char *v4;
  OS_dispatch_data *v6;
  Class v7;

  if (self[6].super.isa)
  {
    isa = self[7].super.isa;
    if (isa == (Class)1)
    {
      v6 = self + 8;
      self = (OS_dispatch_data *)self[8].super.isa;
      v3 = v6[1].super.isa;
      if (!self[7].super.isa)
        goto LABEL_4;
    }
    else
    {
      v3 = 0;
      if (!isa)
      {
LABEL_4:
        v4 = (char *)self[4].super.isa + (unint64_t)v3;
        return v4 != 0;
      }
    }
    v7 = self[4].super.isa;
    v4 = (char *)v3 + (_QWORD)v7;
    if (!v7)
      v4 = 0;
    return v4 != 0;
  }
  return 1;
}

- (uint64_t)debugDescription
{
  uint64_t result;
  _BYTE v12[2048];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  j___dispatch_data_debug((uint64_t)a1, (uint64_t)v12, 2048, a4, a5, a6, a7, a8);
  result = objc_msgSend(a2, "stringWithUTF8String:", "<%s: %s>");
  if (result)
    result = objc_msgSend(a2, "stringWithFormat:", result, object_getClassName(a1), v12);
  *a3 = result;
  return result;
}

@end
