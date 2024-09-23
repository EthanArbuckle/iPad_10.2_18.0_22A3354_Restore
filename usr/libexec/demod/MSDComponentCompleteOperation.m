@implementation MSDComponentCompleteOperation

- (int64_t)type
{
  return 5;
}

- (void)execute
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  NSObject *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  MSDComponentCompleteOperation *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id obj;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  id v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "finishedOperationContexts"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "errors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v13 = (unint64_t)objc_msgSend(v12, "result");

  v87 = v6;
  v85 = v10;
  if (!(_DWORD)v13)
  {
    v16 = v10;
    goto LABEL_6;
  }
  if (v11)
  {
    if (+[MSDHubFeatureFlags disableBackgroundInstall](MSDHubFeatureFlags, "disableBackgroundInstall"))
    {
      v14 = 0;
      v15 = 1;
      goto LABEL_55;
    }
    v83 = self;
    v84 = v3;
    v18 = objc_alloc_init((Class)NSMutableSet);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v31 = v6;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
    if (v32)
    {
      v33 = v32;
      v82 = v13;
      v34 = *(_QWORD *)v100;
      obj = v31;
      while (2)
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v100 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "secondaryStagingRootPath"));
          if (v37 && !objc_msgSend(v36, "skipped"))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueName"));
            v40 = objc_msgSend(v18, "containsObject:", v39);

            if ((v40 & 1) == 0)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "secondaryStagingRootPath"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stashedStagingRootPath"));
              v43 = objc_msgSend(v88, "moveStagingToFinal:finalPath:", v41, v42);

              if ((v43 & 1) == 0)
              {
                v63 = sub_1000604F0();
                v64 = objc_claimAutoreleasedReturnValue(v63);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                  sub_1000C1EB4(v64, v66, v67, v68, v69, v70, v71, v72);

                v16 = 0;
                self = v83;
                v3 = v84;
                v6 = v87;
                goto LABEL_63;
              }
            }
          }
          else
          {

          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueName"));
          objc_msgSend(v18, "addObject:", v38);

          v35 = (char *)v35 + 1;
        }
        while (v33 != v35);
        v31 = obj;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
        v33 = v44;
        if (v44)
          continue;
        break;
      }
    }

LABEL_41:
    v14 = 0;
    v15 = 1;
    v6 = v87;
    goto LABEL_42;
  }
  v82 = v13;
  v83 = self;
  v84 = v3;
  v18 = objc_alloc_init((Class)NSMutableSet);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
  if (!v20)
    goto LABEL_23;
  v21 = v20;
  v22 = *(_QWORD *)v96;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v96 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "secondaryStagingRootPath"));
      if (v25)
      {
        v26 = (void *)v25;
        if (!objc_msgSend(v24, "skipped"))
        {

LABEL_20:
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "secondaryStagingRootPath"));
          objc_msgSend(v18, "addObject:", v28);

          continue;
        }
        v27 = objc_msgSend(v24, "restored");

        if ((v27 & 1) != 0)
          goto LABEL_20;
      }
    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
  }
  while (v21);
LABEL_23:

  if (!objc_msgSend(v18, "count"))
    goto LABEL_41;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
  v30 = objc_msgSend(v88, "moveStagingsToFinal:finalPath:", v29, CFSTR("/private/var/.backup"));

  v6 = v87;
  if ((v30 & 1) != 0)
  {
    v14 = 0;
    v15 = 1;
    goto LABEL_42;
  }
  v73 = sub_1000604F0();
  v74 = objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    sub_1000C1EE8(v74, v75, v76, v77, v78, v79, v80, v81);

  v16 = 0;
  self = v83;
  v3 = v84;
LABEL_63:
  v13 = v82;
LABEL_6:
  v83 = self;
  v84 = v3;
  v94 = v16;
  sub_1000B6428(&v94, 3727744768, CFSTR("An error has occurred."));
  v14 = v94;

  if (objc_msgSend(v14, "code") != (id)3727741184 && objc_msgSend(v14, "code") != (id)3727741185)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v17, "demoUpdateFailed:", v14);

  }
  v18 = (id)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
  objc_msgSend(v18, "sendContentUpdateFailureEvent:isFatal:", v14, v13);
  v15 = 0;
LABEL_42:

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v45 = v6;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(_QWORD *)v91 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)j);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stagingRootPath"));
        objc_msgSend(v4, "addObject:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "secondaryStagingRootPath"));
        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "secondaryStagingRootPath"));
          objc_msgSend(v4, "addObject:", v53);

        }
        if ((v11 & 1) == 0)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stashedStagingRootPath"));

          if (v54)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stashedStagingRootPath"));
            objc_msgSend(v4, "addObject:", v55);

          }
        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
    }
    while (v47);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(v88, "removeWorkDirectories:", v56);

  self = v83;
  v3 = v84;
LABEL_55:
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
  objc_msgSend(v57, "updateComponentProgress:withResult:withAdditionalInfo:", v86, v15, &__NSDictionary0__struct);

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
  v59 = objc_msgSend(v58, "getPercentageProgress");

  v60 = sub_1000604F0();
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v104 = v59;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "New update progress: %ld", buf, 0xCu);
  }

  if ((v11 & 1) == 0)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v62, "demoUpdateProgress:", v59);

  }
  -[MSDOperation setResult:](self, "setResult:", v15);
  -[MSDOperation setError:](self, "setError:", v14);

}

@end
