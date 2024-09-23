@implementation PLScopedSearchUtilities

+ (void)intersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 shouldGenerateCompletionCandidates:(BOOL)a5 query:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const __CFAllocator *v16;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v18;
  id v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  __CFArray *v26;
  __CFArray *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL4 v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint8_t buf[8];
  CFMutableArrayRef v40;

  v34 = a5;
  v12 = a3;
  v36 = a6;
  v13 = a7;
  v37 = v12;
  if (objc_msgSend(v12, "count"))
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupArrays.count > 0"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v33 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultTypes != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)"));

  }
  v14 = a1;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v18 = CFArrayCreateMutable(v16, 0, 0);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = CFArrayCreateMutable(v16, 0, 0);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  PLPhotosSearchGetLog();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_generate(v21);

  v23 = v21;
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PLSearchGroupIntersectionsSignpost", ", buf, 2u);
  }

  v38 = v19;
  if (v34)
    v25 = v15;
  else
    v25 = 0;
  objc_msgSend(v14, "_recursivelyIntersectGroups:searchResultTypes:query:groupArrayIndex:iterationCount:iterationIdIntersections:finalIdIntersections:finalExactMatchIdIntersections:iterationGroups:finalGroups:allMatchedGroups:", v37, a4, v36, 0, 0, &v40, Mutable, v18, &v38, v25, v20);
  v35 = v38;

  v26 = +[PLScopedSearchUtilities _sortCFArrayOfPSIIdentifiers:](PLScopedSearchUtilities, "_sortCFArrayOfPSIIdentifiers:", Mutable);
  v27 = +[PLScopedSearchUtilities _sortCFArrayOfPSIIdentifiers:](PLScopedSearchUtilities, "_sortCFArrayOfPSIIdentifiers:", v18);
  v28 = v24;
  v29 = v28;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v22, "PLSearchGroupIntersectionsSignpost", ", buf, 2u);
  }

  CFRelease(v40);
  CFRelease(Mutable);
  CFRelease(v18);
  v40 = 0;
  ((void (**)(_QWORD, __CFArray *, __CFArray *, id, id))v33)[2](v33, v26, v27, v15, v20);

}

