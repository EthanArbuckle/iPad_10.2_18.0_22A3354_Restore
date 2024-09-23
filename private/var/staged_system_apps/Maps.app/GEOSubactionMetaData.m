@implementation GEOSubactionMetaData

+ (id)subactionMetaDataWithChildItems:(id)a3 selectedChildItemIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char *v22;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)GEOSubactionMetaData);
  v25 = v6;
  if (v6)
    v8 = (uint64_t)objc_msgSend(v6, "row");
  else
    v8 = 0xFFFFFFFFLL;
  objc_msgSend(v7, "setSelectedSubactionIndex:", v8);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ChildItemButton buttonTitleWithChildItem:](ChildItemButton, "buttonTitleWithChildItem:", v14));
        objc_msgSend(v7, "addDisplayedText:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childItemAction"));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childItemAction"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childItemAction"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "childActionTypeAsString:", objc_msgSend(v18, "childActionType")));
          objc_msgSend(v7, "addChildItemSubactionType:", v19);

        }
        v20 = objc_msgSend(v14, "childItemType");
        if (v20 == (id)1)
        {
          v23 = 2;
          goto LABEL_18;
        }
        if (v20 == (id)3)
        {
          v23 = 3;
          goto LABEL_18;
        }
        if (v20 == (id)2)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childItemAction"));
          v22 = (char *)objc_msgSend(v21, "childActionType");

          if ((unint64_t)(v22 - 1) < 8)
          {
            v23 = dword_100E34ED8[(_QWORD)(v22 - 1)];
LABEL_18:
            objc_msgSend(v7, "addSubaction:", v23);
            continue;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  return v7;
}

@end
