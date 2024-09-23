@implementation NSValue(_UIPressTriggerAdditions)

- (uint64_t)_UIPressTriggerValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 32);
}

+ (uint64_t)_valueWithPressTrigger:()_UIPressTriggerAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{_UIPressTrigger=qqdB}");
}

@end
