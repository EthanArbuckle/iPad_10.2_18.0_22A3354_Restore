@implementation APMetricStorage_private

+ (void)removeExpiredBatchesFromClosedPrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  void *v24;
  id obj;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v24 = v4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pathsToExpiredBatchesWithFileManager:closedPathPrefix:", v5, v4));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v8 = v6;
    v26 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138740227;
    v23 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent", v23));
        v12 = objc_msgSend(a1, "batchPathToPurpose:", v10);
        v13 = sub_100021B00();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        sub_100126604(v14, v11, v10, (uint64_t)v12);

        v15 = sub_100038BE0((uint64_t)APMetricsObservability, v10, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = APLogForCategory(29);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Removing batch due to expiration: %{private}@", buf, 0xCu);
        }

        v27 = 0;
        objc_msgSend(v5, "removeObjectAtPath:error:", v10, &v27);
        v19 = v27;
        if (v19)
        {
          v20 = APLogForCategory(29);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v33 = v10;
            v34 = 2114;
            v35 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error removing batch at (%{sensitive}@)! %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v22 = sub_100021B00();
          v21 = objc_claimAutoreleasedReturnValue(v22);
          sub_1000311CC(v21, v16, v11, (uint64_t)v12, v5, v24);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v8);
  }

}

+ (id)pathsToExpiredBatchesWithFileManager:(id)a3 closedPathPrefix:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id obj;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  id v90;

  v5 = a3;
  v6 = a4;
  v82 = 0;
  v7 = objc_msgSend(v5, "directoryExistsAtPath:error:", v6, &v82);
  v8 = v82;
  if (v8)
  {
    v9 = v8;
    goto LABEL_3;
  }
  if (!v7)
  {
    v10 = &__NSArray0__struct;
    goto LABEL_5;
  }
  v81 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, &v81));
  v12 = v81;
  if (v12)
  {
    v13 = v12;
    v14 = APLogForCategory(29);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      v88 = v6;
      v89 = 2114;
      v90 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error getting contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
    v10 = &__NSArray0__struct;
    goto LABEL_11;
  }
  if (!v9 || !objc_msgSend(v9, "count"))
  {
LABEL_3:
    v10 = &__NSArray0__struct;
    goto LABEL_4;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v53 = v9;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    }
    while (v19);
  }
  v54 = v6;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v24 = v16;
  v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  v57 = v5;
  v55 = v24;
  if (!v25)
  {
    v13 = 0;
    goto LABEL_50;
  }
  v26 = v25;
  v13 = 0;
  v27 = *(_QWORD *)v74;
  do
  {
    for (j = 0; j != v26; j = (char *)j + 1)
    {
      if (*(_QWORD *)v74 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);

      v72 = 0;
      v30 = objc_msgSend(v5, "directoryExistsAtPath:error:", v29, &v72);
      v31 = v72;
      if (v31)
      {
        v13 = v31;
        v32 = APLogForCategory(29);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138740227;
          v88 = v29;
          v89 = 2114;
          v90 = v13;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Error opening contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (!v30)
        {
          v13 = 0;
          continue;
        }
        v71 = 0;
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v29, &v71));
        v34 = v71;
        if (v34)
        {
          v13 = v34;
        }
        else if (v33 && -[NSObject count](v33, "count"))
        {
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v33 = v33;
          v35 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v68;
            do
            {
              for (k = 0; k != v36; k = (char *)k + 1)
              {
                if (*(_QWORD *)v68 != v37)
                  objc_enumerationMutation(v33);
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)k)));
                objc_msgSend(v23, "addObject:", v39);

              }
              v36 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
            }
            while (v36);
          }

          v13 = 0;
          v5 = v57;
          v24 = v55;
        }
        else
        {
          v13 = 0;
        }
      }

    }
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  }
  while (v26);
LABEL_50:

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v23;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v64;
    do
    {
      v44 = 0;
      v45 = v13;
      do
      {
        if (*(_QWORD *)v64 != v43)
          objc_enumerationMutation(obj);
        v46 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v44);
        v62 = v45;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "contentsOfDirectoryAtPath:error:", v46, &v62));
        v13 = v62;

        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10002D400;
        v61[3] = &unk_100215CC0;
        v61[4] = v46;
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mapObjectsUsingBlock:", v61));
        objc_msgSend(v40, "addObjectsFromArray:", v48);

        v44 = (char *)v44 + 1;
        v45 = v13;
      }
      while (v42 != v44);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
    }
    while (v42);
  }

  if (v13)
  {
    v49 = APLogForCategory(29);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    v9 = v53;
    v6 = v54;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      v88 = v54;
      v89 = 2114;
      v90 = v13;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Error getting contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
    v10 = &__NSArray0__struct;
LABEL_61:
    v15 = v55;

    v5 = v57;
  }
  else
  {
    v5 = v57;
    v9 = v53;
    v6 = v54;
    if (v40 && objc_msgSend(v40, "count"))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dateByAddingTimeInterval:", -604800.0));

      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10012C568;
      v58[3] = &unk_100215CE8;
      v59 = v57;
      v60 = v52;
      v50 = v52;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "filteredArrayUsingBlock:", v58));

      goto LABEL_61;
    }
    v10 = &__NSArray0__struct;
    v15 = v55;
  }

