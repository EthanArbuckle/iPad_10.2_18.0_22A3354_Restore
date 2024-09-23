@implementation ICFolder

- (void)undoablySetTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prepareWithInvocationTarget:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder title](self, "title"));
  objc_msgSend(v6, "undoablySetTitle:", v7);

  v8 = objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Set Folder Name"), &stru_1000DAF38, 0));
  objc_msgSend((id)v8, "setActionName:", v10);

  -[ICFolder setTitle:](self, "setTitle:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[ICFolder setDateForLastTitleModification:](self, "setDateForLastTitleModification:", v11);

  -[ICFolder updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set folder title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  LOBYTE(v8) = objc_msgSend(v12, "isUndoing");

  if ((v8 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder persistRenameActivityEventForObject:](self, "persistRenameActivityEventForObject:", self));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend(v14, "registerUndoForCloudSyncingObjectActivityEvent:cloudSyncingObject:", v13, self);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder managedObjectContext](self, "managedObjectContext"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A668;
  v16[3] = &unk_1000D5D10;
  v16[4] = self;
  objc_msgSend(v15, "performBlock:", v16);

}

- (void)undoablySetParentFolder:(id)a3
{
  id v4;
  ICCloudSyncingObjectMoveAction *v5;

  v4 = a3;
  v5 = -[ICCloudSyncingObjectMoveAction initWithFolder:toParentObject:isCopy:]([ICCloudSyncingObjectMoveAction alloc], "initWithFolder:toParentObject:isCopy:", self, v4, 0);
  -[ICFolder undoablySetParentFolder:moveAction:](self, "undoablySetParentFolder:moveAction:", v4, v5);

}

- (void)undoablySetParentFolder:(id)a3 moveAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder parent](self, "parent"));

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder parent](self, "parent"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder account](self, "account"));
  v9 = v8;
  objc_msgSend(v8, "undoablyRemoveFromOrder:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v11 = objc_msgSend(v10, "isUndoing");

  if (v19 && (v11 & 1) == 0)
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v19, self, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "prepareWithInvocationTarget:", self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder parent](self, "parent"));
  objc_msgSend(v13, "undoablySetParentFolder:moveAction:", v14, v19);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Move Folder"), &stru_1000DAF38, 0));
  objc_msgSend(v15, "setActionName:", v17);

  -[ICFolder setParent:](self, "setParent:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[ICFolder setParentModificationDate:](self, "setParentModificationDate:", v18);

  -[ICFolder updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set parent folder"));
}

- (void)updateChangeCountRecursivelyWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  ICFolder *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  -[ICFolder updateChangeCountWithReason:](self, "updateChangeCountWithReason:", v4);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder notes](self, "notes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "updateChangeCountWithReason:", v4);
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v16, "updateChangeCountWithReason:", v4);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "media"));
              objc_msgSend(v17, "updateChangeCountWithReason:", v4);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolder children](v23, "children"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), "updateChangeCountRecursivelyWithReason:", v4);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 noteMovedBlock:(id)a6
{
  return objc_msgSend(a1, "undoablyMoveFolder:toNoteContainer:toAccount:moveAction:noteMovedBlock:", a3, a4, a5, 0, a6);
}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 moveAction:(id)a6 noteMovedBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v51;
  NSObject *v52;
  id v53;
  void *v54;
  NSObject *v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  v17 = v12;
  v19 = objc_opt_class(ICFolder, v18);
  v20 = ICDynamicCast(v19, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_msgSend(v21, "canMoveAddOrDeleteContents");
  if (!v14 && !v22)
  {
    v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10009DFD4(v17, v23);
    v24 = v23;
    v25 = v17;
    goto LABEL_45;
  }
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
  v23 = objc_claimAutoreleasedReturnValue(+[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:](ICFolder, "deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:", v26, v17, v21, v14));
  if (v23 && (-[NSObject isEqualToString:](v26, "isEqualToString:", v23) & 1) == 0)
    objc_msgSend(v17, "undoablySetTitle:", v23);
  if (v21)
    v27 = v21;
  else
    v27 = v14;
  v55 = v26;
  if ((+[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:toNoteContainer:](ICMoveDecision, "shouldCopyThenDeleteWhenMovingObject:toNoteContainer:", v17, v27) & 1) != 0)
  {
    v52 = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "undoablyCopyFolder:toAccount:copyingNotes:moveAction:actionName:", v17, v14, 0, v15, 0));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
    objc_msgSend(v25, "setTitle:", v29);

    objc_msgSend(v25, "setParent:", v21);
    if (v15)
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v15, 0, v25);
    v53 = v15;
    v54 = v17;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subfoldersForCopying"));
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v33)
            objc_enumerationMutation(v30);
          v35 = objc_msgSend(a1, "undoablyMoveFolder:toNoteContainer:toAccount:moveAction:noteMovedBlock:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), v25, v14, 0, v16);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v32);
    }

    v17 = v54;
    if ((objc_msgSend(v54, "isSmartFolder") & 1) == 0)
    {
      v51 = v13;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "visibleNotes"));
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(_QWORD *)v59 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
            v42 = objc_msgSend(a1, "undoablyMoveNote:toFolder:moveAction:actionName:", v41, v25, 0, 0);
            if (v16)
              v16[2](v16, v41);
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v38);
      }

      v13 = v51;
      v17 = v54;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v15 = v53;
    objc_msgSend(v43, "undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:", v17, 1, v53, 0);

    v23 = v52;
    if (v21)
      goto LABEL_34;
