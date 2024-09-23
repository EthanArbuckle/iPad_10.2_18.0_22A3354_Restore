@implementation PLLogUrsa

void __PLLogUrsa_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "Ursa");
  v1 = (void *)qword_1ED883460;
  qword_1ED883460 = (uint64_t)v0;

}

@end
