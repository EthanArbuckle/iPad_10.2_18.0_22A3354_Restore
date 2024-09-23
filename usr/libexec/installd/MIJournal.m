@implementation MIJournal

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027524;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DF88 != -1)
    dispatch_once(&qword_10009DF88, block);
  return (id)qword_10009DF80;
}

- (MIJournal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIJournal;
  return -[MIJournal init](&v3, "init");
}

- (NSSet)journalEntryClasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(MIInstallationJournalEntry), 0);
}

- (NSURL)journalStorageBase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "journalStorageBaseURL"));

  return (NSURL *)v3;
}

- (id)_journalStorageURLForUniqueIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("plist")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalStorageBase](self, "journalStorageBase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0));

  return v6;
}

- (BOOL)writeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  id v22;
  void *v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = objc_msgSend(v6, "shouldPersist");
  if (+[ICLFeatureFlags twoStageAppInstallEnabled](ICLFeatureFlags, "twoStageAppInstallEnabled"))v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 1;
  }
  else
  {
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    {
      v22 = v6;
      MOLogWrite(qword_10009E048, 7, "-[MIJournal writeJournalEntry:withError:]", CFSTR("Writing journal entry: %@"));
    }
    v25 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25, v22));
    v13 = v25;
    v14 = v13;
    if (!v10)
    {
      v11 = 0;
      v9 = v13;
      if (a4)
      {
LABEL_18:
        v9 = objc_retainAutorelease(v9);
        v12 = 0;
        *a4 = v9;
        goto LABEL_21;
      }
LABEL_20:
      v12 = 0;
      goto LABEL_21;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal _journalStorageURLForUniqueIdentifier:](self, "_journalStorageURLForUniqueIdentifier:", v15));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v17 = objc_msgSend(v16, "uid");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v24 = v14;
    v12 = 1;
    v19 = objc_msgSend(v10, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:", v11, 420, v17, objc_msgSend(v18, "gid"), 4, 1, &v24);
    v9 = v24;

    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052280((uint64_t)v6, v11);
      v20 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
        MOLogWrite(v20, 3, "-[MIJournal writeJournalEntry:withError:]", CFSTR("Failed to write journal entry for %@ to %@ : %@"));

      }
      if (a4)
        goto LABEL_18;
      goto LABEL_20;
    }
  }
LABEL_21:

  return v12;
}

- (BOOL)purgeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  if (!+[ICLFeatureFlags twoStageAppInstallEnabled](ICLFeatureFlags, "twoStageAppInstallEnabled"))
  {
    v13 = 0;
    v10 = 0;
LABEL_19:
    v15 = 1;
    goto LABEL_20;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v17 = v6;
    MOLogWrite(qword_10009E048, 5, "-[MIJournal purgeJournalEntry:withError:]", CFSTR("Removing journal entry %@"));
  }
  v21 = 0;
  v7 = objc_msgSend(v6, "cleanUpJournaledDataOnDiskWithError:", &v21, v17);
  v8 = v21;
  if ((v7 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v18 = v8;
      MOLogWrite(qword_10009E048, 3, "-[MIJournal purgeJournalEntry:withError:]", CFSTR("Failed to cleanly purge journaled info for %@"));
    }

    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier", v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal _journalStorageURLForUniqueIdentifier:](self, "_journalStorageURLForUniqueIdentifier:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v20 = v8;
  v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v20);
  v13 = v20;

  if ((v12 & 1) != 0)
    goto LABEL_19;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100052318((uint64_t)v6, v10);
  v14 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    MOLogWrite(v14, 3, "-[MIJournal purgeJournalEntry:withError:]", CFSTR("Failed to remove journal entry for %@ from %@ : %@"));

  }
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v15 = 0;
    *a4 = v13;
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (void)_enumerateJournaledEntriesContinuingOnFailure:(BOOL)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalEntryClasses](self, "journalEntryClasses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalStorageBase](self, "journalStorageBase"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027BC4;
  v13[3] = &unk_100085528;
  v16 = a3;
  v14 = v7;
  v15 = v6;
  v10 = v7;
  v11 = v6;
  v12 = objc_msgSend(v8, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v9, 1, v13);

}

- (void)reconcile
{
  if ((_os_feature_enabled_impl("MobileInstallation", "install_journal") & 1) != 0)
  {
    -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:](self, "_enumerateJournaledEntriesContinuingOnFailure:withBlock:", 1, &stru_100085568);
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    MOLogWrite(qword_10009E048, 5, "-[MIJournal reconcile]", CFSTR("Install journal is not enabled; skipping reconcile"));
  }
}

- (id)journalEntryForUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10002808C;
  v14 = sub_10002809C;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000280A4;
  v7[3] = &unk_100085590;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:](self, "_enumerateJournaledEntriesContinuingOnFailure:withBlock:", 1, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)journaledEntriesWithError:(id *)a3
{
  NSMutableArray *v5;
  id v6;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  NSMutableArray *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10002808C;
  v18 = sub_10002809C;
  v19 = 0;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100028244;
  v11 = &unk_100085590;
  v5 = objc_opt_new(NSMutableArray);
  v12 = v5;
  v13 = &v14;
  -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:](self, "_enumerateJournaledEntriesContinuingOnFailure:withBlock:", 0, &v8);
  if (v15[5])
  {
    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v6 = -[NSMutableArray copy](v5, "copy", v8, v9, v10, v11);
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease((id)v15[5]);
LABEL_7:

  _Block_object_dispose(&v14, 8);
  return v6;
}

@end
