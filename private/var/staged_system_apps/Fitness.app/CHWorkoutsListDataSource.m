@implementation CHWorkoutsListDataSource

- (CHWorkoutsListDataSource)initWithTableView:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 formattingManager:(id)a6 badgeImageFactory:(id)a7 awardsDataProvider:(id)a8
{
  id v14;
  id v15;
  CHWorkoutsListDataSource *v16;
  CHWorkoutsListDataSource *v17;
  uint64_t v18;
  NSCalendar *currentCalendar;
  CHWorkoutDataProvider *dataProvider;
  CHWorkoutDataProvider *v21;
  id WeakRetained;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v14 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v15 = a8;
  v41.receiver = self;
  v41.super_class = (Class)CHWorkoutsListDataSource;
  v16 = -[CHWorkoutsListDataSource init](&v41, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_tableView, v14);
    objc_storeStrong((id *)&v17->_dataProvider, a4);
    objc_storeStrong((id *)&v17->_fitnessAppContext, a5);
    objc_storeStrong((id *)&v17->_formattingManager, a6);
    objc_storeStrong((id *)&v17->_badgeImageFactory, a7);
    objc_storeStrong((id *)&v17->_awardsDataProvider, a8);
    v18 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar", v32, v33, v34, v35));
    currentCalendar = v17->_currentCalendar;
    v17->_currentCalendar = (NSCalendar *)v18;

    objc_initWeak(&location, v17);
    dataProvider = v17->_dataProvider;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000847B4;
    v38[3] = &unk_100777C80;
    objc_copyWeak(&v39, &location);
    -[CHWorkoutDataProvider addUpdateHandler:](dataProvider, "addUpdateHandler:", v38);
    v21 = v17->_dataProvider;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000847E0;
    v36[3] = &unk_100777C80;
    objc_copyWeak(&v37, &location);
    -[CHWorkoutDataProvider addFilterActionFinishedHandler:](v21, "addFilterActionFinishedHandler:", v36);
    WeakRetained = objc_loadWeakRetained((id *)&v17->_tableView);
    objc_msgSend(WeakRetained, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(CHListTableHeaderView, v23), CFSTR("WorkoutsListTableHeaderViewReuseIdentifier"));

    v24 = objc_loadWeakRetained((id *)&v17->_tableView);
    objc_msgSend(v24, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHListSummaryTableViewCell, v25), CFSTR("WorkoutsListSummaryTableViewCellReuseIdentifier"));

    v26 = objc_loadWeakRetained((id *)&v17->_tableView);
    objc_msgSend(v26, "registerClass:forCellReuseIdentifier:", objc_opt_class(CHWorkoutsListTableViewCell, v27), CFSTR("WorkoutsListTableViewCellReuseIdentifier"));

    v28 = objc_loadWeakRetained((id *)&v17->_tableView);
    objc_msgSend(v28, "setDataSource:", v17);

    v29 = objc_loadWeakRetained((id *)&v17->_tableView);
    objc_msgSend(v29, "setDelegate:", v17);

    if (-[CHWorkoutDataProvider dataAvailable](v17->_dataProvider, "dataAvailable"))
      -[CHWorkoutsListDataSource _reloadDataFromProvider](v17, "_reloadDataFromProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v17, "_reloadDataForVisibleCells:", UIApplicationSignificantTimeChangeNotification, 0);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (CHWorkoutsListDataSource)init
{

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListDataSource;
  -[CHWorkoutsListDataSource dealloc](&v4, "dealloc");
}

- (id)workoutForIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  id WeakRetained;
  int64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= (id)-[NSArray count](self->_sectionArray, "count")
    || (v6 = objc_msgSend(v4, "row"),
        WeakRetained = objc_loadWeakRetained((id *)&self->_tableView),
        v8 = -[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", WeakRetained, objc_msgSend(v4, "section")), WeakRetained, (uint64_t)v6 >= v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", v4));
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  CHWorkoutsListDataSourceDelegate **p_delegate;
  void *v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  if (-[NSArray count](self->_sectionArray, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", self->_currentSection));
    objc_msgSend(WeakRetained, "workoutsListDataSource:didScrollToSectionWithDateComponents:", self, v5);

  }
}

- (void)_reloadDataFromProvider
{
  NSDictionary *v3;
  NSDictionary *rowDictionary;
  NSArray *v5;
  NSArray *sectionArray;
  id WeakRetained;
  void *v8;
  id v9;

  self->_offsetsStale = 1;
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutsByMonthAndYear](self->_dataProvider, "workoutsByMonthAndYear"));
  rowDictionary = self->_rowDictionary;
  self->_rowDictionary = v3;

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
  sectionArray = self->_sectionArray;
  self->_sectionArray = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "reloadData");

  if (-[NSArray count](self->_sectionArray, "count"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", self->_currentSection));
    objc_msgSend(v9, "workoutsListDataSource:didScrollToSectionWithDateComponents:", self, v8);

  }
}

