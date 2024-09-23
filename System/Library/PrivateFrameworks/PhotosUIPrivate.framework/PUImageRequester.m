@implementation PUImageRequester

- (PUImageRequester)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageRequester.m"), 76, CFSTR("%s is not available as initializer"), "-[PUImageRequester init]");

  abort();
}

- (PUImageRequester)initWithMediaProvider:(id)a3 asset:(id)a4 requiresFullQualityImage:(BOOL)a5
{
  id v10;
  id v11;
  PUImageRequester *v12;
  uint64_t v13;
  NSHashTable *observers;
  uint64_t v15;
  PXEventCoalescer *fullSizeDataRepeatRequestCoalescer;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUImageRequester;
  v12 = -[PUImageRequester init](&v20, sel_init);
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v13 = objc_claimAutoreleasedReturnValue();
        observers = v12->_observers;
        v12->_observers = (NSHashTable *)v13;

        objc_storeStrong((id *)&v12->_mediaProvider, a3);
        objc_storeStrong((id *)&v12->_asset, a4);
        *(_WORD *)&v12->_useLowMemoryMode = 256;
        v12->_requiresFullQualityImage = a5;
        *(_QWORD *)&v12->_currentFullSizeImageDataRequestID = 0;
        objc_msgSend(MEMORY[0x1E0D7CCF0], "rateLimitingCoalescerWithRate:", 2.0);
        v15 = objc_claimAutoreleasedReturnValue();
        fullSizeDataRepeatRequestCoalescer = v12->_fullSizeDataRepeatRequestCoalescer;
        v12->_fullSizeDataRepeatRequestCoalescer = (PXEventCoalescer *)v15;

        -[PXEventCoalescer registerObserver:](v12->_fullSizeDataRepeatRequestCoalescer, "registerObserver:", v12);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PUImageRequester.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PUImageRequester.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PUImageRequester;
  -[PUImageRequester dealloc](&v3, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageRequester.m"), 110, CFSTR("observer does not conform to PUImageRequesterObserver: %@"), v7);

  }
  -[PUImageRequester observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

}

- (void)unregisterObserver:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUImageRequester observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageRequester.m"), 118, CFSTR("Attempting to remove unknown observer: "), v7);

  }
  objc_msgSend(v5, "removeObject:", v7);

}

- (void)performChanges:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageRequester.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changes != NULL"));

  }
  -[PUImageRequester _willChange](self, "_willChange");
  v6[2]();
  -[PUImageRequester _didChange](self, "_didChange");

}

- (void)_invalidateImageRequest
{
  -[PUImageRequester _setNeedsUpdate:](self, "_setNeedsUpdate:", 1);
}

- (void)updateIfNeeded
{
  if (-[PUImageRequester _needsUpdate](self, "_needsUpdate"))
  {
    -[PUImageRequester _setNeedsUpdate:](self, "_setNeedsUpdate:", 0);
    -[PUImageRequester _update](self, "_update");
  }
}

- (void)_willChange
{
  -[PUImageRequester _setChangeCount:](self, "_setChangeCount:", -[PUImageRequester _changeCount](self, "_changeCount") + 1);
}

- (void)_didChange
{
  int64_t v3;

  v3 = -[PUImageRequester _changeCount](self, "_changeCount") - 1;
  -[PUImageRequester _setChangeCount:](self, "_setChangeCount:", v3);
  if (!v3)
    -[PUImageRequester updateIfNeeded](self, "updateIfNeeded");
}

- (void)_assertInsideChangesBlock
{
  id v4;

  if (-[PUImageRequester _changeCount](self, "_changeCount") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageRequester.m"), 162, CFSTR("not within a change block"));

  }
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;

  v5 = (PUDisplayAsset *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (self->_asset != v5)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    -[PUImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }

}

- (void)setTargetSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (width != self->_targetSize.width || height != self->_targetSize.height)
  {
    self->_targetSize.width = width;
    self->_targetSize.height = height;
    -[PUImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)setRequestFullSizeImageDataUTTypes:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;

  v8 = (NSArray *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  v5 = self->_requestFullSizeImageDataUTTypes;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_requestFullSizeImageDataUTTypes, a3);
      -[PUImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
    }
  }

}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  if (self->_networkAccessAllowed != a3)
  {
    self->_networkAccessAllowed = a3;
    -[PUImageRequester cancelAllImageRequests](self, "cancelAllImageRequests");
  }
}

