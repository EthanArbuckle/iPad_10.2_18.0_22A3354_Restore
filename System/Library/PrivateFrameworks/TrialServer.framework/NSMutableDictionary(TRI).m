@implementation NSMutableDictionary(TRI)

- (uint64_t)triKeys:()TRI values:
{
  return objc_msgSend(MEMORY[0x1E0C99D80], "triKeys:values:fromDictionary:", a3, a4, a1);
}

@end
