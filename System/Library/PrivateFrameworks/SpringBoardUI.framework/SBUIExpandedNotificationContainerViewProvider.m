@implementation SBUIExpandedNotificationContainerViewProvider

- (SBUIExpandedNotificationContainerViewProvider)initWithRequester:(id)a3 containerView:(id)a4 reason:(id)a5 invalidationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBUIExpandedNotificationContainerViewProvider *v15;
  SBUIExpandedNotificationContainerViewProvider *v16;
  uint64_t v17;
  NSString *reason;
  uint64_t v19;
  id invalidationBlock;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIExpandedNotificationContainerViewProvider.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requester"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIExpandedNotificationContainerViewProvider.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

LABEL_3:
  if (!objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIExpandedNotificationContainerViewProvider.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  v27.receiver = self;
  v27.super_class = (Class)SBUIExpandedNotificationContainerViewProvider;
  v15 = -[SBUIExpandedNotificationContainerViewProvider init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_requester, v11);
    objc_storeWeak((id *)&v16->_containerView, v12);
    v17 = objc_msgSend(v13, "copy");
    reason = v16->_reason;
    v16->_reason = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    invalidationBlock = v16->_invalidationBlock;
    v16->_invalidationBlock = (id)v19;

    SBLogNotifications();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[SBUIExpandedNotificationContainerViewProvider description](v16, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_215F8C000, v21, OS_LOG_TYPE_DEFAULT, "Instantiated new expanded notification container view assertion: %{public}@", buf, 0xCu);

    }
  }

  return v16;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[SBUIExpandedNotificationContainerViewProvider isValid](self, "isValid"))
  {
    SBLogNotifications();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[SBUIExpandedNotificationContainerViewProvider description](self, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl(&dword_215F8C000, v3, OS_LOG_TYPE_DEFAULT, "Implicitly invalidating expanded notification container view assertion due to deallocation: %{public}@", buf, 0xCu);

    }
    -[SBUIExpandedNotificationContainerViewProvider invalidate](self, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBUIExpandedNotificationContainerViewProvider;
  -[SBUIExpandedNotificationContainerViewProvider dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  NSString *reason;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained(&self->_requester);
  reason = self->_reason;
  -[SBUIExpandedNotificationContainerViewProvider isValid](self, "isValid");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; requester: %@; reason: %@; valid: %@>"),
    v4,
    self,
    WeakRetained,
    reason,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id invalidationBlock;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIExpandedNotificationContainerViewProvider.m"), 62, CFSTR("Attempt to invalidate invalid instance"));

  }
  SBLogNotifications();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBUIExpandedNotificationContainerViewProvider description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_215F8C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating expanded notification container view assertion: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  self->_invalidated = 1;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F42EC](self->_invalidationBlock);
  invalidationBlock = self->_invalidationBlock;
  self->_invalidationBlock = 0;

  if (v5)
    ((void (**)(_QWORD, SBUIExpandedNotificationContainerViewProvider *))v5)[2](v5, self);

}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (id)requester
{
  return objc_loadWeakRetained(&self->_requester);
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak(&self->_requester);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