- (void)setIncludeGainMap:(BOOL)a3
{
  if (self->_includeGainMap != a3)
  {
    self->_includeGainMap = a3;
    -[PUImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)setRequestHDR:(BOOL)a3
{
  if (self->_requestHDR != a3)
  {
    self->_requestHDR = a3;
    -[PUImageRequester _invalidateImageRequest](self, "_invalidateImageRequest");
  }
}

- (void)handlePreloadedImage:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "size");
  -[PUImageRequester image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  if ((PFSizeLargerThanSize() & 1) != 0 || -[PUImageRequester imageIsPlaceholder](self, "imageIsPlaceholder"))
  {
    v5 = -[PUImageRequester imageIsFullQuality](self, "imageIsFullQuality");

    if (!v5)
    {
      -[PUImageRequester setImageIsPlaceholder:](self, "setImageIsPlaceholder:", 0);
      -[PUImageRequester setImage:](self, "setImage:", v6);
    }
  }
  else
  {

  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PUImageRequester _invalidateResult](self, "_invalidateResult");
  }

}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;
  char v7;
  NSError *v8;

  v8 = (NSError *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  v5 = self->_error;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v8;
    v7 = -[NSError isEqual:](v6, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      -[PUImageRequester _invalidateResult](self, "_invalidateResult");
    }
  }

}

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;

  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    -[PUImageRequester _invalidateResult](self, "_invalidateResult");
  }
}

- (void)setGainMapValue:(float)a3
{
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PUImageRequester _invalidateResult](self, "_invalidateResult");
  }
}

- (void)setImageIsFullQuality:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;

  v3 = a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (self->_imageIsFullQuality != v3)
  {
    self->_imageIsFullQuality = v3;
    objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canShowInternalUI");

    if (v6)
      -[PUImageRequester _produceDebugImage](self, "_produceDebugImage");
    -[PUImageRequester _invalidateResult](self, "_invalidateResult");
  }
}

