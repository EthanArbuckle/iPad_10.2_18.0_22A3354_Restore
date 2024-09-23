@implementation PGCommonTitleUtility

+ (id)addressNodesFromMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PGGraphMomentNodeCollection *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v3, v5);
    -[PGGraphMomentNodeCollection addressNodes](v6, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)isLargeCountryForAddressNode:(id)a3 locationHelper:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "countryNodeFromAddressNode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = +[PGCountrySize isLargeCountry:](PGCountrySize, "isLargeCountry:", v6);

  return (char)v4;
}

+ (BOOL)containsCelebrationForDateNodes:(id)a3 holidayName:(id *)a4 titleGenerationContext:(id)a5 graph:(id)a6
{
  id v8;
  uint64_t v9;
  char **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  char *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *context;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a5;
  v33 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v9)
  {
    v35 = 0;
    v32 = *(_QWORD *)v45;
    v10 = &selRef_collidesWithPersonWithLocalIdentifier_;
LABEL_3:
    v39 = 0;
    v29 = v10[15];
    v31 = v9;
    while (1)
    {
      if (*(_QWORD *)v45 != v32)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v39);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v11, "collection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "holidayNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphEdgeCollection edgesToNodes:](PGGraphCelebratingEdgeCollection, "edgesToNodes:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "holidayNodes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "holidayNames");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v11, "localDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "holidayService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "infoNode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "countryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __97__PGCommonTitleUtility_containsCelebrationForDateNodes_holidayName_titleGenerationContext_graph___block_invoke;
      v40[3] = &unk_1E84284B0;
      v42 = &v48;
      v43 = a4;
      v22 = v16;
      v41 = v22;
      objc_msgSend(v18, "enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", v15, v17, v17, v21, v40);

      v23 = *((unsigned __int8 *)v49 + 24);
      if (*((_BYTE *)v49 + 24))
        v24 = a4 == 0;
      else
        v24 = 1;
      if (!v24)
      {
        objc_msgSend(v22, "sortedArrayUsingSelector:", v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = objc_claimAutoreleasedReturnValue();

        v35 = (id)v26;
      }

      objc_autoreleasePoolPop(context);
      v10 = &selRef_collidesWithPersonWithLocalIdentifier_;
      if (v23)
        break;
      if (v31 == ++v39)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v35 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v35);
  v27 = *((_BYTE *)v49 + 24) != 0;

  _Block_object_dispose(&v48, 8);
  return v27;
}

+ (id)holidayNameForDateNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "collection", (_QWORD)v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "holidayNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_5530);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && objc_msgSend(v14, "length"))
          {
            objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

+ (id)dateNodesFromMomentNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dateNodes", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)bestAddressNodeForMomentNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "bestAddressNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyEdgeFromNode:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6 || (objc_msgSend(v6, "relevance"), v14 = v13, objc_msgSend(v12, "relevance"), v14 < v15))
        {
          v16 = v12;

          v17 = v11;
          v6 = v16;
          v7 = v17;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v7;
}

+ (void)startAndEndDateNodeFromDateNodes:(id)a3 startDateNode:(id *)a4 endDateNode:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v18 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v21 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "localDate", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7 || objc_msgSend(v7, "compare:", v13) == 1)
        {
          v14 = v13;

          v15 = v12;
          v7 = v14;
          v10 = v15;
        }
        if (!v8 || objc_msgSend(v8, "compare:", v13) == -1)
        {
          v16 = v13;

          v17 = v12;
          v8 = v16;
          v9 = v17;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  if (v18)
    *v18 = objc_retainAutorelease(v10);
  if (a5)
    *a5 = objc_retainAutorelease(v9);

}

