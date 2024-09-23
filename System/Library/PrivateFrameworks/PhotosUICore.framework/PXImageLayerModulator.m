@implementation PXImageLayerModulator

- (PXImageLayerModulator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageLayerModulator.m"), 67, CFSTR("%s is not available as initializer"), "-[PXImageLayerModulator init]");

  abort();
}

- (PXImageLayerModulator)initWithOptions:(id *)a3
{
  PXImageLayerModulator *v4;
  PXImageLayerModulator *v5;
  __int128 v6;
  __int128 v7;
  CGImage *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXImageLayerModulator;
  v4 = -[PXImageLayerModulator init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0;
    v7 = *(_OWORD *)&a3->var2;
    *(_QWORD *)&v4->_options.fallbackHdrGain = *(_QWORD *)&a3->var4;
    *(_OWORD *)&v4->_options.contentFormat = v6;
    *(_OWORD *)&v4->_options.hdrGain = v7;
    v4->_displayingOpaqueContent = 1;
    if (a3->var0 == 2)
    {
      v8 = (CGImage *)objc_msgSend((id)objc_opt_class(), "_gainMapPlaceholderImage");
      v5->_gainMapImage = CGImageRetain(v8);
    }
    v5->_needsUpdateFlags.filterInput = 1;
    v5->_needsUpdateFlags.filterIntensity = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PXImageLayerModulator;
  -[PXImageLayerModulator dealloc](&v3, sel_dealloc);
}

- (void)setLayer:(id)a3
{
  CALayer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  PXImageLayerModulator *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  CALayer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (CALayer *)a3;
  if (self->_layer != v6)
  {
    objc_storeStrong((id *)&self->_layer, a3);
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218498;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@ %@", (uint8_t *)&v9, 0x20u);

    }
    -[PXImageLayerModulator _invalidateFilteredLayer](self, "_invalidateFilteredLayer");
  }

}

- (void)setFilter:(id)a3
{
  CAFilter *v5;
  char v6;
  void *v7;
  void *v8;
  CAFilter *v9;

  v9 = (CAFilter *)a3;
  v5 = self->_filter;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = -[CAFilter isEqual:](v9, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      -[PXImageLayerModulator filteredLayer](self, "filteredLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXImageLayerModulator _removeFilterFromLayer:](self, "_removeFilterFromLayer:", v7);

      objc_storeStrong((id *)&self->_filter, a3);
      -[PXImageLayerModulator filteredLayer](self, "filteredLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXImageLayerModulator _addFilterToLayer:](self, "_addFilterToLayer:", v8);

      -[PXImageLayerModulator _invalidateFilterIntensity](self, "_invalidateFilterIntensity");
      -[PXImageLayerModulator _invalidateGainMapAppearance](self, "_invalidateGainMapAppearance");
    }
  }

}

- (void)setFilterType:(int64_t)a3
{
  void *v5;

  if (self->_filterType != a3)
  {
    -[PXImageLayerModulator filteredLayer](self, "filteredLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageLayerModulator _removeFilterFromLayer:](self, "_removeFilterFromLayer:", v5);

    self->_filterType = a3;
    -[PXImageLayerModulator _invalidateFilter](self, "_invalidateFilter");
  }
}

- (void)setHdrGain:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_hdrGain = a3;
    -[PXImageLayerModulator _invalidateFilter](self, "_invalidateFilter");
  }
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PXImageLayerModulator _invalidateFilter](self, "_invalidateFilter");
  }
}

- (void)setFilteredLayer:(id)a3
{
  CALayer *v4;
  CALayer *filteredLayer;
  CALayer *v6;
  CALayer *v7;
  CALayer *v8;
  CALayer *v9;

  v4 = (CALayer *)a3;
  filteredLayer = self->_filteredLayer;
  if (filteredLayer != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_filteredLayer;
    self->_filteredLayer = v6;
    v8 = filteredLayer;

    -[PXImageLayerModulator _removeFilterFromLayer:](self, "_removeFilterFromLayer:", v8);
    -[PXImageLayerModulator _addFilterToLayer:](self, "_addFilterToLayer:", v6);

    -[PXImageLayerModulator _invalidateFilterIntensity](self, "_invalidateFilterIntensity");
    -[PXImageLayerModulator _invalidateGainMapAppearance](self, "_invalidateGainMapAppearance");
    v4 = v9;
  }

}

