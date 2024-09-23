@implementation ICSharingExtensionAttachmentsManager

+ (id)sharedManager
{
  if (qword_100028A10 != -1)
    dispatch_once(&qword_100028A10, &stru_100020958);
  return (id)qword_100028A18;
}

- (ICSharingExtensionAttachmentsManager)init
{
  ICSharingExtensionAttachmentsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSError *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICSharingExtensionAttachmentsManager;
  v2 = -[ICSharingExtensionAttachmentsManager init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICPaths applicationDocumentsURL](ICPaths, "applicationDocumentsURL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SharingExtensionWriteLock"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

    v6 = objc_retainAutorelease(v5);
    -[ICSharingExtensionAttachmentsManager setDbWriteLockfd:](v2, "setDbWriteLockfd:", open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 512, 448));
    if (-[ICSharingExtensionAttachmentsManager dbWriteLockfd](v2, "dbWriteLockfd") == -1)
    {
      v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      NSLog(CFSTR("can't open lock file because %@"), v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAnalyticsObserver sharedObserver](ICAnalyticsObserver, "sharedObserver"));
    -[ICSharingExtensionAttachmentsManager setAnalyticsObserver:](v2, "setAnalyticsObserver:", v9);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[ICSharingExtensionAttachmentsManager dbWriteLockfd](self, "dbWriteLockfd") != -1)
    close(-[ICSharingExtensionAttachmentsManager dbWriteLockfd](self, "dbWriteLockfd"));
  v3.receiver = self;
  v3.super_class = (Class)ICSharingExtensionAttachmentsManager;
  -[ICSharingExtensionAttachmentsManager dealloc](&v3, "dealloc");
}

- (id)titleFromExtensionItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedTitle"));
  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedTitle"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedContentText"));
  v6 = (void *)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  return v7;
}

- (id)attachmentsFromExtensionContext:(id)a3 note:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)ICRWLock);
    -[ICSharingExtensionAttachmentsManager setAppendLock:](self, "setAppendLock:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
  objc_msgSend(v10, "readLock");

  -[ICSharingExtensionAttachmentsManager setContextContainsOnlyRawImages:](self, "setContextContainsOnlyRawImages:", -[ICSharingExtensionAttachmentsManager containsOnlyRawImagesInExtensionContext:](self, "containsOnlyRawImagesInExtensionContext:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager extractAttachmentsFromInputItems:note:](self, "extractAttachmentsFromInputItems:note:", v11, v7));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
  objc_msgSend(v13, "unlock");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
  objc_msgSend(v14, "writeLock");

  -[ICSharingExtensionAttachmentsManager consolidateDuplicateAttachments:](self, "consolidateDuplicateAttachments:", v12);
  -[ICSharingExtensionAttachmentsManager fillOutTitleAndSummaryForAttachments:](self, "fillOutTitleAndSummaryForAttachments:", v12);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009CD0;
  v26[3] = &unk_100020980;
  v26[4] = &v27;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexesOfObjectsPassingTest:", v26));
  v16 = v15;
  if (*((_BYTE *)v28 + 24) && objc_msgSend(v15, "count"))
    objc_msgSend(v12, "removeObjectsAtIndexes:", v16);
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100009D64;
    v21[3] = &unk_100020980;
    v21[4] = &v22;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexesOfObjectsPassingTest:", v21));
    v18 = v17;
    if (*((_BYTE *)v23 + 24) && objc_msgSend(v17, "count"))
      objc_msgSend(v12, "removeObjectsAtIndexes:", v18);

    _Block_object_dispose(&v22, 8);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
  objc_msgSend(v19, "unlock");

  _Block_object_dispose(&v27, 8);
  return v12;
}

- (id)extractAttachmentsFromInputItems:(id)a3 note:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  UTType *v46;
  id obj;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  ICSharingExtensionAttachmentsManager *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  ICSharingExtensionAttachmentsManager *v61;
  _QWORD v62[4];
  id v63;
  ICSharingExtensionAttachmentsManager *v64;
  _QWORD v65[6];
  id v66;
  ICSharingExtensionAttachmentsManager *v67;
  _QWORD v68[4];
  id v69;
  ICSharingExtensionAttachmentsManager *v70;
  _QWORD v71[5];
  id v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];

  v6 = a3;
  v53 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000145B4();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v6;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v80;
    v46 = UTTypeText;
    v51 = UTTypeMapKitMapItem;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v80 != v48)
          objc_enumerationMutation(obj);
        v50 = v9;
        v10 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedContentText", v46));
        v12 = objc_msgSend(v11, "length");

        v52 = v10;
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
          if (objc_msgSend(v13, "count") == (id)1)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v46, "identifier"));
            v17 = objc_msgSend(v15, "hasItemConformingToTypeIdentifier:", v16);

            v10 = v52;
          }
          else
          {
            v17 = 0;
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
          v19 = objc_msgSend(v18, "count");

          if (!v19 || v17 != 0)
          {
            v21 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedContentText"));
            objc_msgSend(v21, "setAttributedContentText:", v22);

            objc_msgSend(v7, "addObject:", v21);
          }
        }
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
        v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v76;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v76 != v25)
                objc_enumerationMutation(v54);
              v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v26);
              if (!-[ICSharingExtensionAttachmentsManager appendMediaItemWithItemProvider:attachments:](self, "appendMediaItemWithItemProvider:attachments:", v27, v7))
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                v29 = objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", v28);

                if (v29)
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                  objc_msgSend(v30, "readLock");

                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                  v71[0] = _NSConcreteStackBlock;
                  v71[1] = 3221225472;
                  v71[2] = sub_10000A548;
                  v71[3] = &unk_1000209D0;
                  v71[4] = self;
                  v72 = v7;
                  v73 = v53;
                  v74 = v10;
                  objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", v31, 0, v71);

                  v32 = v72;