- (void)setFullSizeImageData:(id)a3
{
  NSData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSData *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (self->_fullSizeImageData != v5)
  {
    objc_storeStrong((id *)&self->_fullSizeImageData, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PUImageRequester observers](self, "observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "imageRequesterDidUpdateFullSizeImageData:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setFullSizeImageURL:(id)a3
{
  NSURL *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSURL *)a3;
  -[PUImageRequester _assertInsideChangesBlock](self, "_assertInsideChangesBlock");
  if (self->_fullSizeImageURL != v5)
  {
    objc_storeStrong((id *)&self->_fullSizeImageURL, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PUImageRequester observers](self, "observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "imageRequesterDidUpdateFullSizeImageData:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_invalidateResult
{
  -[PUImageRequester _setNeedsUpdate:](self, "_setNeedsUpdate:", 1);
}

- (void)_update
{
  void *v2;
  void *v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  double v21;
  double v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  int v31;
  _BOOL4 v32;
  int v33;
  _BOOL8 v34;
  int v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  void *v44;
  int v45;
  void *v46;
  id *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, void *, void *, void *, void *);
  void *v53;
  uint64_t *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[4];
  id v59;
  uint64_t *v60;
  id v61[3];
  id location;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;

  -[PUImageRequester asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageRequester targetSize](self, "targetSize");
  v8 = v7;
  v9 = v6;
  if (v7 == *MEMORY[0x1E0C9D820] && v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PUImageRequester cancelAllImageRequests](self, "cancelAllImageRequests");
    goto LABEL_46;
  }
  -[PUImageRequester requestFullSizeImageDataUTTypes](self, "requestFullSizeImageDataUTTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[PUImageRequester fullSizeImageData](self, "fullSizeImageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      -[PUImageRequester fullSizeImageURL](self, "fullSizeImageURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14 == 0;

    }
  }
  else
  {
    v13 = 0;
  }

  -[PUImageRequester fullSizeImageData](self, "fullSizeImageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PUImageRequester currentFullSizeImageDataRequestID](self, "currentFullSizeImageDataRequestID");
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    -[PUImageRequester fullSizeImageData](self, "fullSizeImageData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v17 = 0;
    }
    else
    {
      -[PUImageRequester fullSizeImageURL](self, "fullSizeImageURL");
      v49 = objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        v19 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v3 = (void *)v49;
      v17 = 1;
    }
  }
  -[PUImageRequester image](self, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 != 0;

  if (v17)
  if (!v16)
    goto LABEL_19;
LABEL_20:
  v20 = v15 == 0;
  -[PUImageRequester _lastRequestedImageSize](self, "_lastRequestedImageSize");
  if (v8 > v22 || v9 > v21)
  {
    -[PUImageRequester image](self, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v24, "scale");
    v30 = v9 > v28 * v29;
    if (v8 > v26 * v29)
      v30 = 1;
    if (v24)
      v31 = v30;
    else
      v31 = 1;
    if (-[PUImageRequester includeGainMap](self, "includeGainMap"))
      v32 = -[PUImageRequester gainMapImage](self, "gainMapImage") == 0;
    else
      v32 = 0;
    v23 = v31 | v32;

  }
  else
  {
    v23 = 0;
  }
  v33 = v20 & ~v19;
  v34 = -[PUImageRequester useLowMemoryMode](self, "useLowMemoryMode");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v35 = objc_msgSend(v5, "needsDeferredProcessing");
  else
    v35 = 1;
  v36 = -[PUImageRequester includeGainMap](self, "includeGainMap") & v35;
  if ((v33 & v23) == 1)
  {
    v37 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v37, "setAllowPlaceholder:", 1);
    objc_msgSend(v37, "setNetworkAccessAllowed:", -[PUImageRequester isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    objc_msgSend(v37, "setAllowSecondaryDegradedImage:", 1);
    objc_msgSend(v37, "setUseLowMemoryMode:", v34);
    objc_msgSend(v37, "setDeliveryMode:", -[PUImageRequester requiresFullQualityImage](self, "requiresFullQualityImage"));
    objc_msgSend(v37, "setIncludeHDRGainMap:", -[PUImageRequester includeGainMap](self, "includeGainMap"));
    objc_msgSend(v37, "setIncludeHDRGainMapInIntermediateImage:", v36);
    objc_msgSend(v37, "setPreferHDR:", -[PUImageRequester requestHDR](self, "requestHDR"));
    -[PUImageRequester targetHDRHeadroom](self, "targetHDRHeadroom");
    objc_msgSend(v37, "setTargetHDRHeadroom:");
    objc_msgSend(v37, "setDownloadIntent:", 3);
    objc_msgSend(v37, "setDownloadPriority:", -[PUImageRequester highPriorityRequest](self, "highPriorityRequest") ^ 1);
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v38 = -[PUImageRequester _currentImageRequestID](self, "_currentImageRequestID");
    -[PUImageRequester mediaProvider](self, "mediaProvider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cancelImageRequest:", v38);

    -[PUImageRequester _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", *((unsigned int *)v64 + 6));
    -[PUImageRequester _setLastRequestedImageSize:](self, "_setLastRequestedImageSize:", v8, v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageRequester setCurrentRequestStartDate:](self, "setCurrentRequestStartDate:", v40);

    objc_initWeak(&location, self);
    -[PUImageRequester mediaProvider](self, "mediaProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __27__PUImageRequester__update__block_invoke;
    v58[3] = &unk_1E589FFC8;
    objc_copyWeak(v61, &location);
    v60 = &v63;
    v59 = v5;
    v61[1] = *(id *)&v8;
    v61[2] = *(id *)&v9;
    v42 = objc_msgSend(v41, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v59, 1, v37, v58, v8, v9);
    *((_DWORD *)v64 + 6) = v42;

    -[PUImageRequester _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", *((unsigned int *)v64 + 6));
    objc_destroyWeak(v61);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v63, 8);

  }
  if (v13)
  {
    v43 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v43, "setNetworkAccessAllowed:", -[PUImageRequester isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    objc_msgSend(v43, "setUseLowMemoryMode:", v34);
    objc_msgSend(v43, "setIncludeHDRGainMap:", -[PUImageRequester includeGainMap](self, "includeGainMap"));
    objc_msgSend(v43, "setIncludeHDRGainMapInIntermediateImage:", v36);
    objc_msgSend(v43, "setDownloadIntent:", 3);
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "enableFigPhotoTiledLayer");
    if ((objc_msgSend(v44, "forceURLWithFigPhotoTiledLayer") & 1) != 0)
    {
      if (v45)
      {
LABEL_40:
        objc_initWeak(&location, self);
        objc_msgSend(v43, "setDeliveryMode:", 1);
        -[PUImageRequester mediaProvider](self, "mediaProvider");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __27__PUImageRequester__update__block_invoke_3;
        v56[3] = &unk_1E58A0018;
        v47 = &v57;
        objc_copyWeak(&v57, &location);
        v56[4] = &v63;
        v48 = objc_msgSend(v46, "requestImageURLForAsset:options:resultHandler:", v5, v43, v56);
LABEL_45:
        *((_DWORD *)v64 + 6) = v48;

        objc_destroyWeak(v47);
        objc_destroyWeak(&location);
        -[PUImageRequester setCurrentFullSizeImageDataRequestID:](self, "setCurrentFullSizeImageDataRequestID:", *((unsigned int *)v64 + 6));

        _Block_object_dispose(&v63, 8);
        goto LABEL_46;
      }
    }
    else if (v45
           && objc_msgSend(v44, "useURLForLargePhotosWithFigPhotoTiledLayer")
           && (unint64_t)objc_msgSend(v5, "originalFilesize") > 0x3200000)
    {
      goto LABEL_40;
    }
    objc_initWeak(&location, self);
    -[PUImageRequester mediaProvider](self, "mediaProvider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = __27__PUImageRequester__update__block_invoke_5;
    v53 = &unk_1E58A0068;
    v47 = &v55;
    objc_copyWeak(&v55, &location);
    v54 = &v63;
    v48 = objc_msgSend(v46, "requestImageDataForAsset:options:resultHandler:", v5, v43, &v50);
    goto LABEL_45;
  }
LABEL_46:
  -[PUImageRequester _updateResult](self, "_updateResult", v50, v51, v52, v53);

}

- (void)_updateResult
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _PUImageRequesterResult *v9;

  v9 = objc_alloc_init(_PUImageRequesterResult);
  -[PUImageRequester currentRequestStartDate](self, "currentRequestStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    -[_PUImageRequesterResult setTimeIntervalSinceRequest:](v9, "setTimeIntervalSinceRequest:", v6);
  }
  -[PUImageRequester imageTargetSize](self, "imageTargetSize");
  -[_PUImageRequesterResult setTargetSize:](v9, "setTargetSize:");
  -[PUImageRequester image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult setImage:](v9, "setImage:", v7);

  -[_PUImageRequesterResult setImageIsFullQuality:](v9, "setImageIsFullQuality:", -[PUImageRequester imageIsFullQuality](self, "imageIsFullQuality"));
  -[_PUImageRequesterResult setGainMapImage:](v9, "setGainMapImage:", -[PUImageRequester gainMapImage](self, "gainMapImage"));
  -[PUImageRequester gainMapValue](self, "gainMapValue");
  -[_PUImageRequesterResult setGainMapValue:](v9, "setGainMapValue:");
  -[PUImageRequester imageAsset](self, "imageAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult setAsset:](v9, "setAsset:", v8);

  -[PUImageRequester setResult:](self, "setResult:", v9);
}

- (void)setResult:(id)a3
{
  PUImageRequesterResult *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  PUImageRequester *v18;
  __int16 v19;
  PUImageRequesterResult *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (PUImageRequesterResult *)a3;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%@ produced result: %@", buf, 0x16u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PUImageRequester observers](self, "observers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "imageRequester:didProduceResult:", self, v5);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)cancelAllImageRequests
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = -[PUImageRequester _currentImageRequestID](self, "_currentImageRequestID");
  if ((_DWORD)v3)
  {
    v4 = v3;
    -[PUImageRequester mediaProvider](self, "mediaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelImageRequest:", v4);

    -[PUImageRequester _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", 0);
  }
  v6 = -[PUImageRequester currentFullSizeImageDataRequestID](self, "currentFullSizeImageDataRequestID");
  if ((_DWORD)v6)
  {
    v7 = v6;
    -[PUImageRequester mediaProvider](self, "mediaProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelImageRequest:", v7);

    -[PUImageRequester setCurrentFullSizeImageDataRequestID:](self, "setCurrentFullSizeImageDataRequestID:", 0);
  }
}

- (void)_handleResultOfImageRequestWithID:(int)a3 asset:(id)a4 targetSize:(CGSize)a5 image:(id)a6 info:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  PUImageRequester *v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  char v26;

  height = a5.height;
  width = a5.width;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (-[PUImageRequester _currentImageRequestID](self, "_currentImageRequestID") == a3)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C50]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "BOOLValue") ^ 1;

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__PUImageRequester__handleResultOfImageRequestWithID_asset_targetSize_image_info___block_invoke;
    v19[3] = &unk_1E58A0090;
    v20 = v14;
    v21 = self;
    v26 = v17;
    v22 = v15;
    v23 = v13;
    v24 = width;
    v25 = height;
    -[PUImageRequester performChanges:](self, "performChanges:", v19);
    -[PUImageRequester _update](self, "_update");

  }
}

- (void)_handleResultOfFullSizeImageDataRequestWithID:(int)a3 imageData:(id)a4 imageURL:(id)a5 dataUTI:(id)a6 orientation:(int64_t)a7 info:(id)a8
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  v14 = a6;
  if (-[PUImageRequester currentFullSizeImageDataRequestID](self, "currentFullSizeImageDataRequestID") == a3)
  {
    -[PUImageRequester setCurrentFullSizeImageDataRequestID:](self, "setCurrentFullSizeImageDataRequestID:", 0);
    if (v12 | v13)
    {
      v28 = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[PUImageRequester requestFullSizeImageDataUTTypes](self, "requestFullSizeImageDataUTTypes", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
LABEL_8:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v15, "conformsToType:", v21);

          if ((v22 & 1) != 0)
            break;
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v18)
              goto LABEL_8;
            goto LABEL_14;
          }
        }

        if (v12)
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke;
          v31[3] = &unk_1E58ABCA8;
          v31[4] = self;
          v12 = (unint64_t)(id)v12;
          v32 = (id)v12;
          -[PUImageRequester performChanges:](self, "performChanges:", v31);

          v13 = (unint64_t)v27;
          v14 = v28;
          goto LABEL_24;
        }
        v14 = v28;
        if (v27)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke_2;
          v29[3] = &unk_1E58ABCA8;
          v29[4] = self;
          v13 = v27;
          v30 = (id)v13;
          -[PUImageRequester performChanges:](self, "performChanges:", v29);

          goto LABEL_23;
        }
      }
      else
      {
LABEL_14:

        v23 = objc_msgSend(v15, "conformsToType:", *MEMORY[0x1E0CEC5B8]);
        PLOneUpGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v14 = v28;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[PUImageRequester asset](self, "asset");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v28;
          v39 = 2112;
          v40 = v25;
          _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_ERROR, "got non-supported data %@ for %@", buf, 0x16u);

        }
        if (v23)
        {
          -[PUImageRequester fullSizeDataRepeatRequestCoalescer](self, "fullSizeDataRepeatRequestCoalescer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "inputEvent");

        }
      }
    }
    v13 = 0;
