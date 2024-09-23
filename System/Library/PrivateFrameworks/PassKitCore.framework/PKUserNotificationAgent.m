@implementation PKUserNotificationAgent

+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 responseHandler:(id)a4
{
  return +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", a3, 0, a4);
}

+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 flags:(unint64_t)a4 responseHandler:(id)a5
{
  id v7;
  __CFUserNotification *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __CFUserNotification *v16;
  _QWORD block[4];
  id v18;

  v7 = a5;
  v8 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, a4, 0, (CFDictionaryRef)a3);
  _Queue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke;
  v14[3] = &unk_1E2AC1C68;
  v15 = v7;
  v16 = v8;
  v11 = v14;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_22;
  block[3] = &unk_1E2ABD9A0;
  v18 = v11;
  v12 = v7;
  dispatch_async(v9, block);

  return v8;
}

void __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v8;
  __CFRunLoop *Main;
  _QWORD block[4];
  id v11;

  v2 = *(const void **)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v3)
    {
      _NotificationHandlerMap();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)_NotificationResponseHandler, 0);
      if (RunLoopSource)
      {
        v8 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v8, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(v8);
      }
      else
      {
        CFRelease(*(CFTypeRef *)(a1 + 40));
      }
      return;
    }
LABEL_7:
    CFRelease(v2);
    return;
  }
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke_2;
    block[3] = &unk_1E2ABD9A0;
    v11 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v2 = *(const void **)(a1 + 40);
    if (v2)
      goto LABEL_7;
  }
}

uint64_t __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
