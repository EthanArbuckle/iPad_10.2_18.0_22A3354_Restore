@implementation CACVoiceOverShortDescriptionGenerator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  return (id)sharedInstance_Generator;
}

void __55__CACVoiceOverShortDescriptionGenerator_sharedInstance__block_invoke()
{
  CACVoiceOverShortDescriptionGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(CACVoiceOverShortDescriptionGenerator);
  v1 = (void *)sharedInstance_Generator;
  sharedInstance_Generator = (uint64_t)v0;

}

- (id)_items:(id)a3 byKeyGeneratedUsingBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v6[2](v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_addToItemShortDescriptionPairs:(id)a3 foritems:(id)a4 keyGenerationBlocks:(id)a5 shortDescriptionGenerationBlocks:(id)a6 lastResortShortDescriptionGenerationBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  CACVoiceOverItemShortDescriptionPair *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  CACVoiceOverItemShortDescriptionPair *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  CACVoiceOverShortDescriptionGenerator *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v42 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self;
  v37 = v13;
  -[CACVoiceOverShortDescriptionGenerator _items:byKeyGeneratedUsingBlock:](self, "_items:byKeyGeneratedUsingBlock:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v14;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v19 = v17;
  v44 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v50;
    v41 = v19;
    v38 = v14;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(v19);
        objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count") == 1)
        {
          v22 = objc_alloc_init(CACVoiceOverItemShortDescriptionPair);
          objc_msgSend(v21, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACVoiceOverItemShortDescriptionPair setItem:](v22, "setItem:", v23);
          objc_msgSend(v42, "firstObject");
          v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v24)[2](v24, v23);
          v25 = v18;
          v26 = v21;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACVoiceOverItemShortDescriptionPair setShortDescription:](v22, "setShortDescription:", v27);

          v21 = v26;
          v18 = v25;
          objc_msgSend(v12, "addObject:", v22);

          v19 = v41;
          goto LABEL_8;
        }
        if ((unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          if ((unint64_t)objc_msgSend(v18, "count") < 2)
          {
            CACLogAccessibility();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v55 = v21;
              _os_log_impl(&dword_229A40000, v28, OS_LOG_TYPE_DEFAULT, "Unable to provide unique short descriptions for elements: %{private}@", buf, 0xCu);
            }

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v22 = v21;
            v29 = -[CACVoiceOverItemShortDescriptionPair countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (v29)
            {
              v30 = v29;
              v40 = v21;
              v31 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v46 != v31)
                    objc_enumerationMutation(v22);
                  v33 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                  v34 = objc_alloc_init(CACVoiceOverItemShortDescriptionPair);
                  -[CACVoiceOverItemShortDescriptionPair setItem:](v34, "setItem:", v33);
                  v15[2](v15, v33);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CACVoiceOverItemShortDescriptionPair setShortDescription:](v34, "setShortDescription:", v35);

                  objc_msgSend(v12, "addObject:", v34);
                }
                v30 = -[CACVoiceOverItemShortDescriptionPair countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
              }
              while (v30);
              v18 = v38;
              v21 = v40;
              v19 = v41;
            }
          }
          else
          {
            objc_msgSend(v18, "subarrayWithRange:", 1, objc_msgSend(v18, "count") - 1);
            v22 = (CACVoiceOverItemShortDescriptionPair *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "subarrayWithRange:", 1, objc_msgSend(v42, "count") - 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CACVoiceOverShortDescriptionGenerator _addToItemShortDescriptionPairs:foritems:keyGenerationBlocks:shortDescriptionGenerationBlocks:lastResortShortDescriptionGenerationBlock:](v39, "_addToItemShortDescriptionPairs:foritems:keyGenerationBlocks:shortDescriptionGenerationBlocks:lastResortShortDescriptionGenerationBlock:", v12, v21, v22, v23, v15);
LABEL_8:

          }
        }

        ++v20;
      }
      while (v20 != v44);
      v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      v44 = v36;
    }
    while (v36);
  }

}

