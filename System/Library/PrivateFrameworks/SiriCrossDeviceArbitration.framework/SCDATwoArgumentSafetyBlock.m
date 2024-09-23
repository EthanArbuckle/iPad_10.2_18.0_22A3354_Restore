@implementation SCDATwoArgumentSafetyBlock

- (SCDATwoArgumentSafetyBlock)initWithBlock:(id)a3
{
  return -[SCDATwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:](self, "initWithBlock:defaultValue1:defaultValue2:", a3, 0, 0);
}

- (SCDATwoArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCDATwoArgumentSafetyBlock *v11;
  uint64_t v12;
  id block;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SCDATwoArgumentSafetyBlock;
  v11 = -[SCDATwoArgumentSafetyBlock init](&v15, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x249555380](v8);
    block = v11->_block;
    v11->_block = (id)v12;

    objc_storeStrong(&v11->_defaultValue1, a4);
    objc_storeStrong(&v11->_defaultValue2, a5);
  }

  return v11;
}

- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  atomic_flag *p_hasInvoked;
  unsigned __int8 v9;
  void (**block)(id, id, id);
  id v11;

  v6 = a3;
  v7 = a4;
  p_hasInvoked = &self->_hasInvoked;
  do
    v9 = __ldaxr((unsigned __int8 *)p_hasInvoked);
  while (__stlxr(1u, (unsigned __int8 *)p_hasInvoked));
  if ((v9 & 1) == 0)
  {
    block = (void (**)(id, id, id))self->_block;
    if (block)
    {
      block[2](block, v6, v7);
      v11 = self->_block;
      self->_block = 0;

    }
  }

  return (v9 & 1) == 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SCDATwoArgumentSafetyBlock invokeWithValue:andValue:](self, "invokeWithValue:andValue:", self->_defaultValue1, self->_defaultValue2);
  v3.receiver = self;
  v3.super_class = (Class)SCDATwoArgumentSafetyBlock;
  -[SCDATwoArgumentSafetyBlock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue2, 0);
  objc_storeStrong(&self->_defaultValue1, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