LABEL_23:
    v12 = 0;
  }
LABEL_24:

}

- (void)_produceDebugImage
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  double x;
  double y;
  double width;
  double height;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  PUImageRequester *v106;
  void *v108;
  id obj;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v116 = *MEMORY[0x1E0C80C00];
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUImageRequester imageIsFullQuality](self, "imageIsFullQuality")
    || (objc_msgSend(v3, "showSaliencyRects") & 1) == 0
    && (objc_msgSend(v3, "showFacesRect") & 1) == 0
    && (objc_msgSend(v3, "showFacesTorsosRects") & 1) == 0
    && (objc_msgSend(v3, "showWallpaperCropRect") & 1) == 0
    && !objc_msgSend(v3, "showGazeRects"))
  {
    goto LABEL_60;
  }
  -[PUImageRequester asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_60;
  -[PUImageRequester asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageRequester image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  v11 = v10;
  v12 = v7;
  v13 = v12;
  if (objc_msgSend(v3, "showSaliencyRects"))
  {
    objc_msgSend(v6, "preferredCropRect");
    v13 = v12;
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v14, v15, v16, v17))
    {
      PXRectFlippedVertically();
      PXRectDenormalize();
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_debugImageWithStrokeRect:color:text:", v26, CFSTR("Preferred"), v19, v21, v23, v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "acceptableCropRect");
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v27, v28, v29, v30))
    {
      PXRectFlippedVertically();
      PXRectDenormalize();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v39, CFSTR("Acceptable"), v32, v34, v36, v38);
      v40 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v40;
    }
  }
  if (objc_msgSend(v3, "showFacesRect"))
  {
    objc_msgSend(v6, "normalizedFaceAreaRect");
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v41, v42, v43, v44))
    {
      PXRectDenormalize();
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v53, CFSTR("Faces Area"), v46, v48, v50, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "showPaddedFacesRect");

      if (v56)
      {
        PXRectScaleFromCenter();
        v120.origin.x = 0.0;
        v120.origin.y = 0.0;
        v120.size.width = v9;
        v120.size.height = v11;
        v118 = CGRectIntersection(v117, v120);
        x = v118.origin.x;
        y = v118.origin.y;
        width = v118.size.width;
        height = v118.size.height;
        objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "px_debugImageWithStrokeRect:color:text:", v61, CFSTR("Scaled Faces Area"), x, y, width, height);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = v54;
      }
    }
  }
  if (objc_msgSend(v3, "showBestSquareRect"))
  {
    objc_msgSend(v6, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 2, 1.0);
    if (__38__PUImageRequester__produceDebugImage__block_invoke(v62, v63, v64, v65))
    {
      PXRectDenormalize();
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v74, CFSTR("Best Square Crop Rect"), v67, v69, v71, v73);
      v75 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v75;
    }
  }
  if ((objc_msgSend(v3, "showFacesTorsosRects") & 1) == 0 && !objc_msgSend(v3, "showGazeRects"))
    goto LABEL_57;
  objc_msgSend(v6, "photoLibrary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "librarySpecificFetchOptions");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v77, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setIncludedDetectionTypes:", v78);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v6, v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v79, "count"))
    goto LABEL_56;
  v103 = v77;
  v104 = v12;
  v105 = v6;
  v106 = self;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v102 = v79;
  obj = v79;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
  if (!v80)
    goto LABEL_55;
  v81 = v80;
  v110 = 0;
  v82 = *(_QWORD *)v112;
  v108 = v3;
  do
  {
    for (i = 0; i != v81; ++i)
    {
      if (*(_QWORD *)v112 != v82)
        objc_enumerationMutation(obj);
      v84 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      if (objc_msgSend(v3, "showFacesTorsosRects"))
      {
        objc_msgSend(v84, "centerX");
        if (v85 <= 0.0)
        {
          objc_msgSend(v84, "bodyCenterX");
          if (v94 > 0.0)
          {
            objc_msgSend(v84, "bodyCenterY");
            goto LABEL_44;
          }
        }
        else
        {
          objc_msgSend(v84, "centerY");
          v87 = v86;
          objc_msgSend(v84, "bodyCenterX");
          if (v88 <= 0.0)
          {
            if (v87 > 0.0)
            {
              v90 = 0;
              goto LABEL_41;
            }
          }
          else
          {
            objc_msgSend(v84, "bodyCenterY");
            v90 = v89 > 0.0;
            if (v87 > 0.0 && v89 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FT%d"), v110 + i);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = 1;
              goto LABEL_42;
            }
            if (v87 > 0.0)
            {
LABEL_41:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("F%d"), v110 + i);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = 0;
LABEL_42:
              objc_msgSend(v84, "size");
              objc_msgSend(v84, "centerX");
              objc_msgSend(v84, "centerX");
              objc_msgSend(v84, "centerY");
              objc_msgSend(v84, "centerY");
              PXRectWithEdges();
              PXRectDenormalize();
              objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v92, v91);
              v95 = objc_claimAutoreleasedReturnValue();

              v13 = (void *)v95;
              if (!v90)
              {
LABEL_49:

                v13 = (void *)v95;
                v3 = v108;
                goto LABEL_50;
              }
LABEL_46:
              objc_msgSend(v84, "bodyHeight");
              objc_msgSend(v84, "bodyWidth");
              objc_msgSend(v84, "bodyCenterX");
              objc_msgSend(v84, "bodyCenterX");
              objc_msgSend(v84, "bodyCenterY");
              objc_msgSend(v84, "bodyCenterY");
              PXRectWithEdges();
              PXRectDenormalize();
              objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v93, v91);
              v96 = v13;
              v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_48:

              v95 = (uint64_t)v13;
              goto LABEL_49;
            }
LABEL_44:
            if (v89 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("T%d"), v110 + i);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = 0;
              goto LABEL_46;
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "localIdentifier");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, v106, CFSTR("PUImageRequester.m"), 637, CFSTR("Face %@ is missing face and torso"), v97);

        v91 = 0;
        v92 = 0;
        v93 = 0;
        goto LABEL_48;
      }