- (id)_lowerPitchForString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDFEA60];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

    objc_msgSend(v5, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBC8]);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)shortDescriptionsForItems:(id)a3 style:(int64_t)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  int64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  int64_t v55;
  _QWORD v56[5];
  id v57;
  int64_t v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[7];

  v61[5] = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v6 = MEMORY[0x24BDAC760];
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke;
  v59[3] = &__block_descriptor_40_e45___NSString_16__0___CACVoiceOverDescribable__8l;
  v59[4] = a4;
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_2;
  v56[3] = &unk_24F2AC498;
  v57 = (id)MEMORY[0x22E2D5D40](v59);
  v58 = a4;
  v36 = a4;
  v56[4] = self;
  v34 = v57;
  v52[0] = v56[0];
  v52[1] = 3221225472;
  v52[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_4;
  v52[3] = &unk_24F2AC500;
  v55 = a4;
  v52[4] = self;
  v53 = &__block_literal_global_198_0;
  v7 = (id)MEMORY[0x22E2D5D40](v56);
  v54 = v7;
  v37 = (void *)MEMORY[0x22E2D5D40](v52);
  v49[0] = v6;
  v49[1] = 3221225472;
  v49[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_6;
  v49[3] = &unk_24F2AC548;
  v8 = v7;
  v49[4] = self;
  v50 = v8;
  v51 = &__block_literal_global_199_0;
  v32 = (void *)MEMORY[0x22E2D5D40](v49);
  v46[0] = v6;
  v46[1] = 3221225472;
  v46[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_8;
  v46[3] = &unk_24F2AC548;
  v9 = v8;
  v46[4] = self;
  v47 = v9;
  v48 = &__block_literal_global_200_0;
  v30 = (void *)MEMORY[0x22E2D5D40](v46);
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applicationOrientation");

  v45[0] = v6;
  v45[1] = 3221225472;
  v45[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_9;
  v45[3] = &__block_descriptor_40_e45___NSString_16__0___CACVoiceOverDescribable__8l;
  v45[4] = v12;
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_10;
  v42[3] = &unk_24F2AC548;
  v42[4] = self;
  v43 = v9;
  v44 = (id)MEMORY[0x22E2D5D40](v45);
  v33 = v44;
  v13 = v9;
  v29 = (void *)MEMORY[0x22E2D5D40](v42);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x22E2D5D40](v34);
  v61[0] = v28;
  v61[1] = &__block_literal_global_198_0;
  v61[2] = &__block_literal_global_199_0;
  v61[3] = &__block_literal_global_200_0;
  v27 = (void *)MEMORY[0x22E2D5D40](v33);
  v61[4] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  v16 = (void *)MEMORY[0x22E2D5D40](v13);
  v60[0] = v16;
  v17 = (void *)MEMORY[0x22E2D5D40](v37);
  v60[1] = v17;
  v18 = (void *)MEMORY[0x22E2D5D40](v32);
  v60[2] = v18;
  v19 = (void *)MEMORY[0x22E2D5D40](v30);
  v60[3] = v19;
  v20 = (void *)MEMORY[0x22E2D5D40](v29);
  v60[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACVoiceOverShortDescriptionGenerator _addToItemShortDescriptionPairs:foritems:keyGenerationBlocks:shortDescriptionGenerationBlocks:lastResortShortDescriptionGenerationBlock:](self, "_addToItemShortDescriptionPairs:foritems:keyGenerationBlocks:shortDescriptionGenerationBlocks:lastResortShortDescriptionGenerationBlock:", v14, v35, v15, v21, v13);

  v22 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_11;
  v39[3] = &unk_24F2AC590;
  v40 = v35;
  v41 = v36;
  v23 = v35;
  objc_msgSend(v14, "sortedArrayUsingComparator:", v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_12;
  v38[3] = &__block_descriptor_40_e46__16__0__CACVoiceOverItemShortDescriptionPair_8l;
  v38[4] = v36;
  objc_msgSend(v24, "ax_flatMappedArrayUsingBlock:", v38);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

_QWORD *__73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  v5 = a1[4];
  if (v5 == 1)
  {
    objc_msgSend(v3, "recognitionLabel");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v5)
  {
    objc_msgSend(v3, "unfilteredRecognitionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CACNonNilStringWithinLengthLimit(v6, 10, 0x32uLL);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a2;
  v5 = v4;
  v6 = a1[6];
  if (v6 == 1)
  {
    (*(void (**)(void))(a1[5] + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v6)
  {
    objc_msgSend(v4, "numberedLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)a1[4];
    (*(void (**)(void))(a1[5] + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_lowerPitchForString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "fullLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CACNonNilStringWithinLengthLimit(v2, 10, 0x32uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a2;
  v5 = v4;
  v6 = a1[7];
  if (v6 == 1)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v6)
  {
    objc_msgSend(v4, "numberedLabel");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    v9 = (void *)a1[4];
    (*(void (**)(void))(a1[5] + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_lowerPitchForString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CACNonNilStringWithinLengthLimit(v2, 10, 0x32uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_6(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a1[5];
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[4];
  (*(void (**)(void))(a1[6] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_lowerPitchForString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;

  v2 = objc_msgSend(a2, "traits");
  v3 = v2;
  if ((*MEMORY[0x24BDFEE58] & v2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Trait.BackButton");
LABEL_7:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24F2ADCC8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if ((*MEMORY[0x24BDFEEE0] & v2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Trait.KeyboardKey");
    goto LABEL_7;
  }
  if ((*MEMORY[0x24BDFEE60] & v2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Trait.Button");
    goto LABEL_7;
  }
  v7 = &stru_24F2ADCC8;
LABEL_8:
  if ((*MEMORY[0x24BDFEED0] & v3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Trait.Image"), &stru_24F2ADCC8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v9;
  }
  if ((*MEMORY[0x24BDFEF78] & v3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Trait.SearchField");
  }
  else
  {
    if ((*MEMORY[0x24BDFF008] & v3) == 0)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Trait.TextEntry");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24F2ADCC8, 0, v21, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v13 = objc_claimAutoreleasedReturnValue();

  v7 = (__CFString *)v13;
LABEL_15:
  if ((*MEMORY[0x24BDFEDB8] & v3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Trait.Adjustable"), &stru_24F2ADCC8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v15;
  }
  if ((*MEMORY[0x24BDFEEC0] & v3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Trait.Header"), &stru_24F2ADCC8, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v17;
  }
  if ((*MEMORY[0x24BDFEEF0] & v3) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Trait.Link"), &stru_24F2ADCC8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v19 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v19;
  }
  return v7;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_8(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a1[5];
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[4];
  (*(void (**)(void))(a1[6] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_lowerPitchForString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_9(uint64_t a1, void *a2)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat Height;
  double v18;
  double MidX;
  double MidY;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  double Width;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  objc_msgSend(a2, "frame");
  AXDeviceGetMainScreenBounds();
  AX_CGRectToOrientation();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  AX_CGRectToOrientation();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v28 = v16;
  v30.origin.x = v3;
  v30.origin.y = v5;
  v30.size.width = v7;
  v30.size.height = v9;
  v29 = CGRectGetWidth(v30) / 3.0;
  v31.origin.x = v3;
  v31.origin.y = v5;
  v31.size.width = v7;
  v31.size.height = v9;
  Width = CGRectGetWidth(v31);
  v32.origin.x = v3;
  v32.origin.y = v5;
  v32.size.width = v7;
  v32.size.height = v9;
  v27 = CGRectGetHeight(v32) / 3.0;
  v33.origin.x = v3;
  v33.origin.y = v5;
  v33.size.width = v7;
  v33.size.height = v9;
  Height = CGRectGetHeight(v33);
  v18 = (Height + Height) / 3.0;
  v34.origin.x = v11;
  v34.origin.y = v13;
  v34.size.width = v15;
  v34.size.height = v28;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = v11;
  v35.origin.y = v13;
  v35.size.width = v15;
  v35.size.height = v28;
  MidY = CGRectGetMidY(v35);
  if (MidX >= v29)
  {
    if (MidX >= (Width + Width) / 3.0)
    {
      if (MidY < v27)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("Frame.TopRight");
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (MidY >= v18)
        v23 = CFSTR("Frame.BottomRight");
      else
        v23 = CFSTR("Frame.MiddleRight");
    }
    else
    {
      if (MidY < v27)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = CFSTR("Frame.TopCenter");
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (MidY >= v18)
        v23 = CFSTR("Frame.BottomCenter");
      else
        v23 = CFSTR("Frame.MiddleCenter");
    }
LABEL_18:
    v21 = v22;
    goto LABEL_19;
  }
  if (MidY >= v27)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (MidY >= v18)
      v23 = CFSTR("Frame.BottomLeft");
    else
      v23 = CFSTR("Frame.MiddleLeft");
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = CFSTR("Frame.TopLeft");
LABEL_19:
  objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24F2ADCC8, 0, *(_QWORD *)&Width);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_10(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a1[5];
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[4];
  (*(void (**)(void))(a1[6] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_lowerPitchForString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 == 1)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v5, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "indexOfObject:", v17);

    v19 = *(void **)(a1 + 32);
    objc_msgSend(v6, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "indexOfObject:", v20);

    v14 = v18 == v21;
    v15 = -1;
    if (v18 >= v21)
      v15 = 1;
  }
  else
  {
    if (v7)
      goto LABEL_11;
    objc_msgSend(v5, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberedLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v6, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberedLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v14 = v10 == v13;
    v15 = -1;
    if (v10 >= v13)
      v15 = 1;
  }
  if (v14)
    a1 = 0;
  else
    a1 = v15;
LABEL_11:

  return a1;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == 1
    && (objc_msgSend(v3, "item"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "recognitionLabel"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        !v7))
  {
    CACLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138477827;
      v13 = v11;
      _os_log_impl(&dword_229A40000, v10, OS_LOG_TYPE_INFO, "No name found for %{private}@, so not describing it", (uint8_t *)&v12, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
