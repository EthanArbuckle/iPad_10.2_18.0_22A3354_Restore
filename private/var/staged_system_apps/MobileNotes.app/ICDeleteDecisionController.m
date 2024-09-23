@implementation ICDeleteDecisionController

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4
{
  return -[ICDeleteDecisionController initWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:](self, "initWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:", a3, 1, a4);
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ICDeleteDecisionController *v10;
  ICDeleteDecisionController *v11;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICDeleteDecisionController;
  v10 = -[ICDeleteDecisionController init](&v13, "init");
  v11 = v10;
  if (v10)
    -[ICDeleteDecisionController commonInitWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:](v10, "commonInitWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:", v8, v6, v9);

  return v11;
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4 sender:(id)a5 eventReporter:(id)a6
{
  return -[ICDeleteDecisionController initWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:sender:eventReporter:](self, "initWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:sender:eventReporter:", a3, 1, a4, a5, a6);
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5 sender:(id)a6 eventReporter:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  ICDeleteDecisionController *v16;
  ICDeleteDecisionController *v17;
  objc_super v19;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ICDeleteDecisionController;
  v16 = -[ICDeleteDecisionController init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[ICDeleteDecisionController commonInitWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:](v16, "commonInitWithSourceObjects:allowsRecentlyDeletedFolderAlert:window:", v12, v10, v13);
    objc_storeWeak(&v17->_sender, v14);
    objc_storeStrong((id *)&v17->_eventReporter, a7);
  }

  return v17;
}

- (void)commonInitWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5
{
  _BOOL8 v6;
  NSArray *v8;
  UIWindow *v9;
  NSArray *sourceObjects;
  ICDeleteDecision *v11;
  ICDeleteDecision *deleteDecision;
  UIWindow *window;
  NSArray *v14;

  v6 = a4;
  v8 = (NSArray *)a3;
  v9 = (UIWindow *)a5;
  self->_didAuthenticate = 0;
  sourceObjects = self->_sourceObjects;
  self->_sourceObjects = v8;
  v14 = v8;

  v11 = -[ICDeleteDecision initWithSourceObjects:allowsRecentlyDeletedFolderAlert:]([ICDeleteDecision alloc], "initWithSourceObjects:allowsRecentlyDeletedFolderAlert:", v14, v6);
  deleteDecision = self->_deleteDecision;
  self->_deleteDecision = v11;

  window = self->_window;
  self->_window = v9;

}

- (BOOL)allowsRecentlyDeletedFolderAlert
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v3 = objc_msgSend(v2, "allowsRecentlyDeletedFolderAlert");

  return v3;
}

- (void)performDecision
{
  -[ICDeleteDecisionController performDecisionWithCompletion:](self, "performDecisionWithCompletion:", 0);
}

- (void)performDecisionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  _QWORD v7[5];
  void (**v8)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == (id)2)
  {
    if (v4)
      v4[2](v4, 0);
  }
  else if (v6 == (id)1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100078ECC;
    v7[3] = &unk_100551FA0;
    v7[4] = self;
    v8 = v4;
    -[ICDeleteDecisionController performAdditionalStepWithCompletion:](self, "performAdditionalStepWithCompletion:", v7);

  }
  else if (!v6)
  {
    -[ICDeleteDecisionController deleteObjects](self, "deleteObjects");
    if (v4)
      v4[2](v4, 1);
  }

}

+ (void)deleteSharesInFolder:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v11, "isSmartFolder"))
  {
    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootSharedFoldersInDescendantsIncludingSelf"));
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootSharedNotesIncludingChildFolders"));
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    if (objc_msgSend(v6, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
      v10 = objc_msgSend(v6, "copy");
      objc_msgSend(v9, "deleteSharesForObjects:completionHandler:", v10, v5);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  uint64_t v4;
  void *v5;
  ICNAEventReporter *v6;
  ICNAEventReporter *eventReporter;
  void *v8;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = kICNASubtrackerNameDeleteDecisionController;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
    v6 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:window:", v4, v5);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (NSString)actionName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  int v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernFolders"));
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete Folder"), &stru_1005704B8, 0));
    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "htmlFolders"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "htmlNotes"));
  v10 = objc_msgSend(v9, "count");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernNotes"));
  v12 = objc_msgSend(v11, "count");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernNotes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folder"));
  v16 = objc_msgSend(v15, "isTrashFolder");

  if (v10)
    v17 = v10;
  else
    v17 = v12;
  if (v10)
    v18 = 1;
  else
    v18 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v19;
  if (v18)
    v20 = CFSTR("Delete %lu Notes");
  else
    v20 = CFSTR("Trash %lu Notes");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_1005704B8, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v17));

