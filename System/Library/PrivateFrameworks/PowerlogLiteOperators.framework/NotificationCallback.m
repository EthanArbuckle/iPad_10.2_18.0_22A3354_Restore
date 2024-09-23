@implementation NotificationCallback

id __NotificationCallback_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "batteryBreakdownWithPayload:", &unk_1E864B248);
}

void __NotificationCallback_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  void *v30;
  void *v31;
  SEL v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v34 = *(id *)(a1 + 40);
  objc_msgSend(v34, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.powerlogd.accounting."), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("testAll")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "testNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v9, "rangeOfString:", CFSTR("Reload")) == 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(v9, "rangeOfString:", CFSTR("All")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v3, "addObject:", v9);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v6);
    }
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("testDistributionAll"), v2))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "testNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v4);
          v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          if (objc_msgSend(v14, "rangeOfString:", CFSTR("testDistribution")) != 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v14, "isEqualToString:", CFSTR("testDistributionAll")) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v11);
    }
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("testCorrectionAll")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "testNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v4);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
          if (objc_msgSend(v19, "rangeOfString:", CFSTR("testCorrection")) != 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v19, "isEqualToString:", CFSTR("testCorrectionAll")) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v19);
          }
        }
        v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      }
      while (v16);
    }
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("testQualificationAll")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "testNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (m = 0; m != v21; ++m)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v4);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * m);
          if (objc_msgSend(v24, "rangeOfString:", CFSTR("testQualification")) != 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v24, "isEqualToString:", CFSTR("testQualificationAll")) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
      }
      while (v21);
    }
  }
  else
  {
    v56 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "mutableCopy");
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v3;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * n);
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("testInit")) & 1) == 0
          && objc_msgSend(v30, "rangeOfString:", CFSTR("ReloadAfter")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "reset");

        }
        v32 = NSSelectorFromString((NSString *)v30);
        ((void (*)(_QWORD, SEL))objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "methodForSelector:", v32))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v32);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
    }
    while (v27);
  }

}

@end
