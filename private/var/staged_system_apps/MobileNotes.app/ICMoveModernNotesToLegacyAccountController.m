@implementation ICMoveModernNotesToLegacyAccountController

- (ICMoveModernNotesToLegacyAccountController)init
{
  ICMoveModernNotesToLegacyAccountController *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMoveModernNotesToLegacyAccountController;
  v2 = -[ICMoveModernNotesToLegacyAccountController init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[ICMoveModernNotesToLegacyAccountController setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController operationQueue](v2, "operationQueue"));
    objc_msgSend(v4, "setName:", CFSTR("com.apple.notes.move-modern-notes-to-HTML-account-queue"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController operationQueue](v2, "operationQueue"));
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[ICMoveModernNotesToLegacyAccountController setNotesToDelete:](v2, "setNotesToDelete:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[ICMoveModernNotesToLegacyAccountController setCreatedLegacyNotes:](v2, "setCreatedLegacyNotes:", v7);

  }
  return v2;
}

- (void)addOperationToCopyOrMoveNotes:(id)a3 toFolder:(id)a4 copyOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  unint64_t v14;
  char *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  ICMoveModernNotesToLegacyAccountController *v23;
  void *v24;
  char *v25;
  _QWORD v26[5];
  BOOL v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noteContext"));

  v12 = (char *)objc_msgSend(v8, "count");
  if (v12)
  {
    v13 = 0;
    v25 = v12;
    do
    {
      v14 = (unint64_t)(v13 + 5);
      if (v13 + 5 >= v12)
        v15 = v12;
      else
        v15 = v13 + 5;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v13, v15 - v13));
      v17 = objc_alloc((Class)ICCopyModernNotesToLegacyAccountOperation);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000E49F4;
      v26[3] = &unk_100554958;
      v27 = v5;
      v26[4] = self;
      v18 = objc_msgSend(v17, "initWithNotes:toFolder:legacyContext:didCopyBlock:", v16, v9, v11, v26);
      v19 = v9;
      v20 = v8;
      v21 = v5;
      v22 = v18;
      v23 = self;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController operationQueue](self, "operationQueue"));
      objc_msgSend(v24, "addOperation:", v22);

      self = v23;
      v5 = v21;
      v8 = v20;
      v9 = v19;

      v12 = v25;
      v13 = v15;
    }
    while ((unint64_t)v25 > v14);
  }

}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController operationQueue](self, "operationQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController createdLegacyNotes](self, "createdLegacyNotes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isMarkedForDeletion") & 1) == 0)
          objc_msgSend(v9, "markForDeletion");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)waitUntilFinishedWithDispatchTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  dispatch_semaphore_t v10;

  v5 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(-2, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E4C4C;
  v9[3] = &unk_10054FE80;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

  dispatch_semaphore_wait(v8, a3);
}

- (void)asyncFinishCopyOnly:(BOOL)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  global_queue = dispatch_get_global_queue(-2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4D08;
  v7[3] = &unk_100550360;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

- (void)finishAfterCopyingNotesCopyOnly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "undoManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v3)
    v9 = CFSTR("Copy %lu Notes");
  else
    v9 = CFSTR("Move %lu Notes");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1005704B8, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController createdLegacyNotes](self, "createdLegacyNotes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, objc_msgSend(v11, "count")));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveModernNotesToLegacyAccountController notesToDelete](self, "notesToDelete"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectContext"));
        if (v19)
        {
          v20 = (void *)v19;
          v21 = objc_msgSend(v18, "markedForDeletion");

          if ((v21 & 1) == 0)
            +[ICNote deleteNote:](ICNote, "deleteNote:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v22, "save");

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "noteContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "managedObjectContext"));
  objc_msgSend(v25, "ic_save");

}

+ (id)localizedAlertTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Unsupported Attachments"), &stru_1005704B8, 0));

  return v3;
}

+ (id)localizedAlertMessageForMovingNotesForAccount:(id)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "supportsAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("You’re moving notes to an account that doesn’t support some attachments. If you continue, unsupported attachments may look different.");
  else
    v6 = CFSTR("You’re moving notes to an account that doesn’t support attachments. If you continue, all attachments will be removed.");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

+ (id)localizedAlertMessageForCopyingNotesForAccount:(id)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "supportsAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("You’re copying notes to an account that doesn’t support some attachments. If you continue, unsupported attachments may look different.");
  else
    v6 = CFSTR("You’re moving notes to an account that doesn’t support attachments. If you continue, all attachments will be removed.");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

+ (id)alertForUnsupportedAttachmentsDestinationStore:(id)a3 continueHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICMoveModernNotesToLegacyAccountController localizedAlertTitle](ICMoveModernNotesToLegacyAccountController, "localizedAlertTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICMoveModernNotesToLegacyAccountController localizedAlertMessageForMovingNotesForAccount:](ICMoveModernNotesToLegacyAccountController, "localizedAlertMessageForMovingNotesForAccount:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1005704B8, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v5));

  objc_msgSend(v10, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));
  objc_msgSend(v10, "addAction:", v16);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v17 = -2;
  else
    v17 = 7;
  objc_msgSend(v10, "setModalPresentationStyle:", v17);

  return v10;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSMutableArray)notesToDelete
{
  return self->_notesToDelete;
}

- (void)setNotesToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_notesToDelete, a3);
}

- (NSMutableArray)createdLegacyNotes
{
  return self->_createdLegacyNotes;
}

- (void)setCreatedLegacyNotes:(id)a3
{
  objc_storeStrong((id *)&self->_createdLegacyNotes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdLegacyNotes, 0);
  objc_storeStrong((id *)&self->_notesToDelete, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
