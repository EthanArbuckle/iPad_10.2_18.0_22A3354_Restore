@implementation SSLocalRankingResultSignalManager

+ (id)_getSpotlightRecentEngagementAttributes
{
  if (_getSpotlightRecentEngagementAttributes_onceToken != -1)
    dispatch_once(&_getSpotlightRecentEngagementAttributes_onceToken, &__block_literal_global_36);
  return (id)_getSpotlightRecentEngagementAttributes_attrNames;
}

void __76__SSLocalRankingResultSignalManager__getSpotlightRecentEngagementAttributes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6790];
  v3[0] = *MEMORY[0x1E0CA67A0];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0CA67B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_getSpotlightRecentEngagementAttributes_attrNames;
  _getSpotlightRecentEngagementAttributes_attrNames = v1;

}

+ (id)_getSpotlightRecentEngagementAttributesNonUnique
{
  if (_getSpotlightRecentEngagementAttributesNonUnique_onceToken != -1)
    dispatch_once(&_getSpotlightRecentEngagementAttributesNonUnique_onceToken, &__block_literal_global_1_0);
  return (id)_getSpotlightRecentEngagementAttributesNonUnique_attrNames;
}

void __85__SSLocalRankingResultSignalManager__getSpotlightRecentEngagementAttributesNonUnique__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6798];
  v3[0] = *MEMORY[0x1E0CA67A8];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0CA67B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_getSpotlightRecentEngagementAttributesNonUnique_attrNames;
  _getSpotlightRecentEngagementAttributesNonUnique_attrNames = v1;

}

+ (id)updateRecentEngagementAttributes:(id)a3 queryString:(id)a4 renderPosition:(id)a5 engagementAttributes:(id)a6 unique:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v51;
  void *v52;
  _BOOL4 v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[3];
  _QWORD v62[4];

  v7 = a7;
  v62[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v60 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v11;
  if (objc_msgSend(v11, "count") == 3)
  {
    v53 = v7;
    v55 = v14;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v7 = v53;
        if ((isKindOfClass & 1) == 0)
          goto LABEL_19;
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v17, "count");
        v52 = v21;
        if (v23 == objc_msgSend(v21, "count"))
        {
          v24 = objc_msgSend(v17, "count");
          if (v24 == objc_msgSend(v22, "count"))
          {
            if (objc_msgSend(v17, "count"))
            {
              v25 = 0;
              while (1)
              {
                objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(v52, "objectAtIndexedSubscript:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  break;
                }
                objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
                v28 = v16;
                v29 = v13;
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v51 = objc_opt_isKindOfClass();

                v13 = v29;
                v16 = v28;

                if ((v51 & 1) != 0)
                {
                  objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "addObject:", v31);

                  objc_msgSend(v52, "objectAtIndexedSubscript:", v25);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addObject:", v32);

                  objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addObject:", v33);

                  if (++v25 < (unint64_t)objc_msgSend(v17, "count"))
                    continue;
                }
                goto LABEL_16;
              }

            }
          }
        }
LABEL_16:

        v18 = v52;
      }

    }
    v14 = v55;

    v7 = v53;
  }
LABEL_19:
  if (objc_msgSend(v12, "length"))
  {
    v56 = v13;
    v34 = objc_msgSend(v14, "count");
    v35 = v34;
    if (v7)
    {
      v36 = 0x7FFFFFFFFFFFFFFFLL;
      if (v34)
      {
        v36 = 0;
        while (1)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", v12);

          if ((v38 & 1) != 0)
            break;
          if (v35 == ++v36)
            goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      v36 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v36 == 0x7FFFFFFFFFFFFFFFLL && v35 >= 0xA)
    {
      v36 = 0;
      for (i = 1; i != v35; ++i)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "compare:", v41);

        if (v42 == -1)
          v36 = i;
      }
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v12, v36);
    }
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "addObject:", v12);
      objc_msgSend(v15, "addObject:", v59);
      objc_msgSend(v16, "addObject:", v60);
    }
    else
    {
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v59, v36);
      objc_msgSend(v16, "setObject:atIndexedSubscript:", v60, v36);
    }
    v13 = v56;
  }
  if (objc_msgSend(v13, "count") != 3)
    +[SSLocalRankingResultSignalManager updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:].cold.1();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v43;
  v44 = (void *)objc_msgSend(v14, "copy");
  v62[0] = v44;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v45;
  v46 = (void *)objc_msgSend(v15, "copy");
  v62[1] = v46;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v57 = v12;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v47;
  v48 = v14;
  v49 = (void *)objc_msgSend(v16, "copy");
  v62[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v54 = (id)objc_claimAutoreleasedReturnValue();

  return v54;
}

+ (id)getSpotlightRecentEngagementAttributes
{
  return +[SSLocalRankingResultSignalManager _getSpotlightRecentEngagementAttributes](SSLocalRankingResultSignalManager, "_getSpotlightRecentEngagementAttributes");
}

+ (id)getSpotlightRecentEngagementAttributesNonUnique
{
  return +[SSLocalRankingResultSignalManager _getSpotlightRecentEngagementAttributesNonUnique](SSLocalRankingResultSignalManager, "_getSpotlightRecentEngagementAttributesNonUnique");
}

+ (void)updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:.cold.1()
{
  __assert_rtn("+[SSLocalRankingResultSignalManager updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:]", "SSLocalRankingResultSignalManager.m", 95, "engagementAttributes.count == 3");
}

@end