- (void)_reloadDataForFilter
{
  -[CHWorkoutsListDataSource _try_reloadDataForFilter](self, "_try_reloadDataForFilter");
}

- (void)_try_reloadDataForFilter
{
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  NSDictionary *rowDictionary;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *m;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *n;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  NSArray *sectionArray;
  uint64_t v77;
  NSDictionary *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CHWorkoutsListDataSource *v87;
  void *v88;
  id *location;
  _QWORD v90[4];
  id v91;
  CHWorkoutsListDataSource *v92;
  _QWORD v93[4];
  id v94;
  CHWorkoutsListDataSource *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[5];
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[5];
  id v110;
  id v111;
  __int128 v112;
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
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];

  self->_offsetsStale = 1;
  location = (id *)&self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "beginUpdates");

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v121 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)i);
        if (!-[NSArray containsObject:](self->_sectionArray, "containsObject:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
          v14 = objc_msgSend(v13, "indexOfObject:", v12);

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
    }
    while (v9);
  }

  if (-[NSArray count](self->_sectionArray, "count"))
  {
    v16 = 0;
    do
    {
      rowDictionary = self->_rowDictionary;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](rowDictionary, "objectForKeyedSubscript:", v18));
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
        objc_msgSend(v4, "addObject:", v21);

      }
      ++v16;
    }
    while (v16 < -[NSArray count](self->_sectionArray, "count"));
  }
  v85 = v6;
  if (-[NSArray count](self->_sectionArray, "count"))
  {
    v22 = 0;
    do
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutsByMonthAndYear](self->_dataProvider, "workoutsByMonthAndYear"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", v22));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));
      v26 = objc_msgSend(v25, "count");

      if (!v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22));
        objc_msgSend(v5, "addObject:", v27);

      }
      ++v22;
    }
    while (v22 < -[NSArray count](self->_sectionArray, "count"));
  }
  v28 = objc_alloc_init((Class)NSMutableSet);
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v29 = v5;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v117 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v4, "containsObject:", v34) & 1) == 0)
          objc_msgSend(v28, "addObject:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
    }
    while (v31);
  }

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v35 = v4;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v113;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v113 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v29, "containsObject:", v40) & 1) == 0)
          objc_msgSend(v28, "addObject:", v40);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
    }
    while (v37);
  }
  v84 = v35;

  v41 = objc_alloc_init((Class)NSMutableSet);
  v42 = objc_alloc_init((Class)NSMutableSet);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
  v44 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v43, "count")));

  v45 = -[NSArray copy](self->_sectionArray, "copy");
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_10008549C;
  v109[3] = &unk_100778F10;
  v109[4] = self;
  v46 = v28;
  v110 = v46;
  v82 = v41;
  v83 = v45;
  v111 = v82;
  objc_msgSend(v45, "enumerateObjectsUsingBlock:", v109);
  v86 = (void *)v44;
  v87 = self;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _indexPathsToRemoveWithSectionSet:](self, "_indexPathsToRemoveWithSectionSet:", v44));
  v47 = objc_msgSend(v88, "copy");
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v106;
    do
    {
      for (m = 0; m != v49; m = (char *)m + 1)
      {
        if (*(_QWORD *)v106 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)m);
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v52, "section")));
        objc_msgSend(v42, "addObject:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v52, "section")));
        v55 = objc_msgSend(v46, "containsObject:", v54);

        if (v55)
          objc_msgSend(v88, "removeObject:", v52);
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
    }
    while (v49);
  }

  v56 = objc_loadWeakRetained(location);
  objc_msgSend(v56, "deleteRowsAtIndexPaths:withRowAnimation:", v88, 5);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](v87->_dataProvider, "sortedDateComponentKeys"));
  v58 = objc_msgSend(v57, "copy");

  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1000855B8;
  v102[3] = &unk_100778F10;
  v102[4] = v87;
  v59 = v46;
  v103 = v59;
  v60 = v82;
  v104 = v60;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v102);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _indexPathsToInsertWithSectionSet:deletedIndexPaths:](v87, "_indexPathsToInsertWithSectionSet:deletedIndexPaths:", v86, v88));
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_1000856B0;
  v100[3] = &unk_100778F38;
  v62 = v42;
  v101 = v62;
  objc_msgSend(v61, "enumerateObjectsUsingBlock:", v100);
  v63 = objc_loadWeakRetained(location);
  v81 = v61;
  objc_msgSend(v63, "insertRowsAtIndexPaths:withRowAnimation:", v61, 5);

  objc_msgSend(v62, "minusSet:", v60);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "hk_map:", &stru_100778F78));
  v65 = objc_loadWeakRetained(location);
  v80 = v64;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allObjects"));
  objc_msgSend(v65, "reloadRowsAtIndexPaths:withRowAnimation:", v66, 5);

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v67 = v59;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v97;
    do
    {
      for (n = 0; n != v69; n = (char *)n + 1)
      {
        if (*(_QWORD *)v97 != v70)
          objc_enumerationMutation(v67);
        v72 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)n);
        v73 = objc_loadWeakRetained(location);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v72, "integerValue")));
        objc_msgSend(v73, "reloadSections:withRowAnimation:", v74, 5);

      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
    }
    while (v69);
  }

  v75 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](v87->_dataProvider, "sortedDateComponentKeys"));
  sectionArray = v87->_sectionArray;
  v87->_sectionArray = (NSArray *)v75;

  v77 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutsByMonthAndYear](v87->_dataProvider, "workoutsByMonthAndYear"));
  v78 = v87->_rowDictionary;
  v87->_rowDictionary = (NSDictionary *)v77;

  if (!objc_msgSend(v60, "count"))
  {
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_10008573C;
    v93[3] = &unk_100778FA0;
    v94 = v67;
    v95 = v87;
    objc_msgSend(v86, "enumerateIndexesUsingBlock:", v93);

  }
  v79 = objc_loadWeakRetained(location);
  objc_msgSend(v79, "endUpdates");

  if (objc_msgSend(v60, "count"))
  {
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000857B0;
    v90[3] = &unk_100778FA0;
    v91 = v67;
    v92 = v87;
    objc_msgSend(v86, "enumerateIndexesUsingBlock:", v90);

  }
  -[CHWorkoutsListDataSource _checkCurrentMonth](v87, "_checkCurrentMonth");

}

