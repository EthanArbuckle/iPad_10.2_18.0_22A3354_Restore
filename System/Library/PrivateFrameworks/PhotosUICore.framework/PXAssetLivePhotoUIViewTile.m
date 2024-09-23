@implementation PXAssetLivePhotoUIViewTile

- (void)becomeReusable
{
  -[PXAssetLivePhotoUIViewTile _setPlayerItem:](self, "_setPlayerItem:", 0);
  -[ISLivePhotoUIView setHidden:](self->_livePhotoView, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[ISLivePhotoUIView setHidden:](self->_livePhotoView, "setHidden:", 0);
}

- (UIView)view
{
  ISLivePhotoUIView *livePhotoView;
  id v4;
  ISLivePhotoUIView *v5;
  ISLivePhotoUIView *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  livePhotoView = self->_livePhotoView;
  if (!livePhotoView)
  {
    v4 = objc_alloc(MEMORY[0x1E0D78270]);
    v5 = (ISLivePhotoUIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_livePhotoView;
    self->_livePhotoView = v5;

    -[ISLivePhotoUIView setAutoresizingMask:](self->_livePhotoView, "setAutoresizingMask:", 18);
    +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "showBordersOnAnimatedContent");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "CGColor");
      -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBorderColor:", v10);

      -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderWidth:", 4.0);

    }
    -[PXAssetLivePhotoUIViewTile _updateLivePhotoView](self, "_updateLivePhotoView");
    livePhotoView = self->_livePhotoView;
  }
  return (UIView *)livePhotoView;
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *v6;
  char v7;
  void *v8;
  PXImageRequester *v9;

  v9 = (PXImageRequester *)a3;
  v5 = self->_imageRequester;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXImageRequester isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      -[PXImageRequester mediaProvider](self->_imageRequester, "mediaProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancelImageRequest:", self->_livePhotoRequestID);

      objc_storeStrong((id *)&self->_imageRequester, a3);
      self->_livePhotoRequestID = 0;
      -[PXAssetLivePhotoUIViewTile _requestLivePhotoIfNeeded](self, "_requestLivePhotoIfNeeded");
      -[PXAssetLivePhotoUIViewTile _updateLivePhotoView](self, "_updateLivePhotoView");
    }
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXAssetLivePhotoUIViewTile _updateLivePhotoView](self, "_updateLivePhotoView");
  }
}

- (void)_updateLivePhotoView
{
  ISLivePhotoPlayer *v3;
  ISLivePhotoPlayer *livePhotoPlayer;
  ISLivePhotoPlayer *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[PXAssetLivePhotoUIViewTile _playerItem](self, "_playerItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!self->_livePhotoPlayer)
    {
      v3 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E0D78268]);
      livePhotoPlayer = self->_livePhotoPlayer;
      self->_livePhotoPlayer = v3;

      -[ISLivePhotoPlayer setAudioEnabled:](self->_livePhotoPlayer, "setAudioEnabled:", 0);
      -[ISLivePhotoUIView setPlayer:](self->_livePhotoView, "setPlayer:", self->_livePhotoPlayer);
      -[ISLivePhotoPlayer setPlayerItem:](self->_livePhotoPlayer, "setPlayerItem:", v13);
      -[ISLivePhotoPlayer startPlaybackWithStyleWhenReady:](self->_livePhotoPlayer, "startPlaybackWithStyleWhenReady:", 4);
    }
  }
  else
  {
    -[ISLivePhotoUIView setPlayer:](self->_livePhotoView, "setPlayer:", 0);
    v5 = self->_livePhotoPlayer;
    self->_livePhotoPlayer = 0;

  }
  -[PXAssetLivePhotoUIViewTile cornerRadius](self, "cornerRadius");
  if (v6 <= 0.0)
  {
    -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 0.0);
  }
  else
  {
    -[PXAssetLivePhotoUIViewTile cornerRadius](self, "cornerRadius");
    v8 = v7;
    -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", v8);

    v10 = *MEMORY[0x1E0CD2A68];
    -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerCurve:", v10);

    -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);
  }

}

