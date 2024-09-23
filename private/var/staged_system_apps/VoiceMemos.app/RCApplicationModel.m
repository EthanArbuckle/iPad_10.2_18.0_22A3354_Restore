@implementation RCApplicationModel

- (id)recordingsControllerWithFolder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel _recordingsControllerWithFolder:](self, "_recordingsControllerWithFolder:", v4));
  objc_msgSend(v5, "setFolder:", v4);

  return v5;
}

+ (RCApplicationModel)sharedApplicationModel
{
  if (qword_1001ED958 != -1)
    dispatch_once(&qword_1001ED958, &stru_1001AD180);
  return (RCApplicationModel *)(id)qword_1001ED950;
}

- (id)_recordingsControllerWithFolder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  switch((unint64_t)objc_msgSend(v4, "folderType"))
  {
    case 0uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingsController](self, "recordingsController"));
      goto LABEL_10;
    case 1uLL:
      v9 = objc_claimAutoreleasedReturnValue(+[RCQueryManager favoritePredicate](RCQueryManager, "favoritePredicate"));
      goto LABEL_8;
    case 2uLL:
      v9 = objc_claimAutoreleasedReturnValue(+[RCQueryManager watchOSPredicate](RCQueryManager, "watchOSPredicate"));
LABEL_8:
      v10 = (void *)v9;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[RCApplicationModel _recordingsControllerWithPredicate:](self, "_recordingsControllerWithPredicate:", v9));
      goto LABEL_11;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel deletedRecordingsController](self, "deletedRecordingsController"));
LABEL_10:
      v10 = v5;
      v11 = objc_msgSend(v5, "copy");
LABEL_11:
      v8 = v11;

      break;
    case 4uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager recordingsInFolderPredicate:](RCQueryManager, "recordingsInFolderPredicate:", v12));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel _recordingsControllerWithPredicate:](self, "_recordingsControllerWithPredicate:", v13));

      break;
    default:
      v6 = OSLogForCategory(kVMLogCategoryDefault);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10010D65C(v4, v7);

      v8 = 0;
      break;
  }

  return v8;
}

- (RCApplicationModel)init
{
  void *v3;
  id v4;
  RCApplicationModel *v5;
  void *v6;
  RCSavedRecordingsController *v7;
  void *v8;
  RCSavedRecordingsController *v9;
  RCSavedRecordingsController *recordingsController;
  void *v11;
  RCSavedRecordingsController *v12;
  void *v13;
  RCSavedRecordingsController *v14;
  RCSavedRecordingsController *deletedRecordingsController;
  objc_super v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
  v4 = objc_msgSend(v3, "newContextWithConcurrencyType:", 2);

  v17.receiver = self;
  v17.super_class = (Class)RCApplicationModel;
  v5 = -[RCApplicationModel initWithContext:](&v17, "initWithContext:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", 0));
    v7 = [RCSavedRecordingsController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel context](v5, "context"));
    v9 = -[RCSavedRecordingsController initWithFetchRequest:managedObjectContext:](v7, "initWithFetchRequest:managedObjectContext:", v6, v8);
    recordingsController = v5->_recordingsController;
    v5->_recordingsController = v9;

    -[RCSavedRecordingsController setDefaultDelegate:](v5->_recordingsController, "setDefaultDelegate:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager deletedRecordingsFetchRequest](RCQueryManager, "deletedRecordingsFetchRequest"));
    v12 = [RCSavedRecordingsController alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel context](v5, "context"));
    v14 = -[RCSavedRecordingsController initWithFetchRequest:managedObjectContext:](v12, "initWithFetchRequest:managedObjectContext:", v11, v13);
    deletedRecordingsController = v5->_deletedRecordingsController;
    v5->_deletedRecordingsController = v14;

    -[RCSavedRecordingsController setDefaultDelegate:](v5->_deletedRecordingsController, "setDefaultDelegate:", v5);
  }

  return v5;
}

- (RCFolder)voiceMemosRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:](RCBuiltinRecordingsFolder, "builtInFolderWithType:", 0);
}

- (RCSavedRecordingsController)recordingsController
{
  return self->_recordingsController;
}

- (RCFoldersFetchedResultsController)foldersController
{
  RCFoldersFetchedResultsController *foldersController;
  void *v4;
  RCFoldersFetchedResultsController *v5;
  void *v6;
  RCFoldersFetchedResultsController *v7;
  RCFoldersFetchedResultsController *v8;

  foldersController = self->_foldersController;
  if (!foldersController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager userDefinedFoldersFetchRequest](RCQueryManager, "userDefinedFoldersFetchRequest"));
    v5 = [RCFoldersFetchedResultsController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel context](self, "context"));
    v7 = -[RCFoldersFetchedResultsController initWithFetchRequest:managedObjectContext:](v5, "initWithFetchRequest:managedObjectContext:", v4, v6);
    v8 = self->_foldersController;
    self->_foldersController = v7;

    foldersController = self->_foldersController;
  }
  return foldersController;
}

- (id)_recordingsControllerWithPredicate:(id)a3
{
  void *v4;
  RCSavedRecordingsController *v5;
  void *v6;
  RCSavedRecordingsController *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", a3));
  objc_msgSend(v4, "setFetchBatchSize:", 10);
  v5 = [RCSavedRecordingsController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel context](self, "context"));
  v7 = -[RCSavedRecordingsController initWithFetchRequest:managedObjectContext:](v5, "initWithFetchRequest:managedObjectContext:", v4, v6);

  -[RCSavedRecordingsController setDefaultDelegate:](v7, "setDefaultDelegate:", self);
  return v7;
}

