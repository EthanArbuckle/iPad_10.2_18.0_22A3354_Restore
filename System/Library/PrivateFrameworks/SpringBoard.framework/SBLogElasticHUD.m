@implementation SBLogElasticHUD

void __SBLogElasticHUD_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "ElasticHUD");
  v1 = (void *)SBLogElasticHUD___logObj;
  SBLogElasticHUD___logObj = (uint64_t)v0;

}

@end
