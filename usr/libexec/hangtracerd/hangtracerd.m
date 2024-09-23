void sub_100001E98(int a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;

  if (qword_10005F958)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a2);
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple."))
      && (objc_msgSend((id)qword_10005F958, "containsObject:", v4) & 1) == 0)
    {
      v5 = sub_100018DA4(a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = v6;
      if (!v6 || (v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"))) == 0)
        v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a2);
      v9 = sub_100024FF4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = a2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "adding %s to force-quit monitoring list", buf, 0xCu);
      }

      v11 = qword_10005F968;
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_100003580;
      v20 = &unk_10004CD00;
      v21 = v4;
      v12 = v8;
      v22 = v12;
      dispatch_sync(v11, &v17);
      if (qword_10005F930)
      {
        objc_msgSend((id)qword_10005F930, "updateConfiguration:", &stru_10004CB70, v17, v18, v19, v20, v21);
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", &stru_10004CB70, v17, v18, v19, v20, v21));
        v14 = (void *)qword_10005F930;
        qword_10005F930 = v13;

        if (!qword_10005F930)
        {
          v15 = sub_100024FF4();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to create process monitor", buf, 2u);
          }

        }
      }

    }
  }
}

void sub_1000020C8(id a1, RBSProcessMonitorConfiguring *a2)
{
  RBSProcessMonitorConfiguring *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v3, "setValues:", 1);
  v7 = FBSSceneVisibilityEndowmentNamespace;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(v3, "setEndowmentNamespaces:", v4);

  -[RBSProcessMonitorConfiguring setStateDescriptor:](v2, "setStateDescriptor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifiers:](RBSProcessPredicate, "predicateMatchingBundleIdentifiers:", qword_10005F958));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
  -[RBSProcessMonitorConfiguring setPredicates:](v2, "setPredicates:", v6);

  -[RBSProcessMonitorConfiguring setEvents:](v2, "setEvents:", 1);
  -[RBSProcessMonitorConfiguring setUpdateHandler:](v2, "setUpdateHandler:", &stru_10004CBB0);

}

void sub_1000021F4(id a1, RBSProcessMonitor *a2, RBSProcessHandle *a3, RBSProcessStateUpdate *a4)
{
  RBSProcessMonitor *v6;
  RBSProcessHandle *v7;
  RBSProcessStateUpdate *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  HTForceQuitRecord *v25;
  void *v26;
  void *v27;
  HTForceQuitRecord *v28;
  void *v29;
  NSObject *v30;
  HTForceQuitRecord *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD *v61;
  _QWORD v62[5];
  _QWORD block[4];
  id v64;
  __int128 *p_buf;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  _QWORD v70[4];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _QWORD v81[2];
  _QWORD v82[2];
  __int128 buf;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate exitEvent](v8, "exitEvent"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "process"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "process"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "executablePath"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
    v18 = sub_100024FF4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "process"));
      LODWORD(buf) = 67109120;
      DWORD1(buf) = objc_msgSend(v20, "pid");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Process %d terminating", (uint8_t *)&buf, 8u);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "status"));
    if (objc_msgSend(v21, "domain") == 10)
    {
      v22 = sub_100024FF4();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v21, "code");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Exit code: 0x%llx", (uint8_t *)&buf, 0xCu);
      }

      if (objc_msgSend(v21, "code") == (id)3735943697)
      {
        v25 = objc_alloc_init(HTForceQuitRecord);
        -[HTForceQuitRecord setBundleId:](v25, "setBundleId:", v13);
        -[HTForceQuitRecord setExecutablePath:](v25, "setExecutablePath:", v16);
        -[HTForceQuitRecord setAbsoluteTime:](v25, "setAbsoluteTime:", mach_absolute_time());
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "process"));
        -[HTForceQuitRecord setPid:](v25, "setPid:", objc_msgSend(v26, "pid"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[HTForceQuitRecord setCalendarTime:](v25, "setCalendarTime:", v27);

        v28 = v25;
        -[HTForceQuitRecord setExpirationMSec:](v28, "setExpirationMSec:", qword_10005F4A8);
        v29 = (void *)dispatch_time(0, 1000000 * -[HTForceQuitRecord expirationMSec](v28, "expirationMSec"));
        v30 = qword_10005F968;
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v84 = (uint64_t)sub_100005040;
        v85 = (uint64_t (*)(uint64_t, uint64_t))&unk_10004CE60;
        v86 = (void (*)(uint64_t))v28;
        v87 = v29;
        v31 = v28;
        dispatch_sync(v30, &buf);

      }
    }

  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate previousState](v8, "previousState"));
    if (objc_msgSend(v32, "isRunning"))
    {

    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate state](v8, "state"));
      v34 = objc_msgSend(v33, "isRunning");

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate process](v8, "process"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bundle"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));

        v38 = mach_absolute_time();
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v84 = 0x3032000000;
        v85 = sub_100002A10;
        v86 = sub_100002A20;
        v87 = 0;
        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = sub_100002A10;
        v79 = sub_100002A20;
        v80 = 0;
        v71 = 0;
        v72 = &v71;
        v73 = 0x2020000000;
        v74 = 0;
        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x2020000000;
        v70[3] = 0;
        v39 = qword_10005F968;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100002A28;
        block[3] = &unk_10004CBD8;
        p_buf = &buf;
        v56 = v37;
        v64 = v56;
        v66 = v70;
        v67 = &v71;
        v68 = &v75;
        v69 = v38;
        dispatch_sync(v39, block);
        if (*((_BYTE *)v72 + 24))
        {
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_100002DC0;
          v62[3] = &unk_10004CC00;
          v62[4] = &buf;
          dispatch_async((dispatch_queue_t)qword_10005F970, v62);
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_100002F58;
          v59[3] = &unk_10004CC28;
          v60 = v56;
          v61 = v70;
          AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.force-quit-detection"), v59);
          v40 = objc_alloc_init((Class)UNMutableNotificationContent);
          v41 = v76[5];
          v42 = (void *)qword_10005F938;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "calendarTime"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringFromDate:", v43));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ was recently force-quit at %@ and was immediately relaunched. Did you encounter a problem?"), v41, v44));
          objc_msgSend(v40, "setBody:", v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
          objc_msgSend(v40, "setSound:", v46);

          objc_msgSend(v40, "setThreadIdentifier:", CFSTR("com.apple.hangtracerd.usernotifications.force-quit"));
          objc_msgSend(v40, "setCategoryIdentifier:", CFSTR("com.apple.hangtracerd.usernotifications.force-quit"));
          objc_msgSend(v40, "setShouldBackgroundDefaultAction:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
          objc_msgSend(v40, "setExpirationDate:", v47);

          v81[0] = CFSTR("pid");
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pid")));
          v81[1] = CFSTR("absoluteTime");
          v82[0] = v48;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "absoluteTime")));
          v82[1] = v49;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 2));
          objc_msgSend(v40, "setUserInfo:", v50);

          objc_msgSend(v40, "setTitle:", CFSTR("Kill-and-Relaunch Detection"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("com.apple.hangtracerd.usernotifications.force-quit"), objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pid")));
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v51, v40, 0, 5));

          v53 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "notificationCenter"));
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_100003024;
          v57[3] = &unk_10004CCD8;
          v55 = v52;
          v58 = v55;
          objc_msgSend(v54, "getNotificationSettingsWithCompletionHandler:", v57);

        }
        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v75, 8);

        _Block_object_dispose(&buf, 8);
      }
    }
  }

}

void sub_1000029C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Block_object_dispose((const void *)(v43 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002A10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002A20(uint64_t a1)
{

}

void sub_100002A28(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = (id)qword_10005F948;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40), "bundleId"));
        v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 72);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                      - (_QWORD)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40), "absoluteTime");
          if (sub_1000273EC(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) < (double)(unint64_t)qword_10005F4A8)
          {
            v12 = sub_100024FF4();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
              *(_DWORD *)buf = 136315138;
              v34 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "App %s relaunched", buf, 0xCu);
            }

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F960, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v17 = *(void **)(v16 + 40);
            *(_QWORD *)(v16 + 40) = v15;

            objc_msgSend((id)qword_10005F948, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
            if ((unint64_t)objc_msgSend((id)qword_10005F950, "count") >= 8)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F950, "objectAtIndexedSubscript:", 0));
              v19 = objc_msgSend(v18, "pid");
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("com.apple.hangtracerd.usernotifications.force-quit"), v19, (_QWORD)v29));
              objc_msgSend((id)qword_10005F950, "removeObjectAtIndex:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "notificationCenter"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v20));
              objc_msgSend(v22, "removePendingNotificationRequestsWithIdentifiers:", v23);

              v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "notificationCenter"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v20));
              objc_msgSend(v25, "removeDeliveredNotificationsWithIdentifiers:", v26);

              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filePath"));
              if (v27)
              {
                v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filePath")));
                unlink((const char *)objc_msgSend(v28, "UTF8String"));

              }
            }
            objc_msgSend((id)qword_10005F950, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
            goto LABEL_18;
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

LABEL_18:
}

void sub_100002DC0(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pid");
  v3 = (void *)qword_10005F960;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "bundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "executablePath"));
  v12 = 0;
  LODWORD(v2) = +[HTTailspin saveTailspinForForceQuitProcessID:procName:procPath:filePath:](HTTailspin, "saveTailspinForForceQuitProcessID:procName:procPath:filePath:", v2, v5, v6, &v12);
  v7 = v12;

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setFilePath:", v7);
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pid");
      v11 = objc_msgSend((id)qword_10005F950, "count");
      *(_DWORD *)buf = 67109376;
      v14 = v10;
      v15 = 1024;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Dumped tailspin for pid %d, now total pending records %u", buf, 0xEu);
    }

  }
}

id sub_100002F58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSNumber *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v7[0] = CFSTR("mode");
  v7[1] = CFSTR("bundleid");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v8[0] = CFSTR("detection");
  v8[1] = v1;
  v7[2] = CFSTR("timegap");
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1000273EC(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 24)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

  return v5;
}

void sub_100003024(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;

  v3 = objc_msgSend(a2, "authorizationStatus");
  if (v3 == (id)2)
  {
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "monitorForForceQuit_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s notification previously authorized", buf, 0xCu);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notificationCenter](v5, "notificationCenter"));
    objc_msgSend(v8, "addNotificationRequest:withCompletionHandler:", *(_QWORD *)(a1 + 32), &stru_10004CC68);

  }
  else if (v3 == (id)1)
  {
    v4 = sub_100024FF4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "monitorForForceQuit_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification previously denied, will not post", buf, 0xCu);
    }
  }
  else
  {
    v9 = sub_100024FF4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "monitorForForceQuit_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s requesting provisional notification authorization", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notificationCenter"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100003334;
    v13[3] = &unk_10004CCB0;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v12, "requestAuthorizationWithOptions:completionHandler:", 68, v13);

    v5 = v14;
  }

}

void sub_100003254(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  NSError *v11;

  v2 = a2;
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      v6 = "Notification dispatch failed: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    v6 = "Notification dispatched";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

}

void sub_100003334(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  id v16;

  v5 = a3;
  if (!a2)
  {
    v10 = sub_100024FF4();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v11)
        goto LABEL_11;
      v15 = 138412290;
      v16 = v5;
      v12 = "Notification authorization error: %@";
      v13 = v8;
      v14 = 12;
    }
    else
    {
      if (!v11)
        goto LABEL_11;
      LOWORD(v15) = 0;
      v12 = "Notification newly denied";
      v13 = v8;
      v14 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    goto LABEL_11;
  }
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification granted", (uint8_t *)&v15, 2u);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notificationCenter](v8, "notificationCenter"));
  objc_msgSend(v9, "addNotificationRequest:withCompletionHandler:", *(_QWORD *)(a1 + 32), &stru_10004CC88);

LABEL_11:
}

void sub_1000034A0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  NSError *v11;

  v2 = a2;
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      v6 = "Notification dispatch failed: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    v6 = "Notification dispatched";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

}

id sub_100003580(uint64_t a1)
{
  objc_msgSend((id)qword_10005F958, "addObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)qword_10005F960, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_1000035B8()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("FileRadarAction"), CFSTR("File a radar"), 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("DismissAction"), CFSTR("Dismiss"), 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Internal.Classic/Application%20Debugging/ForceQuitTailspinDump")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:url:options:](UNNotificationAction, "actionWithIdentifier:title:url:options:", CFSTR("MoreOptionAction"), CFSTR("Settings"), v2, 0));

  v7[0] = v0;
  v7[1] = v1;
  v7[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.hangtracerd.usernotifications.force-quit"), v4, &__NSArray0__struct, 1));

  return v5;
}

Block_layout *sub_100003714()
{
  return &stru_10004CD40;
}

void sub_100003720(id a1, UNNotificationResponse *a2)
{
  UNNotificationResponse *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFDictionary *v21;
  __CFUserNotification *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  const __CFDictionary *v38;
  __CFUserNotification *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  NSObject *v45;
  void *v46;
  _QWORD v47[6];
  CFOptionFlags responseFlags;
  _QWORD block[8];
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  id v65;
  _QWORD v66[6];
  _QWORD v67[6];
  _QWORD v68[8];
  _QWORD v69[8];
  __int128 v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t v75[4];
  id v76;
  _QWORD v77[2];
  __int128 buf;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse notification](v2, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.hangtracerd.usernotifications.force-quit"));

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse notification](v2, "notification"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("pid")));
    LODWORD(v7) = objc_msgSend(v11, "intValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("absoluteTime")));
    v13 = objc_msgSend(v12, "longLongValue");

    *(_QWORD *)&v70 = 0;
    *((_QWORD *)&v70 + 1) = &v70;
    v71 = 0x3032000000;
    v72 = sub_100002A10;
    v73 = sub_100002A20;
    v74 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = sub_100002A10;
    v63 = sub_100002A20;
    v64 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003FDC;
    block[3] = &unk_10004CD68;
    v50 = (int)v7;
    block[4] = &v70;
    block[5] = &v51;
    block[6] = &v59;
    block[7] = v13;
    dispatch_sync((dispatch_queue_t)qword_10005F968, block);
    if (!*((_BYTE *)v52 + 24))
    {
LABEL_29:
      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(&v59, 8);

      _Block_object_dispose(&v70, 8);
      goto LABEL_30;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
    v15 = objc_msgSend(v14, "isEqualToString:", UNNotificationDefaultActionIdentifier);

    if (v15)
    {
      v69[0] = CFSTR("Kill-and-Relaunch");
      v68[0] = kCFUserNotificationAlertHeaderKey;
      v68[1] = kCFUserNotificationAlertMessageKey;
      v16 = v60[5];
      v17 = (void *)qword_10005F938;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 40), "calendarTime"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringFromDate:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ was recently force-quit at %@ and was immediately relaunched. Did you encounter a problem?"), v16, v19));
      v69[1] = v20;
      v69[2] = CFSTR("File a radar");
      v68[2] = kCFUserNotificationDefaultButtonTitleKey;
      v68[3] = kCFUserNotificationAlternateButtonTitleKey;
      v69[3] = CFSTR("Dismiss");
      v69[4] = CFSTR("Settings");
      v68[4] = kCFUserNotificationOtherButtonTitleKey;
      v68[5] = kCFUserNotificationAlertTopMostKey;
      v69[5] = &__kCFBooleanTrue;
      v69[6] = &__kCFBooleanTrue;
      v68[6] = SBUserNotificationForcesModalAlertAppearance;
      v68[7] = SBUserNotificationDisplayActionButtonOnLockScreen;
      v69[7] = &__kCFBooleanTrue;
      v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 8));

      v22 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, 0, v21);
      responseFlags = 0;
      CFUserNotificationReceiveResponse(v22, 0.0, &responseFlags);
      if (v22)
        CFRelease(v22);
      v23 = sub_100024FF4();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = responseFlags;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "User selected %lu", (uint8_t *)&buf, 0xCu);
      }

      if (responseFlags == 2)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Internal.Classic/Application%20Debugging/ForceQuitTailspinDump")));
        v77[0] = FBSOpenApplicationOptionKeyUnlockDevice;
        v77[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
        *(_QWORD *)&buf = &__kCFBooleanTrue;
        *((_QWORD *)&buf + 1) = &__kCFBooleanTrue;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &buf, v77, 2));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v65 = 0;
        objc_msgSend(v34, "openSensitiveURL:withOptions:error:", v32, v33, &v65);
        v35 = v65;

        if (v35)
        {
          v36 = sub_100024FF4();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v75 = 138412290;
            v76 = v35;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to open settings: %@", v75, 0xCu);
          }

        }
      }
      else if (!responseFlags)
      {
        *((_BYTE *)v56 + 24) = 1;
      }
      goto LABEL_23;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
    if ((objc_msgSend(v29, "isEqualToString:", UNNotificationDismissActionIdentifier) & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
      if (!objc_msgSend(v30, "isEqualToString:", CFSTR("DismissAction")))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
        v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("FileRadarAction"));

        if ((v41 & 1) == 0)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
          v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("MoreOptionAction"));

          if ((v43 & 1) == 0)
          {
            v44 = sub_100024FF4();
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Unknown action identifier %@", (uint8_t *)&buf, 0xCu);

            }
            goto LABEL_29;
          }
          goto LABEL_24;
        }
        goto LABEL_17;
      }

    }
LABEL_17:
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](v2, "actionIdentifier"));
    v31 = -[__CFDictionary isEqualToString:](v21, "isEqualToString:", CFSTR("FileRadarAction"));
    *((_BYTE *)v56 + 24) = v31;
LABEL_23:

LABEL_24:
    if (*((_BYTE *)v56 + 24))
    {
      v66[0] = kCFUserNotificationAlertMessageKey;
      v66[1] = kCFUserNotificationDefaultButtonTitleKey;
      v67[0] = CFSTR("Was the issue a hang?");
      v67[1] = CFSTR("Yes, a hang");
      v66[2] = kCFUserNotificationAlternateButtonTitleKey;
      v66[3] = kCFUserNotificationAlertTopMostKey;
      v67[2] = CFSTR("No, not a hang");
      v67[3] = &__kCFBooleanTrue;
      v66[4] = SBUserNotificationForcesModalAlertAppearance;
      v66[5] = SBUserNotificationDisplayActionButtonOnLockScreen;
      v67[4] = &__kCFBooleanTrue;
      v67[5] = &__kCFBooleanTrue;
      v38 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 6));
      v39 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, 0, v38);
      *(_QWORD *)&buf = 0;
      CFUserNotificationReceiveResponse(v39, 0.0, (CFOptionFlags *)&buf);
      if (v39)
        CFRelease(v39);
      objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 40), "setIsHang:", buf == 0);

    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100004204;
    v47[3] = &unk_10004CDB8;
    v47[4] = &v70;
    v47[5] = &v55;
    dispatch_async((dispatch_queue_t)qword_10005F970, v47);
    goto LABEL_29;
  }
  v25 = sub_100024FF4();
  v10 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse notification](v2, "notification"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "request"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    LODWORD(v70) = 138412290;
    *(_QWORD *)((char *)&v70 + 4) = v28;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unrecognized request identifier %@", (uint8_t *)&v70, 0xCu);

  }
LABEL_30:

}

void sub_100003F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_100003FDC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  unsigned int v25;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    v23 = v4;
    v24 = 1024;
    v25 = objc_msgSend((id)qword_10005F950, "count");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Looking for record with pid %d, total %u records", buf, 0xEu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)qword_10005F950;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9));
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pid", (_QWORD)v17) == *(_DWORD *)(a1 + 64)
          && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "absoluteTime") == *(id *)(a1 + 56))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          v12 = (void *)qword_10005F960;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 40), "bundleId"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          objc_msgSend((id)qword_10005F950, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
          goto LABEL_14;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

LABEL_14:
}

void sub_100004204(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  unsigned int v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  _QWORD v44[3];
  char v45;
  uint8_t v46[4];
  id v47;
  _QWORD v48[2];
  __int128 v49;
  _QWORD v50[8];
  __int128 buf;
  void *v52;
  void *v53;
  id v54;
  const __CFString *v55;
  const __CFString *v56;
  void *v57;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "filePath"));

  if (v2)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v3 = sub_100024FF4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40), "filePath"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Filing a radar with file %@", (uint8_t *)&buf, 0xCu);

      }
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000048C0;
      v39[3] = &unk_10004CD90;
      v39[4] = *(_QWORD *)(a1 + 32);
      AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.force-quit-detection"), v39);
      v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v37 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("1299292"));
      v7 = objc_alloc((Class)NSMutableString);
      v8 = (void *)qword_10005F960;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
      v36 = objc_msgSend(v7, "initWithString:", v10);

      if (objc_msgSend(v6, "isHang"))
        objc_msgSend(v37, "appendFormat:", CFSTR(",%@"), CFSTR("1299293"));
      v50[0] = CFSTR("BundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleId"));
      *(_QWORD *)&buf = v11;
      v50[1] = CFSTR("Classification");
      v12 = objc_msgSend(v6, "isHang");
      v13 = &stru_10004F0D8;
      if (v12)
        v13 = CFSTR("Crash/Hang/Data Loss");
      *((_QWORD *)&buf + 1) = v13;
      v50[2] = CFSTR("Attachments");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePath"));
      v52 = v14;
      v50[3] = CFSTR("Title");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Force Quit] I killed %@ and relaunched it because..."), v36));
      v53 = v15;
      v50[4] = CFSTR("Keywords");
      v50[5] = CFSTR("DeleteOnAttach");
      v54 = v37;
      v55 = CFSTR("1");
      v56 = CFSTR("1");
      v50[6] = CFSTR("IncludeDevicePrefixInTitle");
      v50[7] = CFSTR("TimeOfIssue");
      v16 = (void *)qword_10005F940;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromDate:", v17));
      v57 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &buf, v50, 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19));

      if (objc_msgSend(v6, "isHang"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("com.apple.HangTracer.HangLogsDiagnosticExtension"), CFSTR("ExtensionIdentifiers"));
      v21 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("tap-to-radar://new?"));
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v45 = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100005084;
      v41[3] = &unk_10004CE88;
      v43 = v44;
      v22 = v21;
      v42 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v23));

      v25 = sub_100024FF4();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LODWORD(v49) = 138412290;
        *(_QWORD *)((char *)&v49 + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "URL string is %@", (uint8_t *)&v49, 0xCu);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
      v48[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v48[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      *(_QWORD *)&v49 = &__kCFBooleanTrue;
      *((_QWORD *)&v49 + 1) = &__kCFBooleanTrue;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, v48, 2));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v40 = 0;
      objc_msgSend(v29, "openURL:withOptions:error:", v27, v28, &v40);
      v30 = v40;

      if (v30)
      {
        v31 = sub_100024FF4();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 138412290;
          v47 = v30;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Error launching Tap-To-Radar for force-quit notification interaction: %@", v46, 0xCu);
        }

      }
      _Block_object_dispose(v44, 8);

    }
    else
    {
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "filePath")));
      unlink((const char *)objc_msgSend(v38, "UTF8String"));

    }
  }
  else
  {
    v33 = sub_100024FF4();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pid");
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "File for pid %d not found, tailspin generation likely failed", (uint8_t *)&buf, 8u);
    }

  }
}

void sub_100004888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000048C0(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("mode");
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isHang"))
    v2 = CFSTR("hang");
  else
    v2 = CFSTR("nonhang");
  v6[1] = CFSTR("bundleid");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "bundleId"));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_100004994()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;

  if (qword_10005F980 != -1)
    dispatch_once(&qword_10005F980, &stru_10004CDF8);
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v1 = objc_msgSend(v0, "forceQuitDetectionThresholdMSec");
  qword_10005F4A8 = v1;
  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Force-quit detection threshold set to %llu ms", (uint8_t *)&v14, 0xCu);
  }

  v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = (void *)qword_10005F958;
  qword_10005F958 = (uint64_t)v4;

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)qword_10005F960;
  qword_10005F960 = (uint64_t)v6;

  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005F968);
  v9 = (void *)qword_10005F978;
  qword_10005F978 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10005F978, &stru_10004CE18);
  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)qword_10005F948;
  qword_10005F948 = (uint64_t)v10;

  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = (void *)qword_10005F950;
  qword_10005F950 = (uint64_t)v12;

  dispatch_resume((dispatch_object_t)qword_10005F978);
}

void sub_100004B38(id a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  id v10;

  sub_100019200(CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/"));
  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_10005F938;
  qword_10005F938 = (uint64_t)v1;

  objc_msgSend((id)qword_10005F938, "setDateFormat:", CFSTR("MM/dd/yyyy HH:mm:ss"));
  v3 = objc_alloc_init((Class)NSDateFormatter);
  v4 = (void *)qword_10005F940;
  qword_10005F940 = (uint64_t)v3;

  objc_msgSend((id)qword_10005F940, "setDateFormat:", CFSTR("yyyy.MM.dd_HH-mm-ss"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.queue"), CFSTR("com.apple.hangtracer.force-quit-detection"))));
  v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
  v7 = (void *)qword_10005F968;
  qword_10005F968 = (uint64_t)v6;

  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.slow-task-queue"), CFSTR("com.apple.hangtracer.force-quit-detection"))));
  v8 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
  v9 = (void *)qword_10005F970;
  qword_10005F970 = (uint64_t)v8;

}

void sub_100004C50(id a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  double v6;
  id v7;
  NSObject *v8;
  _DWORD v9[2];

  v1 = mach_absolute_time();
  if (objc_msgSend((id)qword_10005F948, "count"))
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F948, "objectAtIndexedSubscript:", v2));
      if (v1 <= (unint64_t)objc_msgSend(v5, "absoluteTime")
        || (v6 = sub_1000273EC(v1 - (_QWORD)objc_msgSend(v5, "absoluteTime")),
            v6 >= (double)(unint64_t)objc_msgSend(v5, "expirationMSec")))
      {
        ++v3;
        objc_msgSend((id)qword_10005F948, "removeObjectAtIndex:", v2);
        --v4;
      }

      v2 = ++v4;
    }
    while ((unint64_t)objc_msgSend((id)qword_10005F948, "count") > v4);
  }
  else
  {
    v3 = 0;
  }
  v7 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removed %u expired force-quit records", (uint8_t *)v9, 8u);
  }

}

void sub_100004DA8()
{
  void *v0;
  void *v1;

  if (qword_10005F978)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10005F978);
    v0 = (void *)qword_10005F978;
    qword_10005F978 = 0;

  }
  if (qword_10005F930)
  {
    objc_msgSend((id)qword_10005F930, "invalidate");
    v1 = (void *)qword_10005F930;
    qword_10005F930 = 0;

  }
  if (qword_10005F968)
    dispatch_sync((dispatch_queue_t)qword_10005F968, &stru_10004CE38);
}

void sub_100004E18(id a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v1 = (void *)qword_10005F948;
  qword_10005F948 = 0;

  v2 = (void *)qword_10005F950;
  if (qword_10005F950)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = (id)qword_10005F950;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend((id)qword_10005F948, "removeObject:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("com.apple.hangtracerd.usernotifications.force-quit"), objc_msgSend(v7, "pid")));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notificationCenter"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8));
          objc_msgSend(v10, "removePendingNotificationRequestsWithIdentifiers:", v11);

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "notificationCenter"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8));
          objc_msgSend(v13, "removeDeliveredNotificationsWithIdentifiers:", v14);

          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filePath")));
          unlink((const char *)objc_msgSend(v15, "UTF8String"));

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v4);
    }

    v2 = (void *)qword_10005F950;
  }
  qword_10005F950 = 0;

}

void sub_100005040(uint64_t a1)
{
  objc_msgSend((id)qword_10005F948, "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_source_set_timer((dispatch_source_t)qword_10005F978, *(_QWORD *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_100005084(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    *(_BYTE *)(v6 + 24) = 0;
  else
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("&"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@=%@"), v7, v5);

}

UNNotificationCategory *sub_100005104()
{
  return +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.hangtracerd.usernotifications.hang-log"), &__NSArray0__struct, &__NSArray0__struct, 0);
}

void sub_100005128(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  double v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v8 = objc_msgSend(v7, "shouldUpdateHangsHUD");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v10 = objc_msgSend(v9, "isInternal");

    if (!v10)
    {
      v13 = CFSTR("settings-navigation://com.apple.Settings.Developer/HANGTRACER_EXTERNAL_CONFIGURE/");
      goto LABEL_6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v12 = (double)objc_msgSend(v11, "hudThresholdMSec");

    if (v12 <= a3)
    {
      v13 = CFSTR("settings-navigation://com.apple.Settings.Internal.Classic/HANGTRACER/");
LABEL_6:
      v14 = objc_alloc_init((Class)UNMutableNotificationContent);
      v15 = v5;
      v16 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v16, "setNumberStyle:", 0);
      v17 = sub_100005444(CFSTR("HANG_LOG_NOTIFICATION_SUMMARY_MILLISECONDS%@%@"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromNumber:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v20, v15));

      objc_msgSend(v14, "setBody:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
      objc_msgSend(v14, "setSound:", v22);

      objc_msgSend(v14, "setThreadIdentifier:", CFSTR("com.apple.hangtracerd.usernotifications.hang-log"));
      objc_msgSend(v14, "setCategoryIdentifier:", CFSTR("com.apple.hangtracerd.usernotifications.hang-log"));
      objc_msgSend(v14, "setInterruptionLevel:", 0);
      v23 = sub_100005444(CFSTR("HANG_DETECTED"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v14, "setTitle:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v6));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
      objc_msgSend(v14, "setDefaultActionURL:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.hangtracerd.usernotifications.hang-log"), v15));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v27, v14, 0));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "notificationCenter"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100005648;
      v32[3] = &unk_10004CCD8;
      v33 = v28;
      v31 = v28;
      objc_msgSend(v30, "getNotificationSettingsWithCompletionHandler:", v32);

    }
  }

}

id sub_100005444(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
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
  void *v17;

  v1 = a1;
  if (qword_10005F990 != -1)
    dispatch_once(&qword_10005F990, &stru_10004CEE8);
  v2 = (id)qword_10005F988;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thirdPartyDevPreferredLanguages"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thirdPartyDevPreferredLanguages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "languageCode"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizations"));
    v17 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v1, &stru_10004F0D8, CFSTR("InfoPlist"), v14));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_10004F0D8, CFSTR("InfoPlist")));
  }

  return v15;
}

void sub_100005648(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;

  v3 = objc_msgSend(a2, "authorizationStatus");
  if (v3 == (id)2)
  {
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s notification previously authorized", buf, 0xCu);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notificationCenter](v5, "notificationCenter"));
    objc_msgSend(v8, "addNotificationRequest:withCompletionHandler:", *(_QWORD *)(a1 + 32), &stru_10004CEA8);

  }
  else if (v3 == (id)1)
  {
    v4 = sub_100024FF4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification previously denied, will not post", buf, 0xCu);
    }
  }
  else
  {
    v9 = sub_100024FF4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s requesting provisional notification authorization", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notificationCenter"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005958;
    v13[3] = &unk_10004CCB0;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v12, "requestAuthorizationWithOptions:completionHandler:", 68, v13);

    v5 = v14;
  }

}

void sub_100005878(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  NSError *v11;

  v2 = a2;
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      v6 = "Notification dispatch failed: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    v6 = "Notification dispatched";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

}

void sub_100005958(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  id v16;

  v5 = a3;
  if (!a2)
  {
    v10 = sub_100024FF4();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v11)
        goto LABEL_11;
      v15 = 138412290;
      v16 = v5;
      v12 = "Notification authorization error: %@";
      v13 = v8;
      v14 = 12;
    }
    else
    {
      if (!v11)
        goto LABEL_11;
      LOWORD(v15) = 0;
      v12 = "Notification newly denied";
      v13 = v8;
      v14 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    goto LABEL_11;
  }
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification granted", (uint8_t *)&v15, 2u);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notificationCenter](v8, "notificationCenter"));
  objc_msgSend(v9, "addNotificationRequest:withCompletionHandler:", *(_QWORD *)(a1 + 32), &stru_10004CEC8);

LABEL_11:
}

void sub_100005AC4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  NSError *v11;

  v2 = a2;
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      v6 = "Notification dispatch failed: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    v6 = "Notification dispatched";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }

}

void sub_100005BA4(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.hangtracerd.usernotifications.bundle"), 0));
  v1 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v3));
  v2 = (void *)qword_10005F988;
  qword_10005F988 = v1;

}

void sub_100005CDC()
{
  id v0;
  NSObject *v1;
  void *v2;
  uint8_t v3[16];

  v0 = sub_100024FF4();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v3, 2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F9A0, "transaction"));
  if (v2)
    objc_msgSend((id)qword_10005F9A0, "setTransaction:", 0);
}

void sub_100006640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_100006694(id a1)
{
  HTFixedSizeQueue *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v1 = -[HTFixedSizeQueue initWithSize:]([HTFixedSizeQueue alloc], "initWithSize:", 128);
  v2 = (void *)qword_10005F9A0;
  qword_10005F9A0 = (uint64_t)v1;

  if (!qword_10005F9A0)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to instantiate queue to hold process launch and exit records, exiting", v5, 2u);
    }

    exit(12);
  }
}

