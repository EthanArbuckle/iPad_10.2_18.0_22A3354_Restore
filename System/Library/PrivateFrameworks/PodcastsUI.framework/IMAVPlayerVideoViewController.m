@implementation IMAVPlayerVideoViewController

- (IMAVPlayerVideoViewController)initWithPlayer:(id)a3
{
  id v4;
  IMAVPlayerVideoViewController *v5;
  IMAVPlayerVideoViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  IMAVPlayerVideoViewController *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo"))
  {
    v12.receiver = self;
    v12.super_class = (Class)IMAVPlayerVideoViewController;
    v5 = -[IMAVPlayerVideoViewController init](&v12, sel_init);
    v6 = v5;
    if (v5)
    {
      -[IMAVPlayerVideoViewController setIm_player:](v5, "setIm_player:", v4);
      -[IMAVPlayerVideoViewController setAllowsPictureInPicturePlayback:](v6, "setAllowsPictureInPicturePlayback:", 1);
      -[IMAVPlayerVideoViewController setUpdatesNowPlayingInfoCenter:](v6, "setUpdatesNowPlayingInfoCenter:", 0);
      -[IMAVPlayerVideoViewController setCanPausePlaybackWhenExitingFullScreen:](v6, "setCanPausePlaybackWhenExitingFullScreen:", 0);
      -[IMAVPlayerVideoViewController setCanIncludePlaybackControlsWhenInline:](v6, "setCanIncludePlaybackControlsWhenInline:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_mediaItemDidChange, CFSTR("IMMediaPlayerNotification_MediaItemDidChange"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel_playbackSpeedDidChange, CFSTR("IMAVPlayerNotification_PlaybackSpeedChanged"), 0);

    }
    +[IMAVPlayer availableSpeeds](IMAVPlayer, "availableSpeeds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayerVideoViewController setSpeeds:](v6, "setSpeeds:", v9);

    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)mediaItemDidChange
{
  void *v3;
  void *v4;
  char v5;

  -[IMAVPlayerVideoViewController im_player](self, "im_player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVideo");

  if ((v5 & 1) == 0)
    -[IMAVPlayerVideoViewController exitFullScreenWithCompletion:](self, "exitFullScreenWithCompletion:", &__block_literal_global);
}

- (void)playbackSpeedDidChange
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  double v8;
  id v9;

  -[IMAVPlayerVideoViewController im_player](self, "im_player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackSpeed");

  +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", v4);
  v6 = v5;
  -[IMAVPlayerVideoViewController im_player](self, "im_player");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v6;
  objc_msgSend(v7, "setDefaultRate:", v8);

}

- (IMAVPlayer)im_player
{
  return (IMAVPlayer *)objc_loadWeakRetained((id *)&self->_im_player);
}

- (void)setIm_player:(id)a3
{
  objc_storeWeak((id *)&self->_im_player, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_im_player);
}

@end