+ (void)intersectSortedArray:(const __CFArray *)a3 withOtherSortedArray:(__CFArray *)a4 intersectionLimit:(unint64_t)a5
{
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  uint64_t v10;
  __CFArray *v11;
  const void *v12;
  const void *v13;
  char v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  CFIndex v20;
  const void *v21;
  const __CFArray *v22;
  __CFArray *v23;
  unint64_t v24;
  const __CFArray *v25;
  const __CFArray *v26;
  unint64_t v27;
  __CFArray *v28;
  const void *ValueAtIndex;
  __CFArray *v30;
  const void *v31;
  CFIndex v32;
  const void *v33;
  const __CFArray *v35;
  unint64_t v36;
  __CFArray *Mutable;
  const __CFArray *theArray;
  CFRange v39;

  v7 = *a3;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v35 = v7;
  if (v7)
  {
    Count = CFArrayGetCount(v7);
    if (!a4)
      goto LABEL_72;
  }
  else
  {
    Count = 0;
    if (!a4)
      goto LABEL_72;
  }
  v9 = CFArrayGetCount(a4);
  if (!Count)
    goto LABEL_72;
  v10 = v9;
  if (!v9 || Count < 1 || v9 < 1)
    goto LABEL_72;
  v11 = a4;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v36 = a5 - 1;
  v17 = 8;
  theArray = v7;
  while (1)
  {
    if ((v14 & 1) == 0)
    {
      if (v17)
      {
        v21 = v13;
        v20 = v16;
        v19 = Count;
        goto LABEL_34;
      }
      if (v13 && v12)
        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
LABEL_80:
      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
    }
    if (v13)
    {
      if (v12)
        goto LABEL_13;
    }
    else
    {
      v28 = v11;
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v16);
      v11 = v28;
      v13 = ValueAtIndex;
      if (v12)
        goto LABEL_13;
    }
    v30 = v11;
    v31 = CFArrayGetValueAtIndex(v11, v15);
    v11 = v30;
    v12 = v31;
LABEL_13:
    v18 = v12 >= v13;
    if (v12 < v13)
      v19 = v10;
    else
      v19 = Count;
    if (v12 >= v13)
    {
      v20 = v16;
    }
    else
    {
      v10 = Count;
      v20 = v15;
    }
    if (v12 >= v13)
    {
      v21 = v13;
    }
    else
    {
      v15 = v16;
      v21 = v12;
    }
    if (v12 < v13)
      v12 = v13;
    v22 = theArray;
    if (v18)
      v23 = v11;
    else
      v23 = theArray;
    if (!v18)
      v22 = v11;
    theArray = v22;
    if (v12 < v21)
      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
    if (v19 >= 9)
      break;
    v11 = v23;
    v17 = 8;
LABEL_34:
    v25 = Mutable;
LABEL_35:
    v14 = 1;
    if (v20 >= v19)
      goto LABEL_59;
    v26 = v11;
    if (v15 >= v10)
      goto LABEL_58;
    while (v17)
    {
      if (v21)
      {
        if (v12)
          goto LABEL_40;
      }
      else
      {
        v21 = CFArrayGetValueAtIndex(theArray, v20);
        if (v12)
          goto LABEL_40;
      }
      v12 = CFArrayGetValueAtIndex(v26, v15);
LABEL_40:
      if (v21 < v12)
      {
        v21 = 0;
        ++v20;
LABEL_44:
        --v17;
        goto LABEL_52;
      }
      if (v21 > v12)
      {
        v12 = 0;
        ++v15;
        goto LABEL_44;
      }
      if (v25)
        v27 = CFArrayGetCount(v25);
      else
        v27 = 0;
      if (v36 < v27)
        goto LABEL_72;
      v25 = Mutable;
      CFArrayAppendValue(Mutable, v21);
      v21 = 0;
      v12 = 0;
      ++v20;
      ++v15;
LABEL_52:
      v14 = 1;
      if (v20 >= v19 || v15 >= v10)
        goto LABEL_58;
    }
    v17 = -1;
    v14 = 1;
LABEL_58:
    v11 = v26;
LABEL_59:
    Count = v19;
    v16 = v20;
    v13 = v21;
LABEL_60:
    if (v16 >= Count || v15 >= v10)
      goto LABEL_72;
  }
  v25 = Mutable;
  v24 = (_BYTE *)v12 - (_BYTE *)v21;
  if (log((double)v19) >= (double)v24)
  {
    v11 = v23;
    v17 = 8;
    goto LABEL_35;
  }
  if (!v21 || !v12)
    goto LABEL_80;
  v39.length = v19 - v20;
  v39.location = v20;
  v32 = CFArrayBSearchValues(theArray, v39, v12, (CFComparatorFunction)PSIRowIDCompare, 0);
  if (v32 < v19)
  {
    v16 = v32;
    v33 = CFArrayGetValueAtIndex(theArray, v32);
    if (v12 == v33)
    {
      v14 = 0;
      v11 = v23;
      Count = v19;
      v17 = 8;
      v13 = v12;
    }
    else
    {
      v13 = v33;
      if (v12 >= v33)
        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
      v17 = 0;
      v14 = 1;
      v11 = v23;
      Count = v19;
    }
    goto LABEL_60;
  }
LABEL_72:
  *a3 = Mutable;
  if (v35)
    CFRelease(v35);
}

