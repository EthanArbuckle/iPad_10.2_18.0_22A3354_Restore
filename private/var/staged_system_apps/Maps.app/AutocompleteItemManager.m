@implementation AutocompleteItemManager

- (AutocompleteItemManager)init
{
  AutocompleteItemManager *v2;
  void *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AutocompleteItemManager;
  v2 = -[PersonalizedItemManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocomplete](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForAutocomplete"));
    v5.receiver = v2;
    v5.super_class = (Class)AutocompleteItemManager;
    -[PersonalizedItemManager setPriorityFunction:](&v5, "setPriorityFunction:", v3);

  }
  return v2;
}

- (void)setPriorityFunction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocomplete](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForAutocomplete"));
  v6.receiver = self;
  v6.super_class = (Class)AutocompleteItemManager;
  -[PersonalizedItemManager setPriorityFunction:](&v6, "setPriorityFunction:", v5);
  if (!v4)

}

- (void)autocompleteSessionDidEnd
{
  -[AutocompleteItemManager setMapsSuggestionsIsTouristHereScoreValid:](self, "setMapsSuggestionsIsTouristHereScoreValid:", 0);
}

- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = sub_10043222C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AutocompleteItemManager - collecting results", buf, 2u);
  }

  v13[1] = 3221225472;
  v13[2] = sub_100574C70;
  v13[3] = &unk_1011BB738;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v12.receiver = self;
  v12.super_class = (Class)AutocompleteItemManager;
  v13[0] = _NSConcreteStackBlock;
  v10 = v7;
  v11 = v6;
  -[PersonalizedItemManager _gatherItemsWithShouldCancel:completion:](&v12, "_gatherItemsWithShouldCancel:completion:", v11, v13);

}

- (BOOL)useClientRankingScore
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _clientRankingFunction](self, "_clientRankingFunction"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)usePriority
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _clientRankingFunction](self, "_clientRankingFunction"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _priorityFunction](self, "_priorityFunction"));
    v4 = v5 != 0;

  }
  return v4;
}

- (id)wrappedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  AutocompleteItemManagerItemWrapper *v12;
  AutocompleteItemManagerItemWrapper *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = [AutocompleteItemManagerItemWrapper alloc];
        v13 = -[AutocompleteItemManagerItemWrapper initWithItem:compoundItem:](v12, "initWithItem:compoundItem:", v11, v11, (_QWORD)v16);
        if (-[AutocompleteItemManager usePriority](self, "usePriority"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _priorityFunction](self, "_priorityFunction"));
          -[AutocompleteItemManagerItemWrapper setPriority:](v13, "setPriority:", objc_msgSend(v14, "priorityForPersonalizedAutocompleteItem:", v11));

        }
        objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)sectionsWithWrappedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id obj;
  uint64_t v47;
  void *v48;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager completionSections](self, "completionSections"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager defaultSectionsWithCompletionSections:](self, "defaultSectionsWithCompletionSections:", v5));

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v4;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v44)
  {
    v41 = *(_QWORD *)v66;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v66 != v41)
          objc_enumerationMutation(obj);
        v47 = v6;
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager indexOfSectionWithItem:](self, "indexOfSectionWithItem:", v7));
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v9 = v42;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v62;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v62 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compoundItem"));
              v16 = objc_msgSend(v14, "itemIsAllowed:indexInCompletionSections:", v15, v8);

              if (v16)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "item"));
                objc_msgSend(v7, "poiRelevanceScore");
                objc_msgSend(v14, "addItem:poiRelevanceScore:", v17);

                objc_msgSend(v7, "setSection:", v14);
                goto LABEL_16;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_16:

        v6 = v47 + 1;
      }
      while ((id)(v47 + 1) != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v44);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v18 = v42;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v58;
    v43 = *(_QWORD *)v58;
    do
    {
      v22 = 0;
      v45 = v20;
      do
      {
        if (*(_QWORD *)v58 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v22);
        if (objc_msgSend(v23, "isSectionForClientOnlyResults"))
        {
          v48 = v22;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v24 = obj;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(_QWORD *)v54 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
                if (-[AutocompleteItemManager canMoveItem:toSection:withSortedSections:wrappedItems:](self, "canMoveItem:toSection:withSortedSections:wrappedItems:", v29, v23, v18, v24))
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "section"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "item"));
                  objc_msgSend(v29, "poiRelevanceScore");
                  objc_msgSend(v30, "removeItem:poiRelevanceScore:", v31);

                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "item"));
                  objc_msgSend(v29, "poiRelevanceScore");
                  objc_msgSend(v23, "addItem:poiRelevanceScore:", v32);

                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
            }
            while (v26);
          }

          v21 = v43;
          v20 = v45;
          v22 = v48;
        }
        v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v20);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = v18;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k), "resortItemsToEnforceServerResultsOrderIfNeeded");
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v35);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011BB778));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "filteredArrayUsingPredicate:", v38));

  return v39;
}