- (void)_reloadHeaderForSection:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "headerViewForSection:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutStatisticsForMonthAndYear](self->_dataProvider, "workoutStatisticsForMonthAndYear"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startOfMonth"));
  objc_msgSend(v11, "setDate:", v10);

}

- (id)_indexPathsToRemoveWithSectionSet:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CHWorkoutsListDataSource *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100085990;
  v8[3] = &unk_100778FA0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v8);

  v6 = v5;
  return v6;
}

- (id)_indexPathsToRemoveForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (-[NSArray count](self->_sectionArray, "count") <= a3)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutsByMonthAndYear](self->_dataProvider, "workoutsByMonthAndYear"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _indexPathAdjustedForSummaryCellForRow:inSection:](self, "_indexPathAdjustedForSummaryCellForRow:inSection:", objc_msgSend(v10, "indexOfObject:", v15), a3));
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v6 = v18;
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_indexPathsToInsertWithSectionSet:(id)a3 deletedIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  CHWorkoutsListDataSource *v15;

  v6 = a4;
  v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100085C84;
  v12[3] = &unk_100778FC8;
  v13 = v6;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v14 = v8;
  v15 = self;
  v9 = v6;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v12);

  v10 = v8;
  return v10;
}

- (id)_indexPathsToInsertForSection:(unint64_t)a3 deletedIndexPaths:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v30 = a4;
  if (-[NSArray count](self->_sectionArray, "count") <= a3)
  {
    v18 = &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (objc_msgSend(v8, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v6));
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v14 = v6;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v6));
            v16 = objc_msgSend(v15, "indexOfObject:", v13);

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _indexPathAdjustedForSummaryCellForRow:inSection:](self, "_indexPathAdjustedForSummaryCellForRow:inSection:", v16, a3));
            if (objc_msgSend(v30, "containsObject:", v17))
              objc_msgSend(v8, "removeObject:", v13);

            v6 = v14;
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v10);
      }

      v18 = objc_alloc_init((Class)NSMutableArray);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutsByMonthAndYear](self->_dataProvider, "workoutsByMonthAndYear"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v6));

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v8, "containsObject:", v26) & 1) == 0)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _indexPathAdjustedForSummaryCellForRow:inSection:](self, "_indexPathAdjustedForSummaryCellForRow:inSection:", objc_msgSend(v21, "indexOfObject:", v26), a3));
              objc_msgSend(v18, "addObject:", v27);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v23);
      }

    }
    else
    {
      v18 = &__NSArray0__struct;
    }

  }
  return v18;
}

