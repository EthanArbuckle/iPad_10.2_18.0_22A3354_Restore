@implementation ICNoteContext

- (void)undoablyDeleteAttachment:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "markedForDeletion") & 1) == 0)
  {
    +[ICBaseAttachment deleteAttachment:](ICBaseAttachment, "deleteAttachment:", v9);
    v4 = objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend((id)v4, "registerUndoWithTarget:selector:object:", self, "undoablyUndeleteAttachment:", v9);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    LOBYTE(v4) = objc_msgSend(v5, "ic_isUndoingOrRedoing");

    if ((v4 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Delete Attachment"), &stru_1000DAF38, 0));
      objc_msgSend(v6, "setActionName:", v8);

    }
  }

}

- (void)undoablyUndeleteAttachment:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[ICBaseAttachment undeleteAttachment:](ICBaseAttachment, "undeleteAttachment:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  objc_msgSend(v4, "registerUndoWithTarget:selector:object:", self, "undoablyDeleteAttachment:", v5);

  objc_msgSend(v5, "ic_postNotificationOnMainThreadWithName:", ICAttachmentPreviewImagesDidUpdateNotification);
}

- (id)undoablyCopyNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Copy Note"), &stru_1000DAF38, 0));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext addNewNoteByCopyingNote:toFolder:](self, "addNewNoteByCopyingNote:toFolder:", v10, v11));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Copied note"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v18 = objc_msgSend(v17, "isUndoing");
    if (v12 && (v18 & 1) == 0)
    {
      v19 = objc_msgSend(v12, "type");

      if (v19 == (id)4)
      {
LABEL_9:
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "prepareWithInvocationTarget:", self));
        objc_msgSend(v24, "undoablyDeleteNote:moveAction:actionName:", v16, v12, v13);

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
        objc_msgSend(v25, "setActionName:", v13);

        v26 = v16;
        goto LABEL_10;
      }
      v21 = objc_opt_class(ICNote, v20);
      v22 = ICDynamicCast(v21, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v12, v17, v16);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (id)undoablyCopyNotes:(id)a3 toFolder:(id)a4 actionName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  ICCloudSyncingObjectMoveAction *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v7 = a3;
  v8 = a4;
  v33 = a5;
  if (!v33)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Copy %lu Notes"), &stru_1000DAF38, 0));
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, objc_msgSend(v7, "count")));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = v7;
  v11 = objc_msgSend(v7, "copy");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = ICCheckedProtocolCast(&OBJC_PROTOCOL___ICNoteUndoSupport, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v18)
        {
          v19 = objc_opt_class(ICNote, v17);
          v20 = ICDynamicCast(v19, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = v21;
          if (v8)
            v23 = v8;
          else
            v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "folder"));
          v24 = v23;
          if (v22)
            v25 = -[ICCloudSyncingObjectMoveAction initWithNote:toFolder:isCopy:]([ICCloudSyncingObjectMoveAction alloc], "initWithNote:toFolder:isCopy:", v22, v23, 1);
          else
            v25 = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext undoablyCopyNote:toFolder:moveAction:actionName:](self, "undoablyCopyNote:toFolder:moveAction:actionName:", v18, v24, v25, v33));
          objc_msgSend(v32, "ic_addNonNilObject:", v26);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  objc_msgSend(v27, "setActionName:", v33);

  v28 = objc_msgSend(v32, "copy");
  return v28;
}

- (id)adjustedDestinationFolderForNoteContainer:(id)a3 sourceFolder:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noteContainerAccount"));
  v7 = objc_opt_class(ICFolder, v6);
  v8 = ICDynamicCast(v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "isSmartFolder") || !v9)
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultFolder"));
  else
    v10 = v9;
  v11 = v10;

  return v11;
}