void sub_100006DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  dispatch_source_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  dispatch_source_t v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  id v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  void *v50;
  void *v51;
  unsigned int v52;
  id v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  id v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  unsigned int v66;
  id v67;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  dispatch_source_t v75;
  void *v76;
  dispatch_time_t v77;
  void *v78;
  void *v79;
  unsigned int v80;
  dispatch_source_t v81;
  void *v82;
  dispatch_time_t v83;
  void *v84;
  unsigned __int8 v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  NSObject *v105;
  const __CFString *v106;
  id v107;
  NSObject *v108;
  const __CFString *v109;
  id v110;
  NSObject *v111;
  id v112;
  NSObject *v113;
  HUDConfiguration *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  NSObject *v120;
  void *v121;
  id v122;
  NSObject *v123;
  id v124;
  void *v125;
  uint64_t v126;
  void *v127;
  unsigned __int8 v128;
  id v129;
  NSObject *v130;
  NSObject *v131;
  void *v132;
  unsigned __int8 v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  id v139;
  NSObject *v140;
  id v141;
  NSObject *v142;
  _xpc_connection_s *v143;
  id v144;
  NSObject *v145;
  void *v146;
  unsigned __int8 v147;
  id v148;
  _QWORD handler[4];
  _xpc_connection_s *v150;
  uint8_t buf[4];
  uint64_t v152;
  __int16 v153;
  id v154;

  if (objc_msgSend(CFSTR("com.apple.hangtracer.htprefs.refreshed"), "isEqualToString:"))
  {
    v4 = sub_100024FF4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v152 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling notification: %@", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v7 = objc_msgSend(v6, "memoryLoggingEnabled");

    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Memory Logging Enabled", buf, 2u);
      }

      if (!qword_10005F9D0)
      {
        v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100060538);
        v12 = (void *)qword_10005F9D0;
        qword_10005F9D0 = (uint64_t)v11;

        dispatch_source_set_event_handler((dispatch_source_t)qword_10005F9D0, &stru_10004CFF0);
        sub_10000A008();
        dispatch_resume((dispatch_object_t)qword_10005F9D0);
      }
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Memory Logging Disabled", buf, 2u);
      }

      if (qword_10005F9D0)
      {
        dispatch_source_cancel((dispatch_source_t)qword_10005F9D0);
        v13 = (void *)qword_10005F9D0;
        qword_10005F9D0 = 0;

      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v15 = objc_msgSend(v14, "hangtracerDaemonEnabled");

    v16 = sub_100024FF4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Enabled", buf, 2u);
      }

      if (!launch_service_stats_enable("com.apple.hangtracerd", 128))
      {
        v19 = sub_100024FF4();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          sub_10002D97C();

      }
      if (!qword_10005F9D8)
      {
        v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100060538);
        v22 = (void *)qword_10005F9D8;
        qword_10005F9D8 = (uint64_t)v21;

        v23 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer((dispatch_source_t)qword_10005F9D8, v23, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
        dispatch_source_set_event_handler((dispatch_source_t)qword_10005F9D8, &stru_10004D010);
        dispatch_resume((dispatch_object_t)qword_10005F9D8);
      }
      if (qword_10005FA08 != -1)
        dispatch_once(&qword_10005FA08, &stru_10004D030);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      if ((objc_msgSend(v24, "forceQuitDetectionEnabled") & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v26 = objc_msgSend(v25, "isInternal");

        if (v26)
        {
          v27 = sub_100024FF4();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Force Quit Detection Enabled", buf, 2u);
          }

          if ((byte_10005FA10 & 1) == 0)
          {
            byte_10005FA10 = 1;
            sub_100004994();
          }
          goto LABEL_45;
        }
      }
      else
      {

      }
      v34 = sub_100024FF4();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Force Quit Detection Disabled", buf, 2u);
      }

      if (byte_10005FA10 == 1)
      {
        byte_10005FA10 = 0;
        sub_100004DA8();
      }
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Disabled", buf, 2u);
      }

      +[HTProcessInfo stopWatchingAllPids](HTProcessInfo, "stopWatchingAllPids");
      if (byte_10005FA10 == 1)
      {
        byte_10005FA10 = 0;
        sub_100004DA8();
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "notificationCenter"));

      objc_msgSend(v30, "removeAllPendingNotificationRequests");
      objc_msgSend(v30, "removeAllDeliveredNotifications");

      if (!launch_service_stats_disable("com.apple.hangtracerd"))
      {
        v31 = sub_100024FF4();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          sub_10002D9A8();

      }
      if (qword_10005F9D8)
      {
        dispatch_source_cancel((dispatch_source_t)qword_10005F9D8);
        v33 = (void *)qword_10005F9D8;
        qword_10005F9D8 = 0;

      }
    }
LABEL_45:
    v36 = sub_100024FF4();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "hangtracerd compiled without App Activation Logging", buf, 2u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v39 = objc_msgSend(v38, "slowAppActivationTailspinEnabled");

    if (v39)
    {
      v40 = sub_100024FF4();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Slow App Activation Tailspins Enabled", buf, 2u);
      }

      +[HTTailspin resetDailyActivationTailspinCounts](HTTailspin, "resetDailyActivationTailspinCounts");
      +[HTTailspin resetAppActivationTailspinCounts](HTTailspin, "resetAppActivationTailspinCounts");
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v43 = objc_msgSend(v42, "eplEnabledProfile");

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v45 = objc_msgSend(v44, "eplEnabled");

    v46 = sub_100024FF4();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    v48 = v47;
    if (v43)
    {
      if (v45)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          sub_10002D924();
LABEL_58:

        goto LABEL_66;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "EPL is not enabled by PLDE, but enabled by profile, attempting to persist and unredact logs", buf, 2u);
      }

      v49 = 1;
    }
    else
    {
      if (v45)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          sub_10002D950();
        goto LABEL_58;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "EPL is not enabled by PLDE, and not enabled by profile, attempting to restore os_log state", buf, 2u);
      }

      v49 = 0;
    }
    sub_100019538(v49);
LABEL_66:
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[STYSignpostsMonitor sharedMonitor](STYSignpostsMonitor, "sharedMonitor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v52 = objc_msgSend(v51, "signpostMonitoringEnabled");

    v53 = sub_100024FF4();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
    if (!v52)
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Signpost Monitoring Disabled", buf, 2u);
      }

      objc_msgSend(v50, "stopMonitoringSignposts");
LABEL_78:
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v61 = objc_msgSend(v60, "appLaunchMonitoringEnabled");

      v62 = sub_100024FF4();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      v64 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
      if (v61)
      {
        if (v64)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "App Launch Monitoring Enabled", buf, 2u);
        }

        objc_msgSend(v50, "monitorAppLaunchSignposts");
        v52 = 1;
      }
      else
      {
        if (v64)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "App Launch Monitoring Disabled", buf, 2u);
        }

        objc_msgSend(v50, "stopMonitoringAppLaunchSignposts");
      }
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v66 = objc_msgSend(v65, "workflowResponsivenessEnabled");

      v67 = sub_100024FF4();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
      if (v66)
      {
        if (v69)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Workflow Responsiveness Monitoring Enabled", buf, 2u);
        }

        v70 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v71 = objc_msgSend(v70, "workflowResponsivenessDailyLogLimit");
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v73 = objc_msgSend(v72, "workflowResponsivenessPerPeriodLogLimit");
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        objc_msgSend(v50, "monitorWorkflowsWithDailyLogLimit:perPeriodLogLimit:periodLengthSec:", v71, v73, (int)sub_100027440((unint64_t)objc_msgSend(v74, "reportPeriodMATU")));

      }
      else
      {
        if (v69)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Workflow Responsiveness Monitoring Disabled", buf, 2u);
        }

        objc_msgSend(v50, "stopMonitoringWorkflows");
      }
      if (v52)
      {
        if (!qword_10005F9E8)
        {
          v75 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100060538);
          v76 = (void *)qword_10005F9E8;
          qword_10005F9E8 = (uint64_t)v75;

          v77 = dispatch_time(0, 60000000000);
          dispatch_source_set_timer((dispatch_source_t)qword_10005F9E8, v77, 0xDF8475800uLL, 0x3B9ACA00uLL);
          dispatch_source_set_event_handler((dispatch_source_t)qword_10005F9E8, &stru_10004D050);
          dispatch_resume((dispatch_object_t)qword_10005F9E8);
        }
      }
      else if (qword_10005F9E8)
      {
        dispatch_source_cancel((dispatch_source_t)qword_10005F9E8);
        v78 = (void *)qword_10005F9E8;
        qword_10005F9E8 = 0;

      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v80 = objc_msgSend(v79, "shouldUpdateHangsHUD");

      if (v80)
      {
        if ((byte_10005F9B0 & 1) == 0)
        {
          if (!qword_10005F9E0)
          {
            v81 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100060540);
            v82 = (void *)qword_10005F9E0;
            qword_10005F9E0 = (uint64_t)v81;

            v83 = dispatch_time(0, 50000000);
            dispatch_source_set_timer((dispatch_source_t)qword_10005F9E0, v83, 0x2FAF080uLL, 0x2FAF080uLL);
            dispatch_source_set_event_handler((dispatch_source_t)qword_10005F9E0, &stru_10004D070);
            dispatch_resume((dispatch_object_t)qword_10005F9E0);
          }
          byte_10005F9B0 = 1;
        }
      }
      else if (!byte_10005F9B0)
      {
        goto LABEL_107;
      }
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v85 = objc_msgSend(v84, "shouldUpdateHangsHUD");

      if ((v85 & 1) == 0)
      {
        byte_10005F9B0 = 0;
        if (qword_10005F9E0)
        {
          dispatch_source_cancel((dispatch_source_t)qword_10005F9E0);
          v86 = (void *)qword_10005F9E0;
          qword_10005F9E0 = 0;

        }
        sub_100024D3C(0);
      }
LABEL_107:
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      if ((objc_msgSend(v87, "hangtracerDaemonEnabled") & 1) == 0)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        if ((objc_msgSend(v88, "forceQuitDetectionEnabled") & 1) == 0)
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          if ((objc_msgSend(v89, "memoryLoggingEnabled") & 1) == 0)
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
            if ((objc_msgSend(v90, "appActivationLoggingEnabled") & 1) == 0)
            {
              v91 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
              if ((objc_msgSend(v91, "signpostMonitoringEnabled") & 1) == 0)
              {
                v92 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                if ((objc_msgSend(v92, "workflowResponsivenessEnabled") & 1) == 0)
                {
                  v135 = v50;
                  v136 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v147 = objc_msgSend(v136, "appLaunchMonitoringEnabled");

                  v50 = v135;
                  if ((v147 & 1) == 0)
                  {
                    v137 = sub_100024FF4();
                    v138 = objc_claimAutoreleasedReturnValue(v137);
                    if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "Triggering cleanup of the spool directory on exit", buf, 2u);
                    }

                    sub_100008070(1);
                    v139 = sub_100024FF4();
                    v140 = objc_claimAutoreleasedReturnValue(v139);
                    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "hangtracerd will exit. All sources turned off", buf, 2u);
                    }

                    if ((byte_10005F9B1 & 1) == 0)
                    {
                      v141 = sub_100024FF4();
                      v142 = objc_claimAutoreleasedReturnValue(v141);
                      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "hangtracerd is setting up xpc connection and handler before exiting", buf, 2u);
                      }

                      handler[0] = _NSConcreteStackBlock;
                      handler[1] = 3221225472;
                      handler[2] = sub_100008694;
                      handler[3] = &unk_10004CF30;
                      v143 = xpc_connection_create_mach_service("com.apple.hangtracerd", (dispatch_queue_t)qword_100060538, 1uLL);
                      v150 = v143;
                      xpc_connection_set_event_handler(v143, handler);
                      xpc_connection_resume(v143);

                    }
                    v144 = sub_100024FF4();
                    v145 = objc_claimAutoreleasedReturnValue(v144);
                    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "hangtracerd is exiting", buf, 2u);
                    }

                    exit(0);
                  }
LABEL_119:
                  v93 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v94 = objc_msgSend(v93, "areProcessTerminationsMonitored");

                  if (!qword_10005F9C0)
                  {
                    v95 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                    v96 = objc_claimAutoreleasedReturnValue(+[HTProcessExitFilteringConfiguration configurationFromPrefs:](HTProcessExitFilteringConfiguration, "configurationFromPrefs:", v95));
                    v97 = (void *)qword_10005F9C0;
                    qword_10005F9C0 = v96;

                  }
                  v98 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v99 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessExitFilteringConfiguration configurationFromPrefs:](HTProcessExitFilteringConfiguration, "configurationFromPrefs:", v98));

                  v100 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v101 = objc_msgSend(v100, "runloopHangTimeoutDurationMSec");

                  v102 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "thirdPartyDevPreferredLanguages"));

                  if (byte_10005F9B2 == (_DWORD)v94
                    && v101 == (id)qword_10005F9B8
                    && objc_msgSend(v103, "isEqualToArray:", off_10005F570)
                    && (objc_msgSend(v99, "isEqual:", qword_10005F9C0) & 1) != 0)
                  {
                    v104 = sub_100024FF4();
                    v105 = objc_claimAutoreleasedReturnValue(v104);
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                    {
                      v106 = CFSTR("Disabled");
                      if ((_DWORD)v94)
                        v106 = CFSTR("Enabled");
                      *(_DWORD *)buf = 138412290;
                      v152 = (uint64_t)v106;
                      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "Process Terminations: no changes (%@)", buf, 0xCu);
                    }
                    goto LABEL_155;
                  }
                  v107 = sub_100024FF4();
                  v108 = objc_claimAutoreleasedReturnValue(v107);
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                  {
                    v109 = CFSTR("Disabled");
                    if ((_DWORD)v94)
                      v109 = CFSTR("Enabled");
                    *(_DWORD *)buf = 138412290;
                    v152 = (uint64_t)v109;
                    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "Process Terminations: %@", buf, 0xCu);
                  }

                  v110 = sub_100024FF4();
                  v111 = objc_claimAutoreleasedReturnValue(v110);
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134217984;
                    v152 = (uint64_t)v101;
                    _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "HTPrefs.sharedPrefs.timeoutDurationPrevious is now %llu", buf, 0xCu);
                  }
                  v146 = v50;

                  v112 = sub_100024FF4();
                  v113 = objc_claimAutoreleasedReturnValue(v112);
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v152 = (uint64_t)v103;
                    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "HTPrefs.sharedPrefs.thirdPartyDevPreferredLanguages is now %@", buf, 0xCu);
                  }

                  v114 = [HUDConfiguration alloc];
                  v115 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v116 = objc_msgSend(v115, "runloopHangTimeoutDurationMSec");
                  v117 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "thirdPartyDevPreferredLanguages"));
                  v105 = -[HUDConfiguration initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:](v114, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:", v116, v118, v94, v99);

                  v119 = sub_100024FF4();
                  v120 = objc_claimAutoreleasedReturnValue(v119);
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                    sub_10002D8F8();

                  v121 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](HangHUDClient, "sharedInstance"));
                  objc_msgSend(v121, "sendHudConfiguration:completion:", v105, &stru_10004CF50);

                  byte_10005F9B2 = (char)v94;
                  qword_10005F9B8 = (uint64_t)v101;
                  objc_storeStrong((id *)&off_10005F570, v103);
                  objc_storeStrong((id *)&qword_10005F9C0, v99);
                  if ((_DWORD)v94)
                  {
                    if (qword_10005F9C8)
                    {
                      v50 = v146;
LABEL_155:

                      return;
                    }
                    v125 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](HangHUDClient, "sharedInstance"));
                    v126 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "obtainKeepHangHUDAliveAssertion:", CFSTR("HangHUD keep alive assertion from hangtracerd")));
                    v127 = (void *)qword_10005F9C8;
                    qword_10005F9C8 = v126;

                    v148 = 0;
                    v128 = objc_msgSend((id)qword_10005F9C8, "acquireWithError:", &v148);
                    v124 = v148;
                    v129 = sub_100024FF4();
                    v130 = objc_claimAutoreleasedReturnValue(v129);
                    v131 = v130;
                    if ((v128 & 1) != 0)
                    {
                      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134217984;
                        v152 = qword_10005F9C8;
                        _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "Acquired keepHangHUDAliveAssertion: %p", buf, 0xCu);
                      }
                    }
                    else if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                    {
                      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F9C8, "target"));
                      *(_DWORD *)buf = 138412546;
                      v152 = (uint64_t)v134;
                      v153 = 2114;
                      v154 = v124;
                      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "Failed to acquire keepHangHUDAliveAssertion in hangtracerd for target %@: %{public}@", buf, 0x16u);

                    }
                    v50 = v146;
                  }
                  else
                  {
                    v50 = v146;
                    if (!qword_10005F9C8)
                      goto LABEL_155;
                    v122 = sub_100024FF4();
                    v123 = objc_claimAutoreleasedReturnValue(v122);
                    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134217984;
                      v152 = qword_10005F9C8;
                      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "Invalidating keepHangHUDAliveAssertion: %p", buf, 0xCu);
                    }

                    objc_msgSend((id)qword_10005F9C8, "invalidate");
                    v124 = (id)qword_10005F9C8;
                    qword_10005F9C8 = 0;
                  }

                  goto LABEL_155;
                }

              }
            }

          }
        }

      }
      goto LABEL_119;
    }
    if (v55)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Signpost Monitoring Enabled", buf, 2u);
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    if ((objc_msgSend(v56, "eplEnabledProfile") & 1) == 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      if (!objc_msgSend(v57, "eplEnabled"))
      {
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v133 = objc_msgSend(v132, "isInternal");

        if ((v133 & 1) == 0)
        {
          v58 = v50;
          v59 = 1;
          goto LABEL_74;
        }
LABEL_73:
        v58 = v50;
        v59 = 0;
LABEL_74:
        objc_msgSend(v58, "monitorSignposts:", v59);
        goto LABEL_78;
      }

    }
    goto LABEL_73;
  }
}

void sub_100008070(int a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  NSURLResourceKey v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  NSString *v31;
  const __CFString *v32;
  void *v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  id obj;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  char v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleaning up", buf, 2u);
  }

  v4 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v4, "addObject:", CFSTR("/var/root/Library/Caches/hangtracerd/tmp"));
  if (a1)
    objc_msgSend(v4, "addObject:", CFSTR("/var/root/Library/Caches/hangtracerd/spool"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v57;
    v6 = CFSTR("/var/root/Library/Caches/hangtracerd/tmp");
    v7 = NSURLTotalFileSizeKey;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v57 != v39)
          objc_enumerationMutation(obj);
        v41 = v8;
        v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v8);
        v10 = sub_100024FF4();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up %@", buf, 0xCu);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLPathKey, NSURLCreationDateKey, v7, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v13, 0, &stru_10004D0B0));

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v43 = v14;
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        if (v45)
        {
          v44 = *(_QWORD *)v53;
          v42 = v9;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v53 != v44)
                objc_enumerationMutation(v43);
              v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v15);
              v50 = 0;
              v51 = 0;
              v17 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v51, v7, &v50);
              v18 = v51;
              v19 = v50;
              if ((v17 & 1) == 0)
              {
                v20 = sub_100024FF4();
                v21 = objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
                  *(_DWORD *)buf = 138412546;
                  v61 = v16;
                  v62 = 2112;
                  v63 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error getting file size for %@: %@", buf, 0x16u);

                }
              }
              v49 = v19;
              v23 = objc_msgSend(v5, "removeItemAtURL:error:", v16, &v49);
              v24 = v49;

              v25 = sub_100024FF4();
              v26 = objc_claimAutoreleasedReturnValue(v25);
              v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
              if ((v23 & 1) != 0)
              {
                if (!v27)
                  goto LABEL_27;
                *(_DWORD *)buf = 138412290;
                v61 = v16;
                v28 = v26;
                v29 = "Successfully deleted file at %@";
                v30 = 12;
              }
              else
              {
                if (!v27)
                  goto LABEL_27;
                *(_DWORD *)buf = 138412802;
                v61 = v16;
                v62 = 2112;
                v63 = v18;
                v64 = 2112;
                v65 = v24;
                v28 = v26;
                v29 = "Failed to delete file at file path: %@ size: %@ error: %@";
                v30 = 32;
              }
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
LABEL_27:

              if (objc_msgSend(v9, "isEqualToString:", v6))
              {
                v31 = v7;
                v32 = v6;
                v33 = v5;
                v34 = objc_msgSend(v18, "unsignedIntValue");
                v35 = sub_100024FF4();
                v36 = objc_claimAutoreleasedReturnValue(v35);
                v37 = v36;
                if (v34 < 0xC800001)
                {
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v61 = v16;
                    v62 = 2112;
                    v63 = v18;
                    v64 = 1024;
                    LODWORD(v65) = v23;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Detected file abandoned in the tmp directory, file path: %@ size: %@  deleted: %{BOOL}d", buf, 0x1Cu);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v61 = v16;
                    v62 = 2112;
                    v63 = v18;
                    v64 = 1024;
                    LODWORD(v65) = v23;
                    _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Detected large file abandoned in the tmp directory, file path: %@ size: %@ deleted: %{BOOL}d", buf, 0x1Cu);
                  }

                  v46[0] = _NSConcreteStackBlock;
                  v46[1] = 3221225472;
                  v46[2] = sub_10000AB38;
                  v46[3] = &unk_10004D0D8;
                  v48 = v23;
                  v47 = v18;
                  AnalyticsSendEventLazy(CFSTR("com.apple.hangtracerd.large_tailspins"), v46);
                  v37 = v47;
                }
                v5 = v33;

                v6 = v32;
                v7 = v31;
                v9 = v42;
              }

              v15 = (char *)v15 + 1;
            }
            while (v45 != v15);
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
          }
          while (v45);
        }

        v8 = v41 + 1;
      }
      while ((id)(v41 + 1) != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v40);
  }

}

void sub_100008694(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  xpc_type_t v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  id v12;
  const char *string;
  id v14;
  _BOOL4 v15;
  id v16;
  pid_t pid;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v12 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v18 = 67109120;
      LODWORD(v19) = xpc_connection_get_pid((xpc_connection_t)v3);
      v8 = "XPC: Client started new connection: pid %d";
      v9 = v7;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 8;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      if (v3 == &_xpc_error_connection_invalid)
      {
        v16 = sub_100024FF4();
        v7 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_9;
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        v18 = 136315394;
        v19 = string;
        v20 = 1024;
        LODWORD(v21) = pid;
        v8 = "xpc_error_connection_invalid %s - from pid %d";
        v9 = v7;
        v10 = OS_LOG_TYPE_INFO;
        v11 = 18;
        goto LABEL_8;
      }
      v14 = sub_100024FF4();
      v7 = objc_claimAutoreleasedReturnValue(v14);
      v15 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v3 != &_xpc_error_connection_interrupted)
      {
        if (!v15)
          goto LABEL_9;
        v18 = 134218242;
        v19 = (const char *)v3;
        v20 = 2080;
        v21 = string;
        v8 = "hangtracerd: Connection error: %p : %s";
        v9 = v7;
        v10 = OS_LOG_TYPE_DEFAULT;
        v11 = 22;
        goto LABEL_8;
      }
      if (!v15)
        goto LABEL_9;
      v18 = 136315138;
      v19 = string;
      v8 = "xpc_error_connection_interrupted: %s";
      goto LABEL_5;
    }
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = (const char *)v5;
      v8 = "hangtracerd: unknown event type : %p";
LABEL_5:
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v18, v11);
    }
  }
LABEL_9:

}

void sub_1000088DC(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  NSError *v8;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "htPrefsRefreshedNotificationCallback_block_invoke";
      v7 = 2112;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Process Terminations: sendHudConfiguration did not complete @ %s. Error: %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

void sub_10000899C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFDictionary *v18;
  int v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  const __CFDictionary *v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  unsigned int v39;
  id v40;
  NSObject *v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  unsigned int v45;
  id v46;
  NSObject *v47;
  id v48;
  unsigned int v49;
  id v50;
  NSObject *v51;
  id v52;
  unsigned int v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  NSObject *v58;
  void *v59;
  __CFNotificationCenter *LocalCenter;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[7];
  _QWORD v85[7];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  __CFString *v102;
  NSObject *v103;

  v6 = objc_msgSend(a3, "isEqualToString:", off_10005F7B0);
  v7 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "handleSentryTailspinRequest";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: received problem detected notification", buf, 0xCu);
    }

    v10 = off_10005F7C0;
    v11 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7D8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7C8));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7D0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7E0));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7E8));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7F0));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F7F8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", off_10005F800));

    v71 = (void *)v15;
    if (!v12)
    {
      v21 = sub_100024FF4();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "handleSentryTailspinRequest";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: reportRef is nil, this is REALLY bad", buf, 0xCu);
      }

      v23 = sub_100018F40(0, (uint64_t)CFSTR("reportRef is nil, this is REALLY bad"));
      v9 = objc_claimAutoreleasedReturnValue(v23);
      v102 = off_10005F820;
      v103 = v9;
      v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
      goto LABEL_56;
    }
    v70 = v14;
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          if (v17)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
LABEL_28:
            v39 = objc_msgSend(v17, "isEqualToString:", off_10005F808);
            if (!v39 || v16)
            {
              if (v74)
                v45 = 0;
              else
                v45 = v39;
              if (v45 == 1)
              {
                v46 = sub_100024FF4();
                v47 = objc_claimAutoreleasedReturnValue(v46);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v79 = "handleSentryTailspinRequest";
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s: duration is nil for App launch request type", buf, 0xCu);
                }

                v48 = sub_100018F40(0, (uint64_t)CFSTR("duration is nil for App launch request type"));
                v9 = objc_claimAutoreleasedReturnValue(v48);

                v90[0] = off_10005F7C0;
                v90[1] = off_10005F820;
                v91[0] = v12;
                v91[1] = v9;
                v43 = v91;
                v44 = v90;
              }
              else
              {
                if (v73)
                  v49 = 0;
                else
                  v49 = v39;
                if (v49 == 1)
                {
                  v50 = sub_100024FF4();
                  v51 = objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v79 = "handleSentryTailspinRequest";
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s: reason is nil for App launch request type", buf, 0xCu);
                  }

                  v52 = sub_100018F40(0, (uint64_t)CFSTR("reason is nil for App launch request type"));
                  v9 = objc_claimAutoreleasedReturnValue(v52);

                  v88[0] = off_10005F7C0;
                  v88[1] = off_10005F820;
                  v89[0] = v12;
                  v89[1] = v9;
                  v43 = v89;
                  v44 = v88;
                }
                else
                {
                  if (v72)
                    v53 = 0;
                  else
                    v53 = v39;
                  if (v53 != 1)
                  {
                    if (!v19)
                    {
                      if (v39)
                      {
                        v84[0] = off_10005F7C0;
                        v84[1] = off_10005F7E8;
                        v85[0] = v12;
                        v85[1] = v73;
                        v84[2] = CFSTR("PID");
                        v84[3] = CFSTR("StartTime");
                        v14 = v70;
                        v85[2] = v16;
                        v85[3] = v70;
                        v85[4] = v71;
                        v84[4] = CFSTR("EndTime");
                        v84[5] = off_10005F818;
                        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "UUIDString"));
                        v84[6] = off_10005F800;
                        v85[5] = v62;
                        v85[6] = off_10005F808;
                        v63 = (void *)v62;
                        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 7));

                      }
                      else
                      {
                        v82[0] = off_10005F7C0;
                        v82[1] = off_10005F800;
                        v83[0] = v12;
                        v83[1] = off_10005F810;
                        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 2));
                        v14 = v70;
                      }
                      v64 = sub_100024FF4();
                      v65 = objc_claimAutoreleasedReturnValue(v64);
                      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                        sub_10002D9D4(v14, v71, v65);

                      v75 = v20;
                      +[HTTailspin saveSentryTailspin:infoDict:startTime:endTime:error:](HTTailspin, "saveSentryTailspin:infoDict:startTime:endTime:error:", v13, v59, objc_msgSend(v14, "unsignedLongLongValue"), objc_msgSend(v71, "unsignedLongLongValue"), &v75);
                      v9 = v75;

                      if (!v9)
                        goto LABEL_60;
                      v66 = sub_100024FF4();
                      v67 = objc_claimAutoreleasedReturnValue(v66);
                      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                      {
                        v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v9, "localizedDescription"));
                        *(_DWORD *)buf = 136315394;
                        v79 = "handleSentryTailspinRequest";
                        v80 = 2112;
                        v81 = v68;
                        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);

                      }
                      v76[0] = off_10005F7C0;
                      v76[1] = off_10005F820;
                      v77[0] = v12;
                      v77[1] = v9;
                      v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 2));

                      v69 = sub_100024FF4();
                      v58 = objc_claimAutoreleasedReturnValue(v69);
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v79 = "handleSentryTailspinRequest";
                        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s: Posting notification to Sentry due to failure to dump tailspin", buf, 0xCu);
                      }
LABEL_59:

                      LocalCenter = CFNotificationCenterGetLocalCenter();
                      CFNotificationCenterPostNotification(LocalCenter, off_10005F7B8, 0, v24, 1u);
                      v18 = v24;
LABEL_60:

                      goto LABEL_61;
                    }
                    v9 = v20;
                    v24 = v18;
                    goto LABEL_55;
                  }
                  v54 = sub_100024FF4();
                  v55 = objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v79 = "handleSentryTailspinRequest";
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s: threshold is nil for App launch request type", buf, 0xCu);
                  }

                  v56 = sub_100018F40(0, (uint64_t)CFSTR("threshold is nil for App launch request type"));
                  v9 = objc_claimAutoreleasedReturnValue(v56);

                  v86[0] = off_10005F7C0;
                  v86[1] = off_10005F820;
                  v87[0] = v12;
                  v87[1] = v9;
                  v43 = v87;
                  v44 = v86;
                }
              }
            }
            else
            {
              v40 = sub_100024FF4();
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v79 = "handleSentryTailspinRequest";
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: pid is nil for App launch request type", buf, 0xCu);
              }

              v42 = sub_100018F40(0, (uint64_t)CFSTR("pid is nil for App launch request type"));
              v9 = objc_claimAutoreleasedReturnValue(v42);

              v92[0] = off_10005F7C0;
              v92[1] = off_10005F820;
              v93[0] = v12;
              v93[1] = v9;
              v43 = v93;
              v44 = v92;
            }
            v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v44, 2));

LABEL_55:
            v14 = v70;
LABEL_56:
            v57 = sub_100024FF4();
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v79 = "handleSentryTailspinRequest";
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: infoDict does not contain all necessary info, posting failure notification", buf, 0xCu);
            }
            v59 = 0;
            goto LABEL_59;
          }
          v36 = sub_100024FF4();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: reportType is nil", buf, 0xCu);
          }

          v38 = sub_100018F40(0, (uint64_t)CFSTR("reportType is nil"));
          v20 = objc_claimAutoreleasedReturnValue(v38);
          v94[0] = off_10005F7C0;
          v94[1] = off_10005F820;
          v95[0] = v12;
          v95[1] = v20;
          v28 = v95;
          v29 = v94;
        }
        else
        {
          v33 = sub_100024FF4();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: endTime is nil", buf, 0xCu);
          }

          v35 = sub_100018F40(0, (uint64_t)CFSTR("endTime is nil"));
          v20 = objc_claimAutoreleasedReturnValue(v35);
          v96[0] = off_10005F7C0;
          v96[1] = off_10005F820;
          v97[0] = v12;
          v97[1] = v20;
          v28 = v97;
          v29 = v96;
        }
      }
      else
      {
        v30 = sub_100024FF4();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v79 = "handleSentryTailspinRequest";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: startTime is nil", buf, 0xCu);
        }

        v32 = sub_100018F40(0, (uint64_t)CFSTR("startTime is nil"));
        v20 = objc_claimAutoreleasedReturnValue(v32);
        v98[0] = off_10005F7C0;
        v98[1] = off_10005F820;
        v99[0] = v12;
        v99[1] = v20;
        v28 = v99;
        v29 = v98;
      }
    }
    else
    {
      v25 = sub_100024FF4();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "handleSentryTailspinRequest";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: fileName is nil", buf, 0xCu);
      }

      v27 = sub_100018F40(0, (uint64_t)CFSTR("fileName is nil"));
      v20 = objc_claimAutoreleasedReturnValue(v27);
      v100[0] = off_10005F7C0;
      v100[1] = off_10005F820;
      v101[0] = v12;
      v101[1] = v20;
      v28 = v101;
      v29 = v100;
    }
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v29, 2));
    v19 = 1;
    goto LABEL_28;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v79 = "handleSentryTailspinRequest";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: notification is not a Sentry problem detected notification, returning early", buf, 0xCu);
  }
LABEL_61:

}

void start()
{
  void *v0;
  dispatch_queue_attr_t v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int *v15;
  char *v16;
  id v17;
  NSObject *v18;
  HTPrefsObserver_hangtracerd *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  __CFNotificationCenter *LocalCenter;
  void *v26;
  id v27;
  void *v28;
  _xpc_connection_s *v29;
  void *v30;
  unsigned int v31;
  id v32;
  NSObject *v33;
  __CFNotificationCenter *v34;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  stat v40;

  v0 = objc_autoreleasePoolPush();
  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_queue_create("com.apple.hangtracer", v2);
  v4 = (void *)qword_100060538;
  qword_100060538 = (uint64_t)v3;

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.hangtracer.hud.timer", v6);
  v8 = (void *)qword_100060540;
  qword_100060540 = (uint64_t)v7;

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_100060538, &stru_10004CF90);
  sub_100008070(0);
  v9 = 0;
  while (1)
  {
    memset(&v40, 0, sizeof(v40));
    v10 = off_10004D0F8[v9];
    if (!stat(v10, &v40))
    {
      if ((v40.st_mode & 0xF000) == 0x4000)
        goto LABEL_10;
      if (unlink(v10) < 0)
      {
        v17 = sub_100024FF4();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to remove previous non-directory at %s", buf, 0xCu);
        }

      }
    }
    v11 = sub_100024FF4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Create log directory: %s", buf, 0xCu);
    }

    if (mkdir(v10, 0x1EDu))
    {
      v13 = sub_100024FF4();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = __error();
        v16 = strerror(*v15);
        *(_DWORD *)buf = 136315394;
        v37 = v10;
        v38 = 2080;
        v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot create spool directory - %s failed with %s - continuing anyway.", buf, 0x16u);
      }

    }