LABEL_5:
  return (NSString *)v7;
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, uint64_t);
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = (void (**)(id, uint64_t))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modernSourceObjects"));
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_7;
  }
  v7 = -[ICDeleteDecisionController didAuthenticate](self, "didAuthenticate");

  if ((v7 & 1) != 0)
  {
LABEL_7:
    v4[2](v4, 1);
    goto LABEL_19;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modernFolders"));

  if (objc_msgSend(v9, "count") && objc_msgSend(v9, "ic_allSatisfy:", &stru_100551FE0))
  {
    v4[2](v4, 1);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modernNotes"));

    if (!objc_msgSend(v11, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modernFolders"));

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v27;
        do
        {
          v16 = 0;
          v17 = v11;
          do
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v16), "visibleNotesIncludingChildFolders"));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_arrayByAddingObjectsFromNonNilArray:", v18));

            v16 = (char *)v16 + 1;
            v17 = v11;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v14);
      }

    }
    objc_initWeak(&location, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationPrompt promptForDeletingNotes:](ICAuthenticationPrompt, "promptForDeletingNotes:", v11));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthentication shared](ICAuthentication, "shared"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000796F0;
    v22[3] = &unk_100552008;
    objc_copyWeak(&v24, &location);
    v23 = v4;
    objc_msgSend(v20, "authenticateWithPrompt:displayWindow:completionHandler:", v19, v21, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
LABEL_19:

}

- (void)deleteObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICDeleteDecisionController deleteObjects]", 1, 0, CFSTR("Unexpected call from background thread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v3, "extendDeauthenticationTimer");

  -[ICDeleteDecisionController setDidAuthenticate:](self, "setDidAuthenticate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "undoManager"));

  objc_msgSend(v5, "beginUndoGrouping");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController actionName](self, "actionName"));
  objc_msgSend(v5, "setActionName:", v6);

  -[ICDeleteDecisionController deleteHTMLNotesIfNeeded](self, "deleteHTMLNotesIfNeeded");
  -[ICDeleteDecisionController deleteHTMLFoldersIfNeeded](self, "deleteHTMLFoldersIfNeeded");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007989C;
  v8[3] = &unk_10054FE80;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[ICDeleteDecisionController deleteModernNotesIfNeeded:](self, "deleteModernNotesIfNeeded:", v8);

}

- (void)deleteHTMLNotesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "htmlNotes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController eventReporter](self, "eventReporter"));
  objc_msgSend(v3, "deleteHTMLNotesIfNeeded:eventReporter:", v4, v5);

}

+ (void)deleteHTMLNotesIfNeeded:(id)a3 eventReporter:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v12 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deleting HTML note: %@", buf, 0xCu);
          }

          v13 = objc_opt_class(NoteObject);
          v14 = ICDynamicCast(v13, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteContext"));
          objc_msgSend(v17, "deleteNote:", v15);

          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "noteContext"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "managedObjectContext"));
          objc_msgSend(v20, "ic_save");

          objc_msgSend(v6, "submitNoteDeleteEventForHTMLNote:", v15);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v8);
    }

    v5 = v21;
  }

}

- (void)deleteHTMLFoldersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "htmlFolders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController eventReporter](self, "eventReporter"));
  objc_msgSend(v3, "deleteHTMLFoldersIfNeeded:eventReporter:", v4, v5);

}

+ (void)deleteHTMLFoldersIfNeeded:(id)a3 eventReporter:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting HTML folder: %@", buf, 0xCu);
          }

          v12 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deleting HTML folders is unsupported on iOS.", buf, 2u);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

    v4 = v13;
  }

}

- (void)deleteModernNotesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modernNotes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController eventReporter](self, "eventReporter"));
  objc_msgSend(v5, "deleteModernNotesIfNeeded:eventReporter:completion:", v6, v7, v4);

}

+ (void)deleteModernNotesIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "submitNoteDeleteEventForModernNote:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007A058;
  v17[3] = &unk_10054F8B8;
  v18 = v7;
  v19 = v9;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v14, "deleteSharesForObjects:completionHandler:", v16, v17);

}

- (void)deleteModernFoldersIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modernFolders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController eventReporter](self, "eventReporter"));
  objc_msgSend(v5, "deleteModernFoldersIfNeeded:eventReporter:completion:", v6, v7, v4);

}

+ (void)deleteModernFoldersIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(void);
  id v19;
  id obj;
  _QWORD block[4];
  void (**v23)(void);
  _QWORD v24[5];
  NSObject *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  v18 = (void (**)(void))a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v8, "submitFolderDeleteEventForModernFolder:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
  }
  if (objc_msgSend(obj, "count"))
  {
    v12 = dispatch_group_create();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = obj;
    v13 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v19);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15);
          dispatch_group_enter(v12);
          ++v32[3];
          v17 = (void *)objc_opt_class(a1);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10007A558;
          v24[3] = &unk_100552050;
          v24[4] = v16;
          v25 = v12;
          v26 = &v31;
          objc_msgSend(v17, "deleteSharesInFolder:completion:", v16, v24);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v13);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007A6F8;
    block[3] = &unk_10054FFA8;
    v23 = v18;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(&v31, 8);
  }
  else if (v18)
  {
    v18[2]();
  }

}

