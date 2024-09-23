@implementation WBSCleanupHandler

- (WBSCleanupHandler)initWithBlock:(id)a3
{
  id v4;
  WBSCleanupHandler *v5;
  uint64_t v6;
  id block;
  WBSCleanupHandler *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCleanupHandler;
  v5 = -[WBSCleanupHandler init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)invalidate
{
  id block;

  block = self->_block;
  self->_block = 0;

}

- (void)dealloc
{
  void (**block)(id, SEL);
  objc_super v4;

  block = (void (**)(id, SEL))self->_block;
  if (block)
    block[2](block, a2);
  v4.receiver = self;
  v4.super_class = (Class)WBSCleanupHandler;
  -[WBSCleanupHandler dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
