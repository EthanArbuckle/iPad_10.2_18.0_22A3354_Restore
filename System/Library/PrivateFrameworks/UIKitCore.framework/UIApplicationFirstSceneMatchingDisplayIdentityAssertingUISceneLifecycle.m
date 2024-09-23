@implementation UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle

void ____UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  if (v9 && objc_msgSend(v9, "isEqual:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
