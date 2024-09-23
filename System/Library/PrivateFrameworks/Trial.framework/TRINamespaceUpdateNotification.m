@implementation TRINamespaceUpdateNotification

+ (id)registerUpdateForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  uint32_t v14;
  NSObject *v15;
  TRINotificationState *v16;
  TRINotificationState *v17;
  _QWORD handler[4];
  id v20;
  id v21;
  int out_token;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  out_token = -1;
  v9 = a4;
  +[TRINamespaceUpdateNotification notificationNameForNamespaceName:](TRINamespaceUpdateNotification, "notificationNameForNamespaceName:", v7);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __82__TRINamespaceUpdateNotification_registerUpdateForNamespaceName_queue_usingBlock___block_invoke;
  handler[3] = &unk_1E3BFF138;
  v12 = v7;
  v20 = v12;
  v13 = v8;
  v21 = v13;
  v14 = notify_register_dispatch(v11, &out_token, v9, handler);

  if (v14)
  {
    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v14;
      _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v16 = 0;
  }
  else
  {
    v17 = [TRINotificationState alloc];
    v16 = -[TRINotificationState initWithToken:](v17, "initWithToken:", out_token);
  }

  return v16;
}

+ (id)notificationNameForNamespaceName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.trial.NamespaceUpdate"), a3);
}

+ (void)deregisterUpdateWithToken:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    notify_cancel(objc_msgSend(v3, "token"));

}

- (TRINamespaceUpdateNotification)initWithNamespaceName:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  TRINamespaceUpdateNotification *v9;
  TRINamespaceUpdateNotification *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRINamespaceUpdateNotification;
  v9 = -[TRINamespaceUpdateNotification init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namespaceName, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

- (unsigned)namespaceId
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0DC0F18];
  -[TRINamespaceUpdateNotification namespaceName](self, "namespaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "namespaceIdFromName:", v3);

  return v2;
}

void __82__TRINamespaceUpdateNotification_registerUpdateForNamespaceName_queue_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  TRINotificationState *v5;
  uint64_t v6;
  TRINamespaceUpdateNotification *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEBUG, "received update notification for namespace %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = -[TRINotificationState initWithToken:]([TRINotificationState alloc], "initWithToken:", a2);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = -[TRINamespaceUpdateNotification initWithNamespaceName:token:]([TRINamespaceUpdateNotification alloc], "initWithNamespaceName:token:", *(_QWORD *)(a1 + 32), v5);
  (*(void (**)(uint64_t, TRINamespaceUpdateNotification *))(v6 + 16))(v6, v7);

}

+ (BOOL)notifyUpdateForNamespaceName:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  uint32_t v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[TRINamespaceUpdateNotification notificationNameForNamespaceName:](TRINamespaceUpdateNotification, "notificationNameForNamespaceName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (unint64_t)v3;
    _os_log_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEFAULT, "Sending namespace update notification: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v5 = objc_retainAutorelease(v3);
  v6 = notify_post((const char *)objc_msgSend(v5, "UTF8String"));
  if (v6)
  {
    TRILogCategory_ClientFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = v6;
      _os_log_error_impl(&dword_19B89C000, v7, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6 == 0;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (TRINotificationToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

@end
