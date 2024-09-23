@implementation PXLivePhotoViewModulator

- (PXLivePhotoViewModulator)initWithImageModulator:(id)a3 videoModulator:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  PXLivePhotoViewModulator *v9;
  PXLivePhotoViewModulator *v10;
  PXLivePhotoViewModulator *v11;
  objc_super v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PXLivePhotoViewModulator;
    v9 = -[PXLivePhotoViewModulator init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_imageModulator, a3);
      objc_storeStrong((id *)&v10->_videoModulator, a4);
      v10->_gainMapImage = PXImageCreateBlackPlaceholderImageWithSize();
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PXLivePhotoViewModulator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLivePhotoViewModulator.m"), 62, CFSTR("%s is not available as initializer"), "-[PXLivePhotoViewModulator init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoViewModulator;
  -[PXLivePhotoViewModulator dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, PXLivePhotoViewModulator *))a3 + 2))(a3, self);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXLivePhotoViewModulator _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)prepareForReuse
{
  double v3;

  -[PXLivePhotoViewModulator setLivePhotoView:](self, "setLivePhotoView:", 0);
  -[PXLivePhotoViewModulator setGainMapImage:](self, "setGainMapImage:", 0);
  LODWORD(v3) = 0;
  -[PXLivePhotoViewModulator setGainMapValue:](self, "setGainMapValue:", v3);
}

