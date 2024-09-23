@implementation AutocompleteMutableSection

- (AutocompleteMutableSection)initWithRules:(id)a3 excludingRules:(id)a4 title:(id)a5 isQuerySuggestionsSection:(BOOL)a6 isSectionForClientOnlyResults:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  AutocompleteMutableSection *v15;
  NSArray *v16;
  NSArray *rules;
  NSArray *v18;
  NSArray *excludingRules;
  NSString *v20;
  NSString *title;
  NSMutableArray *v22;
  NSMutableArray *items;
  NSMutableArray *v24;
  NSMutableArray *poiRelevantItems;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)AutocompleteMutableSection;
  v15 = -[AutocompleteMutableSection init](&v27, "init");
  if (v15)
  {
    v16 = (NSArray *)objc_msgSend(v12, "copy");
    rules = v15->_rules;
    v15->_rules = v16;

    v18 = (NSArray *)objc_msgSend(v13, "copy");
    excludingRules = v15->_excludingRules;
    v15->_excludingRules = v18;

    v20 = (NSString *)objc_msgSend(v14, "copy");
    title = v15->_title;
    v15->_title = v20;

    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    items = v15->_items;
    v15->_items = v22;

    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    poiRelevantItems = v15->_poiRelevantItems;
    v15->_poiRelevantItems = v24;

    v15->_isQuerySuggestionsSection = a6;
    v15->_isSectionForClientOnlyResults = a7;
  }

  return v15;
}

- (BOOL)itemIsAllowed:(id)a3 indexInCompletionSections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  BOOL v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  if (-[AutocompleteMutableSection excludingRulesAllowItem:](self, "excludingRulesAllowItem:", v6))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection rules](self, "rules"));
    v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v21)
    {
      v9 = *(_QWORD *)v29;
      v23 = v8;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v8);
          v22 = v10;
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items", v20));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v25 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem)&& (objc_msgSend(v11, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v17, "sourceType"), objc_msgSend(v17, "sourceSubtype"), v7) & 1) != 0)
                {

                  goto LABEL_22;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v14)
                continue;
              break;
            }
          }

          if ((objc_msgSend(v11, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v6, "sourceType"), objc_msgSend(v6, "sourceSubtype"), v7) & 1) != 0)
          {
LABEL_22:
            v18 = 1;
            v8 = v23;
            goto LABEL_24;
          }
          v10 = v22 + 1;
          v8 = v23;
          v9 = v20;
        }
        while ((id)(v22 + 1) != v21);
        v18 = 0;
        v21 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v21)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_24:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)excludingRulesAllowItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  BOOL v15;
  uint64_t v17;
  id v18;
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

  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection excludingRules](self, "excludingRules"));
  v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v6 = *(_QWORD *)v25;
    v19 = v4;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem)
                && (objc_msgSend(v8, "matchesItemWithSourceType:sourceSubtype:indexInCompletionSections:", objc_msgSend(v14, "sourceType"), objc_msgSend(v14, "sourceSubtype"), 0) & 1) != 0)
              {

                v15 = 0;
                v4 = v19;
                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v11)
              continue;
            break;
          }
        }

        v4 = v19;
        v6 = v17;
      }
      v15 = 1;
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  else
  {
    v15 = 1;
  }
LABEL_20:

  return v15;
}

- (void)addItem:(id)a3 poiRelevanceScore:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
  objc_msgSend(v6, "addObject:", v7);

  if (a4 == 1.0)
    -[NSMutableArray addObject:](self->_poiRelevantItems, "addObject:", v7);

}

- (void)removeItem:(id)a3 poiRelevanceScore:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
  objc_msgSend(v6, "removeObject:", v7);

  if (a4 == 1.0)
    -[NSMutableArray removeObject:](self->_poiRelevantItems, "removeObject:", v7);

}

