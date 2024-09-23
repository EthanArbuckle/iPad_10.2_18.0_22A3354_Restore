@implementation ICImportLegacyAccountOperation

- (ICImportLegacyAccountOperation)initWithLegacyAccount:(id)a3 destinationAccount:(id)a4 renameFolders:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ICImportLegacyAccountOperation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICImportLegacyAccountOperation;
  v10 = -[ICImportLegacyAccountOperation init](&v15, "init");
  if (v10)
  {
    if (objc_msgSend(v8, "isManaged"))
    {
      v11 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100405E44(v11);

      v10 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(v10), "ensurePermanentObjectIDForObject:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
      -[ICImportLegacyAccountOperation setLegacyAccountObjectID:](v10, "setLegacyAccountObjectID:", v12);

      objc_msgSend((id)objc_opt_class(v10), "ensurePermanentObjectIDForObject:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
      -[ICImportLegacyAccountOperation setDestinationAccountObjectID:](v10, "setDestinationAccountObjectID:", v13);

      -[ICImportLegacyAccountOperation setRenameFolders:](v10, "setRenameFolders:", v5);
      -[ICImportLegacyAccountOperation setCopyingPrimaryAccount:](v10, "setCopyingPrimaryAccount:", 1);
    }
  }

  return v10;
}

- (void)cancelIfAccountWasDeleted
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[5];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshotManagedObjectContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006839C;
  v11[3] = &unk_10054FE80;
  v11[4] = self;
  v12 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v11);
  if ((-[ICImportLegacyAccountOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v6 = ICNewLegacyContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation legacyAccountInContext:](self, "legacyAccountInContext:", v7));
    if (!v8)
    {
      v9 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling legacy import operation because the legacy account does not exist", v10, 2u);
      }

      -[ICImportLegacyAccountOperation cancel](self, "cancel");
    }

  }
}

