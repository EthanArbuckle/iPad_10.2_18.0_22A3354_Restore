@implementation ICNoteIntentHandler

- (ICLegacyContext)legacyContext
{
  ICLegacyContext *legacyContext;
  void *v4;
  ICLegacyContext *v5;
  ICLegacyContext *v6;

  legacyContext = self->_legacyContext;
  if (!legacyContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
    objc_msgSend(v4, "enableChangeLogging:", 1);

    v5 = (ICLegacyContext *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
    v6 = self->_legacyContext;
    self->_legacyContext = v5;

    legacyContext = self->_legacyContext;
  }
  return legacyContext;
}

- (ICNoteContext)modernContext
{
  ICNoteContext *modernContext;
  ICNoteContext *v4;
  ICNoteContext *v5;

  modernContext = self->_modernContext;
  if (!modernContext)
  {
    +[ICPluginUtilities setupNoteContextWithOptions:](ICPluginUtilities, "setupNoteContextWithOptions:", 66066);
    v4 = (ICNoteContext *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v5 = self->_modernContext;
    self->_modernContext = v4;

    modernContext = self->_modernContext;
  }
  return modernContext;
}

- (ICRecentNotesCoreDataIndexer)recentNotesIndexer
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICRecentNotesCoreDataIndexer *v14;
  ICRecentNotesCoreDataIndexer *recentNotesIndexer;

  if (!self->_recentNotesIndexer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workerManagedObjectContext"));

      if (v8)
      {
        v9 = objc_alloc((Class)ICRecentNotesCoreDataIndexer);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workerManagedObjectContext"));
        v14 = (ICRecentNotesCoreDataIndexer *)objc_msgSend(v9, "initWithLegacyManagedObjectContext:modernManagedObjectContext:", v11, v13);
        recentNotesIndexer = self->_recentNotesIndexer;
        self->_recentNotesIndexer = v14;

        -[ICRecentNotesCoreDataIndexer setMaximumNumberOfNotesPerAccount:](self->_recentNotesIndexer, "setMaximumNumberOfNotesPerAccount:", 20);
      }
    }
    else
    {

    }
  }
  return self->_recentNotesIndexer;
}

- (void)recentNotesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler recentNotesIndexer](self, "recentNotesIndexer"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000072BC;
      v20[3] = &unk_100020800;
      v20[4] = self;
      v21 = v4;
      objc_msgSend(v10, "reloadData:", v20);

      goto LABEL_8;
    }
  }
  else
  {

  }
  v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10001426C(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", &__NSArray0__struct);
  (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v19, 0);

LABEL_8:
}

- (void)provideNoteOptionsCollectionForNote:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  ICNoteIntentHandler *v27;
  id v28;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));

      if (v13)
      {
        v14 = objc_msgSend(objc_alloc((Class)ICSearchQueryOperation), "initWithSearchSuggestionsResponder:searchString:performNLSearch:performTopHitSearch:tokens:", 0, v7, 0, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        objc_msgSend(v15, "addOperation:", v14);

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100007A4C;
        v25[3] = &unk_100020850;
        v26 = v14;
        v27 = self;
        v28 = v8;
        v16 = v14;
        dispatchMainAfterDelay(v25, 0.0);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {

    }
    v17 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10001426C(v17, v18, v19, v20, v21, v22, v23, v24);

    v16 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", &__NSArray0__struct);
    (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v16, 0);
    goto LABEL_10;
  }
  -[ICNoteIntentHandler recentNotesWithCompletion:](self, "recentNotesWithCompletion:", v8);
LABEL_11:

}

- (void)resolveNoteForNote:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentNoteResolutionResult successWithResolvedIntentNote:](ICIntentNoteResolutionResult, "successWithResolvedIntentNote:", v10));
    v7[2](v7, v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayString"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008434;
    v13[3] = &unk_100020878;
    v14 = v7;
    -[ICNoteIntentHandler provideNoteOptionsCollectionForNote:searchTerm:withCompletion:](self, "provideNoteOptionsCollectionForNote:searchTerm:withCompletion:", v6, v12, v13);

  }
}

- (void)handleNote:(id)a3 completion:(id)a4
{
  void (**v5)(id, ICNoteIntentResponse *);
  id v6;
  void *v7;
  ICNoteIntentResponse *v8;

  v5 = (void (**)(id, ICNoteIntentResponse *))a4;
  v6 = a3;
  v8 = -[ICNoteIntentResponse initWithCode:userActivity:]([ICNoteIntentResponse alloc], "initWithCode:userActivity:", 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));

  -[ICNoteIntentResponse setNote:](v8, "setNote:", v7);
  v5[2](v5, v8);

}

- (id)defaultNoteForNote:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  _QWORD v33[5];
  NSObject *v34;
  _QWORD *v35;
  uint64_t *v36;
  _QWORD v37[5];
  NSObject *v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[5];
  id v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler recentNotesIndexer](self, "recentNotesIndexer"));
      objc_msgSend(v10, "reloadDataAndWait");

      v11 = objc_opt_class(NSManagedObjectID);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler recentNotesIndexer](self, "recentNotesIndexer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstRelevantItemIdentifier"));
      v14 = ICDynamicCast(v11, v13);
      v15 = (os_log_t)objc_claimAutoreleasedReturnValue(v14);

      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = sub_1000076F4;
      v47[4] = sub_100007704;
      v48 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x3032000000;
      v44 = sub_1000076F4;
      v45 = sub_100007704;
      v46 = 0;
      if (-[NSObject ic_isModernNoteType](v15, "ic_isModernNoteType"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler modernContext](self, "modernContext"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10000889C;
        v37[3] = &unk_100020788;
        v39 = v47;
        v37[4] = self;
        v38 = v15;
        v40 = &v41;
        objc_msgSend(v17, "performBlockAndWait:", v37);

        v18 = v38;
      }
      else
      {
        if (!-[NSObject ic_isLegacyNoteType](v15, "ic_isLegacyNoteType"))
        {
          v29 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            sub_100014444();

          goto LABEL_15;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIntentHandler legacyContext](self, "legacyContext"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "managedObjectContext"));
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100008950;
        v33[3] = &unk_100020788;
        v35 = v47;
        v33[4] = self;
        v34 = v15;
        v36 = &v41;
        objc_msgSend(v28, "performBlockAndWait:", v33);

        v18 = v34;
      }

LABEL_15:
      v26 = (void *)v42[5];
      if (v26)
      {
        v30 = v26;
      }
      else
      {
        v31 = os_log_create("com.apple.notes", "Intents");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_1000143E4();

      }
      _Block_object_dispose(&v41, 8);

      _Block_object_dispose(v47, 8);
      goto LABEL_21;
    }
  }
  else
  {

  }
  v15 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000143B4(v15, v19, v20, v21, v22, v23, v24, v25);
  v26 = 0;
LABEL_21:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotesIndexer, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);
  objc_storeStrong((id *)&self->_legacyContext, 0);
}

@end