LABEL_10:
    if (++v9 == 3)
    {
      v19 = objc_alloc_init(HTPrefsObserver_hangtracerd);
      v20 = (void *)qword_10005F9A8;
      qword_10005F9A8 = (uint64_t)v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v22 = qword_10005F9A8;
      v23 = NSStringFromSelector("memoryLoggingIntervalSec");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v22, v24, 3, off_10005F578);

      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)sub_100006DB0, CFSTR("com.apple.hangtracer.htprefs.refreshed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      objc_msgSend(v26, "setupPrefsWithQueue:", qword_100060538);

      v27 = objc_alloc_init((Class)NSDateFormatter);
      v28 = (void *)qword_100060530;
      qword_100060530 = (uint64_t)v27;

      objc_msgSend((id)qword_100060530, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss.SSS"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100009ABC;
      handler[3] = &unk_10004CF30;
      v29 = xpc_connection_create_mach_service("com.apple.hangtracerd", (dispatch_queue_t)qword_100060538, 1uLL);
      handler[4] = v29;
      xpc_connection_set_event_handler(v29, handler);
      xpc_connection_resume(v29);
      byte_10005F9B1 = 1;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v31 = objc_msgSend(v30, "shouldIncludeDisplayData");

      if (v31)
      {
        +[HTProcessInfo addDisplayStateChangeEvent:](HTProcessInfo, "addDisplayStateChangeEvent:", mach_absolute_time(), 0xFFFFFFFFLL);
        v40.st_dev = 0;
        notify_register_dispatch("com.apple.iokit.hid.displayStatus", &v40.st_dev, (dispatch_queue_t)qword_100060538, &stru_10004CFD0);
      }
      v32 = sub_100024FF4();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v40.st_dev = 138412290;
        *(_QWORD *)&v40.st_mode = off_10005F7B0;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Adding %@ notification observer", (uint8_t *)&v40, 0xCu);
      }

      v34 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v34, 0, (CFNotificationCallback)sub_10000899C, off_10005F7B0, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      dispatch_main();
    }
  }
}

void sub_1000099EC(id a1, OS_xpc_object *a2)
{
  NSString *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  void *v7;

  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a2, _xpc_event_key_name));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100024FF4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "hangtracerd: Received XPC Event via notifyd: notification name = %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

void sub_100009ABC(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  xpc_type_t v5;
  id v6;
  _xpc_connection_s *v7;
  id v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  const char *string;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  pid_t pid;
  id v20;
  _BYTE v21[24];
  void *v22;
  _xpc_connection_s *v23;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v21 = 67109120;
      *(_DWORD *)&v21[4] = xpc_connection_get_pid((xpc_connection_t)v3);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "XPC: Client started new connection: pid %d", v21, 8u);
    }

    v10 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v10, (dispatch_queue_t)qword_100060538);
    *(_QWORD *)v21 = _NSConcreteStackBlock;
    *(_QWORD *)&v21[8] = 3221225472;
    *(_QWORD *)&v21[16] = sub_10000ABE8;
    v22 = &unk_10004CF30;
    v23 = v10;
    v7 = v10;
    xpc_connection_set_event_handler(v7, v21);
    xpc_connection_resume(v7);

    goto LABEL_8;
  }
  v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (v3 == &_xpc_error_connection_invalid)
    {
      pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      v20 = sub_100024FF4();
      v13 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 136315394;
        *(_QWORD *)&v21[4] = string;
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = pid;
        v15 = "xpc_error_connection_invalid %s - pid %d";
        v16 = v13;
        v17 = OS_LOG_TYPE_INFO;
        v18 = 18;
        goto LABEL_17;
      }
    }
    else
    {
      v12 = sub_100024FF4();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v3 == &_xpc_error_connection_interrupted)
      {
        if (v14)
        {
          *(_DWORD *)v21 = 136315138;
          *(_QWORD *)&v21[4] = string;
          v15 = "xpc_error_connection_interrupted: %s";
          v16 = v13;
          v17 = OS_LOG_TYPE_DEFAULT;
          v18 = 12;
          goto LABEL_17;
        }
      }
      else if (v14)
      {
        *(_DWORD *)v21 = 134218242;
        *(_QWORD *)&v21[4] = v3;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = string;
        v15 = "hangtracerd: Connection error: %p : %s";
        v16 = v13;
        v17 = OS_LOG_TYPE_DEFAULT;
        v18 = 22;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, v21, v18);
      }
    }

    goto LABEL_19;
  }
  v6 = sub_100024FF4();
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 134217984;
    *(_QWORD *)&v21[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "hangtracerd: unknown event type : %p", v21, 0xCu);
  }
LABEL_8:

LABEL_19:
}

void sub_100009D8C(id a1, int a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t state64;
  uint8_t buf[4];
  _BOOL4 v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    v2 = mach_absolute_time();
    +[HTProcessInfo addDisplayStateChangeEvent:](HTProcessInfo, "addDisplayStateChangeEvent:", v2, state64 != 0);
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      v7 = state64 == 0;
      v8 = 2048;
      v9 = state64;
      v10 = 2048;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Display state changed %d -> %llu,  time: %llu", buf, 0x1Cu);
    }

  }
}

void sub_10000A008()
{
  void *v0;
  dispatch_time_t v1;
  NSObject *v2;
  id v3;

  if (qword_10005F9D0)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v1 = dispatch_time(0, 1000000000 * objc_msgSend(v0, "memoryLoggingIntervalSec"));

    v2 = qword_10005F9D0;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    dispatch_source_set_timer(v2, v1, 1000000000 * objc_msgSend(v3, "memoryLoggingIntervalSec"), 0x3B9ACA00uLL);

  }
}

void sub_10000A0C8(id a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  const __CFString *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  const __CFString *v41;
  id v42;
  NSObject *v43;
  int v44;
  id v45;
  NSObject *v46;
  _BOOL4 v47;
  const char *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t v62[4];
  const __CFString *v63;
  uint8_t v64[4];
  const __CFString *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;

  v1 = mach_absolute_time();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "runLoopHangPerPeriodLogLimit");

  if (v3 >= 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = (unint64_t)objc_msgSend(v4, "reportPeriodMATU");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v7 = v5 / (int)objc_msgSend(v6, "runLoopHangPerPeriodLogLimit");

    if (v1 - qword_10005F9F0 > v7)
    {
      +[HTTailspin refreshAppGeneratedLogsCount](HTTailspin, "refreshAppGeneratedLogsCount");
      qword_10005F9F0 = v1;
    }
  }
  if (qword_10005F9F8)
  {
    if (v1 - qword_10005F9F8 < 0x1E2CC310001)
      goto LABEL_8;
    +[HTTailspin resetLogCountsForDailyRollover](HTTailspin, "resetLogCountsForDailyRollover");
  }
  qword_10005F9F8 = v1;
LABEL_8:
  if (v1 - qword_10005FA00 >= 0x141DD76001)
  {
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10002DA90();

    qword_10005FA00 = v1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    objc_msgSend(v13, "eplTimeoutTimestampSec");
    v15 = v14;

    if (v12 < v15)
      goto LABEL_46;
    v50 = v10;
    v16 = sub_100024FF4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PLDE failed to turn EPL off properly, turning off hangtracerd", buf, 2u);
    }
    v51 = v1;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getEPLProfilePath](RMECacheEnumerator, "getEPLProfilePath"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v61 = 0;
      v20 = objc_msgSend(v19, "removeItemAtPath:error:", v18, &v61);
      v21 = v61;

      v22 = sub_100024FF4();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138412290;
          v67 = v18;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Deleted ReportMemoryException plist at %@", buf, 0xCu);
        }
      }
      else if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedDescription"));
        *(_DWORD *)buf = 138412546;
        v67 = v18;
        v68 = 2112;
        v69 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to delete ReportMemoryException plist at %@ with error: %@", buf, 0x16u);

      }
    }

    v26 = sub_100029788(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("HTEPL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_100029788(CFSTR("com.apple.hangtracer"), CFSTR("mobile"), (uint64_t)CFSTR("HTEPL"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v27;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v31)
            objc_enumerationMutation(obj);
          v33 = *(const __CFString **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          v34 = sub_100024FF4();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 138412290;
            v65 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing OTA Key: %@", v64, 0xCu);
          }

          CFPreferencesSetValue(v33, 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
      }
      while (v30);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v36 = v49;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v54 != v39)
            objc_enumerationMutation(v36);
          v41 = *(const __CFString **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
          v42 = sub_100024FF4();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v62 = 138412290;
            v63 = v41;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing HT Key: %@", v62, 0xCu);
          }

          CFPreferencesSetValue(v41, 0, CFSTR("com.apple.hangtracer"), CFSTR("mobile"), kCFPreferencesAnyHost);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v38);
    }

    v44 = sub_100012D0C(0);
    v45 = sub_100024FF4();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      v1 = v51;
      if (v47)
      {
        *(_WORD *)v62 = 0;
        v48 = "Successfully reset tailspin to default system configuration";
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v48, v62, 2u);
      }
    }
    else
    {
      v1 = v51;
      if (v47)
      {
        *(_WORD *)v62 = 0;
        v48 = "Failed to reset tailspin to default system configuration, tailspin will likely remain enabled on this device";
        goto LABEL_44;
      }
    }

    sub_100019200(CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/"));
    sub_100019538(0);
    notify_post(off_10005F780[0]);
    notify_post(off_10005F778[0]);

    v10 = v50;
LABEL_46:

  }
  +[HTProcessInfo checkForHangTimeouts:](HTProcessInfo, "checkForHangTimeouts:", v1);
}

void sub_10000A728(id a1)
{
  id v1;
  void *v2;
  UNNotificationCategory *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  Block_layout *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v1 = sub_1000035B8();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = sub_100005104();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v13[0] = v2;
  v13[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v6 = +[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v9 = sub_100003714();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "associatePrefix:withHandler:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTUserNotificationHelper sharedHelperWithCategories:](HTUserNotificationHelper, "sharedHelperWithCategories:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v11, "associatePrefix:withHandler:", v12, 0);

}

void sub_10000A870(id a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;

  v1 = mach_absolute_time();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "signpostMonitoringPerPeriodLogLimit");

  if (v3 >= 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = (unint64_t)objc_msgSend(v4, "reportPeriodMATU");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v7 = v5 / (int)objc_msgSend(v6, "signpostMonitoringPerPeriodLogLimit");

    if (v1 - qword_10005FA18 > v7)
    {
      +[HTTailspin refreshPerPeriodSentryLogCount](HTTailspin, "refreshPerPeriodSentryLogCount");
      qword_10005FA18 = v1;
    }
  }
  v8 = qword_10005FA20;
  if (!qword_10005FA20)
  {
    qword_10005FA20 = v1;
    v8 = v1;
  }
  if (v1 - v8 >= 0x1E2CC310001)
  {
    +[HTTailspin resetDailySentryTailspinCounts](HTTailspin, "resetDailySentryTailspinCounts");
    qword_10005FA20 = v1;
  }
}

void sub_10000A95C(id a1)
{
  uint64_t v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v1 = mach_absolute_time();
  +[HTProcessInfo checkForHUDTimeouts:](HTProcessInfo, "checkForHUDTimeouts:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "shouldDisplayFenceHangToHUD");

  if (v3)
  {
    v4 = 0;
    while (1)
    {
      v5 = qword_10005FA28[v4 + 1];
      if (v5)
      {
        v6 = qword_10005FA28[v4 + 2];
        v7 = sub_1000273EC(v1);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_7;
        if (v7 - sub_1000273EC(v6) < 1000.0)
          break;
      }
LABEL_8:
      v4 += 3;
      if (v4 == 15)
        goto LABEL_9;
    }
    v7 = sub_1000273EC(v6);
LABEL_7:
    v8 = sub_1000273EC(v5);
    sub_100023F4C((uint64_t)"Fence Hang", v1, v5, v6, 0, 0, v7 - v8);
    goto LABEL_8;
  }
LABEL_9:
  sub_100024510();
}

BOOL sub_10000AA68(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  int v9;
  NSURL *v10;
  __int16 v11;
  NSError *v12;

  v4 = a2;
  v5 = a3;
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

id sub_10000AB38(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("DeletionSucceeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v5[1] = CFSTR("FileSizeBytes");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));

  return v3;
}

void sub_10000ABE8(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  char *v5;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  id v9;
  int64_t pid;
  int64_t int64;
  int64_t v12;
  xpc_object_t value;
  NSObject *v14;
  NSObject *v15;
  size_t v16;
  size_t v17;
  const char *string;
  NSObject *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  id v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  pid_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  uint64_t uint64;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  NSString *v66;
  _BOOL4 v67;
  id v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  NSObject *v80;
  unint64_t v81;
  unint64_t v82;
  const void *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t *v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  double v91;
  id v92;
  NSObject *v93;
  double v94;
  id v95;
  NSObject *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  BOOL v104;
  id v105;
  void *v106;
  const void *data;
  uint64_t v108;
  NSObject *v109;
  id v110;
  void *v111;
  id v112;
  uint64_t v113;
  id v114;
  id v115;
  NSObject *v116;
  void *v117;
  char *v118;
  void *v119;
  char *v120;
  uint64_t v121;
  char v122;
  char *i;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  void *v128;
  unsigned int v129;
  void *v130;
  NSObject *v131;
  void *v132;
  double v133;
  double v134;
  NSObject *v135;
  void *v136;
  double v137;
  double v138;
  __CFString *v139;
  id v140;
  NSObject *v141;
  uint64_t v142;
  void *v143;
  id v144;
  const char *v145;
  NSObject *v146;
  uint32_t v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  int64_t v159;
  id v160;
  uint64_t v161;
  NSObject *v162;
  void *v163;
  void *v164;
  BOOL v165;
  void *v166;
  void *v167;
  void *v168;
  _BOOL4 v169;
  id v170;
  id v171;
  uint64_t v172;
  NSObject *v173;
  void *v174;
  id v175;
  void *region[2];
  __int128 v177;
  __int128 v178;
  __int128 v179;
  id v180;
  size_t length;
  uint8_t v182[4];
  void *v183;
  __int16 v184;
  id v185;
  uint8_t buf[4];
  _BYTE v187[28];
  _QWORD v188[4];

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v9 = v3;
    pid = xpc_connection_get_pid(v8);
    if ((int)pid <= 0)
    {
      v28 = sub_100024FF4();
      v15 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v187 = pid;
        v29 = "%d is not a valid pid to watch";
        v30 = v15;
        v31 = OS_LOG_TYPE_INFO;
        v32 = 8;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, v32);
      }
      goto LABEL_43;
    }
    int64 = xpc_dictionary_get_int64(v9, "command");
    if (int64 == 2)
    {
      +[HTProcessInfo stopWatchingPid:](HTProcessInfo, "stopWatchingPid:", pid);
LABEL_44:

      goto LABEL_45;
    }
    v12 = int64;
    if (int64 == 1)
    {
      value = xpc_dictionary_get_value(v9, "shmem");
      v14 = objc_claimAutoreleasedReturnValue(value);
      v15 = v14;
      if (v14)
      {
        region[0] = 0;
        v16 = xpc_shmem_map(v14, region);
        if (region[0])
        {
          v17 = v16;
          if (v16)
          {
            string = xpc_dictionary_get_string(v9, "bundle-id");
            v19 = objc_claimAutoreleasedReturnValue(+[HTProcessInfo startWatchingPid:sharedMem:length:bundleID:](HTProcessInfo, "startWatchingPid:sharedMem:length:bundleID:", pid, region[0], v17, string));
            if (v19)
            {
              v20 = sub_100024FF4();
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = xpc_dictionary_get_string(v9, "name");
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)v187 = v19;
                *(_WORD *)&v187[8] = 2082;
                *(_QWORD *)&v187[10] = v22;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Initialization complete now watching hangs for %{public}@ | %{public}s", buf, 0x16u);
              }

            }
            if (byte_10005FA10 == 1)
              sub_100001E98(pid, (uint64_t)string);
            goto LABEL_42;
          }
        }
        region[0] = 0;
        v47 = sub_100024FF4();
        v19 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v44 = "Something wrong w/shmem";
          v45 = v19;
          v46 = 2;
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);
        }
      }
      else
      {
        v43 = sub_100024FF4();
        v19 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v187 = pid;
          v44 = "Didn't get shmem from no longer watching %d";
LABEL_38:
          v45 = v19;
          v46 = 8;
          goto LABEL_41;
        }
      }
LABEL_42:

LABEL_43:
      goto LABEL_44;
    }
    switch(int64)
    {
      case 3:
        goto LABEL_82;
      case 4:
        v48 = sub_100024FF4();
        v15 = objc_claimAutoreleasedReturnValue(v48);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_WORD *)buf = 0;
        v29 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
        goto LABEL_51;
      case 5:
        v49 = sub_100024FF4();
        v15 = objc_claimAutoreleasedReturnValue(v49);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_WORD *)buf = 0;
        v29 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
LABEL_51:
        v30 = v15;
        v31 = OS_LOG_TYPE_DEFAULT;
        v32 = 2;
        goto LABEL_24;
      case 6:
        v50 = sub_100024FF4();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          sub_10002DABC();

        uint64 = xpc_dictionary_get_uint64(v9, "name");
        v53 = xpc_dictionary_get_uint64(v9, "startTime");
        v54 = v53;
        v55 = dword_10005FAA0 % 5;
        if ((-858993459 * (dword_10005FAA0 + 1) + 429496729) >= 0x33333333)
          v56 = dword_10005FAA0 + 1;
        else
          v56 = 0;
        dword_10005FAA0 = v56;
        v57 = &qword_10005FA28[3 * v55];
        *v57 = uint64;
        v57[1] = v53;
        v57[2] = 0x7FFFFFFFFFFFFFFFLL;
        dword_10005FAA4 = v55;
        v58 = sub_100024FF4();
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)v187 = uint64;
          *(_WORD *)&v187[8] = 2048;
          *(_QWORD *)&v187[10] = v54;
          *(_WORD *)&v187[18] = 1024;
          *(_DWORD *)&v187[20] = v55;
          _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "saveFenceStartTime: name=%llu, start=%llu, arr_index=%d", buf, 0x1Cu);
        }

        goto LABEL_44;
      case 7:
        v60 = sub_100024FF4();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          sub_10002DAE8();

        v62 = xpc_dictionary_get_uint64(v9, "name");
        v63 = xpc_dictionary_get_uint64(v9, "endTime");
        sub_10000C004(v62, v63);
        goto LABEL_44;
      case 8:
      case 10:
        v35 = xpc_dictionary_get_uint64(v9, "name");
        v36 = xpc_dictionary_get_uint64(v9, "startTime");
        v37 = xpc_dictionary_get_uint64(v9, "endTime");
        v38 = sub_100024FF4();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        if (v12 == 10)
        {
          if (v40)
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)v187 = v35;
            *(_WORD *)&v187[8] = 2048;
            *(_QWORD *)&v187[10] = v36;
            *(_WORD *)&v187[18] = 2048;
            *(_QWORD *)&v187[20] = v37;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Got CA Fence Blown message (fenceName:%llu, startTime:%llu, endTime:%llu)", buf, 0x20u);
          }

          v172 = v35;
          v41 = 5;
        }
        else
        {
          if (v40)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "HTFenceTracking: Fence blown", buf, 2u);
          }

          sub_10000C004(v35, v37);
          v172 = 0;
          v41 = 4;
        }
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        LOWORD(v156) = 0;
        +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:](HTProcessInfo, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:", CFSTR("Fence-hang"), v36 - 12000000, v37 + 12000000, v37, v172, objc_msgSend(v99, "htTailspinEnabled"), v41, v156);

        goto LABEL_44;
      case 11:
        v65 = xpc_connection_copy_entitlement_value(v8, "com.apple.hangtracer.collect-logs");
        v15 = v65;
        if (v65 && xpc_get_type(v65) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v15))
        {
          v66 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v9, "archiveSaveDirectory"));
          v19 = objc_claimAutoreleasedReturnValue(v66);
          v67 = xpc_dictionary_get_BOOL(v9, "archiveCompressionBypass");
          v68 = sub_100024FF4();
          v69 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            sub_10002DB14((uint64_t)v19, v69);

          if (v19 && (sub_100017A18(v19, v67) & 1) != 0)
            goto LABEL_42;
          v70 = sub_100024FF4();
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v187 = v19;
            v72 = "HT command HANGTRACER_XPC_CMD_COLLECT_LOGS failed to save the archive in directory %@";
            v73 = v71;
            v74 = 12;
LABEL_107:
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
          }
        }
        else
        {
          v100 = sub_10000C17C(pid);
          v19 = objc_claimAutoreleasedReturnValue(v100);
          v101 = sub_100024FF4();
          v71 = objc_claimAutoreleasedReturnValue(v101);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v187 = v19;
            *(_WORD *)&v187[8] = 1024;
            *(_DWORD *)&v187[10] = pid;
            *(_WORD *)&v187[14] = 2080;
            *(_QWORD *)&v187[16] = "com.apple.hangtracer.collect-logs";
            v72 = "client %{public}@ [%d] does not bear entitlement \"%s\"; refusing HANGTRACER_XPC_CMD_COLLECT_LOGS command";
            v73 = v71;
            v74 = 28;
            goto LABEL_107;
          }
        }

        goto LABEL_42;
      case 12:
        v75 = (void *)xpc_connection_copy_entitlement_value(v8, "com.apple.hangtracer.logs-processed");
        v76 = v75;
        if (!v75 || xpc_get_type(v75) != (xpc_type_t)&_xpc_type_BOOL)
        {
          v77 = sub_10000C17C(pid);
          v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
          goto LABEL_77;
        }
        v104 = xpc_BOOL_get_value(v76);
        v105 = sub_10000C17C(pid);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
        v78 = v106;
        if (!v104)
        {
LABEL_77:
          v79 = sub_100024FF4();
          v80 = objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v187 = v78;
            *(_WORD *)&v187[8] = 1024;
            *(_DWORD *)&v187[10] = pid;
            *(_WORD *)&v187[14] = 2080;
            *(_QWORD *)&v187[16] = "com.apple.hangtracer.logs-processed";
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "client %{public}@ [%d] does not bear entitlement \"%s\"; refusing HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED command",
              buf,
              0x1Cu);
          }

LABEL_80:
          goto LABEL_44;
        }
        if ((objc_msgSend(v106, "isEqualToString:", CFSTR("hangreporter")) & 1) != 0)
        {
          length = 0;
          data = xpc_dictionary_get_data(v9, "hangLogInfo", &length);
          if (data)
          {
            if (length)
            {
              v108 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0));
              if (v108)
              {
                v109 = v108;
                v110 = objc_alloc((Class)NSSet);
                v188[0] = objc_opt_class(NSDictionary);
                v188[1] = objc_opt_class(NSArray);
                v188[2] = objc_opt_class(NSString);
                v188[3] = objc_opt_class(NSNumber);
                v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v188, 4));
                v112 = objc_msgSend(v110, "initWithArray:", v111);

                v180 = 0;
                v170 = v112;
                v113 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v112, v109, &v180));
                v114 = v180;
                v115 = sub_100024FF4();
                v116 = objc_claimAutoreleasedReturnValue(v115);
                if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
                  sub_10002DB88(v113, (uint64_t)v114, v116);
                v164 = v78;
                v166 = v76;

                v117 = (void *)v113;
                v168 = v114;
                if (!v113 || v114)
                {
                  v130 = v170;
                  v131 = v109;
                  v149 = sub_100024FF4();
                  v135 = objc_claimAutoreleasedReturnValue(v149);
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v187 = v114;
                    _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to unarchive the data dictionary with error: %@", buf, 0xCu);
                  }
                  goto LABEL_152;
                }
                v178 = 0u;
                v179 = 0u;
                *(_OWORD *)region = 0u;
                v177 = 0u;
                v118 = (char *)objc_msgSend(&off_1000554C0, "countByEnumeratingWithState:objects:count:", region, buf, 16);
                v119 = v170;
                if (v118)
                {
                  v120 = v118;
                  v162 = v109;
                  v121 = *(_QWORD *)v177;
                  v122 = 1;
                  do
                  {
                    for (i = 0; i != v120; ++i)
                    {
                      if (*(_QWORD *)v177 != v121)
                        objc_enumerationMutation(&off_1000554C0);
                      v124 = (void *)*((_QWORD *)region[1] + (_QWORD)i);
                      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKey:", v124));

                      if (!v125)
                      {
                        v126 = sub_100024FF4();
                        v127 = objc_claimAutoreleasedReturnValue(v126);
                        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v182 = 138412290;
                          v183 = v124;
                          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED dictionary will not post a notification due to missing key: %@", v182, 0xCu);
                        }

                        v122 = 0;
                      }
                    }
                    v120 = (char *)objc_msgSend(&off_1000554C0, "countByEnumeratingWithState:objects:count:", region, buf, 16);
                  }
                  while (v120);
                  v109 = v162;
                  v119 = v170;
                  if ((v122 & 1) == 0)
                    goto LABEL_153;
                }
                v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("displayedInHUD")));
                v129 = objc_msgSend(v128, "BOOLValue");

                if (!v129)
                  goto LABEL_153;
                v130 = v119;
                v131 = v109;
                v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("startWallTime")));
                objc_msgSend(v132, "doubleValue");
                v134 = v133;

                v135 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v134));
                v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("durationMS")));
                objc_msgSend(v136, "doubleValue");
                v138 = v137;

                v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("processPath")));
                v139 = sub_100018EA0(v174);
                v175 = 0;
                v163 = (void *)objc_claimAutoreleasedReturnValue(v139);
                v171 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v163, 0, &v175);
                v160 = v175;
                if (v160)
                {
                  v140 = sub_100024FF4();
                  v141 = objc_claimAutoreleasedReturnValue(v140);
                  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v182 = 138543618;
                    v183 = v163;
                    v184 = 2112;
                    v185 = v160;
                    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "Unable to create an LS application record from bundle id %{public}@: %@", v182, 0x16u);
                  }

                  v142 = objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "lastPathComponent"));
                }
                else
                {
                  v150 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "thirdPartyDevPreferredLanguages"));
                  v152 = objc_msgSend(v151, "count");

                  if (v152)
                  {
                    v153 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
                    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "thirdPartyDevPreferredLanguages"));
                    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "localizedNameWithPreferredLocalizations:", v154));

                    goto LABEL_151;
                  }
                  v142 = objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "localizedName"));
                }
                v143 = (void *)v142;
LABEL_151:
                v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("hangUUID")));
                sub_100005128(v143, v155, v138);

LABEL_152:
                v109 = v131;
                v119 = v130;
LABEL_153:

                v76 = v166;
                v78 = v164;
                goto LABEL_154;
              }
            }
          }
          v148 = sub_100024FF4();
          v109 = objc_claimAutoreleasedReturnValue(v148);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v145 = "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to retrieve the hang log info NSData";
            v146 = v109;
            v147 = 2;
            goto LABEL_146;
          }
        }
        else
        {
          v144 = sub_100024FF4();
          v109 = objc_claimAutoreleasedReturnValue(v144);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v187 = v78;
            *(_WORD *)&v187[8] = 1024;
            *(_DWORD *)&v187[10] = pid;
            v145 = "client %{public}@ [%d] is not expected to issue this command; refusing HANGTRACER_XPC_CMD_HANG_LOGS_P"
                   "ROCESSED command";
            v146 = v109;
            v147 = 18;
LABEL_146:
            _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, v145, buf, v147);
          }
        }
LABEL_154:

        goto LABEL_80;
      case 13:
        pid = xpc_dictionary_get_int64(v9, "pid");
LABEL_82:
        v15 = objc_claimAutoreleasedReturnValue(+[HTProcessInfo processForPid:](HTProcessInfo, "processForPid:", pid));
        if (v15)
        {
          v81 = xpc_dictionary_get_int64(v9, "startTime");
          v82 = xpc_dictionary_get_int64(v9, "endTime");
          v159 = xpc_dictionary_get_int64(v9, "threadID");
          v157 = xpc_dictionary_get_string(v9, "name");
          v169 = xpc_dictionary_get_BOOL(v9, "saveReport");
          v158 = (int)xpc_dictionary_get_int64(v9, "hangSubtype");
          v165 = xpc_dictionary_get_BOOL(v9, "saveMicroHang");
          region[0] = 0;
          v83 = xpc_dictionary_get_data(v9, "userActionData", (size_t *)region);
          v84 = 0;
          if (v12 == 3)
          {
            v84 = 0;
            if (v83)
            {
              if (region[0])
                v84 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
            }
          }
          v167 = (void *)v84;
          v173 = v15;
          v85 = 0;
          v86 = 0;
          v87 = (unint64_t *)&unk_10005FA38;
          do
          {
            v88 = *(v87 - 1);
            v89 = *v87;
            if (v88 <= v81)
              v88 = v81;
            if (v89 >= v82)
              v89 = v82;
            v90 = v89 - v88;
            if (v89 > v88)
            {
              v91 = sub_1000273EC(v89 - v88);
              v92 = sub_100024FF4();
              v93 = objc_claimAutoreleasedReturnValue(v92);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                v161 = *(v87 - 2);
                v94 = sub_1000273EC(v90);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v187 = v85;
                *(_WORD *)&v187[4] = 2048;
                *(_QWORD *)&v187[6] = v161;
                *(_WORD *)&v187[14] = 2048;
                *(double *)&v187[16] = v94;
                _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "CheckForFence: fenceIdx=%i, fenceName= %llu, overlap = %f ", buf, 0x1Cu);
              }
              v86 = (unint64_t)(v91 + (double)v86);

            }
            v87 += 3;
            ++v85;
          }
          while (v85 != 5);
          v95 = sub_100024FF4();
          v96 = objc_claimAutoreleasedReturnValue(v95);
          v97 = os_log_type_enabled(v96, OS_LOG_TYPE_INFO);
          v15 = v173;
          if (v86 <= 0x190)
          {
            if (v97)
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v187 = v86;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "CheckForFence: total fence overlap time = %llu ms, not fence-hang", buf, 0xCu);
            }

            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v157));
            BYTE1(v156) = v165;
            LOBYTE(v156) = -[NSObject isThirdPartyDevSupportModeHang](v173, "isThirdPartyDevSupportModeHang");
            v98 = v167;
            -[NSObject recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:](v173, "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:", v103, v159, v81, v82, v169, v158, v167, v156);

          }
          else
          {
            if (v97)
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v187 = v86;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "CheckForFence: total fence overlap time = %llu ms => treating as Fence-hang", buf, 0xCu);
            }

            BYTE1(v156) = v165;
            LOBYTE(v156) = -[NSObject isThirdPartyDevSupportModeHang](v173, "isThirdPartyDevSupportModeHang");
            +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:](HTProcessInfo, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:", CFSTR("Fence-hang"), v81 - 12000000, v82 + 12000000, v82, 0, v169, 3, v156);
            v98 = v167;
          }

          goto LABEL_43;
        }
        v102 = sub_100024FF4();
        v19 = objc_claimAutoreleasedReturnValue(v102);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v187 = pid;
        v44 = "Got hang detected message for a pid we're not monitoring: %d";
        goto LABEL_38;
      default:
        v64 = sub_100024FF4();
        v15 = objc_claimAutoreleasedReturnValue(v64);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v187 = v9;
        v29 = "Don't know how to handle %p";
        v30 = v15;
        v31 = OS_LOG_TYPE_DEFAULT;
        v32 = 12;
        goto LABEL_24;
    }
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      v33 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      v34 = sub_100024FF4();
      v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v187 = v33;
        v25 = "Client disconnected: %d";
        v26 = v8;
        v27 = 8;
        goto LABEL_35;
      }
    }
    else if (v3 == &_xpc_error_termination_imminent)
    {
      v42 = sub_100024FF4();
      v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Termination imminent!";
        v26 = v8;
        v27 = 2;
        goto LABEL_35;
      }
    }
    else
    {
      v23 = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      v24 = sub_100024FF4();
      v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v187 = v23;
        v25 = "Unexpected error: %s";
        v26 = v8;
        v27 = 12;
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
LABEL_45:

    goto LABEL_46;
  }
  v5 = xpc_copy_description(v3);
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v187 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We got a non-dictionary event: %s", buf, 0xCu);
  }

  free(v5);
LABEL_46:

}

void sub_10000C004(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;

  v4 = dword_10005FAA4;
  if (qword_10005FA28[3 * dword_10005FAA4] != a1)
  {
    v5 = 0;
    v4 = -1;
    v6 = qword_10005FA28;
    do
    {
      v7 = *v6;
      v6 += 3;
      if (v7 == a1)
        v4 = v5;
      ++v5;
    }
    while (v5 != 5);
  }
  if ((v4 & 0x80000000) != 0)
  {
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HTFenceTracking: Fence end, failed to find corresponding fence(%llu)", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    qword_10005FA28[3 * v4 + 2] = a2;
  }
  v10 = sub_100024FF4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218496;
    v13 = a1;
    v14 = 2048;
    v15 = a2;
    v16 = 1024;
    v17 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "saveFenceEndTime: name=%llu, end=%llu, arr_index=%d", (uint8_t *)&v12, 0x1Cu);
  }

}

