@implementation PKAuthenticatorPreflightContext

- (PKAuthenticatorPreflightContext)init
{
  return (PKAuthenticatorPreflightContext *)-[PKAuthenticatorPreflightContext initForLocationBasedAuthorization:](self, "initForLocationBasedAuthorization:", 0);
}

- (id)initForLocationBasedAuthorization:(BOOL)a3
{
  _BOOL4 v3;
  PKAuthenticatorPreflightContext *v4;
  PKAuthenticatorPreflightContext *v5;
  LAContext *v6;
  LAContext *context;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAuthenticatorPreflightContext;
  v4 = -[PKAuthenticatorPreflightContext init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (LAContext *)objc_alloc_init(MEMORY[0x24BDDA938]);
    context = v5->_context;
    v5->_context = v6;

    if (v3)
      -[LAContext setOptionDTO:](v5->_context, "setOptionDTO:", MEMORY[0x24BDBD1C8]);
    v5->_validReferenceCount = 0;
    v5->_useLocationBasedAuthorization = v3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[LAContext invalidate](self->_context, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKAuthenticatorPreflightContext;
  -[PKAuthenticatorPreflightContext dealloc](&v3, sel_dealloc);
}

- (id)context
{
  os_unfair_lock_s *p_lock;
  LAContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)incrementValidReferenceCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    __break(1u);
  }
  else
  {
    ++self->_validReferenceCount;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)decrementValidReferenceCount
{
  os_unfair_lock_s *p_lock;
  int64_t validReferenceCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  validReferenceCount = self->_validReferenceCount;
  if (validReferenceCount)
  {
    self->_validReferenceCount = validReferenceCount - 1;
    -[PKAuthenticatorPreflightContext _clearIfPossibleUnsafe](self, "_clearIfPossibleUnsafe");
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    __break(1u);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  -[PKAuthenticatorPreflightContext _clearIfPossibleUnsafe](self, "_clearIfPossibleUnsafe");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  PKAuthenticatorPreflightContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_clearIfPossibleUnsafe
{
  LAContext *context;

  if (self->_invalidated && !self->_validReferenceCount)
  {
    -[LAContext invalidate](self->_context, "invalidate");
    context = self->_context;
    self->_context = 0;

  }
}

- (BOOL)useLocationBasedAuthorization
{
  return self->_useLocationBasedAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