+ (void)_recursivelyIntersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 query:(id)a5 groupArrayIndex:(unint64_t)a6 iterationCount:(unint64_t)a7 iterationIdIntersections:(__CFArray *)a8 finalIdIntersections:(__CFArray *)a9 finalExactMatchIdIntersections:(__CFArray *)a10 iterationGroups:(id *)a11 finalGroups:(id)a12 allMatchedGroups:(id)a13
{
  id v18;
  id v19;
  __CFArray *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  const __CFArray *v25;
  const __CFArray *v26;
  CFIndex Count;
  CFIndex v28;
  id v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  int v33;
  __CFArray *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  __CFArray *v41;
  BOOL v42;
  __CFArray *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  const __CFArray *v50;
  const __CFArray *v51;
  CFIndex v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  id v62;
  __CFArray *v64;
  const __CFAllocator *allocator;
  void *v67;
  id v68;
  unint64_t v69;
  id v70;
  __CFArray *cf;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  CFRange v85;
  CFRange v86;
  CFRange v87;
  CFRange v88;

  v84 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v70 = a5;
  v19 = a12;
  v68 = a13;
  if (objc_msgSend(v18, "count"))
  {
    if (a8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupArrays.count > 0"));

    if (a8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iterationIdIntersections"));

LABEL_3:
  if (!a11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iterationGroups"));

  }
  v20 = a10;
  if (!a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalIdIntersections"));

    v20 = a10;
  }
  v64 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalExactMatchIdIntersections"));

  }
  if (v68)
  {
    if (a4)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allMatchedGroups"));

    if (a4)
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultTypes != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)"));

LABEL_11:
  if (objc_msgSend(v18, "count") > a6)
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "count"))
    {
      CFArrayRemoveAllValues(a9);
      CFArrayRemoveAllValues(v64);
      v53 = v19;
      goto LABEL_85;
    }
    if (objc_msgSend(v21, "count"))
    {
      v22 = 0;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v67 = v21;
      v61 = a6 + 1;
      v62 = v18;
      v69 = a6;
      do
      {
        if (objc_msgSend(v70, "isCanceled"))
        {
          CFArrayRemoveAllValues(a9);
          CFArrayRemoveAllValues(v64);
          v53 = v19;
LABEL_85:
          objc_msgSend(v53, "removeAllObjects");
          objc_msgSend(v68, "removeAllObjects");
          break;
        }
        if (!a6)
        {
          objc_msgSend(*a11, "removeAllObjects");
          CFArrayRemoveAllValues(*a8);
          a7 = v22;
        }
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if ((a4 & 1) != 0)
          v25 = (const __CFArray *)objc_msgSend(v23, "assetIds");
        else
          v25 = (const __CFArray *)objc_msgSend(v23, "collectionIds");
        v26 = v25;
        v72 = v24;
        if (v25)
          Count = CFArrayGetCount(v25);
        else
          Count = 0;
        v28 = CFArrayGetCount(*a8);
        cf = CFArrayCreateMutableCopy(allocator, v28, *a8);
        v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v30 = (void *)objc_msgSend(*a11, "mutableCopy");
        v73 = (id)objc_msgSend(v29, "initWithArray:", v30);

        if (v28)
        {
          +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", a8, v26, 0);
          a6 = v69;
          v31 = v72;
        }
        else
        {
          a6 = v69;
          v31 = v72;
          if (Count)
          {
            v85.location = 0;
            v85.length = Count;
            CFArrayAppendArray(*a8, v26, v85);
          }
        }
        v32 = +[PLScopedSearchUtilities groupDuplicateOrSynonymExistsForGroup:inGroups:](PLScopedSearchUtilities, "groupDuplicateOrSynonymExistsForGroup:inGroups:", v31, *a11);
        if (*a8)
        {
          if (CFArrayGetCount(*a8))
            v33 = !v32;
          else
            v33 = 0;
          if (v33 == 1 && Count)
            objc_msgSend(*a11, "addObject:", v31);
          if (objc_msgSend(v18, "count") - 1 == a6)
          {
            if (v33)
            {
              objc_msgSend(v19, "addObject:", v31);
              objc_msgSend(v31, "updateWithIntersectedIds:searchResultType:", *a8, a4);
              objc_msgSend(v68, "addObjectsFromArray:", *a11);
              v34 = *a8;
              v86.length = CFArrayGetCount(*a8);
              v86.location = 0;
              CFArrayAppendArray(a9, v34, v86);
              v80 = 0u;
              v81 = 0u;
              v78 = 0u;
              v79 = 0u;
              v35 = *a11;
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
              if (v36)
              {
                v37 = v36;
                v38 = 0;
                v39 = *(_QWORD *)v79;
                do
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v79 != v39)
                      objc_enumerationMutation(v35);
                    v38 += objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "isExactMatchForQuery");
                  }
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
                }
                while (v37);
              }
              else
              {
                v38 = 0;
              }

              v42 = v38 == objc_msgSend(*a11, "count");
              a6 = v69;
              v31 = v72;
              if (v42)
              {
                v43 = *a8;
                v87.length = CFArrayGetCount(*a8);
                v87.location = 0;
                CFArrayAppendArray(v64, v43, v87);
              }
            }
LABEL_58:
            v21 = v67;
            if (v22 == objc_msgSend(v67, "count") - 1)
            {
              objc_msgSend(v73, "removeLastObject");
              *a11 = objc_retainAutorelease(v73);
              CFArrayRemoveAllValues(*a8);
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v44 = *a11;
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
              if (v45)
              {
                v46 = v45;
                v47 = *(_QWORD *)v75;
                do
                {
                  for (j = 0; j != v46; ++j)
                  {
                    if (*(_QWORD *)v75 != v47)
                      objc_enumerationMutation(v44);
                    v49 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                    if ((a4 & 1) != 0)
                      v50 = (const __CFArray *)objc_msgSend(v49, "assetIds");
                    else
                      v50 = (const __CFArray *)objc_msgSend(v49, "collectionIds");
                    v51 = v50;
                    if (v50)
                      v52 = CFArrayGetCount(v50);
                    else
                      v52 = 0;
                    if (CFArrayGetCount(*a8))
                    {
                      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", a8, v51, 0);
                    }
                    else
                    {
                      v88.location = 0;
                      v88.length = v52;
                      CFArrayAppendArray(*a8, v51, v88);
                    }
                  }
                  v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
                }
                while (v46);
              }

              v18 = v62;
              a6 = v69;
              v21 = v67;
              v41 = cf;
              v31 = v72;
              if (!cf)
                goto LABEL_81;
            }
            else
            {
              if (*a8)
                CFRelease(*a8);
              v41 = cf;
              *a8 = cf;
              CFRetain(cf);
              *a11 = objc_retainAutorelease(v73);
              if (!cf)
                goto LABEL_81;
            }
            goto LABEL_80;
          }
          if (v33)
          {
            objc_msgSend(a1, "_recursivelyIntersectGroups:searchResultTypes:query:groupArrayIndex:iterationCount:iterationIdIntersections:finalIdIntersections:finalExactMatchIdIntersections:iterationGroups:finalGroups:allMatchedGroups:", v18, a4, v70, v61, a7, a8, a9, v64, a11, v19, v68);
            v21 = v67;
            v41 = cf;
            if (!cf)
              goto LABEL_81;
            goto LABEL_80;
          }
        }
        else if (objc_msgSend(v18, "count") - 1 == a6)
        {
          goto LABEL_58;
        }
        if (*a8)
          CFRelease(*a8);
        v41 = cf;
        *a8 = cf;
        CFRetain(cf);
        *a11 = objc_retainAutorelease(v73);
        v21 = v67;
        if (!cf)
          goto LABEL_81;
