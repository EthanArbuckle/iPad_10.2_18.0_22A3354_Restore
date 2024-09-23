@implementation _UITableViewPrefetchContext

- (void)updateVisibleIndexRange:(unint64_t)a3 withContentOffset:(double)a4
{
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  unsigned int v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
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
  id v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  void *v50;
  char *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  int v66;
  uint64_t v67;
  id v68;
  _QWORD v69[5];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t buf[8];
  uint64_t v77;
  void (*v78)(_QWORD *, unint64_t);
  void *v79;
  uint64_t *v80;
  id v81;
  unint64_t v82;
  unint64_t v83;

  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 8) || a3 == 0)
    return;
  v8 = a2 + a3;
  if (a2 + a3 - 1 <= *(_QWORD *)(a1 + 56))
  {
    v12 = objc_msgSend((id)a1, "_effectiveRefreshDirectionForProposedVisibleIndexRange:withContentOffset:", a2, a3);
    *(_QWORD *)(a1 + 96) = a2;
    *(_QWORD *)(a1 + 104) = a3;
    *(double *)(a1 + 64) = a4;
    objc_msgSend(*(id *)(a1 + 48), "removeIndexesInRange:", a2, a3);
    if (v12 == 3)
      return;
    v13 = *(id *)(a1 + 24);
    if (v13)
    {

    }
    else if (!*(_QWORD *)(a1 + 16))
    {
      v68 = 0;
      goto LABEL_64;
    }
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__192;
    v74 = __Block_byref_object_dispose__192;
    v75 = 0;
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v14 = (void *)objc_msgSend((id)a1, "_offsetAndValidateRange:firstIndexOffset:lastIndexOffset:", a2, a3, -*(_QWORD *)(a1 + 88));
      v16 = v15;
      v17 = objc_msgSend(*(id *)(a1 + 48), "firstIndex");
      v18 = objc_msgSend(*(id *)(a1 + 48), "lastIndex");
      v19 = objc_msgSend(*(id *)(a1 + 48), "firstIndex");
      if ((unint64_t)v14 > v17 || (unint64_t)v14 + v16 < v17 + v18 - v19 + 1)
      {
        v20 = *(void **)(a1 + 48);
        v21 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v77 = 3221225472;
        v78 = __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke;
        v79 = &unk_1E16E43B8;
        v81 = v14;
        v82 = v16;
        v80 = &v70;
        objc_msgSend(v20, "enumerateIndexesUsingBlock:", buf);
        v22 = (void *)v71[5];
        v69[0] = v21;
        v69[1] = 3221225472;
        v69[2] = __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke_2;
        v69[3] = &unk_1E16E43E0;
        v69[4] = a1;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v69);
      }
    }
    v68 = (id)v71[5];
    _Block_object_dispose(&v70, 8);

    v23 = *(_QWORD *)(a1 + 80) + 1;
    if ((v12 | 2) == 2)
    {
      v24 = objc_msgSend((id)a1, "_validatedRangeWithLocation:length:", a2 - v23, *(_QWORD *)(a1 + 80) + 1);
      v26 = v25;
    }
    else
    {
      v24 = 0;
      v26 = 0;
    }
    if (v12 > 1)
    {
      v27 = 0;
      v29 = 0;
    }
    else
    {
      v27 = objc_msgSend((id)a1, "_validatedRangeWithLocation:length:", v8, v23);
      v29 = v28;
    }
    if (v12 == 2)
    {
      v27 = v24;
      v29 = v26;
    }
    else if (v12 != 1)
    {
      if (v12)
        goto LABEL_64;
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", v24, v26) <= *(_QWORD *)(a1 + 80))
      {
LABEL_38:
        v32 = objc_msgSend((id)a1, "_offsetAndValidateRange:firstIndexOffset:lastIndexOffset:", a2, a3, -*(_QWORD *)(a1 + 72));
        v34 = v33;
        if (v33)
        {
          v65 = v8;
          v67 = v32;
          v64 = v33;
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v32, v33);
          objc_msgSend(v35, "removeIndexesInRange:", a2, a3);
          v36 = ((unint64_t)objc_msgSend(v35, "count") >> 1) + 1;
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          v77 = 3221225472;
          v78 = __101___UITableViewPrefetchContext_computeIndexesToRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke;
          v79 = &unk_1E16B87E0;
          v82 = a2;
          v83 = a3;
          v39 = v37;
          v80 = v39;
          v40 = v38;
          v81 = v40;
          objc_msgSend(v35, "enumerateIndexesUsingBlock:", buf);
          v63 = v35;
          v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
          v62 = v39;
          objc_msgSend(v39, "objectEnumerator");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v40;
          objc_msgSend(v40, "objectEnumerator");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = (void *)v43;
            objc_msgSend(v42, "nextObject");
            v43 = objc_claimAutoreleasedReturnValue();

            if (v43)
              objc_msgSend(v34, "addObject:", v43);
            objc_msgSend(v41, "nextObject");
            v46 = objc_claimAutoreleasedReturnValue();

            if (v46)
              objc_msgSend(v34, "addObject:", v46);
            v44 = (void *)v46;
          }
          while (v43 | v46);

          v8 = v65;
          v47 = v67;
LABEL_63:
          v50 = v64;
          goto LABEL_66;
        }