+ (_NSRange)_closestSpaceMatchFromMatches:(id)a3 withUsedNameRange:(_NSRange)a4 searchForward:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t i;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  int64_t v24;
  uint64_t v25;
  BOOL v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  _BOOL4 v31;
  uint64_t v32;
  NSUInteger v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  NSRange v41;
  _NSRange result;
  NSRange v43;
  NSRange v44;

  v31 = a5;
  length = a4.length;
  location = a4.location;
  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    v10 = location + length;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    v33 = 0;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v13.location = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "range");
        if (v13.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13.location;
          v15 = v13.length;
          v43.location = location;
          v43.length = length;
          v16 = NSIntersectionRange(v13, v43).length;
          v41.location = v14;
          v41.length = v15;
          v44.location = location;
          v44.length = length;
          v17 = NSUnionRange(v41, v44);
          v18 = v14 - v10 + v15;
          if (location <= v14)
          {
            v19 = location + length;
          }
          else
          {
            v18 = location - v14;
            v19 = v14;
          }
          if (v17.location == location && v17.length == length)
          {
            v18 = v15;
            v21 = v14;
          }
          else
          {
            v21 = v19;
          }
          if (v16)
            v22 = v18;
          else
            v22 = v15;
          if (v16)
            v23 = v21;
          else
            v23 = v14;
          if (v31)
          {
            if (v23 < v10)
              continue;
          }
          else if (location <= v23)
          {
            continue;
          }
          v24 = location - v23;
          if ((uint64_t)(location - v23) < 0)
            v24 = v23 - location;
          v25 = location - (v22 + v23);
          if (v25 < 0)
            v25 = v22 + v23 - location;
          if (v24 >= (unint64_t)v25)
            v24 = v25;
          v26 = v24 < v11;
          if (v24 < v11)
            v11 = v24;
          v27 = v33;
          if (v26)
            v27 = v22;
          v28 = v32;
          if (v26)
            v28 = v23;
          v32 = v28;
          v33 = v27;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v8)
        goto LABEL_43;
    }
  }
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  v33 = 0;
LABEL_43:

  v29 = v32;
  v30 = v33;
  result.length = v30;
  result.location = v29;
  return result;
}

+ (id)titleWithNoLineBreakSpaceForTitle:(id)a3 andUsedNames:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, v13);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)titleWithLineBreakForTitle:(id)a3 andUsedNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t i;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  BOOL v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  id v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  BOOL v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  id obj;
  void *v89;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v87 = objc_msgSend(v5, "length");
  if (v87 <= 0xB)
  {
    v7 = v5;
    goto LABEL_113;
  }
  v101 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[\\r\\n\\t\\f\\v ]+"), 64, &v101);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v101;
  v83 = v8;
  objc_msgSend(v8, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v84 = v6;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  if (!v9)
    goto LABEL_45;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v98;
  do
  {
    v13 = 0;
    v85 = v11;
    v86 = -v11;
    do
    {
      if (*(_QWORD *)v98 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v13);
      v15 = objc_msgSend(v5, "rangeOfString:", v14);
      v17 = v15;
      v18 = v16;
      if (v15)
        v19 = v15 == 0x7FFFFFFFFFFFFFFFLL;
      else
        v19 = 1;
      if (v19)
      {
LABEL_13:
        v20 = 0;
        goto LABEL_14;
      }
      v28 = objc_msgSend(a1, "_closestSpaceMatchFromMatches:withUsedNameRange:searchForward:", v89, v15, v16, 0);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = 0;
        if (v86 != v13)
          goto LABEL_14;
        v30 = 0;
        v31 = v17;
      }
      else
      {
        v30 = v28 + v29;
        v31 = v17 - (v28 + v29);
        v32 = v17 <= v28 + v29 || v30 == 0x7FFFFFFFFFFFFFFFLL;
        if (v32 || v17 >= objc_msgSend(v5, "length"))
          goto LABEL_13;
      }
      objc_msgSend(v5, "substringWithRange:", v30, v31);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      if (v17 == 0x7FFFFFFFFFFFFFFFLL
        || (v21 = v17 + v18, v17 + v18 >= objc_msgSend(v5, "length"))
        || ((v22 = objc_msgSend(a1, "_closestSpaceMatchFromMatches:withUsedNameRange:searchForward:", v89, v17, v18, 1), v22 != 0x7FFFFFFFFFFFFFFFLL)? (v23 = v22 > v21): (v23 = 0), !v23 || v21 == 0x7FFFFFFFFFFFFFFFLL || (v24 = v22, v22 >= objc_msgSend(v5, "length"))))
      {
        v25 = 0;
      }
      else
      {
        objc_msgSend(v5, "substringWithRange:", v21, v24 - v21);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      if (v25 | v20)
      {
        if (!v20)
          v20 = (uint64_t)&stru_1E8436F28;
        if (v25)
          v27 = (__CFString *)v25;
        else
          v27 = &stru_1E8436F28;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v20, v14, v27);
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = v14;
      }
      objc_msgSend(v91, "addObject:", v26);

      ++v13;
    }
    while (v10 != v13);
    v11 = v85 + v10;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    v10 = v33;
  }
  while (v33);
