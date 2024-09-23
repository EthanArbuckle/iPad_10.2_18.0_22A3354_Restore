@implementation PSYSyncSessionUpdate

- (PSYSyncSessionUpdate)initWithOriginalSession:(id)a3 updatedSession:(id)a4
{
  id v7;
  id v8;
  PSYSyncSessionUpdate *v9;
  PSYSyncSessionUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSYSyncSessionUpdate;
  v9 = -[PSYSyncSessionUpdate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalSession, a3);
    objc_storeStrong((id *)&v10->_updatedSession, a4);
  }

  return v10;
}

- (void)enumerateChangedActivitiesWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, void *);

  v14 = (void (**)(id, void *, void *))a3;
  -[PSYSyncSession activities](self->_originalSession, "activities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[PSYSyncSession activities](self->_updatedSession, "activities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7 && v5 != 0)
  {
    v9 = 0;
    do
    {
      -[PSYSyncSession activities](self->_originalSession, "activities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSYSyncSession activities](self->_updatedSession, "activities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isEqual:", v13) & 1) == 0)
        v14[2](v14, v11, v13);

      ++v9;
    }
    while (v5 != v9);
  }

}

- (void)enumerateNewlyRunningActivitiesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__PSYSyncSessionUpdate_enumerateNewlyRunningActivitiesWithBlock___block_invoke;
  v6[3] = &unk_24C5E5380;
  v7 = v4;
  v5 = v4;
  -[PSYSyncSessionUpdate enumerateChangedActivitiesWithBlock:](self, "enumerateChangedActivitiesWithBlock:", v6);

}

void __65__PSYSyncSessionUpdate_enumerateNewlyRunningActivitiesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!objc_msgSend(v6, "activityState") && objc_msgSend(v5, "activityState") == 1)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateNewlyCompletedActivitiesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__PSYSyncSessionUpdate_enumerateNewlyCompletedActivitiesWithBlock___block_invoke;
  v6[3] = &unk_24C5E5380;
  v7 = v4;
  v5 = v4;
  -[PSYSyncSessionUpdate enumerateChangedActivitiesWithBlock:](self, "enumerateChangedActivitiesWithBlock:", v6);

}

void __67__PSYSyncSessionUpdate_enumerateNewlyCompletedActivitiesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "activityState") != 2 && objc_msgSend(v5, "activityState") == 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)didUpdateCompleteSyncSession
{
  return -[PSYSyncSession syncSessionState](self->_originalSession, "syncSessionState") != 2
      && -[PSYSyncSession syncSessionState](self->_updatedSession, "syncSessionState") == 2;
}

- (PSYSyncSession)originalSession
{
  return self->_originalSession;
}

- (PSYSyncSession)updatedSession
{
  return self->_updatedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSession, 0);
  objc_storeStrong((id *)&self->_originalSession, 0);
}

@end