LABEL_67:
        v55 = _isNotifyingIdleObservers;
        if (objc_msgSend(v68, "count"))
        {
          v56 = *(_QWORD *)(a1 + 24);
          if (v56)
            (*(void (**)(uint64_t, id))(v56 + 16))(v56, v68);
        }
        if (objc_msgSend(v34, "count"))
        {
          v57 = *(_QWORD *)(a1 + 16);
          if (v57)
          {
            if ((v55 & 1) == 0)
            {
              if ((dyld_program_sdk_at_least() & 1) != 0)
              {
                -[_UITableViewPrefetchContext schedulePrefetchRequestAfterNextCACommit:](a1, v34);
LABEL_84:

                return;
              }
              v57 = *(_QWORD *)(a1 + 16);
            }
            (*(void (**)(uint64_t, id))(v57 + 16))(v57, v34);
          }
        }
        if (v55 && *(_QWORD *)(a1 + 32))
        {
          v58 = v12 == 2 ? a2 - 1 : v8;
          objc_msgSend((id)a1, "_validatedRangeWithLocation:length:", v58, 1);
          if (v59 == 1)
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        goto LABEL_84;
      }
    }
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", v27, v29) <= *(_QWORD *)(a1 + 80))
    {
      if (!v12)
        goto LABEL_38;
      if (v12 == 1)
      {
        v66 = 0;
        v30 = *(_QWORD *)(a1 + 72);
        v31 = a3;
      }
      else
      {
        v30 = 0;
        v31 = -*(_QWORD *)(a1 + 72);
        v66 = 1;
      }
      v48 = objc_msgSend((id)a1, "_offsetAndValidateRange:firstIndexOffset:lastIndexOffset:", a2, a3, v31, v30);
      if (v49)
      {
        v47 = v48;
        v50 = v49;
        if (v48 >= (unint64_t)&v49[v48])
        {
          v34 = 0;
LABEL_66:
          objc_msgSend(*(id *)(a1 + 48), "addIndexesInRange:", v47, v50);
          objc_msgSend(*(id *)(a1 + 48), "removeIndexesInRange:", a2, a3);
          goto LABEL_67;
        }
        v64 = v49;
        v34 = 0;
        v51 = v49;
        v52 = v48;
        v53 = v48;
        while (1)
        {
          if (a2 <= v53 && v53 - a2 < a3 || (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v53, v50) & 1) != 0)
            goto LABEL_61;
          if (!v34)
            v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v66)
            break;
          if (v12 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v54);
            goto LABEL_60;
          }
LABEL_61:
          ++v53;
          if (!--v51)
          {
            v47 = v52;
            goto LABEL_63;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "insertObject:atIndex:", v54, 0);
LABEL_60:

        goto LABEL_61;
      }
    }
LABEL_64:
    v34 = 0;
    goto LABEL_67;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v60, OS_LOG_TYPE_FAULT, "UIKit internal bug: table view prefetch context updated with an out-of-bounds visible range; the _maxIndex is probably stale",
        buf,
        2u);
    }

  }
  else
  {
    v9 = updateVisibleIndexRange_withContentOffset____s_category;
    if (!updateVisibleIndexRange_withContentOffset____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&updateVisibleIndexRange_withContentOffset____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "UIKit internal bug: table view prefetch context updated with an out-of-bounds visible range; the _maxIndex is probably stale",
        buf,
        2u);
    }
  }
}

- (uint64_t)cancelWithNewMaxIndex:(uint64_t)result
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (result)
  {
    v3 = result;
    *(_BYTE *)(result + 8) = 0;
    v4 = *(id *)(result + 24);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(*(id *)(v3 + 48), "count");

      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(v3 + 48), "count"));
        v8 = *(void **)(v3 + 48);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __53___UITableViewPrefetchContext_cancelWithNewMaxIndex___block_invoke;
        v10[3] = &unk_1E16B2100;
        v11 = v7;
        v9 = v7;
        objc_msgSend(v8, "enumerateIndexesUsingBlock:", v10);
        (*(void (**)(void))(*(_QWORD *)(v3 + 24) + 16))();

      }
    }
    result = objc_msgSend(*(id *)(v3 + 48), "removeAllIndexes");
    *(_QWORD *)(v3 + 96) = 0;
    *(_QWORD *)(v3 + 104) = 0;
    *(_QWORD *)(v3 + 56) = a2;
    *(_QWORD *)(v3 + 64) = 0x7FEFFFFFFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)pruneCellsForVisibleIndexRange:(uint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      if (a2 <= 1)
        v4 = 1;
      else
        v4 = a2;
      v5 = *(_QWORD *)(v3 + 56);
      if (v5 >= a2 + a3)
        v5 = a2 + a3;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v4 - 1, v5 - v4 + 2);
    }
  }
  return result;
}