- (id)legacyAccountInContext:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  ICImportLegacyAccountOperation *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  ICImportLegacyAccountOperation *v26;
  __int16 v27;
  void *v28;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100068644;
  v21 = sub_100068654;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006865C;
  v13[3] = &unk_10054FD20;
  v16 = &v17;
  v5 = a3;
  v14 = v5;
  v15 = self;
  objc_msgSend(v5, "performBlockAndWait:", v13);
  v6 = (void *)v18[5];
  if (!v6)
  {
    v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (id)objc_opt_class(self);
      v9 = NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@(%p) %@] no legacy account found", buf, 0x20u);

    }
    v6 = (void *)v18[5];
  }
  v11 = v6;

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)main
{
  NSObject *v3;

  v3 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100405F08(self, v3);

  -[ICImportLegacyAccountOperation cancelIfAccountWasDeleted](self, "cancelIfAccountWasDeleted");
  if ((-[ICImportLegacyAccountOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[ICImportLegacyAccountOperation cancelIfAccountWasDeleted](self, "cancelIfAccountWasDeleted");
    if ((-[ICImportLegacyAccountOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      -[ICImportLegacyAccountOperation importFolders](self, "importFolders");
      -[ICImportLegacyAccountOperation cancelIfAccountWasDeleted](self, "cancelIfAccountWasDeleted");
      if ((-[ICImportLegacyAccountOperation isCancelled](self, "isCancelled") & 1) == 0)
        -[ICImportLegacyAccountOperation importNotes](self, "importNotes");
    }
  }
}

- (id)legacyNoteObjectIDsToImport
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100068644;
  v23 = sub_100068654;
  v24 = 0;
  v3 = ICNewLegacyContext(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation legacyAccountInContext:](self, "legacyAccountInContext:", v4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006897C;
  v15[3] = &unk_10054FD20;
  v18 = &v19;
  v6 = v4;
  v16 = v6;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v15);
  if (-[ICImportLegacyAccountOperation randomizeImportOrder](self, "randomizeImportOrder"))
  {
    v8 = objc_msgSend((id)v20[5], "mutableCopy");
    v9 = (char *)objc_msgSend(v8, "count");
    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v10, v10 + arc4random_uniform((uint32_t)v9));
        ++v10;
        --v9;
      }
      while (v9);
    }
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v20[5];
    v20[5] = (uint64_t)v11;

  }
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)importNotes
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v3 = ICNewLegacyContext(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryICloudACAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  v8 = objc_msgSend((id)objc_opt_class(self), "noteMigrationBatchSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation legacyNoteObjectIDsToImport](self, "legacyNoteObjectIDsToImport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_arrayByGroupingIntoArraysWithMaxCount:", v8));
  v11 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v27 = objc_msgSend(v9, "count");
    v28 = 2048;
    v29 = objc_msgSend(v10, "count");
    v30 = 2048;
    v31 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "About to import %lu notes in %lu batches of %lu notes each", buf, 0x20u);
  }
  v21 = v9;

  if (objc_msgSend(v10, "count"))
  {
    v13 = 0;
    *(_QWORD *)&v12 = 134218496;
    v20 = v12;
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v13, v20));
      v15 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v18 = objc_msgSend(v14, "count");
        v19 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = v20;
        v27 = v18;
        v28 = 2048;
        v29 = (id)(v13 + 1);
        v30 = 2048;
        v31 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Importing %lu notes (batch %lu of %lu)", buf, 0x20u);
      }

      -[ICImportLegacyAccountOperation cancelIfAccountWasDeleted](self, "cancelIfAccountWasDeleted");
      if ((-[ICImportLegacyAccountOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100068CF8;
      v22[3] = &unk_100550098;
      v22[4] = self;
      v23 = v14;
      v24 = v4;
      v25 = v7;
      v17 = v14;
      objc_msgSend(v16, "pauseCloudSyncWhileSynchronouslyPerformingBlock:", v22);

      if (++v13 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_11;
    }

  }
LABEL_11:

}

+ (unint64_t)noteMigrationBatchSize
{
  void *v2;
  int64_t v3;

  if (qword_1005DDD58 != -1)
    dispatch_once(&qword_1005DDD58, &stru_1005519E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (int64_t)objc_msgSend(v2, "integerForKey:", CFSTR("MigrationBatchSize"));

  if (v3 <= 1)
    return 1;
  else
    return v3;
}

- (id)importLegacyNote:(id)a3 deviceMigrationIdentifier:(id)a4 toFolder:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  unsigned int v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  os_log_t v55;
  void *v56;
  _BOOL4 v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v64;
  void *v65;
  void *v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void *context;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  id v74;
  id v75;
  id obj;
  _QWORD v77[4];
  id v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  _BYTE *v91;
  uint64_t *v92;
  _BYTE *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _QWORD v105[4];
  id v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint8_t v121[128];
  uint8_t v122[32];
  _BYTE v123[24];
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  _BYTE buf[24];
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;

  v8 = a3;
  v69 = a4;
  v75 = a5;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_100068644;
  v119 = sub_100068654;
  v120 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = sub_100068644;
  v113 = sub_100068654;
  v114 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100069F38;
  v105[3] = &unk_100551A10;
  v107 = &v115;
  v74 = v8;
  v106 = v74;
  v108 = &v109;
  objc_msgSend(v9, "performBlockAndWait:", v105);

  v10 = objc_claimAutoreleasedReturnValue(+[ICNote attributedStringFromHTMLString:](ICNote, "attributedStringFromHTMLString:", v116[5]));
  v72 = (void *)v10;
  if (v10)
  {
    v73 = objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation hashFromAttributedString:](self, "hashFromAttributedString:", v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = objc_alloc_init((Class)ICTextController);
    v70 = objc_claimAutoreleasedReturnValue(+[ICLegacyNoteUtilities temporaryTextStorageWithAttributedString:replicaID:styler:](ICLegacyNoteUtilities, "temporaryTextStorageWithAttributedString:replicaID:styler:", v72, v11, v12));

    context = objc_autoreleasePoolPush();
    if (-[ICImportLegacyAccountOperation isLegacyNoteADuplicate:](self, "isLegacyNoteADuplicate:", v74))
    {
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v110[5], v73));
      v14 = (void *)v110[5];
      v110[5] = v13;

      v15 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v110[5];
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Legacy note is a duplicate (%@)", buf, 0xCu);
      }

    }
    v17 = v110[5];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "managedObjectContext"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation existingImportedNoteForLegacyNote:withContentHash:identifier:context:](self, "existingImportedNoteForLegacyNote:withContentHash:identifier:context:", v74, v73, v17, v18));

    v19 = v110[5];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "account"));
    v21 = -[ICImportLegacyAccountOperation importChoiceForLegacyNote:withContentHash:identifier:existingImportedNote:destinationAccount:](self, "importChoiceForLegacyNote:withContentHash:identifier:existingImportedNote:destinationAccount:", v74, v73, v19, v71, v20);

    switch(v21)
    {
      case 0:
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "folder"));
        v31 = v30;
        if (v75 && v30)
        {
          v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "folder"));
          v33 = v32 == v75;

          if (!v33)
          {
            v34 = os_log_create("com.apple.notes", "Migration");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "identifier"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "folder"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
              v67 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "identifier"));
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v64;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v66;
              *(_WORD *)&buf[22] = 2112;
              v128 = v67;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Existing imported note (%@) changed folders from (%@) to (%@)", buf, 0x20u);

            }
            objc_msgSend(v71, "setFolder:", v75);
            objc_msgSend(v71, "updateChangeCountWithReason:", CFSTR("Updated folder for existing HTML note"));
          }
        }
        else
        {

        }
        goto LABEL_29;
      case 1:
        if (v71)
        {
          v25 = v71;
        }
        else
        {
          v25 = +[ICNote newNoteWithoutIdentifierInFolder:](ICNote, "newNoteWithoutIdentifierInFolder:", v75);
          if (!v25)
          {
LABEL_29:
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "managedObjectContext"));
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_10006A020;
            v86[3] = &unk_10054FE80;
            v46 = v74;
            v87 = v46;
            v47 = v44;
            v88 = v47;
            objc_msgSend(v45, "performBlockAndWait:", v86);

            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            obj = v47;
            v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v121, 16);
            if (v48)
            {
              v49 = *(_QWORD *)v83;
              do
              {
                for (i = 0; i != v48; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v83 != v49)
                    objc_enumerationMutation(obj);
                  v51 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x3032000000;
                  v128 = sub_100068644;
                  v129 = sub_100068654;
                  v130 = 0;
                  v99 = 0;
                  v100 = &v99;
                  v101 = 0x3032000000;
                  v102 = sub_100068644;
                  v103 = sub_100068654;
                  v104 = 0;
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "managedObjectContext"));
                  v77[0] = _NSConcreteStackBlock;
                  v77[1] = 3221225472;
                  v77[2] = sub_10006A134;
                  v77[3] = &unk_100551A60;
                  v78 = v46;
                  v79 = v51;
                  v80 = buf;
                  v81 = &v99;
                  objc_msgSend(v52, "performBlockAndWait:", v77);

                  v53 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                  if (v53 && v100[5])
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "managedObjectContext"));
                    v55 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v53, v54));

                    if (v55)
                    {
                      v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject media](v55, "media"));
                      v57 = v56 == 0;

                      if (v57)
                      {
                        v58 = os_log_create("com.apple.notes", "Migration");
                        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                        {
                          v61 = v100[5];
                          v62 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                          *(_DWORD *)v123 = 138412546;
                          *(_QWORD *)&v123[4] = v61;
                          *(_WORD *)&v123[12] = 2112;
                          *(_QWORD *)&v123[14] = v62;
                          _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Importing file (%@) for attachment %@", v123, 0x16u);
                        }

                        v59 = v100[5];
                        v60 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
                        +[ICLegacyAttachmentUtilities importFileAtURL:toAttachment:attachmentPreviewGenerator:](ICLegacyAttachmentUtilities, "importFileAtURL:toAttachment:attachmentPreviewGenerator:", v59, v55, v60);

                      }
                    }
                  }
                  else
                  {
                    v55 = os_log_create("com.apple.notes", "Migration");
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                      sub_100406048((uint8_t *)&v95, (_BYTE *)&v95 + 1, v55);
                  }

                  _Block_object_dispose(&v99, 8);
                  _Block_object_dispose(buf, 8);

                }
                v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v121, 16);
              }
              while (v48);
            }

            v25 = 0;
