@implementation STULockStatePropertyProvider

- (STULockStatePropertyProvider)init
{
  STULockStatePropertyProvider *v2;
  STULockStatePropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STULockStatePropertyProvider;
  v2 = -[STULockStatePropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &off_1000D4128);
  return v3;
}

- (id)key
{
  return CRKDeviceLockStateKey;
}

- (void)beginUpdating
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STULockStatePropertyProvider delegate](self, "delegate"));
  objc_msgSend(v3, "beginUpdating:", self);

}

- (void)endUpdating
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STULockStatePropertyProvider delegate](self, "delegate"));
  objc_msgSend(v3, "endUpdating:", self);

}

- (void)setScreenLocked:(BOOL)a3
{
  id v5;

  if (-[STULockStatePropertyProvider isScreenLocked](self, "isScreenLocked") != a3)
  {
    self->_screenLocked = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[STULockStatePropertyProvider delegate](self, "delegate"));
    objc_msgSend(v5, "lockStateDidChange:", self);

  }
}

- (BOOL)isScreenLocked
{
  return self->_screenLocked;
}

- (STULockStatePropertyProviderDelegate)delegate
{
  return (STULockStatePropertyProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
