@implementation SLGActivatableLogger

- (SLGActivatableLogger)initWithLogger:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_lock._os_unfair_lock_opaque = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (id)activationHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1CAA37764](self->_activationHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1CAA37764](v4);

  return v5;
}

- (void)setActivationHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id activationHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  activationHandler = self->_activationHandler;
  self->_activationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)deactivationHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1CAA37764](self->_deactivationHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1CAA37764](v4);

  return v5;
}

- (void)setDeactivationHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id deactivationHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  deactivationHandler = self->_deactivationHandler;
  self->_deactivationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isActive
{
  SLGActivatableLogger *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void (**v7)(void);

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_active != v3)
  {
    if (v3)
    {
      self->_active = 1;
      v6 = 24;
    }
    else
    {
      v6 = 32;
    }
    v7 = (void (**)(void))MEMORY[0x1CAA37764](*(Class *)((char *)&self->super.isa + v6));
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v7[2]();
      os_unfair_lock_lock(p_lock);
      if (v3)
        goto LABEL_12;
    }
    else
    {
      os_unfair_lock_lock(p_lock);
      if (v3)
        goto LABEL_3;
    }
    self->_active = 0;
    goto LABEL_12;
  }
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_lock(p_lock);
LABEL_3:
  v7 = 0;
LABEL_12:
  os_unfair_lock_unlock(p_lock);

}

- (void)invalidate
{
  -[SLGActivatableLogger setActive:](self, "setActive:", 0);
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[SLGActivatableLogger isActive](self, "isActive"))
    -[SLGLogging logBlock:domain:](self->_logger, "logBlock:domain:", v7, v6);

}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGActivatableLogger isActive](self, "isActive"))
    -[SLGLogging logBlock:domain:completion:](self->_logger, "logBlock:domain:completion:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGActivatableLogger isActive](self, "isActive"))
    -[SLGLogging logBlock:domain:tags:](self->_logger, "logBlock:domain:tags:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[SLGActivatableLogger isActive](self, "isActive"))
    -[SLGLogging logBlock:domain:tags:completion:](self->_logger, "logBlock:domain:tags:completion:", v13, v10, v11, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