- (void)_setPlayerItem:(id)a3
{
  ISPlayerItem *v5;
  ISPlayerItem *v6;

  v5 = (ISPlayerItem *)a3;
  if (self->__playerItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__playerItem, a3);
    -[PXAssetLivePhotoUIViewTile _updateLivePhotoView](self, "_updateLivePhotoView");
    v5 = v6;
  }

}

- (void)_requestLivePhotoIfNeeded
{
  void *v3;
  void *v4;
  PXLivePhotoRequestOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  _QWORD v14[5];
  id v15[2];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id location;

  -[PXAssetLivePhotoUIViewTile imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "cancelImageRequest:", self->_livePhotoRequestID);
    v5 = objc_alloc_init(PXLivePhotoRequestOptions);
    -[PXLivePhotoRequestOptions setNetworkAccessAllowed:](v5, "setNetworkAccessAllowed:", 1);
    -[PXLivePhotoRequestOptions setDeliveryMode:](v5, "setDeliveryMode:", 1);
    objc_initWeak(&location, self);
    v6 = (void *)(self->_requestCount + 1);
    self->_requestCount = (unint64_t)v6;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[PXAssetLivePhotoUIViewTile imageRequester](self, "imageRequester");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetLivePhotoUIViewTile _targetSize](self, "_targetSize");
    v10 = v9;
    v12 = v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke;
    v14[3] = &unk_1E5132278;
    objc_copyWeak(v15, &location);
    v15[1] = v6;
    v14[4] = &v16;
    v13 = objc_msgSend(v4, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v8, 1, v5, v14, v10, v12);

    v17[3] = v13;
    self->_livePhotoRequestID = v13;
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXAssetLivePhotoUIViewTile _setPlayerItem:](self, "_setPlayerItem:", 0);
  }

}

- (CGSize)_targetSize
{
  double v2;
  double v3;
  CGSize result;

  if (_targetSize_onceToken != -1)
    dispatch_once(&_targetSize_onceToken, &__block_literal_global_180570);
  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5 expectedRequestID:(int64_t)a6
{
  id v10;
  id v11;
  int64_t livePhotoRequestID;
  void *v14;
  void *v15;
  double Seconds;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  CMTime time;

  v10 = a3;
  v11 = a4;
  if (self->_requestCount == a5)
  {
    livePhotoRequestID = self->_livePhotoRequestID;
    if (livePhotoRequestID == a6 && livePhotoRequestID != 0)
    {
      if (v10)
      {
        objc_msgSend(v10, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "videoAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "photoTime");
        Seconds = CMTimeGetSeconds(&time);
        objc_msgSend(v14, "imageOrientation");
        v17 = PLExifOrientationFromImageOrientation();
        objc_msgSend(v10, "targetSize");
        v20 = v19;
        v21 = v18;
        if (v19 == *MEMORY[0x1E0C9D820] && v18 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "bounds");
          objc_msgSend(v23, "scale");
          PXSizeScale();
          if (v24 >= v25)
            v21 = v24;
          else
            v21 = v25;

          v20 = v21;
        }
        v26 = objc_msgSend(v10, "hasPhotoColorAdjustments");
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78260]), "initWithVideoAsset:UIImage:photoTime:photoEXIFOrientation:options:", v15, v14, v17, v26, Seconds);
        objc_msgSend(MEMORY[0x1E0D78278], "playerItemWithAsset:targetSize:", v27, v20, v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "videoComposition");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setVideoComposition:", v29);

      }
      else
      {
        v28 = 0;
      }
      -[PXAssetLivePhotoUIViewTile _setPlayerItem:](self, "_setPlayerItem:", v28);

    }
  }

}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

void __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[2];

  v5 = a2;
  v6 = a3;
  v8 = v5;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v7 = v6;
  v9[1] = *(id *)(a1 + 48);
  px_dispatch_on_main_queue();

  objc_destroyWeak(v9);
}

void __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetLivePhotoUIViewTile _requestLivePhotoIfNeeded]_block_invoke_2");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXAssetLivePhotoUIViewTile.m"), 143, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("pxLivePhoto"), v6, v7);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleLivePhotoResult:info:expectedRequestCount:expectedRequestID:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

@end
