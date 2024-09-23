@implementation CLPPoiTriggerEvent(RTExtensions)

+ (uint64_t)mapItemSource:()RTExtensions
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  result = 0;
  if (a3 > 255)
  {
    v4 = 0x4000;
    v5 = 0x8000;
    if (a3 != 0x4000)
      v5 = 0;
    if (a3 != 0x2000)
      v4 = v5;
    v6 = 4096;
    v7 = 0x2000;
    if (a3 != 4096)
      v7 = 0;
    if (a3 != 2048)
      v6 = v7;
    if (a3 < 0x2000)
      v4 = v6;
    v8 = 512;
    v9 = 1024;
    v10 = 2048;
    if (a3 != 1024)
      v10 = 0;
    if (a3 != 512)
      v9 = v10;
    if (a3 != 256)
      v8 = v9;
    v11 = a3 <= 2047;
  }
  else
  {
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 1:
          result = 1;
          break;
        case 2:
          result = 4;
          break;
        case 4:
          result = 8;
          break;
        case 8:
          result = 16;
          break;
        default:
          return result;
      }
      return result;
    }
    v4 = 256;
    v12 = 2;
    if (a3 != 128)
      v12 = 0;
    if (a3 != 64)
      v4 = v12;
    v8 = 64;
    v13 = 128;
    if (a3 != 32)
      v13 = 0;
    if (a3 != 16)
      v8 = v13;
    v11 = a3 <= 63;
  }
  if (v11)
    return v8;
  else
    return v4;
}

+ (uint64_t)subType:()RTExtensions
{
  int v3;

  v3 = a3 & 1;
  if ((a3 & 0x40000) != 0)
    v3 = 1;
  if (a3)
    return v3 & 0xFFFFFF7F | (((a3 >> 1) & 1) << 7) | (a3 >> 1) & 0xE | (a3 >> 2) & 0x70 | (a3 >> 1) & 0x7F00;
  else
    return 0;
}

- (void)initWithMapItem:()RTExtensions date:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "validMUID"))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setMuid:", objc_msgSend(v6, "muid"));
    objc_msgSend(v8, "setProviderIdentifier:", objc_msgSend(v6, "resultProviderID"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setTriggerTimestamp:");
    objc_msgSend(v8, "setTriggerType:", 3);
    objc_msgSend(v8, "setTriggerSubType:", objc_msgSend((id)objc_opt_class(), "subType:", objc_msgSend(v6, "source")));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)description
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(a1, "muid");
  v4 = objc_msgSend(a1, "providerIdentifier");
  objc_msgSend(a1, "triggerTimestamp");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("muid, %llu, providerIdentifier, %d triggerTimestamp, %.2f, triggerType, %d, triggerSubType, %d"), v3, v4, v5, objc_msgSend(a1, "triggerType"), objc_msgSend(a1, "triggerSubType"));
}

@end