LABEL_45:

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v34 = v91;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (!v35)
  {

LABEL_111:
    objc_msgSend(a1, "titleWithLineBreakForTitle:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_112;
  }
  v36 = v35;
  v37 = vcvtps_u32_f32((float)v87 * 0.5);
  v38 = -1;
  v39 = *(_QWORD *)v94;
  v40 = -1;
  v41 = -1;
  v42 = -1;
  v92 = v34;
  do
  {
    for (i = 0; i != v36; ++i)
    {
      if (*(_QWORD *)v94 != v39)
        objc_enumerationMutation(v92);
      v44 = objc_msgSend(v5, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i));
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v46 = v44 + v45;
        if ((uint64_t)(v37 - v44) >= 0)
          v47 = v37 - v44;
        else
          v47 = v44 - v37;
        v48 = v37 - v46;
        if ((uint64_t)(v37 - v46) < 0)
          v48 = v46 - v37;
        if (v47 >= v38)
          v49 = v38;
        else
          v49 = v47;
        if (v47 >= v38)
          v50 = v41;
        else
          v50 = v44;
        v51 = v47 >= v40;
        if (v47 >= v40)
          v47 = v40;
        else
          v49 = v40;
        if (v51)
        {
          v52 = v42;
        }
        else
        {
          v50 = v42;
          v52 = v44;
        }
        if (v44)
        {
          v38 = v49;
          v40 = v47;
          v41 = v50;
          v42 = v52;
        }
        if (v46 != v87)
        {
          if (v48 >= v40)
          {
            if (v48 < v38)
            {
              v38 = v48;
              v41 = v44 + v45;
            }
          }
          else
          {
            v38 = v40;
            v40 = v48;
            v41 = v42;
            v42 = v44 + v45;
          }
        }
      }
    }
    v34 = v92;
    v36 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  }
  while (v36);

  if (v42 == -1)
    goto LABEL_111;
  if (v41 == -1)
    v53 = v42;
  else
    v53 = v41;
  v54 = 0x1E0CB3000;
  if (v87 > 0x16)
  {
LABEL_87:
    v57 = 0;
    goto LABEL_88;
  }
  if (v42 <= v53)
    v55 = v53;
  else
    v55 = v42;
  objc_msgSend(v5, "substringToIndex:", v55);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (double)(unint64_t)objc_msgSend(v56, "length");
  if ((double)(unint64_t)objc_msgSend(v57, "length") * 1.5 < v58)
  {

    goto LABEL_87;
  }
  if (!v56)
  {
LABEL_88:
    objc_msgSend(v5, "substringToIndex:", v42);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", v42);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringToIndex:", v53);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", v53);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v59, "length");
    if ((uint64_t)(v63 - v37) >= 0)
      v64 = v63 - v37;
    else
      v64 = v37 - v63;
    v65 = objc_msgSend(v61, "length");
    if ((uint64_t)(v65 - v37) >= 0)
      v66 = v65 - v37;
    else
      v66 = v37 - v65;
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v60, "rangeOfCharacterFromSet:options:", v67, 0);
    v69 = objc_msgSend(v62, "rangeOfCharacterFromSet:options:", v67, 0);
    if (v68)
      v70 = v64 >= v66;
    else
      v70 = 1;
    v71 = !v70 || v69 == 0;
    if (v71)
      v72 = v59;
    else
      v72 = v61;
    if (v71)
      v73 = v60;
    else
      v73 = v62;
    v56 = v72;
    v74 = v73;
    v34 = v92;
    v75 = v74;

    v54 = 0x1E0CB3000uLL;
    v57 = v75;
  }
  objc_msgSend(*(id *)(v54 + 1280), "whitespaceCharacterSet");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "pg_stringByTrailingCharactersInSet:options:", v76, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v77, "isEqualToString:", v57) & 1) == 0)
  {
    objc_msgSend(v57, "substringToIndex:", objc_msgSend(v57, "length") - objc_msgSend(v77, "length"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v77;

    objc_msgSend(v56, "stringByAppendingString:", v78);
    v80 = objc_claimAutoreleasedReturnValue();

    v56 = (id)v80;
    v57 = v79;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v56, CFSTR("\n"), v57);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_112:
  v6 = v84;

LABEL_113:
  return v7;
}

+ (id)titleWithLineBreakForTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") >= 0xC)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v17 = (unint64_t)objc_msgSend(v5, "length") >> 1;
    v6 = objc_msgSend(v5, "length");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__PGCommonTitleUtility_titleWithLineBreakForTitle___block_invoke;
    v13[3] = &unk_1E8428518;
    v13[4] = &v14;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v13);
    v7 = v15[3];
    if (v7 < objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("([{"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15[3];
      if (v9 >= 2)
      {
        do
        {
          if (!objc_msgSend(v8, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v9 - 1)))
            break;
          v9 = v15[3] - 1;
          v15[3] = v9;
        }
        while (v9 > 1);
      }

    }
    v10 = v15[3];
    if (v10 && v10 < objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v15[3], 0, CFSTR("\n"));
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