- (RCFolder)capturedOnWatchRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:](RCBuiltinRecordingsFolder, "builtInFolderWithType:", 2);
}

- (RCFolder)favoriteRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:](RCBuiltinRecordingsFolder, "builtInFolderWithType:", 1);
}

- (RCFolder)recentlyDeletedRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:](RCBuiltinRecordingsFolder, "builtInFolderWithType:", 3);
}

- (id)playableRecordingsForFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self, "foldersController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playableRecordingsInFolder:", v4));

  return v6;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self, "foldersController"));
  v6 = objc_msgSend(v5, "playableCountForFolder:", v4);

  return (unint64_t)v6;
}

- (void)deleteFolderAndAllPlayableRecordings:(id)a3
{
  -[RCApplicationModel _deleteFolderAndRecordings:shouldPermanentlyErase:](self, "_deleteFolderAndRecordings:shouldPermanentlyErase:", a3, 0);
}

- (void)deleteFolderAndPermanentlyEraseAllPlayableRecordings:(id)a3
{
  -[RCApplicationModel _deleteFolderAndRecordings:shouldPermanentlyErase:](self, "_deleteFolderAndRecordings:shouldPermanentlyErase:", a3, 1);
}

- (void)_deleteFolderAndRecordings:(id)a3 shouldPermanentlyErase:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self, "foldersController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playableRecordingsInFolder:", v6));

  -[RCApplicationModel deleteFolder:](self, "deleteFolder:", v6);
  if (v4)
    -[RCApplicationModel eraseRecordings:](self, "eraseRecordings:", v8);
  else
    -[RCApplicationModel deleteRecordings:](self, "deleteRecordings:", v8);

}

- (id)mostRecentRecording
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingsController](self, "recordingsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedRecordings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (NSArray)recordings
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingsController](self, "recordingsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedRecordings"));

  return (NSArray *)v3;
}

- (NSArray)deletedRecordings
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel deletedRecordingsController](self, "deletedRecordingsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedRecordings"));

  return (NSArray *)v3;
}

- (unint64_t)userFolderCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self, "foldersController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userFolders"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (NSArray)userFolders
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self, "foldersController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userFolders"));

  return (NSArray *)v3;
}

- (id)newChangeTrackingBackgroundModel
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
  v3 = objc_msgSend(v2, "newChangeTrackingBackgroundModel");

  return v3;
}

- (id)compositionLoadedForSavedRecordingUUID:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  RCApplicationModel *v7;
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
  v13 = sub_10008E874;
  v14 = sub_10008E884;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008E88C;
  v6[3] = &unk_1001AC248;
  v7 = self;
  v3 = a3;
  v8 = v3;
  v9 = &v10;
  -[RCApplicationModel performBlockAndWait:](v7, "performBlockAndWait:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)moveFolder:(id)a3 toIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "folderType") != (id)4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCApplicationModel.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("folder.folderType == RCFolderTypeUserDefined"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel userFolders](self, "userFolders"));
  v10 = (char *)objc_msgSend(v8, "row");
  v11 = (char *)objc_msgSend(v9, "indexOfObject:", v7);
  if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = OSLogForCategory(kVMLogCategoryDefault);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10010D6F0((uint64_t)v7, v13, v14);

  }
  else
  {
    v15 = v11;
    if (v11 != v10)
    {
      if (v10 >= objc_msgSend(v9, "count"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCApplicationModel.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newIndex < folders.count"));

      }
      if ((uint64_t)v10 >= (uint64_t)v15)
      {
        if (v15 < v10)
        {
          do
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v15 + 1));
            objc_msgSend(v18, "setRank:", v15);

            ++v15;
          }
          while (v10 != v15);
        }
      }
      else if (v10 < v15)
      {
        v16 = v10;
        do
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v16++));
          objc_msgSend(v17, "setRank:", v16);

        }
        while (v15 != v16);
      }
      objc_msgSend(v7, "setRank:", v10);
      -[RCApplicationModel saveIfNecessary](self, "saveIfNecessary");
    }
  }

}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  objc_super v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v17 = objc_msgSend(v16, "rc_useLocationBasedNaming");

    if (v17)
    {
      v19 = objc_msgSend((id)objc_opt_class(self, v18), "currentLocationBasedName");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v14 = v20;
      if (v20)
      {
        v21 = v20;
      }
      else
      {
        v22 = OSLogForCategory(kVMLogCategoryDefault);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          sub_10010D770(v23);

      }
    }
    else
    {
      v14 = 0;
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)RCApplicationModel;
  v24 = -[RCApplicationModel insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:](&v27, "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", v12, v13, v14, v15, a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  return v25;
}

+ (id)currentLocationBasedName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  _QWORD v18[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCLocationsOfInterestManager defaultManager](RCLocationsOfInterestManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentLocation"));
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10008EDE8;
  v16 = &unk_1001AD1A8;
  v17 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", CFSTR("location"), 1, &v13));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0, v13, v14, v15, v16));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationsOfInterest"));
  v18[0] = v5;
  v18[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = v10;
  if (v10)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferredName"));

  if (!v11)
LABEL_5:
    v7 = 0;

  return v7;
}

- (RCSavedRecordingsController)deletedRecordingsController
{
  return self->_deletedRecordingsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordingsController, 0);
  objc_storeStrong((id *)&self->_recordingsController, 0);
  objc_storeStrong((id *)&self->_foldersController, 0);
}

@end
