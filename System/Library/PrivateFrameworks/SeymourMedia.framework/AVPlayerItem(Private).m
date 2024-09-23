@implementation AVPlayerItem(Private)

- (uint64_t)smm_restrictions
{
  if ((unsigned __int16)objc_msgSend(a1, "restrictions"))
    return 0xFFFFLL;
  else
    return 0;
}

- (uint64_t)smm_setPlayerItemRestrictions:()Private
{
  uint64_t v3;

  if (a3)
    v3 = 0xFFFFLL;
  else
    v3 = 0;
  return objc_msgSend(a1, "setRestrictions:", v3);
}

@end