- (void)computeClientRankingScoresForResolvedItemsIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  char *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  AutocompleteItemManager *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  char *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  _BOOL4 v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  unint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  PersonalizedCompoundItemAutocompleteAnalytics *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  double v80;
  double v81;
  void *v82;
  unsigned __int8 v83;
  id v84;
  id v85;
  uint64_t v86;
  void *k;
  void *v88;
  void *v89;
  unsigned int v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void (**v107)(_QWORD);
  void *v108;
  void *v109;
  void *v110;
  AutocompleteItemManager *v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t v125[128];
  uint8_t buf[4];
  id v127;
  __int16 v128;
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  void *v132;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!-[AutocompleteItemManager useClientRankingScore](self, "useClientRankingScore"))
    goto LABEL_67;
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = sub_10043222C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        v12 = "Skipping computing AC ranking scores because we only have 1 item";
LABEL_65:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v12, buf, 2u);
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      v12 = "Skipping computing AC ranking scores because we have no items";
      goto LABEL_65;
    }

LABEL_67:
    v7[2](v7);
    goto LABEL_68;
  }
  v111 = self;
  v107 = v7;
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v109 = v6;
  v14 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v15 = 0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v15));
      objc_msgSend(v16, "setClientRankingScore:", -3.40282347e38);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "item"));
      v18 = objc_msgSend(v17, "isCompoundPersonalizedAutocompleteItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "item"));
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leafPersonalizedAutocompleteItems"));
      }
      else
      {
        v132 = v19;
        v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1));
      }
      v22 = (void *)v21;

      objc_msgSend(v110, "addObjectsFromArray:", v22);
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v122;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v122 != v26)
              objc_enumerationMutation(v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i), "autocompleteObject"));

            if (v28)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "compoundItem"));
              objc_msgSend(v112, "addObject:", v29);

              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
              objc_msgSend(v13, "addObject:", v30);

              ++v14;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
        }
        while (v25);
      }

      ++v15;
      v6 = v109;
    }
    while (v15 < (unint64_t)objc_msgSend(v109, "count"));
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager autocompleteContext](self, "autocompleteContext"));
  v32 = sub_100B3A5D4();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "oneInsights"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager traits](self, "traits"));
  BYTE1(v106) = -[AutocompleteItemManager shouldUseDistanceFeatureServerResults](self, "shouldUseDistanceFeatureServerResults");
  LOBYTE(v106) = 0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:traits:usedForLogging:shouldUseDistanceFeatureServerResults:](MapsAnalyticsHelper, "acSuggestionEntriesFromAutoCompleteObjects:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:traits:usedForLogging:shouldUseDistanceFeatureServerResults:", v112, v110, v31, v34, 0, v35, v106));

  v37 = self;
  if (!-[AutocompleteItemManager mapsSuggestionsIsTouristHereScoreValid](self, "mapsSuggestionsIsTouristHereScoreValid"))
  {
    -[AutocompleteItemManager setMapsSuggestionsIsTouristHereScoreValid:](self, "setMapsSuggestionsIsTouristHereScoreValid:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager traits](self, "traits"));
    objc_msgSend(v38, "isTourist");
    -[AutocompleteItemManager setMapsSuggestionsIsTouristHereScore:](self, "setMapsSuggestionsIsTouristHereScore:");

    v37 = self;
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v39 = v36;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v118 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)j);
        -[AutocompleteItemManager mapsSuggestionsIsTouristHereScore](v37, "mapsSuggestionsIsTouristHereScore");
        objc_msgSend(v44, "setMapsSuggestionsIsTouristScore:");
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
    }
    while (v41);
  }

  v45 = (char *)objc_msgSend(v39, "count");
  v46 = sub_10043222C();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  v48 = v47;
  if (v45 == v14)
  {
    v49 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);

    if (v49)
    {
      v50 = sub_10043222C();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = objc_msgSend(v6, "count");
        v53 = objc_msgSend(v110, "count");
        *(_DWORD *)buf = 134218240;
        v127 = v52;
        v128 = 2048;
        v129 = v53;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Computing AC ranking scores for %lu items (%lu leaf items)", buf, 0x16u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _clientRankingFunction](v37, "_clientRankingFunction"));
      v55 = sub_10043222C();
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      objc_msgSend(v54, "describeInLog:withType:", v56, 1);

    }
    v108 = v39;
    if (objc_msgSend(v39, "count"))
    {
      v57 = 0;
      do
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v57));
        v59 = objc_msgSend(v58, "unsignedIntegerValue");

        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v59));
        buf[0] = 0;
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndexedSubscript:", v57));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v57));
        -[AutocompleteItemManager clientRankingScoreForItem:withSuggestionEntry:hasContributionsFromDiscreteFeaturesResult:](v37, "clientRankingScoreForItem:withSuggestionEntry:hasContributionsFromDiscreteFeaturesResult:", v61, v62, buf);
        v64 = v63;

        v39 = v108;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectAtIndexedSubscript:", v57));
        objc_msgSend(v65, "mapsSuggestionsPoiRevelanceScore");
        v67 = v66;

        objc_msgSend(v60, "clientRankingScore");
        if (v64 > v68)
        {
          objc_msgSend(v60, "clientRankingScore");
          if (v69 > v64)
          {
            objc_msgSend(v60, "clientRankingScore");
            v64 = v70;
          }
          objc_msgSend(v60, "setClientRankingScore:", v64);
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "compoundItem"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "autocompleteAnalytics"));

          if (!v72)
          {
            v73 = objc_alloc_init(PersonalizedCompoundItemAutocompleteAnalytics);
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "compoundItem"));
            objc_msgSend(v74, "setAutocompleteAnalytics:", v73);

          }
          v75 = buf[0];
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "compoundItem"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "autocompleteAnalytics"));
          objc_msgSend(v77, "setDiscreteFeatureValuesContributedToLatestClientRankingScore:", v75);

          v39 = v108;
        }
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v57));
        v79 = objc_msgSend(v78, "suggestionType");

        if (v79 == 9)
        {
          objc_msgSend(v60, "poiRelevanceScore");
          if (v80 > v67)
          {
            objc_msgSend(v60, "poiRelevanceScore");
            v67 = v81;
          }
          objc_msgSend(v60, "setPoiRelevanceScore:", v67);
        }

        ++v57;
      }
      while (v57 < (unint64_t)objc_msgSend(v39, "count"));
    }
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v83 = objc_msgSend(v82, "BOOLForKey:", CFSTR("EnableSearchDebug"));

    if ((v83 & 1) == 0)
      goto LABEL_62;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v48 = v6;
    v84 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v114;
      do
      {
        for (k = 0; k != v85; k = (char *)k + 1)
        {
          if (*(_QWORD *)v114 != v86)
            objc_enumerationMutation(v48);
          v88 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)k);
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "item"));
          v90 = objc_msgSend(v89, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteItemWithMatchInfo);

          if (v90)
          {
            objc_msgSend(v88, "clientRankingScore");
            v92 = v91;
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "item"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "matchInfo"));
            objc_msgSend(v94, "setClientRankingDebug:", v92);

          }
          objc_msgSend(v88, "clientRankingScore");
          v96 = v95;
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager autocompleteContext](v111, "autocompleteContext"));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "item"));
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "autocompleteObject"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "matchInfoForObject:", v99));
          objc_msgSend(v100, "setClientRankingDebug:", v96);

          objc_msgSend(v88, "clientRankingScore");
          v102 = v101;
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "compoundItem"));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "matchInfo"));
          objc_msgSend(v104, "setClientRankingDebug:", v102);

        }
        v85 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
      }
      while (v85);
      v39 = v108;
      v6 = v109;
    }
  }
  else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v105 = objc_msgSend(v39, "count");
    *(_DWORD *)buf = 134218240;
    v127 = v14;
    v128 = 2048;
    v129 = v105;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Skipping computing AC ranking scores because the number of items (%lu) does not match the number of suggestionEntries produced (%lu)", buf, 0x16u);
  }

