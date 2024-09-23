@implementation PGHighlightItemRestorer

+ (id)restoreExistingHighlightItemListsFromBackingHighlightItems:(id)a3 usingModelReader:(id)a4 progressBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  PGHighlightItemList *v22;
  double Current;
  id v24;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 1.0 / (double)v10;
    v16 = *(_QWORD *)v28;
    v17 = 0.0;
    v18 = 0.0;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v17 = v15 + v17;
        objc_msgSend(v8, "fetchChildHighlightItemsForHighlightItem:sharingFilter:", v20, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PGHighlightItemList initWithParentHighlightItem:childHighlightItems:]([PGHighlightItemList alloc], "initWithParentHighlightItem:childHighlightItems:", v20, v21);
        objc_msgSend(v11, "addObject:", v22);
        if (v9)
        {
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v18 >= 0.01)
          {
            v26 = 0;
            v9[2](v9, &v26, v17);
            if (v26)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v32 = 35;
                v33 = 2080;
                v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemRestorer.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              v24 = (id)MEMORY[0x1E0C9AA60];
              goto LABEL_16;
            }
            v18 = Current;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v14)
        continue;
      break;
    }
  }

  v24 = v11;
LABEL_16:

  return v24;
}

@end
