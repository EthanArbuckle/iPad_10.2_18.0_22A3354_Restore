@implementation PXImageRequester

- (PXImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PXImageRequester *v9;
  PXImageRequester *v10;
  void *v11;
  double v12;
  CGSize v13;
  CGSize v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXImageRequester;
  v9 = -[PXImageRequester init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v10->_scale = v12;

    v13 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    v10->_contentsRect.origin = *(CGPoint *)off_1E50B86D0;
    v10->_contentsRect.size = v13;
    v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v10->_cropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v10->_cropRect.size = v14;
    v10->_viewportSize = (CGSize)*MEMORY[0x1E0C9D820];
  }

  return v10;
}

- (PXImageRequester)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageRequester.m"), 107, CFSTR("init is unavailable, use designated initializer"));

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PXImageRequester _cancelRequests](self, "_cancelRequests");
  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  -[PXImageRequester dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  -[PXImageRequester performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageRequester;
  -[PXImageRequester didPerformChanges](&v3, sel_didPerformChanges);
  -[PXImageRequester _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  if (-[PXImageRequester _needsUpdate](self, "_needsUpdate"))
  {
    -[PXImageRequester _updateTargetSizeIfNeeded](self, "_updateTargetSizeIfNeeded");
    -[PXImageRequester _updateImageRequestIfNeeded](self, "_updateImageRequestIfNeeded");
    -[PXImageRequester _updateIsInCloudIfNeeded](self, "_updateIsInCloudIfNeeded");
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.targetSize || self->_needsUpdateFlags.imageRequest || self->_needsUpdateFlags.isInCloud;
}

- (void)_invalidateTargetSize
{
  self->_needsUpdateFlags.targetSize = 1;
}

- (void)_updateTargetSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;

  if (self->_needsUpdateFlags.targetSize)
  {
    self->_needsUpdateFlags.targetSize = 0;
    -[PXImageRequester contentSize](self, "contentSize");
    -[PXImageRequester scale](self, "scale");
    PXSizeScale();
    v4 = v3;
    v6 = v5;
    -[PXImageRequester maximumRequestSize](self, "maximumRequestSize");
    if (*MEMORY[0x1E0C9D820] != v8 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v7)
    {
      -[PXImageRequester maximumRequestSize](self, "maximumRequestSize");
      PXSizeMin();
      v4 = v10;
      v6 = v11;
    }
    -[PXImageRequester _setTargetSize:](self, "_setTargetSize:", round(v4), round(v6));
  }
}

- (void)_invalidateImageRequest
{
  self->_needsUpdateFlags.imageRequest = 1;
}

- (void)_updateImageRequestIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  CGRect *p_cropRect;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  PXImageRequest *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id from;
  id location[2];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  if (self->_needsUpdateFlags.imageRequest)
  {
    self->_needsUpdateFlags.imageRequest = 0;
    -[PXImageRequester _currentRequest](self, "_currentRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageRequester _targetSize](self, "_targetSize");
    v5 = v4;
    v7 = v6;
    -[PXImageRequester asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageRequester mediaProvider](self, "mediaProvider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageRequester image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "px_pixelSize");
    v13 = MEMORY[0x1A85CD5B8](v10, v5, v7, v11, v12);

    if (v3)
    {
      v14 = objc_msgSend(v3, "targetSize");
      HIDWORD(v44) = MEMORY[0x1A85CD5B8](v14, v5, v7, v15, v16);
      if ((objc_msgSend(v3, "isCanceled") & 1) != 0)
      {
        LODWORD(v44) = 0;
      }
      else
      {
        objc_msgSend(v3, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = v17 == 0;

      }
      objc_msgSend(v3, "asset", v44);
    }
    else
    {
      objc_msgSend(0, "asset", 0x100000000);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v8;
      v20 = v18;
      if (v19 == v20)
      {
        v22 = 1;
      }
      else if (v19)
      {
        v21 = objc_msgSend(v19, "isContentEqualTo:", v20);
        if (!v21)
          v21 = objc_msgSend(v20, "isContentEqualTo:", v19);
        v22 = v21 == 2;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
    v23 = v8;
    if (v3)
    {
      objc_msgSend(v3, "options");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "normalizedCropRect");
      v56.origin.x = v25;
      v56.origin.y = v26;
      v56.size.width = v27;
      v56.size.height = v28;
      v29 = CGRectEqualToRect(self->_cropRect, v56);

    }
    else
    {
      v29 = 0;
    }
    v30 = -[PXImageRequester preferHDR](self, "preferHDR");
    objc_msgSend(v3, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "preferHDR");

    v33 = v23;
    if (v30 != v32)
      goto LABEL_22;
    v43 = v22 && v29;
    if (v13)
    {
      if (((HIDWORD(v45) | v45 ^ 1) & 1) != 0 || ((v43 ^ 1) & 1) != 0)
        goto LABEL_22;
    }
    else if ((v43 & 1) == 0)
    {
LABEL_22:
      objc_msgSend(v3, "cancel");
      if ((v5 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8)) && (PXSizeIsNull() & 1) == 0)
      {
        +[PXImageRequester defaultOptions](PXImageRequester, "defaultOptions");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "copy");

        objc_msgSend(v35, "setPreferHDR:", -[PXImageRequester preferHDR](self, "preferHDR"));
        -[PXImageRequester targetHDRHeadroom](self, "targetHDRHeadroom");
        objc_msgSend(v35, "setTargetHDRHeadroom:");
        p_cropRect = &self->_cropRect;
        v37 = *(double *)off_1E50B86D0;
        v38 = *((double *)off_1E50B86D0 + 1);
        v39 = *((double *)off_1E50B86D0 + 2);
        v40 = *((double *)off_1E50B86D0 + 3);
        v57.origin.x = *(CGFloat *)off_1E50B86D0;
        v57.origin.y = v38;
        v57.size.width = v39;
        v57.size.height = v40;
        if (!CGRectEqualToRect(self->_cropRect, v57))
        {
          v54.origin.x = p_cropRect->origin.x;
          v54.origin.y = self->_cropRect.origin.y;
          v54.size.width = self->_cropRect.size.width;
          v54.size.height = self->_cropRect.size.height;
          if (!CGRectEqualToRect(v54, *MEMORY[0x1E0C9D648]))
          {
            objc_msgSend(v35, "setNormalizedCropRect:", p_cropRect->origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
            objc_msgSend(v35, "setResizeMode:", 2);
          }
        }
        objc_msgSend(v35, "setDownloadIntent:", -[PXImageRequester downloadIntent](self, "downloadIntent"));
        if (v5 == v7)
        {
          -[PXImageRequester contentsRect](self, "contentsRect");
          v58.origin.x = v37;
          v58.origin.y = v38;
          v58.size.width = v39;
          v58.size.height = v40;
          if (!CGRectEqualToRect(v55, v58))
            v7 = v7 + 1.0;
        }
        objc_initWeak(location, self);
        v41 = -[PXImageRequest initWithMediaProvider:asset:targetSize:options:]([PXImageRequest alloc], "initWithMediaProvider:asset:targetSize:options:", v46, v33, v35, v5, v7);
        objc_initWeak(&from, v41);
        v42 = MEMORY[0x1E0C809B0];
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke;
        v49[3] = &unk_1E513ED88;
        objc_copyWeak(&v50, location);
        objc_copyWeak(&v51, &from);
        objc_msgSend(v35, "setProgressHandler:", v49);
        -[PXImageRequester _setCurrentRequest:](self, "_setCurrentRequest:", v41);
        -[PXImageRequester _setHasFullQuality:](self, "_setHasFullQuality:", 0);
        v47[0] = v42;
        v47[1] = 3221225472;
        v47[2] = __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke_3;
        v47[3] = &unk_1E513EDB0;
        objc_copyWeak(&v48, location);
        -[PXImageRequest performWithResultHandler:](v41, "performWithResultHandler:", v47);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&v51);
        objc_destroyWeak(&v50);
        objc_destroyWeak(&from);

        objc_destroyWeak(location);
      }
    }

  }
}

- (void)_handleProgressForImageRequest:(id)a3 progress:(double)a4
{
  id v6;
  id v7;
  _QWORD v8[6];

  v6 = a3;
  -[PXImageRequester _currentRequest](self, "_currentRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PXImageRequester__handleProgressForImageRequest_progress___block_invoke;
    v8[3] = &unk_1E513EDD8;
    v8[4] = self;
    *(double *)&v8[5] = a4;
    -[PXImageRequester performChanges:](self, "performChanges:", v8);
  }
}

- (void)_handleResultOfImageRequest:(id)a3 image:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  PXImageRequester *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  -[PXImageRequester asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  if (v11 == v12)
  {

LABEL_9:
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PXImageRequester__handleResultOfImageRequest_image_info___block_invoke;
    v15[3] = &unk_1E5145A98;
    v16 = v7;
    v17 = self;
    v18 = v8;
    -[PXImageRequester performChanges:](self, "performChanges:", v15);

    goto LABEL_11;
  }
  v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_11;
  }
  v14 = objc_msgSend(v11, "isContentEqualTo:", v12);
  if (!v14)
    v14 = objc_msgSend(v13, "isContentEqualTo:", v11);

  if (v14 == 2)
    goto LABEL_9;
LABEL_11:

}

- (void)_invalidateIsInCloud
{
  self->_needsUpdateFlags.isInCloud = 1;
}

- (void)_updateIsInCloudIfNeeded
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (self->_needsUpdateFlags.isInCloud)
  {
    self->_needsUpdateFlags.isInCloud = 0;
    -[PXImageRequester image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (!v3)
    {
      -[PXImageRequester _currentRequest](self, "_currentRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "resultIsInCloud");

      if ((v6 & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[PXImageRequester asset](self, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = PXDisplayAssetIsInCloud(v7);

      }
    }
    -[PXImageRequester _setIsInCloud:](self, "_setIsInCloud:", v4);
  }
}

- (void)setMediaProvider:(id)a3
{
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
    v5 = v6;
  }

}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *asset;
  PXDisplayAsset *v7;
  PXDisplayAsset *v8;
  PXDisplayAsset *v9;
  PXDisplayAsset *v10;
  uint64_t v11;
  PXDisplayAsset *v12;

  v5 = (PXDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    v12 = v5;
    v7 = asset;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXImageRequester signalChange:](self, "signalChange:", 1);
    v8 = v12;
    v9 = v7;
    v10 = v9;
    if (v8 && v9)
    {
      v11 = -[PXDisplayAsset isContentEqualTo:](v8, "isContentEqualTo:", v9);
      if (!v11)
        v11 = -[PXDisplayAsset isContentEqualTo:](v10, "isContentEqualTo:", v8);

      if (v11 == 2)
        goto LABEL_10;
    }
    else
    {

    }
    -[PXImageRequester _cancelRequests](self, "_cancelRequests");
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
LABEL_10:
    -[PXImageRequester _invalidateIsInCloud](self, "_invalidateIsInCloud");

    v5 = v12;
  }

}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    -[PXImageRequester _invalidateTargetSize](self, "_invalidateTargetSize");
    -[PXImageRequester signalChange:](self, "signalChange:", 32);
  }
}