- (void)undoablyMoveNotes:(id)a3 toNoteContainer:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v29 = a6;
  v28 = a7;
  v31 = v14;
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Move %lu Notes"), &stru_1000DAF38, 0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, objc_msgSend(v12, "count")));

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObject ic_permanentObjectIDsFromObjects:](NSManagedObject, "ic_permanentObjectIDsFromObjects:", v12));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "folder"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext adjustedDestinationFolderForNoteContainer:sourceFolder:](self, "adjustedDestinationFolderForNoteContainer:sourceFolder:", v13, v23));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectID"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v26);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v19);
  }

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10001D948;
  v35[4] = sub_10001D958;
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "managedObjectContext"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001D960;
  v32[3] = &unk_1000D6450;
  v27 = v28;
  v33 = v27;
  v34 = v35;
  -[ICNoteContext undoablyMoveNoteIDs:toFolderIDs:actionName:workerContext:completionHandler:](self, "undoablyMoveNoteIDs:toFolderIDs:actionName:workerContext:completionHandler:", v30, v17, v31, v29, v32);

  _Block_object_dispose(v35, 8);
}

- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolder:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v12, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountObjectID"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountObjectID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectWithID:", v19));

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "account"));
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001DBCC;
    v27[3] = &unk_1000D6478;
    v28 = v20;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_objectsPassingTest:", v27));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001DC30;
    v23[3] = &unk_1000D64A0;
    v23[4] = self;
    v24 = v12;
    v25 = v13;
    v26 = v16;
    -[ICNoteContext undoablyMoveNotes:toNoteContainer:actionName:workerContext:completionHandler:](self, "undoablyMoveNotes:toNoteContainer:actionName:workerContext:completionHandler:", v22, v21, v14, v15, v23);

  }
  else if (v16)
  {
    (*((void (**)(id, id))v16 + 2))(v16, v12);
  }

}

- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolderType:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, id);
  id v9;

  v9 = a3;
  v8 = (void (**)(id, id))a5;
  if (objc_msgSend(a4, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeSystemPaper))
  {
    -[ICNoteContext undoablyMarkNotes:asSystemPaper:](self, "undoablyMarkNotes:asSystemPaper:", v9, 1);
    if (v8)
      v8[2](v8, v9);
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteContext(UndoSupport) undoablyMoveNotes:toVirtualSmartFolderType:completionHandler:]", 1, 0, CFSTR("Cannot move notes into Virtual Smart Folder"));
    if (v8)
      v8[2](v8, &__NSArray0__struct);
  }

}

- (void)undoablyDeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "markedForDeletion") & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10009EC7C(v8);

    if (!v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      v13 = objc_msgSend(v12, "ic_isUndoingOrRedoing");

      if ((v13 & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Delete Note"), &stru_1000DAF38, 0));

      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "postNotificationName:object:", ICNoteWillBeDeletedNotification, v8);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));
    v17 = objc_msgSend(v16, "copy");

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v17);
          -[ICNoteContext undoablyDeleteAttachment:](self, "undoablyDeleteAttachment:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21));
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v19);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inlineAttachments", 0));
    v23 = objc_msgSend(v22, "copy");

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          -[ICNoteContext undoablyDeleteAttachment:](self, "undoablyDeleteAttachment:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v27));
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v25);
    }

    objc_msgSend(v8, "markForDeletion");
    if (objc_msgSend(v8, "requiresLegacyTombstoneAfterDeletion"))
      +[ICLegacyTombstone addLegacyTombstoneForNote:](ICLegacyTombstone, "addLegacyTombstoneForNote:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v29 = objc_msgSend(v28, "isUndoing");

    if (v9 && (v29 & 1) == 0)
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v9, v8, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "prepareWithInvocationTarget:", self));
    objc_msgSend(v31, "undoablyUndeleteNote:moveAction:actionName:", v8, v9, v10);

    if (v10)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      objc_msgSend(v32, "setActionName:", v10);

    }
  }

}

- (void)sendNotificationBeforeDeletingOrUndeletingNotes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNoteContextWillUndoablyDeleteOrUndeleteNotes"), v3);

}

- (void)sendNotificationAfterDeletingOrUndeletingNotes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICNoteContextDidUndoablyDeleteOrUndeleteNotes"), 0);

}

- (void)undoablyUndeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v11 = objc_msgSend(v10, "ic_isUndoingOrRedoing");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (v9)
      goto LABEL_6;
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "actionName", "-[ICNoteContext(UndoSupport) undoablyUndeleteNote:moveAction:actionName:]", 1, 0, CFSTR("actionName cannot be nil"));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete Note"), &stru_1000DAF38, 0));
  }

  v9 = (id)v12;
