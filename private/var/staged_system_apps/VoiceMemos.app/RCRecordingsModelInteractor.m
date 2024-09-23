@implementation RCRecordingsModelInteractor

+ (id)sharedRecordingsModelInteractor
{
  if (qword_1001ED8F0 != -1)
    dispatch_once(&qword_1001ED8F0, &stru_1001AC650);
  return (id)qword_1001ED8E8;
}

- (RCRecordingsModelInteractor)initWithSavedRecordingsModel:(id)a3
{
  id v5;
  RCRecordingsModelInteractor *v6;
  RCRecordingsModelInteractor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingsModelInteractor;
  v6 = -[RCRecordingsModelInteractor init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (id)audioProperties
{
  return -[RCApplicationModel audioProperties](self->_model, "audioProperties");
}

- (void)performBlockAndWait:(id)a3
{
  -[RCApplicationModel performBlockAndWait:](self->_model, "performBlockAndWait:", a3);
}

- (id)recordingForUUID:(id)a3
{
  return -[RCApplicationModel recordingWithUniqueID:](self->_model, "recordingWithUniqueID:", a3);
}

- (id)recordingsForUUIDs:(id)a3
{
  return -[RCApplicationModel recordingsWithUniqueIDs:](self->_model, "recordingsWithUniqueIDs:", a3);
}

- (id)mostRecentRecording
{
  return -[RCApplicationModel mostRecentRecording](self->_model, "mostRecentRecording");
}

- (id)titleForUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  else
    v5 = 0;

  return v5;
}

- (BOOL)isRecentlyDeletedForUUID:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deletionDate"));
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isFavoriteForUUID:(id)a3
{
  id v4;
  void *v5;
  id v7;

  v7 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  LOBYTE(self) = -[RCRecordingsModelInteractor isFavoriteForUUIDs:](self, "isFavoriteForUUIDs:", v5, v7);
  return (char)self;
}

- (BOOL)isFavoriteForUUIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", a3));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "favorite", (_QWORD)v11);
      if (!objc_msgSend(v8, "favorite"))
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEnhancedForUUID:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  v4 = objc_msgSend(v3, "enhanced");

  return v4;
}

- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "manuallyRenamed");
  else
    v5 = 0;

  return v5;
}

- (void)setFavorite:(BOOL)a3 forUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  v8 = -[RCRecordingsModelInteractor setFavorite:forUUIDs:](self, "setFavorite:forUUIDs:", v4, v7, v9);
}

- (id)setFavorite:(BOOL)a3 forUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RCApplicationModel *v9;
  id v10;
  RCApplicationModel *v11;
  id v12;
  RCApplicationModel *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  RCApplicationModel *v22;
  BOOL v23;

  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", v6));

  v9 = self->_model;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100062CCC;
  v19 = &unk_1001AC678;
  v20 = v8;
  v23 = a3;
  v10 = v7;
  v21 = v10;
  v22 = v9;
  v11 = v9;
  v12 = v8;
  -[RCApplicationModel performWithSavingDisabled:](v11, "performWithSavingDisabled:", &v16);
  -[RCApplicationModel saveIfNecessary](v11, "saveIfNecessary", v16, v17, v18, v19);
  v13 = v22;
  v14 = v10;

  return v14;
}

- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a4));
  if (v6)
  {
    v7 = v6;
    -[RCApplicationModel setEnhanced:ofRecording:](self->_model, "setEnhanced:ofRecording:", v4, v6);
    v6 = v7;
  }

}

- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a4));
  if (v6)
    -[RCApplicationModel setTitle:ofRecording:](self->_model, "setTitle:ofRecording:", v7, v6);

}

- (id)duplicateRecordingWithUUID:(id)a3
{
  void *v4;
  RCApplicationModel *model;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  if (v4)
  {
    model = self->_model;
    v13 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel duplicateRecording:error:](model, "duplicateRecording:error:", v4, &v13));
    v7 = v13;
    v8 = v7;
    if (v6)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (!v9)
    {
      v10 = OSLogForCategory(kVMLogCategoryDefault);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10010C29C(v8, v11);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)eraseRecordingsWithUUIDs:(id)a3
{
  -[RCRecordingsModelInteractor _deleteRecordingsWithUUIDs:withImmediateDeletion:](self, "_deleteRecordingsWithUUIDs:withImmediateDeletion:", a3, 1);
}

- (void)deleteRecordingsWithUUIDs:(id)a3
{
  -[RCRecordingsModelInteractor _deleteRecordingsWithUUIDs:withImmediateDeletion:](self, "_deleteRecordingsWithUUIDs:withImmediateDeletion:", a3, 0);
}