LABEL_80:
        CFRelease(v41);
LABEL_81:

        ++v22;
      }
      while (v22 < objc_msgSend(v21, "count"));
    }

  }
}

+ (BOOL)shouldUseExactMatchResultsForGroups:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groups.count > 0"));

  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v6, "addIndex:", 1203);
    objc_msgSend(v6, "addIndex:", 1204);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "isExactMatchForQuery"))
          {
            ++v11;
            if (objc_msgSend(v14, "matchTypeForQuery") == 1)
              v10 += objc_msgSend(v6, "containsIndex:", (int)objc_msgSend(v14, "category")) ^ 1;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }

    v15 = objc_msgSend(v7, "count") == v11 || v10 != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)removeGroupsWithNonExactMatchTextFromGroups:(id)a3 searchText:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82__PLScopedSearchUtilities_removeGroupsWithNonExactMatchTextFromGroups_searchText___block_invoke;
  v16 = &unk_1E36621D0;
  v17 = v5;
  v18 = v8;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)filterArrayOfGroupsArraysForEqualMatchType:(id)a3 searchTokens:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupsArrays.count > 0"));

  }
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTokens.count > 0"));

  }
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupsArrays.count == searchTokens.count"));

  }
  v9 = objc_msgSend(v6, "count");
  if (v9 != objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupsArrays.count == searchTokens.count"));

  }
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!objc_msgSend(v7, "count"))
      goto LABEL_40;
    v10 = 0;
    v39 = v7;
    v40 = v6;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v10;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (!v14)
        goto LABEL_33;
      v15 = v14;
      v16 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {
            objc_msgSend(v11, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lookupIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqualToString:", v21);

            if (v22)
            {
              objc_msgSend(v42, "addObject:", v18);
              v23 = v18;
              v24 = 3;
              goto LABEL_30;
            }
          }
          else
          {

          }
          objc_msgSend(v11, "normalizedText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "length"))
          {
            objc_msgSend(v11, "normalizedText");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "normalizedString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqualToString:", v27);

            if (v28)
            {
              if (objc_msgSend(v11, "matchType") == 2)
              {
                objc_msgSend(v18, "setMatchTypeForQuery:", 2);
                objc_msgSend(v42, "addObject:", v18);
                continue;
              }
              v23 = v18;
              v24 = 1;
              goto LABEL_30;
            }
          }
          else
          {

          }
          if (objc_msgSend(v11, "matchType") == 2)
            continue;
          v23 = v18;
          v24 = 0;
LABEL_30:
          objc_msgSend(v23, "setMatchTypeForQuery:", v24);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v15);
