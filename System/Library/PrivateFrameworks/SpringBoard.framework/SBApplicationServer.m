@implementation SBApplicationServer

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 0:
      -[SBApplicationServer _handleHarmonyFetchWhitePointAdaptivityStyleMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 1:
      -[SBApplicationServer _handleShortcutFetchApplicationShortcutItemsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 2:
      -[SBApplicationServer _handleShortcutUpdateDynamicApplicationShortcutItemsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 3:
      -[SBApplicationServer _handleDeleteApplicationSnapshots:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 4:
      -[SBApplicationServer _handleMultiwindowShortcutShowAllWindowsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 5:
      -[SBApplicationServer _handleMultiwindowShortcutRequestShelfPresentationMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    default:
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBApplicationServer noteDidReceiveMessage:withType:fromClient:].cold.1((uint64_t)self, v9, v10);

      break;
  }

}

- (void)_handleShortcutFetchApplicationShortcutItemsMessage:(void *)a3 fromClient:
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke;
    v13[3] = &unk_1E8EA7130;
    v7 = v5;
    v14 = v7;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v13);
    objc_msgSend(v7, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (WeakRetained)
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationServer:client:fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletion:", a1, v6, xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x1E0DABFC8]), v12, v8);

      }
      else
      {
        v8[2](v8, 0);
      }

    }
    else
    {
      v8[2](v8, 0);
    }

  }
}

void __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

- (void)_handleShortcutUpdateDynamicApplicationShortcutItemsMessage:(void *)a3 fromClient:
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (a1)
  {
    objc_msgSend(a2, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (WeakRetained)
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationServer:client:setDynamicApplicationShortcutItems:forBundleIdentifier:", a1, v10, v9, v8);

      }
    }

  }
}

uint64_t __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke_2()
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_78);
  return (id)sharedInstance___sharedInstance_6;
}

void __37__SBApplicationServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBApplicationServer _init]([SBApplicationServer alloc]);
  v1 = (void *)sharedInstance___sharedInstance_6;
  sharedInstance___sharedInstance_6 = (uint64_t)v0;

}

- (id)_init
{
  id v1;
  void *v2;
  void *Serial;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0D23258];
    Serial = (void *)BSDispatchQueueCreateSerial();
    objc_msgSend(v2, "queueWithDispatchQueue:", Serial);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *MEMORY[0x1E0DAB560];
    v7.receiver = v1;
    v7.super_class = (Class)SBApplicationServer;
    v1 = objc_msgSendSuper2(&v7, sel_initWithIdentifier_queue_, v5, v4);

  }
  return v1;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationServer.m"), 40, CFSTR("you can't deallocate the server"));

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationServer;
  -[FBSServiceFacility dealloc](&v5, sel_dealloc);
}

- (void)_handleDeleteApplicationSnapshots:(void *)a3 fromClient:
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  if (a1)
  {
    objc_msgSend(a2, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      if (WeakRetained)
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationServer:client:deleteSnapshotsForApplicationIdentifier:", a1, v9, v8);

      }
    }

  }
}

- (void)_handleHarmonyFetchWhitePointAdaptivityStyleMessage:(void *)a3 fromClient:
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke;
    v12[3] = &unk_1E8EA2880;
    v7 = v5;
    v13 = v7;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v12);
    objc_msgSend(v7, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      if (WeakRetained)
        objc_msgSend(WeakRetained, "applicationServer:client:fetchWhitePointAdaptivityStyleForDisplayId:withCompletion:", a1, v6, xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x1E0DABF90]), v8);
      else
        v8[2](v8, -1);

    }
    else
    {
      v8[2](v8, -1);
    }

  }
}

- (void)_handleMultiwindowShortcutShowAllWindowsMessage:(void *)a3 fromClient:
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  if (a1)
  {
    objc_msgSend(a2, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      if (WeakRetained)
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationServer:client:showAllWindowsForBundleIdentifier:", a1, v9, v8);

      }
    }

  }
}

- (void)_handleMultiwindowShortcutRequestShelfPresentationMessage:(void *)a3 fromClient:
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  if (a1)
  {
    objc_msgSend(a2, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      if (WeakRetained)
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationServer:client:requestShelfPresentationForSceneWithIdentifier:", a1, v9, v8);

      }
    }

  }
}

uint64_t __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DABF98], *(_QWORD *)(a1 + 32));
}

- (SBApplicationServerMiscDelegate)miscDelegate
{
  return (SBApplicationServerMiscDelegate *)objc_loadWeakRetained((id *)&self->_miscDelegate);
}

- (void)setMiscDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_miscDelegate, a3);
}

- (SBApplicationServerHarmonyDelegate)harmonyDelegate
{
  return (SBApplicationServerHarmonyDelegate *)objc_loadWeakRetained((id *)&self->_harmonyDelegate);
}

- (void)setHarmonyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_harmonyDelegate, a3);
}

- (SBApplicationServerShortcutDelegate)shortcutDelegate
{
  return (SBApplicationServerShortcutDelegate *)objc_loadWeakRetained((id *)&self->_shortcutDelegate);
}

- (void)setShortcutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shortcutDelegate, a3);
}

- (SBApplicationServerMultiwindowDelegate)multiwindowDelegate
{
  return (SBApplicationServerMultiwindowDelegate *)objc_loadWeakRetained((id *)&self->_multiwindowDelegate);
}

- (void)setMultiwindowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_multiwindowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_multiwindowDelegate);
  objc_destroyWeak((id *)&self->_shortcutDelegate);
  objc_destroyWeak((id *)&self->_harmonyDelegate);
  objc_destroyWeak((id *)&self->_miscDelegate);
}

- (void)noteDidReceiveMessage:(uint64_t)a1 withType:(void *)a2 fromClient:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] sent a message with an unknown format. Ignoring request.", (uint8_t *)&v8, 0x16u);

}

@end
