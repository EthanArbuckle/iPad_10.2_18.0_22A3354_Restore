@implementation OsLogStream

+ (BOOL)putOsLogStreamToFile:(id)a3 process:(id)a4 imagePath:(id)a5 history:(double)a6
{
  void *v10;
  NSFileHandle *v11;
  dispatch_group_t v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  uint64_t v19;
  void *j;
  NSCompoundPredicate *v21;
  void *v22;
  void *v23;
  NSDate *v24;
  dispatch_time_t v25;
  intptr_t v26;
  BOOL v27;
  char v28;
  id v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  double v52;

  v10 = objc_autoreleasePoolPush();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3052000000;
  v46 = sub_100003240;
  v47 = sub_100003250;
  v48 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10000325C;
  v42[3] = &unk_10001C678;
  v42[4] = &v43;
  objc_msgSend(+[OSLogEventStore localStore](OSLogEventStore, "localStore"), "prepareWithCompletionHandler:", v42);
  if (!v44[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to prepare oslog stream", buf, 2u);
    }
    v27 = 0;
    goto LABEL_29;
  }
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", a3, 0, 0);
  v11 = +[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", a3);
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v52 = *(double *)&v30;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create file: %s", buf, 0xCu);
    }

    goto LABEL_36;
  }
  v12 = dispatch_group_create();
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get group", buf, 2u);
    }
    -[NSFileHandle closeFile](v11, "closeFile");

LABEL_36:
    v28 = 0;
    v27 = 0;
    goto LABEL_37;
  }
  v13 = v12;
  objc_msgSend((id)v44[5], "setFlags:", 21);
  v31 = v10;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(a4);
        objc_msgSend(v14, "addObject:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("process == %@"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i)));
      }
      v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v15);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(a5);
        objc_msgSend(v14, "addObject:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("senderImagePath CONTAINS[cd] %@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j)));
      }
      v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v18);
  }
  if (objc_msgSend(v14, "count"))
  {
    v21 = +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v14);
    objc_msgSend((id)v44[5], "setFilterPredicate:", v21);
  }
  v22 = (void *)v44[5];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000333C;
  v33[3] = &unk_10001C6A0;
  v33[4] = v11;
  objc_msgSend(v22, "setEventHandler:", v33);
  v23 = (void *)v44[5];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000034AC;
  v32[3] = &unk_10001C6C8;
  v32[4] = v13;
  objc_msgSend(v23, "setInvalidationHandler:", v32);
  v10 = v31;
  v24 = -[NSDate dateByAddingTimeInterval:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", CFAbsoluteTimeGetCurrent()), "dateByAddingTimeInterval:", -a6);
  dispatch_group_enter(v13);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v52 = a6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Getting oslog stream: history = %f", buf, 0xCu);
  }
  objc_msgSend((id)v44[5], "activateStreamFromDate:", v24);
  v25 = dispatch_time(0, 180000000000);
  v26 = dispatch_group_wait(v13, v25);
  v27 = v26 == 0;
  if (v26)
  {
    objc_msgSend((id)v44[5], "invalidate");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timeout on getting oslog stream", buf, 2u);
    }
  }
  dispatch_release(v13);
  -[NSFileHandle closeFile](v11, "closeFile");

LABEL_29:
  v28 = 1;
LABEL_37:
  _Block_object_dispose(&v43, 8);
  objc_autoreleasePoolPop(v10);
  return v28 & v27;
}

@end