LABEL_33:

      if (objc_msgSend(v42, "count"))
      {
        -[NSObject addObject:](v38, "addObject:", v42);
      }
      else if (objc_msgSend(v11, "matchType") != 2)
      {
        objc_msgSend(a1, "removeSynonymsOfOtherGroupsInGroups:", v13);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v38, "addObject:", v29);

      }
      if (!objc_msgSend(v42, "count") && objc_msgSend(v11, "matchType") == 2)
      {

        v31 = (id)MEMORY[0x1E0C9AA60];
        v7 = v39;
        v6 = v40;
        v30 = v38;
        goto LABEL_44;
      }

      v10 = v41 + 1;
      v7 = v39;
      v6 = v40;
      if (v41 + 1 >= (unint64_t)objc_msgSend(v39, "count"))
      {
LABEL_40:
        v30 = v38;
        v31 = -[NSObject copy](v38, "copy");
        goto LABEL_44;
      }
    }
  }
  PLSearchBackendQueryGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Unexpectedly encountered arrayOfGroupsArrays and search tokens array with different counts, unable to filter arrayOfGroupsArrays for equal match type", buf, 2u);
  }
  v31 = (id)MEMORY[0x1E0C9AA60];
LABEL_44:

  return v31;
}

+ (id)removeSynonymsOfOtherGroupsInGroups:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v3;
    obj = v3;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v40;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(obj);
          v33 = v4;
          v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v6 = v31;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v36;
            v34 = v6;
LABEL_9:
            v10 = 0;
            while (1)
            {
              if (*(_QWORD *)v36 != v9)
                objc_enumerationMutation(v34);
              v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
              v12 = objc_msgSend(v5, "groupId");
              v13 = objc_msgSend(v11, "owningGroupId");
              v14 = objc_msgSend(v5, "owningGroupId");
              v15 = objc_msgSend(v11, "groupId");
              if (objc_msgSend(v5, "owningGroupId"))
              {
                v16 = objc_msgSend(v5, "owningGroupId");
                v17 = v16 == objc_msgSend(v11, "owningGroupId");
              }
              else
              {
                v17 = 0;
              }
              v18 = v12 == v13 || v14 == v15;
              if (v18 || v17)
                break;
              if (v8 == ++v10)
              {
                v6 = v34;
                v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v8)
                  goto LABEL_9;
                goto LABEL_22;
              }
            }
            v19 = v11;
            v6 = v34;

            if (!v19)
              goto LABEL_26;
            objc_msgSend(v5, "contentString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");

            objc_msgSend(v19, "contentString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "length");

            if (v23 > v21)
            {
              objc_msgSend(v34, "removeObject:", v19);
              goto LABEL_26;
            }
            v24 = v33;
          }
          else
          {
LABEL_22:

            v19 = 0;
LABEL_26:
            v24 = v33;
            objc_msgSend(v6, "addObject:", v5);
          }

          v4 = v24 + 1;
        }
        while (v4 != v32);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        v32 = v25;
      }
      while (v25);
    }

    v26 = (void *)objc_msgSend(v31, "copy");
    v3 = v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

