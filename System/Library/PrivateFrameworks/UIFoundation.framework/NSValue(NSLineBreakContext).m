@implementation NSValue(NSLineBreakContext)

+ (uint64_t)UIF_valueWithLineBreakContext:()NSLineBreakContext
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", a3, "{?=QQB}");
}

- (uint64_t)UIF_lineBreakContextValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end
