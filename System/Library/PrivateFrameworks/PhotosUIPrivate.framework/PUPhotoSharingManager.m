@implementation PUPhotoSharingManager

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", self->_backgroundTaskIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoSharingManager;
  -[PUPhotoSharingManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isRemaking
{
  return self->_videoRemakingCount > 0;
}

- (void)setRemaking:(BOOL)a3
{
  _BOOL8 v3;
  int64_t *p_videoRemakingCount;
  PUPhotoSharingManager *v5;
  _QWORD v6[5];

  v3 = a3;
  p_videoRemakingCount = &self->_videoRemakingCount;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PUPhotoSharingManager_setRemaking___block_invoke;
  v6[3] = &unk_1E58A9910;
  v6[4] = self;
  v5 = self;
  -[PUPhotoSharingManager _setFlag:forReferenceCounter:performIfChanged:](v5, "_setFlag:forReferenceCounter:performIfChanged:", v3, p_videoRemakingCount, v6);

}

- (PLProgressView)publishingProgressView
{
  void *v3;
  PLProgressView *publishingProgressView;
  PLProgressView *v5;
  PLProgressView *v6;
  PLProgressView *v7;

  -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    publishingProgressView = self->_publishingProgressView;
    if (!publishingProgressView)
    {
      v5 = (PLProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B0]), "initWithFrame:", 0.0, 0.0, 0.0, 45.0);
      v6 = self->_publishingProgressView;
      self->_publishingProgressView = v5;

      publishingProgressView = self->_publishingProgressView;
    }
    v7 = publishingProgressView;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)cancelPublishing
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_publishingAgents, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v9, (_QWORD)v11);
        objc_msgSend(v9, "setShouldCancelPublish:", 1);
        objc_msgSend(v9, "cancelRemaking");
        -[PUPhotoSharingManager publishingAgentDidEndRemaking:didSucceed:](self, "publishingAgentDidEndRemaking:didSucceed:", v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x1E0D71550], 0);

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableArray copy](self->_publishingAgents, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isRemaking", (_QWORD)v14) & 1) == 0 && (objc_msgSend(v11, "isPublishing") & 1) == 0)
        {
          if (!v3)
          {
            v12 = 0;
            goto LABEL_14;
          }
          -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12 | v3;
}

- (void)_setFlag:(BOOL)a3 forReferenceCounter:(int64_t *)a4 performIfChanged:(id)a5
{
  void (**v7)(void);
  int64_t v8;
  uint64_t v9;
  BOOL v10;
  int64_t v11;
  int v12;
  int v13;
  void (**v14)(void);

  v7 = (void (**)(void))a5;
  v8 = *a4;
  if (a3)
  {
    v9 = 1;
  }
  else
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v9 = -1;
  }
  v10 = __OFADD__(v8, v9);
  v11 = v8 + v9;
  *a4 = v11;
  if ((v11 < 0) ^ v10 | (v11 == 0))
    v12 = 0;
  else
    v12 = 1;
LABEL_9:
  v13 = v8 > 0;
  if (v7 && v13 != v12)
  {
    v14 = v7;
    v7[2]();
    v7 = v14;
  }

}

- (void)_setNetworkPromptShowing:(BOOL)a3
{
  -[PUPhotoSharingManager _setFlag:forReferenceCounter:performIfChanged:](self, "_setFlag:forReferenceCounter:performIfChanged:", a3, &self->_networkPromptCount, &__block_literal_global_7_67166);
}

- (void)_setDelaysAppSuspend:(BOOL)a3
{
  _BOOL8 v3;
  int64_t *p_appSuspensionCount;
  PUPhotoSharingManager *v5;
  _QWORD v6[5];

  v3 = a3;
  p_appSuspensionCount = &self->_appSuspensionCount;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PUPhotoSharingManager__setDelaysAppSuspend___block_invoke;
  v6[3] = &unk_1E58A9910;
  v6[4] = self;
  v5 = self;
  -[PUPhotoSharingManager _setFlag:forReferenceCounter:performIfChanged:](v5, "_setFlag:forReferenceCounter:performIfChanged:", v3, p_appSuspensionCount, v6);

}

- (id)_currentPublishingAgent
{
  return (id)-[NSMutableArray firstObject](self->_publishingAgents, "firstObject");
}

- (void)_schedulePublishingProgressViewUpdate
{
  void *v3;
  NSTimer *v4;
  NSTimer *publishingProgressTimer;

  -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSTimer invalidate](self->_publishingProgressTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updatePublishingProgressView_, 0, 1, 0.2);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    publishingProgressTimer = self->_publishingProgressTimer;
    self->_publishingProgressTimer = v4;

  }
  else
  {
    -[PUPhotoSharingManager _cleanUpPublishingProgressView](self, "_cleanUpPublishingProgressView");
  }
}

- (void)_updatePublishingProgressView:(id)a3
{
  uint64_t v4;
  id v5;

  -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (v4)
  {
    -[PLProgressView updateUIForPublishingAgent:](self->_publishingProgressView, "updateUIForPublishingAgent:", v4);
    -[PUPhotoSharingManager _schedulePublishingProgressViewUpdate](self, "_schedulePublishingProgressViewUpdate");
  }
  else
  {
    -[PUPhotoSharingManager _cleanUpPublishingProgressView](self, "_cleanUpPublishingProgressView");
  }

}

