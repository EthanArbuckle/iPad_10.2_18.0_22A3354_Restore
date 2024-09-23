@implementation SRHDataCollectionController

dispatch_queue_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  result = dispatch_queue_create("com.apple.SensorKit.workQueue", v0);
  qword_254419A78 = (uint64_t)result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    qword_254419A68 = (uint64_t)os_log_create("com.apple.SensorKit", "SRHDataCollectionController");
}

uint64_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (+[SRHDataCollectionController isMessagingApp:](SRHDataCollectionController, "isMessagingApp:", *(_QWORD *)(a1 + 32))&& +[SRHDataCollectionController isSocialMediaApp](SRHDataCollectionController, "isSocialMediaApp"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_3;
    v5[3] = &unk_2516F0F10;
    v6 = *(_OWORD *)(a1 + 32);
    return +[SRHDataCollectionController isMediaEventsStreamAuthorizedWithCompletionHandler:](SRHDataCollectionController, "isMediaEventsStreamAuthorizedWithCompletionHandler:", v5);
  }
  else
  {
    byte_254419A61 = 1;
    v3 = qword_254419A68;
    if (os_log_type_enabled((os_log_t)qword_254419A68, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67240451;
      v8 = _MergedGlobals_0;
      v9 = 2113;
      v10 = v4;
      _os_log_impl(&dword_245CD0000, v3, OS_LOG_TYPE_INFO, "Media events collection is %{public, BOOL}i for %{private}@", buf, 0x12u);
    }
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

+ (BOOL)isSocialMediaApp
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKeyedSubscript:", CFSTR("SBMatchingApplicationGenres"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v2, "containsObject:", CFSTR("Social Networking")) & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess"), "sr_isSocialNetworking");
}

+ (void)isMediaEventsStreamAuthorizedWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD v5[6];
  _QWORD v6[6];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SensorKit.SKMediaEventsHelper"));
  objc_msgSend(v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751BF40));
  objc_msgSend(v4, "resume");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke;
  v6[3] = &unk_2516F0EA0;
  v6[4] = v4;
  v6[5] = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke_29;
  v5[3] = &unk_2516F0EC8;
  v5[4] = v4;
  v5[5] = a3;
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6), "authorizationRequestStatusForMediaEventsStreamWithReply:", v5);
}

+ (void)isMediaEventsCollectionEnabledFor:(id)a3 completionHandler:(id)a4
{
  _QWORD v6[6];

  if ((byte_254419A61 & 1) != 0)
  {
    if (a4)
      (*((void (**)(id, _QWORD))a4 + 2))(a4, _MergedGlobals_0);
  }
  else
  {
    if (qword_254419A70 != -1)
      dispatch_once(&qword_254419A70, &__block_literal_global);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_2;
    v6[3] = &unk_2516F0F38;
    v6[4] = a3;
    v6[5] = a4;
    dispatch_async((dispatch_queue_t)qword_254419A78, v6);
  }
}

+ (BOOL)isMessagingApp:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", a3);
  v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("NSUserActivityTypes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "containsObject:", CFSTR("INSendMessageIntent")) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = objc_msgSend(v3, "builtInPlugInsURL");
    v8 = (void *)objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, MEMORY[0x24BDBD1A8], 1, 0);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v5)
      return v5;
    v9 = v5;
    v10 = *(_QWORD *)v17;
LABEL_6:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v8);
      v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11)), "infoDictionary"), "objectForKeyedSubscript:", CFSTR("NSExtension"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v14, "containsObject:", CFSTR("INSendMessageIntent")) & 1) != 0)
          {
            break;
          }
        }
      }
      if (v9 == ++v11)
      {
        v5 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = v5;
        if (v5)
          goto LABEL_6;
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

uint64_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  byte_254419A61 = 1;
  _MergedGlobals_0 = a2;
  v4 = qword_254419A68;
  if (os_log_type_enabled((os_log_t)qword_254419A68, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7[0] = 67240451;
    v7[1] = a2;
    v8 = 2113;
    v9 = v5;
    _os_log_impl(&dword_245CD0000, v4, OS_LOG_TYPE_INFO, "Media events collection is %{public, BOOL}i for %{private}@", (uint8_t *)v7, 0x12u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, _MergedGlobals_0);
  return result;
}

uint64_t __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = qword_254419A68;
  if (os_log_type_enabled((os_log_t)qword_254419A68, OS_LOG_TYPE_ERROR))
  {
    v6 = 138477827;
    v7 = a2;
    _os_log_error_impl(&dword_245CD0000, v4, OS_LOG_TYPE_ERROR, "Failed to set up connection with mediaEventsHelper sevice because of %{private}@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = qword_254419A68;
    if (os_log_type_enabled((os_log_t)qword_254419A68, OS_LOG_TYPE_ERROR))
    {
      v7 = 138477827;
      v8 = a3;
      _os_log_error_impl(&dword_245CD0000, v5, OS_LOG_TYPE_ERROR, "Failed to get media events stream authorization status because of %{private}@", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
