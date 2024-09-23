@implementation SFDashboardClient

uint64_t __SFDashboardClient_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D1B358]);
  v1 = (void *)SFDashboardClient_client;
  SFDashboardClient_client = (uint64_t)v0;

  return objc_msgSend((id)SFDashboardClient_client, "activate");
}

@end
