@implementation PSIGroupAggregate

- (PSIGroupAggregate)initWithSearchTokens:(id)a3 groupResultsQueue:(id)a4
{
  id v7;
  id v8;
  PSIGroupAggregate *v9;
  PSIGroupAggregate *v10;
  uint64_t v11;
  NSMutableArray *groupAggregateItems;
  NSMutableArray *v13;
  NSMutableArray *aggregatedGroupIds;
  NSMutableArray *v15;
  NSMutableArray *aggregateItemPool;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSIGroupAggregate;
  v9 = -[PSIGroupAggregate init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchTokens, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    groupAggregateItems = v10->_groupAggregateItems;
    v10->_groupAggregateItems = (NSMutableArray *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aggregatedGroupIds = v10->_aggregatedGroupIds;
    v10->_aggregatedGroupIds = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aggregateItemPool = v10->_aggregateItemPool;
    v10->_aggregateItemPool = v15;

    objc_storeStrong((id *)&v10->_groupResultsQueue, a4);
    v10->_filenameGroupCount = 0;
  }

  return v10;
}

- (_NSRange)_rangeOfString:(id)a3 inGroup:(id)a4 useNormalizedString:(BOOL)a5 extendingSearchRange:(BOOL)a6 matchingFullToken:(BOOL)a7 excludingRanges:(id)a8
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  _BOOL4 v37;
  id v38;
  _BOOL4 v39;
  id v40;
  _QWORD v41[6];
  _NSRange result;

  v37 = a7;
  v39 = a6;
  v40 = a3;
  v11 = a4;
  v38 = a8;
  if (a5)
    objc_msgSend(v11, "normalizedString");
  else
    objc_msgSend(v11, "contentString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  v14 = objc_msgSend(v11, "tokenRangesCount");
  if (!v14)
  {
LABEL_25:
    v35 = 0;
    v33 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  v15 = v14;
  v16 = 0;
  v36 = v14 - 1;
  while (1)
  {
    v17 = objc_msgSend(v11, "category");
    v18 = v16;
    if (v17 == 2100)
      v18 = (v36 + v16) % v15;
    v19 = objc_msgSend(v11, "tokenRangeAtIndex:", v18);
    v21 = v19;
    v22 = v20;
    v23 = v39 ? v13 - v19 : v20;
    v24 = objc_msgSend(v12, "rangeOfString:options:range:", v40, 10, v19, v23);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v33 = v24;
    v35 = v25;
    if (v37)
    {
      v26 = v21 + v22;
      v27 = v24 + v25;
      if (v26 != v24 + v25 && v25 != v13)
      {
        v28 = v16 + 1;
        if (v16 + 1 >= v15)
        {
LABEL_21:
          if (v27 < v26)
            goto LABEL_24;
        }
        else
        {
          while (1)
          {
            v29 = objc_msgSend(v11, "tokenRangeAtIndex:", v28);
            if (v27 >= v26 && v27 < v29)
              break;
            v26 = v29 + v30;
            if (v15 == ++v28)
              goto LABEL_21;
          }
        }
      }
    }
    if (!objc_msgSend(v38, "count"))
      goto LABEL_26;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __119__PSIGroupAggregate__rangeOfString_inGroup_useNormalizedString_extendingSearchRange_matchingFullToken_excludingRanges___block_invoke;
    v41[3] = &__block_descriptor_48_e15_B32__0_8Q16_B24l;
    v41[4] = v33;
    v41[5] = v35;
    if (objc_msgSend(v38, "indexOfObjectPassingTest:", v41) == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_26;
LABEL_24:
    if (++v16 == v15)
      goto LABEL_25;
  }
  if (!objc_msgSend(v12, "isEqualToString:", v40))
    goto LABEL_24;
  v33 = objc_msgSend(v12, "rangeOfString:", v40);
  v35 = v34;
LABEL_26:

  v31 = v33;
  v32 = v35;
  result.length = v32;
  result.location = v31;
  return result;
}

- (BOOL)pushGroup:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  const __CFArray *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSUInteger v16;
  BOOL v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const __CFArray *v31;
  const __CFArray *v32;
  CFIndex v33;
  int v34;
  int v35;
  CFIndex Count;
  CFIndex v37;
  int v38;
  uint64_t v39;
  CFIndex v40;
  CFIndex v41;
  _BYTE *v42;
  _BYTE *v43;
  uint64_t v44;
  char v45;
  const __CFArray *v46;
  const __CFArray *v47;
  CFIndex v48;
  _BYTE *ValueAtIndex;
  const __CFArray *v50;
  CFIndex v51;
  _BYTE *v52;
  BOOL v53;
  uint64_t v54;
  CFIndex v55;
  _BYTE *v56;
  const __CFArray *v57;
  const __CFArray *v58;
  unint64_t v59;
  CFIndex v60;
  CFIndex v61;
  _BYTE *v62;
  CFIndex v63;
  CFIndex v64;
  CFIndex v65;
  int v66;
  uint64_t v67;
  CFIndex v68;
  _BYTE *v69;
  _BYTE *v70;
  uint64_t v71;
  char v72;
  const __CFArray *v73;
  BOOL v74;
  uint64_t v75;
  CFIndex v76;
  _BYTE *v77;
  const __CFArray *v78;
  const __CFArray *v79;
  unint64_t v80;
  CFIndex v81;
  CFIndex v82;
  _BYTE *v83;
  uint64_t v84;
  int IsUserControlled;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  char v93;
  void *v94;
  void *v95;
  const __CFArray *v96;
  CFArrayRef v97;
  CFTypeRef v98;
  const void *v99;
  const __CFArray *v100;
  CFIndex v101;
  CFIndex v102;
  CFIndex v103;
  uint64_t v104;
  _BYTE *v105;
  _BYTE *v106;
  char v107;
  uint64_t v108;
  const __CFArray *v109;
  BOOL v110;
  CFIndex v111;
  const __CFArray *v112;
  CFIndex v113;
  _BYTE *v114;
  const __CFArray *v115;
  unint64_t v116;
  CFIndex v117;
  CFIndex v118;
  _BYTE *v119;
  CFIndex v120;
  const __CFArray *v121;
  CFIndex v122;
  CFIndex v123;
  uint64_t v124;
  CFIndex v125;
  CFIndex v126;
  char v127;
  uint64_t v128;
  const __CFArray *v129;
  CFIndex v130;
  CFIndex v131;
  _BYTE *v132;
  CFIndex v133;
  CFIndex v134;
  _BYTE *v135;
  BOOL v136;
  uint64_t v137;
  CFIndex v138;
  _BYTE *v139;
  const __CFArray *v140;
  unint64_t v141;
  const __CFArray *v142;
  CFIndex v143;
  CFIndex v144;
  _BYTE *v145;
  unint64_t filenameGroupCount;
  const __CFAllocator *allocator;
  int v149;
  void *v150;
  CFIndex v151;
  const __CFArray *v152;
  CFArrayRef v153;
  id obj;
  PSIGroupAggregate *v155;
  PSIGroupAggregate *v156;
  BOOL v157;
  NSMutableArray *v158;
  const __CFArray *v159;
  CFArrayRef v160;
  const __CFArray *Mutable;
  const __CFArray *v162;
  NSObject *v163;
  void *v164;
  id v165;
  void *v166;
  const __CFArray *v167;
  CFArrayRef v168;
  CFArrayRef v169;
  const __CFArray *v170;
  CFArrayRef theArray;
  CFArrayRef theArraya;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  uint8_t v177[128];
  uint8_t buf[4];
  unint64_t v179;
  __int16 v180;
  NSUInteger v181;
  uint64_t v182;
  CFRange v183;
  CFRange v184;
  CFRange v185;
  CFRange v186;

  v182 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[NSMutableArray count](self->_groupAggregateItems, "count");
  if (v8 >= -[NSArray count](self->_searchTokens, "count"))
  {
    PLSearchIndexGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = -[NSArray count](self->_searchTokens, "count");
      *(_DWORD *)buf = 134218240;
      v179 = v8;
      v180 = 2048;
      v181 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "groupAggregateItemCount(%lu) is greater than or equal to the number of tokens(%lu)", buf, 0x16u);
    }
    v17 = 0;
    goto LABEL_320;
  }
  v157 = a4;
  -[NSMutableArray lastObject](self->_groupAggregateItems, "lastObject");
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject assetIds](v9, "assetIds");
  theArray = (CFArrayRef)objc_claimAutoreleasedReturnValue();

  -[NSObject collectionIds](v9, "collectionIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v162 = (const __CFArray *)objc_msgSend(v7, "assetIds");
  v11 = (const __CFArray *)objc_msgSend(v7, "collectionIds");
  -[NSArray objectAtIndexedSubscript:](self->_searchTokens, "objectAtIndexedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wordEmbeddingMatch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = (CFArrayRef)v13;
  if (v13)
  {
    objc_msgSend(v12, "wordEmbeddingMatch");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "word");
    v165 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "normalizedText");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v165 = v14;
  }

  v166 = v7;
  v170 = (const __CFArray *)v10;
  v159 = v11;
  v163 = v9;
  v164 = v12;
  obj = a3;
  if (!v8)
  {
    v151 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v21 = 0;
    v35 = 0;
    v34 = 1;
    goto LABEL_168;
  }
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v18 = self->_groupAggregateItems;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
  v155 = self;
  if (!v19)
  {

    goto LABEL_28;
  }
  v20 = v19;
  v21 = 0;
  v22 = *(_QWORD *)v174;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v174 != v22)
        objc_enumerationMutation(v18);
      v24 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
      objc_msgSend(v24, "group");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "groupId");
      v27 = objc_msgSend(v7, "groupId");

      if (v26 == v27)
      {
        objc_msgSend(v24, "rangeMatchingToken");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          v17 = 0;
LABEL_318:

          goto LABEL_319;
        }
        v29 = (void *)v28;
        if (v21)
          v30 = v21;
        else
          v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v21 = v30;

        objc_msgSend(v21, "addObject:", v29);
      }
    }
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
  }
  while (v20);

  self = v155;
  v11 = v159;
  if (v21)
  {
    if (objc_msgSend(v165, "length"))
    {
      v151 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 1;
      v35 = 1;
      goto LABEL_168;
    }
    goto LABEL_181;
  }
