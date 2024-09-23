@implementation ATXPBHomeScreenCachedSuggestion

- (void)addFallbackSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setUuidString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setFallbackSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setCachedTopOfStackLayouts:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setCachedTopOfStackLayoutKeys:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setCachedSuggestionWidgetLayouts:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setCachedSuggestionWidgetIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setCachedSuggestedWidgetLayoutLists:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setCachedAppPredictionPanelLayouts:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setCachedAppPredictionPanelIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (uint64_t)cachedTopOfStackLayoutKeys
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)cachedSuggestionWidgetIds
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)cachedSuggestedWidgetLayoutListKeys
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)cachedAppPredictionPanelIds
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)uuidString
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)fallbackSuggestions
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)cachedTopOfStackLayouts
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)cachedSuggestionWidgetLayouts
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)cachedSuggestedWidgetLayoutLists
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)cachedAppPredictionPanelLayouts
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_fallbackSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayouts, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayoutKeys, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetIds, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetLayoutLists, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetLayoutListKeys, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelIds, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuidString)
    PBDataWriterWriteStringField();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v5 = self->_cachedSuggestionWidgetIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v83;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v83 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    }
    while (v7);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = self->_cachedSuggestionWidgetLayouts;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
    }
    while (v12);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v15 = self->_cachedTopOfStackLayoutKeys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v75;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    }
    while (v17);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v20 = self->_cachedTopOfStackLayouts;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v71;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    }
    while (v22);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v25 = self->_fallbackSuggestions;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v67;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
    }
    while (v27);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v30 = self->_cachedAppPredictionPanelIds;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v63;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
    }
    while (v32);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v35 = self->_cachedAppPredictionPanelLayouts;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
    }
    while (v37);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = self->_cachedSuggestedWidgetLayoutListKeys;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v55;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v55 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteStringField();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
    }
    while (v42);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = self->_cachedSuggestedWidgetLayoutLists;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v51;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v51 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
    }
    while (v47);
  }

}

- (BOOL)hasUuidString
{
  if (result)
    return *(_QWORD *)(result + 80) != 0;
  return result;
}

- (uint64_t)clearCachedSuggestionWidgetIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 40), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestionWidgetIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedSuggestionWidgetIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 40), "count");
  return result;
}

- (id)cachedSuggestionWidgetIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[5], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)cachedSuggestionWidgetIdsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)clearCachedSuggestionWidgetLayouts
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestionWidgetLayouts:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedSuggestionWidgetLayoutsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "count");
  return result;
}

- (id)cachedSuggestionWidgetLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[6], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)cachedSuggestionWidgetLayoutsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)clearCachedTopOfStackLayoutKeys
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "removeAllObjects");
  return result;
}

- (void)addCachedTopOfStackLayoutKeys:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedTopOfStackLayoutKeysCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "count");
  return result;
}

- (id)cachedTopOfStackLayoutKeysAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedTopOfStackLayouts
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "removeAllObjects");
  return result;
}

- (void)addCachedTopOfStackLayouts:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedTopOfStackLayoutsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "count");
  return result;
}

- (id)cachedTopOfStackLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[8], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearFallbackSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "removeAllObjects");
  return result;
}

- (uint64_t)fallbackSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "count");
  return result;
}

- (id)fallbackSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[9], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedAppPredictionPanelIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "removeAllObjects");
  return result;
}

- (void)addCachedAppPredictionPanelIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedAppPredictionPanelIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "count");
  return result;
}

- (id)cachedAppPredictionPanelIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedAppPredictionPanelLayouts
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeAllObjects");
  return result;
}

- (void)addCachedAppPredictionPanelLayouts:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedAppPredictionPanelLayoutsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "count");
  return result;
}

- (id)cachedAppPredictionPanelLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedSuggestedWidgetLayoutListKeys
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedSuggestedWidgetLayoutListKeysCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

