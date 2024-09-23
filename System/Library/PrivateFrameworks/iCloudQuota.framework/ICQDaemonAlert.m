@implementation ICQDaemonAlert

+ (void)dismissAlertsWithNotificationID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1)
  {
    dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
    if (v4)
      goto LABEL_3;
LABEL_14:
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "dismissing all alerts", (uint8_t *)&v12, 2u);
    }

    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "lock");
    v10 = objc_msgSend((id)_ICQDaemonAlertMemoryDict, "copy");
    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_59);
    goto LABEL_17;
  }
  if (!v3)
    goto LABEL_14;
LABEL_3:
  objc_msgSend((id)_ICQDaemonAlertMemoryLock, "lock");
  objc_msgSend((id)_ICQDaemonAlertMemoryDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_8:
    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v12) = 138412290;
      *(_QWORD *)((char *)&v12 + 4) = v4;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "dismissing alert for notification %@", (uint8_t *)&v12, 0xCu);
    }

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = ___ICQDismissAlertsWithNotificationID_block_invoke;
    v14 = &unk_1E8B38A58;
    v15 = v5;
    v10 = v5;
    dispatch_async(v9, &v12);

    goto LABEL_17;
  }
  objc_msgSend((id)_ICQDaemonAlertMemoryDict, "objectForKey:", &stru_1E8B3C468);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5 = (void *)v6;
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v12) = 138412290;
      *(_QWORD *)((char *)&v12 + 4) = v4;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Could not find alert for notification %@, dismissing unlabeled alert", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_8;
  }
  objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12) = 138412290;
    *(_QWORD *)((char *)&v12 + 4) = v4;
    _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Could not find alert for notification %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_17:

}

+ (BOOL)shouldShowForDaemonOffer:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "alertSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "level") != 0;
  else
    v5 = 0;

  return v5;
}

- (ICQDaemonAlert)init
{
  NSObject *v3;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "attempt to create alert with nil daemonOffer", v5, 2u);
  }

  return 0;
}

- (ICQDaemonAlert)initWithDaemonOffer:(id)a3
{
  id v5;
  ICQDaemonAlert *v6;
  ICQDaemonAlert *v7;
  uint64_t v8;
  NSLock *alertLock;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *alertSema;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *alertQueue;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "shouldShowForDaemonOffer:", v5) & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)ICQDaemonAlert;
    v6 = -[ICQDaemonAlert init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_alertState = 0;
      v8 = objc_opt_new();
      alertLock = v7->_alertLock;
      v7->_alertLock = (NSLock *)v8;

      -[NSLock setName:](v7->_alertLock, "setName:", CFSTR("ICQDaemonAlertLock"));
      v10 = dispatch_semaphore_create(0);
      alertSema = v7->_alertSema;
      v7->_alertSema = (OS_dispatch_semaphore *)v10;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("ICQDaemonAlertQueue", v12);
      alertQueue = v7->_alertQueue;
      v7->_alertQueue = (OS_dispatch_queue *)v13;

      objc_storeStrong((id *)&v7->_daemonOffer, a3);
      *(_WORD *)&v7->_showOnlyInSpringboard = 257;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "attempt to create alert for invalid daemonOffer %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  __CFUserNotification *cfAlert;
  objc_super v4;

  -[ICQDaemonAlert dismissAlert](self, "dismissAlert");
  cfAlert = self->_cfAlert;
  if (cfAlert)
    CFRelease(cfAlert);
  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonAlert;
  -[ICQDaemonAlert dealloc](&v4, sel_dealloc);
}

- (void)_handleLink:(id)a3
{
  objc_msgSend(a3, "performActionWithOptions:", 1);
}

- (BOOL)showAlertWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  -[NSLock lock](self->_alertLock, "lock");
  if (!self->_alertState)
  {
    -[ICQDaemonAlert daemonOffer](self, "daemonOffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke;
      v13[3] = &unk_1E8B38F58;
      v13[4] = self;
      v14 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

      v9 = 1;
      goto LABEL_13;
    }
  }
  -[NSLock unlock](self->_alertLock, "unlock");
  if (self->_alertState)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "alert already shown; skipping";
LABEL_5:
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    -[ICQDaemonAlert daemonOffer](self, "daemonOffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_10;
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "alert not shown: no alert specification";
      goto LABEL_5;
    }
  }

LABEL_10:
  if (v4)
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, MEMORY[0x1E0C9AA70]);
  v9 = 0;
LABEL_13:

  return v9;
}