LABEL_28:
  if (theArray)
    Count = CFArrayGetCount(theArray);
  else
    Count = 0;
  if (!v162)
  {
    v151 = 0;
    v31 = 0;
    v38 = 0;
    goto LABEL_101;
  }
  v37 = CFArrayGetCount(v162);
  v38 = 0;
  v31 = 0;
  v151 = 0;
  if (!Count)
    goto LABEL_101;
  v39 = v37;
  if (!v37)
    goto LABEL_101;
  v40 = 0;
  v38 = 0;
  v41 = 0;
  if (Count < 1)
  {
    v167 = theArray;
    goto LABEL_94;
  }
  v167 = theArray;
  if (v37 < 1)
    goto LABEL_94;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v41 = 0;
  v40 = 0;
  v45 = 1;
  v167 = theArray;
  v46 = v162;
  while (2)
  {
    if ((v45 & 1) == 0)
    {
      if (v44)
      {
        v58 = v46;
        v56 = v43;
        v55 = v40;
        v54 = Count;
        v57 = v167;
        goto LABEL_64;
      }
      if (!v43 || !v42)
        goto LABEL_334;
      goto LABEL_328;
    }
    if (!v43)
    {
      v47 = v46;
      v48 = v40;
      ValueAtIndex = CFArrayGetValueAtIndex(v167, v40);
      v40 = v48;
      v43 = ValueAtIndex;
      v46 = v47;
    }
    if (!v42)
    {
      v50 = v46;
      v51 = v40;
      v52 = CFArrayGetValueAtIndex(v46, v41);
      v40 = v51;
      v42 = v52;
      v46 = v50;
    }
    v53 = v42 >= v43;
    if (v42 < v43)
      v54 = v39;
    else
      v54 = Count;
    if (v42 >= v43)
    {
      v55 = v40;
    }
    else
    {
      v39 = Count;
      v55 = v41;
    }
    if (v42 >= v43)
    {
      v56 = v43;
    }
    else
    {
      v41 = v40;
      v56 = v42;
    }
    if (v42 < v43)
      v42 = v43;
    v57 = v167;
    if (v53)
      v58 = v46;
    else
      v58 = v167;
    if (!v53)
      v57 = v46;
    if (v42 < v56)
LABEL_324:
      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
    if (v54 < 9 || (v59 = v42 - v56, log((double)v54) >= (double)v59))
    {
      v44 = 8;
LABEL_64:
      v45 = 1;
      v167 = v57;
      if (v55 >= v54)
        goto LABEL_79;
LABEL_65:
      if (v41 >= v39)
        goto LABEL_79;
      if (!v44)
      {
        v44 = -1;
        v45 = 1;
LABEL_79:
        v46 = v58;
        Count = v54;
        v40 = v55;
        v43 = v56;
LABEL_80:
        v38 = 0;
        if (v40 >= Count || v41 >= v39)
          goto LABEL_94;
        continue;
      }
      if (v56)
      {
        if (v42)
        {
LABEL_69:
          if (v56 >= v42)
          {
            if (v56 <= v42)
            {
              v38 = 1;
              goto LABEL_92;
            }
            v42 = 0;
            ++v41;
          }
          else
          {
            v56 = 0;
            ++v55;
          }
          --v44;
          v45 = 1;
          if (v55 >= v54)
            goto LABEL_79;
          goto LABEL_65;
        }
      }
      else
      {
        v56 = CFArrayGetValueAtIndex(v57, v55);
        if (v42)
          goto LABEL_69;
      }
      v42 = CFArrayGetValueAtIndex(v58, v41);
      goto LABEL_69;
    }
    break;
  }
  if (!v56 || !v42)
    goto LABEL_334;
  v183.length = v54 - v55;
  v183.location = v55;
  v60 = CFArrayBSearchValues(v57, v183, v42, (CFComparatorFunction)PSIRowIDCompare_95714, 0);
  v167 = v57;
  if (v60 < v54)
  {
    v61 = v60;
    v62 = CFArrayGetValueAtIndex(v57, v60);
    if (v42 == v62)
    {
      v45 = 0;
      v46 = v58;
      Count = v54;
      v44 = 8;
      v43 = v42;
    }
    else
    {
      v43 = v62;
      if (v42 >= v62)
        goto LABEL_325;
      v44 = 0;
      v45 = 1;
      v46 = v58;
      Count = v54;
    }
    v40 = v61;
    goto LABEL_80;
  }
  v38 = 0;
