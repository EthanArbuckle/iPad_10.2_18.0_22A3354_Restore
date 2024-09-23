@implementation NSMutableArray(TSSStyleAdditions)

- (uint64_t)addProperty:()TSSStyleAdditions
{
  return objc_msgSend(a1, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:"));
}

@end
