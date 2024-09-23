@implementation PKDeallocationGuard

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (BOOL)invalidate
{
  atomic_flag *p_invalidated;
  unsigned __int8 v3;
  id block;

  p_invalidated = &self->_invalidated;
  do
    v3 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v3 & 1) == 0)
  {
    block = self->_block;
    self->_block = 0;

  }
  return v3 & 1;
}

- (PKDeallocationGuard)initWithBlock:(id)a3
{
  PKDeallocationGuard *result;
  PKDeallocationGuard *v5;
  PKDeallocationGuard *v6;
  void *v7;
  id block;
  objc_super v9;

  result = (PKDeallocationGuard *)a3;
  if (result)
  {
    v5 = result;
    v9.receiver = self;
    v9.super_class = (Class)PKDeallocationGuard;
    v6 = -[PKDeallocationGuard init](&v9, sel_init);
    if (v6)
    {
      v7 = _Block_copy(v5);
      block = v6->_block;
      v6->_block = v7;

    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  atomic_flag *p_invalidated;
  unsigned __int8 v4;
  objc_super v5;

  p_invalidated = &self->_invalidated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v4 & 1) == 0)
    (*((void (**)(void))self->_block + 2))();
  v5.receiver = self;
  v5.super_class = (Class)PKDeallocationGuard;
  -[PKDeallocationGuard dealloc](&v5, sel_dealloc);
}

- (PKDeallocationGuard)init
{

  return 0;
}

@end