LABEL_6:
  objc_msgSend(v19, "unmarkForDeletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "legacyContentHashAtImport"));

  if (v13)
    +[ICLegacyTombstone removeLegacyTombstoneForNote:](ICLegacyTombstone, "removeLegacyTombstoneForNote:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v15 = objc_msgSend(v14, "isUndoing");

  if (v8 && (v15 & 1) == 0)
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v8, 0, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "prepareWithInvocationTarget:", self));
  objc_msgSend(v17, "undoablyDeleteNote:moveAction:actionName:", v19, v8, v9);

  if (v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend(v18, "setActionName:", v9);

  }
}

- (void)undoablyTrashOrDeleteNotes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  if (+[ICNote containsUndeletableNotes:](ICNote, "containsUndeletableNotes:", v4))
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10009ECF4();
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prepareWithInvocationTarget:", self));
    objc_msgSend(v7, "sendNotificationAfterDeletingOrUndeletingNotes");

    -[ICNoteContext sendNotificationBeforeDeletingOrUndeletingNotes:](self, "sendNotificationBeforeDeletingOrUndeletingNotes:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "folder"));
    LODWORD(v6) = objc_msgSend(v9, "isTrashFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    if ((_DWORD)v6)
      v12 = CFSTR("Delete %lu Notes");
    else
      v12 = CFSTR("Trash %lu Notes");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1000DAF38, 0));
    v5 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, objc_msgSend(v4, "count")));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "folder"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sharedRootObject"));
          -[ICNoteContext undoablyPersistDeleteEventForObject:fromParentObject:sharedRootObject:](self, "undoablyPersistDeleteEventForObject:fromParentObject:sharedRootObject:", v19, v20, v21);

          v22 = objc_msgSend(v19, "undoablyTrashOrDeleteWithMoveAction:actionName:", 0, v5);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    -[ICNoteContext sendNotificationAfterDeletingOrUndeletingNotes](self, "sendNotificationAfterDeletingOrUndeletingNotes");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "prepareWithInvocationTarget:", self));
    objc_msgSend(v24, "sendNotificationBeforeDeletingOrUndeletingNotes:", v14);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend(v25, "setActionName:", v5);

  }
}

- (void)undoablyMarkNotes:(id)a3 asSystemPaper:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICNoteContext *v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E6CC;
  v11[3] = &unk_1000D64C8;
  v14 = v4;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "prepareWithInvocationTarget:", self));
  objc_msgSend(v9, "undoablyMarkNotes:asSystemPaper:", v10, !v4);

}

- (void)undoablyMarkNotes:(id)a3 asMathNotes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICNoteContext *v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E8AC;
  v11[3] = &unk_1000D64C8;
  v14 = v4;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "prepareWithInvocationTarget:", self));
  objc_msgSend(v9, "undoablyMarkNotes:asMathNotes:", v10, !v4);

}

- (void)undoablyMarkNotes:(id)a3 asCallNotes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICNoteContext *v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001EA8C;
  v11[3] = &unk_1000D64C8;
  v14 = v4;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "prepareWithInvocationTarget:", self));
  objc_msgSend(v9, "undoablyMarkNotes:asCallNotes:", v10, !v4);

}

- (id)undoablyAddFolderToAccount:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  if (v8)
  {
    v9 = v8;
    v10 = a4;
    v11 = a3;
  }
  else
  {
    v12 = a4;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add Folder"), &stru_1000DAF38, 0));

  }
  v15 = +[ICFolder newFolderInAccount:](ICFolder, "newFolderInAccount:", a3);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "prepareWithInvocationTarget:", self));
  objc_msgSend(v17, "undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:", v15, 1, a4, v9);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  objc_msgSend(v18, "setActionName:", v9);

  return v15;
}

