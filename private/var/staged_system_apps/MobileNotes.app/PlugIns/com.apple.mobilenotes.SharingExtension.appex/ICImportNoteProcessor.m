@implementation ICImportNoteProcessor

- (ICImportNoteProcessor)init
{
  ICImportNoteProcessor *v2;
  ICImportNoteProcessor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICImportNoteProcessor;
  v2 = -[ICImportNoteProcessor init](&v5, "init");
  v3 = v2;
  if (v2)
    -[ICImportNoteProcessor setupFileParsers](v2, "setupFileParsers");
  return v3;
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  ICNAEventReporter *v4;
  ICNAEventReporter *eventReporter;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:", kICNASubtrackerNameImportNoteProcessor);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v4;

  }
  return self->_eventReporter;
}

- (NSArray)errorFileURLs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor currentErrorFileURLs](self, "currentErrorFileURLs"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allowedContentTypes
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor importNoteFileParsers](self, "importNoteFileParsers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FFD4;
  v8[3] = &unk_1000D5F58;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = objc_msgSend(v5, "copy");
  return (NSArray *)v6;
}

- (void)processURLs:(id)a3 shouldPreserveFolders:(BOOL)a4 account:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD block[4];
  id v38;
  ICImportNoteProcessor *v39;
  uint8_t *v40;
  id v41;
  BOOL v42;
  id location;
  _QWORD v44[4];
  id v45;
  ICImportNoteProcessor *v46;
  uint8_t *v47;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v8 = a3;
  v9 = a5;
  if (-[ICImportNoteProcessor state](self, "state"))
  {
    v10 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot start import process because it is currently in progress.", buf, 2u);
    }
LABEL_11:

    goto LABEL_16;
  }
  if (!v9)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "inAccount", "-[ICImportNoteProcessor processURLs:shouldPreserveFolders:account:]", 1, 0, CFSTR("Account must not be nil"));
    v10 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10009E580(v10, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_11;
  }
  -[ICImportNoteProcessor setTotalNoteImported:](self, "setTotalNoteImported:", 0);
  -[ICImportNoteProcessor setTotalNoteFound:](self, "setTotalNoteFound:", 0);
  -[ICImportNoteProcessor setCurrentURL:](self, "setCurrentURL:", 0);
  -[ICImportNoteProcessor setShouldCancelImportProcess:](self, "setShouldCancelImportProcess:", 0);
  v11 = objc_alloc_init((Class)NSMutableArray);
  -[ICImportNoteProcessor setCurrentErrorFileURLs:](self, "setCurrentErrorFileURLs:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workerManagedObjectContext"));
  -[ICImportNoteProcessor setManagedObjectContext:](self, "setManagedObjectContext:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor managedObjectContext](self, "managedObjectContext"));
  objc_msgSend(v14, "setIc_debugName:", CFSTR("importNoteProcessor"));

  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = sub_1000103BC;
  v52 = sub_1000103CC;
  v53 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor managedObjectContext](self, "managedObjectContext"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000103D4;
  v44[3] = &unk_1000D5F80;
  v47 = buf;
  v45 = v9;
  v46 = self;
  objc_msgSend(v15, "performBlockAndWait:", v44);

  if (*((_QWORD *)v49 + 5))
  {
    -[ICImportNoteProcessor setState:](self, "setState:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor delegate](self, "delegate"));
    v17 = objc_opt_respondsToSelector(v16, "importStartedForNoteProcessor:");

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor delegate](self, "delegate"));
      objc_msgSend(v18, "importStartedForNoteProcessor:", self);

    }
    objc_initWeak(&location, self);
    global_queue = dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010458;
    block[3] = &unk_1000D5FD0;
    objc_copyWeak(&v41, &location);
    v21 = v8;
    v42 = a4;
    v38 = v21;
    v39 = self;
    v40 = buf;
    dispatch_async(v20, block);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v29 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10009E5B0(v29, v30, v31, v32, v33, v34, v35, v36);

  }
  _Block_object_dispose(buf, 8);

LABEL_16:
}

- (void)cancelProcess
{
  os_log_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[ICImportNoteProcessor state](self, "state"))
  {
    -[ICImportNoteProcessor setShouldCancelImportProcess:](self, "setShouldCancelImportProcess:", 1);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (os_log_t)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor importNoteFileParsers](self, "importNoteFileParsers", 0));
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "cancelParsing");
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_10009E65C(v3);
  }

}