- (BOOL)containsItem:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)resortItemsToEnforceServerResultsOrderIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;

  if (-[AutocompleteMutableSection enforceServerResultsOrder](self, "enforceServerResultsOrder"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
    v4 = objc_msgSend(v3, "count");

    if ((unint64_t)v4 < 2)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      v6 = 1;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v6));

        if (objc_msgSend(v8, "hasServerItemIndex"))
        {
          v9 = objc_msgSend(v8, "serverSectionIndex");
          v10 = objc_msgSend(v8, "serverItemIndexInSection");
          v11 = 0;
          do
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

            if (objc_msgSend(v13, "hasServerItemIndex")
              && (v9 < objc_msgSend(v13, "serverSectionIndex")
               || v9 == objc_msgSend(v13, "serverSectionIndex") && v10 < objc_msgSend(v13, "serverItemIndexInSection")))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
              objc_msgSend(v14, "removeObjectAtIndex:", v6);

              v15 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
              objc_msgSend(v15, "insertObject:atIndex:", v8, v11);

              ++v5;
              v11 = v6;
            }

            ++v11;
          }
          while (v11 < v6);
        }

        ++v6;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
        v17 = objc_msgSend(v16, "count");

      }
      while (v6 < (unint64_t)v17);
    }
    if (-[AutocompleteMutableSection enableMapsSuggestServerReranking](self, "enableMapsSuggestServerReranking"))
      -[AutocompleteMutableSection prioritizePoiRelevantItems](self, "prioritizePoiRelevantItems");
    v18 = sub_10043222C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection title](self, "title"));
      v21 = 138412546;
      v22 = v20;
      v23 = 2048;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Enforcing AC server order for section title=\"%@\": moved %lu item(s) to match server order", (uint8_t *)&v21, 0x16u);

    }
  }
}

- (void)prioritizePoiRelevantItems
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *poiRelevantItems;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  v18 = (id)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
  if ((unint64_t)objc_msgSend(v18, "count") >= 2)
  {
    v3 = -[NSMutableArray count](self->_poiRelevantItems, "count");

    if (v3)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v4 = self->_poiRelevantItems;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
            objc_msgSend(v10, "removeObject:", v9);

          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v6);
      }

      -[NSMutableArray sortWithOptions:usingComparator:](self->_poiRelevantItems, "sortWithOptions:usingComparator:", 16, &stru_1011C68E0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection items](self, "items"));
      poiRelevantItems = self->_poiRelevantItems;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, -[NSMutableArray count](poiRelevantItems, "count")));
      objc_msgSend(v11, "insertObjects:atIndexes:", poiRelevantItems, v13);

      v14 = sub_10043222C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMutableSection title](self, "title"));
        v17 = -[NSMutableArray count](self->_poiRelevantItems, "count");
        *(_DWORD *)buf = 138412546;
        v24 = v16;
        v25 = 2048;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Enforcing AC server result reorder for section title=\"%@\": moved %lu item(s) to prioritize maps suggestions poi relevant items", buf, 0x16u);

      }
    }
  }
  else
  {

  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isQuerySuggestionsSection
{
  return self->_isQuerySuggestionsSection;
}

- (void)setIsQuerySuggestionsSection:(BOOL)a3
{
  self->_isQuerySuggestionsSection = a3;
}

- (BOOL)isSectionForClientOnlyResults
{
  return self->_isSectionForClientOnlyResults;
}

- (void)setIsSectionForClientOnlyResults:(BOOL)a3
{
  self->_isSectionForClientOnlyResults = a3;
}

- (BOOL)enforceServerResultsOrder
{
  return self->_enforceServerResultsOrder;
}

- (void)setEnforceServerResultsOrder:(BOOL)a3
{
  self->_enforceServerResultsOrder = a3;
}

- (BOOL)enableMapsSuggestServerReranking
{
  return self->_enableMapsSuggestServerReranking;
}

- (void)setEnableMapsSuggestServerReranking:(BOOL)a3
{
  self->_enableMapsSuggestServerReranking = a3;
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)excludingRules
{
  return self->_excludingRules;
}

- (void)setExcludingRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)poiRelevantItems
{
  return self->_poiRelevantItems;
}

- (void)setPoiRelevantItems:(id)a3
{
  objc_storeStrong((id *)&self->_poiRelevantItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiRelevantItems, 0);
  objc_storeStrong((id *)&self->_excludingRules, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
