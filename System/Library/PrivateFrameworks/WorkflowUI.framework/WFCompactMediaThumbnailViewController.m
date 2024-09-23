@implementation WFCompactMediaThumbnailViewController

- (WFCompactMediaThumbnailViewController)initWithAVPlayerItem:(id)a3
{
  id v5;
  WFCompactMediaThumbnailViewController *v6;
  WFCompactMediaThumbnailViewController *v7;
  WFCompactMediaThumbnailViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactMediaThumbnailViewController;
  v6 = -[WFCompactMediaThumbnailViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerItem, a3);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, CFSTR("presentationSize"), 0, WFMediaThumbnailPresentationSizeContext);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFCompactMediaThumbnailViewController playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("presentationSize"), WFMediaThumbnailPresentationSizeContext);

  v4.receiver = self;
  v4.super_class = (Class)WFCompactMediaThumbnailViewController;
  -[WFCompactMediaThumbnailViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFCompactMediaThumbnailViewController;
  -[WFCompactMediaThumbnailViewController loadView](&v10, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BDB27C0]);
  v4 = (void *)MEMORY[0x24BDB2610];
  -[WFCompactMediaThumbnailViewController playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerWithPlayerItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayer:", v6);

  objc_msgSend(v3, "setOverrideParentApplicationDisplayIdentifier:", *MEMORY[0x24BEC1780]);
  objc_msgSend(v3, "setRequiresLinearPlayback:", 0);
  -[WFCompactMediaThumbnailViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactMediaThumbnailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[WFCompactMediaThumbnailViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_msgSend(v3, "didMoveToParentViewController:", self);
}

- (BOOL)contentHeightLikelyToChange
{
  return 1;
}

- (double)contentHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;

  -[WFCompactMediaThumbnailViewController playerItem](self, "playerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationSize");
  v6 = v5;
  v8 = v7;

  if (v6 == *MEMORY[0x24BDBF148] && v8 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 200.0;
  v10 = 0.0;
  if (v6 > 0.0 && v8 > 0.0)
    v10 = v8 / v6;
  return v10 * a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)WFMediaThumbnailPresentationSizeContext == a6)
  {
    -[WFCompactThumbnailViewController invalidateContentSize](self, "invalidateContentSize", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFCompactMediaThumbnailViewController;
    -[WFCompactMediaThumbnailViewController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
