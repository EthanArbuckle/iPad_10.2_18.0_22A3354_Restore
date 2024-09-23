@implementation TUPrivacyManager

+ (TUPrivacyManager)sharedPrivacyManager
{
  if (sharedPrivacyManager_onceToken != -1)
    dispatch_once(&sharedPrivacyManager_onceToken, &__block_literal_global_44);
  return (TUPrivacyManager *)(id)sharedPrivacyManager_privacyManager;
}

void __40__TUPrivacyManager_sharedPrivacyManager__block_invoke()
{
  TUPrivacyManager *v0;
  void *v1;

  v0 = objc_alloc_init(TUPrivacyManager);
  v1 = (void *)sharedPrivacyManager_privacyManager;
  sharedPrivacyManager_privacyManager = (uint64_t)v0;

}

- (TUPrivacyManager)init
{
  TUPrivacyManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUPrivacyManager;
  v2 = -[TUPrivacyManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleBlockListChanged_, *MEMORY[0x1E0D13278], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUPrivacyManager;
  -[TUPrivacyManager dealloc](&v4, sel_dealloc);
}

- (void)_handleBlockListChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__TUPrivacyManager__handleBlockListChanged___block_invoke;
  v3[3] = &unk_1E38A1360;
  v3[4] = self;
  TUGuaranteeExecutionOnMainThreadAsync(v3);
}

void __44__TUPrivacyManager__handleBlockListChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.TelephonyUtilities.TUPrivacyManager.RulesChanged"), *(_QWORD *)(a1 + 32), 0);

}

- (void)setBlockIncomingCommunication:(BOOL)a3 forPhoneNumber:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  const void *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "phoneNumberRef");
  v5 = CMFItemCreateWithPhoneNumber();
  if (v5)
  {
    v6 = (const void *)v5;
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)setBlockIncomingCommunication:(BOOL)a3 forEmailAddress:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  const void *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = CMFItemCreateWithEmailAddress();
  if (v5)
  {
    v6 = (const void *)v5;
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)setBlockIncomingCommunication:(BOOL)a3 forBusinessID:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  const void *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = CMFItemCreateWithBusinessID();
  if (v5)
  {
    v6 = (const void *)v5;
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)addRule:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "type");
  switch(v4)
  {
    case 2:
      objc_msgSend(v6, "businessID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forBusinessID:](self, "setBlockIncomingCommunication:forBusinessID:", 1, v5);
      goto LABEL_7;
    case 1:
      objc_msgSend(v6, "email");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forEmailAddress:](self, "setBlockIncomingCommunication:forEmailAddress:", 1, v5);
      goto LABEL_7;
    case 0:
      objc_msgSend(v6, "phoneNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forPhoneNumber:](self, "setBlockIncomingCommunication:forPhoneNumber:", 1, v5);
LABEL_7:

      break;
  }

}

- (void)removeRule:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "type");
  switch(v4)
  {
    case 2:
      objc_msgSend(v6, "businessID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forBusinessID:](self, "setBlockIncomingCommunication:forBusinessID:", 0, v5);
      goto LABEL_7;
    case 1:
      objc_msgSend(v6, "email");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forEmailAddress:](self, "setBlockIncomingCommunication:forEmailAddress:", 0, v5);
      goto LABEL_7;
    case 0:
      objc_msgSend(v6, "phoneNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPrivacyManager setBlockIncomingCommunication:forPhoneNumber:](self, "setBlockIncomingCommunication:forPhoneNumber:", 0, v5);
LABEL_7:

      break;
  }

}

- (BOOL)isIncomingCommunicationBlockedForPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "phoneNumberRef"), (v5 = CMFItemCreateWithPhoneNumber()) != 0))
  {
    v6 = (const void *)v5;
    v7 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isIncomingCommunicationBlockedForEmailAddress:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  BOOL v6;

  v3 = a3;
  if (v3 && (v4 = CMFItemCreateWithEmailAddress()) != 0)
  {
    v5 = (const void *)v4;
    v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isIncomingCommunicationBlockedForBusinessID:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  BOOL v6;

  v3 = a3;
  if (v3 && (v4 = CMFItemCreateWithBusinessID()) != 0)
  {
    v5 = (const void *)v4;
    v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isIncomingCommunicationBlockedForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const void *CMFItemFromString;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "value"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_stripFZIDPrefix"),
        CMFItemFromString = (const void *)CreateCMFItemFromString(),
        v5,
        CMFItemFromString))
  {
    v7 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(CMFItemFromString);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)privacyRules
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8[7] = 0;
  CMFBlockListCopyItemsForAllServicesService();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "CMFBlockListCopyItemsForAllServicesService = %@", buf, 0xCu);
  }

  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__TUPrivacyManager_privacyRules__block_invoke;
    v8[3] = &unk_1E38A39A0;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a2;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v9, 8);
  return (NSArray *)v6;
}

void __32__TUPrivacyManager_privacyRules__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  int Type;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Type = CMFItemGetType();
  switch(Type)
  {
    case 2:
      CMFItemCopyBusinessID();
      v7 = 0;
      v8 = v7;
      if (v7)
        CFRelease(v7);
      TUDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v3;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "CMFItemCopyBusinessID(%@) = %@", buf, 0x16u);
      }

      if (v8)
      {
        v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        +[TUPrivacyRule ruleForBusinessID:](TUPrivacyRule, "ruleForBusinessID:", v8);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v14 = (void *)v11;
        objc_msgSend(v10, "addObject:", v11);
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMFItemCopyBusinessID for item with type CMFItemTypeBusiness returned nothing!"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("** TUAssertion failure: %@"), v15);

      if (_TUAssertShouldCrashApplication())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v17 = a1[6];
        v18 = a1[4];
        v19 = CFSTR("CMFItemCopyBusinessID for item with type CMFItemTypeBusiness returned nothing!");
        v20 = 228;
LABEL_25:
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("TUPrivacyManager.m"), v20, v19);
        goto LABEL_26;
      }
LABEL_27:

      break;
    case 1:
      CMFItemCopyEmailAddress();
      v12 = 0;
      v8 = v12;
      if (v12)
        CFRelease(v12);
      TUDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v3;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "CMFItemCopyEmailAddress(%@) = %@", buf, 0x16u);
      }

      if (v8)
      {
        v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        +[TUPrivacyRule ruleForEmail:](TUPrivacyRule, "ruleForEmail:", v8);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMFItemCopyEmailAddress for item with type CMFItemTypeEmail returned nothing!"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("** TUAssertion failure: %@"), v21);

      if (_TUAssertShouldCrashApplication())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v17 = a1[6];
        v18 = a1[4];
        v19 = CFSTR("CMFItemCopyEmailAddress for item with type CMFItemTypeEmail returned nothing!");
        v20 = 214;
        goto LABEL_25;
      }
      goto LABEL_27;
    case 0:
      CMFItemCopyPhoneNumber();
      TUDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v3;
        v25 = 2112;
        v26 = 0;
        _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "CMFItemCopyPhoneNumber(%@) = %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMFItemCopyPhoneNumber for item with type CMFItemTypePhone returned nothing!"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("** TUAssertion failure: %@"), v6);

      if (_TUAssertShouldCrashApplication())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TUPrivacyManager.m"), 198, CFSTR("CMFItemCopyPhoneNumber for item with type CMFItemTypePhone returned nothing!"));

      }
      break;
  }

}

@end
