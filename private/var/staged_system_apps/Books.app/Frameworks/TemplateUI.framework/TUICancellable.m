@implementation TUICancellable

- (TUICancellable)initWithCancelBlock:(id)a3
{
  id v4;
  TUICancellable *v5;
  TUICancellable *v6;
  id v7;
  id cancelBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUICancellable;
  v5 = -[TUICancellable init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    cancelBlock = v6->_cancelBlock;
    v6->_cancelBlock = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TUICancellable cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)TUICancellable;
  -[TUICancellable dealloc](&v3, "dealloc");
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  id cancelBlock;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_retainBlock(self->_cancelBlock);
  cancelBlock = self->_cancelBlock;
  self->_cancelBlock = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

+ (id)newWithCancelBlock:(id)a3
{
  id v3;
  TUICancellable *v4;

  v3 = a3;
  v4 = -[TUICancellable initWithCancelBlock:]([TUICancellable alloc], "initWithCancelBlock:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
