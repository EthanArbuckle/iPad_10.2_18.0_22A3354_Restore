@implementation VGLogSharedInstance

void ____VGLogSharedInstance_block_invoke()
{
  id v0;
  const char *v1;
  os_log_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "vg_bundleIdentifier");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v0, "UTF8String");

  v2 = os_log_create(v1, "Visage");
  v3 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v2;

}

@end
