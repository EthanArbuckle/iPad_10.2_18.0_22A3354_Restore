@implementation FMFBlockListManager

+ (id)sharedInstance
{
  if (qword_1000B3708 != -1)
    dispatch_once(&qword_1000B3708, &stru_100099C88);
  return (id)qword_1000B3700;
}

- (void)_rulesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager _rulesChanged:", v6, 2u);
  }

  -[FMFBlockListManager sanitizeBlockList](self, "sanitizeBlockList");
}

- (void)sanitizeBlockList
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager sanitizeBlockList", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followerHandles"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUPrivacyManager sharedPrivacyManager](TUPrivacyManager, "sharedPrivacyManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allBlacklistRules"));

  v9 = sub_100011D0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v6;
    v39 = 2112;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager sanitizeBlockList: %@, %@", buf, 0x16u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v33;
    *(_QWORD *)&v13 = 138412290;
    v29 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "type", v29) == 1)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "email"));
          v19 = sub_100011D0C();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v38 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Block rule exists for email: %@", buf, 0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v18));
          if (objc_msgSend(v6, "containsObject:", v21))
            objc_msgSend(v4, "addObject:", v21);
        }
        else
        {
          if (objc_msgSend(v17, "type"))
            continue;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "phoneNumber"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "unformattedInternationalRepresentation"));
          v22 = sub_100011D0C();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v38 = v21;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Block rule exists for phone: %@", buf, 0xCu);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v21));
          if (objc_msgSend(v6, "containsObject:", v24))
            objc_msgSend(v4, "addObject:", v24);

        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v4, "count"))
  {
    v25 = sub_100011D0C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Stopping offers to handles in block list: %@", buf, 0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSession sharedInstance](FMFSession, "sharedInstance"));
    v28 = FMFGroupIdOneToOne;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100020DB8;
    v30[3] = &unk_100099CB0;
    v31 = v4;
    objc_msgSend(v27, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", v31, v28, 0, v30);

  }
}

@end
