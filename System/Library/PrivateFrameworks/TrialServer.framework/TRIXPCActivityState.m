@implementation TRIXPCActivityState

- (TRIXPCActivityState)initWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4
{
  TRIXPCActivityState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIXPCActivityState;
  result = -[TRIXPCActivityState init](&v7, sel_init);
  if (result)
  {
    result->_futureCompletionStatus = a3;
    result->_capabilities = a4;
  }
  return result;
}

+ (id)xPCActivityStateWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFutureCompletionStatus:capabilities:", a3, a4);
}

- (id)copyWithReplacementFutureCompletionStatus:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFutureCompletionStatus:capabilities:", a3, self->_capabilities);
}

- (id)copyWithReplacementCapabilities:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFutureCompletionStatus:capabilities:", self->_futureCompletionStatus, a3);
}

- (BOOL)isEqualToXPCActivityState:(id)a3
{
  id v4;
  void *v5;
  unint64_t futureCompletionStatus;
  unint64_t capabilities;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4
    && (futureCompletionStatus = self->_futureCompletionStatus,
        futureCompletionStatus == objc_msgSend(v4, "futureCompletionStatus")))
  {
    capabilities = self->_capabilities;
    v8 = capabilities == objc_msgSend(v5, "capabilities");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRIXPCActivityState *v4;
  TRIXPCActivityState *v5;
  BOOL v6;

  v4 = (TRIXPCActivityState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIXPCActivityState isEqualToXPCActivityState:](self, "isEqualToXPCActivityState:", v5);

  return v6;
}

- (unint64_t)hash
{
  return self->_capabilities - self->_futureCompletionStatus + 32 * self->_futureCompletionStatus;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_futureCompletionStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_capabilities);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIXPCActivityState | futureCompletionStatus:%@ capabilities:%@>"), v4, v5);

  return v6;
}

- (unint64_t)futureCompletionStatus
{
  return self->_futureCompletionStatus;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

@end
