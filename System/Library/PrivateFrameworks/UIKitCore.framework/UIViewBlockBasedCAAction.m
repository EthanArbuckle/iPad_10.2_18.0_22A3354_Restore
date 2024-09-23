@implementation UIViewBlockBasedCAAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (UIViewBlockBasedCAAction)initWithActionBlock:(id)a3
{
  id v4;
  UIViewBlockBasedCAAction *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIViewBlockBasedCAAction;
  v5 = -[UIViewBlockBasedCAAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v9;
  id v10;
  void (**block)(id, id, id, id);
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  block = (void (**)(id, id, id, id))self->_block;
  if (!block)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 813, CFSTR("%@ must be initialized with a non-nil block"), v14);

    block = (void (**)(id, id, id, id))self->_block;
  }
  block[2](block, v15, v9, v10);

}

uint64_t __47__UIViewBlockBasedCAAction_initWithEmptyBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIViewBlockBasedCAAction)initWithEmptyBlock:(id)a3
{
  id v4;
  id v5;
  UIViewBlockBasedCAAction *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UIViewBlockBasedCAAction_initWithEmptyBlock___block_invoke;
  v8[3] = &unk_1E16EB100;
  v9 = v4;
  v5 = v4;
  v6 = -[UIViewBlockBasedCAAction initWithActionBlock:](self, "initWithActionBlock:", v8);

  return v6;
}

@end