LABEL_92:
  v40 = v55;
LABEL_94:
  if (v167 == theArray)
    v63 = v40;
  else
    v63 = v41;
  v151 = v63;
  if (v167 == theArray)
    v31 = (const __CFArray *)v41;
  else
    v31 = (const __CFArray *)v40;
  v11 = v159;
LABEL_101:
  if (v170)
    v64 = CFArrayGetCount(v170);
  else
    v64 = 0;
  v149 = v38;
  if (!v11)
  {
    v32 = 0;
    v33 = 0;
    v66 = 0;
    goto LABEL_167;
  }
  v65 = CFArrayGetCount(v11);
  v66 = 0;
  v32 = 0;
  if (!v64)
  {
    v33 = 0;
    goto LABEL_167;
  }
  v67 = v65;
  v33 = 0;
  if (!v65)
    goto LABEL_167;
  v168 = v31;
  v33 = 0;
  v66 = 0;
  v68 = 0;
  if (v64 < 1)
  {
    v152 = v170;
    goto LABEL_162;
  }
  v152 = v170;
  if (v65 < 1)
    goto LABEL_162;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v68 = 0;
  v33 = 0;
  v72 = 1;
  v152 = v170;
  v73 = v11;
  while (2)
  {
    if ((v72 & 1) == 0)
    {
      if (v71)
      {
        v77 = v70;
        v75 = v64;
        v78 = v152;
        goto LABEL_133;
      }
      if (!v70 || !v69)
        goto LABEL_334;
      goto LABEL_328;
    }
    if (!v70)
      v70 = CFArrayGetValueAtIndex(v152, v33);
    if (!v69)
      v69 = CFArrayGetValueAtIndex(v73, v68);
    v74 = v69 >= v70;
    if (v69 < v70)
      v75 = v67;
    else
      v75 = v64;
    if (v69 < v70)
      v67 = v64;
    v76 = v33;
    if (v69 >= v70)
    {
      v77 = v70;
    }
    else
    {
      v33 = v68;
      v68 = v76;
      v77 = v69;
    }
    if (v69 < v70)
      v69 = v70;
    v78 = v152;
    v79 = v73;
    if (!v74)
    {
      v73 = v152;
      v78 = v79;
    }
    if (v69 < v77)
      goto LABEL_324;
    if (v75 >= 9)
    {
      v80 = v69 - v77;
      if (log((double)v75) < (double)v80)
      {
        if (!v77 || !v69)
          goto LABEL_334;
        v184.length = v75 - v33;
        v184.location = v33;
        v81 = CFArrayBSearchValues(v78, v184, v69, (CFComparatorFunction)PSIRowIDCompare_95714, 0);
        v152 = v78;
        if (v81 >= v75)
        {
          v66 = 0;
          break;
        }
        v82 = v81;
        v83 = CFArrayGetValueAtIndex(v78, v81);
        v33 = v82;
        if (v69 == v83)
        {
          v72 = 0;
          v64 = v75;
          v71 = 8;
          v70 = v69;
        }
        else
        {
          v70 = v83;
          if (v69 >= v83)
            goto LABEL_325;
          v71 = 0;
          v72 = 1;
          v64 = v75;
        }
        goto LABEL_149;
      }
    }
    v71 = 8;
LABEL_133:
    v72 = 1;
    v152 = v78;
    if (v33 >= v75)
      goto LABEL_148;
    while (2)
    {
      if (v68 >= v67)
        goto LABEL_148;
      if (v71)
      {
        if (v77)
        {
          if (v69)
          {
LABEL_138:
            if (v77 >= v69)
            {
              if (v77 <= v69)
              {
                v66 = 1;
                goto LABEL_162;
              }
              v69 = 0;
              ++v68;
            }
            else
            {
              v77 = 0;
              ++v33;
            }
            --v71;
            v72 = 1;
            if (v33 >= v75)
              goto LABEL_148;
            continue;
          }
        }
        else
        {
          v77 = CFArrayGetValueAtIndex(v78, v33);
          if (v69)
            goto LABEL_138;
        }
        v69 = CFArrayGetValueAtIndex(v73, v68);
        goto LABEL_138;
      }
      break;
    }
    v71 = -1;
    v72 = 1;
LABEL_148:
    v64 = v75;
    v70 = v77;
LABEL_149:
    v66 = 0;
    if (v33 < v64 && v68 < v67)
      continue;
    break;
  }