- (void)_calculateSectionContentOffsets
{
  id WeakRetained;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
  int64_t v24;
  void *v25;
  id v26;
  char *v27;
  NSArray *v28;
  NSArray *contentOffsetsForTopOfSection;
  id v30;

  v30 = objc_alloc_init((Class)NSMutableArray);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "contentInset");
  v5 = v4;
  v6 = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(v6, "_systemContentInset");
  v8 = -(v5 + v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v30, "addObject:", v9);

  v10 = objc_loadWeakRetained((id *)&self->_tableView);
  v11 = -[CHWorkoutsListDataSource numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v10);

  if (v11 >= 2)
  {
    v12 = 0;
    do
    {
      v13 = objc_loadWeakRetained((id *)&self->_tableView);
      -[CHWorkoutsListDataSource tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", v13, v12);
      v15 = v14;

      v8 = v8 + v15;
      v16 = objc_loadWeakRetained((id *)&self->_tableView);
      v17 = -[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v16, v12);

      if (v17 >= 1)
      {
        v18 = 0;
        do
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v18, v12));
          v20 = objc_loadWeakRetained((id *)&self->_tableView);
          -[CHWorkoutsListDataSource tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v20, v19);
          v22 = v21;

          v8 = v8 + v22;
          ++v18;
          v23 = objc_loadWeakRetained((id *)&self->_tableView);
          v24 = -[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v23, v12);

        }
        while (v18 < v24);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
      objc_msgSend(v30, "addObject:", v25);

      ++v12;
      v26 = objc_loadWeakRetained((id *)&self->_tableView);
      v27 = (char *)-[CHWorkoutsListDataSource numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v26)
          - 1;

    }
    while (v12 < (uint64_t)v27);
  }
  v28 = (NSArray *)objc_msgSend(v30, "copy");
  contentOffsetsForTopOfSection = self->_contentOffsetsForTopOfSection;
  self->_contentOffsetsForTopOfSection = v28;

}

- (void)setCurrentSection:(int64_t)a3
{
  NSUInteger v4;
  unint64_t currentSection;
  void *v6;
  id v7;

  if (self->_currentSection != a3)
  {
    self->_currentSection = a3;
    v4 = -[NSArray count](self->_sectionArray, "count");
    currentSection = self->_currentSection;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource delegate](self, "delegate"));
    if (v4 <= currentSection)
    {
      objc_msgSend(v7, "workoutsListDataSource:didScrollToSectionWithDateComponents:", self, 0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", self->_currentSection));
      objc_msgSend(v7, "workoutsListDataSource:didScrollToSectionWithDateComponents:", self, v6);

    }
  }
}

