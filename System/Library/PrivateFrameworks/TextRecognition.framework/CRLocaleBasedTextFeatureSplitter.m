@implementation CRLocaleBasedTextFeatureSplitter

- (CRLocaleBasedTextFeatureSplitter)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLocaleBasedTextFeatureSplitter;
  return -[CRMultiModelTextFeatureSplitter initWithConfiguration:](&v4, sel_initWithConfiguration_, a3);
}

- (void)enumerateIndicesForLineRegions:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CROrderedIndexSet *v9;
  CROrderedIndexSet *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CROrderedIndexSet *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  BOOL v36;
  void *v37;
  CROrderedIndexSet *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  CROrderedIndexSet *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  CROrderedIndexSet *v69;
  id v70;
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = a4;
  -[CRLocaleBasedTextFeatureSplitter preferredLocales](self, "preferredLocales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", v6);
  v48 = objc_msgSend(v6, "count");
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke;
  v68[3] = &unk_1E98DB270;
  v68[4] = self;
  v10 = v9;
  v69 = v10;
  v11 = v7;
  v70 = v11;
  v12 = v8;
  v71 = v12;
  v13 = v6;
  v72 = v13;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v68);
  if (-[CROrderedIndexSet count](v10, "count"))
  {
    objc_msgSend(v12, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLocaleBasedTextFeatureSplitter _preferredLocaleFromScriptLocales:](self, "_preferredLocaleFromScriptLocales:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v11, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", v15, v48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", v13);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v15);

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addIndexSet:", v10);

  }
  v52 = v13;
  v50 = v10;
  v19 = objc_msgSend(v11, "indexOfObject:", CFSTR("ja-JP"), v48);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  +[CRImageReader supportedChineseLanguages](CRImageReader, "supportedChineseLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v65;
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v65 != v23)
          objc_enumerationMutation(v20);
        v26 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
        if (v26 < v24 && v26 != 0x7FFFFFFFFFFFFFFFLL)
          v24 = v26;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v22);
  }
  else
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 < v24
    || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ja-JP")),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v28,
        v28))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    +[CRImageReader supportedChineseLanguages](CRImageReader, "supportedChineseLanguages");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    if (!v30)
    {
LABEL_43:

      goto LABEL_44;
    }
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v61 != v33)
          objc_enumerationMutation(v29);
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 != 0;

        v32 |= v36;
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v31);

    if ((v32 & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ja-JP"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v38 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", v52);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("ja-JP"));

      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      +[CRImageReader supportedChineseLanguages](CRImageReader, "supportedChineseLanguages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v57 != v41)
              objc_enumerationMutation(v29);
            v43 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
            objc_msgSend(v12, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ja-JP"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v43);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addIndexSet:", v46);

            }
          }
          v40 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
        }
        while (v40);
      }
      goto LABEL_43;
    }
  }
LABEL_44:
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke_2;
  v53[3] = &unk_1E98DB298;
  v54 = v51;
  v55 = v49;
  v47 = v51;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v53);

}

void __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  CROrderedIndexSet *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_topScriptCategoryBasedOnPreferredLocales:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scriptLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_preferredLocaleFromScriptLocales:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v8, v6);

    }
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndex:", a3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

void __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))((double)(unint64_t)objc_msgSend(v5, "count") / (double)*(uint64_t *)(a1 + 40));

}

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_recognizerRegionsFromLineRegions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__CRLocaleBasedTextFeatureSplitter_enumerateLineRegions_usingBlock___block_invoke;
  v10[3] = &unk_1E98DB2C0;
  v11 = v6;
  v9 = v6;
  -[CRLocaleBasedTextFeatureSplitter enumerateIndicesForLineRegions:usingBlock:](self, "enumerateIndicesForLineRegions:usingBlock:", v8, v10);

}

void __68__CRLocaleBasedTextFeatureSplitter_enumerateLineRegions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5)
{
  uint64_t v8;
  id v9;
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  objc_msgSend(a3, "objects");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t, double))(v8 + 16))(v8, v9, v10, a4, a5);

}

