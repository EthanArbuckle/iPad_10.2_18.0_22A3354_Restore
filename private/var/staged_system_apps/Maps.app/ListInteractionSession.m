@implementation ListInteractionSession

- (ListInteractionSession)initWithObjects:(id)a3 forType:(int)a4 startDate:(id)a5 proactiveStartTimes:(id)a6
{
  id v10;
  ListInteractionSession *v11;
  ListInteractionSession *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  void *v32;
  id v33;
  __objc2_prot *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  unsigned int v40;
  id v41;
  id v42;
  __objc2_prot *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  NSArray *v56;
  NSArray *items;
  NSDictionary *v58;
  NSDictionary *proactiveItems;
  ListInteractionSession *v60;
  ListInteractionSession *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  id obj;
  unsigned int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];

  v10 = a3;
  v66 = a5;
  v68 = a6;
  if (!objc_msgSend(v10, "count"))
  {
    v60 = 0;
    goto LABEL_56;
  }
  v77.receiver = self;
  v77.super_class = (Class)ListInteractionSession;
  v11 = -[ListInteractionSession init](&v77, "init");
  v12 = v11;
  if (!v11)
    goto LABEL_54;
  v11->_resultsItemsInitialized = 0;
  v62 = v11;
  v11->_listType = a4;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v63 = v10;
  v14 = v10;
  v15 = (void *)v13;
  obj = v14;
  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (!v16)
    goto LABEL_53;
  v17 = v16;
  v67 = 0;
  v18 = *(_QWORD *)v74;
  v19 = a4 - 2;
  v72 = (0x3Bu >> (a4 - 2)) & 1;
  v69 = (void *)v13;
  v70 = v19;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v74 != v18)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v20);
      v22 = objc_alloc_init((Class)GEOListResultItem);
      v23 = objc_opt_class(MKMapItem);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
      {
        v24 = v21;
        if (objc_msgSend(v24, "_hasMUID"))
          objc_msgSend(v22, "setBusinessId:", objc_msgSend(v24, "_muid"));
        v25 = 2;
      }
      else
      {
        v26 = objc_opt_class(MapsSuggestionsEntry);
        if ((objc_opt_isKindOfClass(v21, v26) & 1) != 0)
        {
          v24 = v21;
          v27 = objc_alloc_init((Class)GEOProactiveItem);
          objc_msgSend(v27, "setProactiveItemType:", objc_msgSend(v24, "proactiveItemType"));
          objc_msgSend(v27, "setVisible:", 0);
          objc_msgSend(v27, "setShared:", 0);
          objc_msgSend(v27, "setEdited:", 0);
          objc_msgSend(v27, "setDeleted:", 0);
          objc_msgSend(v27, "setTapped:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueIdentifier"));
          v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", v28));

          if (!v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueIdentifier"));
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v64, v30);

            v15 = v69;
            v29 = v64;
          }
          objc_msgSend(v29, "timeIntervalSinceDate:", v66);
          objc_msgSend(v27, "setTimeSinceStart:", (int)(v31 * 1000.0));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v20 + v67));
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v27, v32);

          v25 = 3;
        }
        else
        {
          v33 = v21;
          v34 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
          v35 = objc_opt_class(HistoryEntryRecentsItem);
          v36 = v33;
          if ((objc_opt_isKindOfClass(v36, v35) & 1) != 0)
            v37 = v36;
          else
            v37 = 0;
          v38 = v37;

          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "historyEntry"));
            v40 = objc_msgSend(v39, "conformsToProtocol:", v34);

            if (v40)
              v41 = v36;
            else
              v41 = 0;
            v15 = v69;
          }
          else
          {
            v41 = 0;
          }

          if (v41)
          {
            v42 = v36;
            v43 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
            v44 = objc_opt_class(HistoryEntryRecentsItem);
            v45 = v42;
            if ((objc_opt_isKindOfClass(v45, v44) & 1) != 0)
              v46 = v45;
            else
              v46 = 0;
            v47 = v46;

            if (v47
              && (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "historyEntry")),
                  v49 = objc_msgSend(v48, "conformsToProtocol:", v43),
                  v48,
                  v49))
            {
              v24 = v45;
            }
            else
            {
              v24 = 0;
            }

            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "historyEntry"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "geoMapItem"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v51));

            if (objc_msgSend(v52, "_hasMUID"))
              objc_msgSend(v22, "setBusinessId:", objc_msgSend(v52, "_muid"));

            v25 = 2;
            v15 = v69;
          }
          else
          {
            v53 = objc_opt_class(SearchResult);
            if ((objc_opt_isKindOfClass(v36, v53) & 1) != 0)
            {
              v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapItem"));
              if (objc_msgSend(v24, "_hasMUID"))
                objc_msgSend(v22, "setBusinessId:", objc_msgSend(v24, "_muid"));
              v25 = 2;
            }
            else
            {
              v54 = objc_opt_class(MKLocalSearchCompletion);
              if ((objc_opt_isKindOfClass(v36, v54) & 1) == 0)
              {
                v25 = 2;
                v19 = v70;
                goto LABEL_46;
              }
              v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapItem"));
              if (objc_msgSend(v24, "_hasMUID"))
                objc_msgSend(v22, "setBusinessId:", objc_msgSend(v24, "_muid"));
              v25 = 1;
            }
          }
        }
        v19 = v70;
      }

