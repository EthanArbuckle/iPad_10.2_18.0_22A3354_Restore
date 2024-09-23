@implementation NSMutableData(Append)

- (uint64_t)appendU8:()Append
{
  char v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 1);
}

- (uint64_t)appendU16BE:()Append
{
  __int16 v4;

  v4 = __rev16(a3);
  return objc_msgSend(a1, "appendBytes:length:", &v4, 2);
}

- (uint64_t)appendU16LE:()Append
{
  __int16 v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 2);
}

- (uint64_t)appendU32BE:()Append
{
  unsigned int v4;

  v4 = bswap32(a3);
  return objc_msgSend(a1, "appendBytes:length:", &v4, 4);
}

- (uint64_t)appendU32LE:()Append
{
  int v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 4);
}

- (uint64_t)appendU64BE:()Append
{
  unint64_t v4;

  v4 = bswap64(a3);
  return objc_msgSend(a1, "appendBytes:length:", &v4, 8);
}

- (uint64_t)appendU64LE:()Append
{
  uint64_t v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 8);
}

@end
