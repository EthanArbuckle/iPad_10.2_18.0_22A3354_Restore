@implementation UIDragStatisticsLogTextDelegateItems

void ___UIDragStatisticsLogTextDelegateItems_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  v4 = v3;
  if (v2 != v3 && v2 != 0 && v3 != 0)
  {
    v7 = objc_msgSend(v2, "count");
    if (v7 == objc_msgSend(v4, "count"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 256, objc_msgSend(v4, "count"));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v4;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v11);
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = v2;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v14);
            if (!objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18), (_QWORD)v19))
            {

              goto LABEL_26;
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v16)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_26:
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("itemsModifiedByTextDelegate"));
    }
  }

}

@end