- (_QWORD)initWithMaxIndex:(uint64_t)a3 prefetchItemCount:(uint64_t)a4 refreshPrefetchThresholdCount:(uint64_t)a5 cancelThresholdCount:
{
  _QWORD *v9;
  id v10;
  void *v11;
  BOOL v12;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  if (!a1)
    return 0;
  v20.receiver = a1;
  v20.super_class = (Class)_UITableViewPrefetchContext;
  v9 = objc_msgSendSuper2(&v20, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = (void *)v9[6];
    v9[6] = v10;

    v9[7] = a2;
    if (a3)
      v12 = a4 == 0;
    else
      v12 = 1;
    v14 = v12 || a3 < a4;
    v15 = v14 == 0;
    v16 = 20;
    if (v15)
      v16 = a3;
    v17 = 10;
    if (v15)
      v17 = a4;
    v9[9] = v16;
    v9[10] = v17;
    if (!a5 || v16 > a5)
    {
      if (a3 >= 0)
        v18 = a3;
      else
        v18 = a3 + 1;
      a5 = v16 + (v18 >> 1);
    }
    v9[12] = 0;
    v9[13] = 0;
    v9[11] = a5;
    v9[8] = 0x7FEFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong(&self->_cellPruningHandler, 0);
  objc_storeStrong(&self->_cellHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
}

- (void)schedulePrefetchRequestAfterNextCACommit:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  *(_BYTE *)(a1 + 8) = 1;
  v4 = (void *)UIApp;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72___UITableViewPrefetchContext_schedulePrefetchRequestAfterNextCACommit___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = a1;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", v6);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v5, self, self->_outstandingRequests);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)_effectiveRefreshDirectionForProposedVisibleIndexRange:(_NSRange)a3 withContentOffset:(double)a4
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger maxIndex;
  NSUInteger v8;
  BOOL v9;
  BOOL v10;
  char v11;
  double lastContentOffset;

  location = self->_lastVisibleIndexRange.location;
  length = self->_lastVisibleIndexRange.length;
  if (location != a3.location || length != a3.length)
  {
    if (!a3.location)
      return 1;
    maxIndex = self->_maxIndex;
    v9 = maxIndex >= a3.location;
    v8 = maxIndex - a3.location;
    v9 = !v9 || v8 >= a3.length;
    if (!v9)
      return 2;
    if (length)
      v10 = 1;
    else
      v10 = a3.length == 0;
    v11 = !v10;
    if (v10 && a3.length)
    {
      if (length)
      {
        if (location != a3.location)
        {
          if (a3.location > location)
            return 1;
          else
            return 2;
        }
        if (a3.length > length)
          return 1;
      }
    }
    else if ((v11 & 1) != 0)
    {
      return 0;
    }
  }
  lastContentOffset = self->_lastContentOffset;
  if (lastContentOffset == 1.79769313e308 || vabdd_f64(a4, lastContentOffset) <= 0.01)
    return 3;
  if (lastContentOffset < a4)
    return 1;
  return 2;
}

- (_NSRange)_offsetAndValidateRange:(_NSRange)a3 firstIndexOffset:(int64_t)a4 lastIndexOffset:(int64_t)a5
{
  int64_t maxIndex;
  int64_t v6;
  BOOL v7;
  int64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  maxIndex = a3.length + a3.location + a5 - 1;
  v6 = (a3.location + a4) & ~((int64_t)(a3.location + a4) >> 63);
  if (maxIndex >= self->_maxIndex)
    maxIndex = self->_maxIndex;
  v7 = maxIndex < v6;
  v8 = maxIndex - v6;
  if (v7)
    v9 = 0;
  else
    v9 = v8 + 1;
  if (v7)
    v10 = 0;
  else
    v10 = (a3.location + a4) & ~((int64_t)(a3.location + a4) >> 63);
  result.length = v9;
  result.location = v10;
  return result;
}

- (_NSRange)_validatedRangeWithLocation:(int64_t)a3 length:(int64_t)a4
{
  NSUInteger v5;
  NSUInteger v6;
  int64_t v7;
  int64_t maxIndex;
  _NSRange result;

  v5 = 0;
  v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && a4 >= 1)
  {
    v7 = a3 + a4 - 1;
    maxIndex = self->_maxIndex;
    if (v7 <= maxIndex)
      v5 = a3;
    else
      v5 = 0;
    if (v7 <= maxIndex)
      v6 = a4;
    else
      v6 = 0;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)computedPrefetchIndexSet
{
  return self->_outstandingRequests;
}

@end
