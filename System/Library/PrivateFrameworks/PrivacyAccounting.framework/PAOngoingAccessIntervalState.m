@implementation PAOngoingAccessIntervalState

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (PAOngoingAccessIntervalState)initWithAccess:(id)a3
{
  id v5;
  PAOngoingAccessIntervalState *v6;
  PAOngoingAccessIntervalState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAOngoingAccessIntervalState;
  v6 = -[PAOngoingAccessIntervalState init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_access, a3);
    v7->_retryCount = 0;
  }

  return v7;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
}

- (PAAccess)access
{
  return self->_access;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

@end
