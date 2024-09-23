@implementation SUBaseAlertItem

- (SUBaseAlertItem)init
{
  SUBaseAlertItem *v2;
  SUBaseAlertItem *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *stateQ;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUBaseAlertItem;
  v2 = -[SUBaseAlertItem init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isUILocked = 0;
    v2->_notification = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.sus.alertItem.stateQ", v4);
    stateQ = v3->_stateQ;
    v3->_stateQ = (OS_dispatch_queue *)v5;

    objc_storeWeak((id *)&v3->_manager, 0);
  }
  return v3;
}

- (void)dealloc
{
  OS_dispatch_queue *stateQ;
  objc_super v4;

  stateQ = self->_stateQ;
  self->_notification = 0;
  self->_stateQ = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUBaseAlertItem;
  -[SUBaseAlertItem dealloc](&v4, sel_dealloc);
}

- (BOOL)present
{
  SUBaseAlertItem *v2;
  NSObject *stateQ;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQ = v2->_stateQ;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__SUBaseAlertItem_present__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQ, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __26__SUBaseAlertItem_present__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_createNotification");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)update
{
  SUBaseAlertItem *v2;
  NSObject *stateQ;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQ = v2->_stateQ;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__SUBaseAlertItem_update__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQ, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __25__SUBaseAlertItem_update__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateNotification");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dismiss
{
  NSObject *stateQ;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  stateQ = self->_stateQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SUBaseAlertItem_dismiss__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQ, block);
}

uint64_t __26__SUBaseAlertItem_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelNotification");
}

- (void)willPresentAlert
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SULogAlerts();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v10, CFSTR("[%@] willPresentAlert"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);

}

- (void)alertWasDismissed:(unint64_t)a3
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SULogAlerts();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v11, CFSTR("[%@] was dismissed for %ld"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

}

- (id)title
{
  return CFSTR("SUBaseAlertItem Default Title");
}

- (id)message
{
  return 0;
}

- (id)buttons
{
  return 0;
}

- (id)contentExtensionID
{
  return 0;
}

- (id)extensionDictionary
{
  return 0;
}

- (BOOL)shouldShowCountdown
{
  return 0;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)showButtonsOnLockScreen
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (id)allowedApps
{
  return 0;
}

- (BOOL)_createNotification
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  CFOptionFlags v11;
  const __CFDictionary *v12;
  void *v13;
  __CFUserNotification *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD block[5];
  id v33;
  __CFUserNotification *v34;
  SInt32 error;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  if (self->_notification)
  {
    SULogAlerts();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v3, CFSTR("%@ is being presented for %@. Dismiss it first"), v4, v5, v6, v7, v8, v9, (uint64_t)self->_notification);

    return 0;
  }
  else
  {
    -[SUBaseAlertItem willPresentAlert](self, "willPresentAlert");
    v11 = -[SUBaseAlertItem _notificationFlags](self, "_notificationFlags");
    -[SUBaseAlertItem _notificationOptions](self, "_notificationOptions");
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[SUBaseAlertItem _notificationButtonActions](self, "_notificationButtonActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    error = -1;
    v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, v11, &error, v12);
    SULogAlerts();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    SULogDebugForSubsystem(v15, CFSTR("created %@ for %@ with error %ld"), v16, v17, v18, v19, v20, v21, (uint64_t)v14);

    if (v14)
      v22 = error == 0;
    else
      v22 = 0;
    v10 = v22;
    if (v22)
    {
      self->_notification = v14;
      dispatch_get_global_queue(33, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__SUBaseAlertItem__createNotification__block_invoke;
      block[3] = &unk_24CE3B660;
      v34 = v14;
      block[4] = self;
      v33 = v13;
      dispatch_async(v23, block);

    }
    else
    {
      SULogAlerts();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v24, CFSTR("failed to display notification: %ld"), v25, v26, v27, v28, v29, v30, error);

      if (v14)
        CFRelease(v14);
    }

  }
  return v10;
}