+ (void)searchIndexIdsFromUUIDs:(id)a3 searchResultTypes:(unint64_t)a4 psiDatabase:(id)a5 completion:(id)a6
{
  char v8;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t, uint64_t, void *);
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t, uint64_t, void *))a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("psiDatabase"));

  }
  if (objc_msgSend(v11, "count"))
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__8519;
    v33 = __Block_byref_object_dispose__8520;
    v14 = (void *)MEMORY[0x1E0C9AA70];
    v34 = (id)MEMORY[0x1E0C9AA70];
    if ((v8 & 1) != 0)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke;
      v28[3] = &unk_1E36621F8;
      v28[4] = &v35;
      v28[5] = &v29;
      objc_msgSend(v12, "assetIdsFromUUIDs:completion:", v11, v28);
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__8519;
    v22 = __Block_byref_object_dispose__8520;
    v23 = v14;
    if ((v8 & 2) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke_2;
      v17[3] = &unk_1E36621F8;
      v17[4] = &v24;
      v17[5] = &v18;
      objc_msgSend(v12, "collectionIdsFromUUIDs:completion:", v11, v17);
      v15 = v25[3];
      v14 = (void *)v19[5];
    }
    else
    {
      v15 = 0;
    }
    v13[2](v13, v36[3], v15, v30[5], v14);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v13[2](v13, 0, 0, MEMORY[0x1E0C9AA70], (void *)MEMORY[0x1E0C9AA70]);
  }

}

+ (id)UUIDsFromSearchIndexIds:(__CFArray *)a3 searchIndexIdsToUUIDs:(id)a4 searchResultType:(unint64_t)a5 delegate:(id)a6
{
  char v7;
  id v11;
  id v12;
  id v13;
  __CFArray *v14;
  __CFArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 447, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  if ((~v7 & 3) != 0)
  {
    if (a3)
      goto LABEL_5;
LABEL_24:
    v22 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchUtilities.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(wantsAssetResults && wantsCollectionResults)"));

  if (!a3)
    goto LABEL_24;
LABEL_5:
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = a3;
  if (objc_msgSend(v11, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v14;
    v15 = v14;
    v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            objc_msgSend(v13, "addObject:", v21);

        }
        v17 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
    }

    v14 = v28;
    goto LABEL_16;
  }
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v12, "assetUUIDsForAssetIDs:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v12, "collectionUUIDsForCollectionIDs:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v24 = v23;
    objc_msgSend(v23, "allObjects");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
LABEL_16:
  v22 = v13;
LABEL_22:

LABEL_25:
  return v22;
}

+ (BOOL)groupDuplicateOrSynonymExistsForGroup:(id)a3 inGroups:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int IsSynonym;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !objc_msgSend(v6, "count"))
  {
    LOBYTE(v8) = 0;
    goto LABEL_25;
  }
  if ((objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    goto LABEL_25;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
    goto LABEL_24;
  v10 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v9);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      IsSynonym = PLSearchIndexCategoryIsSynonym((int)objc_msgSend(v5, "category", (_QWORD)v19));
      if (PLSearchIndexCategoryIsSynonym((int)objc_msgSend(v12, "category")))
      {
        v14 = objc_msgSend(v12, "owningGroupId");
        v15 = objc_msgSend(v5, "groupId");
        if (v14 == v15)
          v16 = 0;
        else
          v16 = IsSynonym;
        if ((v16 & 1) == 0)
        {
          if (v14 == v15)
            goto LABEL_23;
          continue;
        }
      }
      else if (!IsSynonym)
      {
        continue;
      }
      v17 = objc_msgSend(v5, "owningGroupId");
      if (v17 == objc_msgSend(v12, "groupId"))
      {
LABEL_23:
        LOBYTE(v8) = 1;
        goto LABEL_24;
      }
    }
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
      continue;
    break;
  }