- (void)performAdditionalStepWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  void (**v41)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
  v6 = objc_msgSend(v5, "additionalStep");

  switch((unint64_t)v6)
  {
    case 0uLL:
      v4[2](v4, 0);
      goto LABEL_35;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modernNotes"));
      v9 = objc_msgSend(v8, "count");

      if (v9 == (id)1)
      {
        v10 = 0;
        goto LABEL_31;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v30 = objc_msgSend(v29, "containsUnsharedObjects");

      v31 = v30 == 0;
      v32 = 1;
      goto LABEL_28;
    case 2uLL:
      if (-[ICDeleteDecisionController shouldBypassDeleteFolderAlerts](self, "shouldBypassDeleteFolderAlerts"))
        goto LABEL_21;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v13 = 3;
      goto LABEL_33;
    case 3uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modernNotes"));
      v16 = objc_msgSend(v15, "count");

      if (v16 == (id)1)
      {
        v10 = 4;
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
        v34 = objc_msgSend(v33, "containsUnsharedObjects");

        v31 = v34 == 0;
        v32 = 5;
LABEL_28:
        if (v31)
          v10 = v32;
        else
          v10 = v32 + 1;
      }
LABEL_31:
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "modernNotes"));
      v37 = objc_msgSend(v36, "count");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:count:window:sender:completion:](ICDeleteAlert, "showAlertForDeletingObjectsWithType:count:window:sender:completion:", v10, v37, v38, v39, v4);

      goto LABEL_35;
    case 4uLL:
      if (-[ICDeleteDecisionController shouldBypassDeleteFolderAlerts](self, "shouldBypassDeleteFolderAlerts"))
        goto LABEL_21;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v13 = 7;
      goto LABEL_33;
    case 5uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "guiltyObjects"));
      if (objc_msgSend(v18, "count") == (id)1)
        v19 = 8;
      else
        v19 = 9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guiltyObjects"));
      v21 = objc_msgSend(v20, "count");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:count:window:sender:completion:](ICDeleteAlert, "showAlertForDeletingObjectsWithType:count:window:sender:completion:", v19, v21, v22, v23, v4);

      goto LABEL_34;
    case 6uLL:
      if (-[ICDeleteDecisionController shouldBypassDeleteFolderAlerts](self, "shouldBypassDeleteFolderAlerts"))
      {
LABEL_21:
        v4[2](v4, 1);
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
        v13 = 10;
LABEL_33:
        +[ICDeleteAlert showAlertForDeletingObjectsWithType:count:window:sender:completion:](ICDeleteAlert, "showAlertForDeletingObjectsWithType:count:window:sender:completion:", v13, 1, v11, v12, v4);

LABEL_34:
      }
LABEL_35:

      return;
    case 7uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v13 = 13;
      goto LABEL_33;
    case 8uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guiltyObjects"));
      v25 = objc_msgSend(v24, "count");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v28 = 11;
      goto LABEL_24;
    case 9uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v13 = 12;
      goto LABEL_33;
    case 0xAuLL:
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10007AC58;
      v40[3] = &unk_100551FA0;
      v40[4] = self;
      v41 = v4;
      -[ICDeleteDecisionController authenticateIfNeededWithCompletion:](self, "authenticateIfNeededWithCompletion:", v40);

      goto LABEL_35;
    case 0xBuLL:
      +[ICDeleteDecision setDidShowMoveToRecentlyDeletedFolderAlert:](ICDeleteDecision, "setDidShowMoveToRecentlyDeletedFolderAlert:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController deleteDecision](self, "deleteDecision"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guiltyObjects"));
      v25 = objc_msgSend(v24, "count");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v28 = 15;
LABEL_24:
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:count:window:sender:completion:](ICDeleteAlert, "showAlertForDeletingObjectsWithType:count:window:sender:completion:", v28, v25, v26, v27, v4);

      goto LABEL_34;
    case 0xCuLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecisionController sender](self, "sender"));
      v13 = 17;
      goto LABEL_33;
    case 0xDuLL:
      -[ICDeleteDecisionController authenticateIfNeededWithCompletion:](self, "authenticateIfNeededWithCompletion:", v4);
      goto LABEL_35;
    default:
      goto LABEL_35;
  }
}

- (BOOL)shouldBypassDeleteFolderAlerts
{
  return 0;
}

- (NSArray)sourceObjects
{
  return self->_sourceObjects;
}

- (ICDeleteDecision)deleteDecision
{
  return self->_deleteDecision;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (id)sender
{
  return objc_loadWeakRetained(&self->_sender);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_sender);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_deleteDecision, 0);
  objc_storeStrong((id *)&self->_sourceObjects, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