- (void)_addFilterToLayer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXGainMapAnimationDurationFilter *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXImageLayerModulator filter](self, "filter");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = -[PXImageLayerModulator filterType](self, "filterType");
    if ((unint64_t)(v7 - 1) < 2)
    {
      objc_msgSend(v4, "filters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "arrayByAddingObject:", v6);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v10;
      objc_msgSend(v4, "setFilters:", v10);

      goto LABEL_10;
    }
    if (v7 == 3)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      objc_msgSend(v9, "setCompositingFilter:", *MEMORY[0x1E0CD2E58]);
      -[PXImageLayerModulator filter](self, "filter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v12);

      v18 = CFSTR("onOrderIn");
      v13 = (void *)objc_opt_new();
      v19 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActions:", v14);

      -[PXImageLayerModulator filteredLayer](self, "filteredLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSublayer:", v9);

      -[PXImageLayerModulator setGainMapLayer:](self, "setGainMapLayer:", v9);
      v16 = objc_alloc_init(PXGainMapAnimationDurationFilter);
      -[PXImageLayerModulator setGainMapAnimationDurationFilter:](self, "setGainMapAnimationDurationFilter:", v16);

LABEL_10:
    }
  }

}

- (void)_removeFilterFromLayer:(id)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v14 = a3;
  -[PXImageLayerModulator filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v5)
  {
    v6 = -[PXImageLayerModulator filterType](self, "filterType");
    if ((unint64_t)(v6 - 1) >= 2)
    {
      if (v6 == 3)
      {
        -[PXImageLayerModulator gainMapLayer](self, "gainMapLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperlayer");

        -[PXImageLayerModulator setGainMapLayer:](self, "setGainMapLayer:", 0);
      }
    }
    else
    {
      objc_msgSend(v14, "filters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__PXImageLayerModulator__removeFilterFromLayer___block_invoke;
      v15[3] = &unk_1E5134B78;
      v18 = a2;
      v15[4] = self;
      v16 = v5;
      v17 = v9;
      v10 = v9;
      v11 = objc_msgSend(v8, "indexOfObjectPassingTest:", v15);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "removeObjectAtIndex:", v11);
        if (objc_msgSend(v8, "count"))
          v12 = v8;
        else
          v12 = 0;
        objc_msgSend(v14, "setFilters:", v12);
      }

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  void *v7;
  int v8;
  PXImageLayerModulator *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = self;
      v10 = 2112;
      v11 = v7;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@ %i", (uint8_t *)&v8, 0x1Cu);

    }
    -[PXImageLayerModulator _invalidateFilteredLayer](self, "_invalidateFilteredLayer");
    -[PXImageLayerModulator _invalidateFilterIntensity](self, "_invalidateFilterIntensity");
  }
}

- (void)setIntensity:(double)a3
{
  NSObject *v4;
  double intensity;
  int v6;
  PXImageLayerModulator *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_intensity != a3)
  {
    self->_intensity = a3;
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      intensity = self->_intensity;
      v6 = 134218240;
      v7 = self;
      v8 = 2048;
      v9 = intensity;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setIntensity:%f", (uint8_t *)&v6, 0x16u);
    }

    -[PXImageLayerModulator _invalidateFilterIntensity](self, "_invalidateFilterIntensity");
  }
}

- (void)setDisplayingVideoComplement:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PXImageLayerModulator *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_displayingVideoComplement != a3)
  {
    v3 = a3;
    self->_displayingVideoComplement = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setDisplayingVideoComplement:%d", (uint8_t *)&v6, 0x12u);
    }

    -[PXImageLayerModulator _invalidateFilterIntensity](self, "_invalidateFilterIntensity");
  }
}

