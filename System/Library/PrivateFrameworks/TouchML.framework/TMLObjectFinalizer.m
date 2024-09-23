@implementation TMLObjectFinalizer

- (TMLObjectFinalizer)initWithBlock:(id)a3
{
  id v4;
  TMLObjectFinalizer *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLObjectFinalizer;
  v5 = -[TMLObjectFinalizer init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x22E2E7E44](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  void (**block)(id, SEL);
  objc_super v4;

  block = (void (**)(id, SEL))self->_block;
  if (block)
    block[2](block, a2);
  v4.receiver = self;
  v4.super_class = (Class)TMLObjectFinalizer;
  -[TMLObjectFinalizer dealloc](&v4, sel_dealloc);
}

+ (void)runBlock:(id)a3 onFinalize:(id)a4
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  double v9;
  TMLObjectFinalizer *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  id object;

  object = a4;
  v5 = a3;
  objc_getAssociatedObject(object, &unk_22AD839C4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v6 = (void *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(object, &unk_22AD839C4, v6, (void *)1);
  }
  v10 = [TMLObjectFinalizer alloc];
  v13 = (void *)objc_msgSend_initWithBlock_(v10, v11, v12, v5);

  objc_msgSend_addObject_(v6, v14, v15, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
