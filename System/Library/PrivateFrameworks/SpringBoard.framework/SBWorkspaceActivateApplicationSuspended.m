@implementation SBWorkspaceActivateApplicationSuspended

void __SBWorkspaceActivateApplicationSuspended_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SBWorkspaceActivateApplicationSuspended_block_invoke_2;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __SBWorkspaceActivateApplicationSuspended_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 1);

}

@end
