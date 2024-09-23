@implementation _PBFGalleryEnqueuedRefreshGalleryRequest

- (_PBFGalleryEnqueuedRefreshGalleryRequest)initWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5
{
  id v8;
  _PBFGalleryEnqueuedRefreshGalleryRequest *v9;
  uint64_t v10;
  NSUUID *sessionId;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_PBFGalleryEnqueuedRefreshGalleryRequest;
  v9 = -[_PBFGalleryEnqueuedRefreshGalleryRequest init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSUUID *)v10;

    v9->_options = a3;
    v9->_powerLogReason = a4;
  }

  return v9;
}

- (void)addCompletionHandler:(id)a3
{
  void (**v4)(id, PRSPosterGalleryLayout *, NSDate *, BOOL, NSError *);
  _PBFGalleryEnqueuedRefreshGalleryRequest *v5;
  NSMutableArray *completionHandlers;
  uint64_t v7;
  NSMutableArray *v8;
  void *v9;
  void (**v10)(id, PRSPosterGalleryLayout *, NSDate *, BOOL, NSError *);

  v4 = (void (**)(id, PRSPosterGalleryLayout *, NSDate *, BOOL, NSError *))a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_finalized)
    {
      v10[2](v10, v5->_finalizedGalleryConfiguration, v5->_finalizedLastUpdateDate, v5->_finalizedDidUpdate, v5->_finalizedError);
    }
    else
    {
      completionHandlers = v5->_completionHandlers;
      if (!completionHandlers)
      {
        v7 = objc_opt_new();
        v8 = v5->_completionHandlers;
        v5->_completionHandlers = (NSMutableArray *)v7;

        completionHandlers = v5->_completionHandlers;
      }
      v9 = (void *)objc_msgSend(v10, "copy");
      -[NSMutableArray addObject:](completionHandlers, "addObject:", v9);

    }
    objc_sync_exit(v5);

    v4 = v10;
  }

}

- (void)fireCompletionHandlersWithError:(id)a3 faceGalleryConfiguration:(id)a4 lastUpdateDate:(id)a5 didUpdate:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  _PBFGalleryEnqueuedRefreshGalleryRequest *v14;
  uint64_t v15;
  PRSPosterGalleryLayout *finalizedGalleryConfiguration;
  uint64_t v17;
  NSDate *finalizedLastUpdateDate;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  objc_sync_enter(v14);
  if (!v14->_finalized)
  {
    objc_storeStrong((id *)&v14->_finalizedError, a3);
    v15 = objc_msgSend(v12, "copy");
    finalizedGalleryConfiguration = v14->_finalizedGalleryConfiguration;
    v14->_finalizedGalleryConfiguration = (PRSPosterGalleryLayout *)v15;

    v17 = objc_msgSend(v13, "copy");
    finalizedLastUpdateDate = v14->_finalizedLastUpdateDate;
    v14->_finalizedLastUpdateDate = (NSDate *)v17;

    v14->_finalizedDidUpdate = a6;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v14->_completionHandlers;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v19);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22) + 16))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22));
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

    -[NSMutableArray removeAllObjects](v14->_completionHandlers, "removeAllObjects", (_QWORD)v23);
    v14->_finalized = 1;
  }
  objc_sync_exit(v14);

}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_finalizedLastUpdateDate, 0);
  objc_storeStrong((id *)&self->_finalizedGalleryConfiguration, 0);
  objc_storeStrong((id *)&self->_finalizedError, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