LABEL_25:

                  goto LABEL_31;
                }
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
                v34 = objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", v33);

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                  objc_msgSend(v35, "readLock");

                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
                  v68[0] = _NSConcreteStackBlock;
                  v68[1] = 3221225472;
                  v68[2] = sub_10000A7A0;
                  v68[3] = &unk_1000209F8;
                  v69 = v7;
                  v70 = self;
                  objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", v36, 0, v68);

LABEL_28:
                  v10 = v52;
                  goto LABEL_31;
                }
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
                v38 = objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", v37);

                if (v38)
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                  objc_msgSend(v39, "readLock");

                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
                  v65[0] = _NSConcreteStackBlock;
                  v65[1] = 3221225472;
                  v65[2] = sub_10000A868;
                  v65[3] = &unk_100020A48;
                  v65[4] = v27;
                  v65[5] = v52;
                  v66 = v7;
                  v67 = self;
                  objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", v40, 0, v65);

                  v10 = v52;
                }
                else
                {
                  if (objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.news.notes-metadata")))
                  {
                    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                    objc_msgSend(v41, "readLock");

                    v62[0] = _NSConcreteStackBlock;
                    v62[1] = 3221225472;
                    v62[2] = sub_10000AB28;
                    v62[3] = &unk_100020A70;
                    v63 = v7;
                    v64 = self;
                    objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("com.apple.news.notes-metadata"), 0, v62);

                    goto LABEL_28;
                  }
                  v10 = v52;
                  if (objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.notes.share-metadata")))
                  {
                    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                    objc_msgSend(v42, "readLock");

                    v58[0] = _NSConcreteStackBlock;
                    v58[1] = 3221225472;
                    v58[2] = sub_10000AD38;
                    v58[3] = &unk_100020A20;
                    v59 = v53;
                    v60 = v7;
                    v61 = self;
                    objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("com.apple.notes.share-metadata"), 0, v58);

                    v32 = v59;
                    goto LABEL_25;
                  }
                  if (objc_msgSend(v27, "hasItemConformingToTypeIdentifier:", v51))
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
                    objc_msgSend(v43, "readLock");

                    v55[0] = _NSConcreteStackBlock;
                    v55[1] = 3221225472;
                    v55[2] = sub_10000B12C;
                    v55[3] = &unk_100020A70;
                    v56 = v7;
                    v57 = self;
                    objc_msgSend(v27, "loadItemForTypeIdentifier:options:completionHandler:", v51, 0, v55);
                    v32 = v56;
                    goto LABEL_25;
                  }
                }
              }