void __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  CFUserNotificationRef v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  id v49;
  CFUserNotificationRef v50;
  uint8_t buf[4];
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(id *)(a1 + 32);
  if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1)
    dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
  objc_msgSend(v2, "daemonOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E8B3C468;
  v7 = v6;

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v7;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "remember alert for notification %@", buf, 0xCu);
  }

  objc_msgSend((id)_ICQDaemonAlertMemoryLock, "lock");
  objc_msgSend((id)_ICQDaemonAlertMemoryDict, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v7;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "dismissing old alert for notification %@", buf, 0xCu);
    }

    objc_msgSend(v9, "dismissAlert");
    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "lock");
  }
  objc_msgSend((id)_ICQDaemonAlertMemoryDict, "setObject:forKey:", v2, v7);
  objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "daemonOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v13, "disableLockScreenAlert");
    v16 = CFSTR(" (but not on lock screen)");
    if (!v15)
      v16 = &stru_1E8B3C468;
    *(_DWORD *)buf = 138412290;
    v52 = v16;
    _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "showing alert for daemonOffer%@", buf, 0xCu);
  }

  objc_msgSend(v13, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B800]);

  objc_msgSend(v13, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "altMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOffer stringWithPlaceholderFormat:alternateString:](ICQDaemonOffer, "stringWithPlaceholderFormat:alternateString:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0C9B810]);

  objc_msgSend(v13, "linkForButtonIndex:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "linkForButtonIndex:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "linkForButtonIndex:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0C9B830]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0C9B868]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0C9B838]);
  v27 = objc_msgSend(v13, "defaultButtonIndex");
  if ((unint64_t)(v27 - 1) > 2)
    v28 = &unk_1E8B51828;
  else
    v28 = (void *)qword_1E8B39890[v27 - 1];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0DABB78]);
  if (objc_msgSend(v13, "disableLockScreenAlert"))
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DABB98]);
  }
  else
  {
    objc_msgSend(v13, "lockScreenMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(v13, "message");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;

    objc_msgSend(v13, "altLockScreenMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(v13, "altMessage");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = v35;

    +[ICQDaemonOffer stringWithPlaceholderFormat:alternateString:](ICQDaemonOffer, "stringWithPlaceholderFormat:alternateString:", v32, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0DABC28]);

    objc_msgSend(v13, "lockScreenTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0DABC18]);
    }
    else
    {
      objc_msgSend(v13, "title");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0DABC18]);

    }
  }
  v40 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0DABBB0]);
  if (objc_msgSend(*(id *)(a1 + 32), "showOnlyInSpringboard"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E8B55330, *MEMORY[0x1E0DABB20]);
  v41 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 32 * (v26 == 0), 0, (CFDictionaryRef)v11);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v41;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
  v42 = *(_QWORD *)(a1 + 32);
  v43 = *(void **)(a1 + 40);
  v44 = *(NSObject **)(v42 + 40);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke_12;
  v46[3] = &unk_1E8B39810;
  v50 = v41;
  v47 = v13;
  v48 = v42;
  v49 = v43;
  v45 = v13;
  dispatch_async(v44, v46);

}

void __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  if (responseFlags <= 2
    && (objc_msgSend(*(id *)(a1 + 32), "linkForButtonIndex:", qword_1CDF39130[responseFlags]),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    if (objc_msgSend(*(id *)(a1 + 40), "handleActionsBeforeCallingCompletionHandler"))
      objc_msgSend(*(id *)(a1 + 40), "_handleLink:", v3);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      v5 = objc_msgSend(v3, "action");
      objc_msgSend(v3, "parameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, MEMORY[0x1E0C9AA70]);
    v3 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "lock");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 3;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(const void **)(v10 + 24);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = 0;
    v10 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(v10 + 8), "unlock");
  if (v9 == 2)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 32));

}

- (void)dismissAlert
{
  NSObject *v3;
  ICQDaemonAlert *v4;
  ICQDaemonAlert *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  __CFUserNotification *cfAlert;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  ICQDaemonAlert *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQDaemonAlert daemonOffer](self, "daemonOffer");
    v4 = (ICQDaemonAlert *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "dismissing alert for daemonOffer %@", (uint8_t *)&v18, 0xCu);

  }
  -[NSLock lock](self->_alertLock, "lock");
  if (self->_alertState == 1)
  {
    self->_alertState = 2;
    v5 = self;
    if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1)
      dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
    -[ICQDaemonAlert daemonOffer](v5, "daemonOffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E8B3C468;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = (ICQDaemonAlert *)v10;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "forget alert for notification %@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "lock");
    objc_msgSend((id)_ICQDaemonAlertMemoryDict, "removeObjectForKey:", v10);
    objc_msgSend((id)_ICQDaemonAlertMemoryLock, "unlock");

    cfAlert = v5->_cfAlert;
    if (cfAlert)
      CFUserNotificationCancel(cfAlert);
    -[NSLock unlock](self->_alertLock, "unlock");
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "waiting for alert %@ to dismiss", (uint8_t *)&v18, 0xCu);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v5->_alertSema, 0xFFFFFFFFFFFFFFFFLL);
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v5;
      v15 = "finished waiting for alert %@ to dismiss";
      v16 = v14;
      v17 = 12;
LABEL_18:
      _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
  }
  else
  {
    -[NSLock unlock](self->_alertLock, "unlock");
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v15 = "alert not showing; skipping dismiss";
      v16 = v14;
      v17 = 2;
      goto LABEL_18;
    }
  }

}

- (ICQDaemonOffer)daemonOffer
{
  return self->_daemonOffer;
}

- (BOOL)showOnlyInSpringboard
{
  return self->_showOnlyInSpringboard;
}

- (void)setShowOnlyInSpringboard:(BOOL)a3
{
  self->_showOnlyInSpringboard = a3;
}

- (BOOL)handleActionsBeforeCallingCompletionHandler
{
  return self->_handleActionsBeforeCallingCompletionHandler;
}

- (void)setHandleActionsBeforeCallingCompletionHandler:(BOOL)a3
{
  self->_handleActionsBeforeCallingCompletionHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonOffer, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_alertSema, 0);
  objc_storeStrong((id *)&self->_alertLock, 0);
}

@end
