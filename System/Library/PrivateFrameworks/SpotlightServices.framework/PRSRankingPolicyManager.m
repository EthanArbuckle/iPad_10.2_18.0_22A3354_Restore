@implementation PRSRankingPolicyManager

+ (id)getSharedRankingPolicyManager
{
  if (getSharedRankingPolicyManager_onceToken != -1)
    dispatch_once(&getSharedRankingPolicyManager_onceToken, &__block_literal_global_42);
  return (id)policyManager;
}

void __56__PRSRankingPolicyManager_getSharedRankingPolicyManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)policyManager;
  policyManager = v0;

}

+ (double)termFrequencyComponentFor:(id)a3 matchingString:(id)a4 weighted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t j;
  void *v29;
  void *v30;
  unint64_t v31;
  double v32;
  double v33;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v7, "length");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = (double)v10;
    v16 = (unint64_t)(double)v10;
    v17 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (v15 <= (double)(unint64_t)objc_msgSend(v19, "length")
          && !objc_msgSend(v19, "compare:options:range:", v7, 129, 0, v16))
        {
          objc_msgSend(v9, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = v20;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v22 = &unk_1E6E98250;
          }
          objc_msgSend(v9, "setObject:forKey:", v22, v19);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v9, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    v27 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        v32 = log((double)v31) + 1.0;
        if (v5)
        {
          v33 = v32 * (double)(unint64_t)objc_msgSend(v7, "length");
          v32 = v33 / (double)(unint64_t)objc_msgSend(v29, "length");
        }
        v27 = v27 + v32;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }
  else
  {
    v27 = 0.0;
  }

  return v27;
}

+ (double)termFrequencyComponentForWord:(id)a3 inString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
  {

LABEL_13:
    v15 = 0.0;
    goto LABEL_14;
  }
  v11 = v10;
  v12 = *(_QWORD *)v18;
  v13 = 0.0;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v9);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "compare:options:", v5, 129, (_QWORD)v17))
        v13 = v13 + 1.0;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v11);

  if (v13 == 0.0)
    goto LABEL_13;
  v15 = log(v13) + 1.0;
LABEL_14:

  return v15;
}

- (id)cosineComponentsUsingWordMatches:(id)a3 withField:(id)a4 withCorpusCount:(double)a5 prefixVersion:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  BOOL v34;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_msgSend(v9, "count");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    if (v6)
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    else
      v16 = 0;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    if (v6)
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    else
      v19 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __100__PRSRankingPolicyManager_cosineComponentsUsingWordMatches_withField_withCorpusCount_prefixVersion___block_invoke;
    v26[3] = &unk_1E6E45B18;
    v33 = a5;
    v27 = v17;
    v34 = v6;
    v28 = v10;
    v29 = v15;
    v30 = v16;
    v31 = v18;
    v32 = v19;
    v20 = v19;
    v21 = v18;
    v22 = v16;
    v23 = v15;
    v24 = v17;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v11, "setTermFrequencies:", v23);
    objc_msgSend(v11, "setTermFrequenciesWeighted:", v22);
    objc_msgSend(v11, "setInverseDocFrequencies:", v24);
    objc_msgSend(v11, "setTermInverseDoc:", v21);
    objc_msgSend(v11, "setTermInverseDocWeighted:", v20);
    objc_msgSend(v11, "setFieldLength:", objc_msgSend(v13, "count"));

  }
  return v11;
}

void __100__PRSRankingPolicyManager_cosineComponentsUsingWordMatches_withField_withCorpusCount_prefixVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  if (v6 == 0.0)
  {
    v9 = 0.0;
  }
  else
  {
    v7 = *(double *)(a1 + 80);
    objc_msgSend(v5, "doubleValue");
    v9 = log(v7 / v8 + 1.0);
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 88))
  {
    +[PRSRankingPolicyManager termFrequencyComponentFor:matchingString:weighted:](PRSRankingPolicyManager, "termFrequencyComponentFor:matchingString:weighted:", v31, v12, 0);
    v14 = v13;
    +[PRSRankingPolicyManager termFrequencyComponentFor:matchingString:weighted:](PRSRankingPolicyManager, "termFrequencyComponentFor:matchingString:weighted:", v31, *(_QWORD *)(a1 + 40), 1);
    v16 = v15;
    v17 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    v19 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

    v21 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 * v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    v23 = *(void **)(a1 + 72);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = v9 * v16;
  }
  else
  {
    +[PRSRankingPolicyManager termFrequencyComponentForWord:inString:](PRSRankingPolicyManager, "termFrequencyComponentForWord:inString:", v31, v12);
    v27 = v26;
    v28 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v29);

    v23 = *(void **)(a1 + 64);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = v9 * v27;
  }
  objc_msgSend(v24, "numberWithDouble:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v30);

}