LABEL_50:
      if (objc_msgSend(v3, "showGazeRects"))
      {
        objc_msgSend(v84, "gazeRect");
        v121.origin.x = -1.0;
        v121.origin.y = -1.0;
        v121.size.width = -1.0;
        v121.size.height = -1.0;
        if (!CGRectEqualToRect(v119, v121))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("G%d"), v110 + i);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "gazeRect");
          PXRectFlippedVertically();
          PXRectDenormalize();
          objc_msgSend(v13, "px_debugImageWithStrokeRect:color:text:", v99, v98);
          v100 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v100;
        }
      }
    }
    v110 += i;
    v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
  }
  while (v81);
LABEL_55:

  self = v106;
  v12 = v104;
  v6 = v105;
  v79 = v102;
  v77 = v103;
LABEL_56:

LABEL_57:
  if (objc_msgSend(v3, "showWallpaperCropRect"))
  {
    -[PUImageRequester imageByAddingWallpaperCropRectDiagnosticsForAsset:sourceImage:](self, "imageByAddingWallpaperCropRectDiagnosticsForAsset:sourceImage:", v6, v13);
    v101 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v101;
  }
  -[PUImageRequester setImage:](self, "setImage:", v13);

LABEL_60:
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (NSArray)requestFullSizeImageDataUTTypes
{
  return self->_requestFullSizeImageDataUTTypes;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)requiresFullQualityImage
{
  return self->_requiresFullQualityImage;
}

