@implementation WLKRetryOnBackgroundTimeOutJSOverride

void __WLKRetryOnBackgroundTimeOutJSOverride_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
  objc_msgSend(v2, "objectForKey:", CFSTR("RetryOnLongBackgroundedTimeOut"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    NSLog(CFSTR("WLKRetryOnBackgroundTimeOutOverride: %@"), v0);
    objc_storeStrong((id *)&WLKRetryOnBackgroundTimeOutJSOverride_retVal, v1);
  }

}

@end
