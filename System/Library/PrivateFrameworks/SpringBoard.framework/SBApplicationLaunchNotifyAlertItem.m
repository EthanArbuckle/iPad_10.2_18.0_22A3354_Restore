@implementation SBApplicationLaunchNotifyAlertItem

- (SBApplicationLaunchNotifyAlertItem)initWithApplication:(id)a3
{
  id v6;
  SBApplicationLaunchNotifyAlertItem *v7;
  SBApplicationLaunchNotifyAlertItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchNotifyAlertItem.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBApplicationLaunchNotifyAlertItem;
  v7 = -[SBAlertItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_application, a3);
    -[SBAlertItem setAllowInCar:](v8, "setAllowInCar:", 0);
    -[SBAlertItem setAllowMessageInCar:](v8, "setAllowMessageInCar:", 0);
  }

  return v8;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (SBApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
