@implementation SXVideoPlayerViewControllerManager

- (SXVideoPlayerViewControllerManager)init
{
  SXVideoPlayerViewControllerManager *v2;
  uint64_t v3;
  NSMutableDictionary *videoPlayerViewControllers;
  uint64_t v5;
  NSMutableDictionary *loseOwnershipBlocks;
  uint64_t v7;
  NSMutableDictionary *pendingLoseOwnershipBlocks;
  uint64_t v9;
  NSMutableDictionary *pendingReceiveOwnershipBlocks;
  uint64_t v11;
  NSMutableDictionary *pendingVideoPlayerViewControllers;
  uint64_t v13;
  NSMutableDictionary *videoAnalyticsRouters;
  uint64_t v15;
  NSMutableDictionary *visibilityMonitors;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SXVideoPlayerViewControllerManager;
  v2 = -[SXVideoPlayerViewControllerManager init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    videoPlayerViewControllers = v2->_videoPlayerViewControllers;
    v2->_videoPlayerViewControllers = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    loseOwnershipBlocks = v2->_loseOwnershipBlocks;
    v2->_loseOwnershipBlocks = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingLoseOwnershipBlocks = v2->_pendingLoseOwnershipBlocks;
    v2->_pendingLoseOwnershipBlocks = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingReceiveOwnershipBlocks = v2->_pendingReceiveOwnershipBlocks;
    v2->_pendingReceiveOwnershipBlocks = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingVideoPlayerViewControllers = v2->_pendingVideoPlayerViewControllers;
    v2->_pendingVideoPlayerViewControllers = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    videoAnalyticsRouters = v2->_videoAnalyticsRouters;
    v2->_videoAnalyticsRouters = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    visibilityMonitors = v2->_visibilityMonitors;
    v2->_visibilityMonitors = (NSMutableDictionary *)v15;

  }
  return v2;
}

