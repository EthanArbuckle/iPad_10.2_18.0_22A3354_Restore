@implementation PRSRankingItemRelativeFeatureContext

+ (id)relativeContextsForBundle:(id)a3 currentTime:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:currentTime:](PRSRankingItemRelativeFeatureContext, "_relativeContextsForFeatures:currentTime:", &unk_1E6E9B590, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    v7 = &unk_1E6E9B5A8;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.reminders")))
  {
    v7 = &unk_1E6E9B5C0;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    v7 = &unk_1E6E9B5D8;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.application")))
    {
      v9 = v6;
      goto LABEL_10;
    }
    v7 = &unk_1E6E9B5F0;
  }
  +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:currentTime:](PRSRankingItemRelativeFeatureContext, "_relativeContextsForFeatures:currentTime:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v9;
}

+ (id)relativeContextsForResultSetWithCurrentTime:(double)a3
{
  return +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:currentTime:](PRSRankingItemRelativeFeatureContext, "_relativeContextsForFeatures:currentTime:", &unk_1E6E9B608, a3);
}

+ (id)_relativeContextsForFeatures:(id)a3 currentTime:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PRSRankingItemRelativeFeatureContext *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = -[PRSRankingItemRelativeFeatureContext initWithFeature:currentTime:]([PRSRankingItemRelativeFeatureContext alloc], "initWithFeature:currentTime:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "unsignedIntegerValue", (_QWORD)v14), a4);
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)_resultComparatorForRelativeFeature:(unint64_t)a3
{
  void *v3;
  void (__cdecl **v5)();

  switch(a3)
  {
    case 0uLL:
    case 0xEuLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 32);
      goto LABEL_16;
    case 1uLL:
    case 0xFuLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 9);
      goto LABEL_16;
    case 2uLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 17);
      goto LABEL_16;
    case 3uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_54_1);
      goto LABEL_16;
    case 4uLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 29);
      goto LABEL_16;
    case 5uLL:
    case 6uLL:
    case 0x10uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_55_0);
      goto LABEL_16;
    case 7uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_56);
      goto LABEL_16;
    case 8uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_57_0);
      goto LABEL_16;
    case 9uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_58_0);
      goto LABEL_16;
    case 0xAuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_59_0);
      goto LABEL_16;
    case 0xBuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_60_0);
      goto LABEL_16;
    case 0xCuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_61);
      goto LABEL_16;
    case 0xDuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_62_1);
LABEL_16:
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 0x11uLL:
      v5 = (void (__cdecl **)())comparatorForPastDateRecency;
      goto LABEL_20;
    case 0x12uLL:
      v5 = (void (__cdecl **)())comparatorForFutureDateRecency;