- (NSData)fullSizeImageData
{
  return self->_fullSizeImageData;
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (BOOL)highPriorityRequest
{
  return self->_highPriorityRequest;
}

- (void)setHighPriorityRequest:(BOOL)a3
{
  self->_highPriorityRequest = a3;
}

- (BOOL)includeGainMap
{
  return self->_includeGainMap;
}

- (BOOL)requestHDR
{
  return self->_requestHDR;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (PUImageRequesterResult)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (UIImage)image
{
  return self->_image;
}

- (PUDisplayAsset)imageAsset
{
  return self->_imageAsset;
}

- (void)setImageAsset:(id)a3
{
  objc_storeStrong((id *)&self->_imageAsset, a3);
}

- (CGSize)imageTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageTargetSize.width;
  height = self->_imageTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageTargetSize:(CGSize)a3
{
  self->_imageTargetSize = a3;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (BOOL)imageIsPlaceholder
{
  return self->_imageIsPlaceholder;
}

- (void)setImageIsPlaceholder:(BOOL)a3
{
  self->_imageIsPlaceholder = a3;
}

- (BOOL)imageIsFullQuality
{
  return self->_imageIsFullQuality;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)_setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int64_t)_changeCount
{
  return self->__changeCount;
}

- (void)_setChangeCount:(int64_t)a3
{
  self->__changeCount = a3;
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (void)_setNeedsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

- (int)currentFullSizeImageDataRequestID
{
  return self->_currentFullSizeImageDataRequestID;
}

- (void)setCurrentFullSizeImageDataRequestID:(int)a3
{
  self->_currentFullSizeImageDataRequestID = a3;
}

- (CGSize)_lastRequestedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__lastRequestedImageSize.width;
  height = self->__lastRequestedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setLastRequestedImageSize:(CGSize)a3
{
  self->__lastRequestedImageSize = a3;
}

- (int)_currentImageRequestID
{
  return self->__currentImageRequestID;
}

- (void)_setCurrentImageRequestID:(int)a3
{
  self->__currentImageRequestID = a3;
}

- (NSDate)currentRequestStartDate
{
  return self->_currentRequestStartDate;
}

- (void)setCurrentRequestStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestStartDate, a3);
}

- (PXEventCoalescer)fullSizeDataRepeatRequestCoalescer
{
  return self->_fullSizeDataRepeatRequestCoalescer;
}

- (void)setFullSizeDataRepeatRequestCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizeDataRepeatRequestCoalescer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullSizeDataRepeatRequestCoalescer, 0);
  objc_storeStrong((id *)&self->_currentRequestStartDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_fullSizeImageData, 0);
  objc_storeStrong((id *)&self->_requestFullSizeImageDataUTTypes, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

BOOL __38__PUImageRequester__produceDebugImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;
  CGRect v10;

  if (CGRectIsNull(*(CGRect *)&a1))
    return 0;
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectIsInfinite(v9))
    return 0;
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return !CGRectIsEmpty(v10);
}

