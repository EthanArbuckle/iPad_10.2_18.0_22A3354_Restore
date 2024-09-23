@implementation SiriNLUOverridesClient

+ (void)clearCache
{
  objc_msgSend(MEMORY[0x24BDD1798], "resetCache");
  +[RegexOverrideCache reset](_TtC16SiriNLUOverrides18RegexOverrideCache, "reset");
}

@end
