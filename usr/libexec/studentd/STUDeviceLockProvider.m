@implementation STUDeviceLockProvider

- (STUDeviceLockProvider)init
{
  STUDeviceLockProvider *v2;
  STUManagementLockPasscodePropertyProvider *v3;
  STUManagementLockPasscodePropertyProvider *mManagementLockPasscodePropertyProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUDeviceLockProvider;
  v2 = -[STUDeviceLockProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(STUManagementLockPasscodePropertyProvider);
    mManagementLockPasscodePropertyProvider = v2->mManagementLockPasscodePropertyProvider;
    v2->mManagementLockPasscodePropertyProvider = v3;

  }
  return v2;
}

- (STUDevicePropertyProviding)managementLockPasscodeProvider
{
  return (STUDevicePropertyProviding *)self->mManagementLockPasscodePropertyProvider;
}

- (void)instructorDidLockDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;

  v11 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    self->mIsDeviceLockedByInstructor = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("STULockLongRunningOperationPasscodeKey")));

    v7 = objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self->mManagementLockPasscodePropertyProvider, "value"));
    if (v7 | v6)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self->mManagementLockPasscodePropertyProvider, "value"));
      v10 = objc_msgSend(v9, "isEqual:", v6);

      if ((v10 & 1) == 0)
        -[STUDevicePropertyProvider setValue:](self->mManagementLockPasscodePropertyProvider, "setValue:", v6);
    }
    -[STUDeviceLockProvider updateLockState](self, "updateLockState");

  }
  else
  {
    -[STUDeviceLockProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }

}

- (void)instructorDidUnlockDevice:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    self->mIsDeviceLockedByInstructor = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self->mManagementLockPasscodePropertyProvider, "value"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self->mManagementLockPasscodePropertyProvider, "value"));
      v8 = objc_msgSend(v7, "isEqual:", 0);

      if ((v8 & 1) == 0)
        -[STUDevicePropertyProvider setValue:](self->mManagementLockPasscodePropertyProvider, "setValue:", 0);
    }
    -[STUDeviceLockProvider updateLockState](self, "updateLockState");
  }
  else
  {
    -[STUDeviceLockProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)updateLockState
{
  void *v2;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[STUDeviceLockProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeviceLockProvider backingLockStateProvider](self, "backingLockStateProvider"));
  v6 = objc_msgSend(v5, "isScreenLocked");

  if (v6)
  {
    if (self->mIsDeviceLockedByInstructor)
      v7 = 3;
    else
      v7 = 2;
  }
  else
  {
    v7 = 1;
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[STUDeviceLockProvider backingLockStateProvider](self, "backingLockStateProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  if (!v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    if (!v2)
      goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeviceLockProvider backingLockStateProvider](self, "backingLockStateProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v8)
  else

  if ((v12 & 1) == 0)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeviceLockProvider backingLockStateProvider](self, "backingLockStateProvider"));
    objc_msgSend(v13, "setValue:", v14);

LABEL_15:
  }
}

- (void)beginUpdating:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "instructorDidLockDevice:", CFSTR("STULockLongRunningOperationDidLockNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "instructorDidUnlockDevice:", CFSTR("STULockLongRunningOperationDidUnlockNotification"), 0);

  -[STUDeviceLockProvider updateLockState](self, "updateLockState");
}

- (void)endUpdating:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("STULockLongRunningOperationDidLockNotification"), 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("STULockLongRunningOperationDidUnlockNotification"), 0);

}

- (STULockStatePropertyProvider)backingLockStateProvider
{
  return self->_backingLockStateProvider;
}

- (void)setBackingLockStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_backingLockStateProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLockStateProvider, 0);
  objc_storeStrong((id *)&self->mManagementLockPasscodePropertyProvider, 0);
}

@end