- (void)setLivePhotoView:(id)a3
{
  ISLivePhotoUIView *v6;
  ISLivePhotoUIView *livePhotoView;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  PXLivePhotoViewModulator *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  ISLivePhotoUIView *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (ISLivePhotoUIView *)a3;
  livePhotoView = self->_livePhotoView;
  if (livePhotoView != v6)
  {
    -[ISLivePhotoUIView unregisterChangeObserver:](livePhotoView, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_livePhotoView, a3);
    -[ISLivePhotoUIView registerChangeObserver:](v6, "registerChangeObserver:", self);
    if (v6)
      v8 = -[ISLivePhotoUIView isDisplayingPhoto](v6, "isDisplayingPhoto") ^ 1;
    else
      v8 = 0;
    -[PXLivePhotoViewModulator setDisplayingVideoComplement:](self, "setDisplayingVideoComplement:", v8);
    -[PXLivePhotoViewModulator _invalidateInput](self, "_invalidateInput");
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "[LivePhotoViewModulator %p] %@ %@", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (void)setDisplayingVideoComplement:(BOOL)a3
{
  if (self->_displayingVideoComplement != a3)
  {
    self->_displayingVideoComplement = a3;
    -[PXLivePhotoViewModulator _invalidateInput](self, "_invalidateInput");
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  -[PXLivePhotoViewModulator setGainMapImage:animated:](self, "setGainMapImage:animated:", a3, 0);
}

- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4
{
  CGImage *gainMapImage;
  _BOOL8 v6;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    v6 = a4;
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    -[PXLivePhotoViewModulator setAnimateGainMapAppearance:](self, "setAnimateGainMapAppearance:", v6);
    -[PXLivePhotoViewModulator _invalidateGainMapImage](self, "_invalidateGainMapImage");
  }
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PXLivePhotoViewModulator _invalidateInput](self, "_invalidateInput");
  }
}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    -[PXLivePhotoViewModulator _invalidateInput](self, "_invalidateInput");
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.input || self->_needsUpdateFlags.gainMapImage;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLivePhotoViewModulator.m"), 162, CFSTR("neither insider -performChanges: block, nor performing updates"));

  }
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXLivePhotoViewModulator _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXLivePhotoViewModulator _updateInput](self, "_updateInput");
    -[PXLivePhotoViewModulator _updateGainMapImage](self, "_updateGainMapImage");
    -[PXLivePhotoViewModulator setAnimateGainMapAppearance:](self, "setAnimateGainMapAppearance:", 0);
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_invalidateInput
{
  self->_needsUpdateFlags.input = 1;
  -[PXLivePhotoViewModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateInput
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PXLivePhotoViewModulator *v16;
  _QWORD v17[4];
  id v18;
  PXLivePhotoViewModulator *v19;

  if (self->_needsUpdateFlags.input)
  {
    self->_needsUpdateFlags.input = 0;
    -[PXLivePhotoViewModulator livePhotoView](self, "livePhotoView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customPhotoView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v3, "photoView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_msgSend(v3, "videoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoViewModulator imageModulator](self, "imageModulator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__PXLivePhotoViewModulator__updateInput__block_invoke;
    v17[3] = &unk_1E5127590;
    v18 = v7;
    v19 = self;
    v11 = v7;
    objc_msgSend(v9, "performChanges:", v17);

    -[PXLivePhotoViewModulator videoModulator](self, "videoModulator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __40__PXLivePhotoViewModulator__updateInput__block_invoke_2;
    v14[3] = &unk_1E5127590;
    v15 = v8;
    v16 = self;
    v13 = v8;
    objc_msgSend(v12, "performChanges:", v14);

  }
}

- (void)_invalidateGainMapImage
{
  self->_needsUpdateFlags.gainMapImage = 1;
  -[PXLivePhotoViewModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGainMapImage
{
  void *v3;
  _QWORD v4[5];

  if (self->_needsUpdateFlags.gainMapImage)
  {
    self->_needsUpdateFlags.gainMapImage = 0;
    -[PXLivePhotoViewModulator imageModulator](self, "imageModulator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__PXLivePhotoViewModulator__updateGainMapImage__block_invoke;
    v4[3] = &unk_1E51275B8;
    v4[4] = self;
    objc_msgSend(v3, "performChanges:", v4);

  }
}

- (void)basePlayerUIView:(id)a3 didChange:(unint64_t)a4 withAnimationDuration:(double)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  char v17;
  _QWORD v18[5];
  char v19;
  uint8_t buf[4];
  PXLivePhotoViewModulator *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v21 = self;
    v22 = 2112;
    v23 = v10;
    v24 = 2048;
    v25 = a4;
    v26 = 2048;
    v27 = a5;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "[LivePhotoViewModulator %p] %@ %li %f", buf, 0x2Au);

  }
  if ((a4 & 1) != 0)
  {
    -[PXLivePhotoViewModulator livePhotoView](self, "livePhotoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDisplayingPhoto") ^ 1;

    -[PXLivePhotoViewModulator imageModulator](self, "imageModulator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke;
    v18[3] = &__block_descriptor_41_e40_v16__0___PXMutableImageLayerModulator__8l;
    v19 = v12;
    *(double *)&v18[4] = a5;
    objc_msgSend(v13, "performChanges:", v18);

    -[PXLivePhotoViewModulator videoModulator](self, "videoModulator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke_2;
    v16[3] = &__block_descriptor_41_e40_v16__0___PXMutableImageLayerModulator__8l;
    v17 = v12;
    *(double *)&v16[4] = a5;
    objc_msgSend(v15, "performChanges:", v16);

  }
}

- (ISLivePhotoUIView)livePhotoView
{
  return self->_livePhotoView;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (BOOL)revealsGainMapImage
{
  return self->_revealsGainMapImage;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (BOOL)displayingVideoComplement
{
  return self->_displayingVideoComplement;
}

- (PXImageLayerModulator)imageModulator
{
  return self->_imageModulator;
}

- (PXImageLayerModulator)videoModulator
{
  return self->_videoModulator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoModulator, 0);
  objc_storeStrong((id *)&self->_imageModulator, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

void __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setDisplayingVideoComplement:", v3);
  objc_msgSend(v4, "animateChangesWithDuration:", *(double *)(a1 + 32));

}

void __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setDisplayingVideoComplement:", v3);
  objc_msgSend(v4, "animateChangesWithDuration:", *(double *)(a1 + 32));

}

void __47__PXLivePhotoViewModulator__updateGainMapImage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setGainMapImage:animated:", objc_msgSend(v3, "gainMapImage"), objc_msgSend(*(id *)(a1 + 32), "animateGainMapAppearance"));

}

void __40__PXLivePhotoViewModulator__updateInput__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayer:", v4);

  objc_msgSend(*(id *)(a1 + 40), "gainMapValue");
  objc_msgSend(v5, "setGainMapValue:");
  objc_msgSend(v5, "setRevealsGainMapImage:", objc_msgSend(*(id *)(a1 + 40), "revealsGainMapImage"));
  objc_msgSend(v5, "setDisplayingVideoComplement:", objc_msgSend(*(id *)(a1 + 40), "displayingVideoComplement"));

}

void __40__PXLivePhotoViewModulator__updateInput__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayer:", v4);

  objc_msgSend(v5, "setDisplayingVideoComplement:", objc_msgSend(*(id *)(a1 + 40), "displayingVideoComplement"));
}

@end