LABEL_162:
  v31 = v168;
  if (v152 == v170)
    v32 = (const __CFArray *)v33;
  else
    v32 = (const __CFArray *)v68;
  if (v152 == v170)
    v33 = v68;
LABEL_167:
  v21 = 0;
  v34 = 0;
  v35 = 0;
  v17 = 0;
  self = v155;
  if ((v149 | v66) != 1)
    goto LABEL_319;
LABEL_168:
  v153 = v32;
  v169 = v31;
  if (!objc_msgSend(v165, "length"))
  {
    v86 = 0;
    goto LABEL_187;
  }
  v84 = objc_msgSend(v164, "matchType");
  IsUserControlled = v84 == 0;
  if (v84 && !v157)
  {
    if (objc_msgSend(v164, "userControlledCategoriesUseWildcard"))
      IsUserControlled = PLSearchIndexCategoryIsUserControlled((int)objc_msgSend(v166, "category"));
    else
      IsUserControlled = 0;
  }
  v87 = -[PSIGroupAggregate _rangeOfString:inGroup:useNormalizedString:extendingSearchRange:matchingFullToken:excludingRanges:](self, "_rangeOfString:inGroup:useNormalizedString:extendingSearchRange:matchingFullToken:excludingRanges:", v165, v166, v160 == 0, 1, IsUserControlled ^ 1u, v21);
  v88 = v87;
  v90 = v89;
  if (v84 != 2 || IsUserControlled == 1)
  {
    if (v87 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_181;
LABEL_182:
    v93 = IsUserControlled ^ 1;
    if (v84 != 2)
      v93 = 1;
    if ((v93 & 1) == 0)
    {
      objc_msgSend(v166, "contentString", v88);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v94, "length");

      v88 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v88, v90);
    v86 = objc_claimAutoreleasedReturnValue();
LABEL_187:
    v158 = (NSMutableArray *)v86;
    -[PSIGroupAggregate aggregateItemWithSearchToken:rangeMatchingToken:group:](self, "aggregateItemWithSearchToken:rangeMatchingToken:group:", v164, v86, v166);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v35 | v34) & 1) != 0)
    {
      if (v35)
        v96 = v170;
      else
        v96 = v159;
      if (v35)
        v97 = theArray;
      else
        v97 = v162;
      v98 = CFRetain(v97);
      v99 = CFRetain(v96);
LABEL_313:
      objc_msgSend(v95, "setAssetIds:", v98);
      CFRelease(v98);
      objc_msgSend(v95, "setCollectionIds:", v99);
      CFRelease(v99);
      -[NSMutableArray addObject:](self->_groupAggregateItems, "addObject:", v95);
      if (objc_msgSend(v166, "category") == 2100)
      {
        filenameGroupCount = self->_filenameGroupCount;
        if (!filenameGroupCount)
        {
          objc_storeStrong((id *)&self->_filenameGroupInAggregate, obj);
          filenameGroupCount = self->_filenameGroupCount;
        }
        self->_filenameGroupCount = filenameGroupCount + 1;
      }

      v17 = 1;
      v18 = v158;
      goto LABEL_318;
    }
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v100 = v162;
    v150 = v95;
    v156 = self;
    if (theArray)
      v101 = CFArrayGetCount(theArray);
    else
      v101 = 0;
    v102 = v151;
    if (!v162)
      goto LABEL_253;
    v103 = CFArrayGetCount(v162);
    if (!v101)
      goto LABEL_253;
    v104 = v103;
    if (!v103 || v151 >= v101 || (uint64_t)v169 >= v103)
      goto LABEL_253;
    v105 = 0;
    v106 = 0;
    v107 = 0;
    v108 = 8;