- (void)minimumAnyOrderSpanWithStartingIndex:(int64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentAnyOrderSpan:(int64_t)a7 minimumSpan:(int64_t *)a8 minimumDistancePair:(int64_t *)a9 currentMinimumIndex:(int64_t)a10 currentMaximumIndex:(int64_t)a11
{
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  id v27;

  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v14, "count") == a6)
  {
    PRSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PRSRankingPolicyManager minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:].cold.1(a6, v15);

  }
  else if (objc_msgSend(v13, "count"))
  {
    v16 = 0;
    v17 = a6 + 1;
    v27 = v13;
    do
    {
      objc_msgSend(v13, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      v20 = v19 - a3;
      if (v19 - a3 < 0)
        v20 = a3 - v19;
      if (v20 < *a9)
        *a9 = v20;
      v21 = v19 - a11;
      if (v19 <= a11)
        v22 = a11;
      else
        v22 = v19;
      if (v19 <= a11)
        v21 = 0;
      if (a10 > v19)
        v23 = v19;
      else
        v23 = a10;
      if (a10 > v19)
        v24 = a11;
      else
        v24 = v22;
      if (a10 > v19)
        v21 = a10 - v19;
      v25 = v21 + a7;
      if (v17 == objc_msgSend(v14, "count"))
      {
        if (*a8 > v25)
          *a8 = v25;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndex:", v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSRankingPolicyManager minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:](self, "minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:", v19, v26, v14, v17, v25, a8, a9, v23, v24);

        v13 = v27;
      }
      ++v16;
    }
    while (objc_msgSend(v13, "count") > v16);
  }

}

- (BOOL)doesOrderedSpanExistWithStartingIndex:(unint64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentOrderedSpan:(int64_t *)a7
{
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;

  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v13, "count") != a6)
  {
    if (!objc_msgSend(v12, "count"))
    {
LABEL_7:
      v14 = 0;
      goto LABEL_10;
    }
    v15 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if (v17 > a3)
        break;
      if (objc_msgSend(v12, "count") <= (unint64_t)++v15)
        goto LABEL_7;
    }
    *a7 += v17 - a3;
    v18 = a6 + 1;
    if (v18 != objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "objectAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PRSRankingPolicyManager doesOrderedSpanExistWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentOrderedSpan:](self, "doesOrderedSpanExistWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentOrderedSpan:", v17, v19, v13, v18, a7);

      goto LABEL_10;
    }
  }
  v14 = 1;