- (void)_reloadDataForVisibleCells:(id)a3
{
  UITableView **p_tableView;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CHAwardsDataProvider *awardsDataProvider;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  p_tableView = &self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathsForVisibleRows"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "row"))
        {
          v12 = objc_loadWeakRetained((id *)p_tableView);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRowAtIndexPath:", v11));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", v11));
          v15 = &__NSArray0__struct;
          if (AAUIShouldUseNewTrophyCase(v14))
          {
            awardsDataProvider = self->_awardsDataProvider;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAwardsDataProvider achievementsForWorkoutIdentifier:](awardsDataProvider, "achievementsForWorkoutIdentifier:", v18));

          }
          objc_msgSend(v13, "setWorkout:fitnessAppContext:formattingManager:achievementCount:", v14, self->_fitnessAppContext, self->_formattingManager, objc_msgSend(v15, "count"));

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionArray, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  int64_t v9;

  if (!-[NSArray count](self->_sectionArray, "count", a3))
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionArray, "objectAtIndexedSubscript:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "count");

  if (v8)
    v9 = (int64_t)v8 + 1;
  else
    v9 = 0;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CHAwardsDataProvider *awardsDataProvider;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", v7));
    if (AAUIShouldUseNewTrophyCase(v8))
    {
      awardsDataProvider = self->_awardsDataProvider;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHAwardsDataProvider achievementsForWorkoutIdentifier:](awardsDataProvider, "achievementsForWorkoutIdentifier:", v11));

    }
    else
    {
      v12 = &__NSArray0__struct;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WorkoutsListTableViewCellReuseIdentifier")));
    objc_msgSend(v13, "setWorkout:fitnessAppContext:formattingManager:achievementCount:", v8, self->_fitnessAppContext, self->_formattingManager, objc_msgSend(v12, "count"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WorkoutsListSummaryTableViewCellReuseIdentifier"), v7));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentView"));
    objc_msgSend(v14, "setClipsToBounds:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutStatisticsForMonthAndYear](self->_dataProvider, "workoutStatisticsForMonthAndYear"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v8));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider currentFilteredTypeIdentifier](self->_dataProvider, "currentFilteredTypeIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager fitnessUIFormattingManager](self->_formattingManager, "fitnessUIFormattingManager"));
    objc_msgSend(v13, "setWorkoutStatistics:activityTypeKey:formattingManager:", v12, v17, v18);

  }
  objc_msgSend(v13, "setSelectionStyle:", 0);

  return v13;
}

- (BOOL)workout:(id)a3 wasOnSameDayAsWorkout:(id)a4
{
  NSCalendar *currentCalendar;
  id v6;
  void *v7;
  void *v8;

  currentCalendar = self->_currentCalendar;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));

  LOBYTE(currentCalendar) = -[NSCalendar isDate:inSameDayAsDate:](currentCalendar, "isDate:inSameDayAsDate:", v7, v8);
  return (char)currentCalendar;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (-[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3, a4) < 1)
    return 0.0;
  +[CHListTableHeaderView preferredHeight](CHListTableHeaderView, "preferredHeight");
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (-[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutStatisticsForMonthAndYear](self->_dataProvider, "workoutStatisticsForMonthAndYear"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("WorkoutsListTableHeaderViewReuseIdentifier")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startOfMonth"));
    objc_msgSend(v11, "setDate:", v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v5 = a4;
  if (objc_msgSend(v5, "row"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", v5));
    +[CHWorkoutsListTableViewCell preferredHeightForWorkout:formattingManager:](CHWorkoutsListTableViewCell, "preferredHeightForWorkout:formattingManager:", v6, self->_formattingManager);
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider workoutStatisticsForMonthAndYear](self->_dataProvider, "workoutStatisticsForMonthAndYear"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider currentFilteredTypeIdentifier](self->_dataProvider, "currentFilteredTypeIdentifier"));
    +[CHListSummaryTableViewCell heightForWorkoutActivityTypeKey:statistics:](CHListSummaryTableViewCell, "heightForWorkoutActivityTypeKey:statistics:", v12, v11);
    v8 = v13;

  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;

  v6 = a3;
  v7 = 0.0;
  if ((char *)-[NSArray count](self->_sectionArray, "count") - 1 != (_BYTE *)a4)
  {
    if (-[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
      v7 = 11.0;
    else
      v7 = 0.0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  if (objc_msgSend(v8, "row"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource delegate](self, "delegate"));
    objc_msgSend(v7, "workoutsListDataSource:didSelectWorkout:atIndexPath:", self, v6, v8);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT"), &stru_1007AE1D0, CFSTR("Localizable")));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100086D2C;
    v15[3] = &unk_100778FF0;
    objc_copyWeak(&v17, &location);
    v16 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 0, v9, v15));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    objc_msgSend(v10, "setBackgroundColor:", v11);

    v19 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v12));

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", &__NSArray0__struct));
  }

  return v13;
}