- (void)setPreferHDR:(BOOL)a3
{
  if (self->_preferHDR != a3)
  {
    self->_preferHDR = a3;
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)setTargetHDRHeadroom:(double)a3
{
  if (self->_targetHDRHeadroom != a3)
  {
    self->_targetHDRHeadroom = a3;
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_cropRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(self->_cropRect, a3))
  {
    p_cropRect->origin.x = x;
    p_cropRect->origin.y = y;
    p_cropRect->size.width = width;
    p_cropRect->size.height = height;
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
    -[PXImageRequester signalChange:](self, "signalChange:", 256);
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[PXImageRequester _invalidateTargetSize](self, "_invalidateTargetSize");
    -[PXImageRequester signalChange:](self, "signalChange:", 64);
  }
}

- (void)setMaximumRequestSize:(CGSize)a3
{
  if (self->_maximumRequestSize.width != a3.width || self->_maximumRequestSize.height != a3.height)
  {
    self->_maximumRequestSize = a3;
    -[PXImageRequester _invalidateTargetSize](self, "_invalidateTargetSize");
    -[PXImageRequester signalChange:](self, "signalChange:", 512);
  }
}

- (void)setDesiredContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_desiredContentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_desiredContentsRect = &self->_desiredContentsRect;
  if (!CGRectEqualToRect(self->_desiredContentsRect, a3))
  {
    p_desiredContentsRect->origin.x = x;
    p_desiredContentsRect->origin.y = y;
    p_desiredContentsRect->size.width = width;
    p_desiredContentsRect->size.height = height;
    -[PXImageRequester setContentsRect:](self, "setContentsRect:", x, y, width, height);
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[PXImageRequester signalChange:](self, "signalChange:", 128);
  }
}