LABEL_10:

  return v14;
}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8
{
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  LOBYTE(v8) = 0;
  -[PRSRankingPolicyManager computeNewFeaturesForProperty:query:qr_prop_query_norm_min_ordered_span:qr_prop_query_norm_min_unordered_span:qr_query_min_pair_dist_in_title:prefix_match_norm_count:prefixMatch:](self, "computeNewFeaturesForProperty:query:qr_prop_query_norm_min_ordered_span:qr_prop_query_norm_min_unordered_span:qr_query_min_pair_dist_in_title:prefix_match_norm_count:prefixMatch:", a3, a4, a5, a6, a7, &v9, v8);
}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 prefixMatch:(BOOL)a9
{
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = 0;
  v15 = (void *)MEMORY[0x1E0C99DC8];
  v16 = a4;
  v17 = a3;
  objc_msgSend(v15, "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  LOBYTE(v19) = a9;
  -[PRSRankingPolicyManager computeNewFeaturesForProperty:query:qr_prop_query_norm_min_ordered_span:qr_prop_query_norm_min_unordered_span:qr_query_min_pair_dist_in_title:prefix_match_norm_count:ordered_first_term_position:prefixMatch:queryBreakDown:isVirtualField:locale:](self, "computeNewFeaturesForProperty:query:qr_prop_query_norm_min_ordered_span:qr_prop_query_norm_min_unordered_span:qr_query_min_pair_dist_in_title:prefix_match_norm_count:ordered_first_term_position:prefixMatch:queryBreakDown:isVirtualField:locale:", v17, v16, a5, a6, a7, a8, &v21, v19, 0, v20, v18);

}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 ordered_first_term_position:(double *)a9 prefixMatch:(BOOL)a10 queryBreakDown:(id)a11 isVirtualField:(BOOL)a12 locale:(id)a13
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t k;
  void *v61;
  double v62;
  double v63;
  unint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unint64_t v76;
  double v77;
  unint64_t v78;
  id v83;
  char v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id obj;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  unint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a11;
  v97 = a13;
  v78 = objc_msgSend(v14, "count");
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v13;
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v16);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = v14;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
  if (v88)
  {
    v17 = 0;
    v98 = 0;
    v86 = v15;
    v87 = *(_QWORD *)v119;
    v85 = 1;
LABEL_3:
    v18 = 0;
    v19 = 5;
    if (v17 > 5)
      v19 = v17;
    v90 = v19 - v17;
    while (1)
    {
      if (*(_QWORD *)v119 != v87)
        objc_enumerationMutation(obj);
      if (v18 == v90)
        break;
      v93 = v18;
      v95 = v17;
      v20 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v18);
      v21 = (void *)objc_opt_new();
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v22 = v91;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v115;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v115 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
            if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v27, v20)|| a10&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:hasPrefix:locale:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:hasPrefix:locale:", v27, v20, v97))
            {

              v112 = 0u;
              v113 = 0u;
              v110 = 0u;
              v111 = 0u;
              v28 = v22;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
              if (v29)
              {
                v30 = v29;
                v31 = 0;
                v32 = *(_QWORD *)v111;
                do
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v111 != v32)
                      objc_enumerationMutation(v28);
                    v34 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
                    if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v34, v20)|| a10&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:hasPrefix:locale:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:hasPrefix:locale:", v34, v20, v97))
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31 + j);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "addObject:", v35);

                      ++v98;
                    }
                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
                  v31 += j;
                }
                while (v30);
              }

              v15 = v86;
              if (objc_msgSend(v21, "count"))
                objc_msgSend(v86, "addObject:", v21);
              goto LABEL_33;
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
          if (v24)
            continue;
          break;
        }
      }

      v85 = 0;