LABEL_204:
    if ((v107 & 1) != 0)
    {
      v109 = theArray;
      if (!v106)
        v106 = CFArrayGetValueAtIndex(theArray, v102);
      if (!v105)
        v105 = CFArrayGetValueAtIndex(v100, (CFIndex)v169);
      v110 = v105 >= v106;
      v111 = v101;
      if (v105 < v106)
      {
        v101 = v104;
        v104 = v111;
      }
      v112 = v169;
      v113 = v102;
      if (v105 < v106)
      {
        v102 = (CFIndex)v169;
        v112 = (const __CFArray *)v113;
      }
      v169 = v112;
      if (v105 < v106)
        v114 = v105;
      else
        v114 = v106;
      if (v105 < v106)
        v105 = v106;
      v115 = v100;
      if (!v110)
      {
        v100 = theArray;
        v109 = v115;
      }
      if (v105 < v114)
        goto LABEL_324;
      v117 = (CFIndex)v169;
      theArray = v109;
      if (v101 < 9 || (v116 = v105 - v114, log((double)v101) >= (double)v116))
      {
        v108 = 8;
        while (1)
        {
LABEL_226:
          v107 = 1;
          if (v102 >= v101 || v117 >= v104)
          {
            v169 = (CFArrayRef)v117;
            goto LABEL_242;
          }
          if (!v108)
          {
            v169 = (CFArrayRef)v117;
            v108 = -1;
            v107 = 1;
LABEL_242:
            v106 = v114;
LABEL_243:
            if (v102 >= v101 || (uint64_t)v169 >= v104)
              goto LABEL_253;
            goto LABEL_204;
          }
          if (v114)
          {
            if (!v105)
              goto LABEL_236;
          }
          else
          {
            v114 = CFArrayGetValueAtIndex(theArray, v102);
            if (!v105)
LABEL_236:
              v105 = CFArrayGetValueAtIndex(v100, v117);
          }
          if (v114 >= v105)
          {
            if (v114 <= v105)
            {
              if (Mutable)
                CFArrayGetCount(Mutable);
              CFArrayAppendValue(Mutable, v114);
              v114 = 0;
              v105 = 0;
              ++v102;
              ++v117;
            }
            else
            {
              v105 = 0;
              ++v117;
              --v108;
            }
          }
          else
          {
            v114 = 0;
            ++v102;
            --v108;
          }
        }
      }
      if (!v114 || !v105)
        goto LABEL_334;
      v185.length = v101 - v102;
      v185.location = v102;
      v118 = CFArrayBSearchValues(v109, v185, v105, (CFComparatorFunction)PSIRowIDCompare_95714, 0);
      if (v118 < v101)
      {
        v102 = v118;
        v119 = CFArrayGetValueAtIndex(v109, v118);
        if (v105 == v119)
        {
          v107 = 0;
          v108 = 8;
          v106 = v105;
        }
        else
        {
          v106 = v119;
          if (v105 >= v119)
            goto LABEL_325;
          v108 = 0;
          v107 = 1;
        }
        goto LABEL_243;
      }
LABEL_253:
      v99 = CFArrayCreateMutable(allocator, 0, 0);
      v120 = (CFIndex)v170;
      if (v170)
        v120 = CFArrayGetCount(v170);
      self = v156;
      v121 = v159;
      v95 = v150;
      if (!v159
        || (v122 = v120, v123 = CFArrayGetCount(v159), !v122)
        || (v124 = v123) == 0
        || (v125 = v122, v126 = (CFIndex)v153, (uint64_t)v153 >= v122)
        || v33 >= v123)
      {
        v98 = Mutable;
        goto LABEL_313;
      }
      theArraya = (CFArrayRef)v99;
      v105 = 0;
      v106 = 0;
      v127 = 0;
      v128 = 8;
LABEL_261:
      if ((v127 & 1) == 0)
      {
        if (v128)
        {
          v139 = v106;
          v138 = v126;
          v137 = v125;
          v142 = theArraya;
          goto LABEL_285;
        }
        goto LABEL_326;
      }
      v129 = v170;
      if (!v106)
      {
        v130 = v125;
        v131 = v126;
        v132 = CFArrayGetValueAtIndex(v170, v126);
        v126 = v131;
        v106 = v132;
        v125 = v130;
      }
      if (!v105)
      {
        v133 = v125;
        v134 = v126;
        v135 = CFArrayGetValueAtIndex(v121, v33);
        v126 = v134;
        v105 = v135;
        v125 = v133;
      }
      v136 = v105 >= v106;
      if (v105 < v106)
        v137 = v124;
      else
        v137 = v125;
      if (v105 >= v106)
      {
        v138 = v126;
      }
      else
      {
        v124 = v125;
        v138 = v33;
      }
      if (v105 >= v106)
      {
        v139 = v106;
      }
      else
      {
        v33 = v126;
        v139 = v105;
      }
      if (v105 < v106)
        v105 = v106;
      v140 = v121;
      if (!v136)
      {
        v121 = v170;
        v129 = v140;
      }
      if (v105 < v139)
        goto LABEL_324;
      v142 = theArraya;
      v170 = v129;
      if (v137 >= 9)
      {
        v141 = v105 - v139;
        if (log((double)v137) < (double)v141)
        {
          if (v139 && v105)
          {
            v186.length = v137 - v138;
            v186.location = v138;
            v143 = CFArrayBSearchValues(v129, v186, v105, (CFComparatorFunction)PSIRowIDCompare_95714, 0);
            if (v143 >= v137)
              goto LABEL_321;
            v144 = v143;
            v145 = CFArrayGetValueAtIndex(v129, v143);
            if (v105 == v145)
            {
              v127 = 0;
              v125 = v137;
              v128 = 8;
              v106 = v105;
LABEL_311:
              v126 = v144;
              goto LABEL_301;
            }
            v106 = v145;
            if (v105 < v145)
            {
              v128 = 0;
              v127 = 1;
              v125 = v137;
              goto LABEL_311;
            }
LABEL_325:
            __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
          }
LABEL_334:
          __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
        }
      }
      v128 = 8;
      while (1)
      {
LABEL_285:
        v127 = 1;
        if (v138 >= v137 || v33 >= v124)
        {
LABEL_300:
          v125 = v137;
          v126 = v138;
          v106 = v139;
LABEL_301:
          if (v126 >= v125 || v33 >= v124)
          {
LABEL_321:
            self = v156;
            v95 = v150;
            v98 = Mutable;
            v99 = theArraya;
            goto LABEL_313;
          }
          goto LABEL_261;
        }
        if (!v128)
        {
          v128 = -1;
          v127 = 1;
          goto LABEL_300;
        }
        if (v139)
        {
          if (!v105)
            goto LABEL_295;
        }
        else
        {
          v139 = CFArrayGetValueAtIndex(v170, v138);
          if (!v105)
LABEL_295:
            v105 = CFArrayGetValueAtIndex(v121, v33);
        }
        if (v139 >= v105)
        {
          if (v139 <= v105)
          {
            if (v142)
              CFArrayGetCount(v142);
            CFArrayAppendValue(v142, v139);
            v139 = 0;
            v105 = 0;
            ++v138;
            ++v33;
          }
          else
          {
            v105 = 0;
            ++v33;
            --v128;
          }
        }
        else
        {
          v139 = 0;
          ++v138;
          --v128;
        }
      }
    }
    if (v108)
    {
      v114 = v106;
      v117 = (CFIndex)v169;
      goto LABEL_226;
    }
