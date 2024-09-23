@implementation STUConcreteUserNotification

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_actionHandler)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteUserNotification.m"), 28, CFSTR("User notification must be canceled or responded to by the user before deallocating."));

  }
  v5.receiver = self;
  v5.super_class = (Class)STUConcreteUserNotification;
  -[STUConcreteUserNotification dealloc](&v5, "dealloc");
}

- (STUConcreteUserNotification)initWithIdentifier:(id)a3 cancelValue:(int64_t)a4 actionHandler:(id)a5
{
  id v8;
  id v9;
  STUConcreteUserNotification *v10;
  NSString *v11;
  NSString *identifier;
  id v13;
  id actionHandler;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STUConcreteUserNotification;
  v10 = -[STUConcreteUserNotification init](&v16, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = v11;

    v10->_cancelValue = a4;
    v13 = objc_retainBlock(v9);
    actionHandler = v10->_actionHandler;
    v10->_actionHandler = v13;

  }
  return v10;
}

- (void)receiveResponse:(id)a3 withValue:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteUserNotification.m"), 47, CFSTR("%@ must be called from the main thread"), v14);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "notification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotification identifier](self, "identifier"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
    -[STUConcreteUserNotification deliverAction:](self, "deliverAction:", a4);

}

- (void)cancel
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteUserNotification.m"), 59, CFSTR("%@ must be called from the main thread"), v7);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotification delegate](self, "delegate"));
  objc_msgSend(v4, "userNotificationWantsToDeregister:", self);

  -[STUConcreteUserNotification deliverAction:](self, "deliverAction:", -[STUConcreteUserNotification cancelValue](self, "cancelValue"));
}

- (void)reregister
{
  void *v4;
  NSString *v5;
  void *v6;
  id v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteUserNotification.m"), 65, CFSTR("%@ must be called from the main thread"), v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotification delegate](self, "delegate"));
  objc_msgSend(v7, "userNotificationWantsToReregister:", self);

}

- (void)deliverAction:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotification actionHandler](self, "actionHandler"));

  if (v5)
  {
    v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotification actionHandler](self, "actionHandler"));
    -[STUConcreteUserNotification setActionHandler:](self, "setActionHandler:", 0);
    v6[2](v6, a3);

  }
}

- (STUConcreteUserNotificationDelegate)delegate
{
  return (STUConcreteUserNotificationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)cancelValue
{
  return self->_cancelValue;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
