@implementation NSFileManager

- (BOOL)im_safeLinkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  id *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  BOOL v34;
  void *v36;
  void *v37;
  NSFileManager *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  id obj;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _QWORD v65[2];

  v7 = a3;
  v40 = a4;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_13C768;
  v61 = sub_13C778;
  v62 = 0;
  v65[0] = NSURLIsDirectoryKey;
  v65[1] = NSURLIsRegularFileKey;
  v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_13C780;
  v56[3] = &unk_2921D0;
  v56[4] = &v57;
  v39 = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 0, v56));
  v36 = v7;
  v37 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByResolvingSymlinksInPath"));

  v12 = v58;
  if (!v58[5])
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v9 = v9;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          obj = 0;
          v51 = 0;
          v17 = (id *)v58;
          objc_msgSend(v16, "getResourceValue:forKey:error:", &v51, NSURLIsDirectoryKey, &obj);
          v18 = v51;
          objc_storeStrong(v17 + 5, obj);
          if (v58[5])
            goto LABEL_13;
          if (objc_msgSend(v18, "BOOLValue"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "im_stringWithPathRelativeTo:", v11));

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "URLByAppendingPathComponent:", v20));
            v22 = (id *)(v58 + 5);
            v49 = (id)v58[5];
            -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v49);
            objc_storeStrong(v22, v49);
            LOBYTE(v22) = v58[5] == 0;

            if ((v22 & 1) == 0)
            {
LABEL_13:

              goto LABEL_14;
            }
          }

        }
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_14:

    v12 = v58;
    if (!v58[5])
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_13C7A8;
      v48[3] = &unk_2921D0;
      v48[4] = &v57;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v39, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v36, v37, 0, v48));

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v9 = v23;
      v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v63, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v45;
        while (2)
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(_QWORD *)v45 != v25)
              objc_enumerationMutation(v9);
            v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
            v42 = 0;
            v43 = 0;
            v28 = (id *)v58;
            objc_msgSend(v27, "getResourceValue:forKey:error:", &v43, NSURLIsRegularFileKey, &v42);
            v29 = v43;
            objc_storeStrong(v28 + 5, v42);
            if (v58[5])
              goto LABEL_26;
            if (objc_msgSend(v29, "BOOLValue"))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "im_stringWithPathRelativeTo:", v11));

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "URLByAppendingPathComponent:", v31));
              v33 = (id *)(v58 + 5);
              v41 = (id)v58[5];
              -[NSFileManager linkItemAtURL:toURL:error:](v39, "linkItemAtURL:toURL:error:", v27, v32, &v41);
              objc_storeStrong(v33, v41);
              LOBYTE(v33) = v58[5] == 0;

              if ((v33 & 1) == 0)
              {
LABEL_26:

                goto LABEL_27;
              }
            }

          }
          v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v63, 16);
          if (v24)
            continue;
          break;
        }
      }
LABEL_27:

      v12 = v58;
    }
  }
  if (a5)
  {
    *a5 = objc_retainAutorelease((id)v12[5]);
    v12 = v58;
  }
  v34 = v12[5] == 0;

  _Block_object_dispose(&v57, 8);
  return v34;
}

- (BOOL)bc_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isFileURL") && objc_msgSend(v5, "isFileURL"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByStandardizingPath"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByResolvingSymlinksInPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByStandardizingPath"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByResolvingSymlinksInPath"));
    v13 = objc_msgSend(v9, "hasPrefix:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)bc_removeFilesWithExtension:(id)a3 fromDirectory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 5, 0));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v26;
    *(_QWORD *)&v11 = 138412546;
    v23 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathExtension", v23));
        v17 = objc_msgSend(v16, "isEqualToString:", v6);

        if (v17)
        {
          v24 = 0;
          v18 = -[NSFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v15, &v24);
          v19 = v24;
          if ((v18 & 1) == 0)
          {
            v20 = BCIMLog();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v30 = v15;
              v31 = 2112;
              v32 = v19;
              _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Error removing file %@: %@", buf, 0x16u);
            }

          }
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v12);
  }

  return 1;
}

@end
