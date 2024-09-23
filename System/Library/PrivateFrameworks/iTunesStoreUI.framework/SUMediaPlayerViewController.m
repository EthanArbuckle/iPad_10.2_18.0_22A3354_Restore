@implementation SUMediaPlayerViewController

- (SUMediaPlayerViewController)init
{
  return -[SUMediaPlayerViewController initWithMediaPlayerItem:](self, "initWithMediaPlayerItem:", 0);
}

- (SUMediaPlayerViewController)initWithMediaPlayerItem:(id)a3
{
  SUMediaPlayerViewController *v5;
  AVPlayerViewController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (!objc_msgSend(a3, "URL"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must play a media item with a URL"));
  v10.receiver = self;
  v10.super_class = (Class)SUMediaPlayerViewController;
  v5 = -[SUMediaPlayerViewController init](&v10, sel_init);
  if (v5)
  {
    v5->_mediaItem = (SUMediaPlayerItem *)objc_msgSend(a3, "copy");
    -[SUMediaPlayerViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 0);
    v6 = (AVPlayerViewController *)objc_opt_new();
    v5->_playerViewController = v6;
    -[AVPlayerViewController setDelegate:](v6, "setDelegate:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2610]), "initWithURL:", -[SUMediaPlayerItem URL](v5->_mediaItem, "URL"));
    -[AVPlayerViewController setPlayer:](v5->_playerViewController, "setPlayer:", v7);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, CFSTR("currentItem.playbackLikelyToKeepUp"), 0, 0);

    v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__playbackFinishedNotification_, *MEMORY[0x24BDB1FA8], -[AVPlayer currentItem](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](v5, "playerViewController"), "player"), "currentItem"));
  }
  return v5;
}

- (void)dealloc
{
  NSMutableArray *operations;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[AVPlayer removeObserver:forKeyPath:](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "removeObserver:forKeyPath:", self, CFSTR("currentItem.playbackLikelyToKeepUp"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  operations = self->_operations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](operations, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(operations);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "setDelegate:", 0);
        objc_msgSend(v8, "cancel");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](operations, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUMediaPlayerViewController;
  -[SUMediaPlayerViewController dealloc](&v9, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currentItem.playbackLikelyToKeepUp"), a4, a5, a6))
  {
    if (-[AVPlayerItem isPlaybackLikelyToKeepUp](-[AVPlayer currentItem](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "currentItem"), "isPlaybackLikelyToKeepUp"))
    {
      -[AVPlayer play](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "play");
    }
  }
}

+ (void)sendDownloadPingRequestsForMediaPlayerItem:(id)a3
{
  objc_msgSend(a1, "_sendPingRequestsForURLs:URLBagKey:playerItem:", objc_msgSend(a3, "downloadPingURLs"), CFSTR("podcast-get-episode"), a3);
}

+ (void)sendPlaybackPingRequestsForMediaPlayerItem:(id)a3
{
  objc_msgSend(a1, "_sendPingRequestsForURLs:URLBagKey:playerItem:", objc_msgSend(a3, "playbackPingURLs"), CFSTR("podcast-play-episode"), a3);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUMediaPlayerViewController;
  -[SUMediaPlayerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AVPlayerViewController showFullScreenPresentationFromView:completion:](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "showFullScreenPresentationFromView:completion:", -[SUMediaPlayerViewController view](self, "view"), 0);
}

- (id)copyScriptViewController
{
  SUScriptMediaPlayerViewController *v3;

  v3 = objc_alloc_init(SUScriptMediaPlayerViewController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (v5 != 1)
  {
    if (-[AVPlayer isExternalPlaybackActive](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "isExternalPlaybackActive"))
    {
      LOBYTE(v5) = (unint64_t)(a3 - 1) < 2;
    }
    else
    {
      LOBYTE(v5) = (unint64_t)(a3 - 3) < 2;
    }
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!self->_playerState)
  {
    self->_playerState = 1;
    -[SUMediaPlayerViewController _prepareMediaItem](self, "_prepareMediaItem");
  }
  -[SUMediaPlayerViewController _setIsActivePlayer:](self, "_setIsActivePlayer:", 1);
  v5.receiver = self;
  v5.super_class = (Class)SUMediaPlayerViewController;
  -[SUMediaPlayerViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUClientInterface _mediaPlayerViewControllerWillDismiss:animated:](-[SUMediaPlayerViewController clientInterface](self, "clientInterface"), "_mediaPlayerViewControllerWillDismiss:animated:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)SUMediaPlayerViewController;
  -[SUMediaPlayerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = +[SUDialogManager newDialogWithError:](SUDialogManager, "newDialogWithError:", a4);
    -[AVPlayer pause](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "pause");
    -[SUClientInterface _presentDialog:](-[SUMediaPlayerViewController clientInterface](self, "clientInterface"), "_presentDialog:", v7);
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView removeFromSuperview](self->_backgroundContainerView, "removeFromSuperview");
  }
  -[SUMediaPlayerViewController _dequeueOperation:](self, "_dequeueOperation:", a3);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  -[SUMediaPlayerViewController _showBackgroundImage:](self, "_showBackgroundImage:", a4);
}

- (void)operationFinished:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_playerState = 2;
    -[AVPlayer play](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](self, "playerViewController"), "player"), "play");
    objc_msgSend((id)objc_opt_class(), "sendPlaybackPingRequestsForMediaPlayerItem:", self->_mediaItem);
  }
  -[SUMediaPlayerViewController _dequeueOperation:](self, "_dequeueOperation:", a3);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __106__SUMediaPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v4[3] = &unk_24DE7DEA8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

