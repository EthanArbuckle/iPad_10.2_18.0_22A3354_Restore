@implementation PXCPLCloudQuotaSource

- (PXCPLCloudQuotaSource)init
{
  PXCPLCloudQuotaSource *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PXCPLCloudQuotaSource *result;
  void *v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v12.receiver = self;
  v12.super_class = (Class)PXCPLCloudQuotaSource;
  v2 = -[PXCPLCloudQuotaSource init](&v12, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (uint64_t)&v13;
  v15 = 0x2020000000;
  v4 = (_QWORD *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  v16 = (void *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  if (!getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr)
  {
    v5 = iCloudQuotaUILibrary_136786();
    v4 = dlsym(v5, "ICQCurrentInAppMessageChangedNotification");
    *(_QWORD *)(v14 + 24) = v4;
    getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v13, 8);
  if (v4)
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_currentInAppMessageDidChange_, *v4, 0);

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v6 = (void *)getICQInAppMessagingClass_softClass;
    v21 = getICQInAppMessagingClass_softClass;
    if (!getICQInAppMessagingClass_softClass)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = (uint64_t)__getICQInAppMessagingClass_block_invoke;
      v16 = &unk_1E51482E0;
      v17 = &v18;
      __getICQInAppMessagingClass_block_invoke((uint64_t)&v13);
      v6 = (void *)v19[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v7, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "observeUpdates");

    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICQCurrentInAppMessageChangedNotification(void)");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXCPLCloudQuotaSource.m"), 24, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)setState:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXCPLCloudQuotaSource signalChange:](self, "signalChange:", 1);
  }
}

- (void)setCustomTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *customTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = self->_customTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      customTitle = self->_customTitle;
      self->_customTitle = v6;

      -[PXCPLCloudQuotaSource signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setCustomMessage:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *customMessage;
  NSString *v8;

  v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = self->_customMessage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      customMessage = self->_customMessage;
      self->_customMessage = v6;

      -[PXCPLCloudQuotaSource signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setCustomActionTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *customActionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = self->_customActionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      customActionTitle = self->_customActionTitle;
      self->_customActionTitle = v6;

      -[PXCPLCloudQuotaSource signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)_handleInAppMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  objc_msgSend(v4, "reason");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = 0;
    goto LABEL_14;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v6 = (_QWORD *)getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
  v34 = getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
  if (!getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr)
  {
    v7 = iCloudQuotaUILibrary_136786();
    v6 = dlsym(v7, "ICQUIInAppMessageReasoniCloudAlmostFull");
    v32[3] = (uint64_t)v6;
    getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v31, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICQUIInAppMessageReasoniCloudAlmostFull(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCPLCloudQuotaSource.m"), 28, CFSTR("%s"), dlerror());
LABEL_26:

    __break(1u);
    return;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *v6) & 1) != 0)
  {
    v8 = 1;
    goto LABEL_14;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v9 = (_QWORD *)getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
  v34 = getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
  if (!getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr)
  {
    v10 = iCloudQuotaUILibrary_136786();
    v9 = dlsym(v10, "ICQUIInAppMessageReasoniCloudFull");
    v32[3] = (uint64_t)v9;
    getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v31, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICQUIInAppMessageReasoniCloudFull(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCPLCloudQuotaSource.m"), 30, CFSTR("%s"), dlerror());
    goto LABEL_26;
  }
  if (objc_msgSend(v5, "isEqualToString:", *v9))
    v8 = 2;
  else
    v8 = 0;
LABEL_14:

  objc_msgSend(v4, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    v12 = v11;
  else
    v12 = 0;

  objc_msgSend(v4, "subTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    v14 = v13;
  else
    v14 = 0;

  objc_msgSend(v4, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
    v18 = v17;
  else
    v18 = 0;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__PXCPLCloudQuotaSource__handleInAppMessage___block_invoke;
  v25[3] = &unk_1E512C630;
  v25[4] = self;
  v26 = v12;
  v27 = v14;
  v28 = v18;
  v29 = v5;
  v30 = v8;
  v19 = v5;
  v20 = v18;
  v21 = v14;
  v22 = v12;
  -[PXCPLCloudQuotaSource performChanges:](self, "performChanges:", v25);

}

- (void)currentInAppMessageDidChange:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getICQInAppMessageKeySymbolLoc_ptr;
  v14 = getICQInAppMessageKeySymbolLoc_ptr;
  if (!getICQInAppMessageKeySymbolLoc_ptr)
  {
    v7 = iCloudQuotaUILibrary_136786();
    v6 = dlsym(v7, "ICQInAppMessageKey");
    v12[3] = (uint64_t)v6;
    getICQInAppMessageKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCPLCloudQuotaSource _handleInAppMessage:](self, "_handleInAppMessage:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICQInAppMessageKey(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCPLCloudQuotaSource.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customActionTitle
{
  return self->_customActionTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActionTitle, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
}

void __45__PXCPLCloudQuotaSource__handleInAppMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  __CFString *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCustomTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCustomMessage:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCustomActionTitle:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "currentChanges"))
  {
    if (*(_QWORD *)(a1 + 72))
    {
      PLUserStatusGetLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 72);
        if (v4 > 2)
          v5 = 0;
        else
          v5 = off_1E51433F8[v4];
        v13 = v5;
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(_QWORD *)(a1 + 56);
        v18 = 138544386;
        v19 = v3;
        v20 = 2114;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        v24 = 2114;
        v25 = v15;
        v26 = 2114;
        v27 = v16;
        _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ HANDLE message with state: \"%{public}@\", custom title: \"%{public}@\", message: \"%{public}@\", action title: \"%{public}@\", (uint8_t *)&v18, 0x34u);

      }
      goto LABEL_14;
    }
    v6 = *(_QWORD *)(a1 + 64);
    PLUserStatusGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(__CFString **)(a1 + 64);
        v18 = 138543618;
        v19 = v8;
        v20 = 2114;
        v21 = v9;
        v10 = "%{public}@ IGNORE message with reason: \"%{public}@\";
        v11 = v2;
        v12 = 22;
LABEL_13:
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, v12);
      }
    }
    else if (v7)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v17;
      v10 = "%{public}@ CLEAR message";
      v11 = v2;
      v12 = 12;
      goto LABEL_13;
    }
LABEL_14:

  }
}

@end
