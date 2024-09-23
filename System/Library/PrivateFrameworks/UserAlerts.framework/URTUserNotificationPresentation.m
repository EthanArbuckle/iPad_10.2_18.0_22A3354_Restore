@implementation URTUserNotificationPresentation

+ (void)registerUserNotification:(__CFUserNotification *)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (registerUserNotification_handler__onceToken != -1)
    dispatch_once(&registerUserNotification_handler__onceToken, &__block_literal_global_0);
  v5 = (id)handlersForUserNotifications;
  objc_sync_enter(v5);
  v6 = (void *)handlersForUserNotifications;
  v7 = (void *)MEMORY[0x22073C880](v8);
  objc_msgSend(v6, "setObject:forKey:", v7, a3);

  objc_sync_exit(v5);
}

void __68__URTUserNotificationPresentation_registerUserNotification_handler___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 1);
  v1 = (void *)handlersForUserNotifications;
  handlersForUserNotifications = v0;

}

+ (void)invokeHandlerForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = (id)handlersForUserNotifications;
  objc_sync_enter(v6);
  objc_msgSend((id)handlersForUserNotifications, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)handlersForUserNotifications, "removeObjectForKey:", a3);
  objc_sync_exit(v6);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, __CFUserNotification *, unint64_t))v8 + 2))(v8, a3, a4);
    v7 = v8;
  }

}

+ (void)unregisterHandlerForUserNotification:(__CFUserNotification *)a3
{
  id obj;

  obj = (id)handlersForUserNotifications;
  objc_sync_enter(obj);
  objc_msgSend((id)handlersForUserNotifications, "removeObjectForKey:", a3);
  objc_sync_exit(obj);

}

- (URTUserNotificationPresentation)initWithContents:(id)a3 flags:(unint64_t)a4
{
  id v7;
  URTUserNotificationPresentation *v8;
  URTUserNotificationPresentation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)URTUserNotificationPresentation;
  v8 = -[URTUserNotificationPresentation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_error = 0;
    objc_storeStrong((id *)&v8->_contents, a3);
    v9->_creationFlags = a4;
  }

  return v9;
}

- (__CFRunLoopSource)createRunLoopSourceOrdered:(int64_t)a3 handler:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "registerUserNotification:handler:", self->_userNotification, v6);

  return CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_userNotification, (CFUserNotificationCallBack)_URTUserNotificationRunLoopCallback, a3);
}

- (void)present
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21A1D3000, a2, OS_LOG_TYPE_ERROR, "failed to create CFUserNotification, error %i", (uint8_t *)v3, 8u);
}

- (void)dismiss
{
  __CFUserNotification *userNotification;

  userNotification = self->_userNotification;
  if (userNotification)
    CFUserNotificationCancel(userNotification);
}

- (void)invalidate
{
  if (self->_userNotification)
  {
    objc_msgSend((id)objc_opt_class(), "unregisterHandlerForUserNotification:", self->_userNotification);
    CFRelease(self->_userNotification);
    self->_userNotification = 0;
  }
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (unint64_t)creationFlags
{
  return self->_creationFlags;
}

- (int)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
