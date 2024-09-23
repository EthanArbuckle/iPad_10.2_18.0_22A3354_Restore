@implementation NSOrderedSet

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke(void **a1, void *a2)
{
  return WFIsDeleted(a2, a1[4], a1[5], a1[6]);
}

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_2(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

void __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (objc_msgSend(v17, "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)MEMORY[0x1C3BB3598]();
      if (v6 < objc_msgSend(v17, "count"))
      {
        v8 = v17;
        while (1)
        {
          v9 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v8, "objectAtIndex:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

          if (!(_DWORD)v9)
            break;
          v11 = ++v6 >= objc_msgSend(v17, "count");
          v8 = v17;
          if (v11)
            goto LABEL_10;
        }
      }
      v8 = v17;
LABEL_10:
      if (v6 == objc_msgSend(v8, "count"))
        break;
      objc_msgSend(v17, "objectAtIndex:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6 + 1;
      do
      {
        v6 = v13;
        if (v13 >= objc_msgSend(v17, "count"))
          break;
        v14 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v17, "objectAtIndex:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        v13 = v6 + 1;
      }
      while ((v14 & 1) != 0);
      if (v6 == objc_msgSend(v17, "count"))
      {
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(_QWORD *)(a1 + 32), v12);

        break;
      }
      objc_msgSend(v17, "objectAtIndex:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (WFOrderedSetContainsPath(*(void **)(a1 + 40), v12, v16, *(void **)(a1 + 56))
        && !WFOrderedSetContainsPath(v5, v12, v16, *(void **)(a1 + 56)))
      {
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(_QWORD *)(a1 + 32), v12);
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(_QWORD *)(a1 + 32), v16);
      }
      else
      {
        -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:](*(_QWORD *)(a1 + 32), v12, v16);
      }

      objc_autoreleasePoolPop(v7);
      if (v6 >= objc_msgSend(v17, "count"))
        goto LABEL_23;
    }
    objc_autoreleasePoolPop(v7);
  }
LABEL_23:

}

void __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD, void *, void *);
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t (**v44)(_QWORD, void *, void *);
  id v45;
  id obj;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[2];
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v51 = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_5;
  v52 = &unk_1E7AF4030;
  v6 = *(void **)(a1 + 56);
  v53 = *(id *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v49 = v5;
  v9 = v6;
  v10 = v50;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("componentVertexes"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstOrderedSet"));

LABEL_3:
  if (v49)
  {
    if (v9)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondOrderedSet"));

    if (v9)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparator"));

LABEL_5:
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51((uint64_t)v10, (uint64_t)v11);
  }
  else
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v13)
    {
      v14 = v13;
      v45 = v7;
      obj = v12;
      v44 = v9;
      v47 = 0;
      v48 = 0;
      v15 = *(_QWORD *)v55;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v15)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1C3BB3598]();
          v21 = objc_msgSend(v8, "indexOfObject:", v19);
          if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 < v16)
          {
            v23 = v21;
            v24 = v19;

            v48 = v24;
            v16 = v23;
          }
          v25 = objc_msgSend(v49, "indexOfObject:", v19);
          if (v25 != 0x7FFFFFFFFFFFFFFFLL && v25 < v17)
          {
            v27 = v25;
            v28 = v19;

            v47 = v28;
            v17 = v27;
          }
          objc_autoreleasePoolPop(v20);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v14);
      v12 = obj;

      if (v48 && v47)
      {
        v9 = v44;
        if (v44[2](v44, v48, v47) == -1)
          v29 = v48;
        else
          v29 = v47;
        v7 = v45;
      }
      else
      {
        if (v48)
          v29 = v48;
        else
          v29 = v47;
        v9 = v44;
        v7 = v45;
      }
    }
    else
    {

      v29 = 0;
      v47 = 0;
      v48 = 0;
    }
    v30 = v29;
    v31 = objc_msgSend(v12, "indexOfObject:", v30);
    v32 = v31;
    do
    {
      v33 = (void *)MEMORY[0x1C3BB3598]();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v32);
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51((uint64_t)v10, (uint64_t)v35);

      v12 = v34;
      if (v32 + 1 == objc_msgSend(v34, "count"))
        v32 = 0;
      else
        ++v32;
      objc_autoreleasePoolPop(v33);
    }
    while (v32 != v31);

    v11 = v48;
  }

}

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