- (void)setupFileParsers
{
  ICEvernoteFileParser *v3;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v4;
  ICImportNoteGeneralFileParser *v5;
  void *v6;
  ICEvernoteFileParser *v7;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v8;
  ICImportNoteGeneralFileParser *v9;

  v3 = objc_alloc_init(ICEvernoteFileParser);
  v7 = v3;
  v4 = objc_alloc_init(_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser);
  v8 = v4;
  v5 = objc_alloc_init(ICImportNoteGeneralFileParser);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 3));
  -[ICImportNoteProcessor setImportNoteFileParsers:](self, "setImportNoteFileParsers:", v6, v7, v8);

}

- (id)parserForFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000103BC;
  v16 = sub_1000103CC;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor importNoteFileParsers](self, "importNoteFileParsers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010BD0;
  v9[3] = &unk_1000D5FF8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)addURLs:(id)a3 toImportFolder:(id)a4 shouldPreserveFolders:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  NSURLResourceKey v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  ICImportFolder *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  _QWORD v43[3];

  v35 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init((Class)NSMutableArray);
  v34 = v7;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v7);
  v36 = v8;
  if (!-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
  {
    v12 = NSURLIsDirectoryKey;
    *(_QWORD *)&v11 = 138412290;
    v33 = v11;
    while (1)
    {
      if (!objc_msgSend(v10, "count", v33) && !objc_msgSend(v9, "count"))
        goto LABEL_2;
      if (!objc_msgSend(v10, "count"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "url"));
        v43[0] = NSURLNameKey;
        v43[1] = v12;
        v43[2] = NSURLTypeIdentifierKey;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 3));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v15, v16, 4, 0));

        if (v17)
          objc_msgSend(v10, "addObjectsFromArray:", v17);

        v8 = v13;
      }
      if (objc_msgSend(v10, "count")
        && !-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
      {
        break;
      }
LABEL_30:
      if (-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
        goto LABEL_2;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    v40 = 0;
    objc_msgSend(v18, "getResourceValue:forKey:error:", &v40, v12, 0);
    v19 = v40;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor getTypeIdentifierForFileURL:](self, "getTypeIdentifierForFileURL:", v18));
    v39 = 0;
    objc_msgSend(v18, "getResourceValue:forKey:error:", &v39, NSURLIsPackageKey, 0);
    v38 = v39;
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v20));
      v37 = objc_msgSend(v21, "conformsToType:", UTTypeRTFD);

      v22 = v19;
      v23 = v8;
      v24 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", v20));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", CFSTR("com.apple.stickies.appexport")));
      v27 = objc_msgSend(v25, "conformsToType:", v26);

      v9 = v24;
      v8 = v23;
      v19 = v22;
      if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
        goto LABEL_23;
      if ((v27 & 1) != 0)
      {
LABEL_19:
        if ((v37 & 1) == 0)
        {
          v28 = objc_alloc_init(ICImportFolder);
          -[ICImportFolder setUrl:](v28, "setUrl:", v18);
          if (v35)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subFolders"));
            objc_msgSend(v29, "addObject:", v28);

          }
          objc_msgSend(v9, "addObject:", v28);
LABEL_29:

          v12 = NSURLIsDirectoryKey;
          goto LABEL_30;
        }
LABEL_23:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor parserForFileURL:](self, "parserForFileURL:", v18));

        if (v30)
        {
          v31 = v36;
          if (v35)
            v31 = v8;
          v28 = v31;
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportFolder fileURLs](v28, "fileURLs"));
          objc_msgSend(v32, "addObject:", v18);

        }
        else
        {
          v28 = (ICImportFolder *)os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v42 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, &v28->super, OS_LOG_TYPE_DEBUG, "Cannot process file to import to notes: %@", buf, 0xCu);
          }
        }
        goto LABEL_29;
      }
    }
    else
    {
      if ((objc_msgSend(v19, "BOOLValue") & 1) == 0)
        goto LABEL_23;
      v37 = 0;
    }
    if ((objc_msgSend(v38, "BOOLValue") & 1) != 0)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_2:

}

- (id)getTypeIdentifierForFileURL:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;

  v3 = a3;
  v10 = 0;
  v9 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v10, NSURLTypeIdentifierKey, &v9);
  v5 = v10;
  v6 = v9;
  if ((v4 & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10009E4D4(v6, (uint64_t)v3, v7);

  }
  return v5;
}

