@implementation SearchHomeRecentSearchesDataFetcher

- (SearchHomeRecentSearchesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v5;
  SearchHomeRecentSearchesDataFetcher *v6;
  SearchHomeRecentSearchesDataFetcher *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchHomeRecentSearchesDataFetcher;
  v6 = -[SearchHomeRecentSearchesDataFetcher init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v7->_isFetchingDataComplete = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
    objc_msgSend(v8, "addObserver:", v7);

    -[SearchHomeRecentSearchesDataFetcher updateContent](v7, "updateContent");
  }

  return v7;
}

- (void)fetchContent
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataFetcher delegate](self, "delegate"));
  objc_msgSend(v3, "didUpdateDataFetcher:", self);

}

- (void)updateContent
{
  id v2;
  NSObject *v3;
  os_signpost_id_t v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  SearchHomeRecentSearchesDataProvider *v34;
  void *v35;
  SearchHomeRecentSearchesDataProvider *v36;
  NSArray *v37;
  NSArray *dataProviders;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t spid;
  unint64_t v44;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id obj;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id buf[2];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  SearchHomeRecentSearchesDataProvider *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v2 = sub_1003EDAD4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_signpost_id_generate(v3);

  v5 = sub_1003EDAD4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  spid = v4;
  v44 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateContent", ", (uint8_t *)buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reverseObjectEnumerator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

  v52 = objc_alloc_init((Class)NSMutableArray);
  v51 = objc_alloc_init((Class)NSMutableDictionary);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        objc_initWeak(buf, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "historyEntry"));
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_1003EDB14;
        v65[3] = &unk_1011B4A58;
        v17 = v52;
        v66 = v17;
        objc_copyWeak(&v67, buf);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1003EDB54;
        v61[3] = &unk_1011B4A80;
        v62 = v51;
        objc_copyWeak(&v64, buf);
        v63 = v17;
        objc_msgSend(v16, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v65, 0, v61, 0);

        objc_destroyWeak(&v64);
        objc_destroyWeak(&v67);

        objc_destroyWeak(buf);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v12);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v46 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "allKeys"));
  v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v58;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v58 != v47)
        {
          v19 = v18;
          objc_enumerationMutation(v46);
          v18 = v19;
        }
        v49 = v18;
        v20 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v18);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v21 = v52;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v54;
          v24 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(_QWORD *)v54 != v23)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "historyEntry", spid));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "storageIdentifier"));
              v29 = objc_msgSend(v28, "isEqual:", v20);

              if (v29)
                v24 = (uint64_t)objc_msgSend(v21, "indexOfObject:", v26);
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
          }
          while (v22);

          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v21, "removeObjectAtIndex:", v24);
        }
        else
        {

        }
        v18 = v49 + 1;
      }
      while ((id)(v49 + 1) != v48);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    }
    while (v48);
  }

  self->_isFetchingDataComplete = 1;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataFetcher recentSearches](self, "recentSearches"));
  v31 = objc_msgSend(v52, "isEqualToArray:", v30);

  if ((v31 & 1) == 0)
  {
    -[SearchHomeRecentSearchesDataFetcher setRecentSearches:](self, "setRecentSearches:", v52);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[Search Home] Recents"), CFSTR("localized string not found"), 0));

    v34 = [SearchHomeRecentSearchesDataProvider alloc];
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataFetcher recentSearches](self, "recentSearches"));
    v36 = -[SearchHomeRecentSearchesDataProvider initWithObjects:type:identifier:title:](v34, "initWithObjects:type:identifier:title:", v35, 1, CFSTR("SearchHomeRecents"), v33);

    v73 = v36;
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v73, 1));
    dataProviders = self->_dataProviders;
    self->_dataProviders = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataFetcher delegate](self, "delegate"));
    objc_msgSend(v39, "didUpdateDataFetcher:", self);

  }
  v40 = sub_1003EDAD4();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, spid, "UpdateContent", ", (uint8_t *)buf, 2u);
  }

}

- (void)recentsUpdated:(id)a3
{
  self->_isFetchingDataComplete = 0;
  -[SearchHomeRecentSearchesDataFetcher updateContent](self, "updateContent", a3);
}

- (SearchHomeDataFetcherDelegate)delegate
{
  return (SearchHomeDataFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
  objc_storeStrong((id *)&self->_dataProviders, a3);
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (NSArray)recentSearches
{
  return self->_recentSearches;
}

- (void)setRecentSearches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentSearches, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
