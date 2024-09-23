@implementation _TUIRunLoopAssertion

- (_TUIRunLoopAssertion)initWithCompletion:(id)a3
{
  id v4;
  _TUIRunLoopAssertion *v5;
  _TUIRunLoopAssertion *v6;
  id v7;
  id completion;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUIRunLoopAssertion;
  v5 = -[_TUIRunLoopAssertion init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    completion = v6->_completion;
    v6->_completion = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUIRunLoopAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_TUIRunLoopAssertion;
  -[_TUIRunLoopAssertion dealloc](&v3, "dealloc");
}

- (void)onInvalidate:(id)a3
{
  id v4;
  id onInvalidate;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_completion)
  {
    v4 = objc_msgSend(v6, "copy");
    onInvalidate = self->_onInvalidate;
    self->_onInvalidate = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v6[2]();

    }
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  id completion;
  id onInvalidate;
  void (**v7)(_QWORD);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (void (**)(_QWORD))objc_retainBlock(self->_completion);
  v4 = (void (**)(_QWORD))objc_retainBlock(self->_onInvalidate);
  completion = self->_completion;
  self->_completion = 0;

  onInvalidate = self->_onInvalidate;
  self->_onInvalidate = 0;

  os_unfair_lock_unlock(p_lock);
  if (v7)
    v7[2](v7);
  if (v4)
    v4[2](v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onInvalidate, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
