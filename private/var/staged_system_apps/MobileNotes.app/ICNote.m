@implementation ICNote

- (void)undoablySetFolder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  _QWORD *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  ICCloudSyncingObjectMoveAction *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prepareWithInvocationTarget:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder"));
  objc_msgSend((id)v6, "undoablySetFolder:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  LOBYTE(v6) = objc_msgSend(v8, "ic_isUndoingOrRedoing");

  if ((v6 & 1) == 0)
  {
    v9 = objc_msgSend(v4, "isTrashFolder");
    if ((v9 & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder")),
          (objc_msgSend(v8, "isTrashFolder") & 1) != 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Trash Note"), &stru_1005704B8, 0));

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Move Note"), &stru_1005704B8, 0));

    }
LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    objc_msgSend(v13, "setActionName:", v11);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder"));
  v15 = objc_msgSend(v14, "isTrashFolder");

  if ((v15 & 1) != 0)
  {
    v16 = &ICNoteWillMoveFromRecentlyDeletedFolderNotification;
  }
  else
  {
    if (!objc_msgSend(v4, "isTrashFolder"))
      goto LABEL_14;
    -[ICNote undoablyDeleteUnusedHashtags](self, "undoablyDeleteUnusedHashtags");
    -[ICNote notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder](self, "notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder");
    v16 = &ICNoteWillMoveToRecentlyDeletedFolderNotification;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "postNotificationName:object:", *v16, self);

LABEL_14:
  if (objc_msgSend(v4, "isSmartFolder"))
  {
    v18 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100409E2C(v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "defaultFolder"));

    v4 = (id)v20;
  }
  v21 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_100409D6C(v4, self, v21);

  v22 = -[ICCloudSyncingObjectMoveAction initWithNote:toFolder:isCopy:]([ICCloudSyncingObjectMoveAction alloc], "initWithNote:toFolder:isCopy:", self, v4, 0);
  -[ICNote setFolder:](self, "setFolder:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[ICNote setFolderModificationDate:](self, "setFolderModificationDate:", v23);

  -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set folder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v25 = objc_msgSend(v24, "isUndoing");

  if ((v25 & 1) == 0 && v22)
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v22, self, self);

}

- (void)donateDeleteNoteIntent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICIntentsUtilities interactionForDeleteNote:](ICIntentsUtilities, "interactionForDeleteNote:", self));
  +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v2);

}

+ (id)undoablyDuplicateNotes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "count")
    && (+[ICNote containsUnduplicatableNotes:](ICNote, "containsUnduplicatableNotes:", v3) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Duplicate Notes"), &stru_1005704B8, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "undoablyCopyNotes:toFolder:actionName:", v3, 0, v7));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)undoablyDuplicate
{
  ICCloudSyncingObjectMoveAction *v3;
  void *v4;
  ICCloudSyncingObjectMoveAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[ICNote isDuplicatable](self, "isDuplicatable"))
  {
    v3 = [ICCloudSyncingObjectMoveAction alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder"));
    v5 = -[ICCloudSyncingObjectMoveAction initWithNote:toFolder:isCopy:](v3, "initWithNote:toFolder:isCopy:", self, v4, 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Duplicate Note"), &stru_1005704B8, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "undoablyCopyNote:toFolder:moveAction:actionName:", self, v7, v5, v9));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)undoablyTrashOrDelete
{
  return -[ICNote undoablyTrashOrDeleteWithMoveAction:actionName:](self, "undoablyTrashOrDeleteWithMoveAction:actionName:", 0, 0);
}

- (id)undoablyTrashOrDeleteWithMoveAction:(id)a3 actionName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (-[ICNote isSharedViaICloud](self, "isSharedViaICloud")
    && (-[ICNote isOwnedByCurrentUser](self, "isOwnedByCurrentUser") & 1) == 0)
  {
    if (!-[ICNote isSharedRootObject](self, "isSharedRootObject"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote account](self, "account"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trashFolder"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote undoablyCopyAndDeleteFromFolder:destinationFolder:moveAction:actionName:](self, "undoablyCopyAndDeleteFromFolder:destinationFolder:moveAction:actionName:", v19, v21, v6, v7));

      goto LABEL_14;
    }
    v11 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100409F6C(self, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote account](self, "account"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trashFolder"));
    -[ICNote setFolder:](self, "setFolder:", v13);

    -[ICNote markForDeletion](self, "markForDeletion");
  }
  else if ((-[ICNote isEmpty](self, "isEmpty") & 1) != 0
         || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote folder](self, "folder")),
             v9 = objc_msgSend(v8, "isTrashFolder"),
             v8,
             v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", ICNoteWillBeDeletedNotification, self);

    +[ICNote deleteNote:](ICNote, "deleteNote:", self);
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100409E6C(self, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote account](self, "account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trashFolder"));
    -[ICNote undoablySetFolder:](self, "undoablySetFolder:", v16);

  }
  v17 = 0;
LABEL_14:
  -[ICNote donateDeleteNoteIntent](self, "donateDeleteNoteIntent");

  return v17;
}

- (id)undoablyCopyAndDeleteFromFolder:(id)a3 destinationFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addNewNoteByCopyingNote:toFolder:", self, v11));

  if (v16)
  {
    +[ICInlineAttachment changeLinkDestinationFromNote:toNote:](ICInlineAttachment, "changeLinkDestinationFromNote:toNote:", self, v16);
    objc_msgSend(v16, "unmarkForDeletion");
    -[ICNote markForDeletion](self, "markForDeletion");
    v17 = objc_msgSend(v14, "isUndoing");
    if (v12 && (v17 & 1) == 0)
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:oldObject:newObject:](ICCloudSyncingObject, "undoablyPersistActivityEventsForMoveAction:oldObject:newObject:", v12, self, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "prepareWithInvocationTarget:", v16));
    v19 = objc_msgSend(v18, "undoablyCopyAndDeleteFromFolder:destinationFolder:moveAction:actionName:", v11, v10, v12, v13);

    if (v13)
      objc_msgSend(v14, "setActionName:", v13);
    v20 = v16;
  }

  return v16;
}

- (void)undoablyDeleteUnusedHashtags
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote account](self, "account"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNote inlineAttachments](self, "inlineAttachments", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isHashtagAttachment"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tokenContentIdentifier"));
          if ((unint64_t)+[ICInlineAttachment countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:account:](ICInlineAttachment, "countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:account:", v11, v3) <= 1)+[ICHashtag undoablyMarkForDeletion:standardizedContent:account:](ICHashtag, "undoablyMarkForDeletion:standardizedContent:account:", 1, v11, v3);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

@end
