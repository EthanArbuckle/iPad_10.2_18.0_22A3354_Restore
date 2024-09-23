@implementation NSValue(NSValueGeometryExtensions)

+ (uint64_t)valueWithPoint:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
}

+ (uint64_t)valueWithSize:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
}

+ (uint64_t)valueWithRect:()NSValueGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
}

@end