LABEL_46:
      if (v19 <= 5 && v72)
        v25 = dword_100E37514[v19];
      objc_msgSend(v22, "setResultType:", v25);
      objc_msgSend(v15, "addObject:", v22);

      v20 = (char *)v20 + 1;
    }
    while (v17 != v20);
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    v17 = v55;
    v67 += (uint64_t)v20;
  }
  while (v55);
LABEL_53:

  v56 = (NSArray *)objc_msgSend(v15, "copy");
  v12 = v62;
  items = v62->_items;
  v62->_items = v56;

  v58 = (NSDictionary *)objc_msgSend(v65, "copy");
  proactiveItems = v62->_proactiveItems;
  v62->_proactiveItems = v58;

  v10 = v63;
LABEL_54:
  self = v12;
  v60 = self;
LABEL_56:

  return v60;
}

- (void)updateWithSelection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (((unint64_t)objc_msgSend(v6, "row") & 0x8000000000000000) == 0)
  {
    v4 = objc_msgSend(v6, "row");
    if (v4 < (id)-[NSArray count](self->_items, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      objc_msgSend(v5, "setTappedCount:", objc_msgSend(v5, "tappedCount") + 1);

    }
  }

}

- (void)updateWithTableView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSDictionary *proactiveItems;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "indexPathsForVisibleRows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "row");
        if (v12 < (id)-[NSArray count](self->_items, "count"))
        {
          objc_msgSend(v5, "addIndex:", objc_msgSend(v11, "row"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v11, "row")));
          v14 = v13;
          if (self->_resultsItemsInitialized)
            objc_msgSend(v13, "setEventuallyVisible:", 1);
          else
            objc_msgSend(v13, "setInitiallyVisible:", 1);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  proactiveItems = self->_proactiveItems;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1004A4ED8;
  v17[3] = &unk_1011B8638;
  v18 = v5;
  v16 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](proactiveItems, "enumerateKeysAndObjectsUsingBlock:", v17);
  self->_resultsItemsInitialized = 1;

}

- (id)description
{
  uint64_t listType;
  __CFString *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  listType = self->_listType;
  if (listType >= 0xD)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), listType));
  else
    v4 = off_1011B86E8[listType];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v11 = objc_msgSend(v10, "resultType");
        if (v11 >= 4)
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v11));
        else
          v12 = off_1011B8750[(int)v11];
        if (objc_msgSend(v10, "initiallyVisible"))
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        if (objc_msgSend(v10, "eventuallyVisible"))
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("\nListSession %@ initVisible %@ eventVisible %@ tap %d"), v12, v13, v14, objc_msgSend(v10, "tappedCount")));

        v8 = (char *)v8 + 1;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)proactiveItems
{
  return self->_proactiveItems;
}

- (NSArray)items
{
  return self->_items;
}

- (int)listType
{
  return self->_listType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_proactiveItems, 0);
}

@end
