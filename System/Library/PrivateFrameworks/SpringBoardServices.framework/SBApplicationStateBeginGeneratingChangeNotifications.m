@implementation SBApplicationStateBeginGeneratingChangeNotifications

void __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke_2;
  block[3] = &unk_1E288DFC0;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SBApplicationNotificationStateChanged"), 0, *(_QWORD *)(a1 + 32));

}

@end