LABEL_46:

            objc_autoreleasePoolPop(context);
            v29 = v25;
            v26 = v70;
            goto LABEL_47;
          }
        }
        break;
      case 2:
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
        v24 = (void *)v110[5];
        v110[5] = v23;

        v25 = +[ICNote newNoteWithoutIdentifierInFolder:](ICNote, "newNoteWithoutIdentifierInFolder:", v75);
        objc_msgSend(v71, "setLegacyManagedObjectID:", 0);
        if (!v25)
          goto LABEL_29;
        break;
      default:
        goto LABEL_29;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v128 = sub_100068644;
    v129 = sub_100068654;
    v130 = 0;
    v99 = 0;
    v100 = &v99;
    v101 = 0x3032000000;
    v102 = sub_100068644;
    v103 = sub_100068654;
    v104 = 0;
    *(_QWORD *)v123 = 0;
    *(_QWORD *)&v123[8] = v123;
    *(_QWORD *)&v123[16] = 0x3032000000;
    v124 = sub_100068644;
    v125 = sub_100068654;
    v126 = 0;
    v95 = 0;
    v96 = &v95;
    v97 = 0x2020000000;
    v98 = 0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "managedObjectContext"));
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_100069F90;
    v89[3] = &unk_100551A38;
    v91 = buf;
    v36 = v74;
    v90 = v36;
    v92 = &v99;
    v93 = v123;
    v94 = &v95;
    objc_msgSend(v35, "performBlockAndWait:", v89);

    objc_msgSend(v25, "setIdentifier:", v110[5]);
    objc_msgSend(v25, "setCreationDate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    objc_msgSend(v25, "setModificationDate:", v100[5]);
    objc_msgSend(v25, "setTitle:", *(_QWORD *)(*(_QWORD *)&v123[8] + 40));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectID"));
    objc_msgSend(v25, "setLegacyManagedObjectID:", v37);

    if (v21 != 2)
    {
      objc_msgSend(v25, "setLegacyModificationDateAtImport:", v100[5]);
      objc_msgSend(v25, "setLegacyContentHashAtImport:", v73);
      objc_msgSend(v25, "setLegacyImportDeviceIdentifier:", v69);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v96 + 24)));
      objc_msgSend(v25, "setLegacyNoteWasPlainText:", v38);

    }
    v39 = -[NSObject wantsUndoCommands](v70, "wantsUndoCommands");
    -[NSObject setWantsUndoCommands:](v70, "setWantsUndoCommands:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
    +[ICLegacyNoteUtilities importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:](ICLegacyNoteUtilities, "importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:", v36, v70, v25, v40);

    -[NSObject setWantsUndoCommands:](v70, "setWantsUndoCommands:", v39);
    objc_msgSend(v25, "setFolder:", v75);
    v41 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = v110[5];
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "identifier"));
      sub_10040607C(v42, v43, v122, v41);
    }

    objc_msgSend(v25, "updateChangeCountWithReason:", CFSTR("Imported HTML note"));
    _Block_object_dispose(&v95, 8);
    _Block_object_dispose(v123, 8);

    _Block_object_dispose(&v99, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_46;
  }
  v26 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v110[5];
    v28 = objc_msgSend((id)v116[5], "length");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to convert legacy note HTML to attributed string. legacyNote.identifier=%@ content.length=%d", buf, 0x12u);
  }
  v29 = 0;
  v73 = v26;