- (void)_deleteRecordingsWithUUIDs:(id)a3 withImmediateDeletion:(BOOL)a4
{
  id v6;
  RCApplicationModel *v7;
  RCApplicationModel *v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  RCRecordingsModelInteractor *v14;
  id v15;
  RCApplicationModel *v16;
  BOOL v17;

  v6 = a3;
  v7 = self->_model;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100063048;
  v13 = &unk_1001AC678;
  v14 = self;
  v15 = v6;
  v17 = a4;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  -[RCApplicationModel performWithSavingDisabled:](v8, "performWithSavingDisabled:", &v10);
  -[RCApplicationModel saveIfNecessary](v8, "saveIfNecessary", v10, v11, v12, v13, v14);

}

- (id)restoreRecordingsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  RCApplicationModel *v6;
  id v7;
  RCApplicationModel *v8;
  id v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  RCRecordingsModelInteractor *v16;
  id v17;
  RCApplicationModel *v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = self->_model;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100063238;
  v15 = &unk_1001AB900;
  v16 = self;
  v17 = v4;
  v18 = v6;
  v19 = v5;
  v7 = v5;
  v8 = v6;
  v9 = v4;
  -[RCApplicationModel performWithSavingDisabled:](v8, "performWithSavingDisabled:", &v12);
  -[RCApplicationModel saveIfNecessary](v8, "saveIfNecessary", v12, v13, v14, v15, v16);
  v10 = objc_msgSend(v7, "copy");

  return v10;
}

- (void)eraseAllDeleted
{
  -[RCApplicationModel eraseAllDeleted](self->_model, "eraseAllDeleted");
}

- (BOOL)userFolderExistsWithName:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFolderWithName:](self, "existingUserFolderWithName:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)existingUserFoldersWithName:(id)a3 searchOption:(int)a4
{
  return -[RCApplicationModel existingFoldersWithName:searchOption:](self->_model, "existingFoldersWithName:searchOption:", a3, *(_QWORD *)&a4);
}

- (id)existingUserFolderWithName:(id)a3
{
  return -[RCApplicationModel existingFolderWithName:](self->_model, "existingFolderWithName:", a3);
}

- (id)allFoldersWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFoldersWithName:searchOption:](self, "existingUserFoldersWithName:searchOption:", v4, 2));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006356C;
  v22[3] = &unk_1001AC6A0;
  v9 = v7;
  v23 = v9;
  v24 = 129;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_filter:", v22));

  if (objc_msgSend(v10, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor visibleBuiltInFolders](self, "visibleBuiltInFolders"));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000635EC;
  v19 = &unk_1001AC6A0;
  v20 = v9;
  v21 = 129;
  v12 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_filter:", &v16));

  if (objc_msgSend(v13, "count", v16, v17, v18, v19))
    objc_msgSend(v5, "addObjectsFromArray:", v13);
  v14 = objc_msgSend(v5, "copy");

  return v14;
}

- (id)allUserFolders
{
  return -[RCApplicationModel userFolders](self->_model, "userFolders");
}

- (id)builtInFolderOfType:(int64_t)a3
{
  RCApplicationModel *v4;
  RCApplicationModel *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;

  v4 = self->_model;
  v5 = v4;
  switch(a3)
  {
    case 0:
      v6 = objc_claimAutoreleasedReturnValue(-[RCApplicationModel voiceMemosRecordingsFolder](v4, "voiceMemosRecordingsFolder"));
      goto LABEL_7;
    case 1:
      v6 = objc_claimAutoreleasedReturnValue(-[RCApplicationModel favoriteRecordingsFolder](v4, "favoriteRecordingsFolder"));
      goto LABEL_7;
    case 2:
      v6 = objc_claimAutoreleasedReturnValue(-[RCApplicationModel capturedOnWatchRecordingsFolder](v4, "capturedOnWatchRecordingsFolder"));
      goto LABEL_7;
    case 3:
      v6 = objc_claimAutoreleasedReturnValue(-[RCApplicationModel recentlyDeletedRecordingsFolder](v4, "recentlyDeletedRecordingsFolder"));
LABEL_7:
      v8 = (void *)v6;
      goto LABEL_14;
    case 4:
      v7 = kVMLogCategoryDefault;
      v9 = OSLogForCategory(kVMLogCategoryDefault);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_10010C3CC(v10);

      goto LABEL_11;
    default:
      v7 = kVMLogCategoryDefault;
LABEL_11:
      v11 = OSLogForCategory(v7);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        sub_10010C344(a3, v12);

      v8 = 0;
LABEL_14:

      return v8;
  }
}

- (id)visibleBuiltInFolders
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel foldersController](self->_model, "foldersController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "builtinFolders"));

  return v3;
}