id sub_10000C17C(int a1)
{
  _BYTE buffer[32];

  proc_name(a1, buffer, 0x20u);
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
}

void sub_10000C1E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

__CFString *sub_10000C494(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_10004D1C0)[a1];
}

id sub_10000C4CC(unint64_t a1, unint64_t a2, unint64_t a3)
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v5 = sub_100019D20(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_100019D20(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000C494(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v6, v8, v10));

  return v11;
}

double sub_10000C560(unint64_t a1, unint64_t a2)
{
  double v2;
  id v3;
  NSObject *v4;

  if (a1 >= a2)
    return sub_1000273EC(a1 - a2);
  v2 = -sub_1000273EC(a2 - a1);
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10002DC0C(v4, v2);

  return v2;
}

void sub_10000C5CC(unint64_t a1, unint64_t a2, const __CFString *a3, unint64_t a4, char a5)
{
  __objc2_class *v8;
  unint64_t *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  NSString *v24;
  double v25;
  id v26;
  NSObject *v27;
  void *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  __CFString *v33;
  void *v34;
  BOOL v35;
  uint64_t v37;
  uint64_t v38;
  double v39;
  id v40;
  NSObject *v41;
  double v42;
  id v43;
  NSObject *v44;
  unint64_t v45;
  char *v46;
  int v47;
  uint64_t *v48;
  _BOOL4 v50;
  _BOOL8 v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  NSString *v59;
  double v60;
  id v61;
  NSObject *v62;
  NSString *v63;
  double v64;
  id v65;
  NSObject *v66;
  NSString *v67;
  double v68;
  id v69;
  NSObject *v70;
  NSString *v71;
  double v72;
  id v73;
  NSObject *v74;
  double v75;
  NSString *v76;
  double v77;
  id v78;
  NSObject *v79;
  NSString *v80;
  double v81;
  id v82;
  NSObject *v83;
  NSString *v84;
  double v85;
  id v86;
  NSObject *v87;
  NSString *v88;
  double v89;
  id v90;
  NSObject *v91;
  __CFString *v92;
  double v93;
  __CFString *v94;
  double v95;
  __CFString *v96;
  double v97;
  __CFString *v98;
  double v99;
  __CFString *v100;
  double v101;
  __CFString *v102;
  double v103;
  __CFString *v104;
  double v105;
  __CFString *v106;
  double v107;
  __CFString *v108;
  __CFString *v109;
  __CFString *v110;
  double v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  __CFString *v116;
  unint64_t v117;
  _QWORD v119[13];
  int v120;
  char v121;
  _QWORD v122[4];
  id v123;
  __CFString *v124;
  int v125;
  BOOL v126;
  char v127;
  _QWORD v128[8];
  char v129;
  uint8_t buf[4];
  __CFString *v131;
  __int16 v132;
  const __CFString *v133;
  __int16 v134;
  const __CFString *v135;
  __int16 v136;
  _BYTE v137[24];

  v8 = &OBJC_METACLASS___MonitoredStates;
  qword_10005FAB0 = (qword_10005FAB0 + 1) % 0xAuLL;
  v9 = (unint64_t *)((char *)&unk_10005FAB8 + 32 * qword_10005FAB0);
  *v9 = a1;
  v9[1] = a2;
  v9[2] = (unint64_t)a3;
  v9[3] = a4;
  v10 = sub_100019D20(a1);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_100024FF4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v131 = v11;
    v132 = 2048;
    v133 = (const __CFString *)a2;
    v134 = 2048;
    v135 = a3;
    v136 = 2048;
    *(_QWORD *)v137 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "reportTailspinRequestStats( type=%@, start=%llu, end=%llu, tailspin=%llu)", buf, 0x2Au);
  }
  v114 = (unint64_t)a3;

  j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), off_10005F580, CFSTR("Tailspin_Requests")), 1);
  v14 = sub_100024FF4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10002DD44(v15);

  v16 = off_10005F580;
  v17 = sub_100019D20(a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v16, CFSTR("Tailspin_Requests_By_Type"), v18), 1);

  v19 = sub_100024FF4();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_10002DC84(a1, v20);

  v21 = off_10005F580;
  v22 = sub_100019D20(a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v21, CFSTR("EndTime_To_TailspinTime"), v23);
  v25 = sub_10000C560(a4, v114);
  j__ADClientPushValueForDistributionKey(v24, v25);

  v26 = sub_100024FF4();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v108 = off_10005F580;
    v109 = sub_100019D20(a1);
    v110 = (__CFString *)objc_claimAutoreleasedReturnValue(v109);
    v111 = sub_10000C560(a4, v114);
    *(_DWORD *)buf = 138413058;
    v131 = v108;
    v132 = 2112;
    v133 = v110;
    v134 = 2112;
    v135 = CFSTR("EndTime_To_TailspinTime");
    v136 = 2048;
    *(double *)v137 = v111;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@.%@.%@ value=%f", buf, 0x2Au);

  }
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_10000D670;
  v128[3] = &unk_10004D118;
  v113 = a1;
  v128[4] = a1;
  v128[5] = a2;
  v128[6] = v114;
  v128[7] = a4;
  v129 = a5;
  AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.tailspins"), v128);
  v28 = 0;
  do
  {
    v29 = (unint64_t *)((char *)&unk_10005FAB8 + 32 * (_QWORD)v28);
    v30 = *v29;
    v31 = v29[1];
    v32 = v29[2];
    v117 = v29[3];
    v33 = sub_100019D20(*v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v8[68].cache == v28 || v31 == 0;
    if (!v35 && v32 != 0)
    {
      v37 = 0;
      do
      {
        v38 = dword_1000370B0[v37];
        v39 = (double)(1000 * (int)v38);
        if (sub_10000C560(a4, v32) >= v39)
          break;
        j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@%02i.%@.%@"), off_10005F580, CFSTR("Tailspin_Requests_End_Within_Threshold"), CFSTR("Threshold="), v38, v34, v11), 1);
        v40 = sub_100024FF4();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413570;
          v131 = off_10005F580;
          v132 = 2112;
          v133 = CFSTR("Tailspin_Requests_End_Within_Threshold");
          v134 = 2112;
          v135 = CFSTR("Threshold=");
          v136 = 1024;
          *(_DWORD *)v137 = v38;
          *(_WORD *)&v137[4] = 2112;
          *(_QWORD *)&v137[6] = v34;
          *(_WORD *)&v137[14] = 2112;
          *(_QWORD *)&v137[16] = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
        }

        v42 = sub_10000C560(a4, v31);
        if (v42 < v39)
        {
          j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@%02i.%@.%@"), off_10005F580, CFSTR("Tailspin_Requests_Start_Within_Threshold"), CFSTR("Threshold="), v38, v34, v11), 1);
          v43 = sub_100024FF4();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413570;
            v131 = off_10005F580;
            v132 = 2112;
            v133 = CFSTR("Tailspin_Requests_Start_Within_Threshold");
            v134 = 2112;
            v135 = CFSTR("Threshold=");
            v136 = 1024;
            *(_DWORD *)v137 = v38;
            *(_WORD *)&v137[4] = 2112;
            *(_QWORD *)&v137[6] = v34;
            *(_WORD *)&v137[14] = 2112;
            *(_QWORD *)&v137[16] = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
          }

        }
        ++v37;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_10000D76C;
        v122[3] = &unk_10004D140;
        v125 = v38;
        v126 = v42 < v39;
        v123 = v34;
        v124 = v11;
        v127 = a5;
        AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.tailspins.Tailspin_Requests_Within_Threshold"), v122);

      }
      while (v37 != 5);
      v45 = v114;
      v8 = &OBJC_METACLASS___MonitoredStates;
      if (sub_10000C560(v114, v32) < 60000.0)
      {
        v46 = 0;
        v47 = 0;
        v48 = &qword_10005FAC8;
        do
        {
          if (v28 != v46 && *v48 > v32 && *v48 < v114)
            ++v47;
          ++v46;
          v48 += 4;
        }
        while (v46 != (char *)10);
        v50 = v31 < a2;
        v51 = v32 >= a2 && v31 < a2;
        if (v32 < a2)
          v50 = 1;
        v35 = !v50;
        v52 = 2;
        if (!v35)
          v52 = v51;
        if (v32 <= v114)
          v53 = v52;
        else
          v53 = 3;
        v112 = v53;
        v54 = sub_10000C4CC(v113, v30, v53);
        v116 = (__CFString *)objc_claimAutoreleasedReturnValue(v54);
        j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), off_10005F580, CFSTR("Overlap_Counts"), v116), 1);
        v55 = sub_100024FF4();
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v131 = off_10005F580;
          v132 = 2112;
          v133 = CFSTR("Overlap_Counts");
          v134 = 2112;
          v135 = v116;
          _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1", buf, 0x20u);
        }

        j__ADClientSetValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), off_10005F580, CFSTR("Intermediate_Hangs_For_Overlap_Type"), v116), v47);
        v57 = sub_100024FF4();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v131 = off_10005F580;
          v132 = 2112;
          v133 = CFSTR("Intermediate_Hangs_For_Overlap_Type");
          v134 = 2112;
          v135 = v116;
          v136 = 1024;
          *(_DWORD *)v137 = v47;
          _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%@.%@.%@ == %i", buf, 0x26u);
        }

        v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("All_Request_Intervals"), v116, CFSTR("Intervals_S1toS2"));
        v60 = sub_10000C560(a2, v31);
        j__ADClientPushValueForDistributionKey(v59, v60);
        v61 = sub_100024FF4();
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v92 = off_10005F580;
          v93 = sub_10000C560(a2, v31);
          *(_DWORD *)buf = 138413314;
          v131 = v92;
          v45 = v114;
          v132 = 2112;
          v133 = CFSTR("All_Request_Intervals");
          v134 = 2112;
          v135 = v116;
          v136 = 2112;
          *(_QWORD *)v137 = CFSTR("Intervals_S1toS2");
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v93;
          _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("All_Request_Intervals"), v116, CFSTR("Intervals_S1toE2"));
        v64 = sub_10000C560(v45, v31);
        j__ADClientPushValueForDistributionKey(v63, v64);
        v65 = sub_100024FF4();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          v94 = off_10005F580;
          v95 = sub_10000C560(v114, v31);
          *(_DWORD *)buf = 138413314;
          v131 = v94;
          v45 = v114;
          v132 = 2112;
          v133 = CFSTR("All_Request_Intervals");
          v134 = 2112;
          v135 = v116;
          v136 = 2112;
          *(_QWORD *)v137 = CFSTR("Intervals_S1toE2");
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v95;
          _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("All_Request_Intervals"), v116, CFSTR("Intervals_E1toS2"));
        v68 = sub_10000C560(a2, v32);
        j__ADClientPushValueForDistributionKey(v67, v68);
        v69 = sub_100024FF4();
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          v96 = off_10005F580;
          v97 = sub_10000C560(a2, v32);
          *(_DWORD *)buf = 138413314;
          v131 = v96;
          v45 = v114;
          v132 = 2112;
          v133 = CFSTR("All_Request_Intervals");
          v134 = 2112;
          v135 = v116;
          v136 = 2112;
          *(_QWORD *)v137 = CFSTR("Intervals_E1toS2");
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v97;
          _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v71 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("All_Request_Intervals"), v116, CFSTR("Intervals_E1toE2"));
        v72 = sub_10000C560(v45, v32);
        j__ADClientPushValueForDistributionKey(v71, v72);
        v73 = sub_100024FF4();
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          v98 = off_10005F580;
          v99 = sub_10000C560(v114, v32);
          *(_DWORD *)buf = 138413314;
          v131 = v98;
          v45 = v114;
          v132 = 2112;
          v133 = CFSTR("All_Request_Intervals");
          v134 = 2112;
          v135 = v116;
          v136 = 2112;
          *(_QWORD *)v137 = CFSTR("Intervals_E1toE2");
          *(_WORD *)&v137[8] = 2048;
          *(double *)&v137[10] = v99;
          _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        v119[0] = _NSConcreteStackBlock;
        v119[1] = 3221225472;
        v119[2] = sub_10000D890;
        v119[3] = &unk_10004D160;
        v119[4] = v30;
        v119[5] = v31;
        v119[6] = v32;
        v119[7] = v117;
        v119[8] = v113;
        v119[9] = a2;
        v119[10] = v45;
        v119[11] = a4;
        v119[12] = v112;
        v120 = v47;
        v121 = a5;
        *(_QWORD *)&v75 = AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.tailspins.Overlap_Counts"), v119).n128_u64[0];
        v8 = &OBJC_METACLASS___MonitoredStates;
        if (!v47)
        {
          v76 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), v75, off_10005F580, CFSTR("Adjacent_Request_Intervals"), v116, CFSTR("Intervals_S1toS2"));
          v77 = sub_10000C560(a2, v31);
          j__ADClientPushValueForDistributionKey(v76, v77);
          v78 = sub_100024FF4();
          v79 = objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v100 = off_10005F580;
            v101 = sub_10000C560(a2, v31);
            *(_DWORD *)buf = 138413314;
            v131 = v100;
            v45 = v114;
            v132 = 2112;
            v133 = CFSTR("Adjacent_Request_Intervals");
            v134 = 2112;
            v135 = v116;
            v136 = 2112;
            *(_QWORD *)v137 = CFSTR("Intervals_S1toS2");
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v101;
            _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          v80 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("Adjacent_Request_Intervals"), v116, CFSTR("Intervals_S1toE2"));
          v81 = sub_10000C560(v45, v31);
          j__ADClientPushValueForDistributionKey(v80, v81);
          v82 = sub_100024FF4();
          v83 = objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            v102 = off_10005F580;
            v103 = sub_10000C560(v114, v31);
            *(_DWORD *)buf = 138413314;
            v131 = v102;
            v45 = v114;
            v132 = 2112;
            v133 = CFSTR("Adjacent_Request_Intervals");
            v134 = 2112;
            v135 = v116;
            v136 = 2112;
            *(_QWORD *)v137 = CFSTR("Intervals_S1toE2");
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v103;
            _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          v84 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("Adjacent_Request_Intervals"), v116, CFSTR("Intervals_E1toS2"));
          v85 = sub_10000C560(a2, v32);
          j__ADClientPushValueForDistributionKey(v84, v85);
          v86 = sub_100024FF4();
          v87 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            v104 = off_10005F580;
            v105 = sub_10000C560(a2, v32);
            *(_DWORD *)buf = 138413314;
            v131 = v104;
            v45 = v114;
            v132 = 2112;
            v133 = CFSTR("Adjacent_Request_Intervals");
            v134 = 2112;
            v135 = v116;
            v136 = 2112;
            *(_QWORD *)v137 = CFSTR("Intervals_E1toS2");
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v105;
            _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          v88 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), off_10005F580, CFSTR("Adjacent_Request_Intervals"), v116, CFSTR("Intervals_E1toE2"));
          v89 = sub_10000C560(v45, v32);
          j__ADClientPushValueForDistributionKey(v88, v89);
          v90 = sub_100024FF4();
          v91 = objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v106 = off_10005F580;
            v107 = sub_10000C560(v114, v32);
            *(_DWORD *)buf = 138413314;
            v131 = v106;
            v132 = 2112;
            v133 = CFSTR("Adjacent_Request_Intervals");
            v134 = 2112;
            v135 = v116;
            v136 = 2112;
            *(_QWORD *)v137 = CFSTR("Intervals_E1toE2");
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v107;
            _os_log_debug_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

        }
      }
    }

    v28 = (char *)v28 + 1;
  }
  while (v28 != (void *)10);

}

id sub_10000D670(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  NSNumber *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("Type");
  v2 = sub_100019D20(*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v10[0] = v3;
  v9[1] = CFSTR("EndTime_To_TailspinTime");
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000C560(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10[1] = v5;
  v9[2] = CFSTR("Tailspin_Request_Denied");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

id sub_10000D76C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[6];

  v9[0] = CFSTR("Threshold");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  v10[0] = v2;
  v10[1] = &__kCFBooleanTrue;
  v9[1] = CFSTR("EndWithinThreshold");
  v9[2] = CFSTR("BeginWithinThreshold");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 52)));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10[2] = v3;
  v10[3] = v4;
  v9[3] = CFSTR("RequestType");
  v9[4] = CFSTR("LatestRequestType");
  v10[4] = v5;
  v9[5] = CFSTR("Tailspin_Request_Denied");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 53)));
  v10[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 6));

  return v7;
}

id sub_10000D890(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSNumber *v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  NSNumber *v13;
  void *v14;
  NSNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[9];
  _QWORD v21[9];

  v20[0] = CFSTR("RequestType");
  v2 = sub_100019D20(*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v21[0] = v3;
  v20[1] = CFSTR("LatestRequestType");
  v4 = sub_100019D20(*(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[1] = v5;
  v20[2] = CFSTR("OverlapType");
  v6 = sub_10000C494(*(_QWORD *)(a1 + 96));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v21[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 104), CFSTR("RequestType"), CFSTR("LatestRequestType"), CFSTR("OverlapType"), CFSTR("NumberRequestsBetween")));
  v21[3] = v8;
  v20[4] = CFSTR("Intervals_S1toS2");
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000C560(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40)));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v21[4] = v10;
  v20[5] = CFSTR("Intervals_S1toE2");
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000C560(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40)));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[5] = v12;
  v20[6] = CFSTR("Intervals_E1toS2");
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000C560(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48)));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[6] = v14;
  v20[7] = CFSTR("Intervals_E1toE2");
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000C560(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48)));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v21[7] = v16;
  v20[8] = CFSTR("Tailspin_Request_Denied");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 108)));
  v21[8] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 9));

  return v18;
}

void sub_10000DAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  dispatch_block_t v10;
  _QWORD block[8];
  char v12;

  if (qword_10005FBF8 != -1)
    dispatch_once(&qword_10005FBF8, &stru_10004D180);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBB0;
  block[3] = &unk_10004D1A0;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  block[7] = a4;
  v12 = a5;
  v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)qword_10005FAA8, v10);

}

void sub_10000DB84(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("HT_Tailspin_Request_Reporting_Queue", 0);
  v2 = (void *)qword_10005FAA8;
  qword_10005FAA8 = (uint64_t)v1;

}

void sub_10000DBB0(uint64_t a1)
{
  sub_10000C5CC(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(const __CFString **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
}

void sub_10000DBC4(double a1)
{
  dispatch_source_t v2;
  void *v3;
  dispatch_time_t v4;

  if (!qword_10005FC00)
  {
    v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100060538);
    v3 = (void *)qword_10005FC00;
    qword_10005FC00 = (uint64_t)v2;

    dispatch_source_set_event_handler_f((dispatch_source_t)qword_10005FC00, (dispatch_function_t)sub_10000DC64);
    dispatch_activate((dispatch_object_t)qword_10005FC00);
  }
  v4 = dispatch_time(0, (uint64_t)(a1 * 1000000.0));
  dispatch_source_set_timer((dispatch_source_t)qword_10005FC00, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

id sub_10000DC64()
{
  id v0;
  double v1;

  v0 = +[HTHangInfo getHangWaitTimeout](HTHangInfo, "getHangWaitTimeout");
  if ((unint64_t)v1)
    return (id)sub_10000DBC4(v0, (double)(unint64_t)v1);
  else
    return +[HTTailspin collectTailspinAndUpdateTelemtry](HTTailspin, "collectTailspinAndUpdateTelemtry");
}

void sub_10000DEE4(id a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = objc_alloc_init((Class)NSMutableArray);
  v2 = (void *)qword_10005FC18;
  qword_10005FC18 = (uint64_t)v1;

  qword_10005FC08 = 0;
  qword_10005FC28 = -1;
  qword_10005FC30 = 0;
  v3 = (void *)qword_10005FC00;
  qword_10005FC00 = 0;

}

void sub_10000EBB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

id sub_10000EE20(uint64_t a1)
{
  void *v1;

  if (a1 == 2)
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[HUDTheme darkModeTheme](HUDTheme, "darkModeTheme"));
  else
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[HUDTheme lightModeTheme](HUDTheme, "lightModeTheme"));
  return v1;
}

void sub_10000F218(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSCache);
  v2 = (void *)qword_10005FC40;
  qword_10005FC40 = (uint64_t)v1;

  _objc_msgSend((id)qword_10005FC40, "setCountLimit:", 20);
}

void sub_10000F77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F7AC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadThemeColors");

}

void sub_10000F7D8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "updateHUDLineWithId:content:options:", CFSTR("some-id"), *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "valueLayer"));
  objc_msgSend(v2, "preferredFrameSize");
  objc_msgSend(*(id *)(a1 + 32), "setMinimumValueLayerWidth:");

  v3 = *(void **)(a1 + 32);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hudLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("some-id")));
  objc_msgSend(v3, "updateCornerRadiusAndSidePaddingIfNecessary:", v4);

}

id sub_10000FB38(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HangTracer HUD new orientation %@ → %@", buf, 0x16u);

  }
  sub_100027E94();
  v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FC6C;
  v8[3] = &unk_10004D278;
  v8[4] = v6;
  return objc_msgSend(v6, "performHUDUpdate:", v8);
}

void sub_10000FC6C(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v5, "count"), v5);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v5, "count"), v3, v4);

}

id sub_10000FD00(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HangTracer HUD new bounds %@ → %@", buf, 0x16u);

  }
  sub_100027EB0();
  objc_msgSend(*(id *)(a1 + 40), "setDisplayScaleDependentPropertiesOnLayers");
  v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FE3C;
  v8[3] = &unk_10004D278;
  v8[4] = v6;
  return objc_msgSend(v6, "performHUDUpdate:", v8);
}

void sub_10000FE3C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  objc_msgSend(*(id *)(a1 + 32), "setSidePadding:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownMaxKeyLayerWidth:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        sub_100027880();
        objc_msgSend(v11, "setFontSize:");

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v4, "count"), v4);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v4, "count"), v12, v13);

}

void sub_1000101D8(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  CATransform3D v6;
  CATransform3D v7;

  v2 = -[HUDLine contentScaleForTexts]_0();
  CATransform3DMakeScale(&v7, v2, v2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootLayer"));
  v6 = v7;
  objc_msgSend(v3, "setTransform:", &v6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v4, "setShadowOffset:", 0.0, 10.0 / v2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v5, "setShadowRadius:", 25.0 / v2);

}

void sub_100010584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1000105B0(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  HUDLine *v4;

  v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");

}

void sub_1000105E0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_1000105EC(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1000105F4(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001066C;
    block[3] = &unk_10004D278;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

void sub_10001066C(uint64_t a1)
{
  void *v2;
  void *v3;
  double y;
  double width;
  double height;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &stru_10004D2D8);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  objc_msgSend(v3, "removeAllObjects");

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v7, "setFrame:", CGRectZero.origin.x, y, width, height);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootLayer"));
  objc_msgSend(v8, "setHidden:", 1);

}

void sub_10001072C(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  HUDLine *v4;

  v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");

}

void sub_100010970(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _BYTE v46[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100010CE4;
  v42[3] = &unk_10004D300;
  v43 = *(id *)(a1 + 40);
  v44 = *(id *)(a1 + 48);
  v4 = v2;
  v45 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v42);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (_QWORD)v38));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
        objc_msgSend(v12, "removeFromSuperlayer");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
        objc_msgSend(v13, "removeObjectForKey:", v10);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudContentWithPendingAnimations"));
        objc_msgSend(v14, "removeObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v7);
  }

  v15 = sub_100024FF4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_10002E124(a1, v16, v17, v18, v19, v20, v21, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v23, "removeAllAnimations");

  if (*(_QWORD *)(a1 + 56))
  {
    v24 = 0;
    do
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v24, (_QWORD)v38));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v25));
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      v28 = sub_100027EF4(v26, *(_QWORD *)(a1 + 64), v27 + 50.0);
      if (objc_msgSend(v26, "timedOut"))
        v29 = v28 | 2;
      else
        v29 = v28;
      objc_msgSend(*(id *)(a1 + 32), "updateHUDLineWithId:content:options:", v25, v26, v29);

      ++v24;
      v30 = *(_QWORD *)(a1 + 56);
    }
    while (v24 < v30);
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", v30, *(_QWORD *)(a1 + 48), (_QWORD)v38);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sublayers"));
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootLayer"));
    objc_msgSend(v34, "setHidden:", 0);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
    objc_msgSend(v35, "setHidden:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
    LODWORD(v37) = 1.0;
    objc_msgSend(v36, "setOpacity:", v37);

  }
}

void sub_100010CE4(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (v4 = (void *)v3, v5 = objc_msgSend(a1[5], "indexOfObject:", v6),
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(a1[6], "addObject:", v6);
  }

}

uint64_t sub_100010D60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100010F10(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  float v42;
  void *v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  _BYTE v56[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100011324;
  v50[3] = &unk_10004D300;
  v51 = *(id *)(a1 + 40);
  v52 = *(id *)(a1 + 48);
  v4 = v2;
  v53 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v50);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v47;
    *(_QWORD *)&v7 = 138412290;
    v45 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", v45, (_QWORD)v46));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
        objc_msgSend(v13, "removeFromSuperlayer");

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));
        objc_msgSend(v15, "nilifyCALayers");

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
        objc_msgSend(v16, "removeObjectForKey:", v11);

        v17 = sub_100024FF4();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v45;
          v55 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removed hudLines item %@", buf, 0xCu);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudContentWithPendingAnimations"));
        objc_msgSend(v19, "removeObject:", v11);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v8);
  }

  v20 = sub_100024FF4();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_10002E18C(a1, v21, v22, v23, v24, v25, v26, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v28, "removeAllAnimations");

  if (*(_QWORD *)(a1 + 56))
  {
    v29 = 0;
    do
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v29));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v30));
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      v33 = objc_msgSend(v31, "isCurrent:withHUDUpdateInterval:", *(_QWORD *)(a1 + 64), v32 + 50.0);
      if (objc_msgSend(v31, "isTimedOut"))
        v34 = v33 | 2;
      else
        v34 = v33;
      objc_msgSend(*(id *)(a1 + 32), "updateHUDLineWithId:content:options:", v30, v31, v34);

      ++v29;
      v35 = *(_QWORD *)(a1 + 56);
    }
    while (v29 < v35);
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", v35, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sublayers"));
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootLayer"));
    objc_msgSend(v39, "setHidden:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
    objc_msgSend(v40, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "HUD_background_opacity");
    v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
    *(float *)&v44 = v42;
    objc_msgSend(v43, "setOpacity:", v44);

  }
}

void sub_100011324(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (v4 = (void *)v3, v5 = objc_msgSend(a1[5], "indexOfObject:", v6),
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(a1[6], "addObject:", v6);
  }

}

uint64_t sub_1000113A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100011BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100011BE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyLayer"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyLayer"));
    objc_msgSend(v6, "preferredFrameSize");
    v8 = v7;
    v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

    if (v8 > v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyLayer"));
      objc_msgSend(v10, "preferredFrameSize");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;

    }
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueLayer"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueLayer"));
    objc_msgSend(v14, "preferredFrameSize");
    v16 = v15;
    v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    if (v16 > v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueLayer"));
      objc_msgSend(v18, "preferredFrameSize");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;

    }
  }

}

void sub_100011ED8(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTheme"));
  v3 = objc_msgSend(v2, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerLayer"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011FD0;
  v9[3] = &unk_10004D3A0;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastKnownHangs"));
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastKnownHangs"));
    objc_msgSend(v7, "updateHangs:withCompletion:", v8, &stru_10004D3C0);

  }
}

void sub_100011FD0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_opt_class(HangHUDLine);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTheme"));
    objc_msgSend(v6, "setCurrentTheme:", v5);

  }
}

void sub_100012240(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getKeyForLine:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10002E1F4((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudContentWithPendingAnimations"));
    objc_msgSend(v11, "removeObject:", v2);

  }
}

void sub_100012344(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getKeyForLine:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10002E258((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudContentWithPendingAnimations"));
    objc_msgSend(v11, "addObject:", v2);

  }
}

void sub_10001259C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100012768(id a1)
{
  CGColorRef SRGB;
  CGColorRef v2;
  CGColorRef v3;
  CGColor *v4;
  CGColorRef CopyWithAlpha;
  CGColor *v6;
  CGColorRef v7;
  CGColorRef v8;
  CGColorRef v9;
  HUDTheme *v10;
  void *v11;

  SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  v2 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  v4 = CGColorCreateSRGB(0.921568627, 0.537254902, 0.0, 1.0);
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  v6 = CGColorCreateSRGB(0.949019608, 0.219607843, 0.180392157, 1.0);
  v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  v8 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  v9 = CGColorCreateSRGB(0.396078431, 0.396078431, 0.396078431, 1.0);
  v10 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]([HUDTheme alloc], "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:", v3, v2, v4, CopyWithAlpha, v6, v7, SRGB, v8, v9);
  v11 = (void *)qword_10005FC50;
  qword_10005FC50 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);
  CFRelease(v9);
}

void sub_10001295C(id a1)
{
  CGColorRef SRGB;
  CGColorRef v2;
  CGColorRef v3;
  CGColor *v4;
  CGColorRef CopyWithAlpha;
  CGColor *v6;
  CGColorRef v7;
  CGColorRef v8;
  CGColorRef v9;
  HUDTheme *v10;
  void *v11;

  SRGB = CGColorCreateSRGB(0.141176471, 0.141176471, 0.156862745, 1.0);
  v2 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  v4 = CGColorCreateSRGB(1.0, 0.584313725, 0.0392156863, 1.0);
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  v6 = CGColorCreateSRGB(1.0, 0.270588235, 0.22745098, 1.0);
  v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  v8 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  v9 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  v10 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]([HUDTheme alloc], "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:", v3, v2, v4, CopyWithAlpha, v6, v7, SRGB, v8, v9);
  v11 = (void *)qword_10005FC60;
  qword_10005FC60 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);
  CFRelease(v9);
}

uint64_t sub_100012BA8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync(a1);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v6, 2u);
    }

    return 0;
  }
}

BOOL sub_100012C54()
{
  id v0;
  void *v1;
  _BOOL8 v2;

  v0 = sub_100029788(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("HTEPL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

BOOL sub_100012CB0()
{
  id v0;
  void *v1;
  _BOOL8 v2;

  v0 = sub_100029788(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("HTThirdPartyDevSupport"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t sub_100012D0C(int a1)
{
  unsigned __int8 v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  __int16 v14;
  uint8_t v15[2];
  uint8_t buf[16];

  v2 = +[PerfDiagsSelfEnablementController isAnyModeActive](PerfDiagsSelfEnablementController, "isAnyModeActive");
  v3 = sub_100012CB0();
  v4 = sub_100024FF4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v2 & 1) != 0 || v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v10 = "ConfigureTailspinForEPL: A different HangTracer enablement mode is ACTIVE, do not attempt to configure tailspin";
      v11 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
LABEL_14:

    return 0;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ConfigureTailspinForEPL: Other HangTracer enablement modes are NOT active, attempt to configure tailspin", buf, 2u);
  }

  v7 = tailspin_config_create_with_default_config();
  if (!v7)
  {
    v12 = sub_100024FF4();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v10 = "ConfigureTailspinForEPL: Failed to create tailspin config object";
      v11 = v15;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v8 = v7;
  if (a1)
    tailspin_enabled_set(v7, 1);
  v9 = sub_100012BA8(v8);
  tailspin_config_free(v8);
  return v9;
}

uint64_t sub_100012E4C(int a1)
{
  id v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  int v12;
  const char *v13;

  if (sub_100012C54())
  {
    v2 = sub_100024FF4();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "configureTailspinForThirdPartyDevelopment";
      v4 = "%s: Not configuring tailspin since EPL is active";
      v5 = v3;
      v6 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, (uint8_t *)&v12, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v7 = tailspin_config_create_with_default_config();
  if (!v7)
  {
    v11 = sub_100024FF4();
    v3 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "configureTailspinForThirdPartyDevelopment";
      v4 = "%s: Failed to create tailspin config object";
      v5 = v3;
      v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
LABEL_11:

    return 0;
  }
  v8 = v7;
  if (a1)
  {
    tailspin_enabled_set(v7, 1);
    tailspin_buffer_size_set(v8, 50);
    tailspin_oncore_sampling_period_set(v8, 0);
    tailspin_full_sampling_period_set(v8, 10000000);
  }
  v9 = sub_100012BA8(v8);
  tailspin_config_free(v8);
  return v9;
}

void sub_10001303C(uint64_t a1)
{
  void *v2;
  void *v3;
  NSString *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName"));
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%i) : %p"), v3, getpid(), *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue(v4);

  v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithIdentifier:", v7);
  v6 = (void *)qword_10005FC68;
  qword_10005FC68 = (uint64_t)v5;

}

void sub_100013304(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification clientContextIdentifierKey](HangHUDServiceSpecification, "clientContextIdentifierKey"));
  objc_msgSend(v3, "encodeObject:forKey:", v2, v4);

}

void sub_100013368(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification interface](HangHUDServiceSpecification, "interface"));
  objc_msgSend(v3, "setInterface:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification serviceQuality](HangHUDServiceSpecification, "serviceQuality"));
  objc_msgSend(v3, "setServiceQuality:", v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000134A4;
  v10[3] = &unk_10004D470;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000134E4;
  v8[3] = &unk_10004D470;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001353C;
  v6[3] = &unk_10004D470;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);

}

void sub_1000134A4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "serverRunningDidChange:", *(_QWORD *)(a1 + 32));

}