- (void)_cleanUpPublishingProgressView
{
  NSTimer *publishingProgressTimer;
  PLProgressView *publishingProgressView;

  -[NSTimer invalidate](self->_publishingProgressTimer, "invalidate");
  publishingProgressTimer = self->_publishingProgressTimer;
  self->_publishingProgressTimer = 0;

  -[PLProgressView removeFromSuperview](self->_publishingProgressView, "removeFromSuperview");
  publishingProgressView = self->_publishingProgressView;
  self->_publishingProgressView = 0;

}

- (void)_addPublishingAgentIfNeeded:(id)a3
{
  NSMutableArray *publishingAgents;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  publishingAgents = self->_publishingAgents;
  if (publishingAgents)
    v5 = publishingAgents;
  else
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = self->_publishingAgents;
  self->_publishingAgents = v5;

  if ((-[NSMutableArray containsObject:](self->_publishingAgents, "containsObject:", v7) & 1) == 0)
    -[NSMutableArray addObject:](self->_publishingAgents, "addObject:", v7);

}

- (void)_removePublishingAgent:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray containsObject:](self->_publishingAgents, "containsObject:", v10);
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "setDelegate:", 0);
    -[NSMutableArray removeObject:](self->_publishingAgents, "removeObject:", v10);
    if (objc_msgSend(v10, "deleteMediaFileAfterPublishing"))
    {
      objc_msgSend(v10, "mediaPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeItemAtPath:error:", v6, 0);

      }
    }
    -[PUPhotoSharingManager _setNetworkPromptShowing:](self, "_setNetworkPromptShowing:", 0);
    -[PUPhotoSharingManager _setDelaysAppSuspend:](self, "_setDelaysAppSuspend:", 0);
    v5 = v10;
  }

}

- (void)publishingAgentDidStartRemaking:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUPhotoSharingManager setRemaking:](self, "setRemaking:", 1);
  -[PUPhotoSharingManager _addPublishingAgentIfNeeded:](self, "_addPublishingAgentIfNeeded:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D71548], v8, 0);

  v5 = v8;
  if (v8)
  {
    -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v8;
    if (v6 == v8)
    {
      -[PUPhotoSharingManager _schedulePublishingProgressViewUpdate](self, "_schedulePublishingProgressViewUpdate");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("PUPhotoSharingManagerDidBeginPublishing"), 0);

      v5 = v8;
    }
  }

}

- (void)publishingAgentDidEndRemaking:(id)a3 didSucceed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUPhotoSharingManager setRemaking:](self, "setRemaking:", 0);
  v10 = *MEMORY[0x1E0D71538];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D71530], v6, v8);

  if (!v4)
    -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v6);

}

- (void)publishingAgentDidBeginPublishing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v8 = a3;
  -[PUPhotoSharingManager _addPublishingAgentIfNeeded:](self, "_addPublishingAgentIfNeeded:", v8);
  -[PUPhotoSharingManager _setNetworkPromptShowing:](self, "_setNetworkPromptShowing:", 1);
  -[PUPhotoSharingManager _setDelaysAppSuspend:](self, "_setDelaysAppSuspend:", 1);
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "setStatusBarShowsProgress:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D71540], v8);

  v5 = v8;
  if (v8)
  {
    -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 != v8)
    {
LABEL_5:

      v5 = v8;
      goto LABEL_6;
    }
    v7 = objc_msgSend(v8, "isVideoMedia");

    v5 = v8;
    if ((v7 & 1) == 0)
    {
      -[PUPhotoSharingManager _schedulePublishingProgressViewUpdate](self, "_schedulePublishingProgressViewUpdate");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("PUPhotoSharingManagerDidBeginPublishing"), 0);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)publishingAgentDidEndPublishing:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "showAlertWithError:", a4);
  -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D71528], v6, 0);

  -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PUPhotoSharingManagerDidEndPublishing"), 0);

    -[PUPhotoSharingManager _cleanUpPublishingProgressView](self, "_cleanUpPublishingProgressView");
  }
}

- (void)publishingAgentCancelButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D71520], v4);

  -[PUPhotoSharingManager _currentPublishingAgent](self, "_currentPublishingAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PUPhotoSharingManagerDidEndPublishing"), 0);

    -[PUPhotoSharingManager _cleanUpPublishingProgressView](self, "_cleanUpPublishingProgressView");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingAgents, 0);
  objc_storeStrong((id *)&self->_publishingProgressTimer, 0);
  objc_storeStrong((id *)&self->_publishingProgressView, 0);
}

uint64_t __46__PUPhotoSharingManager__setDelaysAppSuspend___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "beginBackgroundTaskWithExpirationHandler:", 0);
    v3 = result;
    v4 = v2 + 32;
  }
  else
  {
    v4 = result + 32;
    v3 = *MEMORY[0x1E0DC4878];
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 56) == *MEMORY[0x1E0DC4878])
      return result;
    result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
  }
  *(_QWORD *)(*(_QWORD *)v4 + 56) = v3;
  return result;
}

void __50__PUPhotoSharingManager__setNetworkPromptShowing___block_invoke()
{
  SBSSpringBoardServerPort();
  JUMPOUT(0x1AF42AC3CLL);
}

uint64_t __37__PUPhotoSharingManager_setRemaking___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDelaysAppSuspend:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_67171 != -1)
    dispatch_once(&sharedInstance_onceToken_67171, &__block_literal_global_67172);
  return (id)sharedInstance_manager;
}

void __39__PUPhotoSharingManager_sharedInstance__block_invoke()
{
  PUPhotoSharingManager *v0;
  void *v1;

  v0 = objc_alloc_init(PUPhotoSharingManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

}

@end