uint64_t __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFullSizeImageData:", *(_QWORD *)(a1 + 40));
}

uint64_t __110__PUImageRequester__handleResultOfFullSizeImageDataRequestWithID_imageData_imageURL_dataUTI_orientation_info___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFullSizeImageURL:", *(_QWORD *)(a1 + 40));
}

void __82__PUImageRequester__handleResultOfImageRequestWithID_asset_targetSize_image_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "image");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 32), "size");
      objc_msgSend(*(id *)(a1 + 40), "image");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      if ((PFSizeLargerThanSize() & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "imageIsPlaceholder") & 1) != 0)
      {

      }
      else
      {
        if (!*(_BYTE *)(a1 + 80))
        {

          goto LABEL_7;
        }
        v8 = objc_msgSend(*(id *)(a1 + 40), "imageIsFullQuality");

        if ((v8 & 1) != 0)
          goto LABEL_8;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PHImageResultIsPlaceholderKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 40), "setImageIsPlaceholder:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setImage:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setImageAsset:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "setImageTargetSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setGainMapImage:", v7);

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C00]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    objc_msgSend(*(id *)(a1 + 40), "setGainMapValue:");
LABEL_7:

LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "setImageIsFullQuality:", *(unsigned __int8 *)(a1 + 80));
  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setError:", v9);

}

