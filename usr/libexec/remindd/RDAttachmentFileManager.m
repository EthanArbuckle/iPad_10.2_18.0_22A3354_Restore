@implementation RDAttachmentFileManager

- (RDAttachmentFileManager)initWithDocumentsURLProvider:(id)a3
{
  id v4;
  RDAttachmentFileManager *v5;
  RDAttachmentFileManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RDAttachmentFileManager;
  v5 = -[RDAttachmentFileManager init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_documentsURLProvider, v4);

  return v6;
}

- (id)URLForDefaultFilesDirectory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager documentsURLForAccountIdentifier:](self, "documentsURLForAccountIdentifier:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Files/")));

  return v3;
}

- (id)URLForAccountFileDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager documentsURLForAccountIdentifier:](self, "documentsURLForAccountIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Files/")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Account-"), "stringByAppendingString:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 1));

  return v10;
}

- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAccountFileDirectory:](self, "URLForAccountFileDirectory:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Attachment-"), "stringByAppendingString:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 1));

  return v10;
}

- (id)URLForHashedAttachmentDirectory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAccountFileDirectory:](self, "URLForAccountFileDirectory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Attachments"), 1));

  return v4;
}

- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentDirectory:](self, "URLForHashedAttachmentDirectory:", a4));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v14, 0));

    v11 = (id)v13;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAttachmentDirectory:accountID:](self, "URLForAttachmentDirectory:accountID:", a3, a4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v11, 0));
  }

  return v15;
}

+ (id)extractSha512Sum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  id v15;
  _BYTE v17[258];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathComponents"));
  v5 = v4;
  if (v4
    && (unint64_t)objc_msgSend(v4, "count") >= 3
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", (char *)objc_msgSend(v5, "count") - 2)),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Attachments")),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByDeletingPathExtension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));

    if (objc_msgSend(v9, "length") == (id)128)
    {
      objc_msgSend(v9, "getCharacters:range:", v17, 0, 128);
      v10 = 0;
      while (1)
      {
        if ((unsigned __int16)(*(_WORD *)&v17[v10] - 48) >= 0xAu)
        {
          v11 = *(unsigned __int16 *)&v17[v10] - 65;
          v12 = v11 > 0x25;
          v13 = (1 << v11) & 0x3F0000003FLL;
          if (v12 || v13 == 0)
            break;
        }
        v10 += 2;
        if (v10 == 256)
        {
          v15 = v9;
          goto LABEL_16;
        }
      }
    }
    v15 = 0;
LABEL_16:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  BOOL v27;
  unsigned int v28;
  char *v29;
  NSObject *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  NSString *v34;
  void *v35;
  void *v36;
  id *v37;
  unsigned __int8 v38;
  objc_class *v40;
  NSString *v41;
  NSString *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char *aSelectora;
  _BOOL4 v52;
  void *v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;

  v52 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v53 = v14;
  if (v16)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentDirectory:](self, "URLForHashedAttachmentDirectory:", v15));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathExtension"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentFileInAccount:sha512Sum:fileExtension:](self, "URLForHashedAttachmentFileInAccount:sha512Sum:fileExtension:", v15, v16, v21));
    v18 = (id)v21;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAttachmentDirectory:accountID:](self, "URLForAttachmentDirectory:accountID:", v14, v15));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v18, 0));
  }

  v55 = 0;
  v23 = objc_msgSend(v19, "rem_createDirectoryIfNecessaryAtURL:error:", v20, &v55);
  v24 = v55;
  if ((v23 & 1) == 0)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class(self, v26);
      v41 = NSStringFromClass(v40);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v42 = NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v49, v48));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedDescription"));
      *(_DWORD *)buf = 138544130;
      v57 = v46;
      v58 = 2114;
      v59 = v53;
      v60 = 2114;
      v61 = v15;
      v62 = 2112;
      v63 = v43;
      v44 = (void *)v43;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);

    }
  }
  if ((objc_msgSend(v22, "isEqual:", v17) & 1) == 0)
  {
    v54 = 0;
    v28 = objc_msgSend(v22, "checkResourceIsReachableAndReturnError:", &v54);
    v29 = (char *)v54;
    if (v28)
    {
      if (v16)
      {
        v27 = 1;
LABEL_20:

        goto LABEL_21;
      }
      v37 = a9;
      if (!objc_msgSend(v19, "removeItemAtURL:error:", v22, a9))
      {
        v27 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v30 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v32 = (objc_class *)objc_opt_class(self, v31);
        v33 = NSStringFromClass(v32);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v34 = NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v34);
        aSelectora = v29;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v47, v45));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(aSelectora, "localizedDescription"));
        *(_DWORD *)buf = 138544130;
        v57 = v35;
        v58 = 2114;
        v59 = v53;
        v60 = 2114;
        v61 = v15;
        v62 = 2112;
        v63 = (uint64_t)v36;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] checkResourceIsReachableAndReturnError returned false {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);

        v29 = aSelectora;
      }

      v37 = a9;
    }
    objc_msgSend(v17, "startAccessingSecurityScopedResource");
    if (v52)
      v38 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v17, v22, v37);
    else
      v38 = objc_msgSend(v19, "moveItemAtURL:toURL:error:", v17, v22, v37);
    v27 = v38;
    objc_msgSend(v17, "stopAccessingSecurityScopedResource");
    goto LABEL_20;
  }
  v27 = 1;
