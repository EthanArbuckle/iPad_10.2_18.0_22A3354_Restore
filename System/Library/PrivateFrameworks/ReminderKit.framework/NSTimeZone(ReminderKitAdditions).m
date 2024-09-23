@implementation NSTimeZone(ReminderKitAdditions)

- (uint64_t)rem_isEquivalentTo:()ReminderKitAdditions
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  UChar s2[2];
  _WORD v17[64];
  _WORD v18[64];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v6 = v4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if ((objc_msgSend(v5, "isEqualToTimeZone:", v6) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      if (v10 >= 0x3F)
        v11 = 63;
      else
        v11 = v10;
      objc_msgSend(v9, "getCharacters:range:", v18, 0, v11);
      v18[v11] = 0;

      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      if (v13 >= 0x3F)
        v14 = 63;
      else
        v14 = v13;
      objc_msgSend(v12, "getCharacters:range:", v17, 0, v14);
      v17[v14] = 0;

      *(_DWORD *)s2 = 0;
      ucal_getCanonicalTimeZoneID();
      ucal_getCanonicalTimeZoneID();
      v8 = 0;
    }
  }

  return v8;
}

+ (uint64_t)remDebugTimeZone_LosAngeles
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
}

+ (uint64_t)remDebugTimeZone_NewYork
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
}

+ (uint64_t)remDebugTimeZone_GMT
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
}

@end
