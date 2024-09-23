@implementation NSValue(PXMemoryFontsSpecIdentifier)

- (uint64_t)px_memoryFontsSpecIdentifierValue
{
  *(_QWORD *)(x8_0 + 48) = 0;
  *(_OWORD *)(x8_0 + 16) = 0u;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)x8_0 = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (uint64_t)px_valueWithMemoryFontsSpecIdentifier:()PXMemoryFontsSpecIdentifier
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{PXMemoryFontsSpecIdentifier=qqq{CGSize=dd}dB}");
}

@end
