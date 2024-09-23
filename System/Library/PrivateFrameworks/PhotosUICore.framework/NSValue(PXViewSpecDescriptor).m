@implementation NSValue(PXViewSpecDescriptor)

- (uint64_t)px_viewSpecDescriptorValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (uint64_t)px_valueWithViewSpecDescriptor:()PXViewSpecDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{PXViewSpecDescriptor=qQ{CGSize=dd}}");
}

@end
