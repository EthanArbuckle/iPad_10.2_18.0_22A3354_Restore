@implementation WiFiUsagePrivacyFilter

+ (int)bandFromFlags:(unint64_t)a3
{
  int v3;
  int v4;

  if ((a3 & 0x2000) != 0)
    v3 = 2;
  else
    v3 = 3;
  if ((a3 & 0x10) != 0)
    v4 = 1;
  else
    v4 = v3;
  if ((a3 & 8) != 0)
    return 0;
  else
    return v4;
}

+ (unint64_t)channelWidthFromFlags:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 80;
  v4 = 40;
  if ((a3 & 4) == 0)
    v4 = 20;
  if ((a3 & 0x400) == 0)
    v3 = v4;
  if ((a3 & 0x800) != 0)
    return 160;
  else
    return v3;
}

+ (id)bandAsString:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E881EBC0[a3];
}

+ (BOOL)canPerformActionWithSampleRate:(unint64_t)a3
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      a3 = 5;
      goto LABEL_5;
    case 3uLL:
      a3 = 10;
      goto LABEL_5;
    case 4uLL:
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke;
      v5[3] = &unk_1E881EAB0;
      v5[4] = &v6;
      +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:](WCAFetchWiFiBehaviorParameters, "fetchWiFiBehaviorWithCompletion:", v5);
      goto LABEL_6;
    default:
      a3 = 49;
LABEL_5:
      v9 = a3;
LABEL_6:
      v3 = v7[3] >= (unint64_t)arc4random_uniform(0x63u);
      _Block_object_dispose(&v6, 8);
      return v3;
  }
}

+ (id)reformatMACAddress:(id)a3
{
  id v3;
  id v4;
  ether_addr *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v4 = objc_retainAutorelease(v3), objc_msgSend(v4, "UTF8String"))
    && (v5 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), v5->octet[0], v5->octet[1], v5->octet[2], v5->octet[3], v5->octet[4], v5->octet[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)initialize
{
  _isInternalInstall = MGGetBoolAnswer();
}

+ (id)numberWithDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)numberWithDurationMillisecond:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(a3 * 1000.0));
}

+ (id)timePercentage:(double)a3 overTotalDuration:(double)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 <= 0.0)
    return 0;
  if (a3 > a4)
    a3 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(a3 * 100.0 / a4 + 0.5), v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)twoSigFig:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;

  if (a3)
  {
    v3 = (double)a3;
    v4 = log10((double)a3);
    v5 = __exp10(floor(v4) + -1.0);
    a3 = (unint64_t)(v5 * (double)(int)(v3 / v5));
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
}

+ (id)numberWithByteCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:](WiFiUsagePrivacyFilter, "twoSigFig:", a3);
}

+ (id)numberWithFrameCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:](WiFiUsagePrivacyFilter, "twoSigFig:", a3);
}

+ (id)numberWithInstances:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
}

+ (id)localTimestamp:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E80];
  v4 = a3;
  objc_msgSend(v3, "defaultTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "secondsFromGMTForDate:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v4, (double)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)describeSampleRate:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("unknown");
  else
    return off_1E881EAD0[a3];
}

void __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "jtrnDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "valueForKey:", CFSTR("kWiFiUsagePrivacySampleRateNetworkName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)objc_msgSend(v4, "intValue");

    v3 = v5;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

+ (double)timeSinceBootInSeconds
{
  int v2;
  double result;
  double v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  *(_QWORD *)v8 = 0x1500000001;
  v5 = 16;
  v6 = 0;
  v2 = sysctl(v8, 2u, &v6, &v5, 0, 0);
  result = 0.0;
  if (!v2)
  {
    v4 = (double)(int)v7 / 1000000.0 + (double)v6 - *MEMORY[0x1E0C9ADF8];
    return CFAbsoluteTimeGetCurrent() - (double)(unint64_t)v4;
  }
  return result;
}

+ (id)getBinFor:(int64_t)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  int64_t v20;
  __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;

  v10 = a4;
  v11 = (__CFString *)a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    v13 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (v15 >= a3)
        break;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v12;
      v13 = v16;
      if (objc_msgSend(v10, "count") <= v12)
        goto LABEL_8;
    }
    v16 = v13;
  }
  else
  {
    v16 = 0;
    v12 = 0;
  }
