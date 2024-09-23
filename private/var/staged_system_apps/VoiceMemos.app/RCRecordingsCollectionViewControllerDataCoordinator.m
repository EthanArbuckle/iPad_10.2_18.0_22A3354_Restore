@implementation RCRecordingsCollectionViewControllerDataCoordinator

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolderType:(int64_t)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  RCRecordingsCollectionViewControllerDataCoordinator *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCBuiltinRecordingsFolder builtInFolderWithType:](RCBuiltinRecordingsFolder, "builtInFolderWithType:", a3));
  v8 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithFolder:delegate:](self, "initWithFolder:delegate:", v7, v6);

  return v8;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolder:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  RCRecordingsCollectionViewControllerDataCoordinator *v8;
  void *v9;
  uint64_t v10;
  RCSavedRecordingsController *savedRecordingsController;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RCRecordingsCollectionViewControllerDataCoordinator;
  v8 = -[RCRecordingsCollectionViewControllerDataCoordinator init](&v13, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingsControllerWithFolder:", v6));
    savedRecordingsController = v8->_savedRecordingsController;
    v8->_savedRecordingsController = (RCSavedRecordingsController *)v10;

    -[RCRecordingsCollectionViewControllerDataCoordinator _commonInitWithDelegate:](v8, "_commonInitWithDelegate:", v7);
  }

  return v8;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)recordingDataArray
{
  return -[RCSavedRecordingsController fetchedRecordings](self->_savedRecordingsController, "fetchedRecordings");
}

- (void)_commonInitWithDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[RCSavedRecordingsController setDelegate:](self->_savedRecordingsController, "setDelegate:", self);
}

- (void)setSearchString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *searchString;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  searchString = self->_searchString;
  self->_searchString = v5;

  v7 = objc_msgSend(v4, "length");
  if (v7)
    -[RCRecordingsCollectionViewControllerDataCoordinator _performSearch](self, "_performSearch");
  else
    -[RCSavedRecordingsController setSubPredicate:performingFetch:](self->_savedRecordingsController, "setSubPredicate:performingFetch:", 0, 1);
}

- (void)_performSearch
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (!self->_isPerformingSpotlightSearch)
  {
    v3 = -[NSString copy](self->_searchString, "copy");
    self->_isPerformingSpotlightSearch = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10004C544;
    v5[3] = &unk_1001AC2E8;
    v5[4] = self;
    v6 = v3;
    v4 = v3;
    +[RCTranscriptionSearch recordingURIsForTranscriptionsContaining:completionHandler:](_TtC10VoiceMemos21RCTranscriptionSearch, "recordingURIsForTranscriptionsContaining:completionHandler:", v4, v5);

  }
}

- (void)_handleSpotlightSearchResults:(id)a3 forSearchString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v6 = a3;
  v7 = a4;
  if (-[NSString length](self->_searchString, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCQueryManager customLabelSearchPredicateWithString:](RCQueryManager, "customLabelSearchPredicateWithString:", v7));
    v12[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator _predicateForURIRepresentations:](self, "_predicateForURIRepresentations:", v6));
    v12[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v10));

    -[RCSavedRecordingsController setSubPredicate:performingFetch:](self->_savedRecordingsController, "setSubPredicate:performingFetch:", v11, 1);
    if ((-[NSString isEqual:](self->_searchString, "isEqual:", v7) & 1) == 0)
      -[RCRecordingsCollectionViewControllerDataCoordinator _performSearch](self, "_performSearch");

  }
}

- (id)_predicateForURIRepresentations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));

    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10004C8B8;
    v14 = &unk_1001AC310;
    v15 = v6;
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &v11));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF IN %@"), v8, v11, v12, v13, v14));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  }

  return v9;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithUserFolderNamed:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RCRecordingsCollectionViewControllerDataCoordinator *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "folderWithName:", v7));

  v10 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithFolder:delegate:](self, "initWithFolder:delegate:", v9, v6);
  return v10;
}

- (id)_indexPathOfRecordingWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingWithUniqueID:", v4));

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController indexPathForObject:](self->_savedRecordingsController, "indexPathForObject:", v6));
  else
    v7 = 0;

  return v7;
}

- (unint64_t)indexOfUUID:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator _indexPathOfRecordingWithUUID:](self, "_indexPathOfRecordingWithUUID:", a3));
  v4 = v3;
  if (v3)
    v5 = (unint64_t)objc_msgSend(v3, "item");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)isDownloadingAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator _recordingAtIndexPath:](self, "_recordingAtIndexPath:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "audioFutureNeedsDownload");
  else
    v5 = 0;

  return v5;
}

- (id)uuidAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator _recordingAtIndexPath:](self, "_recordingAtIndexPath:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  else
    v5 = 0;

  return v5;
}

- (id)_recordingAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator recordingDataArray](self, "recordingDataArray"));
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "item");

  if (v6 <= v7)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator recordingDataArray](self, "recordingDataArray"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));

  }
  return v9;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate", a3));
  objc_msgSend(v3, "prepareForChangingContent");

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  switch(a6)
  {
    case 1uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate"));
      v21 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      objc_msgSend(v16, "insertItemsAtIndexPaths:", v17);
      goto LABEL_4;
    case 2uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
      objc_msgSend(v16, "deleteItemAtIndexPath:withUUID:", v14, v17);
LABEL_4:

      break;
    case 3uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:](RCRecordingDisplayModel, "recordingDisplayModelWithSavedRecording:", v13));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate"));
      objc_msgSend(v19, "reloadItemAtIndexPath:usingDisplayModel:", v14, v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate"));
      objc_msgSend(v20, "moveItemAtIndexPath:toIndexPath:", v14, v15);
      goto LABEL_7;
    case 4uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:](RCRecordingDisplayModel, "recordingDisplayModelWithSavedRecording:", v13));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate"));
      objc_msgSend(v20, "reloadItemAtIndexPath:usingDisplayModel:", v14, v18);
LABEL_7:

      break;
    default:
      break;
  }

}

- (void)_changeLogForType:(unint64_t)a3 oldIndexPath:(id)a4 newIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v7 = a4;
  v8 = a5;
  if (a3 - 1 > 3)
    v9 = 0;
  else
    v9 = (uint64_t)*(&off_1001AC330 + a3 - 1);
  v10 = OSLogForCategory(kVMLogCategoryDefault);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "-[RCRecordingsCollectionViewControllerDataCoordinator _changeLogForType:oldIndexPath:newIndexPath:]";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s -- Change type: %@, oldIndexPath: %@, newIndexPath: %@", (uint8_t *)&v12, 0x2Au);
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewControllerDataCoordinator delegate](self, "delegate", a3));
  objc_msgSend(v3, "contentChangesComplete");

}

- (RCRecordingsCollectionViewDataCoordinatorDelegate)delegate
{
  return (RCRecordingsCollectionViewDataCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RCSavedRecordingsController)savedRecordingsController
{
  return self->_savedRecordingsController;
}

- (void)setSavedRecordingsController:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecordingsController, a3);
}

- (BOOL)isPerformingSpotlightSearch
{
  return self->_isPerformingSpotlightSearch;
}

- (void)setIsPerformingSpotlightSearch:(BOOL)a3
{
  self->_isPerformingSpotlightSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedRecordingsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