- (void)setDisplayingOpaqueContent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PXImageLayerModulator *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_displayingOpaqueContent != a3)
  {
    v3 = a3;
    self->_displayingOpaqueContent = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setDisplayingOpaqueContent:%d", (uint8_t *)&v6, 0x12u);
    }

    -[PXImageLayerModulator _invalidateGainMapAppearance](self, "_invalidateGainMapAppearance");
  }
}

- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4
{
  CGImage *gainMapImage;
  void *v7;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    -[PXImageLayerModulator setAnimateGainMapAppearance:](self, "setAnimateGainMapAppearance:", 1);
    -[PXImageLayerModulator gainMapAnimationDurationFilter](self, "gainMapAnimationDurationFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGainMapImageAvailable:", a3 != 0);

    -[PXImageLayerModulator _invalidateFilterInput](self, "_invalidateFilterInput");
    -[PXImageLayerModulator _invalidateGainMapVisibility](self, "_invalidateGainMapVisibility");
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  -[PXImageLayerModulator setGainMapImage:animated:](self, "setGainMapImage:animated:", a3, 0);
}

- (void)setGainMapLayer:(id)a3
{
  CALayer *v5;
  CALayer *v6;

  v5 = (CALayer *)a3;
  if (self->_gainMapLayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gainMapLayer, a3);
    -[PXImageLayerModulator _invalidateGainMapVisibility](self, "_invalidateGainMapVisibility");
    v5 = v6;
  }

}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    -[PXImageLayerModulator _invalidateGainMapAppearance](self, "_invalidateGainMapAppearance");
  }
}