- (void)traverseImportFolder:(id)a3 forAccount:(id)a4 shouldImportNotes:(BOOL)a5 completionBlock:(id)a6
{
  id v9;
  void (**v10)(_QWORD);
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  os_log_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  dispatch_semaphore_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_semaphore_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  unsigned int v54;
  void (**v55)(_QWORD);
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id obj;
  _BOOL4 v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD v71[4];
  NSObject *v72;
  __int128 *p_buf;
  uint64_t *v74;
  id v75;
  _QWORD v76[7];
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  id location;
  _QWORD v91[4];
  NSObject *v92;
  id v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  char v101[16];
  __int128 buf;
  uint64_t v103;
  char v104;
  char v105[24];
  _BYTE v106[128];

  v61 = a5;
  v9 = a3;
  v59 = a4;
  v10 = (void (**)(_QWORD))a6;
  v56 = v9;
  if (-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
  {
    if (v10)
      v10[2](v10);
    goto LABEL_61;
  }
  v55 = v10;
  -[ICImportNoteProcessor updateImportProgress](self, "updateImportProgress");
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v9, 0);
  v57 = v11;
LABEL_5:
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  objc_msgSend(v57, "removeObjectAtIndex:", 0);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "fileURLs"));
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (!v63)
  {
LABEL_35:

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "subFolders"));
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v100, 16);
    if (!v42)
      goto LABEL_49;
    v43 = *(_QWORD *)v65;
LABEL_37:
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v65 != v43)
        objc_enumerationMutation(v41);
      v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v44);
      if (-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
      {
        if (v55)
          ((void (*)(void))v55[2])();

        goto LABEL_59;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "fileURLs"));
      if (objc_msgSend(v46, "count"))
        break;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "subFolders"));
      v48 = objc_msgSend(v47, "count") == 0;

      if (!v48)
        goto LABEL_44;
LABEL_47:
      if (v42 == (id)++v44)
      {
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v100, 16);
        if (v42)
          goto LABEL_37;
LABEL_49:

        v53 = objc_msgSend(v57, "count");
        v11 = v57;
        if (!v53
          || (v54 = -[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"), v11 = v57, v54))
        {
          if (v55)
          {
            ((void (*)(void))v55[2])();
            goto LABEL_59;
          }
          goto LABEL_60;
        }
        goto LABEL_5;
      }
    }

LABEL_44:
    if (v61)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "url"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "lastPathComponent"));

      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "folder"));
      v52 = -[ICImportNoteProcessor newFolderWithTitle:parentFolder:forAccount:](self, "newFolderWithTitle:parentFolder:forAccount:", v50, v51, v59);

      objc_msgSend(v45, "setFolder:", v52);
    }
    objc_msgSend(v57, "addObject:", v45);
    goto LABEL_47;
  }
  v62 = *(_QWORD *)v97;
