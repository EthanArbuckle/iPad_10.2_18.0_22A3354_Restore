@implementation ICNotesFolderIntentHandler

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

- (ICFolderCoreDataIndexer)folderIndexer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ICFolderCoreDataIndexer *v12;
  ICFolderCoreDataIndexer *folderIndexer;

  if (!self->_folderIndexer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler legacyContext](self, "legacyContext"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
    if (!v4)
    {
LABEL_5:

      return self->_folderIndexer;
    }
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler modernContext](self, "modernContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "workerManagedObjectContext"));

    if (v7)
    {
      v8 = objc_alloc((Class)ICFolderCoreDataIndexer);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler legacyContext](self, "legacyContext"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler modernContext](self, "modernContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workerManagedObjectContext"));
      v12 = (ICFolderCoreDataIndexer *)objc_msgSend(v8, "initWithLegacyManagedObjectContext:modernManagedObjectContext:", v9, v11);
      folderIndexer = self->_folderIndexer;
      self->_folderIndexer = v12;

      goto LABEL_5;
    }
  }
  return self->_folderIndexer;
}

- (void)provideFolderOptionsCollectionForNotesFolder:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler legacyContext](self, "legacyContext"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler modernContext](self, "modernContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesFolderIntentHandler folderIndexer](self, "folderIndexer"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100008E30;
      v17[3] = &unk_100020850;
      v17[4] = self;
      v18 = v7;
      v19 = v8;
      objc_msgSend(v14, "reloadData:", v17);

      goto LABEL_8;
    }
  }
  else
  {

  }
  v15 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000144A4(v15);

  v16 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", &__NSArray0__struct);
  (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v16, 0);

LABEL_8:
}

- (void)resolveFolderForNotesFolder:(id)a3 withCompletion:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folder"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentNotesFolderResolutionResult successWithResolvedIntentNotesFolder:](ICIntentNotesFolderResolutionResult, "successWithResolvedIntentNotesFolder:", v10));
    v7[2](v7, v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayString"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009680;
    v13[3] = &unk_100020878;
    v14 = v7;
    -[ICNotesFolderIntentHandler provideFolderOptionsCollectionForNotesFolder:searchTerm:withCompletion:](self, "provideFolderOptionsCollectionForNotesFolder:searchTerm:withCompletion:", v6, v12, v13);

  }
}

- (void)handleNotesFolder:(id)a3 completion:(id)a4
{
  void (**v5)(id, ICNotesFolderIntentResponse *);
  id v6;
  void *v7;
  ICNotesFolderIntentResponse *v8;

  v5 = (void (**)(id, ICNotesFolderIntentResponse *))a4;
  v6 = a3;
  v8 = -[ICNotesFolderIntentResponse initWithCode:userActivity:]([ICNotesFolderIntentResponse alloc], "initWithCode:userActivity:", 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folder"));

  -[ICNotesFolderIntentResponse setFolder:](v8, "setFolder:", v7);
  v5[2](v5, v8);

}

- (id)defaultFolderForNotesFolder:(id)a3
{
  return +[ICIntentNotesFolder currentDefaultNotesFolder](ICIntentNotesFolder, "currentDefaultNotesFolder", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIndexer, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);
  objc_storeStrong((id *)&self->_legacyContext, 0);
}

@end
