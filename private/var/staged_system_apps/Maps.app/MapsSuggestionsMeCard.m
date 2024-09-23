@implementation MapsSuggestionsMeCard

- (id)_maps_shortcutForSuggestionsEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcutIdentifier"));
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](self, "shortcutsForAll", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((sub_100833070(v10, v4) & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_maps_shortcutForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](self, "shortcutsForAll"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard _maps_shortcutForMapItem:fromShortcuts:](self, "_maps_shortcutForMapItem:fromShortcuts:", v4, v5));

  return v6;
}

- (id)_maps_shortcutIncludingHiddenForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAllIncludingHidden](self, "shortcutsForAllIncludingHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard _maps_shortcutForMapItem:fromShortcuts:](self, "_maps_shortcutForMapItem:fromShortcuts:", v4, v5));

  return v6;
}

- (id)_maps_shortcutForMapItem:(id)a3 fromShortcuts:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char IsEqualToMapItemForPurpose;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isCurrentLocation") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    if (v8)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v6;
      v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v18 = v6;
        v10 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v9);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geoMapItem"));
            if (v13)
            {
              v14 = (void *)v13;
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geoMapItem"));
              IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v15, v8, 3);

              if ((IsEqualToMapItemForPurpose & 1) != 0)
              {
                v7 = v12;
                goto LABEL_16;
              }
            }
          }
          v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v7)
            continue;
          break;
        }
LABEL_16:
        v6 = v18;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_maps_shortcutOrderedEntries:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](self, "shortcutsForAll"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v19;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
              if (sub_100833070(v9, v15))
                objc_msgSend(v4, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v4, "copy");
  return v16;
}

- (BOOL)_maps_canAddShortcutForMapItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isCurrentLocation") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard _maps_shortcutForMapItem:](self, "_maps_shortcutForMapItem:", v5));

    v6 = v7 == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_maps_firstValidMoveIndex
{
  void *v2;
  id v3;
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  unint64_t v9;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](self, "shortcutsForAll", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      v8 = (int64_t)v4 + v5;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v9 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7), "type");
        if (v9 > 5 || ((1 << v9) & 0x2C) == 0)
        {
          v8 = (int64_t)v7 + v5;
          goto LABEL_15;
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v8;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_15:

  return v8;
}

@end