LABEL_326:
    if (!v106 || !v105)
      goto LABEL_334;
LABEL_328:
    __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
  }
  if (!v87)
  {
    objc_msgSend(v166, "normalizedString");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "length");

    if (v90 == v92)
    {
      v88 = 0;
      goto LABEL_182;
    }
  }
LABEL_181:
  v17 = 0;
LABEL_319:

  v7 = v166;
  v15 = v163;
LABEL_320:

  return v17;
}

- (void)pop
{
  void *v3;
  unint64_t v4;
  PSIGroup *filenameGroupInAggregate;
  id v6;

  -[NSMutableArray lastObject](self->_groupAggregateItems, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "category") == 2100)
  {
    v4 = self->_filenameGroupCount - 1;
    self->_filenameGroupCount = v4;
    if (!v4)
    {
      filenameGroupInAggregate = self->_filenameGroupInAggregate;
      self->_filenameGroupInAggregate = 0;

    }
  }
  objc_msgSend(v6, "reset");
  -[NSMutableArray addObject:](self->_aggregateItemPool, "addObject:", v6);
  -[NSMutableArray removeLastObject](self->_groupAggregateItems, "removeLastObject");

}

- (id)aggregateItemWithSearchToken:(id)a3 rangeMatchingToken:(id)a4 group:(id)a5
{
  NSMutableArray *aggregateItemPool;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  PSIGroupAggregateItem *v13;

  aggregateItemPool = self->_aggregateItemPool;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[NSMutableArray lastObject](aggregateItemPool, "lastObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (PSIGroupAggregateItem *)v12;
    -[NSMutableArray removeLastObject](self->_aggregateItemPool, "removeLastObject");
  }
  else
  {
    v13 = objc_alloc_init(PSIGroupAggregateItem);
  }
  -[PSIGroupAggregateItem setSearchToken:](v13, "setSearchToken:", v11);

  -[PSIGroupAggregateItem setRangeMatchingToken:](v13, "setRangeMatchingToken:", v10);
  -[PSIGroupAggregateItem setGroup:](v13, "setGroup:", v9);

  return v13;
}

