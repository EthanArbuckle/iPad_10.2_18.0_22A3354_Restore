@implementation ICDeleteOrphanedAccountDirectoriesFromAppDataContainerLaunchTask

- (void)runLaunchTask
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *k;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id obj;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *j;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  NSURLResourceKey v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_100044160;
  v55 = sub_100044170;
  v56 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100044178;
  v48[3] = &unk_100550660;
  v50 = &v51;
  v49 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v27 = v49;
  objc_msgSend(v49, "performBlockAndWait:", v48);
  v2 = objc_alloc_init((Class)NSMutableSet);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = (id)v52[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationDataContainerURLForAccountIdentifier:", v7));

        objc_msgSend(v2, "ic_addNonNilObject:", v9);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
    }
    while (v4);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v2;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j), "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "URLByAppendingPathComponent:isDirectory:", CFSTR("Accounts"), 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v62 = NSURLIsDirectoryKey;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v32, v11, 1, 0));

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v14; k = (char *)k + 1)
            {
              if (*(_QWORD *)v37 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k);
              v35 = 0;
              v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v35, NSURLIsDirectoryKey, 0);
              v19 = v35;
              v20 = v19;
              if (v18)
              {
                if (objc_msgSend(v19, "BOOLValue"))
                {
                  v21 = (void *)v52[5];
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
                  LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v22);

                  if ((v21 & 1) == 0)
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                    v34 = 0;
                    objc_msgSend(v23, "removeItemAtURL:error:", v17, &v34);
                    v24 = v34;

                    v25 = os_log_create("com.apple.notes", "Application");
                    v26 = v25;
                    if (v24)
                    {
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v58 = v17;
                        v59 = 2112;
                        v60 = v24;
                        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to clean up orphaned account directory %@, error %@", buf, 0x16u);
                      }
                    }
                    else if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v58 = v17;
                      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully cleaned up orphaned account directory %@", buf, 0xCu);
                    }

                  }
                }
              }

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
          }
          while (v14);
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
    }
    while (v30);
  }

  _Block_object_dispose(&v51, 8);
}

@end