LABEL_21:

  return v27;
}

- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAccountFileDirectory:](self, "URLForAccountFileDirectory:", v7));
  v29 = 0;
  v10 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v29);
  v11 = v29;
  if (v10)
  {
    v28 = 0;
    v12 = objc_msgSend(v8, "removeItemAtURL:error:", v9, &v28);
    v13 = v28;
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(v13, "code");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
        *(_DWORD *)buf = 138544130;
        v31 = v7;
        v32 = 2048;
        v33 = v26;
        v34 = 2112;
        v35 = v27;
        v36 = 2114;
        v37 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error purging account file directory for {accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x2Au);

      }
      if (!a4)
        goto LABEL_11;
LABEL_10:
      *a4 = objc_retainAutorelease(v13);
      goto LABEL_11;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v7;
      v32 = 2114;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Purged account file directory and its content for {accountID: %{public}@, url: %{public}@}", buf, 0x16u);
    }

    v13 = 0;
    if (a4)
      goto LABEL_10;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class(self, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v20, v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2114;
      v33 = v7;
      v34 = 2112;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] checkResourceIsReachableAndReturnError returned false {accountID: %{public}@, error: %@}", buf, 0x20u);

    }
    v13 = v11;
    v12 = 0;
    if (a4)
      goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];

  v6 = a3;
  v39 = a4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v6, "count")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAttachmentDirectory:accountID:](self, "URLForAttachmentDirectory:accountID:", v11, v39));
        v41 = 0;
        v14 = objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", &v41);
        v15 = v41;
        if (v14)
        {
          v40 = 0;
          v16 = objc_msgSend(v36, "removeItemAtURL:error:", v13, &v40);
          v17 = v40;
          if (v17)
          {
            objc_msgSend(v35, "addObject:", v17);
            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v30 = -[NSObject code](v17, "code");
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v17, "localizedDescription"));
              *(_DWORD *)buf = 138544386;
              v47 = v11;
              v48 = 2114;
              v49 = v39;
              v50 = 2048;
              v51 = v30;
              v52 = 2112;
              v53 = v32;
              v54 = 2114;
              v55 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error purging attachment directory for {attachmentID: %{public}@, accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x34u);

            }
          }
          else
          {
            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v47 = v11;
              v48 = 2114;
              v49 = v39;
              v50 = 2114;
              v51 = v13;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Purged attachment directory and its content for {attachmentID: %{public}@, accountID: %{public}@, url: %{public}@}", buf, 0x20u);
            }
          }

          if (v16)
            objc_msgSend(v34, "addObject:", v11);
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v20 = (objc_class *)objc_opt_class(self, v19);
            v21 = NSStringFromClass(v20);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v22 = NSStringFromSelector(a2);
            v31 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v33, v31));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
            *(_DWORD *)buf = 138544130;
            v47 = v23;
            v48 = 2114;
            v49 = v11;
            v50 = 2114;
            v51 = v39;
            v52 = 2112;
            v53 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] checkResourceIsReachableAndReturnError failed {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);

          }
        }

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v8);
  }

  v25 = objc_msgSend(v35, "count");
  if (a5
    && v25
    && (*a5 = (id)objc_claimAutoreleasedReturnValue(+[REMError errorFromErrors:](REMError, "errorFromErrors:", v35)),
        !objc_msgSend(v34, "count")))
  {
    v26 = 0;
  }
  else
  {
    v26 = v34;
  }

  return v26;
}

- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v22;
  void *v23;
  void *v24;
  id obj;
  void *v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v6 = a3;
  v7 = a4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v6, "count")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentFileInAccount:sha512SumWithFileExtension:](self, "URLForHashedAttachmentFileInAccount:sha512SumWithFileExtension:", v7, v12));
        v29 = 0;
        v15 = objc_msgSend(v28, "removeItemAtURL:error:", v14, &v29);
        v16 = v29;
        if (v16)
        {
          objc_msgSend(v26, "addObject:", v16);
          v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v22 = objc_msgSend(v16, "code");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
            *(_DWORD *)buf = 138544386;
            v35 = v12;
            v36 = 2114;
            v37 = v7;
            v38 = 2048;
            v39 = v22;
            v40 = 2112;
            v41 = v23;
            v42 = 2114;
            v43 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error purging hashed attachment file for {fileName: %{public}@, accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x34u);

          }
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v35 = v12;
            v36 = 2114;
            v37 = v7;
            v38 = 2114;
            v39 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Purged hashed attachment file for {fileName: %{public}@, accountID: %{public}@, url: %{public}@}", buf, 0x20u);
          }
        }

        if (v15)
          objc_msgSend(v24, "addObject:", v12);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v9);
  }

  v18 = objc_msgSend(v26, "count");
  if (a5
    && v18
    && (*a5 = (id)objc_claimAutoreleasedReturnValue(+[REMError errorFromErrors:](REMError, "errorFromErrors:", v26)),
        !objc_msgSend(v24, "count")))
  {
    v19 = 0;
  }
  else
  {
    v19 = v24;
  }

  return v19;
}

- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  objc_class *v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  objc_class *v40;
  NSString *v41;
  void *v42;
  NSString *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id *v50;
  void *v51;
  void *v52;
  RDAttachmentFileManager *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  NSURLResourceKey v80;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v53 = self;
  v55 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForAccountFileDirectory:](self, "URLForAccountFileDirectory:", v6));
  v80 = NSURLIsDirectoryKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
  v70 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v9, 0, &v70));
  v11 = v70;

  if (v10)
  {
    v48 = v11;
    v50 = a4;
    v51 = v8;
    v52 = v7;
    v61 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v49 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v67;
      v62 = v12;
      v63 = v13;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
          v64 = 0;
          v65 = 0;
          v19 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v65, NSURLIsDirectoryKey, &v64);
          v20 = v65;
          v21 = v64;
          if ((v19 & 1) != 0)
          {
            if (objc_msgSend(v20, "BOOLValue"))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
              if (objc_msgSend(v22, "hasPrefix:", CFSTR("Attachment-")))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringFromIndex:", objc_msgSend(CFSTR("Attachment-"), "length")));
                v24 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v23);

                v13 = v63;
                if (v24)
                {
                  v25 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    v33 = (objc_class *)objc_opt_class(v53, v26);
                    v34 = NSStringFromClass(v33);
                    v60 = (void *)objc_claimAutoreleasedReturnValue(v34);
                    v35 = NSStringFromSelector(a2);
                    v58 = (void *)objc_claimAutoreleasedReturnValue(v35);
                    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v60, v58));
                    *(_DWORD *)buf = 138543874;
                    v72 = v36;
                    v73 = 2114;
                    v74 = v24;
                    v75 = 2114;
                    v76 = v55;
                    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}@] Found attachment directory {attachmentID: %{public}@, accountID: %{public}@}", buf, 0x20u);

                    v13 = v63;
                  }

                  objc_msgSend(v61, "addObject:", v24);
                  v12 = v62;
                }
              }

            }
          }
          else
          {
            v27 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v29 = (objc_class *)objc_opt_class(v53, v28);
              v30 = NSStringFromClass(v29);
              v59 = (void *)objc_claimAutoreleasedReturnValue(v30);
              v31 = NSStringFromSelector(a2);
              v57 = (void *)objc_claimAutoreleasedReturnValue(v31);
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v59, v57));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedDescription"));
              *(_DWORD *)buf = 138544130;
              v72 = v56;
              v73 = 2114;
              v74 = v55;
              v75 = 2112;
              v76 = v18;
              v77 = 2112;
              v78 = v32;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Can't get file URL resource with {accountID: %{public}@, fileURL: %@, error: %@}", buf, 0x2Au);

              v12 = v62;
              v13 = v63;

            }
            objc_msgSend(v12, "addObject:", v21);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v15);
    }

    if (v50 && objc_msgSend(v12, "count"))
      *v50 = (id)objc_claimAutoreleasedReturnValue(+[REMError errorFromErrors:](REMError, "errorFromErrors:", v12));

    v8 = v51;
    v7 = v52;
    v11 = v48;
    v10 = v49;
  }
  else
  {
    v37 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class(v53, v38);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v42, v44));
      v46 = v11;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v72 = v45;
      v73 = 2114;
      v74 = v55;
      v75 = 2112;
      v76 = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Can't get files with {accountID: %{public}@, error: %@}", buf, 0x20u);

      v10 = 0;
      v11 = v46;

    }
    v61 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v61;
}

- (id)documentsURLForAccountIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  objc_class *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager documentsURLProvider](self, "documentsURLProvider"));

  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "self.documentsURLProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager documentsURLProvider](self, "documentsURLProvider"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager documentsURLProvider](self, "documentsURLProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "documentsURLForAccountIdentifier:", v5));

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = (objc_class *)objc_opt_class(self, v11);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v15, v17));
      *(_DWORD *)buf = 138543618;
      v20 = v18;
      v21 = 2114;
      v22 = v5;

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths defaultApplicationDocumentsURL](RDPaths, "defaultApplicationDocumentsURL"));
  }

  return v9;
}

- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512Sum:(id)a4 fileExtension:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathExtension:", a5));
  else
    v11 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentDirectory:](self, "URLForHashedAttachmentDirectory:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v12, 0));

  return v14;
}

- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512SumWithFileExtension:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDAttachmentFileManager URLForHashedAttachmentDirectory:](self, "URLForHashedAttachmentDirectory:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0));

  return v8;
}

- (RDAttachmentFileManagerDocumentsURLProvider)documentsURLProvider
{
  return (RDAttachmentFileManagerDocumentsURLProvider *)objc_loadWeakRetained((id *)&self->_documentsURLProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_documentsURLProvider);
}

@end
