@implementation PXAssetLoopUIViewTile

- (PXAssetLoopUIViewTile)init
{
  PXAssetLoopUIViewTile *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetLoopUIViewTile;
  result = -[PXAssetLoopUIViewTile init](&v3, sel_init);
  if (result)
    result->_desiredPlayState = 1;
  return result;
}

- (void)becomeReusable
{
  -[_PXAssetLoopUIView setHidden:](self->_view, "setHidden:", 1);
  -[PXAssetLoopUIViewTile setImageRequester:](self, "setImageRequester:", 0);
  -[PXAssetLoopUIViewTile setVideoSession:](self, "setVideoSession:", 0);
  self->_desiredPlayState = 1;
}

- (void)prepareForReuse
{
  -[_PXAssetLoopUIView setHidden:](self->_view, "setHidden:", 0);
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXVideoSessionUIView setContentsRect:](self->_videoView, "setContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  -[PXAssetLoopUIViewTile setDesiredContentsRect:](self, "setDesiredContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  -[PXAssetLoopUIViewTile setContentSize:](self, "setContentSize:", a3->contentSize.width, a3->contentSize.height);
  -[PXAssetLoopUIViewTile _updateImageRequester](self, "_updateImageRequester");
}

- (UIView)view
{
  _PXAssetLoopUIView *view;
  _PXAssetLoopUIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _PXAssetLoopUIView *v9;
  _PXAssetLoopUIView *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PXVideoSessionUIView *v17;
  PXVideoSessionUIView *videoView;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  view = self->_view;
  if (!view)
  {
    objc_initWeak(&location, self);
    v4 = [_PXAssetLoopUIView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[_PXAssetLoopUIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    v10 = self->_view;
    self->_view = v9;

    -[_PXAssetLoopUIView setUserInteractionEnabled:](self->_view, "setUserInteractionEnabled:", 0);
    -[_PXAssetLoopUIView setClipsToBounds:](self->_view, "setClipsToBounds:", 1);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __29__PXAssetLoopUIViewTile_view__block_invoke;
    v23 = &unk_1E5148D30;
    objc_copyWeak(&v24, &location);
    -[_PXAssetLoopUIView setVisibilityChangeHandler:](self->_view, "setVisibilityChangeHandler:", &v20);
    +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance", v20, v21, v22, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "showBordersOnAnimatedContent");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "CGColor");
      -[_PXAssetLoopUIView layer](self->_view, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBorderColor:", v14);

      -[_PXAssetLoopUIView layer](self->_view, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderWidth:", 4.0);

    }
    v17 = -[PXVideoSessionUIView initWithFrame:]([PXVideoSessionUIView alloc], "initWithFrame:", v5, v6, v7, v8);
    videoView = self->_videoView;
    self->_videoView = v17;

    -[PXVideoSessionUIView setAutoresizingMask:](self->_videoView, "setAutoresizingMask:", 18);
    -[PXAssetLoopUIViewTile _updateLayer](self, "_updateLayer");
    -[_PXAssetLoopUIView addSubview:](self->_view, "addSubview:", self->_videoView);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    view = self->_view;
  }
  return (UIView *)view;
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  char v6;
  void *v7;
  void *v8;
  PXImageRequester *v9;

  v9 = (PXImageRequester *)a3;
  v5 = self->_imageRequester;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = -[PXImageRequester isEqual:](v9, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      -[PXVideoSession contentProvider](self->_videoSession, "contentProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelLoading");

      -[PXImageRequester unregisterChangeObserver:context:](self->_imageRequester, "unregisterChangeObserver:context:", self, ImageRequesterContext);
      objc_storeStrong((id *)&self->_imageRequester, a3);
      -[PXImageRequester registerChangeObserver:context:](self->_imageRequester, "registerChangeObserver:context:", self, ImageRequesterContext);
      -[PXImageRequester image](self->_imageRequester, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXVideoSessionUIView setPlaceholderImage:](self->_videoView, "setPlaceholderImage:", v8);

      -[PXAssetLoopUIViewTile _updateImageRequester](self, "_updateImageRequester");
      -[PXAssetLoopUIViewTile _reloadVideoSessionIfNecessary](self, "_reloadVideoSessionIfNecessary");
    }
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXAssetLoopUIViewTile _updateLayer](self, "_updateLayer");
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    -[PXAssetLoopUIViewTile _updateVideoSession](self, "_updateVideoSession");
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[10];

  v6 = a4;
  v9 = a3;
  if ((void *)ImageRequesterContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      v14[5] = MEMORY[0x1E0C809B0];
      v14[6] = 3221225472;
      v14[7] = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke;
      v14[8] = &unk_1E5149198;
      v14[9] = self;
      px_dispatch_on_main_queue();
    }
    if ((v6 & 1) != 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v10 = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_2;
      v11 = v14;
      goto LABEL_9;
    }
  }
  else
  {
    if ((void *)VideoSessionContext_37309 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetLoopUIViewTile.m"), 172, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 4) != 0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v10 = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_3;
      v11 = &v13;
LABEL_9:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E5149198;
      v11[4] = (uint64_t)self;
      px_dispatch_on_main_queue();
    }
  }

}

- (void)_updateLayer
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PXAssetLoopUIViewTile cornerRadius](self, "cornerRadius");
  if (v3 <= 0.0)
  {
    -[_PXAssetLoopUIView layer](self->_view, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 0.0);
  }
  else
  {
    -[PXAssetLoopUIViewTile cornerRadius](self, "cornerRadius");
    v5 = v4;
    -[_PXAssetLoopUIView layer](self->_view, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", v5);

    v7 = *MEMORY[0x1E0CD2A68];
    -[_PXAssetLoopUIView layer](self->_view, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerCurve:", v7);

    -[_PXAssetLoopUIView layer](self->_view, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);
  }

}

- (void)_updateImageRequester
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[12];

  -[PXAssetLoopUIViewTile contentSize](self, "contentSize");
  v4 = v3;
  v6 = v5;
  -[PXAssetLoopUIViewTile desiredContentsRect](self, "desiredContentsRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXVideoSessionUIView bounds](self->_videoView, "bounds");
  v16 = v15;
  v18 = v17;
  -[PXAssetLoopUIViewTile imageRequester](self, "imageRequester");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__PXAssetLoopUIViewTile__updateImageRequester__block_invoke;
  v20[3] = &__block_descriptor_96_e35_v16__0___PXMutableImageRequester__8l;
  v20[4] = v4;
  v20[5] = v6;
  v20[6] = v8;
  v20[7] = v10;
  v20[8] = v12;
  v20[9] = v14;
  v20[10] = v16;
  v20[11] = v18;
  objc_msgSend(v19, "performChanges:", v20);

}

- (void)_updateVideoSession
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[PXAssetLoopUIViewTile desiredPlayState](self, "desiredPlayState");
  -[PXAssetLoopUIViewTile videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3 == 1)
  {
    if (!v4)
    {
      -[PXAssetLoopUIViewTile _reloadVideoSessionIfNecessary](self, "_reloadVideoSessionIfNecessary");
      goto LABEL_7;
    }
    v5 = &__block_literal_global_2155;
  }
  else
  {
    v5 = &__block_literal_global_10;
  }
  objc_msgSend(v4, "performChanges:withPresentationContext:presenter:", v5, 0, 0);
LABEL_7:

}

