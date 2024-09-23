@implementation _UIWeakHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationBlock, 0);
}

- (_UIWeakHelper)initWithDeallocationBlock:(id)a3
{
  id v4;
  _UIWeakHelper *v5;
  _UIWeakHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakHelper;
  v5 = -[_UIWeakHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIWeakHelper setDeallocationBlock:](v5, "setDeallocationBlock:", v4);

  return v6;
}

- (void)setDeallocationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)dealloc
{
  int v3;
  void (**deallocationBlock)(_QWORD);
  objc_super v5;

  if (self->_deallocationBlock)
  {
    v3 = pthread_main_np();
    deallocationBlock = (void (**)(_QWORD))self->_deallocationBlock;
    if (v3 == 1)
      ((void (**)(id))deallocationBlock)[2](self->_deallocationBlock);
    else
      dispatch_async(MEMORY[0x1E0C80D38], deallocationBlock);
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIWeakHelper;
  -[_UIWeakHelper dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  id deallocationBlock;

  deallocationBlock = self->_deallocationBlock;
  self->_deallocationBlock = 0;

}

- (id)deallocationBlock
{
  return self->_deallocationBlock;
}

@end
