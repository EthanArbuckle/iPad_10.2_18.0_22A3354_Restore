@implementation PPSPerformanceMetrics

+ (id)subsystem
{
  return CFSTR("PerformanceMetrics");
}

+ (id)allDeclMetrics
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
}

@end