LABEL_62:
  v7 = v107;
  v107[2](v107);

LABEL_68:
}

- (double)clientRankingScoreForItem:(id)a3 withSuggestionEntry:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5
{
  id v8;
  id v9;
  double v10;
  PersonalizedItemSignalPack *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = 0.0;
  if (-[AutocompleteItemManager useClientRankingScore](self, "useClientRankingScore"))
  {
    v11 = -[PersonalizedItemSignalPack initWithItem:suggestionEntry:]([PersonalizedItemSignalPack alloc], "initWithItem:suggestionEntry:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _clientRankingFunction](self, "_clientRankingFunction"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverResultScoreMetadata"));
    objc_msgSend(v12, "clientRankingScoreForPersonalizedItemSignalPack:withServerScore:hasContributionsFromDiscreteFeaturesResult:", v11, v13, a5);
    v10 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverResultScoreMetadata"));
    -[AutocompleteItemManager logClientRankingScore:forItem:withSignalPack:serverScore:](self, "logClientRankingScore:forItem:withSignalPack:serverScore:", v8, v11, v15, v10);

  }
  return v10;
}

- (id)filterDuplicateContactsFromServerResultUsingItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id obj;
  __int128 v43;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];

  v3 = objc_msgSend(a3, "mutableCopy");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "containsPossiblePersonalizedItemSourceType:", 4))
          objc_msgSend(v36, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v7);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v15, "containsPossiblePersonalizedItemSourceType:", 1))
          objc_msgSend(v4, "addObject:", v15);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v12);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = v4;
  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v52;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v33);
        v37 = v16;
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v16);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v38 = v36;
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
        if (v40)
        {
          v39 = *(_QWORD *)v48;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v48 != v39)
                objc_enumerationMutation(v38);
              v41 = v18;
              v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keys"));
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v44;
                do
                {
                  for (k = 0; k != v22; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v44 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k);
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keys"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));

                    if (v28 && objc_msgSend(v25, "isEqual:", v28))
                    {
                      v29 = sub_10043222C();
                      v30 = objc_claimAutoreleasedReturnValue(v29);
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v64 = v19;
                        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "AutocompleteItemManager - Found a duplicate contact:%@ with server address", buf, 0xCu);
                      }

                      objc_msgSend(obj, "removeObject:", v19);
                    }

                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
                }
                while (v22);
              }

              v18 = v41 + 1;
            }
            while ((id)(v41 + 1) != v40);
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
          }
          while (v40);
        }

        v16 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v35);
  }

  v31 = objc_msgSend(obj, "copy");
  return v31;
}

