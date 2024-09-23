@implementation WLTipsVideoView

- (WLTipsVideoView)initWithTips:(id)a3
{
  id v4;
  WLTipsVideoView *v5;
  WLTipsVideoView *v6;
  uint64_t v7;
  AVQueuePlayer *player;
  uint64_t v9;
  AVPlayerLayer *playerLayer;
  AVPlayerLayer *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLTipsVideoView;
  v5 = -[WLTipsVideoView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tips, v4);
    -[WLTipsVideoView setContentMode:](v6, "setContentMode:", 1);
    -[WLTipsVideoView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[WLTipsVideoView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WLTipsVideoView setTipsImage](v6, "setTipsImage");
    -[WLTipsVideoView sizeToFit](v6, "sizeToFit");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDB2670]), "initWithPlayerItem:", 0);
    player = v6->_player;
    v6->_player = (AVQueuePlayer *)v7;

    objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", v6->_player);
    v9 = objc_claimAutoreleasedReturnValue();
    playerLayer = v6->_playerLayer;
    v6->_playerLayer = (AVPlayerLayer *)v9;

    v11 = v6->_playerLayer;
    -[WLTipsVideoView bounds](v6, "bounds");
    -[AVPlayerLayer setFrame:](v11, "setFrame:");
    -[WLTipsVideoView layer](v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v6->_playerLayer);

    -[WLTipsVideoView setTipsVideo](v6, "setTipsVideo");
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[WLTipsVideoView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v14, sel_userInterfaceStyleDidChange);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_applicationWillEnterForeground, *MEMORY[0x24BDF75D0], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WLTipsVideoView;
  -[WLTipsVideoView dealloc](&v4, sel_dealloc);
}

- (void)setTipsImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  v6 = (void *)MEMORY[0x24BDF6AC8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_tips);
  objc_msgSend(WeakRetained, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == 2)
    objc_msgSend(v8, "dark");
  else
    objc_msgSend(v8, "light");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localFile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[WLTipsVideoView setImage:](self, "setImage:", v12);
}

- (void)setTipsVideo
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVPlayerLooper *v12;
  AVPlayerLooper *playerLooper;
  id v14;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  WeakRetained = objc_loadWeakRetained((id *)&self->_tips);
  objc_msgSend(WeakRetained, "video");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 == 2)
    objc_msgSend(v7, "dark");
  else
    objc_msgSend(v7, "light");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localFile");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithURL:", v10);
  -[AVQueuePlayer pause](self->_player, "pause");
  -[AVPlayerLooper disableLooping](self->_playerLooper, "disableLooping");
  -[AVQueuePlayer removeAllItems](self->_player, "removeAllItems");
  -[AVQueuePlayer insertItem:afterItem:](self->_player, "insertItem:afterItem:", v11, 0);
  objc_msgSend(MEMORY[0x24BDB2650], "playerLooperWithPlayer:templateItem:", self->_player, v11);
  v12 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  playerLooper = self->_playerLooper;
  self->_playerLooper = v12;

  -[AVQueuePlayer play](self->_player, "play");
}

- (void)userInterfaceStyleDidChange
{
  -[WLTipsVideoView setTipsImage](self, "setTipsImage");
  -[WLTipsVideoView setTipsVideo](self, "setTipsVideo");
}

- (void)layoutSublayersOfLayer:(id)a3
{
  AVPlayerLayer *playerLayer;

  playerLayer = self->_playerLayer;
  -[WLTipsVideoView bounds](self, "bounds", a3);
  -[AVPlayerLayer setFrame:](playerLayer, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_tips);
}

@end
