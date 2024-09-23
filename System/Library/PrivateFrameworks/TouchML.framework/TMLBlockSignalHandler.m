@implementation TMLBlockSignalHandler

- (TMLBlockSignalHandler)initWithBlock:(id)a3
{
  id v4;
  TMLBlockSignalHandler *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLBlockSignalHandler;
  v5 = -[TMLBlockSignalHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x22E2E7E44](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (id)callWithArguments:(id)a3
{
  const char *v4;
  id v5;
  double v6;
  int *p_flags;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  id v15;

  v5 = a3;
  p_flags = &self->_flags;
  do
    v8 = __ldaxr((unsigned __int8 *)p_flags);
  while (__stlxr(v8 | 0x40, (unsigned __int8 *)p_flags));
  if ((v8 & 0x40) != 0)
  {
    v11 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, v6, CFSTR("Nested signal triggered '%@'"), CFSTR("<block>"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v11, v13, v14, CFSTR("TMLRuntimeException"), v12, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  (*((void (**)(void))self->_block + 2))();
  do
    v9 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v9 & 0xBF, (unsigned __int8 *)p_flags));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
