@implementation SearchAddressBookOperation

- (SearchAddressBookOperation)initWithSearchQuery:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  SearchAddressBookOperation *v8;
  NSString *v9;
  NSString *searchQuery;
  void *v11;
  uint64_t v12;
  NSArray *searchTerms;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchAddressBookOperation;
  v8 = -[SearchAddressBookOperation init](&v15, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    searchQuery = v8->_searchQuery;
    v8->_searchQuery = v9;

    objc_storeStrong((id *)&v8->_context, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11));
    searchTerms = v8->_searchTerms;
    v8->_searchTerms = (NSArray *)v12;

  }
  return v8;
}

- (void)main
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  SearchAddressBookOperation *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  _BYTE v66[128];

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchAddressBookOperation - collecting results", buf, 2u);
  }

  if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactStore"));

    v11 = objc_alloc((Class)CNContactFetchRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "properties"));
    v14 = objc_msgSend(v11, "initWithKeysToFetch:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingName:options:](CNContact, "predicateForContactsMatchingName:options:", self->_searchQuery, 3));
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "setSortOrder:", 1);
    v63 = 0;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100983CB0;
    v59[3] = &unk_1011DD3C0;
    v59[4] = self;
    v16 = v6;
    v60 = v16;
    v52 = v7;
    v61 = v52;
    v17 = v8;
    v62 = v17;
    objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, &v63, v59);
    v18 = v63;
    if (GEOConfigGetBOOL(MapsConfig_UseCoreDuetToRankContactsInAC, off_1014B2F88)
      && objc_msgSend(v16, "count"))
    {
      v46 = v18;
      v47 = v16;
      v48 = v14;
      v49 = v5;
      v50 = v10;
      v51 = self;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeopleSuggesterContext currentContext](_CDPeopleSuggesterContext, "currentContext"));
      objc_msgSend(v19, "setConsumerIdentifier:", CFSTR("com.apple.Maps.autocomplete"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v19, "setDate:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeopleSuggesterSettings defaultSettings](_CDPeopleSuggesterSettings, "defaultSettings"));
      objc_msgSend(v21, "setMaxNumberOfPeopleSuggested:", 100);
      objc_msgSend(v21, "setAggregateByIdentifier:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeopleSuggester peopleSuggester](_CDPeopleSuggester, "peopleSuggester"));
      v45 = v19;
      objc_msgSend(v22, "setContext:", v19);
      v44 = v21;
      objc_msgSend(v22, "setSettings:", v21);
      v43 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "suggestPeopleWithError:", 0));
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      if (!v24)
        goto LABEL_27;
      v25 = v24;
      v26 = *(_QWORD *)v56;
      while (1)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contact"));
          v30 = v29;
          if (v29)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "personId"));
            if (objc_msgSend(v30, "personIdType") == (id)1)
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v31));
            else
              v32 = 0;
            if (objc_msgSend(v30, "personIdType") == (id)3)
            {
              v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v31));

              v32 = (void *)v33;
              if (!v33)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v31));
                goto LABEL_18;
              }
LABEL_19:
              objc_msgSend(v32, "peopleSuggesterRank");
              if (v34 == 0.0
                || (objc_msgSend(v32, "peopleSuggesterRank"), v36 = v35, objc_msgSend(v28, "rank"), v36 >= v37))
              {
                objc_msgSend(v28, "rank");
              }
              else
              {
                objc_msgSend(v32, "peopleSuggesterRank");
              }
              objc_msgSend(v32, "setPeopleSuggesterRank:");

            }
            else
            {
LABEL_18:
              if (v32)
                goto LABEL_19;
            }

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (!v25)
        {
LABEL_27:

          v10 = v50;
          self = v51;
          v14 = v48;
          v5 = v49;
          v18 = v46;
          v16 = v47;
          break;
        }
      }
    }
    objc_msgSend(v16, "sortUsingSelector:", "compare:");
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100983DC0;
    v53[3] = &unk_1011DD3E8;
    v53[4] = self;
    v38 = v5;
    v54 = v38;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v53);

  }
  else
  {
    v38 = 0;
  }
  v39 = sub_10043222C();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 134217984;
    v65 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "SearchAddressBookOperation - collected %lu results", buf, 0xCu);
  }

  if ((-[SearchAddressBookOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchAddressBookOperation delegate](self, "delegate"));
    objc_msgSend(v42, "searchAddressBookOperation:didMatchResults:", self, v38);

  }
}

- (SearchAddressBookOperationDelegate)delegate
{
  return (SearchAddressBookOperationDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
