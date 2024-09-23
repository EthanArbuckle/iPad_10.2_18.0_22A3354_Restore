@implementation UIAccessibilityBroadcastNotificationFunction

void ___UIAccessibilityBroadcastNotificationFunction_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_QueuedNotificationsLock, "lock");
  v2 = (void *)_QueuedNotifications;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend((id)_QueuedNotificationsLock, "unlock");
  v4 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v4 != 4002)
    goto LABEL_4;
  if (_AXSAutomationEnabled())
  {
    v4 = *(unsigned int *)(a1 + 48);
LABEL_4:
    _UIAXBroadcastMainThread(v4, *(void **)(a1 + 32), *(void **)(a1 + 40));
    return;
  }
  AXRuntimeLogNotifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v9[0] = 67109378;
    v9[1] = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_INFO, "Did not post because UIA is not enabled: %d data: %{public}@", (uint8_t *)v9, 0x12u);
  }

  v8 = (void *)_UIAXAssociatedElementContextForNextNotification;
  _UIAXAssociatedElementContextForNextNotification = 0;

}

@end