- (BOOL)canMoveItem:(id)a3 toSection:(id)a4 withSortedSections:(id)a5 wrappedItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  char *v18;
  void *v19;
  char *v20;
  char *v21;
  BOOL v22;
  void *v23;
  double v24;
  double v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "compoundItem"));
  if ((objc_msgSend(v11, "itemIsAllowed:indexInCompletionSections:", v14, 0) & 1) == 0)
  {

    goto LABEL_8;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "section"));

  if (v15 == v11)
  {
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v10, "clientRankingScore");
  v17 = v16;
  v18 = (char *)objc_msgSend(v12, "indexOfObject:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "section"));
  v20 = (char *)objc_msgSend(v12, "indexOfObject:", v19);

  v21 = v18 + 1;
  do
  {
    v22 = v21 >= v20;
    if (v21 >= v20)
      break;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v21));
    -[AutocompleteItemManager clientRankingScoreOfFirstItemInSection:wrappedItems:](self, "clientRankingScoreOfFirstItemInSection:wrappedItems:", v23, v13);
    v25 = v24;

    ++v21;
  }
  while (v25 <= v17);
LABEL_9:

  return v22;
}

- (double)clientRankingScoreOfFirstItemInSection:(id)a3 wrappedItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v10 = 0.0;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "item", (_QWORD)v18));

        if (v7 == v15)
        {
          objc_msgSend(v14, "clientRankingScore");
          v10 = v16;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)logClientRankingScore:(double)a3 forItem:(id)a4 withSignalPack:(id)a5 serverScore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  char *v20;
  const __CFString *v21;
  char *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  double v47;
  __int16 v48;
  void *v49;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = sub_10043222C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

  if (v14)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedItem))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subtitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));

    }
    else
    {
      v17 = 0;
      v40 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    if (objc_msgSend(v9, "hasServerItemIndex"))
      objc_msgSend(v18, "appendFormat:", CFSTR("ServerSection,Index=%lu,%lu; "),
        objc_msgSend(v9, "serverSectionIndex"),
        objc_msgSend(v9, "serverItemIndexInSection"));
    if (v11)
    {
      objc_msgSend(v11, "normalizedScore");
      objc_msgSend(v18, "appendFormat:", CFSTR("ServerScore=%f; "), v19);
    }
    v41 = v11;
    v20 = (char *)objc_msgSend(v9, "sourceType") - 1;
    if ((unint64_t)v20 > 9)
      v21 = CFSTR("Unknown");
    else
      v21 = *(&off_1011BB7E0 + (_QWORD)v20);
    v22 = (char *)objc_msgSend(v9, "sourceSubtype");
    if ((unint64_t)(v22 - 1) > 0x23)
      v23 = CFSTR("Unknown");
    else
      v23 = *(&off_1011BB830 + (_QWORD)(v22 - 1));
    objc_msgSend(v18, "appendFormat:", CFSTR("SourceType,Subtype=%@,%@; "), v21, v23);
    v24 = objc_msgSend(v10, "itemSuggestionTypeSource");
    if (v24 >= 0xF)
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v24));
    else
      v25 = *(&off_1011BB950 + (int)v24);
    objc_msgSend(v18, "appendFormat:", CFSTR("SuggestionType=%@; "), v25);

    v26 = objc_msgSend(v10, "itemServerEntryTypeSource");
    if (v26 >= 4)
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v26));
    else
      v27 = *(&off_1011BB9C8 + (int)v26);
    objc_msgSend(v18, "appendFormat:", CFSTR("ServerEntryType=%@; "), v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "autocompleteObject"));
    v29 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
    isKindOfClass = objc_opt_isKindOfClass(v28, v29);

    if ((isKindOfClass & 1) != 0 && v28)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "autocompleteObject"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description"));
      objc_msgSend(v18, "appendFormat:", CFSTR("\nAutcompletePerson=<<%@>>;\n"), v32);

    }
    objc_msgSend(v18, "appendString:", CFSTR("Features { "));
    v33 = 1;
    v34 = -1;
    do
    {
      v35 = v34 + 1;
      if (objc_msgSend(v10, "hasValueForFeatureType:", v34 + 1))
      {
        if ((v33 & 1) == 0)
          objc_msgSend(v18, "appendString:", CFSTR("; "));
        v36 = CFSTR("Unknown");
        if (v34 <= 0x28)
          v36 = *(&off_1011BB9E8 + v34);
        objc_msgSend(v10, "valueForFeatureType:", v34 + 1);
        objc_msgSend(v18, "appendFormat:", CFSTR("%@=%f"), v36, v37);
        v33 = 0;
      }
      ++v34;
    }
    while (v35 != 41);
    objc_msgSend(v18, "appendString:", CFSTR(" }"));
    v38 = sub_10043222C();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478595;
      v43 = v40;
      v44 = 2113;
      v45 = v17;
      v46 = 2048;
      v47 = a3;
      v48 = 2112;
      v49 = v18;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "AC item title=\"%{private}@\"; subtitle=\"%{private}@\": ranking score = %f; %@",
        buf,
        0x2Au);
    }

    v11 = v41;
  }

}