void sub_1000134E4(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "serverRunningDidChange:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v5, "activate");
}

void sub_10001353C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "serverRunningDidChange:", *(_QWORD *)(a1 + 32));

}

id sub_100013E7C()
{
  if (qword_10005FC78 != -1)
    dispatch_once(&qword_10005FC78, &stru_10004D4B8);
  return (id)qword_10005FC80;
}

void sub_100013EBC(id a1)
{
  unint64_t v1;
  void *v2;
  unint64_t v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v1 = 2;
  do
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v1));
    objc_msgSend(v6, "addObject:", v2);

    v3 = v1 >> 41;
    v1 *= 2;
  }
  while (!v3);
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)qword_10005FC80;
  qword_10005FC80 = (uint64_t)v4;

}

void sub_100013F4C(id a1)
{
  const __CTFont *UIFontForLanguage;
  const __CTFontDescriptor *v2;
  NSNumber *v3;
  void *v4;
  const __CFDictionary *v5;
  const __CTFontDescriptor *CopyWithAttributes;
  CFStringRef v7;
  void *v8;

  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  v7 = kCTFontOpticalSizeAttribute;
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1000275E4());
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = v4;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v2, v5);

  qword_10005FC90 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithAttributes);
}

void sub_10001405C(id a1)
{
  const __CTFont *UIFontForLanguage;
  const __CTFontDescriptor *v2;
  const __CTFontDescriptor *CopyWithFeature;
  NSNumber *v4;
  void *v5;
  const __CFDictionary *v6;
  const __CTFontDescriptor *CopyWithAttributes;
  CFStringRef v8;
  void *v9;

  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v2, (CFNumberRef)&off_1000554F0, (CFNumberRef)&off_100055508);
  v8 = kCTFontOpticalSizeAttribute;
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1000275E4());
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CopyWithFeature, v6);

  qword_10005FCA0 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithFeature);
  CFRelease(CopyWithAttributes);
}

void sub_10001418C(id a1)
{
  qword_10005FCB0 = (uint64_t)CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
}

void sub_100014DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014DE4(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "preferredFrameSize");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32);
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v9, "preferredFrameSize");
  if (v6 < v7)
  {
    objc_msgSend(v9, "preferredFrameSize");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8;
  }
  if (a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(double *)(*(_QWORD *)(a1 + 32) + 8)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 32);

}

void sub_100015740(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100015760(void *a1)
{
  void *v1;
  _QWORD v3[2];

  if (objc_msgSend(a1, "isEqualToString:", CFSTR("HTThirdPartyDevSupport")))
  {
    v3[0] = CFSTR("HangTracerHUDThresholdMSec");
    v3[1] = CFSTR("HangTracerThirdPartyHangThreshold");
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
  }
  else
  {
    v1 = &__NSArray0__struct;
  }
  return v1;
}

void sub_100015CFC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  int *v13;
  char *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  mach_port_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  int v53;
  size_t v54;
  char *v55;
  unsigned int v56;
  unsigned int *v57;
  uint64_t v58;
  uint64_t v59;
  int *v60;
  unint64_t v61;
  vm_size_t v62;
  void *v63;
  char *v64;
  __CFString *v65;
  _BOOL4 v66;
  const __CFString *v67;
  char *v68;
  const char *v69;
  const char *v70;
  char *v71;
  unint64_t *v72;
  uint64_t v73;
  NSMutableString *v74;
  unint64_t v75;
  unint64_t v76;
  BOOL v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  size_t v82;
  char *v83;
  mach_port_t v84;
  uint64_t v85;
  uint64_t v86;
  mach_msg_type_number_t v87;
  mach_zone_info_array_t v88;
  char *v89;
  uint64_t v90;
  uint64_t *i;
  _BOOL4 v92;
  char *v93;
  const std::__fs::filesystem::path *v94;
  id v95;
  const std::__fs::filesystem::path *v96;
  std::error_code *v97;
  uint64_t v98;
  uint64_t v99;
  char *__s;
  char *__sa;
  int __fd;
  id v103;
  void *context;
  void *v105;
  void *v106;
  int x[2];
  int *v108;
  uint64_t v109;
  uint64_t v110;
  mach_msg_type_number_t infoCnt;
  uint64_t namesCnt;
  integer_t host_info64_out[4];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  mach_zone_info_array_t info[2];
  __int128 v124;
  __int128 v125;

  context = objc_autoreleasePoolPush();
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 52428800));
  if (v106
    && (v0 = (void *)qword_100060530,
        v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "stringFromDate:", v1)),
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memory-snapshot-%@.ips"), v2)), v2, v1, v105))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/root/Library/Caches/hangtracerd//%@"), v105));
    if (v3)
    {
      v4 = objc_retainAutorelease(v3);
      __fd = open_dprotected_np((const char *)objc_msgSend(v4, "UTF8String"), 514, 4, 0, 420);
      if (__fd < 0)
      {
        v11 = objc_retainAutorelease(v4);
        v12 = objc_msgSend(v11, "UTF8String");
        v13 = __error();
        v14 = strerror(*v13);
        NSLog(CFSTR("Could not create file - won't take a memory snapshot: %s %s"), v12, v14);
        goto LABEL_13;
      }
      v103 = v4;
      v5 = v106;
      if (!qword_10005FCB8)
      {
        v6 = (void *)_CFCopyServerVersionDictionary();
        if (!v6)
          v6 = (void *)_CFCopySupplementalVersionDictionary();
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", _kCFSystemVersionProductVersionKey));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", _kCFSystemVersionProductNameKey));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", _kCFSystemVersionBuildVersionKey));
        if (v8)
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("iPhone OS"), CFSTR("iOS")));
        else
          v10 = CFSTR("???");
        v15 = CFSTR("???");
        if (v7)
          v16 = v7;
        else
          v16 = CFSTR("???");
        if (v9)
          v15 = v9;
        v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v10, v16, v15));
        if (v8)

        v18 = (void *)qword_10005FCB8;
        qword_10005FCB8 = v17;

        __strlcpy_chk(&unk_1000601C0, "{\"bug_type\":\"152\",\"os_version\":\"", 100, 100);
        __strlcat_chk(&unk_1000601C0, objc_msgSend((id)qword_10005FCB8, "UTF8String"), 100, 100);
        __strlcat_chk(&unk_1000601C0, "\"}\n", 100, 100);
        uname((utsname *)&unk_10005FCC0);
      }
      objc_msgSend(v5, "appendFormat:", CFSTR("%s"), &unk_1000601C0);
      v19 = (void *)qword_100060530;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringFromDate:", v20));
      objc_msgSend(v5, "appendFormat:", CFSTR("{\n\"Model\" : \"%s\",\n\"Timestamp\" : \"%@\",\n\"OSVersion\" : \"%@\"\n}\n"), &unk_1000600C0, v21, qword_10005FCB8);

      objc_msgSend(v5, "appendString:", CFSTR("{\n"));
      v22 = v5;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 22));
      v122 = 0;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      *(_OWORD *)host_info64_out = 0u;
      HIDWORD(namesCnt) = 38;
      v24 = mach_host_self();
      *(_QWORD *)x = 0;
      v108 = x;
      v109 = 0x2020000000;
      v110 = 0;
      if (host_statistics64(v24, 4, host_info64_out, (mach_msg_type_number_t *)&namesCnt + 1))
      {
        objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("host_statistics64 failed"), CFSTR("error"));
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", vm_kernel_page_size));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("page_size"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", host_info64_out[0]));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("free_count"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", host_info64_out[1]));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("active_count"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", host_info64_out[2]));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, CFSTR("inactive_count"));

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", host_info64_out[3]));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("wire_count"));

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v114));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, CFSTR("zero_fill_count"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v114 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("reactivations"));

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v115));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, CFSTR("pageins"));

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v115 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, CFSTR("pageouts"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v116));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, CFSTR("faults"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v116 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v35, CFSTR("cow_faults"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v117));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v36, CFSTR("lookups"));

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v117 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, CFSTR("hits"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v118));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, CFSTR("purges"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD2(v118)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v39, CFSTR("purgeable_count"));

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v118)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v40, CFSTR("speculative_count"));

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v119));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v41, CFSTR("decompressions"));

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v119 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v42, CFSTR("compressions"));

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v120));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v43, CFSTR("swapins"));

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v120 + 1)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v44, CFSTR("swapouts"));

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v121));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v45, CFSTR("compressor_page_count"));

        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD1(v121)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v46, CFSTR("throttled_count"));

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD2(v121)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v47, CFSTR("external_page_count"));

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v121)));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v48, CFSTR("internal_page_count"));

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v122));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v49, CFSTR("total_uncompressed_pages_in_compressor"));

      }
      v50 = objc_msgSend(v23, "count");
      *((_QWORD *)v108 + 3) = v50;
      info[0] = (mach_zone_info_array_t)_NSConcreteStackBlock;
      info[1] = (mach_zone_info_array_t)3221225472;
      *(_QWORD *)&v124 = sub_100016D6C;
      *((_QWORD *)&v124 + 1) = &unk_10004DB00;
      v51 = v22;
      *(_QWORD *)&v125 = v51;
      *((_QWORD *)&v125 + 1) = x;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", info);
      mach_port_deallocate(mach_task_self_, v24);

      _Block_object_dispose(x, 8);
      v52 = v51;
      __s = 0;
      v124 = 0u;
      v125 = 0u;
      *(_OWORD *)info = 0u;
      *(_QWORD *)x = 0;
      if (dword_100060224)
        goto LABEL_28;
      pid_for_task(mach_task_self_, x);
      if ((ledger(0, *(_QWORD *)x, info, 0) & 0x80000000) != 0
        || (__s = (char *)malloc_type_malloc(96 * *((_QWORD *)&v125 + 1), 0x1000040565EDBD2uLL)) == 0)
      {

        goto LABEL_109;
      }
      dword_100060228 = DWORD2(v125);
      if ((ledger(2, __s, &dword_100060228, 0) & 0x80000000) != 0)
      {
        v55 = 0;
        v57 = 0;
        v78 = 0;
        v83 = __s;
        goto LABEL_84;
      }
      v79 = dword_100060228;
      if (dword_100060228)
      {
        v80 = 0;
        v81 = __s;
        do
        {
          v82 = strlen(v81);
          if (!strncmp(v81, "phys_footprint", v82))
            goto LABEL_81;
          ++v80;
          v81 += 96;
        }
        while (v79 != v80);
        v78 = 0;
        v57 = 0;
        v55 = 0;
        dword_100060224 = v79;
        goto LABEL_83;
      }
      LODWORD(v80) = 0;
LABEL_81:
      dword_100060224 = v80;
      if ((_DWORD)v80 != (_DWORD)v79)
      {
LABEL_28:
        v53 = memorystatus_control(1, 0, 0, 0, 0);
        if (v53)
        {
          v54 = 2 * v53;
          v55 = (char *)malloc_type_malloc(v54, 0x8B035FCBuLL);
          if (v55 && (v56 = memorystatus_control(1, 0, 0, v55, v54)) != 0)
          {
            v57 = (unsigned int *)malloc_type_malloc(56 * dword_100060228, 0x100004021716A34uLL);
            if (v57)
            {
              objc_msgSend(v52, "appendString:", CFSTR("\"Processes\" :\n[\n"));
              if (v56 >= 0x18)
              {
                v58 = 0;
                LODWORD(v59) = v56 / 0x18;
                if (v56 / 0x18 <= 1)
                  v59 = 1;
                else
                  v59 = v59;
                v98 = v56 / 0x18;
                v99 = v59;
                while (1)
                {
                  v60 = (int *)&v55[24 * v58];
                  if ((ledger(1, *v60, v57, &dword_100060228) & 0x80000000) == 0)
                    break;
                  v65 = 0;
                  ++v58;
LABEL_66:

                  if (v58 == v99)
                    goto LABEL_67;
                }
                v61 = v57[14 * dword_100060224];
                v62 = vm_kernel_page_size;
                if ((proc_pidpath(*v60, host_info64_out, 0x1000u) & 0x80000000) == 0)
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", host_info64_out));
                  v64 = (char *)objc_msgSend(v63, "rangeOfString:options:", CFSTR("/"), 4);
                  if (v64 != (char *)0x7FFFFFFFFFFFFFFFLL
                    && (v65 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "substringFromIndex:", v64 + 1))) != 0
                    || (v65 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UnknownProcess_%d"), *v60))) != 0)
                  {
                    v66 = -[__CFString length](v65, "length") == 0;

                    v67 = CFSTR("No_Name");
                    if (!v66)
                      v67 = v65;
                    goto LABEL_48;
                  }

                }
                v65 = 0;
                v67 = CFSTR("No_Name");
LABEL_48:
                v68 = &v55[24 * v58];
                v69 = "Y";
                if ((*((_DWORD *)v68 + 5) & 0x20) == 0)
                  v69 = "N";
                v70 = "-";
                if ((*((_DWORD *)v68 + 5) & 8) != 0)
                  v70 = v69;
                objc_msgSend(v52, "appendFormat:", CFSTR("{\"ProcessName\":\"%@\", \"Priority\":%d, \"Footprint\":%d, \"Dirty\":\"%s\""), v67, *((unsigned int *)v68 + 1), v61 / v62, v70);
                v71 = &v55[24 * v58];
                v73 = *((_QWORD *)v71 + 1);
                v72 = (unint64_t *)(v71 + 8);
                if (v73)
                {
                  v74 = objc_opt_new(NSMutableString);
                  v75 = *v72;
                  objc_msgSend(v52, "appendString:", CFSTR(", \"Assertions\":["));
                  if (v75)
                  {
                    v76 = 0;
                    do
                    {
                      if ((v75 & 1) != 0)
                      {
                        if (v76 > 0x1A)
                          -[NSMutableString appendFormat:](v74, "appendFormat:", CFSTR("\"UnknownAssertion_%d\""), v76);
                        else
                          -[NSMutableString appendString:](v74, "appendString:", off_10004DA20[v76]);
                        if (v75 < 2)
                          break;
                        -[NSMutableString appendString:](v74, "appendString:", CFSTR(","));
                      }
                      ++v76;
                      v77 = v75 >= 2;
                      v75 >>= 1;
                    }
                    while (v77);
                  }
                  objc_msgSend(v52, "appendFormat:", CFSTR("%@]"), v74);

                }
                objc_msgSend(v52, "appendString:", CFSTR("}"));
                if (++v58 == v98)
                  v58 = v98;
                else
                  objc_msgSend(v52, "appendString:", CFSTR(",\n"));
                goto LABEL_66;
              }
LABEL_67:
              objc_msgSend(v52, "appendString:", CFSTR("],\n"));
              v78 = 1;
            }
            else
            {
              v78 = 0;
            }
          }
          else
          {
            v78 = 0;
            v57 = 0;
          }
LABEL_83:
          v83 = __s;
          if (!__s)
          {
LABEL_85:
            if (v55)
              free(v55);
            if (v57)
            {
              free(v57);

              if ((v78 & 1) == 0)
                goto LABEL_109;
LABEL_91:
              __sa = (char *)v52;
              namesCnt = 0;
              *(_QWORD *)host_info64_out = 0;
              info[0] = 0;
              *(_QWORD *)x = 0;
              infoCnt = 0;
              v84 = mach_host_self();
              if (mach_memory_info(v84, (mach_zone_name_array_t *)x, (mach_msg_type_number_t *)&namesCnt, info, &infoCnt, (mach_memory_info_array_t *)host_info64_out, (mach_msg_type_number_t *)&namesCnt + 1) < 0)
              {
                v92 = 0;
              }
              else
              {
                objc_msgSend(__sa, "appendString:", CFSTR("\"Zones\" :\n[\n"));
                v85 = *(_QWORD *)x;
                v87 = infoCnt;
                v86 = namesCnt;
                v88 = info[0];
                v89 = __sa;
                if ((_DWORD)v86 && (_DWORD)v86 == v87)
                {
                  v90 = v86 - 1;
                  for (i = &v88->mzi_cur_size; ; i += 8)
                  {
                    objc_msgSend(v89, "appendFormat:", CFSTR("{ \"Name\" : \"%s\", \"Pages\" : %llu }"), v85, *i / vm_kernel_page_size);
                    if (!v90)
                      break;
                    objc_msgSend(v89, "appendString:", CFSTR(","));
                    objc_msgSend(v89, "appendString:", CFSTR("\n"));
                    --v90;
                    v85 += 80;
                  }
                  objc_msgSend(v89, "appendString:", CFSTR("\n"));
                }
                v92 = v86 == v87;

                if (v92)
                {
                  objc_msgSend(v89, "appendString:", CFSTR("]\n"));
                  v92 = 1;
                }
              }
              if (*(_QWORD *)x)
                vm_deallocate(mach_task_self_, *(vm_address_t *)x, 80 * namesCnt);
              if (info[0])
                vm_deallocate(mach_task_self_, (vm_address_t)info[0], (unint64_t)infoCnt << 6);
              if (*(_QWORD *)host_info64_out)
                vm_deallocate(mach_task_self_, *(vm_address_t *)host_info64_out, 176 * HIDWORD(namesCnt));

              if (v92)
              {
                objc_msgSend(__sa, "appendString:", CFSTR("}\n"));
                v93 = objc_retainAutorelease(__sa);
                write(__fd, objc_msgSend(v93, "UTF8String"), (size_t)objc_msgSend(v93, "lengthOfBytesUsingEncoding:", 4));
                close(__fd);
                v11 = objc_retainAutorelease(v103);
                v94 = (const std::__fs::filesystem::path *)objc_msgSend(v11, "UTF8String");
                v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/Library/Logs/CrashReporter//%@"), v105)));
                v96 = (const std::__fs::filesystem::path *)objc_msgSend(v95, "UTF8String");
                rename(v94, v96, v97);

                goto LABEL_13;
              }
              goto LABEL_109;
            }

            if (v78)
              goto LABEL_91;
LABEL_109:
            LODWORD(v3) = __fd;
            goto LABEL_12;
          }
LABEL_84:
          free(v83);
          goto LABEL_85;
        }
      }
      v78 = 0;
      v57 = 0;
      v55 = 0;
      goto LABEL_83;
    }
  }
  else
  {
    LODWORD(v3) = 0;
    v105 = 0;
  }
  v103 = 0;
LABEL_12:
  close((int)v3);
  v11 = objc_retainAutorelease(v103);
  unlink((const char *)objc_msgSend(v11, "UTF8String"));
LABEL_13:
  objc_autoreleasePoolPop(context);

}

void sub_100016D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100016D6C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\" : %lu"), v6, objc_msgSend(a3, "unsignedIntegerValue"));

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void sub_100016E80(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100060230;
  qword_100060230 = (uint64_t)v1;

}

void sub_100016FD4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100060240;
  qword_100060240 = (uint64_t)v1;

}

void sub_1000173A8(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSMutableServiceInterface interfaceWithIdentifier:](BSMutableServiceInterface, "interfaceWithIdentifier:", v1));

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___HangHUDServerProtocol));
  objc_msgSend(v5, "setServer:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)qword_100060250;
  qword_100060250 = (uint64_t)v3;

}

uint64_t sub_10001744C(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "enableLoggingForWidgetRenderer");

  if ((v3 & 1) != 0 || (objc_msgSend(v1, "containsString:", CFSTR("WidgetRenderer-Default")) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = objc_msgSend(v5, "enableLoggingForPoster");

    if ((v6 & 1) != 0 || (objc_msgSend(v1, "containsString:", CFSTR("PosterBoard")) & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v1, 0);
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "extensionPointRecord"));
        v4 = v9;
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

          LODWORD(v4) = (int)(v11 << 31) >> 31;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

id sub_10001756C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("/var/root/Library/Caches/hangtracerd/spool");
  v6[1] = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v5[0] = CFSTR("UIKit-runloop");
  v5[1] = CFSTR("Fence-hang");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v2 = sub_10001764C(v0, v1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id sub_10001764C(void *a1, void *a2, int a3)
{
  id v5;
  NSURLResourceKey v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  id v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _QWORD v55[2];
  _BYTE v56[128];

  v5 = a1;
  v36 = a2;
  v34 = objc_opt_new(NSMutableArray);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v31)
  {
    v30 = a3 ^ 1u;
    v29 = *(_QWORD *)v50;
    v6 = NSURLIsDirectoryKey;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(obj);
        v33 = v7;
        v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v7)));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v55[0] = v6;
        v55[1] = NSURLNameKey;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
        v32 = (void *)v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v10, v30, &stru_10004DB20));

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v38 = v11;
        v12 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v46;
          v35 = *(_QWORD *)v46;
          do
          {
            v15 = 0;
            v37 = v13;
            do
            {
              if (*(_QWORD *)v46 != v14)
                objc_enumerationMutation(v38);
              v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v15);
              v17 = objc_autoreleasePoolPush();
              v44 = 0;
              objc_msgSend(v16, "getResourceValue:forKey:error:", &v44, v6, 0);
              v18 = v44;
              if ((objc_msgSend(v18, "BOOLValue") & 1) == 0)
              {
                v43 = 0;
                objc_msgSend(v16, "getResourceValue:forKey:error:", &v43, NSURLNameKey, 0);
                v19 = v43;
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                v42 = 0u;
                v21 = v36;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v40;
                  while (2)
                  {
                    for (i = 0; i != v23; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v40 != v24)
                        objc_enumerationMutation(v21);
                      if ((objc_msgSend(v20, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i)) & 1) != 0)
                      {

                        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
                        -[NSMutableArray addObject:](v34, "addObject:", v21);
                        goto LABEL_22;
                      }
                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
                    if (v23)
                      continue;
                    break;
                  }
LABEL_22:
                  v6 = NSURLIsDirectoryKey;
                  v14 = v35;
                }

                v13 = v37;
              }

              objc_autoreleasePoolPop(v17);
              v15 = (char *)v15 + 1;
            }
            while (v15 != v13);
            v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v13);
        }

        v7 = v33 + 1;
      }
      while ((id)(v33 + 1) != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v31);
  }

  v26 = -[NSMutableArray copy](v34, "copy");
  return v26;
}

uint64_t sub_100017A18(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSDateFormatter *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  const char *v26;
  int v27;
  int v28;
  id v29;
  int v30;
  int v31;
  id v32;
  int v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  int v44;
  void *v46;
  id v47;
  const char *v48;
  id v49;
  uint64_t v50;
  int v51;
  int v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  uint32_t v57;
  void *v58;
  int v59;
  int v60;
  int v61;
  ssize_t v62;
  ssize_t v63;
  uint64_t v64;
  id v65;
  id v66;
  int v67;
  int v68;
  id v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  NSObject *v74;
  int v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  int v79;
  uint64_t v80;
  int v81;
  id v82;
  int v83;
  uint64_t v84;
  int v85;
  id v86;
  NSObject *v87;
  int v88;
  uint64_t v89;
  void *v90;
  int v91;
  id v92;
  id v93;
  NSObject *v94;
  int v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  id v99;
  NSObject *v100;
  id v101;
  id v102;
  int v103;
  void *v104;
  uint64_t v105;
  id v106;
  NSDateFormatter *v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  stat v120;
  uint8_t v121[128];
  uint8_t v122[4];
  uint64_t v123;
  __int16 v124;
  int v125;
  __int16 v126;
  uint64_t v127;
  uint8_t buf[4];
  _BYTE v129[20];
  id v130;

  v3 = a1;
  v4 = MGCopyAnswer(CFSTR("HWModelStr"), 0);
  v5 = MGCopyAnswer(CFSTR("SupplementalBuildVersion"), 0);
  v6 = objc_opt_new(NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v7));
  v113 = (void *)v4;
  v114 = (void *)v5;
  v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@-%@.%@"), CFSTR("ArchivedHangs"), v4, v5, v8, CFSTR("tgz")));

  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/tmp", v9));
  v12 = sub_10001756C();
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_retainAutorelease(v11);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  if (MKBDeviceUnlockedSinceBoot())
    v16 = 3;
  else
    v16 = 2;
  v17 = open_dprotected_np(v15, 514, v16, 0, 416);
  if ((v17 & 0x80000000) != 0)
  {
    v25 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v129 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Error getting file descriptor for %s due to protection classes", buf, 0xCu);
    }
    goto LABEL_24;
  }
  v18 = v17;
  v112 = v3;
  v19 = archive_write_new();
  v20 = archive_write_add_filter_gzip();
  if (v20)
  {
    v21 = v20;
    archive_write_free(v19);
    close(v18);
    v22 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v129 = v21;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = archive_errno(v19);
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = archive_error_string(v19);
      v24 = "Error creating compressed file (archive_write_add_filter_gzip): %i err_num: %i, err_string: %s";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (a2)
    v26 = "compression-level=0";
  else
    v26 = "compression-level=1";
  v27 = archive_write_set_options(v19, v26);
  if (v27)
  {
    v28 = v27;
    archive_write_free(v19);
    close(v18);
    v29 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v129 = v28;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = archive_errno(v19);
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = archive_error_string(v19);
      v24 = "Error creating compressed file (archive_write_set_options): %i err_num: %i, err_string: %s";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v30 = archive_write_set_format_pax(v19);
  if (v30)
  {
    v31 = v30;
    archive_write_free(v19);
    close(v18);
    v32 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v129 = v31;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = archive_errno(v19);
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = archive_error_string(v19);
      v24 = "Error creating compressed file (archive_write_set_format_pax): %i err_num: %i, err_string: %s";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v33 = archive_write_open_fd(v19, v18);
  if (v33)
  {
    v34 = v33;
    archive_write_free(v19);
    close(v18);
    v35 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v129 = v34;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = archive_errno(v19);
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = archive_error_string(v19);
      v24 = "Error creating compressed file (archive_write_open_fd): %i err_num: %i, err_string: %s";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v104 = v10;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v23 = v13;
  v106 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v116, v121, 16);
  if (!v106)
    goto LABEL_56;
  v109 = *(_QWORD *)v117;
  v107 = v6;
  v108 = v13;
  while (2)
  {
    v46 = 0;
    do
    {
      if (*(_QWORD *)v117 != v109)
        objc_enumerationMutation(v23);
      v47 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v46));
      v48 = (const char *)objc_msgSend(v47, "UTF8String");
      v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastPathComponent")));
      v49 = objc_msgSend(v110, "UTF8String");
      v50 = archive_entry_new();
      memset(&v120, 0, sizeof(v120));
      v51 = stat(v48, &v120);
      if (v51)
      {
        v52 = v51;
        archive_entry_free(v50);
        v53 = sub_100024FF4();
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
LABEL_43:
          v6 = v107;
          v13 = v108;
          v58 = v110;

          goto LABEL_44;
        }
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v129 = v48;
        *(_WORD *)&v129[8] = 1024;
        *(_DWORD *)&v129[10] = v52;
        v55 = v54;
        v56 = "Error stat-ing original file: %s with error: %i. Will skip.";
        v57 = 18;
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, v57);
        goto LABEL_43;
      }
      v105 = v50;
      v59 = open(v48, 0);
      if (v59 < 0)
      {
        archive_entry_free(v50);
        v65 = sub_100024FF4();
        v54 = objc_claimAutoreleasedReturnValue(v65);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v129 = v48;
        v55 = v54;
        v56 = "Error getting fd for file: %s. Will skip.";
        v57 = 12;
        goto LABEL_42;
      }
      v60 = v59;
      archive_entry_copy_stat(v105, &v120);
      archive_entry_set_pathname(v105, v49);
      archive_entry_set_filetype(v105, 0x8000);
      archive_entry_set_perm(v105, 420);
      v61 = archive_write_header(v19, v105);
      if (v61)
      {
        v85 = v61;
        archive_entry_free(v105);
        v86 = sub_100024FF4();
        v87 = objc_claimAutoreleasedReturnValue(v86);
        v6 = v107;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = archive_errno(v19);
          v89 = archive_error_string(v19);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v129 = v85;
          *(_WORD *)&v129[4] = 1024;
          *(_DWORD *)&v129[6] = v88;
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = v89;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Error creating compressed file (archive_write_header): %i err_num: %i, err_string: %s", buf, 0x18u);
        }

LABEL_62:
        v36 = v113;
        v10 = v104;
        v13 = v108;
        archive_write_free(v19);
        close(v18);
        v77 = sub_100024FF4();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v79 = archive_errno(v19);
          v80 = archive_error_string(v19);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v129 = v79;
          *(_WORD *)&v129[4] = 2080;
          *(_QWORD *)&v129[6] = v80;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Error creating compressed file (addFileToZippingArchive) err_num: %i, err_string: %s", buf, 0x12u);
        }

        v3 = v112;
        goto LABEL_25;
      }
      v62 = read(v60, buf, 0x2000uLL);
      v6 = v107;
      if (v62 >= 1)
      {
        v63 = v62;
        while (1)
        {
          v64 = archive_write_data(v19, buf, v63);
          if (v64 != v63)
            break;
          v63 = read(v60, buf, 0x2000uLL);
          if (v63 < 1)
            goto LABEL_52;
        }
        v72 = v64;
        v73 = sub_100024FF4();
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = archive_errno(v19);
          v76 = archive_error_string(v19);
          *(_DWORD *)v122 = 134218498;
          v123 = v72;
          v124 = 1024;
          v125 = v75;
          v126 = 2080;
          v127 = v76;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Error writing data to archive: %zd byte written with err_num: %i, err_string: %s", v122, 0x1Cu);
        }

        archive_entry_free(v105);
        close(v60);
        goto LABEL_62;
      }
LABEL_52:
      archive_entry_free(v105);
      close(v60);
      v13 = v108;
      v58 = v110;
LABEL_44:

      v46 = (char *)v46 + 1;
    }
    while (v46 != v106);
    v66 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v116, v121, 16);
    v106 = v66;
    if (v66)
      continue;
    break;
  }
LABEL_56:

  v67 = archive_write_close(v19);
  v68 = archive_write_free(v19);
  if (v67)
  {
    close(v18);
    v69 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v69);
    v10 = v104;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v70 = archive_errno(v19);
      v71 = archive_error_string(v19);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v129 = v67;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = v70;
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = v71;
      v24 = "Error creating compressed file (archive_write_close): %i err_num: %i, err_string: %s";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v81 = v68;
  close(v18);
  v10 = v104;
  if (!v81)
  {

    v43 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v112, v104));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v115 = 0;
    v91 = objc_msgSend(v90, "moveItemAtPath:toPath:error:", v14, v43, &v115);
    v92 = v115;

    if ((v91 & 1) != 0)
    {
      v111 = v92;
      v93 = v13;
      v94 = objc_retainAutorelease(v43);
      v95 = chmod((const char *)-[NSObject UTF8String](v94, "UTF8String"), 0x1B6u);
      v96 = sub_100024FF4();
      v97 = objc_claimAutoreleasedReturnValue(v96);
      v98 = v97;
      v36 = v113;
      if (v95)
      {
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v129 = v94;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Failed to chmod file: %@", buf, 0xCu);
        }
        v41 = 0;
      }
      else
      {
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          sub_10002E6C0((uint64_t)v94, v98);
        v41 = 1;
      }
      v13 = v93;
      v92 = v111;
    }
    else
    {
      v99 = sub_100024FF4();
      v100 = objc_claimAutoreleasedReturnValue(v99);
      v36 = v113;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v129 = v14;
        *(_WORD *)&v129[8] = 2112;
        *(_QWORD *)&v129[10] = v43;
        *(_WORD *)&v129[18] = 2112;
        v130 = v92;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Unable to move file %@ to final path %@: %@", buf, 0x20u);
      }

      v101 = objc_retainAutorelease(v14);
      if ((unlink((const char *)objc_msgSend(v101, "UTF8String")) & 0x80000000) == 0)
      {
        v41 = 0;
LABEL_88:
        v37 = v114;

        v3 = v112;
LABEL_32:

        goto LABEL_33;
      }
      v102 = sub_100024FF4();
      v98 = objc_claimAutoreleasedReturnValue(v102);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v103 = *__error();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v129 = v101;
        *(_WORD *)&v129[8] = 1024;
        *(_DWORD *)&v129[10] = v103;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Unable to unlink temp archive file %@ due to error %{darwin.errno}d", buf, 0x12u);
      }
      v41 = 0;
    }

    goto LABEL_88;
  }
  v82 = sub_100024FF4();
  v23 = objc_claimAutoreleasedReturnValue(v82);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v83 = archive_errno(v19);
    v84 = archive_error_string(v19);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v129 = v81;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = v83;
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = v84;
    v24 = "Error creating compressed file (archive_write_free): %i err_num: %i, err_string: %s";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x18u);
  }
LABEL_23:
  v3 = v112;
LABEL_24:
  v36 = v113;
LABEL_25:
  v37 = v114;

  v38 = sub_100024FF4();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v129 = v14;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Failed to createZippedArchive: %@", buf, 0xCu);
  }

  v40 = objc_retainAutorelease(v14);
  if (unlink((const char *)objc_msgSend(v40, "UTF8String")) < 0)
  {
    v42 = sub_100024FF4();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = *__error();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v129 = v40;
      *(_WORD *)&v129[8] = 1024;
      *(_DWORD *)&v129[10] = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Unable to unlink temp archive file %@ due to error %{darwin.errno}d", buf, 0x12u);
    }
    v41 = 0;
    goto LABEL_32;
  }
  v41 = 0;
LABEL_33:

  return v41;
}

