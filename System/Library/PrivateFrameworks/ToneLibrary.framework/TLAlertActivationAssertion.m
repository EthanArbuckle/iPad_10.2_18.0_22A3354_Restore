@implementation TLAlertActivationAssertion

- (TLAlertActivationAssertion)initWithAlert:(id)a3
{
  id v5;
  TLAlertActivationAssertion *v6;
  TLAlertActivationAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLAlertActivationAssertion;
  v6 = -[TLAlertActivationAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alert, a3);
    atomic_store(0, (unint64_t *)&v7->_activeAcquisitionCount);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = atomic_load((unint64_t *)&self->_activeAcquisitionCount);
  if (v3 >= 1)
    -[TLAlertActivationAssertion _relinquish](self, "_relinquish");
  v4.receiver = self;
  v4.super_class = (Class)TLAlertActivationAssertion;
  -[TLAlertActivationAssertion dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; alert = %@"), self->_alert);
  v7 = atomic_load((unint64_t *)&self->_activeAcquisitionCount);
  if (v7 >= 1)
    objc_msgSend(v6, "appendString:", CFSTR("; isAquired = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)acquire
{
  NSObject *v3;
  int64_t *p_activeAcquisitionCount;
  unint64_t v5;
  int v6;
  TLAlertActivationAssertion *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -acquire.", (uint8_t *)&v6, 0xCu);
  }

  p_activeAcquisitionCount = &self->_activeAcquisitionCount;
  do
    v5 = __ldaxr((unint64_t *)p_activeAcquisitionCount);
  while (__stlxr(v5 + 1, (unint64_t *)p_activeAcquisitionCount));
  if (!v5)
    -[TLAlertActivationAssertion _acquire](self, "_acquire");
}

- (void)relinquish
{
  NSObject *v3;
  int64_t *p_activeAcquisitionCount;
  unint64_t v5;
  unint64_t v6;
  int v7;
  TLAlertActivationAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -relinquish.", (uint8_t *)&v7, 0xCu);
  }

  p_activeAcquisitionCount = &self->_activeAcquisitionCount;
  do
  {
    v5 = __ldaxr((unint64_t *)p_activeAcquisitionCount);
    v6 = v5 - 1;
  }
  while (__stlxr(v6, (unint64_t *)p_activeAcquisitionCount));
  if (!v6)
    -[TLAlertActivationAssertion _relinquish](self, "_relinquish");
}

- (void)_acquire
{
  NSObject *v3;
  void *v4;
  int v5;
  TLAlertActivationAssertion *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: was acquired.", (uint8_t *)&v5, 0xCu);
  }

  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleActivationAssertionStatusChangeForAlert:updatedStatus:", self->_alert, 1);

}

- (void)_relinquish
{
  NSObject *v3;
  void *v4;
  int v5;
  TLAlertActivationAssertion *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: was relinquished.", (uint8_t *)&v5, 0xCu);
  }

  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleActivationAssertionStatusChangeForAlert:updatedStatus:", self->_alert, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
