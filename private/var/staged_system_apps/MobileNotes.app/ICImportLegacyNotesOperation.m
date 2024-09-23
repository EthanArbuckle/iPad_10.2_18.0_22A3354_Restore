@implementation ICImportLegacyNotesOperation

- (ICImportLegacyNotesOperation)init
{
  -[ICImportLegacyNotesOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICImportLegacyNotesOperation)initWithLegacyNotes:(id)a3 destinationFolder:(id)a4 deleteLegacyNotesAfterImport:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ICImportLegacyNotesOperation *v10;
  ICImportLegacyNotesOperation *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICImportLegacyNotesOperation;
  v10 = -[ICImportLegacyNotesOperation init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    -[ICImportLegacyNotesOperation setDestinationFolder:](v10, "setDestinationFolder:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
    -[ICImportLegacyNotesOperation setLegacyNotes:](v11, "setLegacyNotes:", v12);

    -[ICImportLegacyNotesOperation setDeleteLegacyNotesAfterImport:](v11, "setDeleteLegacyNotesAfterImport:", v5);
  }

  return v11;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[6];
  _QWORD v35[5];
  id v36;
  _BYTE v37[128];

  v3 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10040BA1C((uint64_t)self, v3);

  -[ICImportLegacyNotesOperation cancelIfNecessary](self, "cancelIfNecessary");
  if ((-[ICImportLegacyNotesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_1000F7880;
    v35[4] = sub_1000F7890;
    v36 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation destinationFolder](self, "destinationFolder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000F7898;
    v34[3] = &unk_100550660;
    v34[4] = self;
    v34[5] = v35;
    objc_msgSend(v5, "performBlockAndWait:", v34);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation legacyNotes](self, "legacyNotes"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v9);
          -[ICImportLegacyNotesOperation cancelIfNecessary](self, "cancelIfNecessary");
          if ((-[ICImportLegacyNotesOperation isCancelled](self, "isCancelled") & 1) != 0)
          {

            goto LABEL_18;
          }
          v24 = 0;
          v25 = &v24;
          v26 = 0x3032000000;
          v27 = sub_1000F7880;
          v28 = sub_1000F7890;
          v29 = v10;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000F78EC;
          v23[3] = &unk_100550660;
          v23[4] = self;
          v23[5] = &v24;
          performBlockOnMainThreadAndWait(v23);
          _Block_object_dispose(&v24, 8);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v7)
          continue;
        break;
      }
    }

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_1000F7880;
    v28 = sub_1000F7890;
    v29 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F7BC8;
    v22[3] = &unk_100550C10;
    v22[4] = &v24;
    performBlockOnMainThreadAndWait(v22);
    if (v25[5])
    {
      v11 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10040B9B0((uint64_t)&v25, v11, v12, v13, v14, v15, v16, v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "managedObjectContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000F7C40;
    v20[3] = &unk_100550110;
    v21 = v19;
    objc_msgSend(v18, "performBlockAndWait:", v20);

    _Block_object_dispose(&v24, 8);
LABEL_18:
    _Block_object_dispose(v35, 8);

  }
}

- (void)cancelIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  ICImportLegacyNotesOperation *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation destinationFolder](self, "destinationFolder"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation destinationFolder](self, "destinationFolder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation destinationFolder](self, "destinationFolder"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000F7DE8;
      v10[3] = &unk_100550110;
      v10[4] = self;
      objc_msgSend(v7, "performBlockAndWait:", v10);

      return;
    }
    v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      v9 = "Cancelling import operation because folder lost its managed object context: %@";
      goto LABEL_8;
    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      v9 = "Cancelling import operation because folder doesn't exist: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }

  -[ICImportLegacyNotesOperation cancel](self, "cancel");
}

- (id)ensureLegacyNoteIsValid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_1000F7880;
    v15 = sub_1000F7890;
    v16 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F8044;
    v8[3] = &unk_10054FD20;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    performBlockOnMainThreadAndWait(v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

- (id)legacyManagedObjectContext
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000F7880;
  v9 = sub_1000F7890;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F8178;
  v4[3] = &unk_100550C10;
  v4[4] = &v5;
  performBlockOnMainThreadAndWait(v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000F7880;
  v17 = sub_1000F7890;
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation destinationFolder](self, "destinationFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F8324;
  v12[3] = &unk_100550660;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v4, "performBlockAndWait:", v12);

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportLegacyNotesOperation legacyNotes](self, "legacyNotes"));
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; legacyNoteCount=%d destionationFolder=%@>"),
                    v7,
                    self,
                    v9,
                    v14[5]));

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (ICFolder)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationFolder:(id)a3
{
  objc_storeStrong((id *)&self->_destinationFolder, a3);
}

- (NSArray)legacyNotes
{
  return self->_legacyNotes;
}

- (void)setLegacyNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)deleteLegacyNotesAfterImport
{
  return self->_deleteLegacyNotesAfterImport;
}

- (void)setDeleteLegacyNotesAfterImport:(BOOL)a3
{
  self->_deleteLegacyNotesAfterImport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNotes, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
}

@end