- (id)undoablyCopyFolder:(id)a3 toAccount:(id)a4 copyingNotes:(BOOL)a5 moveAction:(id)a6 actionName:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Copy Folder"), &stru_1000DAF38, 0));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext undoablyAddFolderToAccount:moveAction:actionName:](self, "undoablyAddFolderToAccount:moveAction:actionName:", v13, v14, v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "customNoteSortType"));
  objc_msgSend(v17, "setCustomNoteSortType:", v18);

  v20 = objc_opt_class(ICFolder, v19);
  v21 = ICDynamicCast(v20, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "smartFolderQueryJSON"));
  objc_msgSend(v17, "setSmartFolderQueryJSON:", v23);

  if (v9)
    -[ICNoteContext copyFolder:toFolder:](self, "copyFolder:toFolder:", v12, v17);
  objc_msgSend(v17, "updateChangeCountRecursivelyWithReason:", CFSTR("Copied folder"));

  return v17;
}

- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 actionName:(id)a5
{
  -[ICNoteContext undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:](self, "undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:", a3, a4, 0, a5);
}

- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v10, "isDeletable") & 1) != 0)
  {
    if ((objc_msgSend(v10, "markedForDeletion") & 1) == 0)
    {
      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Delete Folder"), &stru_1000DAF38, 0));

      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notes", v11));
      v15 = objc_msgSend(v14, "copy");

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "undoablyTrashOrDeleteWithMoveAction:actionName:", 0, v12));
            if (v8)
            {
              -[ICNoteContext undoablyDeleteNote:moveAction:actionName:](self, "undoablyDeleteNote:moveAction:actionName:", v20, 0, v12);
              if (v21)
                -[ICNoteContext undoablyDeleteNote:moveAction:actionName:](self, "undoablyDeleteNote:moveAction:actionName:", v21, 0, v12);
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v17);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "children"));
      v23 = objc_msgSend(v22, "copy");

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v23);
            -[ICNoteContext undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:](self, "undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), v8, 0, v12);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v25);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));
      if (v28)
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));
      else
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
      v31 = v29;
      v11 = v38;
      objc_msgSend(v29, "undoablyRemoveFromOrder:", v10);

      objc_msgSend(v10, "markForDeletion");
      -[ICNoteContext undoablyDeleteUnusedTagsForSmartFolder:](self, "undoablyDeleteUnusedTagsForSmartFolder:", v10);
      if (objc_msgSend(v10, "importedFromLegacy"))
        +[ICLegacyTombstone addLegacyTombstoneForFolder:](ICLegacyTombstone, "addLegacyTombstoneForFolder:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      v33 = objc_msgSend(v32, "isUndoing");

      if (v38 && (v33 & 1) == 0)
        +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v38, v10, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "prepareWithInvocationTarget:", self));
      objc_msgSend(v35, "undoablyUndeleteFolder:didMarkNotesForDeletion:moveAction:actionName:", v10, v8, v38, v12);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
      objc_msgSend(v36, "setActionName:", v12);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10001F238;
    v39[3] = &unk_1000D5D10;
    v40 = v10;
    objc_msgSend(v37, "performBlock:", v39);

    v30 = v40;
  }
  else
  {
    v30 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10009ED20();
  }

}

- (void)undoablyUndeleteFolder:(id)a3 didMarkNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a4;
  v18 = a3;
  v10 = a5;
  v11 = a6;
  if (!v11)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "actionName", "-[ICNoteContext(UndoSupport) undoablyUndeleteFolder:didMarkNotesForDeletion:moveAction:actionName:]", 1, 0, CFSTR("actionName is nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Delete Folder"), &stru_1000DAF38, 0));

  }
  objc_msgSend(v18, "unmarkForDeletion");
  if (objc_msgSend(v18, "importedFromLegacy"))
    +[ICLegacyTombstone removeLegacyTombstoneForFolder:](ICLegacyTombstone, "removeLegacyTombstoneForFolder:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v14 = objc_msgSend(v13, "isUndoing");

  if (v10 && (v14 & 1) == 0)
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v10, 0, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prepareWithInvocationTarget:", self));
  objc_msgSend(v16, "undoablyDeleteFolder:markNotesForDeletion:moveAction:actionName:", v18, v8, v10, v11);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  objc_msgSend(v17, "setActionName:", v11);

}