LABEL_47:

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);

  return v29;
}

- (id)existingImportedNoteForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithLegacyManagedObjectID:context:](ICNote, "noteWithLegacyManagedObjectID:context:", v10, v9));

  if (!v11)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v8, v9));

  return v11;
}

- (int64_t)importChoiceForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 existingImportedNote:(id)a6 destinationAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  int64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned int v43;
  NSObject *v44;
  void *v45;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_100068644;
  v72 = sub_100068654;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_100068644;
  v66 = sub_100068654;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_100068644;
  v60 = sub_100068654;
  v61 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10006AA44;
  v51[3] = &unk_100551A88;
  v53 = &v68;
  v18 = v12;
  v52 = v18;
  v54 = &v62;
  v55 = &v56;
  objc_msgSend(v17, "performBlockAndWait:", v51);

  if (!objc_msgSend((id)v69[5], "length"))
  {
    v19 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_10040613C();
    goto LABEL_14;
  }
  if (!-[ICImportLegacyAccountOperation isCopyingPrimaryAccount](self, "isCopyingPrimaryAccount"))
  {
    v19 = os_log_create("com.apple.notes", "Migration");
    v25 = 2;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    sub_1004063F4();
    goto LABEL_17;
  }
  if (objc_msgSend(v16, "supportsLegacyTombstones"))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:](ICLegacyTombstone, "tombstoneIdentifierForObjectIdentifier:type:", v14, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone legacyTombstoneWithIdentifier:context:](ICLegacyTombstone, "legacyTombstoneWithIdentifier:context:", v19, v20));

    if (!v21 || (objc_msgSend(v21, "markedForDeletion") & 1) != 0)
    {

      goto LABEL_7;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentHashAtImport"));
    if (objc_msgSend(v29, "isEqualToString:", v13))
    {

    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "modificationDateAtImport"));
      v37 = objc_msgSend(v36, "isEqualToDate:", v63[5]);

      if (!v37)
      {
        v38 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          sub_100406394();
        v25 = 1;
        goto LABEL_47;
      }
    }
    v38 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      sub_100406334();
    v25 = 0;
