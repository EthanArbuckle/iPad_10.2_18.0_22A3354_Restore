@implementation SPDarwinNotificationHandler

- (SPDarwinNotificationHandler)initWithNotificationName:(id)a3 changeBlock:(id)a4
{
  id v6;
  id v7;
  SPDarwinNotificationHandler *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPDarwinNotificationHandler;
  v8 = -[SPDarwinNotificationHandler init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke;
    v13[3] = &unk_1E5E17488;
    v14 = v9;
    v15 = v7;
    notify_register_dispatch(v10, &v8->_notifyToken, v11, v13);

  }
  return v8;
}

void __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke_2;
  v2[3] = &unk_1E5E16720;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  _os_activity_initiate(&dword_1AEA79000, "SPDarwinNotificationHandler: Calling changeBlock()", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

uint64_t __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPDarwinNotificationHandler handling %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[SPDarwinNotificationHandler notifyToken](self, "notifyToken"));
  v3.receiver = self;
  v3.super_class = (Class)SPDarwinNotificationHandler;
  -[SPDarwinNotificationHandler dealloc](&v3, sel_dealloc);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

@end
