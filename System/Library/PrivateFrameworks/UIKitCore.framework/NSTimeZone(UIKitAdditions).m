@implementation NSTimeZone(UIKitAdditions)

+ (id)_ui_canonicalTimeZoneNameForTimeZoneName:()UIKitAdditions
{
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _WORD v7[1024];
  uint64_t v8;

  MEMORY[0x1E0C80A78](a1);
  v8 = *MEMORY[0x1E0C80C00];
  v2 = v1;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "length");
    if (v4 >= 0x3FF)
      v5 = 1023;
    else
      v5 = v4;
    objc_msgSend(v3, "getCharacters:range:", v7, 0, v5);
    v7[v5] = 0;
    ucal_getCanonicalTimeZoneID();
  }

  return 0;
}

@end
