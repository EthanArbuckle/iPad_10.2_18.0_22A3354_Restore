@implementation NSValue(PXTileIdentifier)

- (uint64_t)PXTileIdentifierValue
{
  *(_QWORD *)(x8_0 + 80) = 0;
  *(_OWORD *)(x8_0 + 48) = 0u;
  *(_OWORD *)(x8_0 + 64) = 0u;
  *(_OWORD *)(x8_0 + 16) = 0u;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)x8_0 = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (id)valueWithPXTileIdentifier:()PXTileIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", a3, "{PXTileIdentifier=Q[10Q]}");
}

@end
