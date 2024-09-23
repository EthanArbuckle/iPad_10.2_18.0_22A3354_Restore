@implementation ICDeleteCoherenceContextsFromGroupContainerLaunchTask

- (id)taskIdentifier
{
  return CFSTR("DidDeleteCoherenceContextsFromGroupContainerLaunchTask");
}

- (void)runOneTimeLaunchTask
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
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id obj;
  uint64_t v31;
  id v32;
  void *v33;
  void *j;
  id v35;
  id v36;
  id v37;
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
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  NSObject *v62;
  _BYTE v63[128];
  NSURLResourceKey v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_100072F9C;
  v57 = sub_100072FAC;
  v58 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100072FB4;
  v50[3] = &unk_100550660;
  v52 = &v53;
  v51 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v29 = v51;
  objc_msgSend(v51, "performBlockAndWait:", v50);
  v2 = objc_alloc_init((Class)NSMutableSet);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v3 = (id)v54[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationDocumentsURLForAccountIdentifier:", v7));

        objc_msgSend(v2, "ic_addNonNilObject:", v9);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
    }
    while (v4);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v2;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(obj);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j), "URLByAppendingPathComponent:isDirectory:", CFSTR("Accounts"), 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v64 = NSURLIsDirectoryKey;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v33, v11, 1, 0));

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v35 = v12;
        v13 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v39;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v35);
              v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v15);
              v37 = 0;
              v17 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v37, NSURLIsDirectoryKey, 0);
              v18 = v37;
              v19 = v18;
              if (v17 && objc_msgSend(v18, "BOOLValue"))
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Paper"), 1));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", CFSTR("CoherenceContexts"), 1));
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "path"));
                v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

                if (v24)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                  v36 = 0;
                  objc_msgSend(v25, "removeItemAtURL:error:", v21, &v36);
                  v26 = v36;

                  v27 = os_log_create("com.apple.notes", "Application");
                  v28 = v27;
                  if (v26)
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v60 = v21;
                      v61 = 2112;
                      v62 = v26;
                      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to clean up coherence context directory %@, error %@", buf, 0x16u);
                    }

                  }
                  else
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v60 = v21;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Successfully cleaned up coherence context directory %@", buf, 0xCu);
                    }
                    v26 = v28;
                  }

                }
              }

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
          }
          while (v13);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
    }
    while (v32);
  }

  _Block_object_dispose(&v53, 8);
}

@end
