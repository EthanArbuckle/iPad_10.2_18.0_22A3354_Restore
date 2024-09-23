@implementation SS

uint64_t __SS_SendStatusBarTapToScreenSharingServer_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
}

void __SS_SendStatusBarTapToScreenSharingServer_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  NSLog(CFSTR("connect failed: %@ / %d"), v4, v3);
}

@end
