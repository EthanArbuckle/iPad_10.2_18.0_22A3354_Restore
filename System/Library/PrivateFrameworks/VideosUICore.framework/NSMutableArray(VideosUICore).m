@implementation NSMutableArray(VideosUICore)

- (void)vui_addObjectIfNotNil:()VideosUICore
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "addObject:", v4);
    v4 = v5;
  }

}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:
{
  return objc_msgSend(a1, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", a3, a4, 0);
}

- (uint64_t)vui_applyChangeSetIfAvailable:()VideosUICore destinationObjects:replaceContentsOnNilChanges:
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_msgSend(a1, "vui_applyChangeSet:destinationObjects:updateObjectBlock:", v8, v9, 0);
  }
  else if (a5)
  {
    objc_msgSend(a1, "removeAllObjects");
    objc_msgSend(a1, "addObjectsFromArray:", v9);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:updateObjectBlock:
{
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjects_updateObjectBlock___block_invoke;
  v12[3] = &unk_1E9F2BD30;
  v13 = v8;
  v9 = v8;
  v10 = objc_msgSend(a1, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, v12, a5);

  return v10;
}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:
{
  return objc_msgSend(a1, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, a4, 0);
}

- (BOOL)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void (**v55)(id, void *);
  void *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v53 = a5;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceIndexes");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v8, "addIndexes:", v10);
  v51 = v10;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = v7;
  objc_msgSend(v7, "moveChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  v14 = v8;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v64 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v18, "sourceIndexes", v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "firstIndex");

        objc_msgSend(a1, "objectAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "destinationIndexes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "firstIndex");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v21, v24);

        v8 = v14;
        objc_msgSend(v14, "addIndex:", v20);

      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v15);
  }
  v25 = objc_msgSend(v8, "count", v51);
  v26 = v25 != 0;
  if (v25)
  {
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __93__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjectsBlock_updateObjectBlock___block_invoke;
    v62[3] = &unk_1E9F2CA58;
    v62[4] = a1;
    objc_msgSend(v8, "indexesPassingTest:", v62);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectsAtIndexes:", v27);

  }
  objc_msgSend(v54, "insertChange");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "destinationIndexes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v31 = v29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v56 = v31;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v33 = v12;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v59 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "destinationIndexes");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "firstIndex");

        objc_msgSend(v32, "addIndex:", v39);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v35);
  }

  if (!objc_msgSend(v32, "count") && !objc_msgSend(v56, "count"))
  {
    v44 = v54;
    goto LABEL_43;
  }
  v40 = objc_msgSend(v56, "firstIndex");
  v41 = objc_msgSend(v32, "firstIndex");
  v42 = v41 != 0x7FFFFFFFFFFFFFFFLL;
  v43 = v40 != 0x7FFFFFFFFFFFFFFFLL;
  v44 = v54;
  if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_27;
  do
  {
    do
    {
      if (v43 && (v42 & 1) != 0)
      {
        if (v40 <= v41)
          goto LABEL_31;
      }
      else if ((v43 & ~v42 & 1) != 0)
      {
LABEL_31:
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2](v55, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47 && v40 <= objc_msgSend(a1, "count"))
          objc_msgSend(a1, "insertObject:atIndex:", v47, v40);
        v40 = objc_msgSend(v56, "indexGreaterThanIndex:", v40);

        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v48);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46 && v41 <= objc_msgSend(a1, "count"))
        objc_msgSend(a1, "insertObject:atIndex:", v46, v41);
      v41 = objc_msgSend(v32, "indexGreaterThanIndex:", v41);
LABEL_40:

      v42 = v41 != 0x7FFFFFFFFFFFFFFFLL;
      v43 = v40 != 0x7FFFFFFFFFFFFFFFLL;
    }
    while (v40 != 0x7FFFFFFFFFFFFFFFLL);
LABEL_27:
    ;
  }
  while (v41 != 0x7FFFFFFFFFFFFFFFLL);
  v26 = 1;
LABEL_43:
  objc_msgSend(v44, "updateChanges");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(a1, "_vui_applyUpdateChanges:destinationObjectsBlock:updateObjectBlock:", v49, v55, v53);
    v26 = 1;
  }

  return v26;
}

- (void)vui_addObjectsFromArrayIfNotNil:()VideosUICore
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "addObjectsFromArray:", v4);
    v4 = v5;
  }

}

- (void)_vui_applyUpdateChanges:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  id v8;
  void (**v9)(id, void *, void *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (**v23)(id, void *);
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v9 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "sourceIndexes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "destinationIndexes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "firstIndex");
        objc_msgSend(a1, "objectAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v14, "updateChangeSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v19, v18, v17);
        }
        else
        {
          v23[2](v23, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = v11;
          v21 = v12;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v17, v22);

          v12 = v21;
          v11 = v20;
          v9 = 0;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

@end
