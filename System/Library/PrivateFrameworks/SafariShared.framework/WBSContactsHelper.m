@implementation WBSContactsHelper

+ (id)CNContactKeyFromWBSABKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = CNContactKeyFromWBSABKey__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&CNContactKeyFromWBSABKey__once, &__block_literal_global_25);
  objc_msgSend((id)CNContactKeyFromWBSABKey__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

void __46__WBSContactsHelper_CNContactKeyFromWBSABKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[29];
  _QWORD v35[30];

  v35[29] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C967F0];
  v1 = *MEMORY[0x1E0D89D40];
  v34[0] = *MEMORY[0x1E0D89D38];
  v34[1] = v1;
  v2 = *MEMORY[0x1E0C96670];
  v35[0] = v0;
  v35[1] = v2;
  v3 = *MEMORY[0x1E0C966A8];
  v4 = *MEMORY[0x1E0D89D68];
  v34[2] = *MEMORY[0x1E0D89D48];
  v34[3] = v4;
  v5 = *MEMORY[0x1E0C966D0];
  v35[2] = v3;
  v35[3] = v5;
  v6 = *MEMORY[0x1E0C96740];
  v34[4] = *MEMORY[0x1E0D89D50];
  v34[5] = CFSTR("JobTitle");
  v7 = *MEMORY[0x1E0C96758];
  v35[4] = v6;
  v35[5] = v7;
  v8 = *MEMORY[0x1E0C966C0];
  v9 = *MEMORY[0x1E0D89D78];
  v34[6] = *MEMORY[0x1E0D89D70];
  v34[7] = v9;
  v10 = *MEMORY[0x1E0C96780];
  v35[6] = v8;
  v35[7] = v10;
  v11 = *MEMORY[0x1E0C967B8];
  v12 = *MEMORY[0x1E0D89D60];
  v34[8] = *MEMORY[0x1E0D89D58];
  v34[9] = v12;
  v13 = *MEMORY[0x1E0C967C0];
  v35[8] = v11;
  v35[9] = v13;
  v14 = *MEMORY[0x1E0C968A0];
  v34[10] = CFSTR("URLs");
  v34[11] = CFSTR("Street");
  v15 = *MEMORY[0x1E0C970C8];
  v35[10] = v14;
  v35[11] = v15;
  v16 = *MEMORY[0x1E0C97098];
  v34[12] = CFSTR("City");
  v34[13] = CFSTR("State");
  v17 = *MEMORY[0x1E0C970C0];
  v35[12] = v16;
  v35[13] = v17;
  v18 = *MEMORY[0x1E0C970A0];
  v34[14] = CFSTR("Country");
  v34[15] = CFSTR("ZIP");
  v19 = *MEMORY[0x1E0C970B0];
  v35[14] = v18;
  v35[15] = v19;
  v20 = *MEMORY[0x1E0C96900];
  v34[16] = CFSTR("InstantMessageUsername");
  v34[17] = CFSTR("InstantMessageService");
  v21 = *MEMORY[0x1E0C968F8];
  v35[16] = v20;
  v35[17] = v21;
  v22 = *MEMORY[0x1E0C96FF8];
  v34[18] = CFSTR("_$!<Home>!$_");
  v34[19] = CFSTR("_$!<HomePage>!$_");
  v23 = *MEMORY[0x1E0C97068];
  v35[18] = v22;
  v35[19] = v23;
  v24 = *MEMORY[0x1E0C97070];
  v34[20] = CFSTR("_$!<Work>!$_");
  v34[21] = CFSTR("_$!<Other>!$_");
  v25 = *MEMORY[0x1E0C97000];
  v35[20] = v24;
  v35[21] = v25;
  v26 = *MEMORY[0x1E0C97028];
  v34[22] = CFSTR("_$!<Mobile>!$_");
  v34[23] = CFSTR("iPhone");
  v27 = *MEMORY[0x1E0C97058];
  v35[22] = v26;
  v35[23] = v27;
  v28 = *MEMORY[0x1E0C97020];
  v34[24] = CFSTR("_$!<Main>!$_");
  v34[25] = CFSTR("_$!<HomeFAX>!$_");
  v29 = *MEMORY[0x1E0C97010];
  v35[24] = v28;
  v35[25] = v29;
  v30 = *MEMORY[0x1E0C97050];
  v34[26] = CFSTR("_$!<WorkFAX>!$_");
  v34[27] = CFSTR("_$!<OtherFAX>!$_");
  v31 = *MEMORY[0x1E0C97030];
  v35[26] = v30;
  v35[27] = v31;
  v34[28] = CFSTR("_$!<Pager>!$_");
  v35[28] = *MEMORY[0x1E0C97038];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 29);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)CNContactKeyFromWBSABKey__map;
  CNContactKeyFromWBSABKey__map = v32;

}

+ (id)WBSABKeyFromCNContactKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = WBSABKeyFromCNContactKey__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&WBSABKeyFromCNContactKey__once, &__block_literal_global_1);
  objc_msgSend((id)WBSABKeyFromCNContactKey__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

void __46__WBSContactsHelper_WBSABKeyFromCNContactKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[29];
  _QWORD v26[30];

  v26[29] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D89D38];
  v1 = *MEMORY[0x1E0C96670];
  v25[0] = *MEMORY[0x1E0C967F0];
  v25[1] = v1;
  v2 = *MEMORY[0x1E0D89D40];
  v26[0] = v0;
  v26[1] = v2;
  v3 = *MEMORY[0x1E0D89D48];
  v4 = *MEMORY[0x1E0C966D0];
  v25[2] = *MEMORY[0x1E0C966A8];
  v25[3] = v4;
  v5 = *MEMORY[0x1E0D89D68];
  v26[2] = v3;
  v26[3] = v5;
  v6 = *MEMORY[0x1E0D89D50];
  v7 = *MEMORY[0x1E0C96758];
  v25[4] = *MEMORY[0x1E0C96740];
  v25[5] = v7;
  v26[4] = v6;
  v26[5] = CFSTR("JobTitle");
  v8 = *MEMORY[0x1E0D89D70];
  v9 = *MEMORY[0x1E0C96780];
  v25[6] = *MEMORY[0x1E0C966C0];
  v25[7] = v9;
  v10 = *MEMORY[0x1E0D89D78];
  v26[6] = v8;
  v26[7] = v10;
  v11 = *MEMORY[0x1E0D89D58];
  v12 = *MEMORY[0x1E0C967C0];
  v25[8] = *MEMORY[0x1E0C967B8];
  v25[9] = v12;
  v13 = *MEMORY[0x1E0D89D60];
  v26[8] = v11;
  v26[9] = v13;
  v14 = *MEMORY[0x1E0C970C8];
  v25[10] = *MEMORY[0x1E0C968A0];
  v25[11] = v14;
  v26[10] = CFSTR("URLs");
  v26[11] = CFSTR("Street");
  v15 = *MEMORY[0x1E0C970C0];
  v25[12] = *MEMORY[0x1E0C97098];
  v25[13] = v15;
  v26[12] = CFSTR("City");
  v26[13] = CFSTR("State");
  v16 = *MEMORY[0x1E0C970B0];
  v25[14] = *MEMORY[0x1E0C970A0];
  v25[15] = v16;
  v26[14] = CFSTR("Country");
  v26[15] = CFSTR("ZIP");
  v17 = *MEMORY[0x1E0C968F8];
  v25[16] = *MEMORY[0x1E0C96900];
  v25[17] = v17;
  v26[16] = CFSTR("InstantMessageUsername");
  v26[17] = CFSTR("InstantMessageService");
  v18 = *MEMORY[0x1E0C97068];
  v25[18] = *MEMORY[0x1E0C96FF8];
  v25[19] = v18;
  v26[18] = CFSTR("_$!<Home>!$_");
  v26[19] = CFSTR("_$!<HomePage>!$_");
  v19 = *MEMORY[0x1E0C97000];
  v25[20] = *MEMORY[0x1E0C97070];
  v25[21] = v19;
  v26[20] = CFSTR("_$!<Work>!$_");
  v26[21] = CFSTR("_$!<Other>!$_");
  v20 = *MEMORY[0x1E0C97058];
  v25[22] = *MEMORY[0x1E0C97028];
  v25[23] = v20;
  v26[22] = CFSTR("_$!<Mobile>!$_");
  v26[23] = CFSTR("iPhone");
  v21 = *MEMORY[0x1E0C97010];
  v25[24] = *MEMORY[0x1E0C97020];
  v25[25] = v21;
  v26[24] = CFSTR("_$!<Main>!$_");
  v26[25] = CFSTR("_$!<HomeFAX>!$_");
  v22 = *MEMORY[0x1E0C97030];
  v25[26] = *MEMORY[0x1E0C97050];
  v25[27] = v22;
  v26[26] = CFSTR("_$!<WorkFAX>!$_");
  v26[27] = CFSTR("_$!<OtherFAX>!$_");
  v25[28] = *MEMORY[0x1E0C97038];
  v26[28] = CFSTR("_$!<Pager>!$_");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 29);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)WBSABKeyFromCNContactKey__map;
  WBSABKeyFromCNContactKey__map = v23;

}

@end
