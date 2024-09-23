@implementation MSPHistoryRAPStorage

- (void)saveHistoryEntry:(id)a3 origin:(int64_t)a4 searchTicket:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "storageIdentifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10048431C;
  v11[3] = &unk_1011B80C8;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  -[MSPHistoryRAPStorage editRecordingForHistoryEntryWithStorageIdentifier:usingBlock:](self, "editRecordingForHistoryEntryWithStorageIdentifier:usingBlock:", v9, v11);

}

- (MSPHistoryRAPStorage)init
{
  MSPHistoryRAPStorage *result;

  result = (MSPHistoryRAPStorage *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MSPHistoryRAPStorage)initWithStorageDirectoryURL:(id)a3
{
  id v4;
  MSPHistoryRAPStorage *v5;
  RAPStorage *v6;
  RAPStorage *underlyingStorage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSPHistoryRAPStorage;
  v5 = -[MSPHistoryRAPStorage init](&v9, "init");
  if (v5)
  {
    v6 = -[RAPStorage initWithStorageDirectoryURL:]([RAPStorage alloc], "initWithStorageDirectoryURL:", v4);
    underlyingStorage = v5->_underlyingStorage;
    v5->_underlyingStorage = v6;

    +[RAPStorage standardTimeToLive](RAPStorage, "standardTimeToLive");
    -[RAPStorage setItemTimeToLive:](v5->_underlyingStorage, "setItemTimeToLive:");
  }

  return v5;
}

- (void)setHistoryContainer:(id)a3
{
  id v4;
  MSPHistoryRAPStorage *v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeWeak((id *)&v5->_historyContainer, v4);
  if (v4)
  {
    v6 = objc_alloc_init((Class)MSHistoryItemRequest);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C0CA48;
    v7[3] = &unk_1011AE168;
    v7[4] = v5;
    objc_msgSend(v6, "fetchWithCompletionHandler:", v7);

  }
  objc_sync_exit(v5);

}

- (void)historyContainerPerformMaintenanceForValidIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryRAPStorage underlyingStorage](self, "underlyingStorage"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C0CC5C;
  v10[3] = &unk_1011E9368;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "removeItemsPassingTest:", v10);

  v7[2](v7, 0);
}

- (void)loadAllRecordingsWithConcurrentBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSArray *v14;
  NSDictionary *v15;
  _QWORD v16[4];
  id v17;
  MSPHistoryRAPStorage *v18;
  id v19;
  id v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryRAPStorage underlyingStorage](self, "underlyingStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allItemIdentifiersByDescendingCreationDate"));

  if (objc_msgSend(v6, "count"))
  {
    v21 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("identifier IN %@"), v7));

    v9 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
    v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("createTime"), 0);
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v12 = objc_msgSend(v9, "initWithPredicate:sortDescriptors:range:", v8, v11, 0);

    v13 = objc_alloc_init((Class)MSHistoryItemRequest);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100C0CE8C;
    v16[3] = &unk_1011B7580;
    v17 = v6;
    v18 = self;
    v19 = v4;
    objc_msgSend(v13, "fetchWithOptions:completionHandler:", v12, v16);

  }
  else
  {
    v14 = objc_opt_new(NSArray);
    v15 = objc_opt_new(NSDictionary);
    (*((void (**)(id, NSArray *, NSDictionary *))v4 + 2))(v4, v14, v15);

  }
}

- (void)editRecordingForHistoryEntryWithStorageIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  void (*v11)(_QWORD *, id, _QWORD *);
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryRAPStorage underlyingStorage](self, "underlyingStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataForItemWithIdentifier:error:", v6, 0));

  if (!v9
    || (v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "recordingClass")), "initWithData:", v9)) == 0)
  {
    v10 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(self), "recordingClass"));
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100C0D26C;
  v14[3] = &unk_1011AD238;
  v14[4] = self;
  v15 = v10;
  v16 = v6;
  v11 = (void (*)(_QWORD *, id, _QWORD *))v7[2];
  v12 = v6;
  v13 = v10;
  v11(v7, v13, v14);

}

- (void)saveRecording:(id)a3 forHistoryEntryWithStorageIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryRAPStorage underlyingStorage](self, "underlyingStorage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100C0D35C;
  v14[3] = &unk_1011AE218;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "saveItemWithData:forIdentifier:completion:", v12, v9, v14);

}

+ (Class)recordingClass
{
  return 0;
}

- (void)garbageCollectRAPStorageIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MSPHistoryRAPStorage underlyingStorage](self, "underlyingStorage"));
  objc_msgSend(v2, "garbageCollectIfNeeded");

}

- (MSPHistoryContainer)historyContainer
{
  return (MSPHistoryContainer *)objc_loadWeakRetained((id *)&self->_historyContainer);
}

- (RAPStorage)underlyingStorage
{
  return self->_underlyingStorage;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_historyContainer);
  objc_storeStrong((id *)&self->_underlyingStorage, 0);
}

@end
