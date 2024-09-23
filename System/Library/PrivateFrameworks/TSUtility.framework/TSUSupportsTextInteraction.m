@implementation TSUSupportsTextInteraction

uint64_t __TSUSupportsTextInteraction_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_opt_class();
  v1 = (void *)TSUDynamicCast(v0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("TSUTextInteraction")));
  if (v1)
    result = objc_msgSend(v1, "BOOLValue");
  else
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.iBooks")) ^ 1;
  TSUSupportsTextInteraction_supportTextInteraction = result;
  return result;
}

@end