LABEL_8:
  v17 = v16;
  v18 = v17;
  if (objc_msgSend(v10, "count") > v12)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    v18 = v17;
    if (v20 >= a3)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v10, "count") == v12 && -[__CFString integerValue](v18, "integerValue") < a3)
  {

    v18 = 0;
  }
  if (a6 == 2)
  {
    v23 = v18;
LABEL_24:
    v24 = v23;
    goto LABEL_33;
  }
  if (a6 != 1)
  {
    if (a6)
    {
      v24 = 0;
      goto LABEL_33;
    }
    if (v17)
      v21 = v17;
    else
      v21 = v11;
    v22 = CFSTR("+inf");
    if (v18)
      v22 = v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:%@]"), v21, v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  if (v17)
    v26 = v17;
  else
    v26 = v11;
  objc_msgSend(a1, "getHumanSecondsFromObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v28 = v18;
  else
    v28 = CFSTR("+inf");
  objc_msgSend(a1, "getHumanSecondsFromObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("(%@:%@]"), v27, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v24;
}

+ (id)getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "getBinFor:In:WithLowestEdge:As:", (unint64_t)a3, &unk_1E88641F0, CFSTR("0"), a4);
}

+ (id)getHumanSecondsFromObject:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "getHumanSecondsFromTimeInterval:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

+ (id)getHumanSecondsFromTimeInterval:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (a3 >= 86400.0)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("%lud"), (unint64_t)(a3 / 86400.0));
    a3 = a3 - (double)(86400 * (unint64_t)(a3 / 86400.0));
  }
  if (a3 >= 3600.0)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%luh"), (unint64_t)(a3 / 3600.0));
    a3 = a3 - (double)(3600 * (unint64_t)(a3 / 3600.0));
  }
  if (a3 >= 60.0)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%lum"), (unint64_t)(a3 / 60.0));
    a3 = a3 - (double)(60 * (unint64_t)(a3 / 60.0));
  }
  if (a3 > 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR("%lus"), (unint64_t)a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getBinEvery10Over100:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", a3, &unk_1E8864208, CFSTR("0"), a4);
}

+ (id)toHEXString:(char *)a3 length:(unint64_t)a4
{
  __CFString *v4;
  void *v6;
  void *v7;
  _BYTE *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;

  v4 = (__CFString *)a4;
  if (a4)
  {
    v6 = malloc_type_malloc((2 * a4) | 1, 0x100004077774924uLL);
    if (v6)
    {
      v7 = v6;
      v8 = v6;
      do
      {
        v9 = *a3++;
        *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
        v8[1] = a0123456789abcd[v9 & 0xF];
        v8 += 2;
        v4 = (__CFString *)((char *)v4 - 1);
      }
      while (v4);
      *v8 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      free(v7);
    }
    else
    {
      v4 = 0;
    }
  }
  if (v4)
    v10 = v4;
  else
    v10 = &stru_1E881F240;
  v11 = v10;

  return v11;
}

+ (id)macAddressData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  ether_addr *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = objc_retainAutorelease(v3), objc_msgSend(v5, "UTF8String"))
    && (v6 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)toBinString:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  if (!objc_msgSend(v3, "length") && objc_msgSend(v3, "length") != 6)
  {
    NSLog(CFSTR("%s %@ is not a mac address"), "+[WiFiUsagePrivacyFilter toBinString:]", v3);
    goto LABEL_11;
  }
  v5 = malloc_type_malloc((8 * objc_msgSend(v3, "length")) | 1, 0x100004077774924uLL);
  if (!v5)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v6 = v5;
  v7 = v5;
  if (objc_msgSend(v3, "length"))
  {
    v8 = 0;
    v7 = v6;
    do
    {
      v9 = 0;
      v10 = *v4;
      do
      {
        v7[v9] = v10 & 1 | 0x30;
        v10 >>= 1;
        ++v9;
      }
      while ((_DWORD)v9 != 8);
      ++v4;
      ++v8;
      v7 += v9;
    }
    while (objc_msgSend(v3, "length") > v8);
  }
  *v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  free(v6);
LABEL_12:
  if (v11)
    v12 = v11;
  else
    v12 = &stru_1E881F240;
  v13 = v12;

  return v13;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSData:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "toBinString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3
    && (unint64_t)objc_msgSend(v3, "length") >= 2
    && objc_msgSend(v4, "characterAtIndex:", 1) == 49;

  return v5;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSString:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "macAddressData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isLocallyAdministeredBitSetInBSSData:", v4);

  return (char)v3;
}

