@implementation STUFetchNumberOfDaysBeforeAutomaticRemovalOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STUFetchNumberOfDaysBeforeAutomaticRemovalOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKFetchNumberOfDaysBeforeAutomaticRemovalRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3218);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_9:
      v9 = 0;
      *a4 = v11;
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));

  if (!v8)
  {
    if (a4)
    {
      v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3240);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  STUFetchCoursesOperation *v5;
  void *v6;
  STUFetchCoursesOperation *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_opt_new(CRKFetchCoursesRequest);
  v5 = [STUFetchCoursesOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = -[STUTaskOperation initWithRequest:context:delegate:](v5, "initWithRequest:context:delegate:", v10, v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
  -[STUFetchCoursesOperation addTarget:selector:forOperationEvents:userInfo:](v7, "addTarget:selector:forOperationEvents:userInfo:", self, "fetchCoursesOperationDidFinish:groupIdentifier:", 6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v9, "addOperation:", v7);

}

- (void)fetchCoursesOperationDidFinish:(id)a3 groupIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  STUFetchNumberOfDaysBeforeAutomaticRemovalOperation *v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  const __CFString *v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

  if (v8)
  {
    v9 = sub_100026394();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10007B544(v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    -[STUFetchNumberOfDaysBeforeAutomaticRemovalOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }
  else
  {
    v28 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultObject"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courses"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "courseIdentifier"));
        v19 = objc_msgSend(v18, "isEqual:", v7);

        if ((v19 & 1) != 0)
          break;
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v20 = v17;

      if (!v20)
        goto LABEL_16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRKPlatformInternetDateProvider sharedProvider](CRKPlatformInternetDateProvider, "sharedProvider"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000263D4;
      v29[3] = &unk_1000CA490;
      v29[4] = v28;
      v30 = v20;
      v22 = v20;
      objc_msgSend(v21, "fetchInternetDateWithCompletion:", v29);

    }
    else
    {
LABEL_13:

LABEL_16:
      v23 = sub_100026394();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10007B504(v24);

      if (v7)
        v25 = v7;
      else
        v25 = CFSTR("groupIdentifier");
      v35 = CFSTR("kCRKItemNameErrorKey");
      v36 = v25;
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v26 = CRKErrorWithCodeAndUserInfo(12, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[STUFetchNumberOfDaysBeforeAutomaticRemovalOperation endOperationWithError:](v28, "endOperationWithError:", v27);

    }
  }

}

- (void)didFetchInternetDate:(id)a3 course:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v13 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "automaticRemovalDate"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:toDate:options:", 240, v7, v8, 0));
  v10 = (char *)objc_msgSend(v9, "day");
  v11 = (uint64_t)objc_msgSend(v9, "hour") > 0
     || (uint64_t)objc_msgSend(v9, "minute") > 0
     || (uint64_t)objc_msgSend(v9, "second") > 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchNumberOfDaysBeforeAutomaticRemovalOperation makeResultObjectWithNumberOfDaysBeforeAutomaticRemoval:](self, "makeResultObjectWithNumberOfDaysBeforeAutomaticRemoval:", &v10[v11]));
  -[STUFetchNumberOfDaysBeforeAutomaticRemovalOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v12);

}

- (id)makeResultObjectWithNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject), "initWithNumberOfDaysBeforeAutomaticRemoval:", a3);
}

- (void)taskOperation:(id)a3 needsToEnqueueOperation:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v5, "addOperation:", v4);

}

@end
