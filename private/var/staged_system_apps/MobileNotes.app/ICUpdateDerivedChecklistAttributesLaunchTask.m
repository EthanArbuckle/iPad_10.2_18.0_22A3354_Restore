@implementation ICUpdateDerivedChecklistAttributesLaunchTask

- (void)runOneTimeLaunchTask
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A44B8;
  v4[3] = &unk_100550110;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (void)updateNotesWithObjectIDs:(id)a3 usingValue:(BOOL)a4 forKey:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  id v31;
  id v32;
  void *v33;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc((Class)NSBatchUpdateRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote entity](ICNote, "entity"));
  v12 = objc_msgSend(v10, "initWithEntity:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self in %@"), v9));
  objc_msgSend(v12, "setPredicate:", v13);

  v32 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v33 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  objc_msgSend(v12, "setPropertiesToUpdate:", v15);

  objc_msgSend(v12, "setResultType:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v25 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "executeRequest:error:", v12, &v25));
  v18 = v25;

  v19 = os_log_create("com.apple.notes", "LaunchTask");
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 2112;
      if (v5)
        v21 = CFSTR("YES");
      v29 = v21;
      v30 = 2112;
      v31 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error updating %@ to %@ : %@", buf, 0x20u);
    }
  }
  else
  {
    v22 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (v5)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "result"));
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Updated %@ to %@ for %@ notes", buf, 0x20u);

    }
  }

}

@end
