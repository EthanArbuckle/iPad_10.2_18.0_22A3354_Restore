@implementation PPContactLabelScoringMap

void __PPContactLabelScoringMap_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[14];
  _QWORD v35[16];

  v35[14] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD6630]();
  v0 = (void *)objc_opt_new();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = *MEMORY[0x1E0C97058];
  v34[0] = CFSTR("iPhone");
  v34[1] = CFSTR("Mobile");
  v3 = *MEMORY[0x1E0C97028];
  v35[0] = v2;
  v35[1] = v3;
  v4 = *MEMORY[0x1E0C97020];
  v34[2] = CFSTR("Main");
  v34[3] = CFSTR("Pager");
  v5 = *MEMORY[0x1E0C97038];
  v35[2] = v4;
  v35[3] = v5;
  v6 = *MEMORY[0x1E0C97010];
  v34[4] = CFSTR("HomeFax");
  v34[5] = CFSTR("WorkFax");
  v7 = *MEMORY[0x1E0C97050];
  v35[4] = v6;
  v35[5] = v7;
  v8 = *MEMORY[0x1E0C97030];
  v34[6] = CFSTR("OtherFax");
  v34[7] = CFSTR("Home");
  v9 = *MEMORY[0x1E0C96FF8];
  v35[6] = v8;
  v35[7] = v9;
  v10 = *MEMORY[0x1E0C97070];
  v34[8] = CFSTR("Work");
  v34[9] = CFSTR("School");
  v11 = *MEMORY[0x1E0C97060];
  v35[8] = v10;
  v35[9] = v11;
  v12 = *MEMORY[0x1E0C96FF0];
  v34[10] = CFSTR("EmailiCloud");
  v34[11] = CFSTR("URLAddressHomePage");
  v13 = *MEMORY[0x1E0C97068];
  v35[10] = v12;
  v35[11] = v13;
  v34[12] = CFSTR("DateAnniversary");
  v34[13] = CFSTR("Other");
  v14 = *MEMORY[0x1E0C97000];
  v35[12] = *MEMORY[0x1E0C96FE8];
  v35[13] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v1);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contactsLabelScoringMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21);
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "contactsLabelScoringMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v25, v26);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

  v27 = (void *)PPContactLabelScoringMap__pasExprOnceResult;
  PPContactLabelScoringMap__pasExprOnceResult = (uint64_t)v0;

  objc_autoreleasePoolPop(context);
}

@end