LABEL_33:
      v17 = v95 + 1;

      v18 = v93 + 1;
      if (v93 + 1 == v88)
      {
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
        if (v88)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v98 = 0;
    v85 = 1;
  }

  if (!objc_msgSend(v15, "count"))
  {
    *a5 = 2147483650.0;
    *a6 = 2147483650.0;
    v36 = v83;
    *a8 = 2147483650.0;
    *a7 = 2147483650.0;
    *a9 = 2147483650.0;
    goto LABEL_95;
  }
  objc_msgSend(v15, "firstObject");
  v108 = 0x7FFFFFFFLL;
  v109 = 0x7FFFFFFFLL;
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v83;
  v96 = objc_msgSend(v94, "count");
  if (!v96)
  {
    *a7 = (double)v108;
    *a5 = 2147483650.0;
    *a9 = 2147483650.0;
    v72 = 2147483650.0;
    v76 = v98;
    v41 = v85;
    goto LABEL_91;
  }
  v37 = 0;
  v38 = 0x7FFFFFFFLL;
  v39 = 0x7FFFFFFFLL;
  v40 = 0x7FFFFFFFLL;
  v41 = v85;
  do
  {
    v107 = 0;
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      objc_msgSend(v15, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v104;
        v59 = 1.79769313e308;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v104 != v58)
              objc_enumerationMutation(v55);
            v61 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
            objc_msgSend(v61, "doubleValue");
            if (v62 < v59)
            {
              objc_msgSend(v61, "doubleValue");
              v59 = v63;
            }
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
        }
        while (v57);
      }
      else
      {
        v59 = 1.79769313e308;
      }

      v38 = (uint64_t)v59;
      v64 = objc_msgSend(obj, "count");
      if ((v41 & 1) != 0)
      {
        if (v64 == 1)
        {
          v40 = 0;
          v39 = 0;
          v108 = 0;
          goto LABEL_82;
        }
LABEL_76:
        v40 = 0;
        v39 = 0;
        v108 = 0x7FFFFFFFLL;
        goto LABEL_82;
      }
      if (v64 < 2)
        goto LABEL_76;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v65 = obj;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
      if (v66)
      {
        v67 = v66;
        v68 = 0;
        v69 = *(_QWORD *)v100;
        do
        {
          for (m = 0; m != v67; ++m)
          {
            if (*(_QWORD *)v100 != v69)
              objc_enumerationMutation(v65);
            v68 += objc_msgSend(v36, "localizedStandardContainsString:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m));
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
        }
        while (v67);

        if (v68 == 1)
        {
          objc_msgSend(v36, "componentsSeparatedByString:", CFSTR(" "));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v71, "count");

        }
        v40 = 0;
        v39 = 0;
        v38 = (uint64_t)v59;
      }
      else
      {

        v40 = 0;
        v39 = 0;
      }
    }
    else
    {
      if ((v41 & 1) != 0)
      {
        objc_msgSend(v94, "objectAtIndexedSubscript:", v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "integerValue");
        objc_msgSend(v15, "objectAtIndex:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = -[PRSRankingPolicyManager doesOrderedSpanExistWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentOrderedSpan:](self, "doesOrderedSpanExistWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentOrderedSpan:", v43, v44, v15, 1, &v107);

        if ((_DWORD)v43)
        {
          if (v40 > v107)
          {
            objc_msgSend(v94, "objectAtIndexedSubscript:", v37);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v45, "integerValue");

            v40 = v107;
          }
        }
      }
      if (a12)
      {
        v89 = v40;
        v46 = v39;
        v47 = v38;
        objc_msgSend(v94, "objectAtIndexedSubscript:", v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "integerValue");
        objc_msgSend(v15, "objectAtIndex:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectAtIndexedSubscript:", v37);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "integerValue");
        objc_msgSend(v94, "objectAtIndexedSubscript:", v37);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSRankingPolicyManager minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:](self, "minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:", v49, v50, v15, 1, 0, &v109, &v108, v52, objc_msgSend(v53, "integerValue"));

        v41 = v85;
        if ((v85 & 1) != 0)
        {
          v54 = v109;
          if (v46 < v109)
            v54 = v46;
          v36 = v83;
          v38 = v47;
          if (v46 > v109)
          {
            v39 = v54;
LABEL_81:
            v40 = v89;
            goto LABEL_82;
          }
          if (objc_msgSend(obj, "count") == 1)
            v108 = 0;
        }
        else
        {
          v36 = v83;
          v38 = v47;
        }
        v39 = v46;
        goto LABEL_81;
      }
    }
LABEL_82:
    ++v37;
  }
  while (v37 != v96);
  *a7 = (double)v108;
  v72 = 2147483650.0;
  v73 = (double)v78;
  v74 = 2147483650.0;
  v75 = 2147483650.0;
  v76 = v98;
  if (((v40 != 0x7FFFFFFF) & v41) != 0)
  {
    v74 = ((double)v40 + 2.0) / v73;
    v75 = (double)v38;
  }
  *a5 = v74;
  *a9 = v75;
  if (((v39 != 0x7FFFFFFF) & v41) == 1)
    v72 = ((double)v39 + 2.0) / v73;
LABEL_91:
  *a6 = v72;
  if (((v76 != 0) & v41) == 1)
    v77 = (double)(v76 / v78);
  else
    v77 = 2147483650.0;
  *a8 = v77;

LABEL_95:
}

