@implementation RAPSubmissionStatusSyncHandler

- (void)fetchUnresolvedRAPIdentifiersWithBatchSize:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6
{
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008F4CA0;
  v11[3] = &unk_1011DA8E0;
  v12 = a6;
  v13 = a4;
  v10 = v12;
  -[RAPSubmissionStatusSyncHandler _fetchUnresolvedRAPRecordsWithLimit:offset:oldestDate:completion:](self, "_fetchUnresolvedRAPRecordsWithLimit:offset:oldestDate:completion:", a3, a4, a5, v11);

}

- (void)_fetchUnresolvedRAPRecordsWithLimit:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("((status == 0) || (status == 2)) && reportId != ''"), 0));
  v13 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync13MapsSyncRange), "initWithOffset:limit:", a4, a3);
  v14 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v12, 0, v13);
  objc_initWeak(&location, self);
  v15 = objc_alloc_init((Class)MSRAPRecordRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008F51F0;
  v17[3] = &unk_1011B21F8;
  objc_copyWeak(&v19, &location);
  v16 = v11;
  v18 = v16;
  objc_msgSend(v15, "fetchWithOptions:completionHandler:", v14, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)setFixedProblemAsReviewed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "problemStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "problemId"));
  v7 = sub_1008F5030();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "problemId"));
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received notification for fixed RAP: %@", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "problemId"));
    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008F54C4;
    v13[3] = &unk_1011B1BE0;
    v14 = v5;
    -[RAPSubmissionStatusSyncHandler setIdentifiersAsReviewed:completion:](self, "setIdentifiersAsReviewed:completion:", v12, v13);

    v9 = v14;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Received notification for fixed RAP with nil GEORPProblemStatus problemID. Problem status: %@", buf, 0xCu);
  }

}

- (void)setIdentifiersAsReviewed:(id)a3 completion:(id)a4
{
  -[RAPSubmissionStatusSyncHandler _updateRAPStatusWithIdentifiers:toStatus:extraEditBlock:completion:](self, "_updateRAPStatusWithIdentifiers:toStatus:extraEditBlock:completion:", a3, 1, 0, a4);
}

- (void)updateRAPsStatusWithRapInfos:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v36;
  __int128 *v37;
  _QWORD v38[4];
  NSObject *v39;
  __int128 *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  __int128 *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  __int128 *p_buf;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[4];
  NSMutableArray *v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE v64[128];

  v5 = a3;
  v33 = a4;
  v6 = sub_1008F5030();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updating RAP submissions with RapInfos:%@", (uint8_t *)&buf, 0xCu);
  }

  v8 = objc_opt_new(NSMutableArray);
  v9 = objc_opt_new(NSMutableArray);
  v10 = objc_opt_new(NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend(v16, "rapDisplayMenu");
        switch(v17)
        {
          case 1u:
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapId"));
            -[NSMutableArray addObject:](v10, "addObject:", v18);
            break;
          case 3u:
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapId"));
            -[NSMutableArray addObject:](v9, "addObject:", v18);
            break;
          case 2u:
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapId"));
            -[NSMutableArray addObject:](v8, "addObject:", v18);
            break;
          default:
            goto LABEL_15;
        }

LABEL_15:
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapResponse"));
        v20 = v19 == 0;

        if (!v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapResponse"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rapId"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v13);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v60 = 0x3032000000;
  v61 = sub_1008F5B88;
  v62 = sub_1008F5B98;
  v63 = 0;
  v23 = dispatch_group_create();
  v24 = sub_1008F5030();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v57 = 138412290;
    v58 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Array of RAP submissions that have been Reviewed: %@", v57, 0xCu);
  }

  dispatch_group_enter(v23);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1008F5BA0;
  v51[3] = &unk_1011DB7D0;
  v26 = v11;
  v52 = v26;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1008F5C30;
  v48[3] = &unk_1011B8360;
  p_buf = &buf;
  v27 = v23;
  v49 = v27;
  -[RAPSubmissionStatusSyncHandler _updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:](self, "_updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:", v8, 1, 1, v51, v48);
  v28 = sub_1008F5030();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v57 = 138412290;
    v58 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Array of RAP submissions that in \"Tell Us More\" statuses: %@", v57, 0xCu);
  }

  if (-[NSMutableArray count](v9, "count"))
  {
    dispatch_group_enter(v27);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1008F5C84;
    v46[3] = &unk_1011DB7D0;
    v47 = v26;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1008F5D14;
    v43[3] = &unk_1011B8360;
    v45 = &buf;
    v44 = v27;
    -[RAPSubmissionStatusSyncHandler _updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:](self, "_updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:", v9, 2, 1, v46, v43);

  }
  v30 = sub_1008F5030();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v57 = 138412290;
    v58 = v10;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Array of RAP submissions that in \"In Review\" statuses: %@", v57, 0xCu);
  }

  if (-[NSMutableArray count](v10, "count"))
  {
    dispatch_group_enter(v27);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1008F5D68;
    v41[3] = &unk_1011DB7D0;
    v42 = v26;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1008F5DF8;
    v38[3] = &unk_1011B8360;
    v40 = &buf;
    v39 = v27;
    -[RAPSubmissionStatusSyncHandler _updateRAPStatusWithIdentifiers:toStatus:extraEditBlock:completion:](self, "_updateRAPStatusWithIdentifiers:toStatus:extraEditBlock:completion:", v10, 0, v41, v38);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008F5E4C;
  block[3] = &unk_1011AE540;
  v36 = v33;
  v37 = &buf;
  v32 = v33;
  dispatch_group_notify(v27, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&buf, 8);
}

- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 extraEditBlock:(id)a5 completion:(id)a6
{
  -[RAPSubmissionStatusSyncHandler _updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:](self, "_updateRAPStatusWithIdentifiers:toStatus:forceUpdate:extraEditBlock:completion:", a3, a4, 0, a5, a6);
}

- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 extraEditBlock:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  int v20;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = sub_1008F5030();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = 134218240;
    v18 = objc_msgSend(v12, "count");
    v19 = 1024;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Updating %lu RAPs status to: %d", (uint8_t *)&v17, 0x12u);
  }

  -[RAPSubmissionStatusSyncHandler _updateMapsSyncRAPRecordWithIdentifiers:toStatus:forceUpdate:editBlock:completion:](self, "_updateMapsSyncRAPRecordWithIdentifiers:toStatus:forceUpdate:editBlock:completion:", v12, v10, v9, v14, v13);
}

- (void)_updateMapsSyncRAPRecordWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 editBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  int v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int16 v25;
  id location;
  id v27;
  id v28;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v12, "count"))
  {
    if (v9)
    {
      v28 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("reportId IN %@"), v15));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("status != %d"), v10));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR(" AND reportId IN %@")));

      v27 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", v15, v18));

    }
    v19 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v16, 0, 0);
    objc_initWeak(&location, self);
    v20 = objc_alloc_init((Class)MSRAPRecordRequest);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1008F6214;
    v21[3] = &unk_1011DB7F8;
    v22 = v14;
    v23 = v13;
    v25 = v10;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v20, "fetchWithOptions:completionHandler:", v19, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  }

}

- (void)saveIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)MSRAPRecord);
  objc_msgSend(v7, "setReportId:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v13 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008F6650;
  v11[3] = &unk_1011AE218;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "saveWithObjects:completionHandler:", v9, v11);

}

@end
