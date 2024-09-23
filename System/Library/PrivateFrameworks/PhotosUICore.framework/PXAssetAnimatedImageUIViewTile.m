@implementation PXAssetAnimatedImageUIViewTile

- (PXAssetAnimatedImageUIViewTile)init
{
  PXAssetAnimatedImageUIViewTile *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetAnimatedImageUIViewTile;
  result = -[PXAssetAnimatedImageUIViewTile init](&v3, sel_init);
  if (result)
    result->_desiredPlayState = 1;
  return result;
}

- (void)becomeReusable
{
  -[PXAssetAnimatedImageUIViewTile setImageRequester:](self, "setImageRequester:", 0);
  -[PXAssetAnimatedImageUIViewTile _setAnimatedImage:](self, "_setAnimatedImage:", 0);
  -[ISAnimatedImageView setHidden:](self->_animatedImageView, "setHidden:", 1);
  self->_desiredPlayState = 1;
}

- (void)prepareForReuse
{
  -[ISAnimatedImageView setHidden:](self->_animatedImageView, "setHidden:", 0);
}

- (UIView)view
{
  ISAnimatedImageView *animatedImageView;
  ISAnimatedImageView *v4;
  ISAnimatedImageView *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  animatedImageView = self->_animatedImageView;
  if (!animatedImageView)
  {
    v4 = (ISAnimatedImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78258]), "initWithAnimatedImage:", 0);
    v5 = self->_animatedImageView;
    self->_animatedImageView = v4;

    -[ISAnimatedImageView setContentMode:](self->_animatedImageView, "setContentMode:", 2);
    -[ISAnimatedImageView setClipsToBounds:](self->_animatedImageView, "setClipsToBounds:", 1);
    -[ISAnimatedImageView setUserInteractionEnabled:](self->_animatedImageView, "setUserInteractionEnabled:", 0);
    +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showBordersOnAnimatedContent");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "CGColor");
      -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderColor:", v9);

      -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBorderWidth:", 4.0);

    }
    -[PXAssetAnimatedImageUIViewTile _updateAnimatedImageView](self, "_updateAnimatedImageView");
    animatedImageView = self->_animatedImageView;
  }
  return (UIView *)animatedImageView;
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  char v6;
  void *v7;
  PXImageRequester *v8;

  v8 = (PXImageRequester *)a3;
  v5 = self->_imageRequester;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = -[PXImageRequester isEqual:](v8, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      -[PXImageRequester mediaProvider](self->_imageRequester, "mediaProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelImageRequest:", self->_animatedImageRequestID);

      objc_storeStrong((id *)&self->_imageRequester, a3);
      self->_animatedImageRequestID = 0;
      -[PXAssetAnimatedImageUIViewTile _requestAnimatedImageIfNeeded](self, "_requestAnimatedImageIfNeeded");
    }
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXAssetAnimatedImageUIViewTile _updateAnimatedImageView](self, "_updateAnimatedImageView");
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    -[PXAssetAnimatedImageUIViewTile _updateAnimatedImageView](self, "_updateAnimatedImageView");
  }
}

- (void)_updateAnimatedImageView
{
  void *v3;
  ISAnimatedImageView *animatedImageView;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[PXAssetAnimatedImageUIViewTile _animatedImage](self, "_animatedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  animatedImageView = self->_animatedImageView;
  if (v3)
  {
    -[ISAnimatedImageView player](animatedImageView, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0D78250]);
      -[PXAssetAnimatedImageUIViewTile _animatedImage](self, "_animatedImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pf_animatedImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithAnimatedImage:", v8);

      objc_msgSend(v9, "setAllowFrameDrops:", 0);
      -[ISAnimatedImageView setPlayer:](self->_animatedImageView, "setPlayer:", v9);

    }
    v10 = -[PXAssetAnimatedImageUIViewTile desiredPlayState](self, "desiredPlayState") == 1;
  }
  else
  {
    -[ISAnimatedImageView setPlayer:](animatedImageView, "setPlayer:", 0);
    v10 = 0;
  }
  -[ISAnimatedImageView setPlaying:](self->_animatedImageView, "setPlaying:", v10);
  -[PXAssetAnimatedImageUIViewTile cornerRadius](self, "cornerRadius");
  if (v11 <= 0.0)
  {
    -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 0.0);
  }
  else
  {
    -[PXAssetAnimatedImageUIViewTile cornerRadius](self, "cornerRadius");
    v13 = v12;
    -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v13);

    v15 = *MEMORY[0x1E0CD2A68];
    -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", v15);

    -[ISAnimatedImageView layer](self->_animatedImageView, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupOpacity:", 0);
  }

}