- (void)undoablyPersistDeleteEventForObject:(id)a3 fromParentObject:(id)a4 sharedRootObject:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v11 = objc_msgSend(v10, "isUndoing");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistDeleteActivityEventForObject:fromParentObject:", v16, v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend(v13, "registerUndoForCloudSyncingObjectActivityEvent:cloudSyncingObject:", v12, v9);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "prepareWithInvocationTarget:", self));
  objc_msgSend(v15, "undoablyPersistDeleteEventForObject:fromParentObject:sharedRootObject:", v16, v8, v9);

}

- (void)undoablyDeleteUnusedTagsForSmartFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F5C4;
  v8[3] = &unk_1000D5D38;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v4 = v10;
  v7 = v9;
  objc_msgSend(v4, "performBlockAndWait:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prepareWithInvocationTarget:", self));
  objc_msgSend(v6, "undoablyUndeleteUnusedTagsForSmartFolder:", v7);

}

- (void)undoablyUndeleteUnusedTagsForSmartFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F754;
  v8[3] = &unk_1000D5D38;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v4 = v10;
  v7 = v9;
  objc_msgSend(v4, "performBlockAndWait:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prepareWithInvocationTarget:", self));
  objc_msgSend(v6, "undoablyDeleteUnusedTagsForSmartFolder:", v7);

}

- (id)addNewNoteByCopyingNote:(id)a3 toFolder:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;

  v5 = a3;
  v6 = a4;
  v8 = objc_opt_class(ICNote, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0 && (objc_msgSend(v5, "isPasswordProtected") & 1) != 0)
  {
    v9 = v5;
    if (objc_msgSend(v9, "isAuthenticated"))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[ICNote duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:](ICNote, "duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:", v9, v6, 1, 0));
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        sub_10009ED90(v9);

      v10 = 0;
    }

  }
  else
  {
    v10 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v6);
    if ((objc_msgSend(v5, "copyValuesToNote:", v10) & 1) == 0)
      +[ICNote deleteNote:](ICNote, "deleteNote:", v10);
  }
  objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Copied note"));

  return v10;
}

- (void)copyNotes:(id)a3 toFolder:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = ICCheckedProtocolCast(&OBJC_PROTOCOL___ICNoteUndoSupport, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13)
          v14 = -[ICNoteContext addNewNoteByCopyingNote:toFolder:](self, "addNewNoteByCopyingNote:toFolder:", v13, v7);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)copyFolder:(id)a3 toFolder:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "sourceFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, CFSTR("sourceFolder is nil"));
    if (v8)
      goto LABEL_3;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "targetFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, CFSTR("targetFolder is nil"));
LABEL_3:
  if (v6 == v8)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "sourceFolder != targetFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, CFSTR("Should not copy to the same folder %@"), v6);
  }
  else if (v6 && v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleForCopying"));
    objc_msgSend(v8, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notesForCopying"));
    -[ICNoteContext copyNotes:toFolder:](self, "copyNotes:toFolder:", v10, v8);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subfoldersForCopying"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = ICCheckedProtocolCast(&OBJC_PROTOCOL___ICFolderUndoSupport, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            v18 = +[ICFolder newFolderInParentFolder:](ICFolder, "newFolderInParentFolder:", v8);
            -[ICNoteContext copyFolder:toFolder:](self, "copyFolder:toFolder:", v17, v18);

          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v6 = v19;
  }

}

- (void)markNoteAndAttachmentsForDeletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachments", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "markedForDeletion") & 1) == 0)
          +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "markForDeletion");
  if (objc_msgSend(v3, "requiresLegacyTombstoneAfterDeletion"))
    +[ICLegacyTombstone addLegacyTombstoneForNote:](ICLegacyTombstone, "addLegacyTombstoneForNote:", v3);

}

- (void)unmarkNoteAndAttachmentsForDeletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = a3;
  objc_msgSend(v3, "unmarkForDeletion");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachments"));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = ICAttachmentPreviewImagesDidUpdateNotification;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "unmarkForDeletion");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "media"));
        objc_msgSend(v12, "unmarkForDeletion");

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "previewImages"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "unmarkForDeletion");
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v15);
        }

        v18 = objc_msgSend(v11, "ic_postNotificationOnMainThreadAfterSaveWithName:", v9);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "legacyContentHashAtImport"));
  if (v19)
    +[ICLegacyTombstone removeLegacyTombstoneForNote:](ICLegacyTombstone, "removeLegacyTombstoneForNote:", v20);

}