- (void)logSortedItemsWithSections:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  __int128 v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  NSObject *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  __int128 v31;
  void *v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  const __CFString *v42;

  v3 = a3;
  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6 && objc_msgSend(v3, "count"))
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412546;
    v31 = v7;
    v32 = v3;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8, v31));
      v10 = sub_10043222C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
        v14 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = v31;
        v34 = (unint64_t)v12;
        v35 = 2048;
        v36 = (unint64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Displaying AC section title=\"%@\", items.count=%lu", buf, 0x16u);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        v17 = 0;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v17));

          if (objc_msgSend(v19, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedItem))
          {
            if (objc_msgSend(v19, "sourceType") == (id)4)
            {
              v20 = CFSTR("REDACTED - Contact name");
              v21 = CFSTR("REDACTED - Contact address");
            }
            else
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subtitle"));
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "value"));

            }
          }
          else
          {
            v20 = 0;
            v21 = 0;
          }
          if (objc_msgSend(v19, "isCompoundPersonalizedAutocompleteItem"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leafPersonalizedAutocompleteItems"));
            v25 = (unint64_t)objc_msgSend(v24, "count") > 1;

          }
          else
          {
            v25 = 0;
          }
          v26 = sub_10043222C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219011;
            v28 = CFSTR("NO");
            if (v25)
              v28 = CFSTR("YES");
            v34 = v8;
            v35 = 2048;
            v36 = v17;
            v37 = 2113;
            v38 = v20;
            v39 = 2113;
            v40 = v21;
            v41 = 2112;
            v42 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "AC item at DisplayedSection,Index=%lu,%lu: title=\"%{private}@\"; subtitle=\"%{private}@\"; deduped=%@",
              buf,
              0x34u);
          }

          ++v17;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
          v30 = objc_msgSend(v29, "count");

        }
        while (v17 < (unint64_t)v30);
      }

      ++v8;
      v3 = v32;
    }
    while (v8 < (unint64_t)objc_msgSend(v32, "count"));
  }

}

