@implementation ICUserNotificationManager

- (ICUserNotificationManager)init
{
  ICUserNotificationManager *v2;
  uint64_t v3;
  NSMapTable *contextForUserNotification;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICUserNotificationManager;
  v2 = -[ICUserNotificationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 2);
    contextForUserNotification = v2->_contextForUserNotification;
    v2->_contextForUserNotification = (NSMapTable *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserNotificationManager.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserNotificationManager.notification", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)displayUserNotification:(__CFUserNotification *)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  __CFUserNotification *v11;

  v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438DF68;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

- (void)_handleCallbackForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSObject *accessQueue;
  _QWORD v5[8];

  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke;
  v5[3] = &unk_1E438DF90;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a2;
  v5[7] = a4;
  dispatch_async(accessQueue, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_contextForUserNotification, 0);
}

void __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ICUserNotificationManager.m"), 85, CFSTR("no dialog info for user notification %@"), a1[5]);

  }
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  objc_msgSend(v2, "clearRunLoop");
  v3 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke_2;
  block[3] = &unk_1E438E1E8;
  v4 = a1[7];
  v8 = v2;
  v9 = v4;
  v5 = v2;
  dispatch_async(v3, block);

}

void __78__ICUserNotificationManager__handleCallbackForUserNotification_responseFlags___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), 0);

}

void __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v3;
  __CFRunLoop *Main;
  NSObject *v5;
  id v6;
  ICUserNotificationContext *v7;
  id v8[2];
  _QWORD block[4];
  __int128 v10;

  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 48), (CFUserNotificationCallBack)_UserNotificationCallback, 0);
  if (RunLoopSource)
  {
    v3 = RunLoopSource;
    v7 = objc_alloc_init(ICUserNotificationContext);
    -[ICUserNotificationContext setRunLoopSourceRef:](v7, "setRunLoopSourceRef:", v3);
    -[ICUserNotificationContext setCompletionHandler:](v7, "setCompletionHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v7, *(_QWORD *)(a1 + 48));
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);

  }
  else
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E438DF40;
    *(_OWORD *)v8 = *(_OWORD *)(a1 + 40);
    v6 = v8[0];
    v10 = *(_OWORD *)v8;
    dispatch_async(v5, block);

  }
}

void __75__ICUserNotificationManager_displayUserNotification_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  SInt32 v2;
  uint64_t v3;
  CFOptionFlags v4;
  void *v5;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 3600.0, &responseFlags);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = responseFlags;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CFOptionFlags, void *))(v3 + 16))(v3, v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, CFOptionFlags, _QWORD))(v3 + 16))(v3, responseFlags, 0);
  }
}

+ (ICUserNotificationManager)sharedManager
{
  if (sharedManager_sOnceToken_25002 != -1)
    dispatch_once(&sharedManager_sOnceToken_25002, &__block_literal_global_25003);
  return (ICUserNotificationManager *)(id)sharedManager_sSharedManager_25004;
}

void __42__ICUserNotificationManager_sharedManager__block_invoke()
{
  ICUserNotificationManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICUserNotificationManager);
  v1 = (void *)sharedManager_sSharedManager_25004;
  sharedManager_sSharedManager_25004 = (uint64_t)v0;

}

@end