+ (id)oui:(id)a3
{
  id v3;
  id v4;
  ether_addr *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v4 = objc_retainAutorelease(v3), objc_msgSend(v4, "UTF8String"))
    && (v5 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x"), v5->octet[0], v5->octet[1], v5->octet[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)sanitizedOUI:(id)a3
{
  id v3;
  id v4;
  ether_addr *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v4 = objc_retainAutorelease(v3), objc_msgSend(v4, "UTF8String"))
    && (v5 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x"), v5->octet[0] & 0xFC, v5->octet[1], v5->octet[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isInternalInstall
{
  return _isInternalInstall;
}

+ (int64_t)getSumAllBands:(id *)a3
{
  uint64_t v3;
  int64_t result;

  v3 = 0;
  result = 0;
  do
  {
    if (a3->var1[v3])
      result += a3->var0[v3];
    ++v3;
  }
  while (v3 != 3);
  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForIntegerByBand:(SEL)a3 Over:(id *)a4
{
  __int128 v7;
  uint64_t i;
  _OWORD v9[2];

  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(_OWORD *)&a4->var0[2];
    v9[0] = *(_OWORD *)a4->var0;
    v9[1] = v7;
    result = ($FEE1510A43A03BFC9F45CB2D5A0A197D *)-[$FEE1510A43A03BFC9F45CB2D5A0A197D getSumAllBands:](result, "getSumAllBands:", v9);
    a5 = (unint64_t)result;
  }
  for (i = 0; i != 3; ++i)
  {
    if (a4->var1[i])
    {
      retstr->var0[i] = (unint64_t)((double)a4->var0[i] * 100.0 / (double)a5 + 0.5);
      retstr->var1[i] = 1;
    }
  }
  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForFloatByBand:(SEL)a3 Over:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  do
  {
    if (a4->var1[v5])
    {
      retstr->var0[v5] = (unint64_t)(a4->var0[v5] * 100.0 / a5 + 0.5);
      retstr->var1[v5] = 1;
    }
    ++v5;
  }
  while (v5 != 3);
  return result;
}

+ (id)getSumArrayCountAllBand:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "count");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getModeCountersByCandidatesByBand:(SEL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  $FEE1510A43A03BFC9F45CB2D5A0A197D *result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v17, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 > v9)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v15, "count");

          if (v12)
          {
            objc_msgSend(v12, "candidateSet");
          }
          else
          {
            v17 = 0u;
            v18 = 0u;
          }
          *(_OWORD *)retstr->var0 = v17;
          *(_OWORD *)&retstr->var0[2] = v18;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return result;
}

