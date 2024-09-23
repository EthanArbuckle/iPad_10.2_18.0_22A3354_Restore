@implementation PXPlacesMapInPlaceLayoutDiffer

- (void)_computeChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  id obj;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[PXPlacesMapLayoutDiffer targetLayoutResult](self, "targetLayoutResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PXPlacesMapLayoutDiffer sourceLayoutResult](self, "sourceLayoutResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[PXPlacesMapLayoutDiffer sourceLayoutResult](self, "sourceLayoutResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v16, "coordinate");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v16, v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v13);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[PXPlacesMapLayoutDiffer targetLayoutResult](self, "targetLayoutResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v21;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v26, "coordinate");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          -[PXPlacesMapLayoutDiffer _relateSourceLayoutItem:withTargetLayoutItem:](self, "_relateSourceLayoutItem:withTargetLayoutItem:", v30, v26);
          objc_msgSend(v42, "removeObject:", v26);
          objc_msgSend(v43, "removeObject:", v30);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v23);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v31 = v42;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(v31);
        -[PXPlacesMapLayoutDiffer _addTargetLayoutItem:](self, "_addTargetLayoutItem:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v33);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v36 = v43;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v36);
        -[PXPlacesMapLayoutDiffer _removeSourceLayoutItem:](self, "_removeSourceLayoutItem:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v38);
  }

}

@end