- (void)sortWrappedItems:(id)a3
{
  id v4;
  _QWORD v5[4];
  unsigned __int8 v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1005772D0;
    v5[3] = &unk_1011BB798;
    v6 = -[AutocompleteItemManager useClientRankingScore](self, "useClientRankingScore");
    objc_msgSend(v4, "sortWithOptions:usingComparator:", 16, v5);
  }

}

- (id)indexOfSectionWithItem:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compoundItem"));
  v6 = objc_msgSend(v5, "containsPossiblePersonalizedItemSourceType:", 1);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "autocompleteObject"));

    v9 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      if (!v8)
        goto LABEL_27;
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compoundItem", 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "items"));

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
LABEL_11:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
          if (objc_msgSend(v19, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "autocompleteObject"));
            v20 = objc_opt_class(MKLocalSearchCompletion);
            v21 = (objc_opt_isKindOfClass(v8, v20) & 1) != 0 ? v8 : 0;
            v22 = v21;

            if (v22)
              break;
          }
          if (v16 == (id)++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v16)
              goto LABEL_11;
            goto LABEL_21;
          }
        }
      }
      else
      {
LABEL_21:
        v8 = 0;
      }

      if (!v8)
        goto LABEL_27;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager completionSections](self, "completionSections"));
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      while (1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager completionSections](self, "completionSections"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndex:", v25));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "results"));
        v29 = objc_msgSend(v28, "containsObject:", v8);

        if (v29)
          break;

        ++v25;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager completionSections](self, "completionSections"));
        v31 = objc_msgSend(v30, "count");

        if (v25 >= (unint64_t)v31)
          goto LABEL_27;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));

      goto LABEL_28;
    }
LABEL_27:
    v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager interleavedSectionIndex](self, "interleavedSectionIndex"));
LABEL_29:

  return v12;
}

- (void)setCompletionSections:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *completionSections;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  completionSections = self->_completionSections;
  self->_completionSections = v5;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10057779C;
  v13 = sub_1005777AC;
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager completionSections](self, "completionSections"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005777B4;
  v8[3] = &unk_1011BB7C0;
  v8[4] = &v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  objc_storeStrong((id *)&self->_interleavedSectionIndex, (id)v10[5]);
  _Block_object_dispose(&v9, 8);

}