- (void)prepareForReuse
{
  NSObject *v4;
  void *v5;
  double v6;
  int v7;
  PXImageLayerModulator *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@", (uint8_t *)&v7, 0x16u);

  }
  -[PXImageLayerModulator setLayer:](self, "setLayer:", 0);
  -[PXImageLayerModulator setEnabled:](self, "setEnabled:", 0);
  -[PXImageLayerModulator setIntensity:](self, "setIntensity:", 0.0);
  -[PXImageLayerModulator setDisplayingVideoComplement:](self, "setDisplayingVideoComplement:", 0);
  -[PXImageLayerModulator setGainMapImage:](self, "setGainMapImage:", 0);
  LODWORD(v6) = 0;
  -[PXImageLayerModulator setGainMapValue:](self, "setGainMapValue:", v6);
}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, PXImageLayerModulator *))a3 + 2))(a3, self);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXImageLayerModulator _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.filterInput
      || self->_needsUpdateFlags.filter
      || self->_needsUpdateFlags.filteredLayer
      || self->_needsUpdateFlags.displayingVideoComplement
      || self->_needsUpdateFlags.filterIntensity
      || self->_needsUpdateFlags.gainMapAppearance
      || self->_needsUpdateFlags.gainMapVisibility;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageLayerModulator.m"), 347, CFSTR("neither insider -performChanges: block, nor performing updates"));

  }
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXImageLayerModulator _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXImageLayerModulator _updateFilterInput](self, "_updateFilterInput");
    -[PXImageLayerModulator _updateFilter](self, "_updateFilter");
    -[PXImageLayerModulator _updateFilteredLayerIfNeeded](self, "_updateFilteredLayerIfNeeded");
    -[PXImageLayerModulator _updateGainMapAppearance](self, "_updateGainMapAppearance");
    -[PXImageLayerModulator _updateGainMapVisibility](self, "_updateGainMapVisibility");
    -[PXImageLayerModulator _updateFilterIntensityIfNeeded](self, "_updateFilterIntensityIfNeeded");
    -[PXImageLayerModulator setIntensityAnimationDuration:](self, "setIntensityAnimationDuration:", 0.0);
    -[PXImageLayerModulator setAnimateGainMapAppearance:](self, "setAnimateGainMapAppearance:", 0);
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_invalidateFilterInput
{
  self->_needsUpdateFlags.filterInput = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFilterInput
{
  double v3;

  if (self->_needsUpdateFlags.filterInput)
  {
    self->_needsUpdateFlags.filterInput = 0;
    -[PXImageLayerModulator options](self, "options", 0);
    -[PXImageLayerModulator setFilterType:](self, "setFilterType:", 0);
    LODWORD(v3) = 0;
    -[PXImageLayerModulator setHdrGain:](self, "setHdrGain:", v3);
  }
}

- (void)_invalidateFilter
{
  self->_needsUpdateFlags.filter = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFilter
{
  int64_t v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  double v8;
  float v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  float v15;
  double v16;
  float v17;
  long double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (!self->_needsUpdateFlags.filter)
    return;
  self->_needsUpdateFlags.filter = 0;
  v3 = -[PXImageLayerModulator filterType](self, "filterType");
  switch(v3)
  {
    case 3:
      v12 = objc_alloc(MEMORY[0x1E0CD2780]);
      v24 = (id)objc_msgSend(v12, "initWithType:", *MEMORY[0x1E0CD2C70]);
      v5 = (__CFString *)(id)*MEMORY[0x1E0CD2DA8];
      +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "EDRHeadroomUsageScheme");
      if (v13 != 1)
      {
        v8 = 0.0;
        if (!v13)
        {
          v14 = (void *)MEMORY[0x1E0D75130];
          -[PXImageLayerModulator hdrGain](self, "hdrGain");
          v16 = v15;
          -[PXImageLayerModulator gainMapValue](self, "gainMapValue");
          objc_msgSend(v14, "gainMapHeadroomForHDRGain:gainMapValue:", v16, v17);
          v10 = log2(v18);
          goto LABEL_13;
        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)pow(2.0, v8));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v21, *MEMORY[0x1E0CD2CB8]);

        break;
      }
LABEL_15:
      objc_msgSend(v6, "deviceMaximumEDRHeadroomStops");
      v8 = v20;
      goto LABEL_16;
    case 2:
      v11 = objc_alloc(MEMORY[0x1E0CD2780]);
      v24 = (id)objc_msgSend(v11, "initWithType:", *MEMORY[0x1E0CD2BF8]);
      objc_msgSend(v24, "setValue:forKey:", &unk_1E53F1218, CFSTR("inputAmount"));
      v5 = CFSTR("inputBias");
      break;
    case 1:
      v4 = objc_alloc(MEMORY[0x1E0CD2780]);
      v24 = (id)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2E40]);
      v5 = (__CFString *)(id)*MEMORY[0x1E0CD2DA8];
      +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "EDRHeadroomUsageScheme");
      if (v7 != 1)
      {
        v8 = 0.0;
        if (!v7)
        {
          -[PXImageLayerModulator hdrGain](self, "hdrGain");
          v10 = v9;
LABEL_13:
          objc_msgSend(v6, "deviceMaximumEDRHeadroomStops");
          v8 = fmin(v10, v19);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    default:
      v5 = 0;
      v24 = 0;
      break;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PXImageLayerModulatorFilter-%p"), self);
  objc_msgSend(v24, "setName:", v22);
  objc_msgSend(v24, "setEnabled:", 1);
  -[PXImageLayerModulator setFilter:](self, "setFilter:", v24);
  if (v5)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("filters.%@.%@"), v22, v5);
    -[PXImageLayerModulator setLayerFilterIntensityKeyPath:](self, "setLayerFilterIntensityKeyPath:", v23);

  }
  else
  {
    -[PXImageLayerModulator setLayerFilterIntensityKeyPath:](self, "setLayerFilterIntensityKeyPath:", 0);
  }

}

- (void)_invalidateFilteredLayer
{
  self->_needsUpdateFlags.filteredLayer = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFilteredLayerIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.filteredLayer)
  {
    self->_needsUpdateFlags.filteredLayer = 0;
    if (-[PXImageLayerModulator isEnabled](self, "isEnabled"))
    {
      -[PXImageLayerModulator layer](self, "layer");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PXImageLayerModulator setFilteredLayer:](self, "setFilteredLayer:", v3);

    }
    else
    {
      -[PXImageLayerModulator setFilteredLayer:](self, "setFilteredLayer:", 0);
    }
  }
}

