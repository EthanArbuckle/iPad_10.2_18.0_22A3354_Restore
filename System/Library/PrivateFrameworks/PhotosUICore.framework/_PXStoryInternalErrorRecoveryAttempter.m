@implementation _PXStoryInternalErrorRecoveryAttempter

- (_PXStoryInternalErrorRecoveryAttempter)initWithRecoveryAttempter:(id)a3
{
  id v4;
  _PXStoryInternalErrorRecoveryAttempter *v5;
  _PXStoryInternalErrorRecoveryAttempter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PXStoryInternalErrorRecoveryAttempter;
  v5 = -[_PXStoryInternalErrorRecoveryAttempter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_recoveryAttempter, v4);

  return v6;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_PXStoryInternalErrorRecoveryAttempter recoveryAttempter](self, "recoveryAttempter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@; %p, recoveryAttempter: %@>"), v4, self, v5);

  return v6;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a5;
  v13 = a3;
  -[_PXStoryInternalErrorRecoveryAttempter recoveryAttempter](self, "recoveryAttempter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", v13, a4, v12, a6, a7);

}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[_PXStoryInternalErrorRecoveryAttempter recoveryAttempter](self, "recoveryAttempter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "attemptRecoveryFromError:optionIndex:", v6, a4);

  return a4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  if (sel_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo_ == a3
    || sel_attemptRecoveryFromError_optionIndex_ == a3)
  {
    -[_PXStoryInternalErrorRecoveryAttempter recoveryAttempter](self, "recoveryAttempter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_PXStoryInternalErrorRecoveryAttempter;
    v5 = -[_PXStoryInternalErrorRecoveryAttempter respondsToSelector:](&v7, sel_respondsToSelector_, a3);
  }
  return v5 & 1;
}

- (id)recoveryAttempter
{
  return objc_loadWeakRetained(&self->_recoveryAttempter);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_recoveryAttempter);
}

@end
