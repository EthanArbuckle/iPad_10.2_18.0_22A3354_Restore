@implementation PLLogBH

void __PLLogBH_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "batteryhealth");
  v1 = (void *)qword_1ED8878B0;
  qword_1ED8878B0 = (uint64_t)v0;

}

@end
