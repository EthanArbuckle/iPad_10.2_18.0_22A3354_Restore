@implementation PKLinkedApplicationAMSPromiseWrapper

- (PKLinkedApplicationAMSPromiseWrapper)init
{

  return 0;
}

- (PKLinkedApplicationAMSPromiseWrapper)initWithAMSPromise:(id)a3
{
  id v5;
  PKLinkedApplicationAMSPromiseWrapper *v6;
  PKLinkedApplicationAMSPromiseWrapper *v7;
  PKLinkedApplicationAMSPromiseWrapper *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKLinkedApplicationAMSPromiseWrapper;
    v6 = -[PKLinkedApplicationAMSPromiseWrapper init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_promise, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInvalidated
{
  PKLinkedApplicationAMSPromiseWrapper *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  AMSPromise *promise;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  promise = self->_promise;
  self->_promise = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCanceled
{
  PKLinkedApplicationAMSPromiseWrapper *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  AMSPromise *promise;
  AMSPromise *v5;
  AMSPromise *v6;
  AMSPromise *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_canceled = 1;
  promise = self->_promise;
  v7 = promise;
  if (promise)
  {
    v5 = promise;
    v6 = self->_promise;
    self->_promise = 0;

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x1E0CFDBB8], "cancelPromise:", v5);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