- (void)undoablyProcessNoteIDs:(id)a3 progressStringBlock:(id)a4 workerContext:(id)a5 processNoteBlock:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14)
    v14 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteContext snapshotManagedObjectContext](self, "snapshotManagedObjectContext"));
  v17 = objc_alloc_init((Class)ICLongRunningTaskController);
  objc_msgSend(v17, "setProgressStringBlock:", v13);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10001D948;
  v30[4] = sub_10001D958;
  v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000202A0;
  v25[3] = &unk_1000D6518;
  v18 = v12;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  v29 = v30;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100020624;
  v22[3] = &unk_1000D6540;
  v21 = v16;
  v23 = v21;
  v24 = v30;
  objc_msgSend(v17, "startTask:completionBlock:", v25, v22);

  _Block_object_dispose(v30, 8);
}

- (void)undoablyUnmoveNoteIDs:(id)a3 toFolderIDs:(id)a4 originalToCopyNoteIDs:(id)a5 actionName:(id)a6 noteToFolderIDsForRedo:(id)a7 workerContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  ICNoteContext *v27;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "prepareWithInvocationTarget:", self));
  objc_msgSend(v21, "undoablyMoveNoteIDs:toFolderIDs:actionName:workerContext:completionHandler:", v19, v17, v18, v16, 0);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100020830;
  v24[3] = &unk_1000D65A8;
  v25 = v14;
  v26 = v15;
  v27 = self;
  v22 = v15;
  v23 = v14;
  -[ICNoteContext undoablyProcessNoteIDs:progressStringBlock:workerContext:processNoteBlock:completionHandler:](self, "undoablyProcessNoteIDs:progressStringBlock:workerContext:processNoteBlock:completionHandler:", v19, &stru_1000D6580, v16, v24, 0);

}

- (void)undoablyMoveNoteIDs:(id)a3 toFolderIDs:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  ICNoteContext *v40;
  id v41;

  v12 = a4;
  v27 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  objc_msgSend(v16, "beginUndoGrouping");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v15, "count")));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100020DB4;
  v36[3] = &unk_1000D65F0;
  v37 = v12;
  v38 = v17;
  v39 = v18;
  v40 = self;
  v41 = v19;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000211F0;
  v28[3] = &unk_1000D6618;
  v28[4] = self;
  v29 = v38;
  v30 = v39;
  v31 = v27;
  v32 = v37;
  v33 = v13;
  v34 = v41;
  v35 = v14;
  v20 = v41;
  v21 = v14;
  v22 = v13;
  v23 = v37;
  v24 = v27;
  v25 = v39;
  v26 = v38;
  -[ICNoteContext undoablyProcessNoteIDs:progressStringBlock:workerContext:processNoteBlock:completionHandler:](self, "undoablyProcessNoteIDs:progressStringBlock:workerContext:processNoteBlock:completionHandler:", v15, &stru_1000D65C8, v22, v36, v28);

}

- (void)postNotificationsForUntrashingOrUndeletingNoteIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = ICNoteWillMoveFromRecentlyDeletedFolderNotification;
    v10 = ICNoteWillBeUndeletedNotification;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), v5));
        v13 = objc_msgSend(v12, "markedForDeletion");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v15 = v14;
        if (v13)
          v16 = v10;
        else
          v16 = v9;
        objc_msgSend(v14, "postNotificationName:object:", v16, v12);

        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)postNotificationsForTrashingOrDeletingNoteIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContext managedObjectContext](self, "managedObjectContext"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = ICNoteWillMoveToRecentlyDeletedFolderNotification;
    v10 = ICNoteWillBeDeletedNotification;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11), v5));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folder"));
        v14 = objc_msgSend(v13, "isTrashFolder");

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v16 = v15;
        if (v14)
          v17 = v10;
        else
          v17 = v9;
        objc_msgSend(v15, "postNotificationName:object:", v17, v12);

        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

@end
