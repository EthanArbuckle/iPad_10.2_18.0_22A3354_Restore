@implementation PKDirectoryCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)performCoordinatedAction:(id)a3
{
  void (**v4)(id, NSURL *);
  void (**v5)(id, NSURL *);

  v4 = (void (**)(id, NSURL *))a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    v5[2](v5, self->_url);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (PKDirectoryCoordinator)initWithURL:(id)a3
{
  id v4;
  PKDirectoryCoordinator *v5;
  PKDirectoryCoordinator *v6;
  uint64_t v7;
  NSURL *url;
  PKDirectoryCoordinator *v9;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PKDirectoryCoordinator;
    v5 = -[PKDirectoryCoordinator init](&v11, sel_init);
    v6 = v5;
    if (v5)
    {
      v5->_lock._os_unfair_lock_opaque = 0;
      v7 = objc_msgSend(v4, "copy");
      url = v6->_url;
      v6->_url = (NSURL *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKDirectoryCoordinator)init
{

  return 0;
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  unsigned __int8 v4;
  NSURL *url;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v4 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
    url = self->_url;
    self->_url = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

@end
