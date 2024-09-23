@implementation NSOutputStream(SafariCoreExtras)

- (BOOL)safari_writeNetworkOrderUInt16:()SafariCoreExtras
{
  __int16 v4;

  v4 = __rev16(a3);
  return objc_msgSend(a1, "write:maxLength:", &v4, 2) == 2;
}

- (BOOL)safari_writeNetworkOrderUInt32:()SafariCoreExtras
{
  unsigned int v4;

  v4 = bswap32(a3);
  return objc_msgSend(a1, "write:maxLength:", &v4, 4) == 4;
}

@end