- (void)_requestAnimatedImageIfNeeded
{
  void *v4;
  void *v5;
  PXAnimatedImageRequestOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11[3];
  id location;

  -[PXAssetAnimatedImageUIViewTile imageRequester](self, "imageRequester");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "cancelImageRequest:", self->_animatedImageRequestID);
    v6 = objc_alloc_init(PXAnimatedImageRequestOptions);
    -[PXAnimatedImageRequestOptions setVersion:](v6, "setVersion:", 2);
    -[PXAnimatedImageRequestOptions setDeliveryMode:](v6, "setDeliveryMode:", 1);
    -[PXAnimatedImageRequestOptions setNetworkAccessAllowed:](v6, "setNetworkAccessAllowed:", 0);
    -[PXAnimatedImageRequestOptions setAllowPreCaching:](v6, "setAllowPreCaching:", 0);
    -[PXAnimatedImageRequestOptions setUseSharedImageDecoding:](v6, "setUseSharedImageDecoding:", 1);
    objc_initWeak(&location, self);
    v7 = (void *)(self->_requestCount + 1);
    self->_requestCount = (unint64_t)v7;
    -[PXAssetAnimatedImageUIViewTile imageRequester](self, "imageRequester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke;
    v10[3] = &unk_1E5121678;
    v11[1] = (id)a2;
    v10[4] = self;
    objc_copyWeak(v11, &location);
    v11[2] = v7;
    self->_animatedImageRequestID = objc_msgSend(v5, "requestAnimatedImageForAsset:options:resultHandler:", v9, v6, v10);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXAssetAnimatedImageUIViewTile _setAnimatedImage:](self, "_setAnimatedImage:", 0);
  }

}

- (void)_handleAnimatedImageResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_requestCount == a5 && self->_animatedImageRequestID)
  {
    if (!v8)
    {
      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch animated image with error: %@", (uint8_t *)&v12, 0xCu);

      }
    }
    self->_animatedImageRequestID = 0;
    -[PXAssetAnimatedImageUIViewTile _setAnimatedImage:](self, "_setAnimatedImage:", v8);
  }

}

- (void)_setAnimatedImage:(id)a3
{
  PHAnimatedImage *v5;
  PHAnimatedImage *v6;

  v5 = (PHAnimatedImage *)a3;
  if (self->__animatedImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__animatedImage, a3);
    -[PXAssetAnimatedImageUIViewTile _updateAnimatedImageView](self, "_updateAnimatedImageView");
    v5 = v6;
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

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestPlaybackTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
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

- (PHAnimatedImage)_animatedImage
{
  return self->__animatedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animatedImage, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_animatedImageView, 0);
}

void __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[3];

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v9[1] = a1[6];
  objc_copyWeak(v9, a1 + 5);
  v8 = v6;
  v9[2] = a1[7];
  px_dispatch_on_main_queue();

  objc_destroyWeak(v9);
}

void __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = *(id *)(a1 + 32);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 64);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("PXAssetAnimatedImageUIViewTile.m"), 155, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("result"), v7, v8);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAnimatedImageResult:info:expectedRequestCount:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));

}

@end