LABEL_47:

    goto LABEL_48;
  }
LABEL_7:
  if (!v15)
  {
    v19 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_10040619C();
    goto LABEL_20;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyContentHashAtImport"));
  v23 = objc_msgSend(v22, "isEqualToString:", v13);

  if (!v23)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyModificationDateAtImport"));
    v27 = objc_msgSend(v26, "isEqualToDate:", v63[5]);

    if (v27)
    {
      v19 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        sub_100406244(v28, (uint64_t)buf, v19);
      }
      goto LABEL_31;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyManagedObjectIDURIRepresentation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URIRepresentation"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));
    if (objc_msgSend(v50, "isEqual:", v32))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v49 = objc_msgSend(v33, "isEqualToString:", v57[5]);

      if ((v49 & 1) == 0)
      {
        v19 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v34 = (void *)v57[5];
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          *(_DWORD *)buf = 138412546;
          v75 = v34;
          v76 = 2112;
          v77 = v35;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We have already duplicated note (%@) to (%@)", buf, 0x16u);

        }
        goto LABEL_31;
      }
    }
    else
    {

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyModificationDateAtImport"));
    v40 = objc_msgSend(v39, "ic_isLaterThanDate:", v63[5]);

    if (v40)
    {
      v19 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_10040628C();
      goto LABEL_14;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modificationDate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyModificationDateAtImport"));
    v43 = objc_msgSend(v41, "isEqualToDate:", v42);

    v44 = os_log_create("com.apple.notes", "Migration");
    v19 = v44;
    if (v43)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        sub_1004062EC(v45, (uint64_t)buf, v19);
      }

LABEL_20:
      v25 = 1;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)v63[5];
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "loggingDescription"));
      *(_DWORD *)buf = 138412802;
      v75 = v13;
      v76 = 2112;
      v77 = v47;
      v78 = 2112;
      v79 = v48;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We have imported this note, the legacy version is newer than the one we imported, and the user has edited the note since import: newContentHash=%@ newModificationDate=%@ %@", buf, 0x20u);

    }
LABEL_17:
    v25 = 2;
    goto LABEL_48;
  }
  v19 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    sub_1004061FC(v24, (uint64_t)buf, v19);
  }
LABEL_31:

LABEL_14:
  v25 = 0;
LABEL_48:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v25;
}

- (void)importFolders
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100068644;
  v17[4] = sub_100068654;
  v18 = 0;
  v3 = ICNewLegacyContext(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation legacyAccountInContext:](self, "legacyAccountInContext:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006AC4C;
  v14[3] = &unk_100550660;
  v16 = v17;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v14);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotManagedObjectContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006ACF4;
  v11[3] = &unk_1005502C0;
  v11[4] = self;
  v10 = v9;
  v12 = v10;
  v13 = v17;
  objc_msgSend(v10, "performBlockAndWait:", v11);

  _Block_object_dispose(v17, 8);
}