- (id)_topScriptCategoryBasedOnPreferredLocales:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  float v63;
  void *v64;
  void *v65;
  void *v66;
  float v67;
  void *v68;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRLocaleBasedTextFeatureSplitter preferredLocales](self, "preferredLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = off_1E98D7000;
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v6))
  {
    objc_msgSend(v4, "topScriptCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 chinese]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v4, "scriptCategoryCounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 latinCyrillic]();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (float)objc_msgSend(v77, "longValue");
      objc_msgSend(v4, "scriptCategoryCounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 common]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v12;
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longValue");
      objc_msgSend(v4, "scriptCategoryCounts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 chinese]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((float)((float)(objc_msgSend(v18, "longValue") + v15) * 80.0) <= v11)
      {

      }
      else
      {
        objc_msgSend(v4, "scriptCategoryCounts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRScriptCategoryV1 chinese]();
        v20 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v71 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v22, "longValue");

        v6 = v20;
        v7 = off_1E98D7000;

        if (v70 >= 1)
        {
          +[CRScriptCategoryV1 chinese]();
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
      }
    }
  }
  if (!-[__objc2_class languageIsKorean:](v7[25], "languageIsKorean:", v6))
    goto LABEL_37;
  objc_msgSend(v4, "topScriptCategory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 korean]();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 == v25)
    goto LABEL_37;
  v81 = v6;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v4, "scriptCategoryCounts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v88 != v31)
          objc_enumerationMutation(v27);
        v30 += objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "longValue");
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
  }

  objc_msgSend(v4, "scriptCategoryCounts");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 korean]();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectForKeyedSubscript:", v75);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v72, "longValue");
  objc_msgSend(v4, "scriptCategoryCounts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 common]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "longValue");
  objc_msgSend(v4, "scriptCategoryCounts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 unknown]();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (float)(v30 - objc_msgSend(v40, "longValue") - (v33 + v37));
  objc_msgSend(v4, "scriptCategoryCounts");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 korean]();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (float)objc_msgSend(v44, "longValue") * 3.0;

  v6 = v81;
  v7 = off_1E98D7000;
  if (v45 > v41)
  {
    +[CRScriptCategoryV1 korean]();
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[__objc2_class languageIsJapanese:](v7[25], "languageIsJapanese:", v6))
      goto LABEL_32;
    objc_msgSend(v4, "topScriptCategory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 japanese]();
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46 == v47)
      goto LABEL_32;
LABEL_37:
    v82 = v6;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(v4, "scriptCategoryCounts");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "allValues");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v84 != v53)
            objc_enumerationMutation(v49);
          v52 += objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "longValue");
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v51);
    }
    else
    {
      v52 = 0;
    }

    objc_msgSend(v4, "scriptCategoryCounts");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 japanese]();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", v76);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v73, "longValue");
    objc_msgSend(v4, "scriptCategoryCounts");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 common]();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "longValue");
    objc_msgSend(v4, "scriptCategoryCounts");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 unknown]();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (float)(v52 - objc_msgSend(v62, "longValue") - (v55 + v59));
    objc_msgSend(v4, "scriptCategoryCounts");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 japanese]();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKeyedSubscript:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (float)objc_msgSend(v66, "longValue") * 3.0;

    v6 = v82;
    if (v67 > v63)
    {
      +[CRScriptCategoryV1 japanese]();
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_32:
      objc_msgSend(v4, "topScriptCategory");
      v23 = objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_33:
  v68 = (void *)v23;

  return v68;
}

- (id)_preferredLocaleFromScriptLocales:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CRLocaleBasedTextFeatureSplitter preferredLocales](self, "preferredLocales", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "containsObject:", v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)preferredLocales
{
  void *v2;
  void *v3;
  void *v4;

  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)preferredLocaleBasedScriptVoting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRLocaleBasedTextFeatureSplitter preferredLocales](self, "preferredLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = off_1E98D7000;
  v79 = v6;
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v6))
  {
    objc_msgSend(v4, "selectedScriptCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 chinese]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v4, "scriptCounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 latinCyrillic]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (float)objc_msgSend(v76, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 common]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 chinese]();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((float)((float)(objc_msgSend(v19, "longValue") + v16) * 80.0) <= v12)
      {

        v6 = v79;
        v7 = off_1E98D7000;
        goto LABEL_7;
      }
      objc_msgSend(v4, "scriptCounts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 chinese]();
      v73 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v21);
      v70 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v22, "longValue");

      v6 = v79;
      v7 = off_1E98D7000;
      if (v67 >= 1)
      {
        +[CRScriptCategoryV1 chinese]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSelectedScriptCategory:", v10);
LABEL_7:

      }
    }
  }
  if (-[__objc2_class languageIsKorean:](v7[25], "languageIsKorean:", v6))
  {
    objc_msgSend(v4, "selectedScriptCategory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 korean]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 != v24)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      objc_msgSend(v4, "scriptCounts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
      if (v27)
      {
        v28 = v27;
        v29 = 0;
        v30 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v85 != v30)
              objc_enumerationMutation(v26);
            v29 += objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "longValue");
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        }
        while (v28);
      }
      else
      {
        v29 = 0;
      }

      objc_msgSend(v4, "scriptCounts");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 korean]();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", v74);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v71, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 common]();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 unknown]();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (float)(v29 - objc_msgSend(v38, "longValue") - (v32 + v35));
      objc_msgSend(v4, "scriptCounts");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 korean]();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (float)objc_msgSend(v42, "longValue") * 3.0;

      v6 = v79;
      v7 = off_1E98D7000;
      if (v43 > v39)
      {
        +[CRScriptCategoryV1 korean]();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSelectedScriptCategory:", v44);

      }
    }
  }
  if (-[__objc2_class languageIsJapanese:](v7[25], "languageIsJapanese:", v6))
  {
    objc_msgSend(v4, "selectedScriptCategory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 japanese]();
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45 != v46)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v4, "scriptCounts");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "allValues");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v49)
      {
        v50 = v49;
        v51 = 0;
        v52 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v81 != v52)
              objc_enumerationMutation(v48);
            v51 += objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "longValue");
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        }
        while (v50);
      }
      else
      {
        v51 = 0;
      }

      objc_msgSend(v4, "scriptCounts");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 japanese]();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKeyedSubscript:", v75);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v72, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 common]();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKeyedSubscript:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "longValue");
      objc_msgSend(v4, "scriptCounts");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 unknown]();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (float)(v51 - objc_msgSend(v60, "longValue") - (v54 + v57));
      objc_msgSend(v4, "scriptCounts");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 japanese]();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKeyedSubscript:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (float)objc_msgSend(v64, "longValue") * 3.0;

      v6 = v79;
      if (v65 > v61)
      {
        +[CRScriptCategoryV1 japanese]();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSelectedScriptCategory:", v66);

      }
    }
  }

}

@end
