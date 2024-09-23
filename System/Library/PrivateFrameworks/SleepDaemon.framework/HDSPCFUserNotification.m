@implementation HDSPCFUserNotification

+ (HDSPCFUserNotification)userNotificationWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:notification:actionHandler:", v9, a4, v8);

  return (HDSPCFUserNotification *)v10;
}

- (HDSPCFUserNotification)initWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5
{
  id v9;
  id v10;
  HDSPCFUserNotification *v11;
  HDSPCFUserNotification *v12;
  uint64_t v13;
  id actionHandler;
  HDSPCFUserNotification *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSPCFUserNotification;
  v11 = -[HDSPCFUserNotification init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_notification = a4;
    v13 = objc_msgSend(v10, "copy");
    actionHandler = v12->_actionHandler;
    v12->_actionHandler = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
