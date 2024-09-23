@implementation TMLDisposeBlock

- (TMLDisposeBlock)initWithBlock:(id)a3
{
  id v4;
  TMLDisposeBlock *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLDisposeBlock;
  v5 = -[TMLDisposeBlock init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x22E2E7E44](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)tmlDispose
{
  void (**block)(id, SEL);

  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    block = (void (**)(id, SEL))self->_block;
  }
  self->_block = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
