@implementation BKDragAndDropMonitor

- (BKDragAndDropMonitor)init
{
  BKDragAndDropMonitor *v2;
  NSHashTable *v3;
  NSHashTable *sessionsTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKDragAndDropMonitor;
  v2 = -[BKDragAndDropMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 1);
    sessionsTable = v2->_sessionsTable;
    v2->_sessionsTable = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063F8C;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4FE8 != -1)
    dispatch_once(&qword_1009F4FE8, block);
  return (id)qword_1009F4FE0;
}

- (void)processWithDragSession:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_sessionsTable, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_sessionsTable, "addObject:", v4);
    v5 = objc_opt_new(NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
          v12 = objc_opt_class(BSUIItemDescription);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localObject"));
          v14 = BUDynamicCast(v12, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));

          if (!objc_msgSend(v16, "length"))
          {
            v17 = objc_opt_class(BKLibraryAsset);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localObject"));
            v19 = BUDynamicCast(v17, v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetID"));

            v16 = (void *)v21;
          }
          if (objc_msgSend(v16, "length"))
            -[NSMutableArray addObject:](v5, "addObject:", v16);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v22, "emitDragDropEventWithContentIDs:", v5);

    v4 = v23;
  }

}

- (void)dragController:(id)a3 dragSessionDidEnd:(id)a4
{
  -[BKDragAndDropMonitor processWithDragSession:](self, "processWithDragSession:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsTable, 0);
}

@end
