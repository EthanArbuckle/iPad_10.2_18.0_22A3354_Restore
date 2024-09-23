@implementation MOTopicAnnotationManager

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  MOEventBundle *v7;
  MOEventBundle *v9;
  void *v10;
  void *v11;
  MOAction *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  MOResource *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count") && (unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    v9 = [MOEventBundle alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v9, "initWithBundleIdentifier:creationDate:", v10, v11);

    -[MOEventBundle setInterfaceType:](v7, "setInterfaceType:", 8);
    v12 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Topic of Interest"), 1, 2);
    -[MOEventBundle setAction:](v7, "setAction:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v7, "action"));
    objc_msgSend(v15, "setSourceEventIdentifier:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scoredTopics"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayNameOfScoredTopics:", v18));

    v35 = v19;
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keysSortedByValueUsingComparator:", &__block_literal_global_44));
    v21 = v20;
    if ((unint64_t)objc_msgSend(v20, "count") >= 4)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subarrayWithRange:", 0, 3));

    }
    v34 = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", CFSTR(",")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), CFSTR("Topic of Interest"), v33));
    -[MOEventBundle setPromptLanguage:](v7, "setPromptLanguage:", v22);

    v23 = objc_opt_new(NSMutableArray);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = v21;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          v29 = -[MOResource initWithName:type:]([MOResource alloc], "initWithName:type:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v28), 8);
          -[NSMutableArray addObject:](v23, "addObject:", v29);

          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v26);
    }

    v30 = -[NSMutableArray copy](v23, "copy");
    -[MOEventBundle setResources:](v7, "setResources:", v30);

    -[MOEventBundle setEvents:](v7, "setEvents:", v5);
    -[MOEventBundle setPropertiesBasedOnEvents](v7, "setPropertiesBasedOnEvents");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    -[MOEventBundle setStartDate:](v7, "setStartDate:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    -[MOEventBundle setEndDate:](v7, "setEndDate:", v32);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

int64_t __60__MOTopicAnnotationManager_annotateBaseEvents_dateInterval___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

@end