- (void)_reloadVideoSessionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXVideoSessionManagerDisplayAssetOptions *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  PXAssetLoopUIViewTile *v17;
  _OWORD v18[6];

  -[PXAssetLoopUIViewTile imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAssetLoopUIViewTile imageRequester](self, "imageRequester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    -[PXAssetLoopUIViewTile view](self, "view");
    v8 = (PXVideoSessionManagerDisplayAssetOptions *)objc_claimAutoreleasedReturnValue();
    -[PXVideoSessionManagerDisplayAssetOptions window](v8, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PXAssetLoopUIViewTile view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isHidden"))
      {

LABEL_9:
        v7 = 0;
        goto LABEL_10;
      }
      v10 = -[PXAssetLoopUIViewTile desiredPlayState](self, "desiredPlayState");

      if (v10 != 1)
        goto LABEL_9;
      v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
      -[PXVideoSessionManagerDisplayAssetOptions setShouldStabilizeLivePhotosIfPossible:](v8, "setShouldStabilizeLivePhotosIfPossible:", 1);
      -[PXVideoSessionManagerDisplayAssetOptions setShouldCrossfadeLivePhotosWhenLooping:](v8, "setShouldCrossfadeLivePhotosWhenLooping:", 1);
      -[PXAssetLoopUIViewTile bestPlaybackTimeRange](self, "bestPlaybackTimeRange");
      v18[0] = v18[3];
      v18[1] = v18[4];
      v18[2] = v18[5];
      -[PXVideoSessionManagerDisplayAssetOptions setLivePhotoLoopTimeRange:](v8, "setLivePhotoLoopTimeRange:", v18);
      +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "videoSessionForAsset:withOptions:mediaProvider:", v4, v8, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __55__PXAssetLoopUIViewTile__reloadVideoSessionIfNecessary__block_invoke;
      v15 = &unk_1E51162C0;
      v16 = v4;
      v17 = self;
      objc_msgSend(v7, "performChanges:withPresentationContext:presenter:", &v12, 0, 0);
      objc_msgSend(v7, "loadIfNeededWithPriority:", 0, v12, v13, v14, v15);

    }
  }