BOOL sub_100018744(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  int v9;
  NSURL *v10;
  __int16 v11;
  NSError *v12;

  v4 = a2;
  v5 = a3;
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error handling url %@: %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

id sub_100018814(double a1)
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  NSString *v6;

  if ((sub_100028370() & 1) != 0)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](HUDConfiguration, "sharedInstance"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = v2;
  v4 = objc_msgSend(v2, "runloopHangTimeoutDurationMSec");

  v5 = (double)(unint64_t)v4;
  if ((double)(unint64_t)v4 <= a1)
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.f+ ms"), v5, (double)(unint64_t)v4);
  else
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.f ms"), v5, *(_QWORD *)&a1);
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

void sub_100018BA0(uint64_t a1, double a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018C04;
  v4[3] = &unk_10004CE60;
  v4[4] = v2;
  *(double *)&v4[5] = a2;
  dispatch_sync(v3, v4);
}

void sub_100018C04(uint64_t a1)
{
  id v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  NSObject *v7;

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v2 = sub_100018814(*(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "setString:", v3);

  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10002E924(v4, v7);

}

void sub_100018C7C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018CDC;
  block[3] = &unk_10004D278;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_100018CDC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void sub_100018D98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id sub_100018DA4(int a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _BYTE buffer[4096];

  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(a1, buffer, 0x1000u))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
    if (!v2)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buffer, 1));
      v3 = sub_100024FF4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        sub_10002E9B4((uint64_t)v2, v4);

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

__CFString *sub_100018EA0(void *a1)
{
  __CFString *v1;
  CFURLRef v2;
  CFURLRef v3;
  __CFBundle *v4;
  __CFBundle *v5;
  CFStringRef Identifier;
  __CFString *v7;

  v1 = a1;
  if (v1 && (v2 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    v3 = v2;
    v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(kCFAllocatorDefault, v2);
    if (v4)
    {
      v5 = v4;
      Identifier = CFBundleGetIdentifier(v4);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(Identifier);
      CFRelease(v5);
    }
    else
    {
      v7 = &stru_10004F0D8;
    }
    CFRelease(v3);
  }
  else
  {
    v7 = &stru_10004F0D8;
  }

  return v7;
}

id sub_100018F40(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a2, NSLocalizedDescriptionKey));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SentryTailspinError"), a1, v3));

  return v4;
}

uint64_t sub_100018FB8(void *a1, int a2)
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  NSFileAttributeKey v26;
  const __CFString *v27;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v21))
    v5 = v21 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
    }

    if (a2)
    {
      v26 = NSFileOwnerAccountName;
      v27 = CFSTR("mobile");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    }
    else
    {
      v8 = 0;
    }
    v20 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v8, &v20);
    v10 = v20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v3, &v21);

    if (v21)
      v9 = v12;
    else
      v9 = 0;
    v13 = sub_100024FF4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v9 == 1)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v23 = v3;
        v16 = "Successfully created directory at path %@";
        v17 = v14;
        v18 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v23 = v3;
      v24 = 2112;
      v25 = v10;
      v16 = "Error: error creating directory at path %@ %@";
      v17 = v14;
      v18 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  v9 = 1;
LABEL_21:

  return v9;
}

void sub_100019200(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10002EA28((uint64_t)v1, v4);

  v18 = v1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 0, &stru_10004DB90));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v19 = 0;
        v13 = objc_msgSend(v2, "removeItemAtURL:error:", v12, &v19);
        v14 = v19;
        v15 = sub_100024FF4();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if ((v13 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Successfully deleted file at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v12;
          v26 = 2112;
          v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to delete file at %@ : %@", buf, 0x16u);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }

}

BOOL sub_100019468(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  int v9;
  NSURL *v10;
  __int16 v11;
  NSError *v12;

  v4 = a2;
  v5 = a3;
  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

void sub_100019538(int a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  int v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  const __CFString *v33;
  void *v34;

  v33 = CFSTR("Subsystems");
  v31[0] = CFSTR("com.apple.hangtracer");
  v31[1] = CFSTR("com.apple.performancelogging");
  v32[0] = &off_1000555A0;
  v32[1] = &off_1000555A0;
  v31[2] = CFSTR("com.apple.Sentry.Framework");
  v32[2] = &off_1000555A0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v34 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

  v28 = 0;
  v4 = OSLogValidateProfilePayload(v3, &v28);
  v5 = v28;
  v6 = v5;
  if (v4)
  {
    v7 = sub_100024FF4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully validated profile payload", buf, 2u);
    }

    if (a1)
    {
      v27 = 0;
      v9 = OSLogInstallProfilePayload(v3, &v27);
      v10 = v27;
      v11 = v10;
      if (v9)
      {
        v12 = sub_100024FF4();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v14 = "Successfully installed profile payload";
LABEL_14:
          v16 = v13;
          v17 = OS_LOG_TYPE_INFO;
          v18 = 2;
          goto LABEL_15;
        }
        goto LABEL_23;
      }
      if (v10)
      {
        v22 = sub_100024FF4();
        v13 = objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v23 = objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v11, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v30 = v23;
        v24 = "Failed to install os log profile payload with error: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);

        goto LABEL_23;
      }
    }
    else
    {
      v26 = 0;
      v19 = OSLogRemoveProfilePayload(v3, &v26);
      v20 = v26;
      v11 = v20;
      if (v19)
      {
        v21 = sub_100024FF4();
        v13 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v14 = "Successfully removed profile payload";
          goto LABEL_14;
        }
LABEL_23:

        goto LABEL_24;
      }
      if (v20)
      {
        v25 = sub_100024FF4();
        v13 = objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v23 = objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v11, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v30 = v23;
        v24 = "Failed to remove os log profile payload with error: %@";
        goto LABEL_22;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v5)
  {
    v15 = sub_100024FF4();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      v14 = "Failed to validate os log profile payload with error: %@";
      v16 = v11;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v14, buf, v18);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
LABEL_25:

}

id sub_100019864()
{
  if (qword_100060268 != -1)
    dispatch_once(&qword_100060268, &stru_10004DBB0);
  return (id)qword_100060260;
}

void sub_1000198A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", "signpost_hang");
  v2 = (void *)qword_100060260;
  qword_100060260 = (uint64_t)v1;

}

id sub_1000198D4()
{
  if (qword_100060278 != -1)
    dispatch_once(&qword_100060278, &stru_10004DBD0);
  return (id)qword_100060270;
}

void sub_100019914(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", "always_on_hang");
  v2 = (void *)qword_100060270;
  qword_100060270 = (uint64_t)v1;

}

void sub_100019944(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;

  v9 = a1;
  v10 = a2;
  v11 = a5;
  v18 = 0;
  *(_QWORD *)buf = 0;
  mach_get_times(buf, &v18, 0);
  v12 = v18;
  v13 = *(_QWORD *)buf;
  if (os_signpost_enabled(v11))
  {
    v14 = v11;
    v15 = v14;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = CFSTR("Unknown");
      *(_DWORD *)buf = 134349826;
      *(_QWORD *)&buf[4] = v12 - v13 + a3;
      if (v10)
        v17 = v10;
      else
        v17 = CFSTR("Unknown");
      v20 = 2050;
      v21 = v12 - v13 + a4;
      v22 = 2114;
      if (v9)
        v16 = v9;
      v23 = v17;
      v24 = 2114;
      v25 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, a3, "HangInterval", "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{public, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x2Au);
    }

  }
}

uint64_t sub_100019AA8(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v14;
  int v15;
  NSObject *v16;
  __int16 v17;
  int v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HT_DISABLE_DEBUGGER_CHECK")));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Check for app is being debugged is disabled", buf, 2u);
    }

    return 0;
  }
  v21 = 0u;
  v22 = 0u;
  *(_OWORD *)buf = 0u;
  v20 = 0u;
  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    v9 = sub_100024FF4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Failed to check if app is being debugged", (uint8_t *)&v15, 2u);
    }
    v8 = 0;
    goto LABEL_18;
  }
  if ((v21 & 2) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v20));
    if ((-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("xctest")) & 1) != 0
      || (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("hangman")) & 1) != 0
      || -[NSObject hasSuffix:](v10, "hasSuffix:", CFSTR("-Runner")))
    {
      v11 = sub_100024FF4();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = v10;
        v17 = 1024;
        v18 = a1;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO", (uint8_t *)&v15, 0x12u);
      }
      v8 = 0;
    }
    else
    {
      v14 = sub_100024FF4();
      v12 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "App is being debugged, do not track this hang", (uint8_t *)&v15, 2u);
      }
      v8 = 1;
    }

LABEL_18:
    return v8;
  }
  return 0;
}

__CFString *sub_100019D20(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return *off_10004DBF0[a1];
}

__CFString *sub_100019D58(unint64_t a1)
{
  if (a1 <= 0xA)
    a1 = *off_10004DC18[a1];
  return (__CFString *)(id)a1;
}

BOOL sub_100019D88(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

const __CFString *sub_100019D98(unint64_t a1)
{
  if (a1 > 0xE)
    return CFSTR("tailspin capture failed for unknown reason");
  else
    return off_10004DC70[a1];
}

uint64_t sub_100019DBC(int a1, int a2, double a3)
{
  void *v4;
  double v5;
  void *v6;
  double v7;

  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = (double)(unint64_t)objc_msgSend(v4, "runloopLongHangDurationThresholdMSec");

    if (v5 <= a3)
    {
      return 222;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v7 = (double)(unint64_t)objc_msgSend(v6, "runloopHangDurationThresholdMSec");

      if (v7 <= a3)
        return 223;
      else
        return 310;
    }
  }
  else if (a2)
  {
    return 328;
  }
  else
  {
    return 228;
  }
}

uint64_t sub_100019E54(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("UIKit-runloop")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Fence-hang")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Slow-Launch")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Sentry")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "containsString:", CFSTR("Force-Quit")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 5;
  }

  return v2;
}

NSDate *sub_100019F18(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;

  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  v6 = sub_1000274A0((unint64_t)(v5 * 1000.0));
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", sub_100027440((unint64_t)(v6 - (double)a3) + a1));
}

BOOL sub_100019F70(unint64_t a1, uint64_t a2, double *a3)
{
  unsigned int v3;
  unint64_t v5;
  double v6;
  double v7;
  _BOOL8 result;

  v3 = atomic_load((unsigned int *)(a2 + 24));
  result = 0;
  if (!v3)
  {
    v5 = *(_QWORD *)a2;
    v6 = sub_1000273EC(a1);
    v7 = v6 - sub_1000273EC(v5);
    *a3 = v7;
    if (v7 > 100.0)
      return 1;
  }
  return result;
}

id sub_10001B018(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  void *v6;
  _DWORD v8[2];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HangTracer: Detected app exit (pid=%u), check for hangs", (uint8_t *)v8, 8u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "checkEventsForTimeouts:withType:", mach_absolute_time(), 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "recordHang");

  return +[HTProcessInfo stopWatchingPid:](HTProcessInfo, "stopWatchingPid:", *(unsigned int *)(a1 + 40));
}

id sub_10001B974(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[0] = off_10005F848;
  v8[0] = off_10005F830;
  v8[1] = off_10005F850;
  v2 = sub_100019D58(*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = off_10005F860;
  v8[3] = off_10005F858;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

id sub_10001BA78(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[0] = off_10005F840;
  v8[0] = off_10005F830;
  v8[1] = off_10005F850;
  v2 = sub_100019D58(*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = off_10005F860;
  v8[3] = off_10005F858;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

id sub_10001BB7C(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[0] = off_10005F838;
  v8[0] = off_10005F830;
  v8[1] = off_10005F850;
  v2 = sub_100019D58(*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = off_10005F860;
  v8[3] = off_10005F858;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

id sub_10001C988(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[0] = off_10005F838;
  v8[0] = off_10005F830;
  v8[1] = off_10005F850;
  v2 = sub_100019D58(*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = off_10005F860;
  v8[3] = off_10005F858;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

void sub_10001D464(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100060330;
  qword_100060330 = (uint64_t)v1;

}

void sub_10001D798(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[12];

  v3[0] = CFSTR("HTProfile");
  v3[1] = CFSTR("HTEPL");
  v3[2] = CFSTR("HTThirdPartyDevSupport");
  v3[3] = CFSTR("PLTasking");
  v3[4] = &stru_10004F0D8;
  v3[5] = CFSTR("PDSEHangTracer");
  v3[6] = CFSTR("PDSEHTBadDay");
  v3[7] = CFSTR("PDSEHTThirdParty");
  v3[8] = CFSTR("PDSEWorkflowResponsiveness");
  v3[9] = CFSTR("PDSEHTRateOnly");
  v3[10] = CFSTR("PDSESentry");
  v3[11] = CFSTR("PDSEAppLaunch");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 12));
  v2 = (void *)qword_100060348;
  qword_100060348 = v1;

}

void sub_10001FCF4(id a1)
{
  HTPrefs *v1;
  void *v2;

  v1 = objc_alloc_init(HTPrefs);
  v2 = (void *)qword_100060350;
  qword_100060350 = (uint64_t)v1;

}

void sub_100021A70(id a1)
{
  uint64_t v1;
  void *v2;
  size_t v3;
  _BYTE v4[37];

  memset(v4, 0, sizeof(v4));
  v3 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0))
  {
    v1 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
    v2 = (void *)qword_100060368;
    qword_100060368 = v1;

  }
}

void sub_100022B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  id *v51;
  uint64_t v52;

  objc_destroyWeak(v51);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v52 - 240), 8);
  _Block_object_dispose((const void *)(v52 - 208), 8);
  _Block_object_dispose((const void *)(v52 - 176), 8);
  _Block_object_dispose((const void *)(v52 - 144), 8);
  objc_destroyWeak((id *)(v52 - 112));
  _Unwind_Resume(a1);
}

void sub_100022BE4(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id *v11;
  id WeakRetained;
  unsigned int v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == a2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Tasking Changed";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == a2)
  {
    v6 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == a2)
  {
    v7 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Profile List Changed";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != a2)
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != a2)
      goto LABEL_19;
    v10 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
    goto LABEL_17;
  }
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: EPL State Changed", buf, 2u);
  }

  +[HTTailspin resetLogCountsForEPL](HTTailspin, "resetLogCountsForEPL");
LABEL_19:
  v11 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v13 = objc_msgSend(WeakRetained, "hangtracerDaemonEnabled");

  objc_msgSend(*(id *)(a1 + 32), "refreshHTPrefs");
  v14 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = objc_msgSend(v14, "hangtracerDaemonEnabled");

  if (v13 != (_DWORD)WeakRetained)
  {
    v15 = sub_100024FF4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (v13)
        v17 = CFSTR("ON");
      else
        v17 = CFSTR("OFF");
      v18 = objc_loadWeakRetained(v11);
      if (objc_msgSend(v18, "hangtracerDaemonEnabled"))
        v19 = CFSTR("ON");
      else
        v19 = CFSTR("OFF");
      *(_DWORD *)buf = 138412546;
      v28 = v17;
      v29 = 2112;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);

    }
    v20 = objc_loadWeakRetained(v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "hangtracerDaemonEnabled", CFSTR("Enabled"))));
    v26 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v24 = objc_loadWeakRetained(v11);
    objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("com.apple.hangtracer.daemonstate"), v24, v22);

  }
}

_QWORD *sub_100022F58(_QWORD *result, int a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) == a2)
  {
    v2 = sub_100024FF4();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }

    +[HTTailspin resetLogCountsForDailyRollover](HTTailspin, "resetLogCountsForDailyRollover");
    +[HTTailspin resetDailySentryTailspinCounts](HTTailspin, "resetDailySentryTailspinCounts");
    +[HTTailspin resetPerAppCounts](HTTailspin, "resetPerAppCounts");
    return +[HTTailspin refreshPerPeriodSentryLogCount](HTTailspin, "refreshPerPeriodSentryLogCount");
  }
  return result;
}

_QWORD *sub_100022FF4(_QWORD *result, int a2)
{
  _QWORD *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) == a2)
  {
    v2 = result;
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "HTPrefs: System Language Change Triggered Refresh", v5, 2u);
    }

    sub_100024E14();
    return objc_msgSend((id)v2[4], "refreshHTPrefs");
  }
  return result;
}

void sub_10002307C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Sentry Enablement Settings changed", (uint8_t *)v11, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 55);
  v6 = (__CFString *)*(id *)(v4 + 392);
  v7 = (void *)CFPreferencesCopyValue(CFSTR("allowSentryEnablement"), v6, CFSTR("mobile"), kCFPreferencesAnyHost);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 55) = objc_msgSend(v7, "BOOLValue");
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 55);
    v11[0] = 67109376;
    v11[1] = v5;
    v12 = 1024;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: Sentry Enablement Settings changed from %d -> %d", (uint8_t *)v11, 0xEu);
  }

}

void sub_1000231D8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed", (uint8_t *)v11, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 56);
  v6 = (__CFString *)*(id *)(v4 + 392);
  v7 = (void *)CFPreferencesCopyValue(CFSTR("allowWorkflowResponsivenessEnablement"), v6, CFSTR("mobile"), kCFPreferencesAnyHost);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(v7, "BOOLValue");
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
    v11[0] = 67109376;
    v11[1] = v5;
    v12 = 1024;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed from %d -> %d", (uint8_t *)v11, 0xEu);
  }

}

void sub_100023EF4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_100023F08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100023F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, double a7)
{
  id v14;
  NSObject *v15;
  _QWORD v16[9];
  char v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;

  if (qword_100060398 != -1)
    dispatch_once(&qword_100060398, &stru_10004DEF0);
  v14 = sub_100024FF4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v20 = a1;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = a7;
    v27 = 1024;
    v28 = a6;
    v29 = 1024;
    v30 = a4 == 0x7FFFFFFFFFFFFFFFLL;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "sendHangToHUD: bundleID = %s, startTime=%llu, endTime=%llu, elapsedTimeMS=%f, timed out: %{BOOL}d (is over: %{BOOL}d)", buf, 0x36u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000240D8;
  v16[3] = &unk_10004DE30;
  *(double *)&v16[4] = a7;
  v17 = a5;
  v16[5] = a1;
  v16[6] = a3;
  v16[7] = a4;
  v16[8] = a2;
  v18 = a6;
  dispatch_async((dispatch_queue_t)qword_100060370, v16);
}

void sub_1000240D8(uint64_t a1)
{
  _QWORD *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  id v17;
  NSObject *v18;
  int v19;
  HTHangHUDInfo *v20;
  HTHangHUDInfo *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;

  sub_10002445C();
  v2 = (_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v5 = (double)objc_msgSend(v4, "hudThresholdMSec");

  if (v3 > v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 40)));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(".")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 1));
    if ((sub_100028234() & 1) != 0)
    {
      v9 = &stru_10004F0D8;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f"), *v2));
      if ((unint64_t)objc_msgSend(v10, "length") <= 3)
      {
        v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%*s%@"), 4 - objc_msgSend(v10, "length"), "", v10));

        v10 = (void *)v11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByPaddingToLength:withString:startingAtIndex:", (int)(16 - objc_msgSend(v10, "length")), CFSTR(" "), 0));
      v13 = v12;
      if (*(_BYTE *)(a1 + 72))
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", (char *)objc_msgSend(v12, "length") - 1, 1, CFSTR("*")));

        v13 = (void *)v14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("|")));
      v16 = *(double *)v2 / 200.0;
      if (v16 > 100.0)
      {
        v17 = sub_100024FF4();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          sub_10002F224((uint64_t *)(a1 + 32), v18, v16);

        v16 = 100.0;
      }
      v19 = (int)v16;
      if ((int)v16 >= 1)
      {
        do
        {
          objc_msgSend(v15, "appendString:", CFSTR("-"));
          --v19;
        }
        while (v19);
      }
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ms%@"), v13, v10, v15));

    }
    v20 = [HTHangHUDInfo alloc];
    LOBYTE(v27) = *(_BYTE *)(a1 + 73);
    v21 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:](v20, "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9, v8, v6, *(double *)(a1 + 32), v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HTHangHUDInfo getHangHUDInfoKey](v21, "getHangHUDInfoKey"));
    objc_msgSend((id)qword_100060378, "setObject:forKeyedSubscript:", v21, v22);
    dword_100060380 = 0;
    v23 = sub_100024FF4();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v29 = v8;
      v30 = 2048;
      v31 = v25;
      v32 = 2048;
      v33 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "HTHUD: received updated hang info: bundle=%@, elapsedtime_ms=%f (so far), starttime_matu=%llu", buf, 0x20u);
    }

  }
}

void sub_10002445C()
{
  id v0;
  NSObject *v1;
  HUDContext *v2;
  HUDContext *v3;
  void *v4;
  uint8_t v5[16];

  if ((sub_100028370() & 1) == 0
    && sub_100028234()
    && (!qword_100060388 || (objc_msgSend((id)qword_100060388, "isValid") & 1) == 0))
  {
    v0 = sub_100024FF4();
    v1 = objc_claimAutoreleasedReturnValue(v0);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Hud context is nil or no longer valid: re-creating", v5, 2u);
    }

    objc_msgSend((id)qword_100060388, "invalidate");
    v2 = [HUDContext alloc];
    v3 = -[HUDContext initWithQueue:](v2, "initWithQueue:", qword_100060370);
    v4 = (void *)qword_100060388;
    qword_100060388 = (uint64_t)v3;

  }
}

void sub_100024510()
{
  void *v0;
  unsigned int v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v1 = objc_msgSend(v0, "shouldUpdateHangsHUD");

  if (v1)
  {
    if (qword_100060398 != -1)
      dispatch_once(&qword_100060398, &stru_10004DEF0);
    dispatch_async((dispatch_queue_t)qword_100060370, &stru_10004DE50);
  }
}

void sub_100024590(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  int v42;
  uint64_t v43;
  void *j;
  void *v45;
  __CFString *v46;
  id v47;
  id v48;
  _UNKNOWN **v49;
  uint64_t v50;
  void *k;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *obj;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  double v85;
  _BYTE v86[128];

  sub_10002445C();
  if ((sub_100028370() & 1) == 0 && sub_100028234() && byte_100060384 == 1)
  {
    objc_msgSend((id)qword_100060388, "clearBundleNameCache");
    byte_100060384 = 0;
  }
  if (objc_msgSend((id)qword_100060378, "count"))
  {
    v1 = mach_absolute_time();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "allKeys"));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v7));
          v9 = objc_msgSend(v8, "receivedTimestamp");

          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v7));
          v11 = objc_msgSend(v10, "hangEndTime");

          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v7));
            v9 = objc_msgSend(v12, "hangEndTime");

          }
          v13 = sub_1000273EC(v1 - (_QWORD)v9);
          if (v13 >= 5000.0)
          {
            v14 = v13;
            if ((sub_100028370() & 1) != 0 || !sub_100028234())
              v15 = 0;
            else
              v15 = objc_msgSend((id)qword_100060388, "hangHasPendingAnimation:", v7) ^ 1;
            if ((sub_100028370() & 1) != 0 || (v15 | sub_100028234() ^ 1) == 1)
            {
              v16 = sub_100024FF4();
              v17 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v7));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "shortenedBundle"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v7));
                v22 = objc_msgSend(v21, "hangStartTime");
                *(_DWORD *)buf = 138412802;
                v81 = v20;
                v82 = 2048;
                v83 = v22;
                v84 = 2048;
                v85 = v14;
                _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "HTHUD: hang removed from hud: bundle=%@, starttime_matu=%llu, age_ms=%f", buf, 0x20u);

              }
              objc_msgSend((id)qword_100060378, "removeObjectForKey:", v7);
              dword_100060380 = 0;
            }
            else
            {
              v18 = sub_100024FF4();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v81 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Not removing hang since an animation is in progress %@", buf, 0xCu);
              }

            }
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
      }
      while (v4);
    }

    if (sub_100028234())
    {
      v23 = sub_100028370();
      sub_10002840C(v23);
      if (v23)
      {
        v24 = sub_100024FF4();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          sub_10002F2B4(v25, v26, v27, v28, v29, v30, v31, v32);

        v33 = objc_alloc((Class)NSDictionary);
        v34 = objc_msgSend(v33, "initWithDictionary:", qword_100060378);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](HangHUDClient, "sharedInstance"));
        objc_msgSend(v35, "sendHangHUDInfo:completion:", v34, &stru_10004DE70);

      }
      else
      {
        objc_msgSend((id)qword_100060388, "updateHangs:withCompletion:", qword_100060378, &stru_10004DE90);
      }
    }
    else if (dword_100060380 <= 2)
    {
      ++dword_100060380;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "allKeys"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sortedArrayUsingSelector:", "compare:"));

      v38 = objc_alloc_init((Class)NSMutableArray);
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v62 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "reverseObjectEnumerator"));
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v40)
      {
        v41 = v40;
        v42 = 0;
        v43 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(_QWORD *)v71 != v43)
              objc_enumerationMutation(v39);
            if (v42 <= 4)
            {
              objc_msgSend(v38, "addObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j));
              ++v42;
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        }
        while (v41);
      }

      v45 = v38;
      if (byte_100060390)
        v46 = CFSTR("\n\n");
      else
        v46 = &stru_10004F0D8;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v61 = v45;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sortedArrayUsingSelector:", "compare:"));
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v47)
      {
        v48 = v47;
        v49 = &ADClientAddValueForScalarKey_ptr;
        v50 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v48; k = (char *)k + 1)
          {
            if (*(_QWORD *)v67 != v50)
              objc_enumerationMutation(obj);
            v52 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)k);
            if (-[__CFString length](v46, "length"))
            {
              v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v46, "stringByAppendingString:", CFSTR("\n")));

            }
            else
            {
              v53 = v46;
            }
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060378, "objectForKeyedSubscript:", v52));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "hudString"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49[97], "stringWithUTF8String:", ">"));
            v57 = sub_1000273EC(v1 - (_QWORD)objc_msgSend(v54, "receivedTimestamp"));
            if (objc_msgSend(v54, "hangEndTime") != (id)0x7FFFFFFFFFFFFFFFLL || v57 > 50.0)
            {
              v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49[97], "stringWithUTF8String:", "|"));

              v56 = (void *)v59;
            }
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingString:", v56));

            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v53, "stringByAppendingString:", v60));
            objc_msgSend(v65, "addObject:", v54);

            v49 = &ADClientAddValueForScalarKey_ptr;
          }
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        }
        while (v48);
        v46 = objc_retainAutorelease(v46);
        v47 = -[__CFString UTF8String](v46, "UTF8String");
      }
      sub_100024D3C((uint64_t)v47);

    }
  }
}

void sub_100024C8C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sendHangData did not complete. Error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_100024D3C(uint64_t a1)
{
  mach_port_name_t ServerPort;
  mach_port_name_t v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  ServerPort = CARenderServerGetServerPort(0);
  if (ServerPort)
  {
    v3 = ServerPort;
    if (!a1)
    {
      v6 = sub_100024FF4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_10002F2E4(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    CARenderServerSetDebugMessage();
    mach_port_deallocate(mach_task_self_, v3);
  }
  else
  {
    v4 = sub_100024FF4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to get render server port!", v15, 2u);
    }

  }
}

void sub_100024E14()
{
  if (qword_100060370)
    dispatch_async((dispatch_queue_t)qword_100060370, &stru_10004DEB0);
}

void sub_100024E30(id a1)
{
  byte_100060384 = 1;
}

void sub_100024E40()
{
  objc_msgSend((id)qword_100060378, "removeAllObjects");
  dispatch_async((dispatch_queue_t)qword_100060370, &stru_10004DED0);
}

void sub_100024E6C(id a1)
{
  objc_msgSend((id)qword_100060388, "clearHUDLinesAnimated:", 0);
}

void sub_100024E7C(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  dispatch_queue_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  _DWORD v18[2];
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;

  v1 = sub_100024FF4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10002F314(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5);
  v11 = (void *)qword_100060378;
  qword_100060378 = (uint64_t)v10;

  v12 = dispatch_queue_create("com.apple.hangtracer.hud_update_queue", 0);
  v13 = (void *)qword_100060370;
  qword_100060370 = (uint64_t)v12;

  v14 = MGGetBoolAnswer(CFSTR("8S7ydMJ4DlCUF38/hI/fJA"));
  v15 = (void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (objc_msgSend(v15, "containsString:", CFSTR("iPhone")) && v14)
    byte_100060390 = 1;
  v16 = sub_100024FF4();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109634;
    v18[1] = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 1024;
    v22 = byte_100060390;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "setupHangHUD: pearlDevice = %i and deviceClass = %@ => shouldLowerHUD = %i", (uint8_t *)v18, 0x18u);
  }

}

id sub_100024FF4()
{
  if (qword_1000603A8 != -1)
    dispatch_once(&qword_1000603A8, &stru_10004DF10);
  return (id)qword_1000603A0;
}

void sub_100025034(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", "");
  v2 = (void *)qword_1000603A0;
  qword_1000603A0 = (uint64_t)v1;

}

void sub_100025148(id a1)
{
  HUDAnimator *v1;
  void *v2;

  v1 = objc_alloc_init(HUDAnimator);
  v2 = (void *)qword_1000603B0;
  qword_1000603B0 = (uint64_t)v1;

}

void sub_100025284(uint64_t a1)
{
  double v2;
  HUDAnimation *v3;

  v3 = objc_alloc_init(HUDAnimation);
  -[HUDAnimation setFromValue:](v3, "setFromValue:", *(double *)(a1 + 64));
  -[HUDAnimation setToValue:](v3, "setToValue:", *(double *)(a1 + 72));
  -[HUDAnimation setStartTime:](v3, "setStartTime:", CACurrentMediaTime());
  -[HUDAnimation startTime](v3, "startTime");
  -[HUDAnimation setEndTime:](v3, "setEndTime:", v2 + *(double *)(a1 + 80));
  -[HUDAnimation setUpdateBlock:](v3, "setUpdateBlock:", *(_QWORD *)(a1 + 48));
  -[HUDAnimation setCompletionBlock:](v3, "setCompletionBlock:", *(_QWORD *)(a1 + 56));
  -[HUDAnimation setIdentifier:](v3, "setIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v3);

}

void sub_1000253C0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  HUDAnimation *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025534;
  v11[3] = &unk_10004DF80;
  v12 = v2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v11);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", v4));
    v7 = objc_alloc_init(HUDAnimation);
    v8 = CACurrentMediaTime();
    objc_msgSend(v6, "valueAtTime:");
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    -[HUDAnimation setToValue:](v7, "setToValue:", *(double *)(a1 + 48));
    -[HUDAnimation setStartTime:](v7, "setStartTime:", v8);
    -[HUDAnimation setEndTime:](v7, "setEndTime:", v8 + *(double *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updateBlock"));
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completionBlock"));
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v10);

    -[HUDAnimation setRetargeted:](v7, "setRetargeted:", 1);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "replaceObjectAtIndex:withObject:", v5, v7);

  }
}

id sub_100025534(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_1000255F0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  HUDAnimation *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002575C;
  v10[3] = &unk_10004DF80;
  v11 = v2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v10);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", v4));
    v7 = objc_alloc_init(HUDAnimation);
    objc_msgSend(v6, "fromValue");
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    objc_msgSend(v6, "toValue");
    -[HUDAnimation setToValue:](v7, "setToValue:");
    objc_msgSend(v6, "startTime");
    -[HUDAnimation setStartTime:](v7, "setStartTime:");
    objc_msgSend(v6, "endTime");
    -[HUDAnimation setEndTime:](v7, "setEndTime:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updateBlock"));
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completionBlock"));
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v9);

    -[HUDAnimation setCanceled:](v7, "setCanceled:", 1);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "replaceObjectAtIndex:withObject:", v5, v7);

  }
}

id sub_10002575C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_1000257F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  CAFrameRateRange v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      v2 = objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:"));
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 24);
      *(_QWORD *)(v3 + 24) = v2;

      v5 = objc_alloc((Class)NSThread);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000258EC;
      v7[3] = &unk_10004D278;
      v7[4] = *(_QWORD *)(a1 + 32);
      v6 = objc_msgSend(v5, "initWithBlock:", v7);
      v8 = CAFrameRateRangeMake(30.0, 30.0, 30.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
      objc_msgSend(v6, "setQualityOfService:", 33);
      objc_msgSend(v6, "setName:", CFSTR("com.apple.hangtracerd.HUDAnimator"));
      objc_msgSend(v6, "start");

    }
  }
}

void sub_1000258EC(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v1, "addToRunLoop:forMode:", v2, NSDefaultRunLoopMode);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v3, "run");

}

void sub_100025AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025B24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100025B34(uint64_t a1)
{

}

void sub_100025B3C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "indexesOfObjectsPassingTest:", &stru_10004DFE8));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "objectsAtIndexes:"));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(a1[4] + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025C74;
  v11[3] = &unk_10004E008;
  v11[4] = a1[8];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", v11));
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "objectsAtIndexes:", v6));
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1[4] + 8), "removeObjectsAtIndexes:", v6);
    if (!objc_msgSend(*(id *)(a1[4] + 8), "count"))
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

BOOL sub_100025C58(id a1, HUDAnimation *a2, unint64_t a3, BOOL *a4)
{
  return !-[HUDAnimation canceled](a2, "canceled", a3, a4);
}

uint64_t sub_100025C74(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "endTime");
  if (v4 <= *(double *)(a1 + 32))
    v5 = 1;
  else
    v5 = (uint64_t)objc_msgSend(v3, "canceled");

  return v5;
}

