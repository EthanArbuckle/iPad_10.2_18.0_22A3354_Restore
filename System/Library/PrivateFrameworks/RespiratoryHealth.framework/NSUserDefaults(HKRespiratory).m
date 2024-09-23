@implementation NSUserDefaults(HKRespiratory)

+ (id)hkrp_respiratoryDefaults
{
  id v0;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  return (id)objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x24BDD36F0]);
}

@end
