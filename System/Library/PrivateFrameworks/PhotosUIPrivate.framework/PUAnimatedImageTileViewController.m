@implementation PUAnimatedImageTileViewController

- (id)loadView
{
  void *v3;
  ISAnimatedImageView *v4;
  ISAnimatedImageView *animatedImageView;
  void *v6;
  int v7;
  ISAnimatedImageView *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  ISAnimatedImageView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUAnimatedImageTileViewController;
  -[PUImageTileViewController loadView](&v16, sel_loadView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ISAnimatedImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78258]), "initWithAnimatedImage:", 0);
  animatedImageView = self->_animatedImageView;
  self->_animatedImageView = v4;

  -[ISAnimatedImageView setContentMode:](self->_animatedImageView, "setContentMode:", 2);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showGIFLoadingDelays");

  v8 = self->_animatedImageView;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISAnimatedImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  }
  else
  {
    -[ISAnimatedImageView setPlaceholderImageView:](self->_animatedImageView, "setPlaceholderImageView:", v3);
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useDebuggingColors");

  if (v11)
  {
    -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.258823544, 0.956862748, 0.56078434, 1.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v12, "setBorderWidth:", 2.0);
  }
  v14 = self->_animatedImageView;

  return v14;
}

- (void)assetViewModelDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAnimatedImageTileViewController;
  -[PUImageTileViewController assetViewModelDidChange:](&v4, sel_assetViewModelDidChange_, a3);
  -[PUAnimatedImageTileViewController _invalidatePlaybackState](self, "_invalidatePlaybackState");
  -[PUAnimatedImageTileViewController _invalidateAnimatedImage](self, "_invalidateAnimatedImage");
  -[PUAnimatedImageTileViewController _updateAnimatedImageIfNeeded](self, "_updateAnimatedImageIfNeeded");
  -[PUAnimatedImageTileViewController _updatePlaybackStateIfNeeded](self, "_updatePlaybackStateIfNeeded");
}

- (void)_invalidatePlaybackState
{
  self->_isValid.playbackState = 0;
}

- (void)_updatePlaybackStateIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  if (!self->_isValid.playbackState)
  {
    self->_isValid.playbackState = 1;
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUImageTileViewController assetViewModel](self, "assetViewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusValue");
      v6 = v5;

      v7 = fabs(v6);
      switch(self->_interactionState)
      {
        case 0:
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "playGIFEnterThreshold");
          v10 = v9;

          if (v7 >= v10)
            goto LABEL_11;
          v11 = 1;
          v12 = 1;
          goto LABEL_17;
        case 1:
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "playGIFSettledThreshold");
          v21 = v20;

          if (v7 < v21)
            goto LABEL_13;
          if (v7 < 1.0)
          {
LABEL_15:
            v12 = 1;
            break;
          }
LABEL_16:
          v11 = 0;
          v12 = 0;
          goto LABEL_17;
        case 2:
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "playGIFMoveOutThreshold");
          v15 = v14;

          if (v7 <= v15)
            goto LABEL_15;
          v12 = 0;
          v11 = 3;
          goto LABEL_17;
        case 3:
          if (v7 >= 1.0)
            goto LABEL_16;
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "playGIFSettledThreshold");
          v18 = v17;

          if (v7 < v18)
          {
LABEL_13:
            v12 = 1;
            v11 = 2;
LABEL_17:
            self->_interactionState = v11;
          }
          else
          {
LABEL_11:
            v12 = 0;
          }
          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
      v12 = 0;
      self->_interactionState = 0;
    }
    -[ISAnimatedImageView setPlaying:](self->_animatedImageView, "setPlaying:", v12);
  }
}

- (void)_invalidateAnimatedImage
{
  self->_isValid.animatedImage = 0;
}

- (void)_updateAnimatedImageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_isValid.animatedImage)
  {
    self->_isValid.animatedImage = 1;
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animatedImagePlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animatedImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pf_animatedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISAnimatedImageView setImage:](self->_animatedImageView, "setImage:", v5);

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUAnimatedImageTileViewController;
  v7 = a3;
  -[PUImageTileViewController viewModel:didChange:](&v13, sel_viewModel_didChange_, v7, v6);
  -[PUImageTileViewController assetViewModel](self, "assetViewModel", v13.receiver, v13.super_class);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    if (objc_msgSend(v6, "focusValueChanged"))
      -[PUAnimatedImageTileViewController _invalidatePlaybackState](self, "_invalidatePlaybackState");
    objc_msgSend(v6, "animatedImageChange");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "animatedImageChange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "animatedImageDidChange");

      if (v12)
      {
        -[PUAnimatedImageTileViewController _invalidatePlaybackState](self, "_invalidatePlaybackState");
        -[PUAnimatedImageTileViewController _invalidateAnimatedImage](self, "_invalidateAnimatedImage");
      }
    }
    -[PUAnimatedImageTileViewController _updateAnimatedImageIfNeeded](self, "_updateAnimatedImageIfNeeded");
    -[PUAnimatedImageTileViewController _updatePlaybackStateIfNeeded](self, "_updatePlaybackStateIfNeeded");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageView, 0);
}

@end