- (BOOL)_verifySortedGroupIdsUnique
{
  __CFArray *v3;
  uint64_t v4;
  NSMutableArray *aggregatedGroupIds;
  uint64_t v6;
  char v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v3 = -[PSIGroupAggregate _newSortedGroupIds](self, "_newSortedGroupIds");
  v4 = -[NSMutableArray count](self->_aggregatedGroupIds, "count");
  aggregatedGroupIds = self->_aggregatedGroupIds;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PSIGroupAggregate__verifySortedGroupIdsUnique__block_invoke;
  v9[3] = &unk_1E3675FD8;
  v9[4] = &v10;
  v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](aggregatedGroupIds, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, v4, 1280, v9);
  if (*((_BYTE *)v11 + 24))
    -[NSMutableArray insertObject:atIndex:](self->_aggregatedGroupIds, "insertObject:atIndex:", v3, v6);
  CFRelease(v3);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFArray)_newSortedGroupIds
{
  CFIndex v4;
  __CFArray *Mutable;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[NSMutableArray count](self->_groupAggregateItems, "count");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIGroupAggregate.m"), 338, CFSTR("expect nonempty aggregate"));

  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_groupAggregateItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "group", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v11, "groupId"));

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v20.location = 0;
  v20.length = v4;
  CFArraySortValues(Mutable, v20, (CFComparatorFunction)PSIRowIDCompare_95714, 0);
  return Mutable;
}

- (id)newGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6;
  id v7;
  id v8;
  PSIGroupResultGroupSnapshot *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[PSIGroupAggregate newGroupResult](self, "newGroupResult");
  if (v6)
  {
    v9 = -[PSIGroupResultGroupSnapshot initWithDateFilter:datedTokens:]([PSIGroupResultGroupSnapshot alloc], "initWithDateFilter:datedTokens:", v6, v7);
    objc_msgSend(v8, "groups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroups:", v11);

  }
  return v8;
}

- (id)newGroupResult
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  PSIGroupResultGroupSnapshot *v16;
  PSIGroupResultGroupSnapshot *v17;
  void *v18;
  void *v19;
  PSIGroupAggregate *v20;
  void *v21;
  void *v22;
  void *v23;
  PSIGroupResult *v24;
  void *v25;
  int v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  int IsMutuallyExclusive;
  PSIGroupAggregate *v41;
  NSMutableArray *obj;
  id obja;
  uint64_t v44;
  PSIGroupResult *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_groupAggregateItems, "count");
  if (v3)
  {
    v4 = v3;
    if (-[PSIGroupAggregate _verifySortedGroupIdsUnique](self, "_verifySortedGroupIdsUnique"))
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v41 = self;
      obj = self->_groupAggregateItems;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v6)
      {
        v7 = v6;
        v44 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v52 != v44)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v9, "group", v41);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "rangeMatchingToken");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v5, "count");
            v13 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v12, 1280, &__block_literal_global_95708);
            if (v13 == v12
              || (objc_msgSend(v5, "objectAtIndex:", v13),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  v15 = objc_msgSend(v10, "isEqual:", v14),
                  v14,
                  (v15 & 1) == 0))
            {
              objc_msgSend(v5, "insertObject:atIndex:", v10, v13);
              v17 = [PSIGroupResultGroupSnapshot alloc];
              objc_msgSend(v9, "searchToken");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[PSIGroupResultGroupSnapshot initWithGroup:token:](v17, "initWithGroup:token:", v10, v18);

              objc_msgSend(v46, "insertObject:atIndex:", v16, v13);
              if (!v11)
                goto LABEL_14;
LABEL_13:
              -[PSIGroupResultGroupSnapshot addMatchRange:](v16, "addMatchRange:", v11);
              goto LABEL_14;
            }
            objc_msgSend(v46, "objectAtIndexedSubscript:", v13);
            v16 = (PSIGroupResultGroupSnapshot *)objc_claimAutoreleasedReturnValue();
            if (v11)
              goto LABEL_13;