void __38__SUBaseAlertItem__createNotification__block_invoke(uint64_t a1)
{
  SInt32 v2;
  SInt32 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  CFDictionaryRef ResponseDictionary;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[5];
  id v83;
  uint64_t v84;
  _QWORD v85[5];
  void *v86;
  uint64_t v87;
  _QWORD v88[5];
  void *v89;
  uint64_t v90;
  _QWORD v91[5];
  void *v92;
  uint64_t v93;
  _QWORD v94[5];
  void *v95;
  uint64_t v96;
  _QWORD block[5];
  void *v98;
  uint64_t v99;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  if (v2)
  {
    v3 = v2;
    SULogAlerts();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v4, CFSTR("failed to get response from CFUserNotification: %ld"), v5, v6, v7, v8, v9, v10, v3);

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__SUBaseAlertItem__createNotification__block_invoke_2;
    block[3] = &unk_24CE3BB88;
    v13 = *(_QWORD *)(a1 + 48);
    v98 = 0;
    v99 = v13;
    block[4] = v11;
    dispatch_async(v12, block);
    v14 = v98;
  }
  else if ((~(_BYTE)responseFlags & 3) != 0)
  {
    ResponseDictionary = CFUserNotificationGetResponseDictionary(*(CFUserNotificationRef *)(a1 + 48));
    v26 = (void *)CFRetain(ResponseDictionary);
    v14 = v26;
    if (v26)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BEB0DA0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      SULogAlerts();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v28;
      if (v27)
      {
        v36 = objc_msgSend(v27, "unsignedIntegerValue");
        SULogInfoForSubsystem(v35, CFSTR("User clicked button index %ld"), v37, v38, v39, v40, v41, v42, v36);

        v43 = objc_msgSend(v27, "unsignedIntegerValue");
        if (v43 >= objc_msgSend(*(id *)(a1 + 40), "count"))
        {
          SULogAlerts();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfoForSubsystem(v70, CFSTR("index does not match any button"), v71, v72, v73, v74, v75, v76, v81);

          v77 = *(_QWORD *)(a1 + 32);
          v78 = *(NSObject **)(v77 + 16);
          v85[0] = MEMORY[0x24BDAC760];
          v85[1] = 3221225472;
          v85[2] = __38__SUBaseAlertItem__createNotification__block_invoke_6;
          v85[3] = &unk_24CE3BB88;
          v79 = *(_QWORD *)(a1 + 48);
          v86 = 0;
          v87 = v79;
          v85[4] = v77;
          dispatch_async(v78, v85);
          v56 = v86;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v27, "integerValue"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
          {
            SULogAlerts();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v27, "unsignedIntegerValue");
            SULogInfoForSubsystem(v45, CFSTR("No action registered for button %ld"), v47, v48, v49, v50, v51, v52, v46);

          }
          v53 = *(_QWORD *)(a1 + 32);
          v54 = *(NSObject **)(v53 + 16);
          v82[0] = MEMORY[0x24BDAC760];
          v82[1] = 3221225472;
          v82[2] = __38__SUBaseAlertItem__createNotification__block_invoke_7;
          v82[3] = &unk_24CE3BB88;
          v55 = *(_QWORD *)(a1 + 48);
          v83 = v44;
          v84 = v55;
          v82[4] = v53;
          v56 = v44;
          dispatch_async(v54, v82);

        }
      }
      else
      {
        SULogInfoForSubsystem(v28, CFSTR("failed to get button index from response dictionary"), v29, v30, v31, v32, v33, v34, v80);

        v67 = *(_QWORD *)(a1 + 32);
        v68 = *(NSObject **)(v67 + 16);
        v88[0] = MEMORY[0x24BDAC760];
        v88[1] = 3221225472;
        v88[2] = __38__SUBaseAlertItem__createNotification__block_invoke_5;
        v88[3] = &unk_24CE3BB88;
        v69 = *(_QWORD *)(a1 + 48);
        v89 = 0;
        v90 = v69;
        v88[4] = v67;
        dispatch_async(v68, v88);
        v56 = v89;
      }

    }
    else
    {
      SULogAlerts();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v57, CFSTR("failed to get response dictionary from CFUserNotification: %ld"), v58, v59, v60, v61, v62, v63, 0);

      v64 = *(_QWORD *)(a1 + 32);
      v65 = *(NSObject **)(v64 + 16);
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __38__SUBaseAlertItem__createNotification__block_invoke_4;
      v91[3] = &unk_24CE3BB88;
      v66 = *(_QWORD *)(a1 + 48);
      v92 = 0;
      v93 = v66;
      v91[4] = v64;
      dispatch_async(v65, v91);
      v27 = v92;
    }

  }
  else
  {
    SULogAlerts();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v15, CFSTR("notification was canceled (alert = %@)"), v16, v17, v18, v19, v20, v21, *(_QWORD *)(a1 + 32));

    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(NSObject **)(v22 + 16);
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __38__SUBaseAlertItem__createNotification__block_invoke_3;
    v94[3] = &unk_24CE3BB88;
    v24 = *(_QWORD *)(a1 + 48);
    v95 = 0;
    v96 = v24;
    v94[4] = v22;
    dispatch_async(v23, v94);
    v14 = v95;
  }

}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 0);
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 2);
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 0);
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 0);
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 0);
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_notificationWasDismissed:", 1);
}

