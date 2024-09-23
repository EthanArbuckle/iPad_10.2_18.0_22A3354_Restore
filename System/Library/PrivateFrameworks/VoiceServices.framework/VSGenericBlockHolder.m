@implementation VSGenericBlockHolder

- (VSGenericBlockHolder)initWithBlock:(id)a3
{
  id v4;
  VSGenericBlockHolder *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSGenericBlockHolder;
  v5 = -[VSGenericBlockHolder init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1DF0E94A4](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)invokeUpdateWithObject:(id)a3
{
  void (**block)(id, id);

  block = (void (**)(id, id))self->_block;
  if (block)
    block[2](block, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