void sub_100025CC4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void (**v8)(_QWORD);
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updateBlock"));
        objc_msgSend(v7, "valueAtTime:", *(double *)(a1 + 48));
        v8[2](v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionBlock", (_QWORD)v17));

        if (v15)
        {
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionBlock"));
          ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, objc_msgSend(v14, "canceled") ^ 1, objc_msgSend(v14, "retargeted"));

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

}

void sub_100025ECC(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

  }
}

id sub_100026064()
{
  if (qword_1000603C8 != -1)
    dispatch_once(&qword_1000603C8, &stru_10004E078);
  return (id)qword_1000603C0;
}

void sub_1000260A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.HangHUD", "");
  v2 = (void *)qword_1000603C0;
  qword_1000603C0 = (uint64_t)v1;

}

__CFString *sub_10002627C(unsigned int a1)
{
  if (a1 >= 0x2A)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a1));
  else
    return *(&off_10004E098 + (char)a1);
}

id sub_1000262D4(unsigned int a1)
{
  char v1;
  __CFString *v2;
  void *v3;
  void *v4;

  v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E1E8 + v1);
  }
  else
  {
    v2 = sub_10002627C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

__CFString *sub_100026340(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SIG%d"), a1));
  else
    return *(&off_10004E318 + (int)a1 - 1);
}

__CFString *sub_100026394(uint64_t a1)
{
  if (a1 >= 0x10)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a1));
  else
    return *(&off_10004E410 + (int)a1);
}

id sub_1000263E4(uint64_t a1)
{
  int v1;
  __CFString *v2;
  void *v3;
  void *v4;

  v1 = a1 - 2;
  if ((a1 - 2) < 0xE && ((0x2655u >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E490 + v1);
  }
  else
  {
    v2 = sub_100026394(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

__CFString *sub_100026444(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          return CFSTR("thermal pressure");
        case 3306925313:
          return CFSTR("cpu violation");
        case 3306925314:
          return CFSTR("walltime violation");
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
        return CFSTR("user quit");
      if (a1 == 4227595259)
        return CFSTR("force quit");
    }
    else
    {
      if (a1 == 3306925315)
        return CFSTR("system busy");
      if (a1 == 3735883980)
        return CFSTR("resource exclusion");
    }
    goto LABEL_36;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        return CFSTR("application assertion");
      case 439025681:
        return CFSTR("input ui scene");
      case 732775916:
        return CFSTR("secure draw violation");
    }
    goto LABEL_36;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
      return CFSTR("legacy clear the board");
    if (a1 == 2343432205)
      return CFSTR("watchdog");
    goto LABEL_36;
  }
  if (a1 == 1539435073)
    return CFSTR("languages changed");
  if (a1 != 1539435076)
  {
LABEL_36:
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#llx"), a1));
    return v1;
  }
  v1 = CFSTR("clear the board");
  return v1;
}

__CFString *sub_100026650(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      v1 = CFSTR("Legacy Clear the Board");
      return v1;
    }
    if (a1 == 3306925313)
    {
      v1 = CFSTR("CPU Violation");
      return v1;
    }
LABEL_8:
    v2 = sub_100026444(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

    return v1;
  }
  if (a1 == 439025681)
  {
    v1 = CFSTR("InputUI Scene");
    return v1;
  }
  if (a1 != 1539435076)
    goto LABEL_8;
  v1 = CFSTR("Clear the Board");
  return v1;
}

__CFString *sub_100026708(uint64_t a1)
{
  if ((a1 - 1) >= 4)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a1));
  else
    return *(&off_10004E500 + (int)a1 - 1);
}

id sub_10002675C(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  v1 = sub_100026708(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "capitalizedString"));

  return v3;
}

__CFString *sub_100026794(uint64_t a1)
{
  if ((a1 - 1) >= 0x13)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a1));
  else
    return *(&off_10004E520 + (int)a1 - 1);
}

id sub_1000267E8(uint64_t a1)
{
  int v1;
  __CFString *v2;
  void *v3;
  void *v4;

  v1 = a1 - 1;
  if ((a1 - 1) < 0x13 && ((0x55F7Fu >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E5B8 + v1);
  }
  else
  {
    v2 = sub_100026794(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

__CFString *sub_10002684C(uint64_t a1)
{
  if ((a1 - 1) >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a1));
  else
    return *(&off_10004E650 + (int)a1 - 1);
}

__CFString *sub_1000268A0(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  if ((_DWORD)a1 == 5)
  {
    v1 = CFSTR("JIT");
  }
  else
  {
    v2 = sub_10002684C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v1;
}

__CFString *sub_1000268EC(uint64_t a1)
{
  if ((a1 - 1) >= 9)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a1));
  else
    return *(&off_10004E678 + (int)a1 - 1);
}

__CFString *sub_100026940(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  switch((_DWORD)a1)
  {
    case 2:
      v1 = CFSTR("Unknown IPC");
      break;
    case 6:
      v1 = CFSTR("Sandbox Filtered IPC");
      break;
    case 4:
      v1 = CFSTR("SIGTERM Timeout");
      break;
    default:
      v2 = sub_1000268EC(a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

      break;
  }
  return v1;
}

id sub_1000269B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1) & 1) != 0)
    v2 = *(&off_10004E6C0 + v1);
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
  return v2;
}

id sub_100026A14(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 7 && ((0x47u >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E708 + v1);
  }
  else
  {
    v2 = sub_1000269B4(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

__CFString *sub_100026A74(uint64_t a1)
{
  __CFString *v1;

  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return CFSTR("conditions changed");
        }
        else
        {
          if (a1 != 562215597)
            goto LABEL_37;
          return CFSTR("assertion timeout");
        }
      }
      else
      {
        return CFSTR("none");
      }
    }
    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return CFSTR("background fetch completion timeout");
      }
      else
      {
        if (a1 != 732775916)
          goto LABEL_37;
        return CFSTR("security violation");
      }
    }
    else if (a1 == 562215634)
    {
      return CFSTR("background task assertion timeout");
    }
    else
    {
      return CFSTR("background url session completion timeout");
    }
  }
  else if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        return CFSTR("termination assertion");
      }
      else
      {
        if (a1 != 3735943697)
          goto LABEL_37;
        return CFSTR("user initiated quit");
      }
    }
    else if (a1 == 3490524077)
    {
      return CFSTR("max assertions violation");
    }
    else
    {
      if (a1 != 3735883980)
        goto LABEL_37;
      return CFSTR("resource exclusion");
    }
  }
  else if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      return CFSTR("process exited");
    }
    else
    {
      if (a1 != 3221229823)
        goto LABEL_37;
      return CFSTR("thermal pressure");
    }
  }
  else
  {
    if (a1 != 2343432205)
    {
      if (a1 == 2970405393)
      {
        v1 = CFSTR("max states violation");
        return v1;
      }
LABEL_37:
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#llx"), a1));
      return v1;
    }
    return CFSTR("watchdog violation");
  }
}

__CFString *sub_100026CA4(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      v1 = CFSTR("None Provided");
      return v1;
    }
    if (a1 == 562215635)
    {
      v1 = CFSTR("Background URL Session Completion Timeout");
      return v1;
    }
LABEL_12:
    v2 = sub_100026A74(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

    return v1;
  }
  if (a1 == 2970405393)
  {
    v1 = CFSTR("Maximum States Violation");
    return v1;
  }
  if (a1 == 3490524077)
  {
    v1 = CFSTR("Maximum Assertions Violation");
    return v1;
  }
  if (a1 != 3735943697)
    goto LABEL_12;
  v1 = CFSTR("User-Initiated Quit");
  return v1;
}

__CFString *sub_100026D6C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
  else
    return *(&off_10004E740 + a1 - 1);
}

id sub_100026DC0(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;
  void *v3;
  void *v4;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E768 + v1);
  }
  else
  {
    v2 = sub_100026D6C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

__CFString *sub_100026E20(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
  else
    return *(&off_10004E790 + a1 - 1);
}

id sub_100026E74(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  v1 = sub_100026E20(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "capitalizedString"));

  return v3;
}

__CFString *sub_100026EAC(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 1:
      return CFSTR("service timeout");
    case 1001:
      return CFSTR("chronokit");
    case 2:
      v1 = CFSTR("timeout no diags");
      break;
    default:
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
      break;
  }
  return v1;
}

__CFString *sub_100026F20(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  if (a1 == 2)
  {
    v1 = CFSTR("Service Timeout Diagnostics Unavailable");
  }
  else if (a1 == 1001)
  {
    v1 = CFSTR("ChronoKit");
  }
  else
  {
    v2 = sub_100026EAC(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v1;
}

__CFString *sub_100026F80(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("api violation");
  if (a1 == 2)
    v1 = CFSTR("internal error");
  else
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
  return v1;
}

__CFString *sub_100026FE0(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  if (a1 == 1)
  {
    v1 = CFSTR("API Violation");
  }
  else
  {
    v2 = sub_100026F80(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v1;
}

id sub_10002702C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1) & 1) != 0)
    v2 = *(&off_10004E7A8 + v1);
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a1));
  return v2;
}

id sub_100027090(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1 - 11;
  if ((unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1) & 1) != 0)
  {
    v4 = *(&off_10004E850 + v1);
  }
  else
  {
    v2 = sub_10002702C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "capitalizedString"));

  }
  return v4;
}

id sub_1000270F0(int a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;

  switch(a1)
  {
    case 1:
      v2 = sub_100026394(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      v4 = sub_100026340(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      v5 = sub_100026708(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      v6 = sub_1000269B4(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      v7 = sub_1000268EC(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      v8 = sub_100026794(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      v9 = sub_100026444(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      v10 = sub_100026A74(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      v11 = sub_100026DC0(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      v12 = sub_100026EAC(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      v13 = sub_100026F80(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      v14 = sub_10002684C(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      v15 = sub_100026E20(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      v16 = sub_10002702C(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2));
      break;
  }
  return v3;
}

id sub_100027228(int a1, uint64_t a2)
{
  id v2;
  void *v3;
  __CFString *v4;
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  id v16;

  switch(a1)
  {
    case 1:
      v2 = sub_1000263E4(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      v4 = sub_100026340(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      v5 = sub_10002675C(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      v6 = sub_100026A14(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      v7 = sub_100026940(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      v8 = sub_1000267E8(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      v9 = sub_100026650(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      v10 = sub_100026CA4(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      v11 = sub_100026DC0(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      v12 = sub_100026F20(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      v13 = sub_100026FE0(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      v14 = sub_1000268A0(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      v15 = sub_100026E74(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      v16 = sub_100027090(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#llx"), a2));
      break;
  }
  return v3;
}

double sub_100027360()
{
  if (qword_1000603D8 != -1)
    dispatch_once(&qword_1000603D8, &stru_10004E8A8);
  return *(double *)&qword_1000603D0;
}

void sub_1000273A0(id a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_1000603D0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_1000273EC(unint64_t a1)
{
  if (qword_1000603D8 != -1)
    dispatch_once(&qword_1000603D8, &stru_10004E8A8);
  return *(double *)&qword_1000603D0 * (double)a1;
}

double sub_100027440(unint64_t a1)
{
  if (qword_1000603D8 != -1)
    dispatch_once(&qword_1000603D8, &stru_10004E8A8);
  return *(double *)&qword_1000603D0 * (double)a1 / 1000.0;
}

double sub_1000274A0(unint64_t a1)
{
  if (qword_1000603D8 != -1)
    dispatch_once(&qword_1000603D8, &stru_10004E8A8);
  return (double)a1 / *(double *)&qword_1000603D0;
}

void sub_100027500(id a1)
{
  byte_1000603E8 = MGGetBoolAnswer(CFSTR("8S7ydMJ4DlCUF38/hI/fJA"));
}

void sub_100027524(id a1)
{
  byte_1000603F8 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 3;
}

void sub_100027554(id a1)
{
  byte_100060408 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 6;
}

void sub_100027584(id a1)
{
  byte_100060418 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 4;
}

void sub_1000275B4(id a1)
{
  byte_100060428 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 11;
}

double sub_1000275E4()
{
  void *v0;
  double v1;
  double v2;
  double v3;

  if (qword_100060410 != -1)
    dispatch_once(&qword_100060410, &stru_10004E928);
  if (byte_100060418)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v0, "bounds");
    if (v1 <= 1920.0)
      v2 = 28.0;
    else
      v2 = 42.0;

  }
  else
  {
    if (qword_100060400 != -1)
      dispatch_once(&qword_100060400, &stru_10004E908);
    if (byte_100060408)
    {
      v3 = sub_100027728();
      if (v3 > 170.0 || v3 < 1.0)
        return 24.0;
      else
        return 22.0;
    }
    else
    {
      if (qword_100060420 != -1)
        dispatch_once(&qword_100060420, &stru_10004E948);
      v2 = 22.0;
      if (!byte_100060428)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 3.0)
          return 40.0;
        else
          return 28.0;
      }
    }
  }
  return v2;
}

double sub_100027728()
{
  double result;
  int v1;
  void *v2;
  double v3;
  double v4;

  result = *(double *)&qword_100060450;
  if (*(double *)&qword_100060450 <= 0.0)
  {
    if (qword_100060410 != -1)
      dispatch_once(&qword_100060410, &stru_10004E928);
    v1 = byte_100060418;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v2, "bounds");
    v4 = fmax(v3, 1920.0);
    if (!v1)
      v4 = v3;
    qword_100060450 = *(_QWORD *)&v4;

    result = *(double *)&qword_100060450 / -[HUDLine contentScaleForTexts]_0();
    qword_100060450 = *(_QWORD *)&result;
  }
  return result;
}

void sub_100027880()
{
  double v0;

  if (*(double *)&qword_100060430 <= 0.0)
  {
    v0 = sub_1000275E4();
    *(double *)&qword_100060430 = v0 / -[HUDLine contentScaleForTexts]_0();
  }
}

double sub_1000278C4()
{
  double v0;
  void *v1;
  void *v2;
  double v3;
  uint64_t v5;
  int v6;
  double v7;

  v0 = *(double *)&qword_100060438;
  if (*(double *)&qword_100060438 <= 0.0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentOrientation"));

    if (qword_100060400 != -1)
      dispatch_once(&qword_100060400, &stru_10004E908);
    v3 = 20.0;
    if (byte_100060408)
      goto LABEL_5;
    if (qword_1000603F0 != -1)
      dispatch_once(&qword_1000603F0, &stru_10004E8E8);
    v3 = 50.0;
    if (byte_1000603F8
      || v2 == (void *)kCADisplayOrientationRotation270
      || v2 == (void *)kCADisplayOrientationRotation90)
    {
      goto LABEL_5;
    }
    if (qword_1000604B0 != -1)
      dispatch_once(&qword_1000604B0, &stru_10004EA88);
    if (byte_1000604B8)
    {
      v5 = 0x4065000000000000;
LABEL_16:
      v3 = *(double *)&v5;
LABEL_5:
      qword_100060438 = *(_QWORD *)&v3;
      v0 = v3 / -[HUDLine contentScaleForTexts]_0();
      *(double *)&qword_100060438 = v0;

      return v0;
    }
    if (qword_1000603E0 != -1)
      dispatch_once(&qword_1000603E0, &stru_10004E8C8);
    if (byte_1000603E8)
    {
      if (-[HUDLine contentScaleForTexts]_0() == 2.0)
      {
        v5 = 0x4059000000000000;
        goto LABEL_16;
      }
      if (qword_1000603E0 != -1)
        dispatch_once(&qword_1000603E0, &stru_10004E8C8);
    }
    if (byte_1000603E8 && -[HUDLine contentScaleForTexts]_0() == 3.0)
    {
      v3 = 150.0;
    }
    else
    {
      if (qword_100060410 != -1)
        dispatch_once(&qword_100060410, &stru_10004E928);
      v6 = byte_100060418;
      v7 = -[HUDLine contentScaleForTexts]_0();
      if (v6)
        v3 = dbl_1000372A0[v7 > 1.0];
      else
        v3 = v7 * 25.0;
    }
    goto LABEL_5;
  }
  return v0;
}

void sub_100027B0C()
{
  double v0;

  if (*(double *)&qword_100060440 <= 0.0)
  {
    if (qword_1000603E0 != -1)
      dispatch_once(&qword_1000603E0, &stru_10004E8C8);
    v0 = 25.0;
    if (!byte_1000603E8)
      v0 = sub_1000278C4();
    qword_100060440 = *(_QWORD *)&v0;
  }
}

double sub_100027B74()
{
  double result;
  double v1;
  double v2;
  double v3;
  double v4;

  result = *(double *)&qword_100060448;
  if (*(double *)&qword_100060448 <= 0.0)
  {
    if (qword_100060400 != -1)
      dispatch_once(&qword_100060400, &stru_10004E908);
    v1 = 5.0;
    if (!byte_100060408)
    {
      v2 = -[HUDLine contentScaleForTexts]_0();
      if (qword_1000603F0 != -1)
      {
        v4 = v2;
        dispatch_once(&qword_1000603F0, &stru_10004E8E8);
        v2 = v4;
      }
      v3 = 10.0;
      if (!byte_1000603F8)
        v3 = 8.0;
      v1 = v2 * v3;
    }
    qword_100060448 = *(_QWORD *)&v1;
    result = v1 / -[HUDLine contentScaleForTexts]_0();
    qword_100060448 = *(_QWORD *)&result;
  }
  return result;
}

double sub_100027C40()
{
  double result;
  int v1;
  void *v2;
  double v3;
  double v4;

  result = *(double *)&qword_100060458;
  if (*(double *)&qword_100060458 <= 0.0)
  {
    if (qword_100060410 != -1)
      dispatch_once(&qword_100060410, &stru_10004E928);
    v1 = byte_100060418;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v2, "bounds");
    v4 = fmax(v3, 1080.0);
    if (!v1)
      v4 = v3;
    qword_100060458 = *(_QWORD *)&v4;

    result = *(double *)&qword_100060458 / -[HUDLine contentScaleForTexts]_0();
    qword_100060458 = *(_QWORD *)&result;
  }
  return result;
}

void sub_100027CE4()
{
  double v0;
  double v1;
  double v2;

  if (*(double *)&qword_100060468 <= 0.0)
  {
    v0 = sub_100027728();
    v1 = fmin(v0, sub_100027C40());
    sub_100027B0C();
    *(double *)&qword_100060468 = v1 + v2 * -2.0;
  }
}

double sub_100027D34()
{
  if (qword_100060470 != -1)
    dispatch_once(&qword_100060470, &stru_10004E968);
  return *(double *)&qword_100060478;
}

void sub_100027D74(id a1)
{
  double v1;

  if (qword_100060400 != -1)
    dispatch_once(&qword_100060400, &stru_10004E908);
  v1 = 2.0;
  if (!byte_100060408)
    v1 = 20.0;
  qword_100060478 = *(_QWORD *)&v1;
  *(double *)&qword_100060478 = v1 / -[HUDLine contentScaleForTexts]_0();
}

double sub_100027DE4()
{
  if (qword_100060480 != -1)
    dispatch_once(&qword_100060480, &stru_10004E988);
  return *(double *)&qword_100060488;
}

void sub_100027E24(id a1)
{
  double v1;

  if (qword_100060400 != -1)
    dispatch_once(&qword_100060400, &stru_10004E908);
  v1 = 2.0;
  if (!byte_100060408)
    v1 = 20.0;
  qword_100060488 = *(_QWORD *)&v1;
  *(double *)&qword_100060488 = v1 / -[HUDLine contentScaleForTexts]_0();
}

void sub_100027E94()
{
  qword_100060438 = 0;
  qword_100060440 = 0;
  qword_100060468 = 0;
}

void sub_100027EB0()
{
  qword_100060430 = 0;
  qword_100060438 = 0;
  qword_100060440 = 0;
  qword_100060448 = 0;
  qword_100060450 = 0;
  qword_100060458 = 0;
  qword_100060460 = 0;
  qword_100060468 = 0;
}

uint64_t sub_100027EF4(void *a1, uint64_t a2, double a3)
{
  id v5;
  double v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  int v12;
  double v13;

  v5 = a1;
  v6 = sub_1000273EC(a2 - (_QWORD)objc_msgSend(v5, "receivedTimestamp"));
  v7 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "durationSinceLastUpdateMs: %f", (uint8_t *)&v12, 0xCu);
  }

  if (objc_msgSend(v5, "hangEndTime") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= a3)
    {
      v9 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v10 = sub_1000273EC(a2 - (_QWORD)objc_msgSend(v5, "hangEndTime"));
  v9 = 1;
  if (v10 >= 200.0 && v6 > a3)
    goto LABEL_8;
LABEL_9:

  return v9;
}

id sub_10002801C(void *a1, unsigned int a2)
{
  void *v3;
  char *v4;
  id v5;
  unint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:", 0, &stru_10004E9C8));
  v4 = 0;
  if ((unint64_t)objc_msgSend(v3, "count") >= a2)
    v4 = (char *)objc_msgSend(v3, "count") - a2;
  v5 = objc_msgSend(v3, "count");
  if ((unint64_t)v5 >= a2)
    v6 = a2;
  else
    v6 = (unint64_t)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", v4, v6));

  return v7;
}

int64_t sub_1000280A4(id a1, HTHangHUDInfo *a2, HTHangHUDInfo *a3)
{
  HTHangHUDInfo *v4;
  HTHangHUDInfo *v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
  if (v6 == (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime"))
  {
    v7 = 0;
  }
  else
  {
    v8 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
    if (v8 > (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime"))
      v7 = 1;
    else
      v7 = -1;
  }

  return v7;
}

id sub_100028128(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;

  v3 = a1;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysSortedByValueUsingComparator:", &stru_10004EA08));
    v5 = a2;
    if ((unint64_t)objc_msgSend(v4, "count") >= a2)
      v6 = (char *)objc_msgSend(v4, "count") - a2;
    else
      v6 = 0;
    v8 = objc_msgSend(v4, "count");
    if ((unint64_t)v8 >= v5)
      v9 = (id)v5;
    else
      v9 = v8;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", v6, v9));

  }
  else
  {
    v7 = objc_alloc_init((Class)NSArray);
  }

  return v7;
}

int64_t sub_1000281DC(id a1, HUDContentProtocol *a2, HUDContentProtocol *a3)
{
  HUDContentProtocol *v4;
  id v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[HUDContentProtocol compareValue](a2, "compareValue");
  v6 = -[HUDContentProtocol compareValue](v4, "compareValue");

  v7 = 1;
  if (v5 <= v6)
    v7 = -1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

uint64_t sub_100028234()
{
  if (qword_100060490 != -1)
    dispatch_once(&qword_100060490, &stru_10004EA28);
  return byte_100060498;
}

void sub_100028274(id a1)
{
  byte_100060498 = _os_feature_enabled_impl("HangTracer", "useCustomHUD");
}

uint64_t sub_1000282A0(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentDomainForName:", CFSTR("com.apple.HangHUD")));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));
    if (v7 && (v8 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      *a2 = objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sub_100028370()
{
  char *v0;
  char v2;

  v2 = 0;
  v0 = &v2;
  if ((sub_1000282A0(CFSTR("UseHangHUD"), &v2) & 1) == 0)
  {
    if (qword_1000604A0 != -1)
      dispatch_once(&qword_1000604A0, &stru_10004EA48);
    v0 = &byte_1000604A8;
  }
  return *v0;
}

void sub_1000283E0(id a1)
{
  byte_1000604A8 = _os_feature_enabled_impl("HangTracer", "useHangHUD");
}

void sub_10002840C(int a1)
{
  char v1;
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = a1;
  if (byte_10005F8C8 != a1)
  {
    v2 = sub_100024FF4();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if ((v1 & 1) != 0)
    {
      if (v4)
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "  =>  clearing HUD context on hangtracerd when enabling HangHUD", v6, 2u);
      }

      sub_100024E40();
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "  =>  clear HUD context on angle server when disabling HangHUD", buf, 2u);
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDClient sharedInstance](HangHUDClient, "sharedInstance"));
      objc_msgSend(v5, "clearHUDWithCompletion:", &stru_10004EA68);

    }
  }
  byte_10005F8C8 = v1;
}

void sub_1000284F0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100024FF4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearHUDWithCompletionHandler did not complete. Error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_10002859C(id a1)
{
  id v1;
  NSObject *v2;
  _DWORD v3[2];

  byte_1000604B8 = SBSIsSystemApertureAvailable(a1);
  v1 = sub_100024FF4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = byte_1000604B8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "New API was available, retrieved aperture available %{BOOL}i", (uint8_t *)v3, 8u);
  }

}

BOOL sub_100028648()
{
  if (qword_100060508 != -1)
    dispatch_once(&qword_100060508, &stru_10004EAA8);
  return off_1000604C0 != 0;
}

uint64_t sub_100028690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v16;
  NSMutableDictionary *v17;
  NSNumber *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v22[8];
  _QWORD v23[7];
  _QWORD v24[7];

  v16 = objc_autoreleasePoolPush();
  if (qword_100060508 != -1)
    dispatch_once(&qword_100060508, &stru_10004EAA8);
  if (off_1000604C0)
  {
    v23[0] = qword_1000604C8;
    v23[1] = qword_1000604D0;
    v24[0] = &__kCFBooleanTrue;
    v24[1] = a4;
    v23[2] = qword_1000604D8;
    v24[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a2);
    v23[3] = qword_1000604E0;
    v24[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3);
    v23[4] = qword_1000604E8;
    v24[4] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a6);
    v23[5] = qword_1000604F0;
    v24[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a7);
    v23[6] = qword_1000604F8;
    v24[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a8);
    v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 7));
    if ((_DWORD)a5)
    {
      v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a5);
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, qword_100060500);
    }
    v19 = off_1000604C0(a1, v17);
  }
  else
  {
    v20 = sub_100024FF4();
    v19 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tailspin dump symbol is missing!", v22, 2u);
      v19 = 0;
    }
  }
  objc_autoreleasePoolPop(v16);
  return v19;
}

void sub_1000288C8(id a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = dlopen("/usr/lib/libtailspin.dylib", 1);
  qword_100060510 = (uint64_t)v1;
  if (v1)
  {
    off_1000604C0 = dlsym(v1, "tailspin_dump_output_with_options_sync");
    qword_1000604D0 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_ReasonString");
    qword_1000604C8 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_NoSymbolicate");
    qword_1000604D8 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_MinTimestamp");
    qword_1000604E0 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_MaxTimestamp");
    qword_100060500 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_TargetPID");
    qword_1000604E8 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_CollectOsSignposts");
    qword_1000604F0 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_CollectTrials");
    qword_1000604F8 = *(_QWORD *)dlsym((void *)qword_100060510, "TSPDumpOptions_ScrubOutput");
  }
  else
  {
    v2 = sub_100024FF4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "libtailspin.dylib is not present.", v3, 2u);
    }
  }
}

uint64_t sub_100028A38(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  uint32_t v23;
  double v24;
  id v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  id v30;
  NSObject *v31;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[6];
  _QWORD v56[7];
  uint8_t v57[4];
  double v58;
  uint8_t buf[4];
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  unint64_t v70;

  v7 = 0;
  v54 = 0;
  v8 = 0;
  v51 = a2 - a1;
  v53 = a3 + 32;
  do
  {
    if (*(_QWORD *)(a3 + v7))
    {
      ++v8;
      v9 = a3 + v7;
      v10 = *(_QWORD *)(a3 + v7 + 24);
      if (v10 >= *(_QWORD *)(a3 + v7 + 16))
        v10 = *(_QWORD *)(a3 + v7 + 16);
      v11 = *(_QWORD *)(a3 + v7 + 8) <= a1 ? a1 : *(_QWORD *)(a3 + v7 + 8);
      v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        v13 = sub_100024FF4();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = *(double *)(a3 + v7);
          v16 = *(double *)(v9 + 8);
          v17 = *(_QWORD *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          v60 = v15;
          v61 = 2080;
          *(_QWORD *)&v62 = v53 + v7;
          v63 = 2048;
          v64 = v16;
          v65 = 2048;
          v66 = v17;
          v67 = 2048;
          v68 = a1;
          v69 = 2048;
          v70 = a2;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end=%llu, hangstart=%llu, hangend=%llu)", buf, 0x3Eu);
        }

        if (*(_BYTE *)(a3 + v7 + 96))
        {
          if (*(_QWORD *)(v9 + 24) < a2)
          {
            v18 = sub_100024FF4();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v20 = v19;
              v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              v23 = 2;
LABEL_22:
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, v23);
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          if (*(_QWORD *)(v9 + 8) > a1)
          {
            v22 = sub_100024FF4();
            v19 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v20 = v19;
              v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }
LABEL_23:

            goto LABEL_30;
          }
          v24 = sub_1000273EC(v51);
          v25 = sub_100024FF4();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          v19 = v26;
          if (v24 >= 1000.0)
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              goto LABEL_23;
            v27 = sub_1000273EC(v51);
            *(_DWORD *)buf = 134217984;
            v60 = v27;
            v20 = v19;
            v21 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            v23 = 12;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            sub_10002F3AC(v57, v51, &v58, v19);

        }
        v54 += v12 - v11;
        if (a4)
        {
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_100028F28;
          v56[3] = &unk_10004EAC8;
          v56[4] = v12;
          v56[5] = v11;
          v56[6] = v9 + 32;
          AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.assertion_overlap"), v56);
        }
      }
    }
LABEL_30:
    v7 += 104;
  }
  while (v7 != 1040);
  if (!v8)
  {
    v33 = sub_100024FF4();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      sub_10002F344(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_48;
  }
  v28 = sub_1000273EC(v54);
  v29 = sub_1000273EC(v51) - v28;
  if (v29 >= 250.0)
  {
    v42 = sub_100024FF4();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    v34 = v43;
    if (v54)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v60 = v29;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      sub_10002F378(v34, v44, v45, v46, v47, v48, v49, v50);
    }
LABEL_48:

    return 0;
  }
  v30 = sub_100024FF4();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v60 = v28;
    v61 = 2048;
    v62 = (double)v54 * 100.0 / (double)v51;
    v63 = 2048;
    v64 = v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap", buf, 0x20u);
  }

  if (a4)
  {
    j__ADClientPushValueForDistributionKey(CFSTR("com.apple.ht_assertion_stats.hang_overlap_ms"), v28);
    j__ADClientPushValueForDistributionKey(CFSTR("com.apple.ht_assertion_stats.hang_overlap_percent"), (double)v54 * 100.0 / (double)v51);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100028FFC;
    v55[3] = &unk_10004EAE8;
    *(double *)&v55[4] = v28;
    *(double *)&v55[5] = (double)v54 * 100.0 / (double)v51;
    AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.assertion_overlap"), v55);
  }
  return 1;
}

id sub_100028F28(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("assertionOverlapMs");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[4] - a1[5]));
  v6[1] = CFSTR("assertionOverlapName");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1[6]));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

id sub_100028FFC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("hangDurationOverlapMs");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  v6[1] = CFSTR("hangDurationOverlapPercent");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_100029248(uint64_t a1)
{
  HTUserNotificationHelper *v2;
  void *v3;
  dispatch_queue_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_alloc_init(HTUserNotificationHelper);
  v3 = (void *)qword_100060518;
  qword_100060518 = (uint64_t)v2;

  if (v2)
  {
    v4 = dispatch_queue_create("com.apple.hangtracerd.notification-queue", 0);
    objc_msgSend((id)qword_100060518, "setNotificationQueue:", v4);

    v5 = objc_alloc((Class)UNUserNotificationCenter);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060518, "notificationQueue"));
    v7 = objc_msgSend(v5, "initWithBundleIdentifier:queue:", CFSTR("com.apple.hangtracerd.usernotifications"), v6);
    objc_msgSend((id)qword_100060518, "setNotificationCenter:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060518, "notificationCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v8, "setNotificationCategories:", v9);

    v10 = qword_100060518;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060518, "notificationCenter"));
    objc_msgSend(v11, "setDelegate:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060518, "notificationCenter"));
    objc_msgSend(v12, "setWantsNotificationResponsesDelivered");

    v13 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend((id)qword_100060518, "setResponseHandlers:", v13);

  }
}

id sub_100029788(const __CFString *a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  void *v6;
  id v7;
  const __CFArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@."), a3));
  v7 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "hasPrefix:", v6))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

void sub_1000299F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100029A10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100029A20(uint64_t a1)
{

}

void sub_100029A28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "unsignedIntValue") - 1;
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v5;
    v17 = 1024;
    v18 = objc_msgSend(v6, "unsignedIntValue");
    v19 = 1024;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ Generated Logs count decreased %u -> %u", (uint8_t *)&v15, 0x18u);
  }

  if ((_DWORD)v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
    objc_msgSend((id)qword_100060568, "setObject:forKeyedSubscript:", v10, v5);

  }
  else
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v11)
    {
      v12 = objc_alloc_init((Class)NSMutableArray);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v11, "addObject:", v5);
  }

}

BOOL sub_10002ACF4(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  void *v4;
  _BOOL8 v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060570, "objectForKeyedSubscript:", a1));
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "unsignedIntValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = v3 > objc_msgSend(v4, "slowAppActivationPerAppMaxLogLimit");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_10002AD70(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060570, "objectForKeyedSubscript:", v1));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v6 = objc_msgSend(v5, "slowAppActivationPerAppMaxLogLimit");

  if (v4 >= v6)
  {
    v10 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412802;
      v12 = v1;
      v13 = 1024;
      v14 = v4;
      v15 = 1024;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ Launch Generated Log count : %u -> %u", (uint8_t *)&v11, 0x18u);
    }
  }
  else
  {
    v7 = sub_100024FF4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412802;
      v12 = v1;
      v13 = 1024;
      v14 = v4;
      v15 = 1024;
      v16 = v4 + 1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Launch Generated Log count: %u -> %u", (uint8_t *)&v11, 0x18u);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4 + 1));
    objc_msgSend((id)qword_100060570, "setObject:forKeyedSubscript:", v9, v1);
  }

}