LABEL_24:

LABEL_25:
  return v8;
}

+ (__CFArray)_sortCFArrayOfPSIIdentifiers:(__CFArray *)a3
{
  CFRange v5;

  if (!a3)
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v5.length = CFArrayGetCount(a3);
  v5.location = 0;
  CFArraySortValues(a3, v5, (CFComparatorFunction)PSIRowIDCompare, 0);
  return CFArrayCreateCopy(0, a3);
}

+ (id)generateFruitfulMatchedGroupsFromAllMatchedGroups:(id)a3 queryMatchedScopedAssetUUIDs:(id)a4 queryMatchedScopedCollectionUUIDs:(id)a5 searchResultTypes:(unint64_t)a6 delegate:(id)a7
{
  char v8;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  id obj;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v8 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v47 = a4;
  v46 = a5;
  v51 = a7;
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v16, "contentString");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_1E36789C0;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("content string"), v46);

        objc_msgSend(v16, "lookupIdentifier");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (const __CFString *)v21;
        else
          v23 = &stru_1E36789C0;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("lookup identifier"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v16, "category"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("category"));

        if ((v8 & 1) != 0)
        {
          objc_msgSend(a1, "_UUIDsForGroup:searchResultsType:delegate:", v16, 1, v51);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v47);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "intersectSet:", v27);

          v28 = objc_msgSend(v26, "count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("asset count"));

          objc_msgSend(v26, "allObjects");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30)
            v32 = v30;
          else
            v32 = MEMORY[0x1E0C9AA60];
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("asset UUIDs"));

        }
        if ((v8 & 2) != 0)
        {
          objc_msgSend(a1, "_UUIDsForGroup:searchResultsType:delegate:", v16, 2, v51);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v33, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v46);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "intersectSet:", v35);

          v36 = objc_msgSend(v34, "count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, CFSTR("collection count"));

          objc_msgSend(v34, "allObjects");
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          if (v38)
            v40 = v38;
          else
            v40 = MEMORY[0x1E0C9AA60];
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v40, CFSTR("collection UUIDs"));

        }
        objc_msgSend(v16, "contentString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "length"))
          objc_msgSend(v16, "contentString");
        else
          objc_msgSend(v16, "lookupIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v42;
        v57 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v43);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v13);
  }

  objc_msgSend(v50, "allObjects");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (id)groupDictionariesFromArrayOfGroupsArrays:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v5;
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v12, "contentString");
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              if (v14)
                v16 = (const __CFString *)v14;
              else
                v16 = &stru_1E36789C0;
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("content_string"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v12, "category"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("category"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "groupId"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("row_id"));

              objc_msgSend(v4, "addObject:", v13);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

        v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  objc_msgSend(v4, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_UUIDsForGroup:(id)a3 searchResultsType:(unint64_t)a4 delegate:(id)a5
{
  char v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = ~(_BYTE)a4;
  v8 = a3;
  v9 = a5;
  if ((v7 & 3) != 0)
  {
    if ((v6 & 1) != 0)
    {
      if (!objc_msgSend(v8, "assetIds") || CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "assetIds")))
      {
        objc_msgSend(v9, "assetUUIDsForAssetIDs:", objc_msgSend(v8, "assetIds"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if ((v6 & 2) == 0
           || !objc_msgSend(v8, "collectionIds")
           || CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "collectionIds")))
    {
      objc_msgSend(v9, "collectionUUIDsForCollectionIDs:", objc_msgSend(v8, "collectionIds"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v11 = (void *)v10;

  return v11;
}

void __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __82__PLScopedSearchUtilities_removeGroupsWithNonExactMatchTextFromGroups_searchText___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "normalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveCompare:", *(_QWORD *)(a1 + 32));

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

@end