LABEL_20:
      v5[2]();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    default:
      +[PRSRankingItemRelativeFeatureContext _resultComparatorForRelativeFeature:].cold.1();
  }
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int8x8_t *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), 0x11uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int8x8_t *)objc_msgSend(v4, "attributes");

  SSCompactRankingAttrsGetValue(v6, 0x11uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if (v9 <= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v9 < v10)
    v12 = 1;
  else
    v12 = v11;

  return v12;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(a2, "attributes");
  v6 = objc_msgSend(v4, "attributes");

  v12 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x110uLL, (_DWORD *)&v12 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x110uLL, &v12);
  if (*((float *)&v12 + 1) > *(float *)&v12)
    return 1;
  if (*((float *)&v12 + 1) < *(float *)&v12)
    return -1;
  v11 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x111uLL, (_DWORD *)&v11 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x111uLL, &v11);
  if (*((float *)&v11 + 1) > *(float *)&v11)
    return 1;
  if (*((float *)&v11 + 1) < *(float *)&v11)
    return -1;
  v10 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x112uLL, (_DWORD *)&v10 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x112uLL, &v10);
  if (*((float *)&v10 + 1) > *(float *)&v10)
    return 1;
  if (*((float *)&v10 + 1) < *(float *)&v10)
    return -1;
  v9 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x113uLL, (_DWORD *)&v9 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x113uLL, &v9);
  if (*((float *)&v9 + 1) >= *(float *)&v9)
    v8 = 0;
  else
    v8 = -1;
  if (*((float *)&v9 + 1) > *(float *)&v9)
    return 1;
  else
    return v8;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ArrayInt64;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD __dst[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a2, "attributes");
  v6 = objc_msgSend(v4, "attributes");
  memset(__dst, 0, sizeof(__dst));
  memset(v14, 0, sizeof(v14));
  ArrayInt64 = SSCompactRankingAttrsGetArrayInt64(v5, 0x115uLL, __dst, 4);
  v8 = SSCompactRankingAttrsGetArrayInt64(v6, 0x115uLL, v14, 4);
  if ((_DWORD)ArrayInt64 && (_DWORD)v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = (float)*(uint64_t *)((char *)__dst + v9);
      v11 = (float)*(uint64_t *)((char *)v14 + v9);
      v12 = v10 < v11 ? -1 : ArrayInt64;
      ArrayInt64 = v10 > v11 ? 1 : v12;
      if (v10 != v11)
        break;
      v9 += 8;
      if (v9 == 32)
      {
        ArrayInt64 = 0;
        break;
      }
    }
  }
  else if ((_DWORD)ArrayInt64)
  {
    ArrayInt64 = 1;
  }
  else
  {
    ArrayInt64 = v8 << 63 >> 63;
  }

  return ArrayInt64;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ArrayInt64;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD __dst[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a2, "attributes");
  v6 = objc_msgSend(v4, "attributes");
  memset(__dst, 0, sizeof(__dst));
  memset(v14, 0, sizeof(v14));
  ArrayInt64 = SSCompactRankingAttrsGetArrayInt64(v5, 0x114uLL, __dst, 4);
  v8 = SSCompactRankingAttrsGetArrayInt64(v6, 0x114uLL, v14, 4);
  if ((_DWORD)ArrayInt64 && (_DWORD)v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = (float)*(uint64_t *)((char *)__dst + v9);
      v11 = (float)*(uint64_t *)((char *)v14 + v9);
      v12 = v10 < v11 ? -1 : ArrayInt64;
      ArrayInt64 = v10 > v11 ? 1 : v12;
      if (v10 != v11)
        break;
      v9 += 8;
      if (v9 == 32)
      {
        ArrayInt64 = 0;
        break;
      }
    }
  }
  else if ((_DWORD)ArrayInt64)
  {
    ArrayInt64 = 1;
  }
  else
  {
    ArrayInt64 = v8 << 63 >> 63;
  }

  return ArrayInt64;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int8x8_t *v6;
  int8x8_t *v7;
  unsigned int v8;
  int8x8_t *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  v6 = (int8x8_t *)objc_msgSend(v4, "attributes");
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");
  v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4CuLL);
  v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4CuLL);
  if (v8 && (_DWORD)v9)
  {
    objc_msgSend(v4, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "L2FeatureVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 342);
    v13 = v12;
    objc_msgSend(v11, "scoreForFeature:", 342);
    v15 = v13 <= v14;
    if (v13 != v14)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 341);
    v17 = v16;
    objc_msgSend(v11, "scoreForFeature:", 341);
    v15 = v17 <= v18;
    if (v17 != v18)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 340);
    v20 = v19;
    objc_msgSend(v11, "scoreForFeature:", 340);
    v15 = v20 <= v21;
    if (v20 != v21)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 340);
    v23 = v22;
    objc_msgSend(v11, "scoreForFeature:", 340);
    v15 = v23 <= v24;
    if (v23 == v24)
    {
      v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15)
        v25 = -1;
      else
        v25 = 1;
    }

  }
  else if (v8)
  {
    v25 = 1;
  }
  else
  {
    v25 = (uint64_t)((_QWORD)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int8x8_t *v6;
  int8x8_t *v7;
  unsigned int v8;
  int8x8_t *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  v6 = (int8x8_t *)objc_msgSend(v4, "attributes");
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");
  v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4EuLL);
  v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4EuLL);
  if (v8 && (_DWORD)v9)
  {
    objc_msgSend(v4, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "L2FeatureVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 346);
    v13 = v12;
    objc_msgSend(v11, "scoreForFeature:", 346);
    v15 = v13 <= v14;
    if (v13 != v14)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 345);
    v17 = v16;
    objc_msgSend(v11, "scoreForFeature:", 345);
    v15 = v17 <= v18;
    if (v17 != v18)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 344);
    v20 = v19;
    objc_msgSend(v11, "scoreForFeature:", 344);
    v15 = v20 <= v21;
    if (v20 != v21)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 343);
    v23 = v22;
    objc_msgSend(v11, "scoreForFeature:", 343);
    v15 = v23 <= v24;
    if (v23 == v24)
    {
      v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15)
        v25 = -1;
      else
        v25 = 1;
    }

  }
  else if (v8)
  {
    v25 = 1;
  }
  else
  {
    v25 = (uint64_t)((_QWORD)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int8x8_t *v6;
  int8x8_t *v7;
  unsigned int v8;
  int8x8_t *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  v6 = (int8x8_t *)objc_msgSend(v4, "attributes");
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");
  v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4BuLL);
  v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4BuLL);
  if (v8 && (_DWORD)v9)
  {
    objc_msgSend(v4, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "L2FeatureVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 338);
    v13 = v12;
    objc_msgSend(v11, "scoreForFeature:", 338);
    v15 = v13 <= v14;
    if (v13 != v14)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 337);
    v17 = v16;
    objc_msgSend(v11, "scoreForFeature:", 337);
    v15 = v17 <= v18;
    if (v17 != v18)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 336);
    v20 = v19;
    objc_msgSend(v11, "scoreForFeature:", 336);
    v15 = v20 <= v21;
    if (v20 != v21)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 335);
    v23 = v22;
    objc_msgSend(v11, "scoreForFeature:", 335);
    v15 = v23 <= v24;
    if (v23 == v24)
    {
      v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15)
        v25 = -1;
      else
        v25 = 1;
    }

  }
  else if (v8)
  {
    v25 = 1;
  }
  else
  {
    v25 = (uint64_t)((_QWORD)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int8x8_t *v6;
  int8x8_t *v7;
  unsigned int v8;
  int8x8_t *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  v6 = (int8x8_t *)objc_msgSend(v4, "attributes");
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");
  v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4AuLL);
  v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4AuLL);
  if (v8 && (_DWORD)v9)
  {
    objc_msgSend(v4, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "L2FeatureVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 334);
    v13 = v12;
    objc_msgSend(v11, "scoreForFeature:", 334);
    v15 = v13 <= v14;
    if (v13 != v14)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 333);
    v17 = v16;
    objc_msgSend(v11, "scoreForFeature:", 333);
    v15 = v17 <= v18;
    if (v17 != v18)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 332);
    v20 = v19;
    objc_msgSend(v11, "scoreForFeature:", 332);
    v15 = v20 <= v21;
    if (v20 != v21)
      goto LABEL_7;
    objc_msgSend(v10, "scoreForFeature:", 331);
    v23 = v22;
    objc_msgSend(v11, "scoreForFeature:", 331);
    v15 = v23 <= v24;
    if (v23 == v24)
    {
      v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15)
        v25 = -1;
      else
        v25 = 1;
    }

  }
  else if (v8)
  {
    v25 = 1;
  }
  else
  {
    v25 = (uint64_t)((_QWORD)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a3;
  v5 = -[PRSRankingItem indexScore](a2);
  v7 = v6;
  v8 = -[PRSRankingItem indexScore]((uint64_t)v4);
  v10 = v9;

  if (__PAIR128__(v7, v5) < __PAIR128__(v10, v8))
    return -1;
  else
    return __PAIR128__(v10, v8) < __PAIR128__(v7, v5);
}

+ (id)_predicateForRelativeFeature:(unint64_t)a3 currentTime:(double)a4
{
  void *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t, void *);
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  double v19;

  switch(a3)
  {
    case 0uLL:
    case 0xEuLL:
      v6 = (void *)MEMORY[0x1E0CB3880];
      v7 = 32;
      goto LABEL_9;
    case 1uLL:
    case 0xFuLL:
      v6 = (void *)MEMORY[0x1E0CB3880];
      v7 = 9;
      goto LABEL_9;
    case 2uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke;
      v18 = &__block_descriptor_40_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
      v19 = a4;
      v5 = &v15;
      goto LABEL_14;
    case 3uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_2;
      v13 = &__block_descriptor_40_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
      v14 = a4;
      v5 = &v10;
      goto LABEL_14;
    case 4uLL:
      v6 = (void *)MEMORY[0x1E0CB3880];
      v7 = 29;
LABEL_9:
      objc_msgSend(v6, "_predicateForItemsWithAttribute:", v7, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 5uLL:
    case 0x10uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v5 = (uint64_t *)&__block_literal_global_66;
      goto LABEL_14;
    case 6uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v5 = (uint64_t *)&__block_literal_global_67;
      goto LABEL_14;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v5 = (uint64_t *)&__block_literal_global_68;
      goto LABEL_14;
    case 0xDuLL:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 0x11uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v5 = (uint64_t *)&__block_literal_global_70;
      goto LABEL_14;
    case 0x12uLL:
      v4 = (void *)MEMORY[0x1E0CB3880];
      v5 = (uint64_t *)&__block_literal_global_69;
LABEL_14:
      objc_msgSend(v4, "predicateWithBlock:", v5, a4, v10, v11, v12, v13, *(_QWORD *)&v14, v15, v16, v17, v18, *(_QWORD *)&v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    default:
      +[PRSRankingItemRelativeFeatureContext _predicateForRelativeFeature:currentTime:].cold.1();
  }
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), 0x11uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(v3, "earlierDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), 0x11uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(v3, "earlierDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), 0x43uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.application"));

  return v3;
}

uint64_t __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

  return v3;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_6(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "closestUpComingDate");
  return v2 != 0.0;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_7(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "mostRecentUsedDate");
  return v2 != 0.0;
}

