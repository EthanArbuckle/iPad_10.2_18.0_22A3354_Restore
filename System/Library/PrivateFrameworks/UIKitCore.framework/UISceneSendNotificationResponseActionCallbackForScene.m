@implementation UISceneSendNotificationResponseActionCallbackForScene

void ___UISceneSendNotificationResponseActionCallbackForScene_block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend((id)UIApp, "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