- (id)defaultSectionsWithCompletionSections:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  AutocompleteMutableSection *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AutocompleteMutableSection *v26;
  void *v27;
  AutocompleteMutableSection *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  AutocompleteMutableSection *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  AutocompleteMutableSection *v36;
  id v37;
  AutocompleteMutableSection *v38;
  void *v39;
  void *v40;
  AutocompleteMutableSection *v41;
  id v42;
  void *v44;
  char v45;
  id obj;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  AutocompleteMutableSection *v53;
  _BYTE v54[128];

  v4 = a3;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (!v5)
  {
    v45 = 0;
    v8 = v44;
    goto LABEL_27;
  }
  v6 = v5;
  v45 = 0;
  v7 = 0;
  v47 = *(_QWORD *)v49;
  v8 = v44;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v49 != v47)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v9);
      if (objc_msgSend(v10, "shouldInterleaveClientResults", v44))
      {
        v11 = objc_alloc((Class)NSMutableArray);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes"));
        v13 = (AutocompleteMutableSection *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes"));
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager includingRulesWithTypes:](self, "includingRulesWithTypes:", v16));

          if (objc_msgSend(v17, "count"))
            -[AutocompleteMutableSection addObjectsFromArray:](v13, "addObjectsFromArray:", v17);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleMatchingAnySourceTypeWithIndexInCompletionSections:](AutocompleteSectionRule, "ruleMatchingAnySourceTypeWithIndexInCompletionSections:", v17));
          -[AutocompleteMutableSection addObject:](v13, "addObject:", v34);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "excludedClientResultTypes"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager excludingRulesWithTypes:](self, "excludingRulesWithTypes:", v35));

        v36 = [AutocompleteMutableSection alloc];
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
        v28 = -[AutocompleteMutableSection initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:](v36, "initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:", v13, v23, v25, 0, 0);
        v45 = 1;
        goto LABEL_20;
      }
      if (!objc_msgSend(v10, "isSectionForClientOnlyResults")
        || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes")),
            v19 = objc_msgSend(v18, "count"),
            v18,
            !v19))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
        v13 = (AutocompleteMutableSection *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleWithSourceType:indexInCompletionSections:](AutocompleteSectionRule, "ruleWithSourceType:indexInCompletionSections:", 1, v29));

        v30 = -[AutocompleteItemManager topSectionIsQuerySuggestions](self, "topSectionIsQuerySuggestions");
        if (v7)
          v31 = 0;
        else
          v31 = v30;
        v32 = [AutocompleteMutableSection alloc];
        v53 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
        v33 = v31;
        v8 = v44;
        v28 = -[AutocompleteMutableSection initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:](v32, "initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:", v23, 0, v25, v33, 0);
        goto LABEL_20;
      }
      v20 = objc_alloc((Class)NSMutableArray);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes"));
      v13 = (AutocompleteMutableSection *)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "includedClientResultTypes"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager includingRulesWithTypes:](self, "includingRulesWithTypes:", v22));

      if (objc_msgSend(v23, "count"))
      {
        -[AutocompleteMutableSection addObjectsFromArray:](v13, "addObjectsFromArray:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "excludedClientResultTypes"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteItemManager excludingRulesWithTypes:](self, "excludingRulesWithTypes:", v24));

        v26 = [AutocompleteMutableSection alloc];
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
        v28 = -[AutocompleteMutableSection initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:](v26, "initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:", v13, v25, v27, 0, 1);

        v8 = v44;
LABEL_20:

        -[AutocompleteMutableSection setEnforceServerResultsOrder:](v28, "setEnforceServerResultsOrder:", objc_msgSend(v10, "enforceServerResultsOrder"));
        -[AutocompleteMutableSection setEnableMapsSuggestServerReranking:](v28, "setEnableMapsSuggestServerReranking:", objc_msgSend(v10, "enableMapsSuggestServerReranking"));
        objc_msgSend(v8, "addObject:", v28);
        ++v7;
        v13 = v28;
        goto LABEL_21;
      }

LABEL_21:
      v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    v6 = v37;
  }
  while (v37);
LABEL_27:

  if (!objc_msgSend(v8, "count") || (v45 & 1) == 0)
  {
    v38 = [AutocompleteMutableSection alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleMatchingAnySourceType](AutocompleteSectionRule, "ruleMatchingAnySourceType"));
    v52 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    v41 = -[AutocompleteMutableSection initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:](v38, "initWithRules:excludingRules:title:isQuerySuggestionsSection:isSectionForClientOnlyResults:", v40, 0, 0, 0, 0);
    objc_msgSend(v44, "addObject:", v41);

    v8 = v44;
  }
  v42 = objc_msgSend(v8, "copy", v44);

  return v42;
}

- (id)includingRulesWithTypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  AutocompleteItemManager *v12;
  id v13;

  v4 = a3;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100577E44;
  v11 = &unk_1011B3170;
  v12 = self;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v13 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12))
    v6 = objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