LABEL_14:
            objc_msgSend(v9, "searchToken");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSIGroupResultGroupSnapshot addToken:](v16, "addToken:", v19);

          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v7);
      }

      v20 = v41;
      -[NSMutableArray lastObject](v41->_groupAggregateItems, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assetIds");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "collectionIds");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[PSIGroupResult initWithQueue:]([PSIGroupResult alloc], "initWithQueue:", v41->_groupResultsQueue);
      -[PSIGroupResult setGroups:](v24, "setGroups:", v46);
      -[PSIGroupResult setAssetIds:](v24, "setAssetIds:", v22);
      -[PSIGroupResult setCollectionIds:](v24, "setCollectionIds:", v23);
      if (-[NSMutableArray count](v41->_groupAggregateItems, "count") == 1
        && (objc_msgSend(v21, "group"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = PLSearchIndexCategoryIsMutuallyExclusive((int)objc_msgSend(v25, "category")),
            v25,
            v26))
      {
        objc_msgSend(v21, "group");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSIGroupResult setDedupingSkippedCategory:](v24, "setDedupingSkippedCategory:", objc_msgSend(v27, "category"));
      }
      else
      {
        if (!-[PSIGroupResult containsFilterSearchTokens](v24, "containsFilterSearchTokens", v41))
        {
LABEL_38:

          return v24;
        }
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v28 = v20->_groupAggregateItems;
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v29)
        {
          v30 = v29;
          obja = v21;
          v45 = v24;
          v31 = 0;
          v27 = 0;
          v32 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v48 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_msgSend(v34, "searchToken");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isFilterTypeToken");

              if ((v36 & 1) == 0)
              {
                v37 = v34;

                if (v31)
                {

                  v27 = 0;
                  v21 = obja;
                  v24 = v45;
                  goto LABEL_36;
                }
                v27 = v37;
                v31 = 1;
              }
            }
            v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v30)
              continue;
            break;
          }

          v24 = v45;
          if (!v27)
          {
            v21 = obja;
            goto LABEL_37;
          }
          objc_msgSend(v27, "group");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          IsMutuallyExclusive = PLSearchIndexCategoryIsMutuallyExclusive((int)objc_msgSend(v38, "category"));

          v21 = obja;
          if (!IsMutuallyExclusive)
            goto LABEL_37;
          objc_msgSend(v27, "group");
          v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          -[PSIGroupResult setDedupingSkippedCategory:](v45, "setDedupingSkippedCategory:", -[NSMutableArray category](v28, "category"));
        }
        else
        {
          v27 = 0;
        }
LABEL_36:

      }
LABEL_37:

      goto LABEL_38;
    }
  }
  return 0;
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (void)setTransientToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PSIGroup)filenameGroupInAggregate
{
  return self->_filenameGroupInAggregate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameGroupInAggregate, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_groupResultsQueue, 0);
  objc_storeStrong((id *)&self->_aggregateItemPool, 0);
  objc_storeStrong((id *)&self->_aggregatedGroupIds, 0);
  objc_storeStrong((id *)&self->_groupAggregateItems, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
}

uint64_t __35__PSIGroupAggregate_newGroupResult__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareToGroup:");
}

uint64_t __48__PSIGroupAggregate__verifySortedGroupIdsUnique__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const void *ValueAtIndex;
  const void *v12;
  uint64_t v13;

  v6 = a2;
  v7 = a3;
  Count = CFArrayGetCount(v6);
  v9 = CFArrayGetCount(v7);
  if (Count >= v9)
  {
    if (Count <= v9)
    {
      if (Count < 1)
      {
LABEL_15:
        v3 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      else
      {
        v10 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
          v12 = CFArrayGetValueAtIndex(v7, v10);
          v13 = ValueAtIndex > v12 ? 1 : v3;
          v3 = ValueAtIndex < v12 ? -1 : v13;
          if (ValueAtIndex != v12)
            break;
          if (Count == ++v10)
            goto LABEL_15;
        }
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = -1;
  }

  return v3;
}

BOOL __119__PSIGroupAggregate__rangeOfString_inGroup_useNormalizedString_extendingSearchRange_matchingFullToken_excludingRanges___block_invoke(NSRange *a1, void *a2)
{
  NSUInteger v3;
  NSRange v5;

  v5.location = objc_msgSend(a2, "rangeValue");
  v5.length = v3;
  return NSIntersectionRange(a1[32], v5).length != 0;
}

@end