+ (void)_associatedPRSL2FeatureFromRelativeFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5
{
  unsigned __int16 v5;

  if (a3 >= 0x13)
    +[PRSRankingItemRelativeFeatureContext _associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:].cold.1();
  v5 = word_1B87DF2F0[a3];
  *a5 = word_1B87DF2CA[a3];
  *a4 = v5;
}

- (PRSRankingItemRelativeFeatureContext)initWithFeature:(unint64_t)a3 currentTime:(double)a4
{
  PRSRankingItemRelativeFeatureContext *v6;
  void *v7;
  void *v8;
  unsigned __int16 v10;
  unsigned __int16 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRSRankingItemRelativeFeatureContext;
  v6 = -[PRSRankingItemRelativeFeatureContext init](&v12, sel_init);
  if (v6)
  {
    v11 = 3235;
    v10 = 3235;
    +[PRSRankingItemRelativeFeatureContext _associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:](PRSRankingItemRelativeFeatureContext, "_associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:", a3, &v11, &v10);
    -[PRSRankingItemRelativeFeatureContext setAbsRankFeature:](v6, "setAbsRankFeature:", v11);
    -[PRSRankingItemRelativeFeatureContext setRelRankFeature:](v6, "setRelRankFeature:", v10);
    +[PRSRankingItemRelativeFeatureContext _predicateForRelativeFeature:currentTime:](PRSRankingItemRelativeFeatureContext, "_predicateForRelativeFeature:currentTime:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItemRelativeFeatureContext setPredicate:](v6, "setPredicate:", v7);

    +[PRSRankingItemRelativeFeatureContext _resultComparatorForRelativeFeature:](PRSRankingItemRelativeFeatureContext, "_resultComparatorForRelativeFeature:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItemRelativeFeatureContext setComparator:](v6, "setComparator:", v8);

  }
  return v6;
}

- (unsigned)relRankFeature
{
  return self->_relRankFeature;
}

- (void)setRelRankFeature:(unsigned __int16)a3
{
  self->_relRankFeature = a3;
}

- (unsigned)absRankFeature
{
  return self->_absRankFeature;
}

- (void)setAbsRankFeature:(unsigned __int16)a3
{
  self->_absRankFeature = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (void)_resultComparatorForRelativeFeature:.cold.1()
{
  __assert_rtn("+[PRSRankingItemRelativeFeatureContext _resultComparatorForRelativeFeature:]", "PRSRankingItemRelativeFeatureContext.m", 438, "NO");
}

+ (void)_predicateForRelativeFeature:currentTime:.cold.1()
{
  __assert_rtn("+[PRSRankingItemRelativeFeatureContext _predicateForRelativeFeature:currentTime:]", "PRSRankingItemRelativeFeatureContext.m", 515, "NO");
}

+ (void)_associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:.cold.1()
{
  __assert_rtn("+[PRSRankingItemRelativeFeatureContext _associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:]", "PRSRankingItemRelativeFeatureContext.m", 602, "NO");
}

@end