LABEL_11:
LABEL_4:

LABEL_5:
  return v10;
}

+ (int64_t)batchPathToPurpose:(id)a3
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (char *)objc_msgSend(v3, "count") - 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v5));
    v8 = 0;
    if (!objc_msgSend(v6, "scanInt:", &v8)
      || (objc_msgSend(v6, "isAtEnd") & 1) == 0
      || (v4 = v8, v8 <= 0))
    {
      APSimulateCrashNoKillProcess(5, CFSTR("Unexpected purpose: %@. Please file a radar."));
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)moveExistingOpenFilesToClosed:(id)a3 closedPrefix:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  void *k;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *obj;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  id v108;
  id v109;
  uint8_t buf[4];
  id v111;
  __int16 v112;
  NSObject *v113;
  __int16 v114;
  NSObject *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v109 = 0;
  v9 = objc_msgSend(v8, "directoryExistsAtPath:error:", v6, &v109);
  v10 = v109;
  if (v10)
  {
    v71 = v10;
    v11 = APLogForCategory(29);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      v111 = v6;
      v112 = 2114;
      v113 = v71;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error determining status of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
LABEL_80:

    v13 = v71;
LABEL_81:

    goto LABEL_82;
  }
  if (v9)
  {
    v108 = 0;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, &v108));
    v14 = v108;
    if (v14)
    {
      v12 = v14;
      v71 = v13;
      v15 = APLogForCategory(29);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138740227;
        v111 = v6;
        v112 = 2114;
        v113 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error getting contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
      }
LABEL_79:

      goto LABEL_80;
    }
    if (!v13)
      goto LABEL_81;
    v17 = v13;
    if (!-[NSObject count](v13, "count"))
      goto LABEL_81;
    v76 = v7;
    v77 = a1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v71 = v17;
    v19 = v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v105 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      }
      while (v21);
    }
    v70 = v6;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v26 = v18;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
    v80 = v8;
    obj = v26;
    if (!v27)
    {
      v29 = 0;
      v7 = v76;
      goto LABEL_48;
    }
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v101;
    v7 = v76;
    while (1)
    {
      v31 = 0;
      v32 = v29;
      do
      {
        if (*(_QWORD *)v101 != v30)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v31);

        v99 = 0;
        v34 = objc_msgSend(v8, "directoryExistsAtPath:error:", v33, &v99);
        v35 = v99;
        if (v35)
        {
          v36 = v35;
          v37 = APLogForCategory(29);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138740227;
            v111 = v33;
            v112 = 2114;
            v32 = v36;
            v113 = v36;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Error opening contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
          }
          else
          {
            v32 = v36;
          }
LABEL_29:

          v8 = v80;
          goto LABEL_30;
        }
        if (v34)
        {
          v98 = 0;
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v33, &v98));
          v39 = v98;
          if (v39)
          {
            v32 = v39;
          }
          else if (v38 && -[NSObject count](v38, "count"))
          {
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            v38 = v38;
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v95;
              do
              {
                for (j = 0; j != v41; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v95 != v42)
                    objc_enumerationMutation(v38);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j)));
                  objc_msgSend(v25, "addObject:", v44);

                }
                v41 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
              }
              while (v41);
            }

            v32 = 0;
            v7 = v76;
          }
          else
          {
            v32 = 0;
          }
          goto LABEL_29;
        }
        v32 = 0;