- (id)uuidOfUserFolderForRecordingWithUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:"));
    v4 = v3;
    if (v3)
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userFolderUUID"));
    v5 = v3;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)folderForUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = 0;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor builtInFolderOfType:](self, "builtInFolderOfType:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      v9 = objc_msgSend(v8, "isEqual:", v4);

      if ((v9 & 1) != 0)
        break;
    }

    if (++v5 == 4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel existingFolderWithUUID:](self->_model, "existingFolderWithUUID:", v4));
      break;
    }
  }

  return v7;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  return -[RCApplicationModel playableCountForFolder:](self->_model, "playableCountForFolder:", a3);
}

- (BOOL)createUserFolderWithName:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFolderWithName:](self, "existingUserFolderWithName:", v4));

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel folderWithName:](self->_model, "folderWithName:", v4));

    v6 = v7 != 0;
  }

  return v6;
}

- (void)deleteUserFolderWithName:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFolderWithName:](self, "existingUserFolderWithName:", a3));
  if (v4)
  {
    v5 = v4;
    -[RCRecordingsModelInteractor deleteUserFolder:](self, "deleteUserFolder:", v4);
    v4 = v5;
  }

}

- (void)deleteUserFolder:(id)a3
{
  void *v4;
  unsigned int v5;
  RCApplicationModel *model;
  id v7;

  v7 = a3;
  if (-[RCRecordingsModelInteractor playableCountForFolder:](self, "playableCountForFolder:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "rc_deletionIsImmediate");

    model = self->_model;
    if (v5)
      -[RCApplicationModel deleteFolderAndPermanentlyEraseAllPlayableRecordings:](model, "deleteFolderAndPermanentlyEraseAllPlayableRecordings:", v7);
    else
      -[RCApplicationModel deleteFolderAndAllPlayableRecordings:](model, "deleteFolderAndAllPlayableRecordings:", v7);
  }
  else
  {
    -[RCApplicationModel deleteFolder:](self->_model, "deleteFolder:", v7);
  }

}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
  -[RCApplicationModel moveFolder:toIndexPath:](self->_model, "moveFolder:toIndexPath:", a3, a4);
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  -[RCApplicationModel renameFolder:toName:](self->_model, "renameFolder:toName:", a3, a4);
}

- (void)addRecordingWithUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toBuiltInFolderOfType:](self, "addRecordingsWithUUIDs:toBuiltInFolderOfType:", v7, a4, v8);
}

- (void)addRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", a3));
  v6 = objc_msgSend(v8, "count");
  if ((unint64_t)a4 <= 1 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor builtInFolderOfType:](self, "builtInFolderOfType:", a4));
    if (v7)
      -[RCApplicationModel addRecordings:toFolder:](self->_model, "addRecordings:toFolder:", v8, v7);

  }
}

- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderWithUUID:(id)a4
{
  void *v6;
  RCApplicationModel *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", a3));
  if (objc_msgSend(v6, "count"))
  {
    v7 = self->_model;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel existingFolderWithUUID:](v7, "existingFolderWithUUID:", v9));
    if (v8)
      -[RCApplicationModel addRecordings:toFolder:](v7, "addRecordings:toFolder:", v6, v8);

  }
}

- (void)addRecordingWithUUID:(id)a3 toUserFolderNamed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toUserFolderNamed:](self, "addRecordingsWithUUIDs:toUserFolderNamed:", v8, v6, v9);
}

- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", a3));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFolderWithName:](self, "existingUserFolderWithName:", v8));
    if (v7)
      -[RCApplicationModel addRecordings:toFolder:](self->_model, "addRecordings:toFolder:", v6, v7);

  }
}

- (void)removeRecordingWithUUID:(id)a3 fromUserFolderWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  -[RCRecordingsModelInteractor removeRecordingsWithUUIDs:fromUserFolderWithUUID:](self, "removeRecordingsWithUUIDs:fromUserFolderWithUUID:", v8, v6, v9);
}

- (void)removeRecordingsWithUUIDs:(id)a3 fromUserFolderWithUUID:(id)a4
{
  id v6;
  void *v7;
  RCApplicationModel *v8;
  RCApplicationModel *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  RCApplicationModel *v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self, "recordingsForUUIDs:", a3));
  v8 = self->_model;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100063E9C;
  v12[3] = &unk_1001ABD30;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[RCApplicationModel performWithSavingDisabled:](v9, "performWithSavingDisabled:", v12);
  -[RCApplicationModel saveIfNecessary](v9, "saveIfNecessary");

}

- (void)removeRecordingWithUUID:(id)a3 fromUserFolderName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor existingUserFolderWithName:](self, "existingUserFolderWithName:", v6));

  if (v8 && v7)
    -[RCApplicationModel removeRecording:fromFolder:](self->_model, "removeRecording:fromFolder:", v8, v7);

}

- (id)compositionLoadedForSavedRecordingUUID:(id)a3
{
  return -[RCApplicationModel compositionLoadedForSavedRecordingUUID:](self->_model, "compositionLoadedForSavedRecordingUUID:", a3);
}

- (RCApplicationModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