- (id)excludingRulesWithTypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  AutocompleteItemManager *v12;
  id v13;

  v4 = a3;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100577F5C;
  v11 = &unk_1011B3170;
  v12 = self;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v13 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12))
    v6 = objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

- (id)ruleWithClientOnlyAutocompleteType:(int)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = 6;
      goto LABEL_9;
    case 2:
      v5 = 5;
      v6 = 5;
      goto LABEL_13;
    case 3:
      v5 = 5;
      v6 = 4;
      goto LABEL_13;
    case 4:
      v5 = 7;
      v6 = 11;
      goto LABEL_13;
    case 5:
      v5 = 7;
      v6 = 9;
      goto LABEL_13;
    case 6:
      v5 = 7;
      v6 = 10;
      goto LABEL_13;
    case 7:
      v4 = 4;
LABEL_9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleWithSourceType:](AutocompleteSectionRule, "ruleWithSourceType:", v4));
      return v3;
    case 8:
      v5 = 9;
      v6 = 18;
      goto LABEL_13;
    case 12:
      v5 = 9;
      v6 = 19;
      goto LABEL_13;
    case 13:
      v5 = 3;
      v6 = 2;
LABEL_13:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleWithSourceType:sourceSubtype:](AutocompleteSectionRule, "ruleWithSourceType:sourceSubtype:", v5, v6));
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)excludingRuleWithClientOnlyAutocompleteType:(int)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = 6;
      goto LABEL_9;
    case 2:
      v5 = 5;
      v6 = 5;
      goto LABEL_13;
    case 3:
      v5 = 5;
      v6 = 4;
      goto LABEL_13;
    case 4:
      v5 = 7;
      v6 = 11;
      goto LABEL_13;
    case 5:
      v5 = 7;
      v6 = 9;
      goto LABEL_13;
    case 6:
      v5 = 7;
      v6 = 10;
      goto LABEL_13;
    case 7:
      v4 = 4;
LABEL_9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleExcludingSourceType:](AutocompleteSectionRule, "ruleExcludingSourceType:", v4));
      return v3;
    case 8:
      v5 = 9;
      v6 = 18;
      goto LABEL_13;
    case 12:
      v5 = 9;
      v6 = 19;
      goto LABEL_13;
    case 13:
      v5 = 3;
      v6 = 2;
LABEL_13:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSectionRule ruleExcludingSourceType:sourceSubtype:](AutocompleteSectionRule, "ruleExcludingSourceType:sourceSubtype:", v5, v6));
      break;
    default:
      return v3;
  }
  return v3;
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (void)setAutocompleteContext:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteContext, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)completionSections
{
  return self->_completionSections;
}

- (BOOL)topSectionIsQuerySuggestions
{
  return self->_topSectionIsQuerySuggestions;
}

- (void)setTopSectionIsQuerySuggestions:(BOOL)a3
{
  self->_topSectionIsQuerySuggestions = a3;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  return self->_shouldUseDistanceFeatureServerResults;
}

- (void)setShouldUseDistanceFeatureServerResults:(BOOL)a3
{
  self->_shouldUseDistanceFeatureServerResults = a3;
}

- (BOOL)clientRankingScoreInfluencedResults
{
  return self->_clientRankingScoreInfluencedResults;
}

- (BOOL)mapsSuggestionsIsTouristHereScoreValid
{
  return self->_mapsSuggestionsIsTouristHereScoreValid;
}

- (void)setMapsSuggestionsIsTouristHereScoreValid:(BOOL)a3
{
  self->_mapsSuggestionsIsTouristHereScoreValid = a3;
}

- (double)mapsSuggestionsIsTouristHereScore
{
  return self->_mapsSuggestionsIsTouristHereScore;
}

- (void)setMapsSuggestionsIsTouristHereScore:(double)a3
{
  self->_mapsSuggestionsIsTouristHereScore = a3;
}

- (NSNumber)interleavedSectionIndex
{
  return self->_interleavedSectionIndex;
}

- (void)setInterleavedSectionIndex:(id)a3
{
  objc_storeStrong((id *)&self->_interleavedSectionIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interleavedSectionIndex, 0);
  objc_storeStrong((id *)&self->_completionSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_autocompleteContext, 0);
}

@end