LABEL_7:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v97 != v62)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v12);
    v14 = objc_autoreleasePoolPush();
    if (-[ICImportNoteProcessor shouldCancelImportProcess](self, "shouldCancelImportProcess"))
      break;
    -[ICImportNoteProcessor setCurrentURL:](self, "setCurrentURL:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor parserForFileURL:](self, "parserForFileURL:", v13));
    if (v15)
    {
      v16 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICPaths importDocumentsURL](ICPaths, "importDocumentsURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", CFSTR("FilesToImport"), 1));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v95 = 0;
      v21 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v95);
      v22 = v95;

      if ((v21 & 1) == 0)
      {
        v23 = os_log_create("com.apple.notes", "Import");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error creating temporary directory for files to import: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v25 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v24, 0));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v94 = v22;
      objc_msgSend(v26, "copyItemAtURL:toURL:error:", v16, v25, &v94);
      v27 = v94;

      if (v27)
      {
        v28 = os_log_create("com.apple.notes", "Import");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_10009E6E8((uint64_t)v105, (uint64_t)v27);

      }
      if (v61)
      {
        objc_initWeak(&location, self);
        v29 = dispatch_semaphore_create(0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v103 = 0x2020000000;
        v104 = 0;
        v31 = objc_opt_class(ICEvernoteFileParser, v30);
        v104 = objc_opt_isKindOfClass(v15, v31) & 1;
        v86 = 0;
        v87 = &v86;
        v88 = 0x2020000000;
        v89 = 0;
        v82 = 0;
        v83 = &v82;
        v84 = 0x2020000000;
        v85 = 1;
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_100011C30;
        v78[3] = &unk_1000D6098;
        v79 = v58;
        v32 = v59;
        v80 = v32;
        objc_copyWeak(&v81, &location);
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_100011E88;
        v76[3] = &unk_1000D60E8;
        objc_copyWeak(&v77, &location);
        v76[4] = &buf;
        v76[5] = &v86;
        v76[6] = &v82;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_1000120F4;
        v71[3] = &unk_1000D6110;
        objc_copyWeak(&v75, &location);
        v33 = v25;
        v72 = v33;
        p_buf = &buf;
        v74 = &v82;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_10001215C;
        v69[3] = &unk_1000D5D10;
        v34 = v29;
        v70 = v34;
        objc_msgSend(v15, "parseFileURL:newNoteBlock:updatedNoteBlock:errorBlock:completionBlock:", v33, v78, v76, v71, v69);
        dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
        if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor eventReporter](self, "eventReporter"));
          objc_msgSend(v35, "submitEverNoteImportEventWithCount:isSuccessful:intoAccount:", v87[3], *((unsigned __int8 *)v83 + 24), v32);

        }
        objc_destroyWeak(&v75);
        objc_destroyWeak(&v77);
        objc_destroyWeak(&v81);

        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(&v86, 8);
        _Block_object_dispose(&buf, 8);

        objc_destroyWeak(&location);
      }
      else
      {
        v36 = dispatch_semaphore_create(0);
        objc_initWeak((id *)&buf, self);
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_100011BE4;
        v91[3] = &unk_1000D6020;
        objc_copyWeak(&v93, (id *)&buf);
        v37 = v36;
        v92 = v37;
        objc_msgSend(v15, "totalNotesFoundAtFileURL:completionBlock:", v25, v91);
        dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
        -[ICImportNoteProcessor updateImportProgress](self, "updateImportProgress");

        objc_destroyWeak(&v93);
        objc_destroyWeak((id *)&buf);

      }
      if (v25)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v68 = 0;
        objc_msgSend(v38, "removeItemAtURL:error:", v25, &v68);
        v39 = v68;

        if (v39)
        {
          v40 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_10009E698((uint64_t)v101, (uint64_t)v39);

        }
      }
    }
    else
    {
      v25 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "We must have a parser for url: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    objc_autoreleasePoolPop(v14);
    if (v63 == (id)++v12)
    {
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
      if (v63)
        goto LABEL_7;
      goto LABEL_35;
    }
  }
  if (v55)
    ((void (*)(void))v55[2])();
  objc_autoreleasePoolPop(v14);

LABEL_59:
  v11 = v57;
LABEL_60:

  v10 = v55;
LABEL_61:

}

- (id)newFolderWithTitle:(id)a3 parentFolder:(id)a4 forAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000103BC;
  v26 = sub_1000103CC;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor managedObjectContext](self, "managedObjectContext"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000122BC;
  v17[3] = &unk_1000D6138;
  v12 = v9;
  v18 = v12;
  v21 = &v22;
  v13 = v10;
  v19 = v13;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v11, "performBlockAndWait:", v17);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)updateImportProgress
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "progressUpdatedForImportNoteProcessor:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICImportNoteProcessor delegate](self, "delegate"));
    objc_msgSend(v5, "progressUpdatedForImportNoteProcessor:", self);

  }
}

- (ICImportNoteProcessorDelegate)delegate
{
  return (ICImportNoteProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)totalNoteFound
{
  return self->_totalNoteFound;
}

- (void)setTotalNoteFound:(unint64_t)a3
{
  self->_totalNoteFound = a3;
}

- (unint64_t)totalNoteImported
{
  return self->_totalNoteImported;
}

- (void)setTotalNoteImported:(unint64_t)a3
{
  self->_totalNoteImported = a3;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentURL, a3);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (NSArray)importNoteFileParsers
{
  return self->_importNoteFileParsers;
}

- (void)setImportNoteFileParsers:(id)a3
{
  objc_storeStrong((id *)&self->_importNoteFileParsers, a3);
}

- (BOOL)shouldCancelImportProcess
{
  return self->_shouldCancelImportProcess;
}

- (void)setShouldCancelImportProcess:(BOOL)a3
{
  self->_shouldCancelImportProcess = a3;
}

- (NSMutableArray)currentErrorFileURLs
{
  return self->_currentErrorFileURLs;
}

- (void)setCurrentErrorFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->_currentErrorFileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentErrorFileURLs, 0);
  objc_storeStrong((id *)&self->_importNoteFileParsers, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