id sub_10002B104(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("EnablementType");
  v8[1] = CFSTR("CaptureSuccessful");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
  v9[1] = v2;
  v8[2] = CFSTR("CaptureFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v9[2] = v3;
  v8[3] = CFSTR("HangSubType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  v9[3] = v4;
  v8[4] = CFSTR("HTBugType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 56)));
  v9[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));

  return v6;
}

id sub_10002D7F8(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  double v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("RequestType");
  v2 = sub_100019D20(*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v11[0] = v3;
  v10[1] = CFSTR("PreviousDumpTime_To_RequestEndTime");
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  v11[1] = v5;
  v10[2] = CFSTR("RequestEndTime_To_CurrentTime");
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1000273EC(*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 48)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  return v8;
}

void sub_10002D8F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "Sending HUD configuration data to HangHUD", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002D924()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "EPL is already enabled by PLDE, not changing os_log subsystem state", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002D950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "EPL is enabled by PLDE, not changing os_log subsystem state", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002D97C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "launch_service_stats enabled.", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002D9A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "launch_service_stats disabled.", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002D9D4(void *a1, void *a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;

  v5 = 136315650;
  v6 = "handleSentryTailspinRequest";
  v7 = 2048;
  v8 = objc_msgSend(a1, "unsignedLongLongValue");
  v9 = 2048;
  v10 = objc_msgSend(a2, "unsignedLongLongValue");
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: Requested startTime = %llu, endTime = %llu", (uint8_t *)&v5, 0x20u);
}

void sub_10002DA90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "Checking for possible EPL and HTSE timeouts", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002DABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "HTFenceTracking: Fence begin", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002DAE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000C1F8();
  sub_10000C1E0((void *)&_mh_execute_header, v0, v1, "HTFenceTracking: Fence end", v2, v3, v4, v5, v6);
  sub_10000C1F0();
}

void sub_10002DB14(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Archive Save Directory specified as %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002DB88(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED reporting data:%@ error:%@", (uint8_t *)&v3, 0x16u);
}

void sub_10002DC0C(os_log_t log, double a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "matuTimeDifferenceMS: negative distance = %f", (uint8_t *)&v2, 0xCu);
}

void sub_10002DC84(unint64_t a1, NSObject *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  int v6;
  __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;

  v3 = off_10005F580;
  v4 = sub_100019D20(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = CFSTR("Tailspin_Requests_By_Type");
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1 ", (uint8_t *)&v6, 0x20u);

}

void sub_10002DD44(os_log_t log)
{
  int v1;
  __CFString *v2;
  __int16 v3;
  const __CFString *v4;

  v1 = 138412546;
  v2 = off_10005F580;
  v3 = 2112;
  v4 = CFSTR("Tailspin_Requests");
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@.%@ += 1", (uint8_t *)&v1, 0x16u);
}

void sub_10002DDD8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218240;
  v4 = qword_10005FC28;
  v5 = 2048;
  v6 = qword_10005FC30;
  sub_10000EBB0((void *)&_mh_execute_header, a1, a3, "getHangWaitTimeout: hangSequenceStartTime %llu, hangSequenceLastHangReportedTime %llu", (uint8_t *)&v3);
  sub_10000EBBC();
}

void sub_10002DE5C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000EBC4();
  sub_10000EBB0((void *)&_mh_execute_header, v0, (uint64_t)v0, "getHangWaitTimeout: now %llu < earliestHangStartTime %llu", v1);
  sub_10000EBBC();
}

void sub_10002DEC4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = qword_10005FC30;
  sub_10000EBB0((void *)&_mh_execute_header, a2, a3, "getHangWaitTimeout: now %llu < hangSequenceLastHangReportedTime %llu", (uint8_t *)&v3);
  sub_10000EBBC();
}

void sub_10002DF40()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000EBC4();
  sub_10000EBB0((void *)&_mh_execute_header, v0, (uint64_t)v0, "getHangWaitTimeout: now %llu < earliestPendingHangStartTime %llu", v1);
  sub_10000EBBC();
}

void sub_10002DFA8(void *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Primary")));
  v6 = 138412546;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Acquired network state: interface type = %@, time since primary = %u", (uint8_t *)&v6, 0x12u);

}

void sub_10002E05C(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  objc_msgSend(a1, "HUD_background_opacity");
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "HUD_background_opacity set to %f", (uint8_t *)&v4, 0xCu);
}

void sub_10002E0E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Deallocating HUDContext…", v1, 2u);
}

void sub_10002E124(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "rendering a list of %lu hangs", a5, a6, a7, a8, 0);
  sub_10000EBBC();
}

void sub_10002E18C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "rendering a list of %lu HUD content", a5, a6, a7, a8, 0);
  sub_10000EBBC();
}

void sub_10002E1F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "Animation did stop for %@", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E258(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "Animation did start for %@", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E2BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a1, a3, "%s called at Angel client", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E32C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a1, a3, "%s called at Angel client", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E39C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a1, a3, "%s called at Angel client", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E40C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a1, a3, "%s called at Angel client", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E47C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a1, a3, "%s called at Angel client", a5, a6, a7, a8, 2u);
  sub_10000EBBC();
}

void sub_10002E4EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "exitTimestamp");
  sub_100015740((void *)&_mh_execute_header, v1, v2, " * ProcExitHUDLine finishedUpdates! - exitTimestamp:%llu", v3, v4, v5, v6, 0);
  sub_100015754();
}

void sub_10002E55C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No more update happens as it's completed for %@ @ HangHUDLine::update:", (uint8_t *)&v2, 0xCu);
}

void sub_10002E5D0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "hangDurationMS");
  sub_100015740((void *)&_mh_execute_header, v1, v2, " * HangHUDLine finishedUpdates! hangDurationMS: %f", v3, v4, v5, v6, 0);
  sub_100015754();
}

void sub_10002E640(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Checking if hang is current with hangID %@: durationSinceLastUpdateMs:%f", (uint8_t *)&v3, 0x16u);
}

void sub_10002E6C0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved file: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002E734(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a2;
  sub_100018D98((void *)&_mh_execute_header, a1, a4, "TextAnimation: no need to update duraton since _hangDuration is equal to the input %f.", (uint8_t *)&v4);
  sub_10000EBBC();
}

void sub_10002E7A0(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a2;
  sub_100018D98((void *)&_mh_execute_header, a1, a4, "TextAnimation: duration layer's animation object updated with toValue = %f", (uint8_t *)&v4);
  sub_10000EBBC();
}

void sub_10002E80C(void *a1, NSObject *a2, double a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  double v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "string"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TextAnimation: duration layer's animation object initialized: text set as %@ for a given duration %f", (uint8_t *)&v6, 0x16u);

}

void sub_10002E8B8(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a2;
  sub_100018D98((void *)&_mh_execute_header, a1, a4, "TextAnimation: animation ended with duration %f", (uint8_t *)&v4);
  sub_10000EBBC();
}

void sub_10002E924(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "string"));
  v5 = 138412290;
  v6 = v3;
  sub_100018D98((void *)&_mh_execute_header, a2, v4, "TextAnimation:  duration layer's text set as %@", (uint8_t *)&v5);

}

void sub_10002E9B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002EA28(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002EA9C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Generate recentAppsDict with pids and paths of recently running apps", v1, 2u);
}

void sub_10002EADC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "dealloc for %@", a5, a6, a7, a8, 2u);
}

void sub_10002EB48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "Querying LS database for bundle id %@", a5, a6, a7, a8, 2u);
}

void sub_10002EBB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, " 🔚 A hang with ID %@ has ended!", a5, a6, a7, a8, 2u);
}

void sub_10002EC1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001259C((void *)&_mh_execute_header, a2, a3, "    A hang with ID %@ has not ended yet!", a5, a6, a7, a8, 2u);
}

void sub_10002EC84(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_100023F08((void *)&_mh_execute_header, a3, (uint64_t)a3, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3);
  sub_10000EBBC();
}

void sub_10002ECFC(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = CFSTR("enablementPrefix");
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100023EF4((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *a2);
  sub_100023F38();
}

void sub_10002ED80()
{
  uint64_t v0;
  os_log_t v1;

  sub_100023F14();
  sub_100023F40();
  sub_100023EF4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_100023F38();
}

void sub_10002EE14()
{
  uint64_t v0;
  os_log_t v1;

  sub_100023F14();
  sub_100023F40();
  sub_100023EF4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_100023F38();
}

void sub_10002EEA8(int a1, int a2, os_log_t log)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;

  v3 = 138412802;
  v4 = CFSTR("isCarryDevice");
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v3, 0x18u);
  sub_10000EBBC();
}

void sub_10002EF38()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100023F24();
  sub_100023F08((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s is set to %@, treating as carry device", (uint8_t *)v2);
  sub_10000EBBC();
}

void sub_10002EFAC()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100023F24();
  sub_100023F08((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", (uint8_t *)v2);
  sub_10000EBBC();
}

void sub_10002F020()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100023F24();
  sub_100023F08((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", (uint8_t *)v2);
  sub_10000EBBC();
}

void sub_10002F094()
{
  uint64_t v0;
  os_log_t v1;

  sub_100023F14();
  sub_100023F40();
  sub_100023EF4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_100023F38();
}

void sub_10002F128()
{
  uint64_t v0;
  os_log_t v1;

  sub_100023F14();
  sub_100023F40();
  sub_100023EF4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_100023F38();
}

void sub_10002F1BC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10002F1FC()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10002F224(uint64_t *a1, NSObject *a2, double a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  __int16 v8;
  uint64_t v9;

  v3 = *a1;
  v4 = 134218496;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  v8 = 2048;
  v9 = 0x4059000000000000;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "HTHUD: numberOfDashes greater than maximum, elapsedTimeMS=%f, numberOfDashes=%f, capping to max_dash_count=%f", (uint8_t *)&v4, 0x20u);
}

void sub_10002F2B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C1E0((void *)&_mh_execute_header, a1, a3, "Sending hang data to HangHUD", a5, a6, a7, a8, 0);
  sub_10000C1F0();
}

void sub_10002F2E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C1E0((void *)&_mh_execute_header, a1, a3, "updateHUD: Passed NULL Clearing message", a5, a6, a7, a8, 0);
  sub_10000C1F0();
}

void sub_10002F314(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C1E0((void *)&_mh_execute_header, a1, a3, "Setting up the HUD", a5, a6, a7, a8, 0);
  sub_10000C1F0();
}

void sub_10002F344(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C1E0((void *)&_mh_execute_header, a1, a3, "HTAssertion: checkOverlap: no assertions have been tracked", a5, a6, a7, a8, 0);
}

void sub_10002F378(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C1E0((void *)&_mh_execute_header, a1, a3, "HTAssertion: checkOverlap: hang does not overlap any assertions", a5, a6, a7, a8, 0);
}

void sub_10002F3AC(uint8_t *a1, unint64_t a2, double *a3, NSObject *a4)
{
  double v7;

  v7 = sub_1000273EC(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms", a1, 0xCu);
}

void sub_10002F414(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Tailspins will include trial information", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_HUD_background_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HUD_background_opacity");
}

id objc_msgSend_HangHUD_updater_latency_in_ms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HangHUD_updater_latency_in_ms");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_absoluteTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteTime");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:");
}

id objc_msgSend_actionWithIdentifier_title_url_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:url:options:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCommitHandler:forPhase:");
}

id objc_msgSend_addDisplayStateChangeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDisplayStateChangeEvent:");
}

id objc_msgSend_addHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHang:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allHangs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHangs");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allowedProcessNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedProcessNames");
}

id objc_msgSend_allowedReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedReasons");
}

id objc_msgSend_allowedSubReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedSubReasons");
}

id objc_msgSend_allowsAllProcesses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsAllProcesses");
}

id objc_msgSend_allowsCriticalProcesses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsCriticalProcesses");
}

id objc_msgSend_animationDidStartOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStartOnLine:");
}

id objc_msgSend_animationDidStopOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStopOnLine:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appActivationLoggingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appActivationLoggingEnabled");
}

id objc_msgSend_appLaunchMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLaunchMonitoringEnabled");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_areAllProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areAllProcessTerminationsMonitored");
}

id objc_msgSend_areCriticalProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areCriticalProcessTerminationsMonitored");
}

id objc_msgSend_areProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areProcessTerminationsMonitored");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatePrefix_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associatePrefix:withHandler:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automatedDeviceGroup");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginAnimationFromValue_toValue_duration_updateBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimationFromValue:toValue:duration:updateBlock:completionBlock:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bundleIdToAppNameCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdToAppNameCache");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_calendarTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarTime");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canceled");
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizedString");
}

id objc_msgSend_captureMicroHang(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureMicroHang");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_checkEventsForHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkEventsForHUDUpdate:");
}

id objc_msgSend_checkEventsForTimeouts_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkEventsForTimeouts:withType:");
}

id objc_msgSend_checkForHUDTimeouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForHUDTimeouts:");
}

id objc_msgSend_checkForHangTimeouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForHangTimeouts:");
}

id objc_msgSend_checkShouldSaveHangLogs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkShouldSaveHangLogs");
}

id objc_msgSend_cleanupAllHangs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupAllHangs");
}

id objc_msgSend_clearBundleNameCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBundleNameCache");
}

id objc_msgSend_clearHUDLinesAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:");
}

id objc_msgSend_clearHUDLinesAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:withCompletion:");
}

id objc_msgSend_clearHUDWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDWithCompletion:");
}

id objc_msgSend_clientContextIdentifierKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientContextIdentifierKey");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collectTailspinAndUpdateTelemtry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectTailspinAndUpdateTelemtry");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_compareBootSessionUUIDAndClearPreferencesWithDomain_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareBootSessionUUIDAndClearPreferencesWithDomain:prefix:");
}

id objc_msgSend_compareValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareValue");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationAllowingAllProcesses_criticalProcesses_processNames_reasons_subReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:");
}

id objc_msgSend_configurationFromPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationFromPrefs:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectionWithEndpoint_clientContextBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionWithEndpoint:clientContextBuilder:");
}

id objc_msgSend_containerLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerLayer");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentScaleForTexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentScaleForTexts");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countsOfMeetingEndingConditions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countsOfMeetingEndingConditions");
}

id objc_msgSend_createContainerLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createContainerLayer");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHangTextColorForStatus:");
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOrientation");
}

id objc_msgSend_currentProcessExitTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentProcessExitTextColor");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTheme");
}

id objc_msgSend_darkModeTheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkModeTheme");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptor");
}

id objc_msgSend_determineNewFrameForRootLayer_numberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineNewFrameForRootLayer:numberOfLines:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayId");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayNameForHangInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForHangInfo:");
}

id objc_msgSend_displayStateArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStateArray");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlyInitNecessaryPrefs");
}

id objc_msgSend_enableLoggingForPoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableLoggingForPoster");
}

id objc_msgSend_enableLoggingForWidgetRenderer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableLoggingForWidgetRenderer");
}

id objc_msgSend_enablementPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablementPrefix");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnimation:");
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTime");
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_eplEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eplEnabled");
}

id objc_msgSend_eplEnabledProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eplEnabledProfile");
}

id objc_msgSend_eplTimeoutTimestampSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eplTimeoutTimestampSec");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executablePath");
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitEvent");
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitReasonCode");
}

id objc_msgSend_exitReasonCodeTextLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitReasonCodeTextLayer");
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitReasonNamespace");
}

id objc_msgSend_exitReasonNamespaceTextLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitReasonNamespaceTextLayer");
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitTimestamp");
}

id objc_msgSend_expirationMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationMSec");
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionPointRecord");
}

id objc_msgSend_failReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failReason");
}

id objc_msgSend_fenceHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceHangDailyLogLimit");
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchProcessRecords");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filePath");
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:relativeToURL:");
}

id objc_msgSend_firstHang(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstHang");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flush");
}

id objc_msgSend_forceQuitDetectionEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceQuitDetectionEnabled");
}

id objc_msgSend_forceQuitDetectionThresholdMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceQuitDetectionThresholdMSec");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromValue");
}

id objc_msgSend_getApplicationByBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getApplicationByBundleId:");
}

id objc_msgSend_getBootSessionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBootSessionUUID");
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescription:");
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEPLProfilePath");
}

id objc_msgSend_getEarliestPendingHangStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEarliestPendingHangStartTime:");
}

id objc_msgSend_getHangHUDInfoKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHangHUDInfoKey");
}

id objc_msgSend_getHangStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHangStartTime:");
}

id objc_msgSend_getHangWaitTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHangWaitTimeout");
}

id objc_msgSend_getHighestPrioritySettingValue_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHighestPrioritySettingValue:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_getKeyForLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKeyForLine:");
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotificationSettingsWithCompletionHandler:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hangDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangDescription");
}

id objc_msgSend_hangDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangDuration");
}

id objc_msgSend_hangDurationMS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangDurationMS");
}

id objc_msgSend_hangEndTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangEndTime");
}

id objc_msgSend_hangHasPendingAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangHasPendingAnimation:");
}

id objc_msgSend_hangSequenceEndTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangSequenceEndTime");
}

id objc_msgSend_hangSequenceStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangSequenceStartTime");
}

id objc_msgSend_hangStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangStartTime");
}

id objc_msgSend_hangSubType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangSubType");
}

id objc_msgSend_hangWaitTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangWaitTimeoutDurationMSec");
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangtracerDaemonEnabled");
}

id objc_msgSend_hasAppExceededGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:");
}

id objc_msgSend_hasExceededDailyFenceLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExceededDailyFenceLogLimit");
}

id objc_msgSend_hasExceededDailyLimit_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExceededDailyLimit:isFirstPartyApp:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_htTailspinEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "htTailspinEnabled");
}

id objc_msgSend_hudContentWithPendingAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudContentWithPendingAnimations");
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudEnabled");
}

id objc_msgSend_hudLine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudLine");
}

id objc_msgSend_hudLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudLines");
}

id objc_msgSend_hudRenderContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudRenderContext");
}

id objc_msgSend_hudString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudString");
}

id objc_msgSend_hudThresholdMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudThresholdMSec");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_incrementAppGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:");
}

id objc_msgSend_incrementDailyFenceLogGenerationCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementDailyFenceLogGenerationCount");
}

id objc_msgSend_incrementDailyLogGenerationCountForDuration_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementDailyLogGenerationCountForDuration:isFirstPartyApp:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSet");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoDict");
}

id objc_msgSend_initPropertyProcessTerminationSubReasonsMonitored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPropertyProcessTerminationSubReasonsMonitored:");
}

id objc_msgSend_initStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initStatus");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:queue:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChangesDeliveredOnQueue_toBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChangesDeliveredOnQueue:toBlock:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHangStartTime_hangEndTime_receivedTimestamp_hangDurationMS_hudString_shortenedBundle_bundleId_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:");
}

id objc_msgSend_initWithNamespaceLayer_codeLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNamespaceLayer:codeLayer:");
}

id objc_msgSend_initWithPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:sharedMem:length:bundleID:");
}

id objc_msgSend_initWithPid_threadID_startTime_endTime_reportedTime_blownFenceID_hangSubtype_isFirstPartyApp_isThirdPartyDevSupportModeHang_displayedInHUD_serviceName_reason_processName_processPath_userActionData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:");
}

id objc_msgSend_initWithPreviousHangTextColor_currentHangTextColor_currentHangSevereTextColor_previousHangSevereTextColor_currentHangCriticalTextColor_previousHangCriticalTextColor_backgroundColor_currentProcessExitTextColor_processExitReasonNamespaceTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:");
}

id objc_msgSend_initWithProcExitRecord_theme_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcExitRecord:theme:lineDelegate:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_processName_theme_fontSize_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:processName:theme:fontSize:lineDelegate:");
}

id objc_msgSend_initWithRenderContext_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRenderContext:queue:");
}

id objc_msgSend_initWithRunloopHangTimeoutDurationMSec_thirdPartyDevPreferredLanguages_areProcessTerminationsMonitored_processTerminationsFiltering_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:");
}

id objc_msgSend_initWithServiceName_threadID_startTime_endTime_saveTailspin_subType_userActionData_isThirdPartyDevSupportModeHang_processInfo_captureMicroHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initializeStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeStatus");
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insert:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interface");
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAnyModeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnyModeActive");
}

id objc_msgSend_isCurrent_withHUDUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrent:withHUDUpdateInterval:");
}

id objc_msgSend_isDeveloperApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeveloperApp");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstPartyApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstPartyApp");
}

id objc_msgSend_isHang(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHang");
}

id objc_msgSend_isHangEndedWithDuration_updateInterval_hangID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHangEndedWithDuration:updateInterval:hangID:");
}

id objc_msgSend_isImmersionLevelControllerPresentOnScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isImmersionLevelControllerPresentOnScreen");
}

id objc_msgSend_isInForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInForeground");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternal");
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProfileValidated");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isThirdPartyDevSupportModeHang(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThirdPartyDevSupportModeHang");
}

id objc_msgSend_isTimedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTimedOut");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jetsam_priority");
}

id objc_msgSend_keyLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyLayer");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageCode");
}

id objc_msgSend_lastKnownHangs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastKnownHangs");
}

id objc_msgSend_lastKnownMaxKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastKnownMaxKeyLayerWidth");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutHUDLines_ids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutHUDLines:ids:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_lightModeTheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightModeTheme");
}

id objc_msgSend_lineDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineDelegate");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_machName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "machName");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_memoryLoggingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memoryLoggingEnabled");
}

id objc_msgSend_memoryLoggingIntervalSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memoryLoggingIntervalSec");
}

id objc_msgSend_minimumValueLayerWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumValueLayerWidth");
}

id objc_msgSend_monitorAppLaunchSignposts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorAppLaunchSignposts");
}

id objc_msgSend_monitorSignposts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorSignposts:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWorkflowsWithDailyLogLimit:perPeriodLogLimit:periodLengthSec:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_networkStateForTailSpin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkStateForTailSpin");
}

id objc_msgSend_nilifyCALayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilifyCALayers");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCenter");
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationQueue");
}

id objc_msgSend_notifyHTTailSpinResult_failReason_hangSubType_htBugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyHTTailSpinResult:failReason:hangSubType:htBugType:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfHangs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfHangs");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_obtainKeepHangHUDAliveAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainKeepHangHUDAliveAssertion:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_performHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:");
}

id objc_msgSend_performHUDUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:withCompletion:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefContextPrefixPriorityOrder");
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefInitList");
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFrameSize");
}

id objc_msgSend_preferredKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredKeyLayerWidth");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_preferredValueLayerWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredValueLayerWidth");
}

id objc_msgSend_previousDurationSinceLastUpdateMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousDurationSinceLastUpdateMs");
}

id objc_msgSend_previousHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousHangTextColorForStatus:");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousState");
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "process");
}

id objc_msgSend_processExitReasonNamespaceTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processExitReasonNamespaceTextColor");
}

id objc_msgSend_processForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForPid:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processTerminationNamesMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTerminationNamesMonitored");
}

id objc_msgSend_processTerminationReasonsMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTerminationReasonsMonitored");
}

id objc_msgSend_processTerminationSubReasonsMonitored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTerminationSubReasonsMonitored");
}

id objc_msgSend_processTerminationsFiltering(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTerminationsFiltering");
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_receiveHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHangHUDInfo:completion:");
}

id objc_msgSend_receiveHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHudConfiguration:completion:");
}

id objc_msgSend_receiveMonitoredStates_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMonitoredStates:completion:");
}

id objc_msgSend_receiveProcExitRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveProcExitRecord:completion:");
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedTimestamp");
}

id objc_msgSend_recentAppsDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentAppsDict");
}

id objc_msgSend_recordFenceHang_startTime_endTime_reportedTime_blownFenceId_saveTailspin_subtype_isThirdPartyDevSupportModeHang_captureMicroHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:");
}

id objc_msgSend_recordHang(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordHang");
}

id objc_msgSend_recordHang_threadID_startTime_endTime_saveTailspin_subtype_userActionData_isThirdPartyDevSupportModeHang_captureMicroHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:");
}

id objc_msgSend_refreshAppGeneratedLogsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshAppGeneratedLogsCount");
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshHTPrefs");
}

id objc_msgSend_refreshPerPeriodSentryLogCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshPerPeriodSentryLogCount");
}

id objc_msgSend_reloadThemeColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadThemeColors");
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContextWithOptions:");
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTargetWithLaunchingAssertionAttributes:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllAnimations");
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllDeliveredNotifications");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllPendingNotificationRequests");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperlayer");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingNotificationRequestsWithIdentifiers:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportPeriodMATU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPeriodMATU");
}

id objc_msgSend_reportedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportedTime");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_resetAppActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAppActivationTailspinCounts");
}

id objc_msgSend_resetDailyActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDailyActivationTailspinCounts");
}

id objc_msgSend_resetDailyGeneratedLogsCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDailyGeneratedLogsCounts");
}

id objc_msgSend_resetDailySentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDailySentryTailspinCounts");
}

id objc_msgSend_resetLogCountsForDailyRollover(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLogCountsForDailyRollover");
}

id objc_msgSend_resetLogCountsForEPL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLogCountsForEPL");
}

id objc_msgSend_resetPerAppCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPerAppCounts");
}

id objc_msgSend_resetPerPeriodSentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPerPeriodSentryTailspinCounts");
}

id objc_msgSend_responseHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseHandlers");
}

id objc_msgSend_retargeted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retargeted");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootLayer");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runLoopHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runLoopHangDailyLogLimit");
}

id objc_msgSend_runLoopHangPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runLoopHangPerPeriodLogLimit");
}

id objc_msgSend_runLoopLongHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runLoopLongHangDailyLogLimit");
}

id objc_msgSend_runLoopMicroHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runLoopMicroHangDailyLogLimit");
}

id objc_msgSend_runloopHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runloopHangDurationThresholdMSec");
}

id objc_msgSend_runloopHangThirdPartyDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runloopHangThirdPartyDailyLogLimit");
}

id objc_msgSend_runloopHangThirdPartyDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runloopHangThirdPartyDurationThresholdMSec");
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runloopHangTimeoutDurationMSec");
}

id objc_msgSend_runloopLongHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runloopLongHangDurationThresholdMSec");
}

id objc_msgSend_savePreferencesForRestoration_withDomain_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePreferencesForRestoration:withDomain:prefix:");
}

id objc_msgSend_saveSentryTailspin_infoDict_startTime_endTime_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSentryTailspin:infoDict:startTime:endTime:error:");
}

id objc_msgSend_saveTailSpinWithFileName_infoDictArray_startTime_endTime_processString_pid_requestType_failReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:");
}

id objc_msgSend_saveTailspin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTailspin");
}

id objc_msgSend_saveTailspinForAllHangs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTailspinForAllHangs");
}

id objc_msgSend_saveTailspinForForceQuitProcessID_procName_procPath_filePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTailspinForForceQuitProcessID:procName:procPath:filePath:");
}

id objc_msgSend_saveTailspinWithFileName_path_infoDictArray_startTime_endTime_processString_pid_requestType_includeOSSignposts_failReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:");
}

id objc_msgSend_sendHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHangHUDInfo:completion:");
}

id objc_msgSend_sendHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHudConfiguration:completion:");
}

id objc_msgSend_serverRunningDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRunningDidChange:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceQuality");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAbsoluteTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAbsoluteTime:");
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowedProcessNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedProcessNames:");
}

id objc_msgSend_setAllowedReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedReasons:");
}

id objc_msgSend_setAllowedSubReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedSubReasons:");
}

id objc_msgSend_setAllowsAllProcesses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAllProcesses:");
}

id objc_msgSend_setAllowsCriticalProcesses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCriticalProcesses:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setCalendarTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendarTime:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContainerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerLayer:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountsOfMeetingEndingConditions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountsOfMeetingEndingConditions:");
}

id objc_msgSend_setCurrentTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTheme:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayScaleDependentPropertiesOnLayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayScaleDependentPropertiesOnLayers");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setExecutablePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutablePath:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExpirationMSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationMSec:");
}

id objc_msgSend_setFailReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailReason:");
}

id objc_msgSend_setFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilePath:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHUD_background_opacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHUD_background_opacity:");
}

id objc_msgSend_setHangDuration_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangDuration:animated:");
}

id objc_msgSend_setHangHUD_updater_latency_in_ms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUD_updater_latency_in_ms:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHudLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudLine:");
}

id objc_msgSend_setHudRenderContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudRenderContext:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionLevel:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsHang_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHang:");
}

id objc_msgSend_setKeyLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayer:");
}

id objc_msgSend_setLastKnownHangs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownHangs:");
}

id objc_msgSend_setLastKnownMaxKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownMaxKeyLayerWidth:");
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayer:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineDelegate:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setMinimumValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueLayerWidth:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCenter:");
}

id objc_msgSend_setNotificationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationQueue:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredKeyLayerWidth:");
}

id objc_msgSend_setPreferredValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredValueLayerWidth:");
}

id objc_msgSend_setPreviousDurationSinceLastUpdateMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousDurationSinceLastUpdateMs:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setResponseHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseHandlers:");
}

id objc_msgSend_setRetargeted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetargeted:");
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecure:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldBackgroundDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldBackgroundDefaultAction:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSidePadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSidePadding:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublayerTransform:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTruncationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncationMode:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdatesComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesComplete:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValueLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueLayer:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVibrancyFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVibrancyFilter:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedAnimator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAnimator");
}

id objc_msgSend_sharedHelperWithCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHelperWithCategories:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMonitor");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPrefs");
}

id objc_msgSend_shortenedBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortenedBundle");
}

id objc_msgSend_shouldCollectOSSignposts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCollectOSSignposts");
}

id objc_msgSend_shouldDisplayFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDisplayFenceHangToHUD");
}

id objc_msgSend_shouldDisplayNonFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDisplayNonFenceHangToHUD");
}

id objc_msgSend_shouldIncludeDisplayData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncludeDisplayData");
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPostHTPrefsChangedNotification");
}

id objc_msgSend_shouldSaveFenceHangLogs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSaveFenceHangLogs");
}

id objc_msgSend_shouldUpdateHangsHUD(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUpdateHangsHUD");
}

id objc_msgSend_shouldUploadToDiagPipe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUploadToDiagPipe");
}

id objc_msgSend_signpostMonitoringDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signpostMonitoringDailyLogLimit");
}

id objc_msgSend_signpostMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signpostMonitoringEnabled");
}

id objc_msgSend_signpostMonitoringPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signpostMonitoringPerPeriodLogLimit");
}

id objc_msgSend_slowAppActivationDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slowAppActivationDailyLogLimit");
}

id objc_msgSend_slowAppActivationPerAppMaxLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slowAppActivationPerAppMaxLogLimit");
}

id objc_msgSend_slowAppActivationTailspinEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slowAppActivationTailspinEnabled");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spawnTimestamp");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTime");
}

id objc_msgSend_startTimeWithinMS_ofCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimeWithinMS:ofCurrentTime:");
}

id objc_msgSend_startWatchingPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWatchingPid:sharedMem:length:bundleID:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_statusForHangWithDuration_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForHangWithDuration:timedOut:");
}

id objc_msgSend_stopMonitoringAppLaunchSignposts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringAppLaunchSignposts");
}

id objc_msgSend_stopMonitoringSignposts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringSignposts");
}

id objc_msgSend_stopMonitoringWorkflows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringWorkflows");
}

id objc_msgSend_stopWatchingAllPids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWatchingAllPids");
}

id objc_msgSend_stopWatchingPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWatchingPid:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sublayers");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtype");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "target");
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithProcessIdentity:");
}

id objc_msgSend_thirdPartyDevHangHUDEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thirdPartyDevHangHUDEnabled");
}

id objc_msgSend_thirdPartyDevPreferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thirdPartyDevPreferredLanguages");
}

id objc_msgSend_thirdPartyIncludeNonDevelopmentApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thirdPartyIncludeNonDevelopmentApps");
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "threadID");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timedOut");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toValue");
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_update_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update:options:");
}

id objc_msgSend_updateAnimation_toValue_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnimation:toValue:duration:");
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBlock");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateCornerRadiusAndSidePaddingIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCornerRadiusAndSidePaddingIfNecessary:");
}

id objc_msgSend_updateCurrentTheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentTheme");
}

id objc_msgSend_updateDisplayLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplayLink");
}

id objc_msgSend_updateHUDLineWithId_content_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUDLineWithId:content:options:");
}

id objc_msgSend_updateHangs_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHangs:withCompletion:");
}

id objc_msgSend_updatesComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesComplete");
}

id objc_msgSend_userActionData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActionData");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valid");
}

id objc_msgSend_valueAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAtTime:");
}

id objc_msgSend_valueLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueLayer");
}

id objc_msgSend_workflowResponsivenessDailyLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowResponsivenessDailyLogLimit");
}

id objc_msgSend_workflowResponsivenessEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowResponsivenessEnabled");
}

id objc_msgSend_workflowResponsivenessPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowResponsivenessPerPeriodLogLimit");
}
