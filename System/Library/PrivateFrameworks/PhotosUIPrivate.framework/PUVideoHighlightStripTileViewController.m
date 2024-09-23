@implementation PUVideoHighlightStripTileViewController

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _PUVideoHighlightStripView *v8;
  void *v9;
  _PUVideoHighlightStripView *highlightsView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUVideoHighlightStripTileViewController;
  -[PUTileViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = -[_PUVideoHighlightStripView initWithFrame:]([_PUVideoHighlightStripView alloc], "initWithFrame:", v4, v5, v6, v7);
  -[_PUVideoHighlightStripView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v8);
  -[PUVideoHighlightStripTileViewController highlightColor](self, "highlightColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUVideoHighlightStripView setHighlightColor:](v8, "setHighlightColor:", v9);

  highlightsView = self->_highlightsView;
  self->_highlightsView = v8;

  -[PUVideoHighlightStripTileViewController _updateHighlightsView](self, "_updateHighlightsView");
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  void *v7;
  PUAssetViewModel *v8;

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  v8 = v5;
  if (assetViewModel != v5)
  {
    -[PUAssetViewModel unregisterChangeObserver:](assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel videoPlayer](v8, "videoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoHighlightStripTileViewController setVideoPlayer:](self, "setVideoPlayer:", v7);

    -[PUAssetViewModel registerChangeObserver:](v8, "registerChangeObserver:", self);
    -[PUVideoHighlightStripTileViewController _updateHighlightsView](self, "_updateHighlightsView");
  }

}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *videoPlayer;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    -[PUBrowsingVideoPlayer unregisterTimeObserver:](videoPlayer, "unregisterTimeObserver:", self);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    if (v5)
    {
      -[PUBrowsingVideoPlayer currentTime](v5, "currentTime");
    }
    else
    {
      v9 = 0uLL;
      v10 = 0;
    }
    v7 = v9;
    v8 = v10;
    -[PUVideoHighlightStripTileViewController setCurrentTime:](self, "setCurrentTime:", &v7);
    -[PUBrowsingVideoPlayer registerTimeObserver:](v5, "registerTimeObserver:", self);
  }

}

- (void)_updateHighlightsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;

  -[PUVideoHighlightStripTileViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highlightTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeRangeMapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __64__PUVideoHighlightStripTileViewController__updateHighlightsView__block_invoke;
    v24 = &unk_1E58A8D50;
    v25 = v6;
    PXMap();
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = objc_msgSend(v3, "shouldShowHighlightTimeRanges") ^ 1;
  -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHighlightTimeRanges:", v4);

  objc_msgSend(v3, "videoPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "duration");
  }
  else
  {
    v19 = 0uLL;
    v20 = 0;
  }
  -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v19;
  v18 = v20;
  objc_msgSend(v13, "setVideoDuration:", &v17);

  objc_msgSend(v3, "videoPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPlaybackDesired");
  -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIsPlaying:", v15);

  -[PUVideoHighlightStripTileViewController _updateHighlightsViewCurrentTime](self, "_updateHighlightsViewCurrentTime");
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  void *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_highlightColor;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[UIColor isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_highlightColor, a3);
    -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlightColor:", v8);
LABEL_4:

  }
}

- (void)setCurrentTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentTime;
  CMTime time1;

  p_currentTime = &self->_currentTime;
  time1 = *(CMTime *)a3;
  currentTime = self->_currentTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_currentTime->epoch = a3->var3;
    *(_OWORD *)&p_currentTime->value = v6;
    -[PUVideoHighlightStripTileViewController _updateHighlightsViewCurrentTime](self, "_updateHighlightsViewCurrentTime");
  }
}

- (void)_updateHighlightsViewCurrentTime
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  -[PUVideoHighlightStripTileViewController currentTime](self, "currentTime");
  -[PUVideoHighlightStripTileViewController highlightsView](self, "highlightsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = v7;
  objc_msgSend(v3, "setCurrentTime:", &v4);

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVideoHighlightStripTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUVideoHighlightStripTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PUVideoHighlightStripTileViewController assetViewModel](self, "assetViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if ((objc_msgSend(v9, "highlightTimeRangesChanged") & 1) != 0
      || (objc_msgSend(v9, "videoPlayerDidChange") & 1) != 0
      || (objc_msgSend(v9, "videoPlayerChange"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      -[PUVideoHighlightStripTileViewController _updateHighlightsView](self, "_updateHighlightsView");
    }
  }

}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (a3)
  {
    objc_msgSend(a3, "currentTime");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
  }
  v5 = v7;
  v6 = v8;
  -[PUVideoHighlightStripTileViewController setCurrentTime:](self, "setCurrentTime:", &v5);
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (a3)
  {
    objc_msgSend(a3, "desiredSeekTime");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
  }
  v5 = v7;
  v6 = v8;
  -[PUVideoHighlightStripTileViewController setCurrentTime:](self, "setCurrentTime:", &v5);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (_PUVideoHighlightStripView)highlightsView
{
  return self->_highlightsView;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_highlightsView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

id __64__PUVideoHighlightStripTileViewController__updateHighlightsView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[3];
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = a2;
  v4 = v3;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v5 = *(void **)(a1 + 32);
  if (!v3)
  {
    memset(v9, 0, sizeof(v9));
    if (v5)
      goto LABEL_3;
LABEL_5:
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    goto LABEL_6;
  }
  objc_msgSend(v3, "CMTimeRangeValue");
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "scaledTimeRangeForOriginalTimeRange:", v9);
LABEL_6:
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)preferredTileHeight
{
  return 5.0;
}

@end