LABEL_31:
              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            v44 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
            v24 = v44;
          }
          while (v44);
        }

        v9 = v50 + 1;
      }
      while ((id)(v50 + 1) != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    }
    while (v49);
  }

  return v7;
}

- (void)consolidateDuplicateAttachments:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  ICSharingExtensionAttachmentsManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v5 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  while (v5 < (unint64_t)objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v17[3]));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachment"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachment"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000B3E8;
      v11[3] = &unk_100020AE8;
      v12 = v6;
      v10 = v4;
      v14 = self;
      v15 = &v16;
      v13 = v10;
      objc_msgSend(v9, "performBlockAndWait:", v11);

    }
    v5 = v17[3] + 1;
    v17[3] = v5;
  }
  _Block_object_dispose(&v16, 8);

}

- (void)fillOutTitleAndSummaryForAttachments:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7), "attachment"));
        v9 = v8;
        if (v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10000BD24;
          v11[3] = &unk_100020AC0;
          v12 = v9;
          objc_msgSend(v10, "performBlockAndWait:", v11);

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)getURLWithoutQueryAndFragmentFromURL:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 1);

  objc_msgSend(v4, "setQuery:", 0);
  objc_msgSend(v4, "setFragment:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));

  return v5;
}

- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "count");
  if (v16 <= +[ICNote maxNoteAttachments](ICNote, "maxNoteAttachments"))
  {
    -[ICSharingExtensionAttachmentsManager refreshManagedObjects](self, "refreshManagedObjects");
    v23.receiver = self;
    v23.super_class = (Class)ICSharingExtensionAttachmentsManager;
    v18 = -[ICSharingExtensionAttachmentsManager saveAttachmentsToNewNote:inFolder:isSystemPaper:textBefore:textAfter:](&v23, "saveAttachmentsToNewNote:inFolder:isSystemPaper:textBefore:textAfter:", v12, v13, v9, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("SharingExtensionLastSavedNoteIdentifier"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("SharingExtensionLastSavedNoteTimeStamp"));

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "canAddAttachments:", objc_msgSend(v10, "count")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("SharingExtensionLastSavedNoteIdentifier"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("SharingExtensionLastSavedNoteTimeStamp"));

    v17.receiver = self;
    v17.super_class = (Class)ICSharingExtensionAttachmentsManager;
    -[ICSharingExtensionAttachmentsManager saveAttachments:toNote:textBefore:textAfter:](&v17, "saveAttachments:toNote:textBefore:textAfter:", v10, v11, v12, v13);

  }
}

- (id)lastNoteSavedTo
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SharingExtensionLastSavedNoteIdentifier")));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SharingExtensionLastSavedNoteTimeStamp")));
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v5);
  v9 = v8;

  if (v9 >= 480.0)
    goto LABEL_8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v3, v11));

  objc_msgSend(v12, "setNeedsRefresh:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedObjectContext"));
  v16 = +[ICNote refreshAllOfNoteWithIdentifier:context:](ICNote, "refreshAllOfNoteWithIdentifier:context:", v13, v15);

  if ((objc_msgSend(v12, "isVisible") & 1) == 0)
  {

LABEL_8:
    v12 = 0;
  }

  return v12;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[ICSharingExtensionAttachmentsManager dbWriteLock](self, "dbWriteLock");
  v16.receiver = self;
  v16.super_class = (Class)ICSharingExtensionAttachmentsManager;
  -[ICSharingExtensionAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:](&v16, "saveAttachments:toNote:textBefore:textAfter:fetchFirst:", v15, v14, v13, v12, v7);

  objc_msgSend(v14, "setNeedsInitialFetchFromCloud:", 0);
  -[ICSharingExtensionAttachmentsManager dbWriteUnlock](self, "dbWriteUnlock");
}

- (void)completeExtensionRequest:(BOOL)a3
{
  -[ICSharingExtensionAttachmentsManager completeExtensionRequest:waitUntilDone:](self, "completeExtensionRequest:waitUntilDone:", a3, 1);
}

- (void)completeExtensionRequestInBackground
{
  -[ICSharingExtensionAttachmentsManager completeExtensionRequest:waitUntilDone:](self, "completeExtensionRequest:waitUntilDone:", 0, 0);
}

