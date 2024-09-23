@implementation SearchUIMediaPlayerViewController

- (SearchUIMediaPlayerViewController)initWithDestination:(id)a3
{
  id v4;
  SearchUIMediaPlayerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIMediaPlayerViewController;
  v5 = -[SearchUIMediaPlayerViewController init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C8B2E8];
    objc_msgSend(v4, "urls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAudioSession:", v10);

    objc_msgSend(v9, "audioSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCategory:error:", *MEMORY[0x1E0C89690], 0);

    -[SearchUIMediaPlayerViewController setAllowsPictureInPicturePlayback:](v5, "setAllowsPictureInPicturePlayback:", 0);
    -[SearchUIMediaPlayerViewController setPlayer:](v5, "setPlayer:", v9);

  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIMediaPlayerViewController;
  -[SearchUIMediaPlayerViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SearchUIMediaPlayerViewController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "play");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