+ (id)locationLabelForDimension:(unint64_t)a3
{
  __CFString *v3;
  void *v5;
  NSObject *v6;
  id result;
  __CFString *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
      v3 = CFSTR("Area");
      goto LABEL_14;
    case 2uLL:
      v3 = CFSTR("Address");
      goto LABEL_14;
    case 3uLL:
      v3 = CFSTR("Number");
      goto LABEL_14;
    case 4uLL:
      v3 = CFSTR("Street");
      goto LABEL_14;
    case 5uLL:
      v3 = CFSTR("District");
      goto LABEL_14;
    case 6uLL:
      v3 = CFSTR("City");
      goto LABEL_14;
    case 7uLL:
      v3 = CFSTR("County");
      goto LABEL_14;
    case 8uLL:
      v3 = CFSTR("State");
      goto LABEL_14;
    case 9uLL:
      v3 = CFSTR("Country");
LABEL_14:
      v8 = v3;
      result = v3;
      break;
    default:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loggingConnection");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = a3;
        _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Couldn't match dimension %lu to label", (uint8_t *)&v9, 0xCu);
      }

      result = 0;
      break;
  }
  return result;
}

+ (unint64_t)dimensionForLabel:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;

  v3 = a3;
  if (dimensionForLabel__onceToken != -1)
    dispatch_once(&dimensionForLabel__onceToken, &__block_literal_global_197);
  v4 = objc_msgSend((id)dimensionForLabel__dimensionLabelMapping, "indexOfObject:", v3);
  if (v4)
    v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 1;
  if (v5)
    v6 = 0;
  else
    v6 = v4;

  return v6;
}

void __42__PGCommonTitleUtility_dimensionForLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("None");
  v2[1] = CFSTR("Area");
  v2[2] = CFSTR("Address");
  v2[3] = CFSTR("Number");
  v2[4] = CFSTR("Street");
  v2[5] = CFSTR("District");
  v2[6] = CFSTR("City");
  v2[7] = CFSTR("County");
  v2[8] = CFSTR("State");
  v2[9] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dimensionForLabel__dimensionLabelMapping;
  dimensionForLabel__dimensionLabelMapping = v0;

}

uint64_t __51__PGCommonTitleUtility_titleWithLineBreakForTitle___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 >= a5 && v8 - a5 < a6)
  {
    if (v8 >= a3 + (a4 >> 1))
      v10 = a6;
    else
      v10 = 0;
    *(_QWORD *)(v7 + 24) = a5 + v10;
    *a7 = 1;
  }
  return result;
}

uint64_t __48__PGCommonTitleUtility_holidayNameForDateNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E8436F28;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E8436F28;
  }
  if (-[__CFString length](v7, "length") || !-[__CFString length](v8, "length"))
  {
    if (-[__CFString length](v8, "length") || !-[__CFString length](v7, "length"))
      v9 = -[__CFString localizedCompare:](v7, "localizedCompare:", v8);
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __97__PGCommonTitleUtility_containsCelebrationForDateNodes_holidayName_titleGenerationContext_graph___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[6];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (v2)
  {
    v3 = (void *)a1[4];
    objc_msgSend(a2, "localizedName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