- (void)_deleteWorkoutAtIndexPath:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource _workoutForIndexPath:](self, "_workoutForIndexPath:", a3));
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "setEditing:animated:", 0, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource delegate](self, "delegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100086E48;
  v8[3] = &unk_100779018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "workoutsListDataSource:requestsDeleteConfirmationForWorkout:completion:", self, v7, v8);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  if (objc_msgSend(v6, "row"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource workoutForIndexPath:](self, "workoutForIndexPath:", v6));
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "detailViewControllerForWorkout:", v7));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100087088;
    v15[3] = &unk_100779040;
    v16 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100087090;
    v13[3] = &unk_100779090;
    v14 = v16;
    v10 = v16;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v6, v15, v13));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000872D4;
  v11[3] = &unk_1007790B8;
  v11[4] = self;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListDataSource workoutForIndexPath:](self, "workoutForIndexPath:", v8));
  v13 = v8;
  v9 = v8;
  v10 = v12;
  objc_msgSend(v7, "addCompletion:", v11);

}

- (void)_checkCurrentMonth
{
  id WeakRetained;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  NSUInteger v12;
  NSUInteger v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  id v18;

  if (self->_offsetsStale)
  {
    -[CHWorkoutsListDataSource _calculateSectionContentOffsets](self, "_calculateSectionContentOffsets");
    self->_offsetsStale = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "contentOffset");
  v5 = v4;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_contentOffsetsForTopOfSection, "firstObject"));
  if (-[NSArray count](self->_contentOffsetsForTopOfSection, "count"))
  {
    v6 = 0;
    v7 = 0;
    v8 = -1;
    v9 = v16;
    while (1)
    {
      v10 = v8 + 1;
      v17 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_contentOffsetsForTopOfSection, "objectAtIndexedSubscript:", v8 + 1));
      objc_msgSend(v17, "doubleValue");
      if (v11 > v5 && (objc_msgSend(v17, "isEqual:", v9) & 1) == 0)
        break;

      v12 = -[NSArray count](self->_contentOffsetsForTopOfSection, "count");
      v13 = v8 + 2;
      ++v8;
      v6 = v7++;
      v9 = v17;
      v14 = v13 >= v12;
      v15 = v17;
      if (v14)
        goto LABEL_12;
    }

    v15 = v9;
    v10 = v6;
  }
  else
  {
    v10 = 0;
    v15 = v16;
  }
LABEL_12:
  v18 = v15;
  -[CHWorkoutsListDataSource setCurrentSection:](self, "setCurrentSection:", v10);

}

- (id)_indexPathAdjustedForSummaryCellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3 + 1, a4);
}

- (id)_workoutForIndexPath:(id)a3
{
  NSArray *sectionArray;
  id v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;

  sectionArray = self->_sectionArray;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](sectionArray, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowDictionary, "objectForKeyedSubscript:", v6));
  v8 = (char *)objc_msgSend(v5, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8 - 1));
  return v9;
}

- (CHWorkoutsListDataSourceDelegate)delegate
{
  return (CHWorkoutsListDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)navBarBackdropGroupName
{
  return self->_navBarBackdropGroupName;
}

- (void)setNavBarBackdropGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)currentSection
{
  return self->_currentSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarBackdropGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentOffsetsForTopOfSection, 0);
  objc_storeStrong((id *)&self->_sectionArray, 0);
  objc_storeStrong((id *)&self->_rowDictionary, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
