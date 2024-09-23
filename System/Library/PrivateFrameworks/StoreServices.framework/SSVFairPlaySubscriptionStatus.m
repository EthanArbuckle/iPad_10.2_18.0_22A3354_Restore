@implementation SSVFairPlaySubscriptionStatus

- (NSString)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("true");
  if (self->_hasSubscriptionLease)
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  if (!self->_hasSubscriptionSlot)
    v7 = CFSTR("false");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p hasSubscriptionLease:%@ hasSubscriptionSlot:%@>"), v5, self, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  return self->_hasSubscriptionSlot ^ self->_hasSubscriptionLease ^ 0xF07;
}

- (BOOL)isEqual:(id)a3
{
  SSVFairPlaySubscriptionStatus *v4;
  BOOL v5;

  v4 = (SSVFairPlaySubscriptionStatus *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_hasSubscriptionSlot == v4->_hasSubscriptionSlot
      && self->_hasSubscriptionLease == v4->_hasSubscriptionLease;
  }

  return v5;
}

- (SSVFairPlaySubscriptionStatus)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVFairPlaySubscriptionStatus *v6;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVFairPlaySubscriptionStatus;
    v6 = -[SSVFairPlaySubscriptionStatus init](&v8, sel_init);
    if (v6)
    {
      v6->_hasSubscriptionLease = xpc_dictionary_get_BOOL(v5, "0");
      v6->_hasSubscriptionSlot = xpc_dictionary_get_BOOL(v5, "1");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_hasSubscriptionLease);
  xpc_dictionary_set_BOOL(v3, "1", self->_hasSubscriptionSlot);
  return v3;
}

- (BOOL)hasSubscriptionLease
{
  return self->_hasSubscriptionLease;
}

- (void)setHasSubscriptionLease:(BOOL)a3
{
  self->_hasSubscriptionLease = a3;
}

- (BOOL)hasSubscriptionSlot
{
  return self->_hasSubscriptionSlot;
}

- (void)setHasSubscriptionSlot:(BOOL)a3
{
  self->_hasSubscriptionSlot = a3;
}

@end
