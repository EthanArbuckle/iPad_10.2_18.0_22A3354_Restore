@implementation GKSortSuggestionsModifier

- (GKSortSuggestionsModifier)initWithSettings:(id)a3 networkRequester:(id)a4 cachedSortedAssociationIDs:(id)a5 transactionGroupProvider:(id)a6 featureEnabledBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  GKSortSuggestionsModifier *v18;
  id v19;
  id transactionGroupProvider;
  id v21;
  id featureEnabledBlock;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)GKSortSuggestionsModifier;
  v18 = -[GKSortSuggestionsModifier init](&v24, "init");
  if (v18)
  {
    v19 = objc_retainBlock(v16);
    transactionGroupProvider = v18->_transactionGroupProvider;
    v18->_transactionGroupProvider = v19;

    objc_storeStrong((id *)&v18->_networkRequester, a4);
    v21 = objc_retainBlock(v17);
    featureEnabledBlock = v18->_featureEnabledBlock;
    v18->_featureEnabledBlock = v21;

    objc_storeStrong((id *)&v18->_settings, a3);
    objc_storeStrong((id *)&v18->_cachedSortedAssociationIDs, a5);
  }

  return v18;
}

- (id)modifySuggestions:(id)a3
{
  id v4;
  uint64_t (**v5)(void);
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[5];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = a3;
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier featureEnabledBlock](self, "featureEnabledBlock"));
  v6 = v5[2]();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactAssociationID"));
          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);
            objc_msgSend(v8, "addObject:", v15);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v11);
    }

    v16 = objc_msgSend(v8, "count");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier settings](self, "settings"));
    v18 = objc_msgSend(v17, "mininumIDsForServiceRequest");

    if (v16 >= v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier settings](self, "settings"));
      v21 = objc_msgSend(v20, "suggestionsLimit");

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier cachedSortedAssociationIDs](self, "cachedSortedAssociationIDs"));
      if (v22)
      {
        if (!os_log_GKGeneral)
          v24 = (id)GKOSLoggers(v23);
        v25 = (void *)os_log_GKContacts;
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
          sub_100159B78(v25, self);
        v26 = (id)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier cachedSortedAssociationIDs](self, "cachedSortedAssociationIDs"));
      }
      else
      {
        if (objc_msgSend(v8, "count") <= v21)
        {
          v27 = objc_msgSend(v8, "copy");
          v28 = 0;
        }
        else
        {
          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v21));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v21, (_BYTE *)objc_msgSend(v8, "count") - (_BYTE *)objc_msgSend(v27, "count")));
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSortSuggestionsModifier.m", 164, "-[GKSortSuggestionsModifier modifySuggestions:]"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v29));

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1001595C4;
        v37[3] = &unk_1002BB4A0;
        v37[4] = self;
        v38 = v27;
        v31 = v30;
        v39 = v31;
        v32 = v27;
        objc_msgSend(v31, "perform:", v37);
        objc_msgSend(v31, "wait");
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "result"));
        v34 = objc_msgSend(v33, "mutableCopy");

        if (objc_msgSend(v28, "count"))
          objc_msgSend(v34, "addObjectsFromArray:", v28);
        v26 = objc_msgSend(v34, "copy");

      }
      v35 = objc_msgSend(v7, "copy");
      v19 = (id)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier sortSuggestions:usingSortedContactsAssociationIDs:suggestionMap:](self, "sortSuggestions:usingSortedContactsAssociationIDs:suggestionMap:", v9, v26, v35));

    }
    else
    {
      v19 = v9;
    }

  }
  else
  {
    v19 = v4;
  }

  return v19;
}

- (id)sortSuggestions:(id)a3 usingSortedContactsAssociationIDs:(id)a4 suggestionMap:(id)a5
{
  GKSortSuggestionsModifier *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  GKSortSuggestionsModifier *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  GKSortSuggestionsModifier *v31;
  GKSortSuggestionsModifier *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v8 = (GKSortSuggestionsModifier *)a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v33 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[GKSortSuggestionsModifier count](v8, "count")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", -[GKSortSuggestionsModifier count](v8, "count")));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v34 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i)));
          if (v18)
          {
            objc_msgSend(v11, "addObject:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contactID"));
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v15);
    }

    v20 = objc_msgSend(v11, "count");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKSortSuggestionsModifier settings](v33, "settings"));
    v22 = objc_msgSend(v21, "mininumIDsForContactAssociationIDsOnly");

    if (v20 < v22)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = v8;
      v23 = v8;
      v24 = -[GKSortSuggestionsModifier countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contactID", v33));
            v30 = objc_msgSend(v12, "containsObject:", v29);

            if ((v30 & 1) == 0)
              objc_msgSend(v11, "addObject:", v28);
          }
          v25 = -[GKSortSuggestionsModifier countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v25);
      }

      v8 = v33;
    }
    v31 = (GKSortSuggestionsModifier *)objc_msgSend(v11, "copy", v33);

    v9 = v34;
  }
  else
  {
    v31 = v8;
  }

  return v31;
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)featureEnabledBlock
{
  return self->_featureEnabledBlock;
}

- (void)setFeatureEnabledBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GKRerankNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
  objc_storeStrong((id *)&self->_networkRequester, a3);
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSArray)cachedSortedAssociationIDs
{
  return self->_cachedSortedAssociationIDs;
}

- (void)setCachedSortedAssociationIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSortedAssociationIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSortedAssociationIDs, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong(&self->_featureEnabledBlock, 0);
  objc_storeStrong(&self->_transactionGroupProvider, 0);
}

@end
