@implementation NSValue(PXTileGeometry)

- (uint64_t)PXTileGeometryValue
{
  x8_0[10] = 0u;
  x8_0[11] = 0u;
  x8_0[8] = 0u;
  x8_0[9] = 0u;
  x8_0[6] = 0u;
  x8_0[7] = 0u;
  x8_0[4] = 0u;
  x8_0[5] = 0u;
  x8_0[2] = 0u;
  x8_0[3] = 0u;
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (id)valueWithPXTileGeometry:()PXTileGeometry
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", a3, "{PXTileGeometry={CGRect={CGPoint=dd}{CGSize=dd}}{CGPoint=dd}{CGSize=dd}{CGAffineTransform=dddddd}ddB{CGSize=dd}{CGRect={CGPoint=dd}{CGSize=dd}}^v}");
}

@end