LABEL_10:
  -[PXAssetLoopUIViewTile setVideoSession:](self, "setVideoSession:", v7);

}

- (void)_updateDesiredDynamicRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  -[PXAssetLoopUIViewTile imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "mediaSubtypes") & 0x100000) != 0)
  {
    -[PXAssetLoopUIViewTile videoSession](self, "videoSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "playState");

    -[PXAssetLoopUIViewTile view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = 1065361605;
    if (v5 != 3)
      *(float *)&v9 = 1.0;
    objc_msgSend(v8, "setDesiredDynamicRange:", v9);

  }
}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v5;
  void *v6;
  _QWORD v7[5];

  v5 = (PXVideoSession *)a3;
  if (self->_videoSession != v5)
  {
    +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkInVideoSession:", self->_videoSession);

    -[PXVideoSession unregisterChangeObserver:context:](self->_videoSession, "unregisterChangeObserver:context:", self, VideoSessionContext_37309);
    objc_storeStrong((id *)&self->_videoSession, a3);
    -[PXVideoSession registerChangeObserver:context:](self->_videoSession, "registerChangeObserver:context:", self, VideoSessionContext_37309);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PXAssetLoopUIViewTile_setVideoSession___block_invoke;
    v7[3] = &unk_1E511E318;
    v7[4] = self;
    -[PXVideoSession performChanges:withPresentationContext:presenter:](v5, "performChanges:withPresentationContext:presenter:", v7, 0, 0);
    -[PXVideoSessionUIView setVideoSession:](self->_videoView, "setVideoSession:", v5);
    -[PXAssetLoopUIViewTile _updateDesiredDynamicRange](self, "_updateDesiredDynamicRange");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInVideoSession:", self->_videoSession);

  v4.receiver = self;
  v4.super_class = (Class)PXAssetLoopUIViewTile;
  -[PXAssetLoopUIViewTile dealloc](&v4, sel_dealloc);
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestPlaybackTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setBestPlaybackTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestPlaybackTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_bestPlaybackTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_bestPlaybackTimeRange.start.value = v3;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (CGRect)desiredContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_desiredContentsRect.origin.x;
  y = self->_desiredContentsRect.origin.y;
  width = self->_desiredContentsRect.size.width;
  height = self->_desiredContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDesiredContentsRect:(CGRect)a3
{
  self->_desiredContentsRect = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

void __41__PXAssetLoopUIViewTile_setVideoSession___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setVolume:withFade:", 1, v3);
  objc_msgSend(v4, "setAudioSessionCategory:mode:routeSharingPolicy:options:", *MEMORY[0x1E0C89660], *MEMORY[0x1E0C89748], 0, 0);
  objc_msgSend(v4, "setDesiredPlayState:", objc_msgSend(*(id *)(a1 + 32), "desiredPlayState") == 1);

}

void __55__PXAssetLoopUIViewTile__reloadVideoSessionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  __int128 v5;
  __int128 *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = a2;
  objc_msgSend(v3, "setLoopingEnabled:", 1);
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setVolume:withFade:", 1, v4);
  if (objc_msgSend(*(id *)(a1 + 32), "playbackStyle") == 3)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v8 = *MEMORY[0x1E0CA2E40];
    v9 = v5;
    v10 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v6 = &v8;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "bestPlaybackTimeRange");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }
    v11 = v14;
    v12 = v15;
    v13 = v16;
    v6 = &v11;
  }
  objc_msgSend(v3, "setPlaybackTimeRange:", v6, v8, v9, v10, v11, v12, v13);

}

uint64_t __44__PXAssetLoopUIViewTile__updateVideoSession__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 0);
}

uint64_t __44__PXAssetLoopUIViewTile__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 1);
}

void __46__PXAssetLoopUIViewTile__updateImageRequester__block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);

}

void __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "imageRequester");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPlaceholderImage:", v3);

  objc_msgSend(*(id *)(a1 + 32), "imageRequester");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsRect");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setContentsRect:");

}

uint64_t __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadVideoSessionIfNecessary");
}

uint64_t __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDesiredDynamicRange");
}

void __29__PXAssetLoopUIViewTile_view__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadVideoSessionIfNecessary");

}

@end