void __27__PUImageRequester__update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __27__PUImageRequester__update__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__PUImageRequester__update__block_invoke_4;
  v10[3] = &unk_1E589FFF0;
  v11 = v6;
  v7 = v6;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __27__PUImageRequester__update__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21[2];

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __27__PUImageRequester__update__block_invoke_6;
  v16[3] = &unk_1E58A0040;
  objc_copyWeak(v21, (id *)(a1 + 40));
  v12 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v18 = v10;
  v21[1] = a4;
  v19 = v11;
  v20 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(v21);
}

void __27__PUImageRequester__update__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleResultOfFullSizeImageDataRequestWithID:imageData:imageURL:dataUTI:orientation:info:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));

}

void __27__PUImageRequester__update__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C20]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleResultOfFullSizeImageDataRequestWithID:imageData:imageURL:dataUTI:orientation:info:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0, *(_QWORD *)(a1 + 40), v5, v3, *(_QWORD *)(a1 + 32));

}

void __27__PUImageRequester__update__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleResultOfImageRequestWithID:asset:targetSize:image:info:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

- (id)imageByAddingWallpaperCropRectDiagnosticsForAsset:(id)a3 sourceImage:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;

  v5 = a3;
  v6 = a4;
  PFDeviceScreenSize();
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "size");
  objc_msgSend(v5, "pixelWidth");
  objc_msgSend(v5, "pixelHeight");
  v49 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized();
  v46 = v10;
  v47 = v8;
  objc_msgSend(v5, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v49, v8, v10, v11, v12, v13, v14);
  if (__38__PUImageRequester__produceDebugImage__block_invoke(v15, v16, v17, v18))
  {
    PXRectNormalize();
    PXRectDenormalize();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper w/ FocusRegion %.3f"), v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_debugImageWithStrokeRect:color:text:", v28, v27, v20, v22, v24, v26);
    v29 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v29;
  }
  v48 = 0;
  objc_msgSend(v5, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v48, v47, v46, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  if (__38__PUImageRequester__produceDebugImage__block_invoke(v30, v31, v32, v33))
  {
    PXRectNormalize();
    PXRectDenormalize();
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper %.3f"), v48);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_debugImageWithStrokeRect:color:text:", v43, v42, v35, v37, v39, v41);
    v44 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v44;
  }

  return v6;
}

@end
