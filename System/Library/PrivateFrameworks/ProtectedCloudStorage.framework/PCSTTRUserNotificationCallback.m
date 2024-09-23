@implementation PCSTTRUserNotificationCallback

uint64_t __PCSTTRUserNotificationCallback_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)PCSTTRUserNotificationCallback_queryComponent;
  PCSTTRUserNotificationCallback_queryComponent = (uint64_t)v0;

  v2 = (void *)PCSTTRUserNotificationCallback_queryComponent;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  return objc_msgSend((id)PCSTTRUserNotificationCallback_queryComponent, "removeCharactersInString:", CFSTR("&"));
}

@end