- (id)importLegacyFolder:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  ICImportLegacyAccountOperation *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;

  v6 = a3;
  v7 = a4;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10006B43C;
  v62[3] = &unk_100550660;
  v64 = &v65;
  v9 = v6;
  v63 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v62);

  if (*((_BYTE *)v66 + 24) && !-[ICImportLegacyAccountOperation renameFolders](self, "renameFolders"))
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultFolder"));
    goto LABEL_31;
  }
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_100068644;
  v60 = sub_100068654;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_100068644;
  v54 = sub_100068654;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_100068644;
  v48 = sub_100068654;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100068644;
  v42 = sub_100068654;
  v43 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10006B4A8;
  v31[3] = &unk_100551AD0;
  v34 = &v56;
  v35 = &v50;
  v36 = &v38;
  v32 = v9;
  v33 = self;
  v37 = &v44;
  objc_msgSend(v10, "performBlockAndWait:", v31);

  if (objc_msgSend(v7, "accountType") == 3)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Local-%@"), v45[5]));
    v12 = (void *)v45[5];
    v45[5] = v11;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:](ICLegacyTombstone, "tombstoneIdentifierForObjectIdentifier:type:", v45[5], 2));
  if ((unint64_t)objc_msgSend(v13, "length") >= 0x100)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v45[5], "ic_md5"));
    v15 = (void *)v45[5];
    v45[5] = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:](ICLegacyTombstone, "tombstoneIdentifierForObjectIdentifier:type:", v45[5], 2));
    v13 = (void *)v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone legacyTombstoneWithIdentifier:context:](ICLegacyTombstone, "legacyTombstoneWithIdentifier:context:", v13, v17));

  if (v18 && (objc_msgSend(v18, "markedForDeletion") & 1) == 0)
  {
    v22 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_1004065AC();

    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultFolder"));
    if (v21)
      goto LABEL_28;
    goto LABEL_15;
  }
  v19 = v45[5];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder folderWithIdentifier:context:](ICFolder, "folderWithIdentifier:context:", v19, v20));

  if (!v21)
  {
LABEL_15:
    v23 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      sub_10040654C();

    v21 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v45[5], v7);
    objc_msgSend(v21, "setTitle:", v51[5]);
    if (-[ICImportLegacyAccountOperation renameFolders](self, "renameFolders"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v57[5], "ic_md5"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
      v26 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder folderWithIdentifier:context:](ICFolder, "folderWithIdentifier:context:", v24, v25));

      if (!v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v57[5], "ic_md5"));
        v26 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v27, v7);

        objc_msgSend(v26, "setTitle:", v57[5]);
        objc_msgSend(v26, "updateChangeCountWithReason:", CFSTR("Imported HTML parent folder"));
      }
      objc_msgSend(v21, "setParent:", v26);

    }
    if (-[ICImportLegacyAccountOperation isCopyingPrimaryAccount](self, "isCopyingPrimaryAccount"))
      objc_msgSend(v21, "setImportedFromLegacy:", 1);
    if (v39[5])
    {
      v28 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        sub_1004064EC();

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyAccountOperation importLegacyFolder:toAccount:](self, "importLegacyFolder:toAccount:", v39[5], v7));
      objc_msgSend(v21, "setParent:", v29);

    }
    objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Imported HTML folder"));
  }
LABEL_28:
  if (!-[ICImportLegacyAccountOperation isCopyingPrimaryAccount](self, "isCopyingPrimaryAccount"))
    objc_msgSend(v21, "unmarkForDeletion");

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

LABEL_31:
  _Block_object_dispose(&v65, 8);

  return v21;
}

+ (void)ensurePermanentObjectIDForObject:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
  v4 = objc_msgSend(v3, "isTemporaryID");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006B738;
    v7[3] = &unk_100550110;
    v8 = v6;
    objc_msgSend(v5, "performBlockAndWait:", v7);

  }
}

- (id)hashFromAttributedString:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = objc_msgSend(v3, "length");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006B9A0;
  v11[3] = &unk_100551AF8;
  v12 = v3;
  v5 = v3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v4, 0, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_md5"));
  return v9;
}

- (BOOL)isLegacyNoteADuplicate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006BBD8;
  v7[3] = &unk_100550298;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (NSManagedObjectID)legacyAccountObjectID
{
  return self->_legacyAccountObjectID;
}

- (void)setLegacyAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_legacyAccountObjectID, a3);
}

- (BOOL)randomizeImportOrder
{
  return self->_randomizeImportOrder;
}

- (void)setRandomizeImportOrder:(BOOL)a3
{
  self->_randomizeImportOrder = a3;
}

- (BOOL)isCopyingPrimaryAccount
{
  return self->_copyingPrimaryAccount;
}

- (void)setCopyingPrimaryAccount:(BOOL)a3
{
  self->_copyingPrimaryAccount = a3;
}

- (NSManagedObjectID)destinationAccountObjectID
{
  return self->_destinationAccountObjectID;
}

- (void)setDestinationAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAccountObjectID, a3);
}

- (BOOL)renameFolders
{
  return self->_renameFolders;
}

- (void)setRenameFolders:(BOOL)a3
{
  self->_renameFolders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationAccountObjectID, 0);
  objc_storeStrong((id *)&self->_legacyAccountObjectID, 0);
}

@end
