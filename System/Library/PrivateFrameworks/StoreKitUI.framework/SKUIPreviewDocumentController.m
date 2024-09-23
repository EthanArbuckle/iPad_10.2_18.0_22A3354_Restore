@implementation SKUIPreviewDocumentController

- (SKUIPreviewDocumentController)initWithDocument:(id)a3
{
  id v5;
  SKUIPreviewDocumentController *v6;
  SKUIPreviewDocumentController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewDocumentController initWithDocument:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewDocumentController;
  v6 = -[SKUIPreviewDocumentController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    -[IKAppDocument setDelegate:](v7->_document, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__playerSessionsDidChangeNotification_, *MEMORY[0x1E0DDC270], 0);
    -[SKUIPreviewDocumentController _connectToAudioPlayer](v7, "_connectToAudioPlayer");

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC270], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278], 0);
  -[IKAppDocument setDelegate:](self->_document, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIPreviewDocumentController;
  -[SKUIPreviewDocumentController dealloc](&v4, sel_dealloc);
}

- (BOOL)isPreviewActive
{
  return self->_audioPlayer != 0;
}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_viewControllers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "documentDidUpdate:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)overlayViewControllerWithBackgroundStyle:(int64_t)a3
{
  SKUIPreviewOverlayViewController *v5;
  void *v6;
  void *v7;
  NSHashTable *viewControllers;
  NSHashTable *v9;
  NSHashTable *v10;

  v5 = -[SKUIPreviewOverlayViewController initWithDocument:]([SKUIPreviewOverlayViewController alloc], "initWithDocument:", self->_document);
  -[SKUIPreviewOverlayViewController setBackgroundStyle:](v5, "setBackgroundStyle:", a3);
  -[SKUIViewController setClientContext:](v5, "setClientContext:", self->_clientContext);
  -[SKUIPreviewDocumentController _operationQueue](self, "_operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewController setOperationQueue:](v5, "setOperationQueue:", v6);

  -[SKUIPreviewOverlayViewController prepareOverlayView](v5, "prepareOverlayView");
  -[SUAudioPlayer playerStatus](self->_audioPlayer, "playerStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPreviewOverlayViewController showPreviewProgressWithStatus:animated:](v5, "showPreviewProgressWithStatus:animated:", v7, 0);

  viewControllers = self->_viewControllers;
  if (!viewControllers)
  {
    v9 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v10 = self->_viewControllers;
    self->_viewControllers = v9;

    viewControllers = self->_viewControllers;
  }
  -[NSHashTable addObject:](viewControllers, "addObject:", v5);
  return v5;
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  SUAudioPlayer *v4;
  SUAudioPlayer *audioPlayer;
  id v6;

  objc_msgSend(a3, "object");
  v4 = (SUAudioPlayer *)objc_claimAutoreleasedReturnValue();
  audioPlayer = self->_audioPlayer;

  if (v4 == audioPlayer)
  {
    -[SUAudioPlayer playerStatus](self->_audioPlayer, "playerStatus");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIPreviewDocumentController _reloadViewControllersWithPreviewStatus:animated:](self, "_reloadViewControllersWithPreviewStatus:animated:", v6, 1);

  }
}

- (void)_playerSessionsDidChangeNotification:(id)a3
{
  _BOOL4 v4;
  id v5;

  v4 = -[SKUIPreviewDocumentController isPreviewActive](self, "isPreviewActive", a3);
  -[SKUIPreviewDocumentController _connectToAudioPlayer](self, "_connectToAudioPlayer");
  if (v4 != -[SKUIPreviewDocumentController isPreviewActive](self, "isPreviewActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SKUIPreviewDocumentIsActiveDidChangeNotification"), self, 0);

  }
}

- (void)_connectToAudioPlayer
{
  void *v3;
  SUAudioPlayer *v4;
  SUAudioPlayer *v5;
  void *v6;
  void *v7;
  SUAudioPlayer **p_audioPlayer;
  void *v9;
  void *v10;
  _QWORD *v11;
  SUAudioPlayer *audioPlayer;
  void *v13;
  SUAudioPlayer *obja;
  SUAudioPlayer *obj;

  -[IKAppDocument templateElement](self->_document, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewURLString");
  v4 = (SUAudioPlayer *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
    objc_msgSend(MEMORY[0x1E0DDC1E8], "sessionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioPlayerForURL:", v6);
    obja = (SUAudioPlayer *)objc_claimAutoreleasedReturnValue();

    v4 = obja;
  }
  p_audioPlayer = &self->_audioPlayer;
  obj = v4;
  if (v4 != self->_audioPlayer)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = (_QWORD *)MEMORY[0x1E0DDC278];
    if (*p_audioPlayer)
      objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278]);
    objc_storeStrong((id *)&self->_audioPlayer, obj);
    if (*p_audioPlayer)
    {
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, *v11);
      audioPlayer = self->_audioPlayer;
    }
    else
    {
      audioPlayer = 0;
    }
    -[SUAudioPlayer playerStatus](audioPlayer, "playerStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPreviewDocumentController _reloadViewControllersWithPreviewStatus:animated:](self, "_reloadViewControllersWithPreviewStatus:animated:", v13, 0);

  }
}

- (id)_operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;
  NSOperationQueue *v6;
  void *v7;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    v6 = self->_operationQueue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.StoreKitUI.%@.%p"), objc_opt_class(), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v6, "setName:", v7);

    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)_reloadViewControllersWithPreviewStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_viewControllers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "showPreviewProgressWithStatus:animated:", v6, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

- (void)initWithDocument:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPreviewDocumentController initWithDocument:]";
}

@end