- (void)setViewportSize:(CGSize)a3
{
  if (self->_viewportSize.width != a3.width || self->_viewportSize.height != a3.height)
  {
    self->_viewportSize = a3;
    -[PXImageRequester signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setDownloadIntent:(int64_t)a3
{
  if (self->_downloadIntent != a3)
  {
    self->_downloadIntent = a3;
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
    -[PXImageRequester signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)_setLoadingProgress:(double)a3
{
  if (self->_loadingProgress != a3)
  {
    self->_loadingProgress = a3;
    -[PXImageRequester signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setLoadingError:(id)a3
{
  NSError *v5;
  char v6;
  NSError *v7;

  v7 = (NSError *)a3;
  v5 = self->_loadingError;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_loadingError, a3);
      -[PXImageRequester signalChange:](self, "signalChange:", 0x2000);
    }
  }

}

- (void)handlePreloadedImage:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXImageRequester image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "px_isLargerThan:", v4);

  if (v5)
  {
    -[PXImageRequester _setImage:](self, "_setImage:", v7);
    -[PXImageRequester asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageRequester _setCurrentImageSourceAsset:](self, "_setCurrentImageSourceAsset:", v6);

  }
}

- (void)handlePreloadedImageRequester:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PXImageRequester handlePreloadedImage:](self, "handlePreloadedImage:", v4);
    v4 = v5;
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  objc_super v17;
  CGSize v18;
  CGSize v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)PXImageRequester;
  -[PXImageRequester description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequester asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequester contentSize](self, "contentSize");
  NSStringFromCGSize(v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequester scale](self, "scale");
  v8 = v7;
  -[PXImageRequester maximumRequestSize](self, "maximumRequestSize");
  NSStringFromCGSize(v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequester image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXImageRequester hasFullQuality](self, "hasFullQuality");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  v13 = v12;
  -[PXImageRequester _currentRequest](self, "_currentRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ asset:%p contentSize:%@ scale:%f maxSize:%@ image:%@ hasFullQuality:%@ currentRequest:%@>"), v4, v5, v6, v8, v9, v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (void)_setTargetSize:(CGSize)a3
{
  if (self->__targetSize.width != a3.width || self->__targetSize.height != a3.height)
  {
    self->__targetSize = a3;
    -[PXImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)_setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[PXImageRequester signalChange:](self, "signalChange:", 4);
    -[PXImageRequester _invalidateIsInCloud](self, "_invalidateIsInCloud");
    v5 = v6;
  }

}

- (void)_setOpportunisticImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_opportunisticImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_opportunisticImage, a3);
    -[PXImageRequester signalChange:](self, "signalChange:", 2048);
    v5 = v6;
  }

}

