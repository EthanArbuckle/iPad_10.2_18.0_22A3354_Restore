@implementation PTTuningParameters

+ (float)noiseScaleFactorForHwModelID:(int)a3 sensorID:(int)a4
{
  float result;

  switch(a3 & 0xFFFFFFFE)
  {
    case 0xEu:
      result = 0.25;
      if ((a4 - 1811) >= 2 && a4 != 2051)
        return 0.24;
      return result;
    case 0x12u:
      result = 0.17;
      if (a4 > 2130)
      {
        if (a4 != 2131)
          goto LABEL_24;
      }
      else if ((a4 - 1811) >= 2 && a4 != 2051)
      {
        return 0.16;
      }
      return result;
    case 0x14u:
    case 0x18u:
      result = flt_1C9322E68[a4 == 2308];
      if (a4 == 1812)
        return 0.25;
      return result;
    case 0x16u:
      result = 0.17;
      if (a4 != 1812 && a4 != 2307)
      {
LABEL_24:
        if (a4 != 2323)
          return 0.16;
      }
      return result;
    default:
      result = 0.5;
      if (a4 > 1794)
      {
        if (a4 == 1795)
          return result;
        if (a4 != 1812)
        {
          if (a4 == 1811)
            return 0.75;
          return 0.25;
        }
        return 1.0;
      }
      if (a4 == 1300)
        return 1.0;
      if (a4 != 1539)
        return 0.25;
      return result;
  }
}

+ (int)hwModelIDFromFigModelSpecificName:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(&unk_1E8252EF8, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0;

  return v5;
}

+ (id)hwModelIDToString:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(&unk_1E8252EF8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(&unk_1E8252EF8);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(&unk_1E8252EF8, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "intValue") == a3)
        {
          v10 = v8;

          return v10;
        }

      }
      v5 = objc_msgSend(&unk_1E8252EF8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  return CFSTR("Unknown");
}

@end