uint64_t __106__SUMediaPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:", 0);
}

- (void)_playbackFinishedNotification:(id)a3
{
  -[SUMediaPlayerViewController _setIsActivePlayer:](self, "_setIsActivePlayer:", 0);
}

+ (void)_sendPingRequestsForURLs:(id)a3 URLBagKey:(id)a4 playerItem:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "count"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(a3);
          objc_msgSend(v9, "addOperation:", objc_msgSend(MEMORY[0x24BEC8C30], "pingOperationWithUrl:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)));
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
  }
  else
  {
    v14 = objc_msgSend(a5, "itemIdentifier");
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(a5, "itemType") == 1007
        && (objc_msgSend(a1, "_URLIsITunesU:", objc_msgSend(a5, "URL")) & 1) == 0)
      {
        v16 = (void *)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
        objc_msgSend(v16, "addOperation:", objc_msgSend(MEMORY[0x24BEC8C30], "itemPingOperationWithIdentifier:urlBagKey:", v15, a4));
      }
    }
  }
}

+ (BOOL)_URLIsITunesU:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("deimos.*\\.apple\\.com"), 1, 0);
  v5 = (void *)objc_msgSend(a3, "host");
  v6 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_backgroundContainerView
{
  id result;
  UIView *v4;

  result = self->_backgroundContainerView;
  if (!result)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    self->_backgroundContainerView = v4;
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIView setBackgroundColor:](self->_backgroundContainerView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    return self->_backgroundContainerView;
  }
  return result;
}

- (void)_dequeueOperation:(id)a3
{
  objc_msgSend(a3, "setDelegate:", 0);
  -[NSMutableArray removeObjectIdenticalTo:](self->_operations, "removeObjectIdenticalTo:", a3);
}

- (void)_enqueueOperation:(id)a3
{
  NSMutableArray *operations;

  operations = self->_operations;
  if (!operations)
  {
    operations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_operations = operations;
  }
  -[NSMutableArray addObject:](operations, "addObject:", a3);
  objc_msgSend(a3, "setDelegate:", self);
  objc_msgSend(a3, "setShouldMessageMainThread:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", a3);
}

- (void)_loadBackgroundImage
{
  NSURL *v3;
  NSURL *v4;
  SUImageDataProvider *v5;
  void *v6;
  id v7;

  v3 = -[SUMediaPlayerItem backgroundImageURL](self->_mediaItem, "backgroundImageURL");
  if (v3)
  {
    v4 = v3;
    v7 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    v5 = objc_alloc_init(SUImageDataProvider);
    -[SUImageDataProvider setFillColor:](v5, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    objc_msgSend(v7, "setDataProvider:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", v4);
    objc_msgSend(v7, "setRequestProperties:", v6);

    -[SUMediaPlayerViewController _enqueueOperation:](self, "_enqueueOperation:", v7);
  }
}

- (void)_prepareMediaItem
{
  SUPrepareMediaItemOperation *v3;

  v3 = -[SUPrepareMediaItemOperation initWithMediaPlayerItem:]([SUPrepareMediaItemOperation alloc], "initWithMediaPlayerItem:", self->_mediaItem);
  -[SUMediaPlayerViewController _enqueueOperation:](self, "_enqueueOperation:", v3);

}

- (void)_setIsActivePlayer:(BOOL)a3
{
  id v5;
  void *v6;
  SUMediaPlayerViewController *v7;

  v5 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  v6 = v5;
  if (!a3)
  {
    if ((SUMediaPlayerViewController *)objc_msgSend(v5, "_activeMediaPlayer") != self)
      return;
    v7 = self;
    self = 0;
  }
  objc_msgSend(v6, "_setActiveMediaPlayer:", self);
}

- (void)_showBackgroundImage:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  id v14;

  if (a3)
  {
    v5 = -[SUMediaPlayerViewController _backgroundContainerView](self, "_backgroundContainerView");
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", a3);
    objc_msgSend(v14, "setAutoresizingMask:", 45);
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v14, "frame");
    v11 = (v7 - v10) * 0.5;
    v13 = (v9 - v12) * 0.5;
    objc_msgSend(v14, "setFrame:", floorf(v11), floorf(v13));
    -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", v14);

  }
  else
  {
    -[UIView removeFromSuperview](self->_backgroundContainerView, "removeFromSuperview");
  }
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (SUMediaPlayerItem)mediaPlayerItem
{
  return self->_mediaItem;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1008);
}

@end