- (void)_setHasFullQuality:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_hasFullQuality != a3)
  {
    self->_hasFullQuality = a3;
    if (a3)
    {
      +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "showFacesAreaRect");

      if (v5)
      {
        -[PXImageRequester asset](self, "asset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXImageRequester image](self, "image");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PXDebugImageWithFaceRect(v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXImageRequester _setImage:](self, "_setImage:", v8);
      }
    }
    -[PXImageRequester signalChange:](self, "signalChange:", 8);
  }
}

- (void)_setIsInCloud:(BOOL)a3
{
  if (self->_isInCloud != a3)
  {
    self->_isInCloud = a3;
    -[PXImageRequester signalChange:](self, "signalChange:", 16);
  }
}

- (void)_cancelRequests
{
  id v2;

  -[PXImageRequester _currentRequest](self, "_currentRequest");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
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

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)maximumRequestSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumRequestSize.width;
  height = self->_maximumRequestSize.height;
  result.height = height;
  result.width = width;
  return result;
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

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)opportunisticImage
{
  return self->_opportunisticImage;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)hasFullQuality
{
  return self->_hasFullQuality;
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (PXDisplayAsset)_currentImageSourceAsset
{
  return self->__currentImageSourceAsset;
}

- (void)_setCurrentImageSourceAsset:(id)a3
{
  objc_storeStrong((id *)&self->__currentImageSourceAsset, a3);
}

- (PXImageRequest)_currentRequest
{
  return self->__currentRequest;
}

- (void)_setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->__currentRequest, a3);
}