- (void)_invalidateFilterIntensity
{
  self->_needsUpdateFlags.filterIntensity = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFilterIntensityIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  PXImageLayerModulator *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.filterIntensity)
  {
    self->_needsUpdateFlags.filterIntensity = 0;
    if (-[PXImageLayerModulator filterType](self, "filterType") == 3)
      -[PXImageLayerModulator gainMapLayer](self, "gainMapLayer");
    else
      -[PXImageLayerModulator filteredLayer](self, "filteredLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageLayerModulator layerFilterIntensityKeyPath](self, "layerFilterIntensityKeyPath");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (!v3 || !v4)
    {
LABEL_30:

      return;
    }
    v6 = 0.0;
    if (!-[PXImageLayerModulator isEnabled](self, "isEnabled"))
    {
LABEL_17:
      if (-[PXImageLayerModulator filterType](self, "filterType") == 2)
      {
        PXFloatByLinearlyInterpolatingFloats();
        v6 = v11;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXImageLayerModulator intensityAnimationDuration](self, "intensityAnimationDuration");
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      if (v14 > 0.0)
      {
        objc_msgSend(v3, "presentationLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "filters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v3, "presentationLayer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "valueForKeyPath:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v3, "valueForKeyPath:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v18 && (objc_msgSend(v18, "isEqualToNumber:", v12) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFromValue:", v18);
          objc_msgSend(v19, "setToValue:", v12);
          objc_msgSend(v19, "setDuration:", v14);
          objc_msgSend(v3, "addAnimation:forKey:", v19, CFSTR("imageLayerModulatorIntensity"));

        }
      }
      objc_msgSend(v3, "setValue:forKeyPath:", v12, v5);
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218754;
        v23 = self;
        v24 = 2112;
        v25 = v3;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v5;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] layer:%@ setValue:%@ forKeyPath:%@", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      goto LABEL_30;
    }
    +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageLayerModulator options](self, "options");
    if ((unint64_t)(v21 - 1) >= 4)
    {
      if (v21)
        goto LABEL_13;
      objc_msgSend(v7, "SDRModulationIntensity");
    }
    else
    {
      objc_msgSend(v7, "HDRModulationIntensity");
    }
    v6 = v8;
LABEL_13:
    if (-[PXImageLayerModulator isDisplayingVideoComplement](self, "isDisplayingVideoComplement"))
    {
      objc_msgSend(v7, "videoComplementModulationIntensity");
      if (v6 >= v9)
        v6 = v9;
    }
    -[PXImageLayerModulator intensity](self, "intensity");
    v6 = v6 * v10;

    goto LABEL_17;
  }
}

- (void)_invalidateGainMapAppearance
{
  self->_needsUpdateFlags.gainMapAppearance = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGainMapAppearance
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.gainMapAppearance)
  {
    self->_needsUpdateFlags.gainMapAppearance = 0;
    -[PXImageLayerModulator gainMapLayer](self, "gainMapLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PXImageLayerModulator filter](self, "filter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PXImageLayerModulator revealsGainMapImage](self, "revealsGainMapImage"))
      {
        objc_msgSend(v3, "setCompositingFilter:", *MEMORY[0x1E0CD2C18]);
        objc_msgSend(v3, "setFilters:", 0);
        v8 = v4;
        v9 = 0;
      }
      else
      {
        v5 = -[PXImageLayerModulator isDisplayingOpaqueContent](self, "isDisplayingOpaqueContent");
        v6 = (_QWORD *)MEMORY[0x1E0CD2E58];
        if (!v5)
          v6 = (_QWORD *)MEMORY[0x1E0CD2E50];
        objc_msgSend(v3, "setCompositingFilter:", *v6);
        v12[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setFilters:", v7);

        v8 = v4;
        v9 = 1;
      }
      objc_msgSend(v8, "setEnabled:", v9);
      +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "showGainMapBorder"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v3, "setBorderColor:", objc_msgSend(v11, "CGColor"));

        objc_msgSend(v3, "setBorderWidth:", 15.0);
      }

    }
  }
}