- (id)videoPlayerViewControllerForURL:(id)a3 receiveOwnershipBlock:(id)a4
{
  id v6;
  id v7;
  SXVideoPlayerViewControllerResponse *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD block[4];
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SXVideoPlayerViewControllerResponse);
  if (v6)
  {
    -[SXVideoPlayerViewControllerManager loseOwnershipBlocks](self, "loseOwnershipBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    -[SXVideoPlayerViewControllerManager videoPlayerViewControllers](self, "videoPlayerViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    -[SXVideoPlayerViewControllerManager autoplayURL](self, "autoplayURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

    -[SXVideoPlayerViewControllerManager videoAnalyticsRouters](self, "videoAnalyticsRouters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXVideoPlayerViewControllerManager visibilityMonitors](self, "visibilityMonitors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (id)v12;
    if (!v12 && (_DWORD)v14)
      v19 = objc_alloc_init(MEMORY[0x24BE90770]);
    v35 = (void *)v10;
    if ((_DWORD)v14)
      -[SXVideoPlayerViewControllerManager setAutoplayURL:](self, "setAutoplayURL:", 0);
    if (!v19)
      goto LABEL_19;
    if (-[SXVideoPlayerViewControllerManager presentedAndAppeared](self, "presentedAndAppeared"))
    {
      if (v10)
      {
        (*(void (**)(void))(v10 + 16))();
        -[SXVideoPlayerViewControllerManager loseOwnershipBlocks](self, "loseOwnershipBlocks");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v6);

      }
      -[SXVideoPlayerViewControllerManager videoPlayerViewControllers](self, "videoPlayerViewControllers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v6);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__SXVideoPlayerViewControllerManager_videoPlayerViewControllerForURL_receiveOwnershipBlock___block_invoke;
      block[3] = &unk_24D68AFA0;
      v38 = v7;
      v37 = v19;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v22 = v38;
    }
    else
    {
      if (-[SXVideoPlayerViewControllerManager presentedAndAppeared](self, "presentedAndAppeared"))
      {
LABEL_19:
        -[SXVideoPlayerViewControllerResponse setShouldAutoplay:](v8, "setShouldAutoplay:", v14);
        -[SXVideoPlayerViewControllerResponse setExpectVideoPlayerViewController:](v8, "setExpectVideoPlayerViewController:", v12 != 0);
        -[SXVideoPlayerViewControllerResponse setAnalyticsRouter:](v8, "setAnalyticsRouter:", v16);
        -[SXVideoPlayerViewControllerResponse setVisibilityMonitor:](v8, "setVisibilityMonitor:", v18);

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v34 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[SXVideoPlayerViewControllerManager pendingReceiveOwnershipBlocks](self, "pendingReceiveOwnershipBlocks");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v7, "copy");
        v24 = (void *)MEMORY[0x219A070A8]();
        objc_msgSend(v32, "setObject:forKey:", v24, v34);

      }
      if (v35)
      {
        -[SXVideoPlayerViewControllerManager pendingLoseOwnershipBlocks](self, "pendingLoseOwnershipBlocks");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v35, "copy");
        v25 = (void *)MEMORY[0x219A070A8]();
        objc_msgSend(v33, "setObject:forKey:", v25, v34);

      }
      -[SXVideoPlayerViewControllerManager pendingVideoPlayerViewControllers](self, "pendingVideoPlayerViewControllers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v19, v34);

      -[SXVideoPlayerViewControllerManager videoPlayerViewControllers](self, "videoPlayerViewControllers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeObjectForKey:", v6);

      -[SXVideoPlayerViewControllerManager loseOwnershipBlocks](self, "loseOwnershipBlocks");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeObjectForKey:", v6);

      v22 = (void *)v34;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

uint64_t __92__SXVideoPlayerViewControllerManager_videoPlayerViewControllerForURL_receiveOwnershipBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)registerExistingVideoPlayerViewController:(id)a3 URL:(id)a4 analyticsRouter:(id)a5 videoPlayerVisibilityMonitor:(id)a6 loseOwnershipBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    -[SXVideoPlayerViewControllerManager videoPlayerViewControllers](self, "videoPlayerViewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v22, v12);

    -[SXVideoPlayerViewControllerManager videoAnalyticsRouters](self, "videoAnalyticsRouters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v13, v12);

    -[SXVideoPlayerViewControllerManager visibilityMonitors](self, "visibilityMonitors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v14, v12);

    if (v15)
    {
      -[SXVideoPlayerViewControllerManager loseOwnershipBlocks](self, "loseOwnershipBlocks");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "copy");
      v21 = (void *)MEMORY[0x219A070A8]();
      objc_msgSend(v19, "setObject:forKey:", v21, v12);

    }
  }

}

- (void)setPresentedAndAppeared:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a3 && !self->_presentedAndAppeared)
  {
    v21 = a3;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SXVideoPlayerViewControllerManager pendingVideoPlayerViewControllers](self, "pendingVideoPlayerViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[SXVideoPlayerViewControllerManager pendingVideoPlayerViewControllers](self, "pendingVideoPlayerViewControllers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXVideoPlayerViewControllerManager pendingReceiveOwnershipBlocks](self, "pendingReceiveOwnershipBlocks");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v11);
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          -[SXVideoPlayerViewControllerManager pendingLoseOwnershipBlocks](self, "pendingLoseOwnershipBlocks");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v11);
          v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          if (v17)
            ((void (**)(_QWORD, void *))v17)[2](v17, v13);
          if (v15)
            ((void (**)(_QWORD, void *))v15)[2](v15, v13);
          -[SXVideoPlayerViewControllerManager pendingVideoPlayerViewControllers](self, "pendingVideoPlayerViewControllers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v11);

          -[SXVideoPlayerViewControllerManager pendingLoseOwnershipBlocks](self, "pendingLoseOwnershipBlocks");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v11);

          -[SXVideoPlayerViewControllerManager pendingReceiveOwnershipBlocks](self, "pendingReceiveOwnershipBlocks");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObjectForKey:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    a3 = v21;
  }
  self->_presentedAndAppeared = a3;
}

- (void)configureAutoplayForVideoWithURL:(id)a3 analyticsRouter:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SXVideoPlayerViewControllerManager setAutoplayURL:](self, "setAutoplayURL:", v8);
  if (v6)
  {
    -[SXVideoPlayerViewControllerManager videoAnalyticsRouters](self, "videoAnalyticsRouters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
}

- (BOOL)presentedAndAppeared
{
  return self->_presentedAndAppeared;
}

- (NSURL)autoplayURL
{
  return self->_autoplayURL;
}

- (void)setAutoplayURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)videoAnalyticsRouters
{
  return self->_videoAnalyticsRouters;
}

- (NSMutableDictionary)visibilityMonitors
{
  return self->_visibilityMonitors;
}

- (NSMutableDictionary)videoPlayerViewControllers
{
  return self->_videoPlayerViewControllers;
}

- (NSMutableDictionary)loseOwnershipBlocks
{
  return self->_loseOwnershipBlocks;
}

- (NSMutableDictionary)pendingVideoPlayerViewControllers
{
  return self->_pendingVideoPlayerViewControllers;
}

- (NSMutableDictionary)pendingLoseOwnershipBlocks
{
  return self->_pendingLoseOwnershipBlocks;
}

- (NSMutableDictionary)pendingReceiveOwnershipBlocks
{
  return self->_pendingReceiveOwnershipBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReceiveOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_pendingLoseOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_pendingVideoPlayerViewControllers, 0);
  objc_storeStrong((id *)&self->_loseOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllers, 0);
  objc_storeStrong((id *)&self->_visibilityMonitors, 0);
  objc_storeStrong((id *)&self->_videoAnalyticsRouters, 0);
  objc_storeStrong((id *)&self->_autoplayURL, 0);
}

@end
