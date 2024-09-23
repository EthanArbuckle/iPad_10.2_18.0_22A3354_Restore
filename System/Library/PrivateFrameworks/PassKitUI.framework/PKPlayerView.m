@implementation PKPlayerView

- (PKPlayerView)initWithFrame:(CGRect)a3
{
  PKPlayerView *v3;
  uint64_t v4;
  AVQueuePlayer *player;
  AVPlayerViewController *v6;
  AVPlayerViewController *controller;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPlayerView;
  v3 = -[PKPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C8B350], "playerWithPlayerItem:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    player = v3->_player;
    v3->_player = (AVQueuePlayer *)v4;

    -[AVQueuePlayer setMuted:](v3->_player, "setMuted:", 1);
    v6 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E0C8B448]);
    controller = v3->_controller;
    v3->_controller = v6;

    -[AVPlayerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:](v3->_controller, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", 1);
    -[AVPlayerViewController setCanPausePlaybackWhenExitingFullScreen:](v3->_controller, "setCanPausePlaybackWhenExitingFullScreen:", 0);
    -[AVPlayerViewController setVideoGravity:](v3->_controller, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);
    -[AVPlayerViewController setPlayer:](v3->_controller, "setPlayer:", v3->_player);
    -[AVPlayerViewController view](v3->_controller, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlayerView addSubview:](v3, "addSubview:", v8);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPlayerView;
  -[PKPlayerView layoutSubviews](&v4, sel_layoutSubviews);
  -[AVPlayerViewController view](self->_controller, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlayerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)playItemAtURL:(id)a3
{
  AVPlayerLooper *v4;
  AVPlayerLooper *playerLooper;
  id v6;

  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", self->_player, v6);
  v4 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  playerLooper = self->_playerLooper;
  self->_playerLooper = v4;

  -[AVQueuePlayer play](self->_player, "play");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