- (BOOL)_updateNotification
{
  CFOptionFlags v3;
  void *v4;
  SInt32 v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  if (!self->_notification)
  {
    SULogAlerts();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v4, CFSTR("No notification for %@"), v14, v15, v16, v17, v18, v19, (uint64_t)self);
    goto LABEL_5;
  }
  v3 = -[SUBaseAlertItem _notificationFlags](self, "_notificationFlags");
  -[SUBaseAlertItem _notificationOptions](self, "_notificationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFUserNotificationUpdate(self->_notification, 0.0, v3, (CFDictionaryRef)v4);
  v6 = v5 == 0;
  if (v5)
  {
    SULogAlerts();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v7, CFSTR("Failed to update %@ for %@"), v8, v9, v10, v11, v12, v13, (uint64_t)self->_notification);

LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (void)_cancelNotification
{
  __CFUserNotification *notification;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  notification = self->_notification;
  if (notification)
    CFUserNotificationCancel(notification);
}

- (void)_notificationWasDismissed:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SULogAlerts();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v5, CFSTR("notification was dismissed for %ld"), v6, v7, v8, v9, v10, v11, a3);

  -[SUBaseAlertItem alertWasDismissed:](self, "alertWasDismissed:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "_noteAlertDeactivated:", self);

}

- (id)buildAlertItemDefinition
{
  SUAlertItemDefinition *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(SUAlertItemDefinition);
  -[SUBaseAlertItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAlertItemDefinition setTitle:](v3, "setTitle:", v4);

  -[SUBaseAlertItem message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAlertItemDefinition setMessage:](v3, "setMessage:", v5);

  -[SUBaseAlertItem buttons](self, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAlertItemDefinition setButtons:](v3, "setButtons:", v6);

  return v3;
}

- (id)_notificationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUBaseAlertItem buildAlertItemDefinition](self, "buildAlertItemDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDBD6D8]);

  }
  -[SUBaseAlertItem contentExtensionID](self, "contentExtensionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUBaseAlertItem contentExtensionID](self, "contentExtensionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BEB0E60]);

    -[SUBaseAlertItem extensionDictionary](self, "extensionDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDD1560]);
      -[SUBaseAlertItem extensionDictionary](self, "extensionDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserInfo:", v11);

      v12 = (void *)MEMORY[0x24BDD1618];
      v38[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BEB0E68]);

      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v4, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "message");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBD6E0]);
LABEL_10:

    }
  }
  -[SUBaseAlertItem _notificationButtons](self, "_notificationButtons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && objc_msgSend(v16, "count"))
  {
    -[SUBaseAlertItem _notificationButtons](self, "_notificationButtons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BEB0DA8]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem shouldShowInLockScreen](self, "shouldShowInLockScreen"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDBD6E8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SUBaseAlertItem reappearsAfterLock](self, "reappearsAfterLock") ^ 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BEB0E40]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem reappearsAfterUnlock](self, "reappearsAfterUnlock"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BEB0E58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem forcesModalAlertAppearance](self, "forcesModalAlertAppearance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BEB0E70]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem showButtonsOnLockScreen](self, "showButtonsOnLockScreen"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BEB0E48]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem allowInSetup](self, "allowInSetup"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BEB0DE8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem undimsScreen](self, "undimsScreen"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BEB0EC8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem allowLockScreenDismissal](self, "allowLockScreenDismissal"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BEB0DF0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUBaseAlertItem allowMenuButtonDismissal](self, "allowMenuButtonDismissal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BEB0E00]);

  -[SUBaseAlertItem allowedApps](self, "allowedApps");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SUBaseAlertItem allowedApps](self, "allowedApps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BEB0E08]);

  }
  SULogAlerts();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v30, CFSTR("notificationOptions %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v3);

  return v3;
}

- (unint64_t)_notificationFlags
{
  if (-[SUBaseAlertItem allowNoButton](self, "allowNoButton"))
    return 35;
  else
    return 3;
}

- (id)_notificationButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUBaseAlertItem buildAlertItemDefinition](self, "buildAlertItemDefinition");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BEB0AA8]);
        objc_msgSend(v9, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithTitle:", v11);

        objc_msgSend(v12, "setPresentationStyle:", -[SUBaseAlertItem _SBPresentationStyleForSUSPresentationStyle:](self, "_SBPresentationStyleForSUSPresentationStyle:", objc_msgSend(v9, "presentationStyle")));
        objc_msgSend(v12, "setIsPreferredButton:", objc_msgSend(v9, "isPreferredButton"));
        objc_msgSend(v12, "build");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (id)_notificationButtonActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUBaseAlertItem buildAlertItemDefinition](self, "buildAlertItemDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "buttons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "handler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (int)_SBPresentationStyleForSUSPresentationStyle:(unint64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (void)_setPresentationManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (void)setIsUILocked:(BOOL)a3
{
  self->_isUILocked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_stateQ, 0);
}

@end
