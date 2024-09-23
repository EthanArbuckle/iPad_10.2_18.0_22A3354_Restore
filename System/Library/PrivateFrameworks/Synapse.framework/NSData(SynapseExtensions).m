@implementation NSData(SynapseExtensions)

- (uint64_t)_sy_containsUnsignedShort:()SynapseExtensions inRange:
{
  id v8;
  uint64_t v9;
  unsigned int v12;
  unint64_t v13;

  if (!a5)
    return 0;
  v8 = objc_retainAutorelease(a1);
  v9 = objc_msgSend(v8, "bytes");
  if (*(unsigned __int16 *)(v9 + 2 * (a4 + a5) - 2) < a3
    || *(unsigned __int16 *)(v9 + 2 * a4) > a3)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v9 + 2 * (a4 + (a5 >> 1)));
  if (v12 > a3)
  {
    v13 = a5 >> 1;
    return objc_msgSend(v8, "_sy_containsUnsignedShort:inRange:", a3, a4, v13);
  }
  if (v12 < a3)
  {
    v13 = a5 - (a5 >> 1);
    a4 += a5 >> 1;
    return objc_msgSend(v8, "_sy_containsUnsignedShort:inRange:", a3, a4, v13);
  }
  return 1;
}

@end
