@implementation CACAXNotificationObserver

- (CACAXNotificationObserver)initWithNotifications:(id)a3
{
  id v4;
  CACAXNotificationObserver *v5;
  CACAXNotificationObserver *v6;
  _QWORD v8[4];
  CACAXNotificationObserver *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CACAXNotificationObserver;
  v5 = -[CACAXNotificationObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__CACAXNotificationObserver_initWithNotifications___block_invoke;
    v8[3] = &unk_24F2AAD70;
    v9 = v5;
    v10 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
  return v6;
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  AXError v3;
  NSObject *v4;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v6;
  __CFRunLoop *Current;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  __AXObserver *v13;
  void *v14;
  void *v15;
  AXError v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXObserverCreate(objc_msgSend(v2, "pid"), (AXObserverCallback)_accessibilityNotificationCallback, (AXObserverRef *)(*(_QWORD *)(a1 + 32) + 8));

  if (v3)
  {
    CACLogAccessibility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_3(v3, v4);
  }
  else
  {
    RunLoopSource = AXObserverGetRunLoopSource(*(AXObserverRef *)(*(_QWORD *)(a1 + 32) + 8));
    if (RunLoopSource)
    {
      v6 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v4 = *(id *)(a1 + 40);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v4);
            v12 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue", (_QWORD)v18);
            v13 = *(__AXObserver **)(*(_QWORD *)(a1 + 32) + 8);
            objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "uiElement");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = AXObserverAddNotification(v13, (AXUIElementRef)objc_msgSend(v15, "axElement"), v12, *(void **)(a1 + 32));

            if (v16)
            {
              CACLogAccessibility();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_2((int)v12, v16, v17);

              goto LABEL_4;
            }
          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            continue;
          break;
        }
      }
    }
    else
    {
      CACLogAccessibility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_1(v4);
    }
  }
LABEL_4:

}

- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4
{
  uint64_t v5;
  id v7;

  v5 = *(_QWORD *)&a3;
  -[CACAXNotificationObserver delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observer:didObserveNotification:notificationData:", self, v5, a4);

}

- (CACAXNotificationObserverDelegate)delegate
{
  return (CACAXNotificationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "Unable to get observer run loop source", v1, 2u);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_2(int a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "Unable to register for notification %ld with error %d", (uint8_t *)&v3, 0x12u);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_3(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Error creating AXObserver: %ld", (uint8_t *)&v2, 0xCu);
}

@end