+ (id)getLabelForIntegerByBand:(id *)a3 withCap:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)objc_opt_new();
  for (i = 0; i != 3; ++i)
  {
    if (a3->var1[i])
    {
      if (v4 && a3->var0[i] > 5)
      {
        +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@GHz>%d "), v8, 5);
      }
      else
      {
        +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@GHz:%lu "), v8, a3->var0[i]);
      }

    }
  }
  if ((objc_msgSend(v6, "isEqualToString:", &stru_1E881F240) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getLabelForIntegerByBand:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  objc_msgSend(a1, "getLabelForIntegerByBand:withCap:", v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForIntegerByBand:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  v13 = 0;
  if (a6 == 2)
    v14 = CFSTR("<=");
  else
    v14 = CFSTR(":");
  do
  {
    if (a3->var1[v13])
    {
      objc_msgSend(a1, "bandAsString:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "getBinFor:In:WithLowestEdge:As:", a3->var0[v13], v10, v11, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("%@GHz%@%@ "), v15, v14, v16);

    }
    ++v13;
  }
  while (v13 != 3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)getLabelForIntegerByBandTransition:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  BOOL (*var1)[3];
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  id v22;

  v22 = a4;
  v21 = a5;
  v20 = (void *)objc_opt_new();
  v10 = 0;
  v11 = a6;
  if (a6 == 2)
    v12 = CFSTR("<=");
  else
    v12 = CFSTR(":");
  var1 = a3->var1;
  do
  {
    for (i = 0; i != 3; ++i)
    {
      if ((*var1)[i])
      {
        objc_msgSend(a1, "bandAsString:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "bandAsString:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "getBinFor:In:WithLowestEdge:As:", a3->var0[0][i], v22, v21, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("%@GHz->%@GHz%@%@ "), v15, v16, v12, v17);

      }
    }
    ++v10;
    ++var1;
    a3 = ($13477CEFC6EEA4B326536BBEC35DF1AE *)((char *)a3 + 24);
  }
  while (v10 != 3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)getLabelForPercIntegerByBand:(id *)a3
{
  __int128 v4;
  _OWORD v6[2];
  _BYTE v7[32];

  v4 = *(_OWORD *)&a3->var0[2];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  objc_msgSend(a1, "getPercForIntegerByBand:Over:", v6, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(a1, "getLabelForIntegerByBand:In:WithLowestEdge:As:", v7, &unk_1E8864220, CFSTR("0"), 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForNeighborsByBand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", objc_msgSend(v10, "unsignedIntValue"));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v12 > 5)
            objc_msgSend(v4, "appendFormat:", CFSTR("%@GHz>%d "), v13, 5);
          else
            objc_msgSend(v4, "appendFormat:", CFSTR("%@GHz:%lu "), v13, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    if ((objc_msgSend(v4, "isEqualToString:", &stru_1E881F240) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)getLabelForBandUsageDuration:(id *)a3 overTotalDuration:(double)a4 binned:(BOOL)a5
{
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  v27 = 0u;
  v28 = 0u;
  v9 = *(_OWORD *)&a3->var0[2];
  v26[0] = *(_OWORD *)a3->var0;
  v26[1] = v9;
  objc_msgSend(a1, "getPercForFloatByBand:Over:", v26, a4);
  if (a5)
  {
    if (a4 == 0.0)
    {
      v10 = 0;
    }
    else
    {
      v25[0] = v27;
      v25[1] = v28;
      objc_msgSend(a1, "getLabelForIntegerByBand:In:WithLowestEdge:As:", v25, &unk_1E8864238, CFSTR("0"), 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0.0;
    v14 = 0.0;
    if (a3->var1[0])
      v14 = a3->var0[0];
    if (BYTE8(v28))
      v15 = v27;
    else
      v15 = 0;
    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3->var1[1])
      v13 = a3->var0[1];
    if (BYTE9(v28))
      v17 = *((_QWORD *)&v27 + 1);
    else
      v17 = 0;
    v18 = (void *)MEMORY[0x1E0CB3940];
    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", 2);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (a3->var1[2])
      v21 = a3->var0[2];
    else
      v21 = 0.0;
    if (BYTE10(v28))
      v22 = v28;
    else
      v22 = 0;
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%fs/%fs(%lu%%)"), v19, *(_QWORD *)&v21, *(_QWORD *)&a4, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%fs/%fs(%ld%%) %@:%fs/%fs(%lu%%) %@"), v12, *(_QWORD *)&v14, *(_QWORD *)&a4, v15, v16, *(_QWORD *)&v13, *(_QWORD *)&a4, v17, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)getLabelForRssiByBand:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  objc_msgSend(a1, "getLabelForIntegerByBand:In:WithLowestEdge:As:", v5, &unk_1E8864250, CFSTR("-inf"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRssiDeltaByBand:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  objc_msgSend(a1, "getLabelForIntegerByBand:In:WithLowestEdge:As:", v5, &unk_1E8864268, CFSTR("-inf"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRssiDeltaByBandTransition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v6[5];
  uint64_t v7;

  v3 = *(_OWORD *)&a3->var0[2][0];
  v6[2] = *(_OWORD *)&a3->var0[1][1];
  v6[3] = v3;
  v6[4] = *(_OWORD *)&a3->var0[2][2];
  v7 = *(_QWORD *)&a3->var1[2][2];
  v4 = *(_OWORD *)&a3->var0[0][2];
  v6[0] = *(_OWORD *)&a3->var0[0][0];
  v6[1] = v4;
  objc_msgSend(a1, "getLabelForIntegerByBandTransition:In:WithLowestEdge:As:", v6, &unk_1E8864280, CFSTR("-inf"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRTCoexType:(unint64_t)a3
{
  if (a3)
    return CFSTR("Unknown");
  else
    return CFSTR("AWDL RealTime");
}

+ (id)getLabelForSteeringRequest:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E881EAF8[a3];
}

+ (id)getLabelForTDMode:(int)a3
{
  if ((a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E881EB18[a3 - 1];
}

+ (id)getLabelForTDTrigger:(int)a3
{
  if (a3 > 0xE)
    return CFSTR("Unknown");
  else
    return off_1E881EB30[a3];
}

+ (id)getLabelForCoreRssiMode:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E881EBA8[a3];
}

+ (id)getLabelForUsbVendor:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1920)
  {
    if ((uint64_t)a3 > 1438)
    {
      switch(a3)
      {
        case 0x59FuLL:
          return CFSTR("LaCie");
        case 0x5ACuLL:
          return CFSTR("Apple");
        case 0x5DCuLL:
          return CFSTR("Lexar");
      }
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          return CFSTR("DeviceMode");
        case 0x477uLL:
          return CFSTR("Seagate");
        case 0x4E8uLL:
          return CFSTR("Samsung");
      }
    }
  }
  else if ((uint64_t)a3 <= 5420)
  {
    switch(a3)
    {
      case 0x781uLL:
        return CFSTR("SanDisk");
      case 0x951uLL:
        return CFSTR("Kingston");
      case 0x1058uLL:
        return CFSTR("Western Digital");
    }
  }
  else if ((uint64_t)a3 > 18320)
  {
    if (a3 == 18321)
      return CFSTR("G-Technology");
    if (a3 == 0xFFFF)
      return CFSTR("DisplayPort");
  }
  else
  {
    if (a3 == 5421)
      return CFSTR("Sabrent");
    if (a3 == 8201)
      return CFSTR("iStorage");
  }
  return CFSTR("Other");
}

+ (id)getLabelForPhyModes:(int)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if ((v3 & 0x400) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("6Ghz"));
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("11BE"));
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v5, "addObject:", CFSTR("11AX"));
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  objc_msgSend(v5, "addObject:", CFSTR("11AC"));
  if ((v3 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v5, "addObject:", CFSTR("11N"));
LABEL_7:
  if ((v3 & 0x48) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("11G"));
  if ((v3 & 0x22) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("11A"));
  if ((v3 & 4) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("11B"));
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getLabelsForNetworkProperties:(id)a3
{
  id v3;
  objc_class *v4;
  objc_property_t *v5;
  objc_property_t *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v16;
  void *v17;
  unsigned int outCount;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E881F240);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E881F240);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  v6 = v5;
  if (outCount)
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C9AAB0];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", property_getName(v6[v7]), objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("is")))
      {
        objc_msgSend(v3, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v8)
          && !objc_msgSend(v9, "isEqualToString:", CFSTR("isWork")))
        {
          v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("isHome"));

          if ((v13 & 1) == 0)
            objc_msgSend(v16, "appendFormat:", CFSTR("%@&"), v9);
        }
        else
        {

        }
      }
      if ((objc_msgSend(v9, "hasPrefix:", CFSTR("has")) & 1) != 0
        || objc_msgSend(v9, "hasPrefix:", CFSTR("requires")))
      {
        objc_msgSend(v3, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v8);

        if (v12)
          objc_msgSend(v17, "appendFormat:", CFSTR("%@&"), v9);
      }

      ++v7;
    }
    while (v7 < outCount);
  }
  else if (!v5)
  {
    goto LABEL_17;
  }
  free(v6);
LABEL_17:
  if (objc_msgSend(v3, "captiveStatus") == 2)
    objc_msgSend(v16, "appendFormat:", CFSTR("%@&"), CFSTR("isCaptive"));
  v19[0] = CFSTR("networkType");
  v19[1] = CFSTR("networkProperties");
  v20[0] = v16;
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)subBandForBSPAsStringFromChannel:(int64_t)a3 andBand:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  if (a4 != 1)
  {
LABEL_8:
    objc_msgSend(a1, "bandAsString:", *(_QWORD *)&a4, v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((unint64_t)(a3 - 32) >= 0x25)
  {
    if ((unint64_t)(a3 - 96) < 0x46)
      return CFSTR("5high");
    goto LABEL_8;
  }
  v6 = CFSTR("5low");
  return v6;
}

+ (int)bandFromFlags:(id)a3 OrChannel:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "integerValue") >= 1)
  {
    v8 = objc_msgSend(a1, "bandFromFlags:", objc_msgSend(v6, "integerValue"));
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v8 = 3;
    if (!v7)
      goto LABEL_10;
  }
  if (v8 == 3)
  {
    if (objc_msgSend(v7, "unsignedIntegerValue"))
      v8 = objc_msgSend(a1, "bandFromChannel:", objc_msgSend(v7, "unsignedIntegerValue"));
    else
      v8 = 3;
  }
LABEL_10:

  return v8;
}

+ (int)bandFromChannel:(unint64_t)a3
{
  int v3;

  if (a3 - 36 < 0x86)
    v3 = 1;
  else
    v3 = 3;
  if (a3 >= 0xF)
    return v3;
  else
    return 0;
}

+ (int)bandFromChanInfo:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  int v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_BAND_NUM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "integerValue"), v5 <= 3))
    v6 = dword_1CC50EE70[v5];
  else
    v6 = 3;

  return v6;
}

+ (int)bandFromAppleChannelSpec:(int)a3
{
  if (a3 > 3)
    return 3;
  else
    return dword_1CC50EE70[a3];
}

+ (unint64_t)channelWidthAppleChannelSpec:(int)a3
{
  if ((a3 - 1) > 4)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return qword_1CC50EE40[a3 - 1];
}

@end
