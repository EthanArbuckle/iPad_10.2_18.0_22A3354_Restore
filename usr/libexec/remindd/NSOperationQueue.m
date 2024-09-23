@implementation NSOperationQueue

- (id)existingOperationToDeleteRecordID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self, "operations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D9C4;
  v9[3] = &unk_1007DA580;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectPassingTest:", v9));

  return v7;
}

- (BOOL)containsOperationToDeleteRecordID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue existingOperationToDeleteRecordID:](self, "existingOperationToDeleteRecordID:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)existingOperationToFetchRecordID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self, "operations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DB10;
  v9[3] = &unk_1007DA580;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectPassingTest:", v9));

  return v7;
}

- (BOOL)containsOperationToFetchRecordID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue existingOperationToFetchRecordID:](self, "existingOperationToFetchRecordID:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)existingOperationToSaveRecordID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self, "operations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DC5C;
  v9[3] = &unk_1007DA580;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectPassingTest:", v9));

  return v7;
}

- (BOOL)containsOperationToSaveRecordID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue existingOperationToSaveRecordID:](self, "existingOperationToSaveRecordID:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)iterativelyCancelDependentOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self, "operations"));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = v5;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (v9)
  {
    v10 = (void *)v9;
    v24 = v7;
    do
    {
      if (!objc_msgSend(v7, "count", v24))
        break;
      objc_msgSend(v26, "removeLastObject");
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dependencies"));
            if (objc_msgSend(v18, "containsObject:", v4))
            {
              v19 = objc_msgSend(v17, "isCancelled");

              if ((v19 & 1) == 0)
              {
                v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_loggingDescription"));
                  *(_DWORD *)buf = 138412290;
                  v32 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Canceling operation: %@", buf, 0xCu);

                }
                objc_msgSend(v17, "cancel");
                objc_msgSend(v26, "addObject:", v17);
                objc_msgSend(v11, "addObject:", v17);
                objc_msgSend(v8, "addObject:", v17);
              }
            }
            else
            {

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v14);
      }

      objc_msgSend(v12, "removeObjectsInArray:", v11);
      v7 = v24;
      v10 = (void *)v25;
    }
    while (v25);

  }
  v22 = objc_msgSend(v8, "copy");

  return v22;
}

@end
