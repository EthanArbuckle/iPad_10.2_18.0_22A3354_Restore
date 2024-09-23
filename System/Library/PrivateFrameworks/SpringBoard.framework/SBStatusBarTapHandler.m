@implementation SBStatusBarTapHandler

void __35___SBStatusBarTapHandler_handleTap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbDisplayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayConfiguration:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35___SBStatusBarTapHandler_handleTap__block_invoke_2;
  v8[3] = &unk_1E8E9ECA8;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v3, "modifyApplicationContext:", v8);

}

void __35___SBStatusBarTapHandler_handleTap__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  uint64_t v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;

  v3 = a2;
  v4 = [SBDeviceApplicationSceneEntity alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:uniqueIdentifier:](v4, "initWithApplicationForMainDisplay:uniqueIdentifier:", v5, v6);

  objc_msgSend(v3, "setEntity:forLayoutRole:", v7, 1);
}

@end