- (void)completeExtensionRequest:(BOOL)a3 waitUntilDone:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  BOOL v15;
  _QWORD v16[4];
  NSObject *v17;
  BOOL v18;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
    objc_msgSend(v4, "cancelEverythingWithCompletionHandler:", 0);

    if ((ICUseCoreDataCoreSpotlightIntegration(v5) & 1) == 0)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
      objc_msgSend(v12, "cancelIndexingOperationsWithCompletionHandler:", 0);

    }
  }
  else
  {
    v6 = a4;
    v8 = 0;
    if (a4)
      v8 = dispatch_semaphore_create(0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C4FC;
    v16[3] = &unk_100020B10;
    v18 = v6;
    v9 = v8;
    v17 = v9;
    if ((ICUseCoreDataCoreSpotlightIntegration(-[ICSharingExtensionAttachmentsManager syncChangesToCloudWithCompletionHandler:](self, "syncChangesToCloudWithCompletionHandler:", v16)) & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000C510;
      v13[3] = &unk_100020B10;
      v15 = v6;
      v11 = v9;
      v14 = v11;
      objc_msgSend(v10, "finishRemainingOperationsWithCompletionHandler:", v13);

      if (v6)
      {
        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      }

    }
  }
}

- (id)newNoteWithString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultFolderInContext:](ICFolder, "defaultFolderInContext:", v8));
  v10 = -[ICSharingExtensionAttachmentsManager newNoteWithString:inFolder:error:](self, "newNoteWithString:inFolder:error:", v6, v9, a4);

  return v10;
}

- (void)refreshManagedObjects
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  objc_msgSend(v2, "refreshAllObjects");

}

- (id)newNoteWithString:(id)a3 inFolder:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[ICSharingExtensionAttachmentsManager dbWriteLock](self, "dbWriteLock");
  v10 = +[ICNote newNoteWithString:inFolder:error:](ICNote, "newNoteWithString:inFolder:error:", v9, v8, a5);

  -[ICSharingExtensionAttachmentsManager dbWriteUnlock](self, "dbWriteUnlock");
  return v10;
}

- (BOOL)addString:(id)a3 toNote:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
  objc_msgSend(v11, "ic_refreshObject:mergeChanges:", v8, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "setModificationDate:", v12);

  LOBYTE(a5) = -[ICSharingExtensionAttachmentsManager appendString:toNote:error:](self, "appendString:toNote:error:", v9, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timestamp"));
  objc_msgSend(v8, "setLastNotifiedTimestamp:", v13);

  return (char)a5;
}

- (id)mediaUTIs
{
  if (qword_100028A28 != -1)
    dispatch_once(&qword_100028A28, &stru_100020B30);
  return (id)qword_100028A20;
}

- (BOOL)appendMediaItemWithItemProvider:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  ICSharingExtensionItemExtractor *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  BOOL v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id *v21;
  id *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v27;
  id v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[4];
  _QWORD v36[2];
  NSObject *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(ICSharingExtensionItemExtractor);
  v9 = dispatch_group_create();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager mediaUTIs](self, "mediaUTIs"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", v15))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionAttachmentsManager appendLock](self, "appendLock"));
          objc_msgSend(v17, "readLock");

          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10000CC08;
          v38[3] = &unk_100020B58;
          v28 = v7;
          v18 = v7;
          v39 = v18;
          v19 = objc_retainBlock(v38);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v15));
          if (objc_msgSend(v20, "conformsToType:", UTTypePDF))
          {
            dispatch_group_enter(v9);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10000CC14;
            v35[3] = &unk_100020B80;
            v21 = (id *)v36;
            v36[0] = v18;
            v36[1] = self;
            v22 = (id *)&v37;
            v37 = v9;
            -[ICSharingExtensionItemExtractor extractMediaFileURLWithProvider:contentType:completion:](v8, "extractMediaFileURLWithProvider:contentType:completion:", v6, v20, v35);
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFileURL, "identifier"));
            v24 = objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", v23);

            if (v24)
            {
              dispatch_group_enter(v9);
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472;
              v32[2] = sub_10000CC5C;
              v32[3] = &unk_100020BA8;
              v21 = (id *)&v34;
              v34 = v19;
              v32[4] = self;
              v22 = (id *)&v33;
              v33 = v9;
              -[ICSharingExtensionItemExtractor extractURLWithProvider:withCompletion:](v8, "extractURLWithProvider:withCompletion:", v6, v32);
            }
            else
            {
              v27 = -[ICSharingExtensionAttachmentsManager contextContainsOnlyRawImages](self, "contextContainsOnlyRawImages");
              dispatch_group_enter(v9);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeData, "identifier"));
              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_10000CCA4;
              v29[3] = &unk_100020BA8;
              v21 = (id *)&v31;
              v31 = v19;
              v29[4] = self;
              v22 = (id *)&v30;
              v30 = v9;
              -[ICSharingExtensionItemExtractor extractDataWithProvider:forUTI:useTempFile:withCompletion:](v8, "extractDataWithProvider:forUTI:useTempFile:withCompletion:", v6, v25, v27, v29);

            }
          }

          v16 = 1;
          v7 = v28;
          goto LABEL_16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_16:

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  return v16;
}

- (BOOL)containsOnlyRawImageDataInProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "registeredTypeIdentifiers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "registeredTypeIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsOnlyRawImagesInExtensionContext:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "inputItems"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments", 0));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              if (!-[ICSharingExtensionAttachmentsManager containsOnlyRawImageDataInProvider:](self, "containsOnlyRawImageDataInProvider:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j)))
              {
                v7 = 0;
                goto LABEL_16;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v13)
              continue;
            break;
          }
          v7 = 1;
        }
LABEL_16:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)syncChangesToCloudWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v4, "setQualityOfService:", 9);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CFF4;
  v7[3] = &unk_100020BD0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "processAllCloudObjectsWithCompletionHandler:", v7);

}

- (BOOL)appendString:(id)a3 toNote:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  unsigned __int8 v24;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textStorage"));
  v11 = objc_msgSend(v10, "length");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textStorage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
  v14 = objc_msgSend(v13, "hasSuffix:", CFSTR("\n\n"));

  v15 = -2;
  if (!v14)
    v15 = -1;
  v16 = (unint64_t)v11 + v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textStorage"));
  if (v16 >= (unint64_t)objc_msgSend(v17, "length"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", 3));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textStorage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attribute:atIndex:effectiveRange:", ICTTAttributeNameParagraphStyle, v16, 0));

  }
  if (v19 && (objc_msgSend(v19, "preferSingleLine") & 1) == 0)
    v20 = v19;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", 3));
  v21 = v20;
  v22 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v22, "setObject:forKey:", v21, ICTTAttributeNameParagraphStyle);
  v23 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v9, v22);

  -[ICSharingExtensionAttachmentsManager dbWriteLock](self, "dbWriteLock");
  v24 = objc_msgSend(v8, "appendAttributedString:error:", v23, a5);
  -[ICSharingExtensionAttachmentsManager dbWriteUnlock](self, "dbWriteUnlock");

  return v24;
}

- (void)dbWriteLock
{
  NSError *v2;
  id v3;

  if (flock(-[ICSharingExtensionAttachmentsManager dbWriteLockfd](self, "dbWriteLockfd"), 2) == -1)
  {
    v2 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(v2);
    NSLog(CFSTR("can't lock because %@"), v3);

  }
}

- (void)dbWriteUnlock
{
  NSError *v2;
  id v3;

  if (flock(-[ICSharingExtensionAttachmentsManager dbWriteLockfd](self, "dbWriteLockfd"), 8) == -1)
  {
    v2 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(v2);
    NSLog(CFSTR("can't unlock because %@"), v3);

  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (ICRWLock)appendLock
{
  return self->_appendLock;
}

- (void)setAppendLock:(id)a3
{
  objc_storeStrong((id *)&self->_appendLock, a3);
}

- (int)dbWriteLockfd
{
  return self->_dbWriteLockfd;
}

- (void)setDbWriteLockfd:(int)a3
{
  self->_dbWriteLockfd = a3;
}

- (BOOL)contextContainsOnlyRawImages
{
  return self->_contextContainsOnlyRawImages;
}

- (void)setContextContainsOnlyRawImages:(BOOL)a3
{
  self->_contextContainsOnlyRawImages = a3;
}

- (ICAnalyticsObserver)analyticsObserver
{
  return self->_analyticsObserver;
}

- (void)setAnalyticsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsObserver, 0);
  objc_storeStrong((id *)&self->_appendLock, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