- (CGSize)_targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->__targetSize.width;
  height = self->__targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentRequest, 0);
  objc_storeStrong((id *)&self->__currentImageSourceAsset, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_opportunisticImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

void __59__PXImageRequester__handleResultOfImageRequest_image_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if ((objc_msgSend(*(id *)(a1 + 32), "gotFullQualityImage") & 1) != 0)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 40), "opportunisticImage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 40), "_setOpportunisticImage:", *(_QWORD *)(a1 + 48));
    goto LABEL_13;
  }
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_currentImageSourceAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_13;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_12;
  }
  v9 = objc_msgSend(v6, "isContentEqualTo:", v7);
  if (!v9)
    v9 = objc_msgSend(v8, "isContentEqualTo:", v6);

  if (v9 != 2)
    goto LABEL_12;
LABEL_13:
  v10 = *(void **)(a1 + 48);
  if (!v10)
    goto LABEL_31;
  objc_msgSend(*(id *)(a1 + 40), "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "px_isLargerThan:", v11) & 1) != 0)
    goto LABEL_28;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_currentImageSourceAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v13;
  v16 = v15;
  if (v14 == v15)
  {

  }
  else
  {
    if (!v14 || !v15)
    {

LABEL_27:
LABEL_28:

      goto LABEL_29;
    }
    v17 = objc_msgSend(v14, "isContentEqualTo:", v15);
    if (!v17)
      v17 = objc_msgSend(v16, "isContentEqualTo:", v14);

    if (v17 != 2)
      goto LABEL_27;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "gotFullQualityImage") & 1) == 0)
  {

    goto LABEL_30;
  }
  v18 = objc_msgSend(*(id *)(a1 + 40), "hasFullQuality");

  if ((v18 & 1) == 0)
  {
LABEL_29:
    objc_msgSend(*(id *)(a1 + 40), "_setImage:", *(_QWORD *)(a1 + 48));
    v19 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setCurrentImageSourceAsset:", v11);
LABEL_30:

  }
LABEL_31:
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_currentRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 == v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setHasFullQuality:", objc_msgSend(*(id *)(a1 + 32), "gotFullQualityImage"));
    objc_msgSend(*(id *)(a1 + 32), "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLoadingError:", v22);

    objc_msgSend(*(id *)(a1 + 40), "_invalidateIsInCloud");
  }
}

uint64_t __60__PXImageRequester__handleProgressForImageRequest_progress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLoadingProgress:", *(double *)(a1 + 40));
}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11[2];

  v8 = a2;
  v9 = a5;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v11);
  objc_destroyWeak(&v10);

}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleResultOfImageRequest:image:info:", v9, v8, v7);

}

void __47__PXImageRequester__updateImageRequestIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleProgressForImageRequest:progress:", v2, *(double *)(a1 + 48));

}

+ (id)defaultOptions
{
  if (defaultOptions_onceToken != -1)
    dispatch_once(&defaultOptions_onceToken, &__block_literal_global_251506);
  return (id)defaultOptions_options;
}

uint64_t __34__PXImageRequester_defaultOptions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)off_1E50B3068);
  v1 = (void *)defaultOptions_options;
  defaultOptions_options = (uint64_t)v0;

  objc_msgSend((id)defaultOptions_options, "setNetworkAccessAllowed:", 1);
  return objc_msgSend((id)defaultOptions_options, "setAllowSecondaryDegradedImage:", 1);
}

@end
