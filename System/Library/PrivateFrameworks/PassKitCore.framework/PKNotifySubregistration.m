@implementation PKNotifySubregistration

- (PKNotifySubregistration)initWithParent:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  PKNotifySubregistration *v8;
  PKNotifySubregistration *v9;
  void *v10;
  id handler;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKNotifySubregistration;
  v8 = -[PKNotifySubregistration init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_parent, v6);
    v10 = _Block_copy(v7);
    handler = v9->_handler;
    v9->_handler = v10;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)_invalidateFromParent:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  id handler;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_invalidated = 1;
    if (a3)
      WeakRetained = 0;
    else
      WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_storeWeak((id *)&self->_parent, 0);
    handler = self->_handler;
    self->_handler = 0;

    os_unfair_lock_unlock(p_lock);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "removeInvalidatedSubregistration:", self);

    }
  }
}

- (void)invalidate
{
  -[PKNotifySubregistration _invalidateFromParent:](self, "_invalidateFromParent:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PKNotifySubregistration _invalidateFromParent:](self, "_invalidateFromParent:", 1);
  v3.receiver = self;
  v3.super_class = (Class)PKNotifySubregistration;
  -[PKNotifySubregistration dealloc](&v3, sel_dealloc);
}

- (PKNotifySubregistration)init
{

  return 0;
}

- (BOOL)isInvalidated
{
  PKNotifySubregistration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invokeHandler
{
  os_unfair_lock_s *p_lock;
  void (**v4)(id, PKNotifySubregistration *);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = (void (**)(id, PKNotifySubregistration *))_Block_copy(self->_handler);
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      v4[2](v4, self);

    }
  }
}

@end