- (void)_invalidateGainMapVisibility
{
  self->_needsUpdateFlags.gainMapVisibility = 1;
  -[PXImageLayerModulator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGainMapVisibility
{
  CGImage *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  CGImage *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_needsUpdateFlags.gainMapVisibility)
  {
    self->_needsUpdateFlags.gainMapVisibility = 0;
    v3 = -[PXImageLayerModulator gainMapImage](self, "gainMapImage");
    -[PXImageLayerModulator gainMapLayer](self, "gainMapLayer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentationLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v17, "contents");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    v9 = v3;
    -[PXImageLayerModulator gainMapAnimationDurationFilter](self, "gainMapAnimationDurationFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "output");
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (-[PXImageLayerModulator animateGainMapAppearance](self, "animateGainMapAppearance"))
    {
      if (v12 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFromValue:", v8);
        objc_msgSend(v13, "setToValue:", v9);
        objc_msgSend(v13, "setDuration:", v12);
        +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gainMapAnimationTimingFunction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTimingFunction:", v16);

        objc_msgSend(v17, "addAnimation:forKey:", v13, CFSTR("imageLayerContents"));
      }
    }
    objc_msgSend(v17, "setContents:", v9);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (CALayer)layer
{
  return self->_layer;
}

- (BOOL)isDisplayingVideoComplement
{
  return self->_displayingVideoComplement;
}

- (BOOL)isDisplayingOpaqueContent
{
  return self->_displayingOpaqueContent;
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

- ($644A41260DF4BF4C36F7F207412D02FF)options
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_QWORD *)&retstr->var4 = self[3].var3;
  return self;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (float)hdrGain
{
  return self->_hdrGain;
}

- (CAFilter)filter
{
  return self->_filter;
}

- (NSString)layerFilterIntensityKeyPath
{
  return self->_layerFilterIntensityKeyPath;
}

- (void)setLayerFilterIntensityKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_layerFilterIntensityKeyPath, a3);
}

- (CALayer)filteredLayer
{
  return self->_filteredLayer;
}

- (CALayer)gainMapLayer
{
  return self->_gainMapLayer;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (PXGainMapAnimationDurationFilter)gainMapAnimationDurationFilter
{
  return self->_gainMapAnimationDurationFilter;
}

- (void)setGainMapAnimationDurationFilter:(id)a3
{
  objc_storeStrong((id *)&self->_gainMapAnimationDurationFilter, a3);
}

- (double)intensityAnimationDuration
{
  return self->_intensityAnimationDuration;
}

- (void)setIntensityAnimationDuration:(double)a3
{
  self->_intensityAnimationDuration = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)intensity
{
  return self->_intensity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapAnimationDurationFilter, 0);
  objc_storeStrong((id *)&self->_gainMapLayer, 0);
  objc_storeStrong((id *)&self->_filteredLayer, 0);
  objc_storeStrong((id *)&self->_layerFilterIntensityKeyPath, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

uint64_t __48__PXImageLayerModulator__removeFilterFromLayer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 48));

  return v4;
}

+ (CGImage)_gainMapPlaceholderImage
{
  if (_gainMapPlaceholderImage_onceToken != -1)
    dispatch_once(&_gainMapPlaceholderImage_onceToken, &__block_literal_global_198699);
  return (CGImage *)_gainMapPlaceholderImage_placeholderImage;
}

CGImageRef __49__PXImageLayerModulator__gainMapPlaceholderImage__block_invoke()
{
  CGImageRef result;

  result = PXImageCreateBlackPlaceholderImageWithSize();
  _gainMapPlaceholderImage_placeholderImage = (uint64_t)result;
  return result;
}

@end