LABEL_36:
    v44 = v14;
    goto LABEL_37;
  }
  objc_msgSend(v17, "undoablySetParentFolder:moveAction:", v21, v15);
  v25 = v17;
  if (!v21)
    goto LABEL_36;
LABEL_34:
  v44 = v21;
LABEL_37:
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "subFolderIdentifiersOrderedSet"));
  if (!v45)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((orderedIdentifiers) != nil)", "+[ICFolder(UndoSupport) undoablyMoveFolder:toNoteContainer:toAccount:moveAction:noteMovedBlock:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "orderedIdentifiers");
  if (objc_msgSend(v45, "count"))
  {
    v46 = objc_msgSend(v45, "count");
    if (v21)
      v47 = v21;
    else
      v47 = v14;
    objc_msgSend(v47, "undoablySetOrder:ofChild:", v46, v25);
  }

  v24 = v55;
LABEL_45:

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "managedObjectContext"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10000B044;
  v56[3] = &unk_1000D5D10;
  v49 = v25;
  v57 = v49;
  objc_msgSend(v48, "performBlock:", v56);

  return v49;
}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteContainerAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "undoablyMoveFolder:toNoteContainer:toAccount:moveAction:noteMovedBlock:", v7, v6, v8, 0, 0));

  return v9;
}

+ (void)undoablyMoveNotes:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5 noteMovedBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  ICCloudSyncingObjectMoveAction *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Move %lu Notes"), &stru_1000DAF38, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, objc_msgSend(v10, "count")));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v10;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v19);
        v21 = -[ICCloudSyncingObjectMoveAction initWithNote:toFolder:isCopy:]([ICCloudSyncingObjectMoveAction alloc], "initWithNote:toFolder:isCopy:", v20, v11, v7);
        v22 = objc_msgSend(a1, "undoablyMoveNote:toFolder:moveAction:actionName:", v20, v11, v21, v15);
        if (v12)
          v12[2](v12, v20);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

}

+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "isSystemPaper"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v26 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v13, "undoablyMarkNotes:asSystemPaper:", v14, 0);

  }
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folder"));

  if (v15 != v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folder"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "adjustedDestinationFolderForNoteContainer:sourceFolder:", v10, v17));

    v19 = +[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:toNoteContainer:](ICMoveDecision, "shouldCopyThenDeleteWhenMovingObject:toNoteContainer:", v9, v18);
    v20 = objc_msgSend(v11, "isCopy");
    if ((v19 & 1) != 0)
    {
      if ((objc_msgSend(v11, "isCopy") & 1) == 0)
      {
        v21 = os_log_create("com.apple.notes", "Move");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          sub_10009E068(v18, v9, v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folder"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "undoablyCopyAndDeleteFromFolder:destinationFolder:moveAction:actionName:", v22, v18, v11, v12));
        goto LABEL_12;
      }
    }
    else if ((v20 & 1) == 0)
    {
      objc_msgSend(v9, "undoablySetFolder:", v18);
      v24 = v9;
      goto LABEL_14;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "undoablyCopyNote:toFolder:moveAction:actionName:", v9, v18, v11, 0));
LABEL_12:
    v24 = (id)v23;

    goto LABEL_14;
  }
  v24 = v9;
  v18 = v10;
LABEL_14:

  return v24;
}

+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4
{
  return objc_msgSend(a1, "undoablyMoveNote:toFolder:moveAction:actionName:", a3, a4, 0, 0);
}

@end