LABEL_30:
        v31 = (char *)v31 + 1;
      }
      while (v31 != v28);
      v29 = v32;
      v26 = obj;
      v45 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
      v28 = v45;
      if (!v45)
      {
LABEL_48:

        v93 = 0u;
        v91 = 0u;
        v92 = 0u;
        v90 = 0u;
        v46 = v25;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
        if (!v47)
        {
          v6 = v70;
          v12 = v29;
          goto LABEL_78;
        }
        v48 = v47;
        v49 = *(_QWORD *)v91;
        v6 = v70;
        v12 = v29;
        v68 = *(_QWORD *)v91;
        v69 = v46;
        while (1)
        {
          v50 = 0;
          v72 = v48;
          do
          {
            if (*(_QWORD *)v91 != v49)
            {
              v51 = v50;
              objc_enumerationMutation(v46);
              v50 = v51;
            }
            v75 = v50;
            v52 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v50);

            v89 = 0;
            v81 = v52;
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v52, &v89));
            v54 = v89;
            v74 = v53;
            if (v54)
            {
              v12 = v54;
              v55 = APLogForCategory(29);
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138740227;
                v111 = v81;
                v112 = 2114;
                v113 = v12;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Error getting contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (!v53 || !objc_msgSend(v53, "count"))
              {
                v12 = 0;
                goto LABEL_74;
              }
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v56 = v53;
              v82 = -[NSObject countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
              if (v82)
              {
                v83 = 0;
                v78 = *(_QWORD *)v86;
                v79 = v56;
                do
                {
                  for (k = 0; k != v82; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v86 != v78)
                      objc_enumerationMutation(v56);
                    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)k)));
                    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "substringFromIndex:", objc_msgSend(v58, "rangeOfString:", CFSTR("/"))));
                    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v59));

                    v61 = sub_100126C58((uint64_t)APMetricsObservability, v58, v8);
                    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
                    v63 = objc_msgSend(v77, "_countEventsInBatch:", v58);

                    v84 = 0;
                    LOBYTE(v59) = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v58, v60, &v84);
                    v83 = v84;
                    if ((v59 & 1) != 0)
                    {
                      v64 = sub_100021B00();
                      v65 = objc_claimAutoreleasedReturnValue(v64);
                      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lastPathComponent"));
                      sub_100126A4C(v65, v62, v66, (uint64_t)objc_msgSend(v77, "batchPathToPurpose:", v58), (uint64_t)v63, v80, v7);

                      v8 = v80;
                    }
                    else
                    {
                      v67 = APLogForCategory(29);
                      v65 = objc_claimAutoreleasedReturnValue(v67);
                      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138740483;
                        v111 = v58;
                        v112 = 2117;
                        v113 = v60;
                        v114 = 2114;
                        v115 = v83;
                        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Error moving file from (%{sensitive}@) to (%{sensitive}@)! %{public}@", buf, 0x20u);
                      }
                      v7 = v76;
                    }
                    v56 = v79;

                  }
                  v82 = -[NSObject countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
                }
                while (v82);
                v46 = v69;
                v6 = v70;
                v12 = v83;
                v49 = v68;
                v48 = v72;
              }
              else
              {
                v12 = 0;
              }
            }

LABEL_74:
            v50 = v75 + 1;
          }
          while ((id)(v75 + 1) != v48);
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
          if (!v48)
          {
LABEL_78:

            v16 = obj;
            goto LABEL_79;
          }
        }
      }
    }
  }
LABEL_82:

}

+ (void)shelveClosedForChannel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  _QWORD v48[3];
  _QWORD v49[3];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v49[0] = CFSTR("c");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v49[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "purpose")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v49[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v9));

  v48[0] = CFSTR("s");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
  v48[1] = v12;
  v35 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "purpose")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
  v48[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v15));

  v42 = 0;
  v17 = objc_msgSend(v4, "directoryExistsAtPath:error:", v10, &v42);
  v18 = v42;
  if (v18)
  {
    v19 = v18;
    v20 = APLogForCategory(29);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v45 = v10;
      v46 = 2114;
      v47 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Error determining status of closed storage directory (%{private}@)! %{public}@", buf, 0x16u);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (v17)
  {
    v41 = 0;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v10, &v41));
    v22 = v41;
    if (v22)
    {
      v19 = v22;
      v23 = APLogForCategory(29);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        v45 = v10;
        v46 = 2114;
        v47 = v19;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Error accessing files in (%{private}@)! %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v24 = v21;
      v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v25)
      {
        v26 = v25;
        v34 = v21;
        v19 = 0;
        v27 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v29));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v29));
            v36 = 0;
            objc_msgSend(v4, "moveItemAtPath:toPath:error:", v30, v31, &v36);
            v19 = v36;

            if (v19)
            {
              v32 = APLogForCategory(29);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v19;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Error shelved file. %{public}@", buf, 0xCu);
              }

            }
          }
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v26);
        v21 = v34;
      }
      else
      {
        v19 = 0;
      }
    }

    goto LABEL_23;
  }
  v19 = 0;
LABEL_24:

}

+ (id)metricsFileManager
{
  return objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
}

+ (id)signedPathFromUnsigned:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@/"), CFSTR("ws")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@/"), CFSTR("ns")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v5, v4));

  return v6;
}

+ (id)preparedDataPathForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5
{
  const __CFString *v5;

  v5 = CFSTR("ns");
  if (a5)
    v5 = CFSTR("ws");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@/%ld"), CFSTR("p"), a3, v5, a4);
}

+ (int64_t)_countEventsInBatch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = objc_msgSend(objc_alloc(+[MetricsModuleClasses batchClass](MetricsModuleClasses, "batchClass")), "initWithPath:", v3);
  v6 = -1;
  do
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextMetric"));

    ++v6;
  }
  while (v7);

  objc_autoreleasePoolPop(v4);
  return v6;
}

@end