- (id)cachedSuggestedWidgetLayoutListKeysAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedSuggestedWidgetLayoutLists
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestedWidgetLayoutLists:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedSuggestedWidgetLayoutListsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)cachedSuggestedWidgetLayoutListsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)cachedSuggestedWidgetLayoutListsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHomeScreenCachedSuggestion;
  -[ATXPBHomeScreenCachedSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  NSMutableArray *cachedSuggestionWidgetIds;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *cachedTopOfStackLayoutKeys;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSMutableArray *cachedAppPredictionPanelIds;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  NSMutableArray *cachedSuggestedWidgetLayoutListKeys;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  cachedSuggestionWidgetIds = self->_cachedSuggestionWidgetIds;
  if (cachedSuggestionWidgetIds)
    objc_msgSend(v4, "setObject:forKey:", cachedSuggestionWidgetIds, CFSTR("cachedSuggestionWidgetIds"));
  if (-[NSMutableArray count](self->_cachedSuggestionWidgetLayouts, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cachedSuggestionWidgetLayouts, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v8 = self->_cachedSuggestionWidgetLayouts;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v63 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cachedSuggestionWidgetLayouts"));
  }
  cachedTopOfStackLayoutKeys = self->_cachedTopOfStackLayoutKeys;
  if (cachedTopOfStackLayoutKeys)
    objc_msgSend(v4, "setObject:forKey:", cachedTopOfStackLayoutKeys, CFSTR("cachedTopOfStackLayoutKeys"));
  if (-[NSMutableArray count](self->_cachedTopOfStackLayouts, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cachedTopOfStackLayouts, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v16 = self->_cachedTopOfStackLayouts;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v59 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("cachedTopOfStackLayouts"));
  }
  if (-[NSMutableArray count](self->_fallbackSuggestions, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fallbackSuggestions, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v23 = self->_fallbackSuggestions;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("fallbackSuggestions"));
  }
  cachedAppPredictionPanelIds = self->_cachedAppPredictionPanelIds;
  if (cachedAppPredictionPanelIds)
    objc_msgSend(v4, "setObject:forKey:", cachedAppPredictionPanelIds, CFSTR("cachedAppPredictionPanelIds"));
  if (-[NSMutableArray count](self->_cachedAppPredictionPanelLayouts, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cachedAppPredictionPanelLayouts, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v31 = self->_cachedAppPredictionPanelLayouts;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v51 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      }
      while (v33);
    }

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("cachedAppPredictionPanelLayouts"));
  }
  cachedSuggestedWidgetLayoutListKeys = self->_cachedSuggestedWidgetLayoutListKeys;
  if (cachedSuggestedWidgetLayoutListKeys)
    objc_msgSend(v4, "setObject:forKey:", cachedSuggestedWidgetLayoutListKeys, CFSTR("cachedSuggestedWidgetLayoutListKeys"));
  if (-[NSMutableArray count](self->_cachedSuggestedWidgetLayoutLists, "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cachedSuggestedWidgetLayoutLists, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = self->_cachedSuggestedWidgetLayoutLists;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v47;
      do
      {
        for (n = 0; n != v41; ++n)
        {
          if (*(_QWORD *)v47 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v46);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
      }
      while (v41);
    }

    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("cachedSuggestedWidgetLayoutLists"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenCachedSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t n;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ii;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t jj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t kk;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t mm;
  void *v39;
  id *v40;

  v40 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 80);
    if (v3)
      -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v40, v3);
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      if (v40)
        objc_msgSend(v40[5], "removeAllObjects");
      v4 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v4)
      {
        v5 = v4;
        for (i = 0; i != v5; ++i)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIdsAtIndex:]((id *)a1, i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:]((uint64_t)v40, v7);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      if (v40)
        objc_msgSend(v40[6], "removeAllObjects");
      v8 = objc_msgSend(*(id *)(a1 + 48), "count");
      if (v8)
      {
        v9 = v8;
        for (j = 0; j != v9; ++j)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayoutsAtIndex:]((id *)a1, j);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:]((uint64_t)v40, v11);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      if (v40)
        objc_msgSend(v40[7], "removeAllObjects");
      v12 = objc_msgSend(*(id *)(a1 + 56), "count");
      if (v12)
      {
        v13 = v12;
        for (k = 0; k != v13; ++k)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeysAtIndex:]((id *)a1, k);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:]((uint64_t)v40, v15);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      if (v40)
        objc_msgSend(v40[8], "removeAllObjects");
      v16 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v16)
      {
        v17 = v16;
        for (m = 0; m != v17; ++m)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutsAtIndex:]((id *)a1, m);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:]((uint64_t)v40, v19);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      if (v40)
        objc_msgSend(v40[9], "removeAllObjects");
      v20 = objc_msgSend(*(id *)(a1 + 72), "count");
      if (v20)
      {
        v21 = v20;
        for (n = 0; n != v21; ++n)
        {
          -[ATXPBHomeScreenCachedSuggestion fallbackSuggestionsAtIndex:]((id *)a1, n);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:]((uint64_t)v40, v23);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      if (v40)
        objc_msgSend(v40[1], "removeAllObjects");
      v24 = objc_msgSend(*(id *)(a1 + 8), "count");
      if (v24)
      {
        v25 = v24;
        for (ii = 0; ii != v25; ++ii)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIdsAtIndex:]((id *)a1, ii);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:]((uint64_t)v40, v27);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      if (v40)
        objc_msgSend(v40[2], "removeAllObjects");
      v28 = objc_msgSend(*(id *)(a1 + 16), "count");
      if (v28)
      {
        v29 = v28;
        for (jj = 0; jj != v29; ++jj)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayoutsAtIndex:]((id *)a1, jj);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:]((uint64_t)v40, v31);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      if (v40)
        objc_msgSend(v40[3], "removeAllObjects");
      v32 = objc_msgSend(*(id *)(a1 + 24), "count");
      if (v32)
      {
        v33 = v32;
        for (kk = 0; kk != v33; ++kk)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeysAtIndex:]((id *)a1, kk);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v40, v35);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (v40)
        objc_msgSend(v40[4], "removeAllObjects");
      v36 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v36)
      {
        v37 = v36;
        for (mm = 0; mm != v37; ++mm)
        {
          -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListsAtIndex:]((id *)a1, mm);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:]((uint64_t)v40, v39);

        }
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = (void *)v5[10];
  v5[10] = v6;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v8 = self->_cachedSuggestionWidgetIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v96;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v96 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v12), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:]((uint64_t)v5, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    }
    while (v10);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v14 = self->_cachedSuggestionWidgetLayouts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v92;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v92 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v18), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:]((uint64_t)v5, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    }
    while (v16);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v20 = self->_cachedTopOfStackLayoutKeys;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v88;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v88 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v24), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:]((uint64_t)v5, v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
    }
    while (v22);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v26 = self->_cachedTopOfStackLayouts;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v84;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v84 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v30), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:]((uint64_t)v5, v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
    }
    while (v28);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v32 = self->_fallbackSuggestions;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v80;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v80 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v36), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:]((uint64_t)v5, v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
    }
    while (v34);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v38 = self->_cachedAppPredictionPanelIds;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v102, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v76;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v76 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v42), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:]((uint64_t)v5, v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v102, 16);
    }
    while (v40);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v44 = self->_cachedAppPredictionPanelLayouts;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v71, v101, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v72;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v72 != v47)
          objc_enumerationMutation(v44);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v48), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:]((uint64_t)v5, v49);

        ++v48;
      }
      while (v46 != v48);
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v71, v101, 16);
    }
    while (v46);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v50 = self->_cachedSuggestedWidgetLayoutListKeys;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v67, v100, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v68;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v68 != v53)
          objc_enumerationMutation(v50);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v54), "copyWithZone:", a3);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v5, v55);

        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v67, v100, 16);
    }
    while (v52);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v56 = self->_cachedSuggestedWidgetLayoutLists;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v64;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(v56);
        v61 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v60), "copyWithZone:", a3, (_QWORD)v63);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:]((uint64_t)v5, v61);

        ++v60;
      }
      while (v58 != v60);
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
    }
    while (v58);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuidString;
  NSMutableArray *cachedSuggestionWidgetIds;
  NSMutableArray *cachedSuggestionWidgetLayouts;
  NSMutableArray *cachedTopOfStackLayoutKeys;
  NSMutableArray *cachedTopOfStackLayouts;
  NSMutableArray *fallbackSuggestions;
  NSMutableArray *cachedAppPredictionPanelIds;
  NSMutableArray *cachedAppPredictionPanelLayouts;
  NSMutableArray *cachedSuggestedWidgetLayoutListKeys;
  NSMutableArray *cachedSuggestedWidgetLayoutLists;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | v4[10])
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_22;
  }
  cachedSuggestionWidgetIds = self->_cachedSuggestionWidgetIds;
  if ((unint64_t)cachedSuggestionWidgetIds | v4[5]
    && !-[NSMutableArray isEqual:](cachedSuggestionWidgetIds, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts,
         !((unint64_t)cachedSuggestionWidgetLayouts | v4[6]))
     || -[NSMutableArray isEqual:](cachedSuggestionWidgetLayouts, "isEqual:"))
    && ((cachedTopOfStackLayoutKeys = self->_cachedTopOfStackLayoutKeys,
         !((unint64_t)cachedTopOfStackLayoutKeys | v4[7]))
     || -[NSMutableArray isEqual:](cachedTopOfStackLayoutKeys, "isEqual:"))
    && ((cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts, !((unint64_t)cachedTopOfStackLayouts | v4[8]))
     || -[NSMutableArray isEqual:](cachedTopOfStackLayouts, "isEqual:"))
    && ((fallbackSuggestions = self->_fallbackSuggestions, !((unint64_t)fallbackSuggestions | v4[9]))
     || -[NSMutableArray isEqual:](fallbackSuggestions, "isEqual:"))
    && ((cachedAppPredictionPanelIds = self->_cachedAppPredictionPanelIds,
         !((unint64_t)cachedAppPredictionPanelIds | v4[1]))
     || -[NSMutableArray isEqual:](cachedAppPredictionPanelIds, "isEqual:"))
    && ((cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts,
         !((unint64_t)cachedAppPredictionPanelLayouts | v4[2]))
     || -[NSMutableArray isEqual:](cachedAppPredictionPanelLayouts, "isEqual:"))
    && ((cachedSuggestedWidgetLayoutListKeys = self->_cachedSuggestedWidgetLayoutListKeys,
         !((unint64_t)cachedSuggestedWidgetLayoutListKeys | v4[3]))
     || -[NSMutableArray isEqual:](cachedSuggestedWidgetLayoutListKeys, "isEqual:")))
  {
    cachedSuggestedWidgetLayoutLists = self->_cachedSuggestedWidgetLayoutLists;
    if ((unint64_t)cachedSuggestedWidgetLayoutLists | v4[4])
      v15 = -[NSMutableArray isEqual:](cachedSuggestedWidgetLayoutLists, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSMutableArray hash](self->_cachedSuggestionWidgetIds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_cachedSuggestionWidgetLayouts, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_cachedTopOfStackLayoutKeys, "hash");
  v7 = -[NSMutableArray hash](self->_cachedTopOfStackLayouts, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_fallbackSuggestions, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_cachedAppPredictionPanelIds, "hash");
  v10 = -[NSMutableArray hash](self->_cachedAppPredictionPanelLayouts, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_cachedSuggestedWidgetLayoutListKeys, "hash");
  return v9 ^ v11 ^ -[NSMutableArray hash](self->_cachedSuggestedWidgetLayoutLists, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3[10];
    if (v5)
      objc_storeStrong((id *)(a1 + 80), v5);
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v6 = v4[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v84;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v84 != v9)
            objc_enumerationMutation(v6);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:](a1, *(void **)(*((_QWORD *)&v83 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v8);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v11 = v4[6];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v80;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v80 != v14)
            objc_enumerationMutation(v11);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:](a1, *(void **)(*((_QWORD *)&v79 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      }
      while (v13);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v16 = v4[7];
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v76;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v76 != v19)
            objc_enumerationMutation(v16);
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:](a1, *(void **)(*((_QWORD *)&v75 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      }
      while (v18);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v21 = v4[8];
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v72;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v72 != v24)
            objc_enumerationMutation(v21);
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:](a1, *(void **)(*((_QWORD *)&v71 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      }
      while (v23);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v26 = v4[9];
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v68;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v68 != v29)
            objc_enumerationMutation(v26);
          -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:](a1, *(void **)(*((_QWORD *)&v67 + 1) + 8 * v30++));
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
      }
      while (v28);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v31 = v4[1];
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v64;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v64 != v34)
            objc_enumerationMutation(v31);
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:](a1, *(void **)(*((_QWORD *)&v63 + 1) + 8 * v35++));
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
      }
      while (v33);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v36 = v4[2];
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v60;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v60 != v39)
            objc_enumerationMutation(v36);
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:](a1, *(void **)(*((_QWORD *)&v59 + 1) + 8 * v40++));
        }
        while (v38 != v40);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
      }
      while (v38);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v41 = v4[3];
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v56;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v56 != v44)
            objc_enumerationMutation(v41);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:](a1, *(void **)(*((_QWORD *)&v55 + 1) + 8 * v45++));
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
      }
      while (v43);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v46 = v4[4];
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v87, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v52;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v52 != v49)
            objc_enumerationMutation(v46);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:](a1, *(void **)(*((_QWORD *)&v51 + 1) + 8 * v50++));
        }
        while (v48 != v50);
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v87, 16);
      }
      while (v48);
    }

  }
}

@end
