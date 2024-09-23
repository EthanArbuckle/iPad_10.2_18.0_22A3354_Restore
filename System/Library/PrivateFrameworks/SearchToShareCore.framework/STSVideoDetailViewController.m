@implementation STSVideoDetailViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSVideoDetailViewController;
  -[STSVideoDetailViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[STSResultDetailViewController setAllowCustomContentViewInteraction:](self, "setAllowCustomContentViewInteraction:", 1);
}

- (void)setContentURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  LPYouTubePlayerView *v7;
  LPYouTubePlayerView *playerView;
  LPYouTubePlayerView *v9;
  void *v10;
  LPYouTubePlayerView *v11;
  void *v12;
  objc_super v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSVideoDetailViewController;
  -[STSResultDetailViewController contentURL](&v14, sel_contentURL);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)STSVideoDetailViewController;
    -[STSResultDetailViewController setContentURL:](&v13, sel_setContentURL_, v4);
    v6 = objc_alloc(MEMORY[0x24BDDA8D8]);
    v7 = (LPYouTubePlayerView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    playerView = self->_playerView;
    self->_playerView = v7;

    -[LPYouTubePlayerView setDelegate:](self->_playerView, "setDelegate:", self);
    v9 = self->_playerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPYouTubePlayerView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[STSResultDetailViewController updateCustomContentWithView:](self, "updateCustomContentWithView:", self->_playerView);
    v11 = self->_playerView;
    -[STSResultDetailViewController contentURL](self, "contentURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPYouTubePlayerView loadVideoWithURL:](v11, "loadVideoWithURL:", v12);

  }
}

- (void)youTubePlayer:(id)a3 didChangeToState:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) <= 4)
    -[STSResultDetailViewController updateWithThumbnail:orThumbnailInfo:](self, "updateWithThumbnail:orThumbnailInfo:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerView, 0);
}

@end