- (id)cookSQFOnClientWithServerProbabilities:(id)a3 qiCEPValues:(id)a4 localResultOrder:(id)a5 poorTextMatchCategories:(id)a6 minimumBagCEP:(double)a7 cook_sqf_topdown:(BOOL)a8 cook_sqf_fallback_qi_cep:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  _BOOL4 v47;
  id v48;
  id v50;
  void *v51;
  id v52;
  id obj;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  char v62;
  _QWORD v63[4];
  _QWORD v64[3];
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v47 = a8;
  v87 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v48 = a4;
  v14 = a5;
  v15 = a6;
  v51 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v14;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(obj);
        +[PRSRankingUtilities bundleIDForCategory:](PRSRankingUtilities, "bundleIDForCategory:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v20);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v17);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v52 = v15;
  v21 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v71 != v22)
          objc_enumerationMutation(v52);
        +[PRSRankingUtilities bundleIDForCategory:](PRSRankingUtilities, "bundleIDForCategory:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v24);

      }
      v21 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
    }
    while (v21);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v13, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
        objc_msgSend(v13, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v33 = v32;

        if ((v26 & 1) != 0)
        {
          v26 = 1;
        }
        else if ((objc_msgSend(v30, "hasPrefix:", CFSTR("com.apple.parsec.")) & 1) != 0)
        {
          v26 = 0;
        }
        else
        {
          v26 = objc_msgSend(v54, "containsObject:", v30);
        }
        if (objc_msgSend(v30, "hasPrefix:", CFSTR("com.apple.parsec.")))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKey:", v34, v30);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    }
    while (v27);
  }

  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v65 = 0.0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  if (!a9)
    v65 = a7;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __175__PRSRankingPolicyManager_cookSQFOnClientWithServerProbabilities_qiCEPValues_localResultOrder_poorTextMatchCategories_minimumBagCEP_cook_sqf_topdown_cook_sqf_fallback_qi_cep___block_invoke;
  v55[3] = &unk_1E6E45B40;
  v62 = v26;
  v50 = v48;
  v56 = v50;
  v60 = v63;
  v61 = v64;
  v35 = v51;
  v57 = v35;
  v36 = v13;
  v58 = v36;
  v37 = v16;
  v59 = v37;
  v38 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](v55);
  if (v47)
  {
    v39 = 0;
    v40 = 1;
  }
  else
  {
    v39 = objc_msgSend(obj, "count") - 1;
    v40 = -1;
  }
  v41 = 0;
  v42 = 0;
  while (v41 < objc_msgSend(obj, "count"))
  {
    objc_msgSend(v54, "objectAtIndex:", v39);
    v43 = objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, uint64_t, BOOL))v38)[2](v38, v43, !v47);
    ++v41;
    v39 += v40;
    v42 = (void *)v43;
  }
  PRSLogCategoryDefault();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v79 = v36;
    v80 = 2112;
    v81 = v54;
    v82 = 2112;
    v83 = v35;
    _os_log_impl(&dword_1B86C5000, v44, OS_LOG_TYPE_INFO, "[Ranking Log] Cooking SQF: Server SQF received:%@ \n Local sorted categories(desc order): %@\n Final cooked SQF dictionary: %@\n", buf, 0x20u);
  }

  v45 = v35;
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);

  return v45;
}

void __175__PRSRankingPolicyManager_cookSQFOnClientWithServerProbabilities_qiCEPValues_localResultOrder_poorTextMatchCategories_minimumBagCEP_cook_sqf_topdown_cook_sqf_fallback_qi_cep___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  double v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v24;
  id v25;

  v5 = a2;
  v25 = v5;
  if (!*(_BYTE *)(a1 + 80))
  {
    v16 = *(void **)(a1 + 32);
    v17 = objc_retainAutorelease(v5);
    objc_msgSend(v16, "doubleValueForKey:", objc_msgSend(v17, "UTF8String"));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(double *)(v19 + 24);
    v21 = v20 > v18;
    if (a3)
      v21 = v20 < v18;
    if (v20 == 0.0)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v20 <= 0.0)
        LOBYTE(v21) = 0;
      if (*(double *)(v22 + 24) != 0.0 && !v21)
        goto LABEL_25;
    }
    else
    {
      if (v20 <= 0.0 || !v21)
        goto LABEL_25;
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(double *)(v22 + 24) = v18;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
LABEL_25:
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v24 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    v14 = v12;
    v15 = v17;
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v10 = v8 > v9;
  if (!a3)
    v10 = v8 < v9;
  if (v9 == 0.0)
    v10 = 1;
  if (v10)
    v9 = v8;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v25))
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
  v11 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  v15 = v25;
LABEL_26:
  objc_msgSend(v13, "setObject:forKey:", v14, v15);

}

- (void)minimumAnyOrderSpanWithStartingIndex:(uint64_t)a1 nextArray:(NSObject *)a2 arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "calculation exceeded max level %lu", (uint8_t *)&v2, 0xCu);
}

@end
