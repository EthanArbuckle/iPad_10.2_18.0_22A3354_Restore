@implementation PKPassView

- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  double v5;

  v5 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_modalShadowVisibility != v5)
  {
    self->_modalShadowVisibility = v5;
    -[PKPassView _updateLayerShadowAnimated:withDelay:](self, "_updateLayerShadowAnimated:withDelay:", a4, a5);
  }
}

- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4
{
  -[PKPassView setModalShadowVisibility:animated:withDelay:](self, "setModalShadowVisibility:animated:withDelay:", a4, a3, 0.0);
}

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
  -[PKPassFaceView setDimmer:animated:](self->_frontFace, "setDimmer:animated:", a4, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  id WeakRetained;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)PKPassView;
  -[PKPassView layoutSubviews](&v18, sel_layoutSubviews);
  -[PKPassView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKPassFrontFaceView frame](self->_frontFace, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PKPassFrontFaceView contentSize](self->_frontFace, "contentSize");
  -[PKPassFrontFaceView frameForAlignmentRect:](self->_frontFace, "frameForAlignmentRect:", v4, v6, v15, v16);
  -[PKPassFrontFaceView setFrame:](self->_frontFace, "setFrame:");
  -[PKPassFrontFaceView frame](self->_frontFace, "frame");
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (!CGRectEqualToRect(v19, v20))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "faceFrameDidChangeForPassView:", self);

  }
}

- (CGRect)frameOfVisibleFace
{
  PKPassFrontFaceView *frontFace;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  frontFace = self->_frontFace;
  -[PKPassFrontFaceView frame](frontFace, "frame");
  -[PKPassFrontFaceView alignmentRectForFrame:](frontFace, "alignmentRectForFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (PKPassViewDelegate)delegate
{
  return (PKPassViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_applyContentMode:(BOOL)a3
{
  void *v4;
  PKPass *pass;
  PKPass *v6;
  void *v7;
  int64_t contentMode;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  PKPass *v12;
  _BOOL4 v13;
  PKPassFrontFaceView *frontFace;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = (void *)MEMORY[0x1A1AE621C](self, a2, a3);
  if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement)
    pass = self->_pass;
  else
    pass = 0;
  v6 = pass;
  -[PKPassFaceView setBackgroundMode:](self->_frontFace, "setBackgroundMode:", -[PKPassView _frontFaceBackgroundModeForContentMode](self, "_frontFaceBackgroundModeForContentMode"));
  -[PKPassFaceView setVisibleRegions:](self->_frontFace, "setVisibleRegions:", -[PKPassView _regionsForCurrentModes](self, "_regionsForCurrentModes"));
  -[PKPass dynamicLayerConfiguration](v6, "dynamicLayerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  contentMode = self->_contentMode;
  v9 = contentMode == 5;
  v10 = contentMode > 2;
  if (v7)
    v11 = v10;
  else
    v11 = v9;
  -[PKPassFaceView setLiveMotionEnabled:](self->_frontFace, "setLiveMotionEnabled:", v11);
  if (self->_contentMode < 2 || self->_contentLoaded)
    goto LABEL_16;
  if ((-[PKPass isContentLoaded](self->_pass, "isContentLoaded") & 1) != 0)
  {
    self->_contentLoaded = 1;
LABEL_15:
    -[PKPassFaceView createContentViewsWithFade:](self->_frontFace, "createContentViewsWithFade:", 0);
    goto LABEL_16;
  }
  if (self->_contentMode > 3)
  {
    self->_contentLoaded = 1;
    -[PKPass loadContentSync](self->_pass, "loadContentSync");
    goto LABEL_15;
  }
  if (!self->_contentLoading)
  {
    self->_contentLoading = 1;
    objc_initWeak(&location, self);
    v12 = self->_pass;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __32__PKPassView__applyContentMode___block_invoke;
    v18 = &unk_1E3E61310;
    objc_copyWeak(&v19, &location);
    -[PKPass loadContentAsyncWithCompletion:](v12, "loadContentAsyncWithCompletion:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
LABEL_16:
  location = 0;
  v13 = -[PKPassView _visibleFaceShouldClipForCurrentViewMode:](self, "_visibleFaceShouldClipForCurrentViewMode:", &location, v15, v16, v17, v18);
  frontFace = self->_frontFace;
  if (v13)
  {
    -[PKPassFaceView setClipsContent:](frontFace, "setClipsContent:", 1);
    -[PKPassFaceView setClippedContentHeight:](self->_frontFace, "setClippedContentHeight:", *(double *)&location);
  }
  else
  {
    -[PKPassFaceView setClipsContent:](frontFace, "setClipsContent:", 0);
  }
  -[PKPassView setNeedsLayout](self, "setNeedsLayout");

  objc_autoreleasePoolPop(v4);
}

- (BOOL)_visibleFaceShouldClipForCurrentViewMode:(double *)a3
{
  int64_t contentMode;
  double v6;
  double v7;
  double v8;

  contentMode = self->_contentMode;
  if (contentMode == 2)
  {
    v7 = 80.0;
  }
  else
  {
    if (contentMode != 1)
      return 0;
    -[PKPass style](self->_pass, "style");
    PKPassFaceSliverHeight();
    v7 = v6;
  }
  -[PKPassFrontFaceView contentSize](self->_frontFace, "contentSize");
  if (v8 <= v7)
    return 0;
  if (a3)
    *a3 = v7;
  return 1;
}

- (unint64_t)_regionsForCurrentModes
{
  int64_t contentMode;
  unint64_t v3;

  contentMode = self->_contentMode;
  v3 = 3;
  if (contentMode <= 1)
    v3 = 1;
  if (contentMode <= 3)
    return v3;
  else
    return v3 | 4;
}

- (int64_t)_frontFaceBackgroundModeForContentMode
{
  return (unint64_t)(self->_contentMode - 3) < 3;
}

- (PKPass)pass
{
  return self->_pass;
}

- (CGSize)sizeOfFront
{
  double v2;
  double v3;
  CGSize result;

  -[PKPassFrontFaceView contentSize](self->_frontFace, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  int64_t contentMode;
  _BOOL8 v7;
  NSObject *contentModeUpdateTimer;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD handler[4];
  id v18;
  BOOL v19;
  id location;

  contentMode = self->_contentMode;
  if (contentMode != a3)
  {
    v7 = a4;
    contentModeUpdateTimer = self->_contentModeUpdateTimer;
    if (contentModeUpdateTimer)
    {
      dispatch_source_cancel(contentModeUpdateTimer);
      v11 = self->_contentModeUpdateTimer;
      self->_contentModeUpdateTimer = 0;

      contentMode = self->_contentMode;
    }
    self->_priorContentMode = contentMode;
    self->_contentMode = a3;
    if (a5 <= 0.0 || self->_priorContentMode < a3)
    {
      -[PKPassView _applyContentMode:](self, "_applyContentMode:", v7);
    }
    else
    {
      v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v13 = self->_contentModeUpdateTimer;
      self->_contentModeUpdateTimer = v12;

      v14 = self->_contentModeUpdateTimer;
      v15 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak(&location, self);
      v16 = self->_contentModeUpdateTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48__PKPassView_setContentMode_animated_withDelay___block_invoke;
      handler[3] = &unk_1E3E61C08;
      objc_copyWeak(&v18, &location);
      v19 = v7;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_resume((dispatch_object_t)self->_contentModeUpdateTimer);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  -[PKPassFaceView setPaused:](self->_frontFace, "setPaused:", a3);
}

- (NSString)uniqueID
{
  return (NSString *)-[PKPass uniqueID](self->_pass, "uniqueID");
}

- (void)setPassState:(id)a3
{
  PKPassDynamicState *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (PKPassDynamicState *)a3;
  if (self->_passState != v5)
  {
    objc_storeStrong((id *)&self->_passState, a3);
    -[PKPassView _updateFrontFaceSuppressedContent](self, "_updateFrontFaceSuppressedContent");
    -[PKPassView observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "passView:didUpdatePassState:", self, v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5 rendererState:(id)a6
{
  id v11;
  id v12;
  PKPassView *v13;
  void *v14;
  uint64_t v15;
  PKPassColorProfile *colorProfile;
  PKPassFrontFaceView *v17;
  PKPassFrontFaceView *frontFace;
  void *v19;
  uint64_t v20;
  UITapGestureRecognizer *tapRecognizer;
  uint64_t v22;
  PKPasscodeLockManager *passcodeLockManager;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  objc_super v29;

  v11 = a3;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PKPassView;
  v13 = -[PKPassView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v13)
  {
    context = (void *)MEMORY[0x1A1AE621C]();
    objc_msgSend(v11, "displayProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_suppressedContent = a5;
    objc_storeStrong((id *)&v13->_rendererState, a6);
    v13->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_pass, a3);
    +[PKPassColorProfile profileForDisplayProfile:](PKPassColorProfile, "profileForDisplayProfile:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    colorProfile = v13->_colorProfile;
    v13->_colorProfile = (PKPassColorProfile *)v15;

    v17 = +[PKPassFaceView newFrontFaceViewForStyle:](PKPassFaceView, "newFrontFaceViewForStyle:", objc_msgSend(v11, "style"));
    frontFace = v13->_frontFace;
    v13->_frontFace = v17;

    -[PKPassFaceView setModallyPresented:](v13->_frontFace, "setModallyPresented:", v13->_modallyPresented);
    -[PKPassFaceView setPass:colorProfile:](v13->_frontFace, "setPass:colorProfile:", v13->_pass, v13->_colorProfile);
    -[PKPassFaceView setDelegate:](v13->_frontFace, "setDelegate:", v13);
    -[PKPassView _updateFrontFaceSuppressedContent](v13, "_updateFrontFaceSuppressedContent");
    -[PKPassView addSubview:](v13, "addSubview:", v13->_frontFace);
    objc_msgSend(v11, "frontFaceImageAverageColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFaceView setAverageFaceColor:](v13->_frontFace, "setAverageFaceColor:", v19);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v13, sel_tapRecognized_);
    tapRecognizer = v13->_tapRecognizer;
    v13->_tapRecognizer = (UITapGestureRecognizer *)v20;

    -[UITapGestureRecognizer setDelegate:](v13->_tapRecognizer, "setDelegate:", v13);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v13->_tapRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v13->_tapRecognizer, "setNumberOfTouchesRequired:", 1);
    -[PKPassView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_tapRecognizer);
    +[PKAppIntentUIUtilities annotateView:withEntityForPass:](PKAppIntentUIUtilities, "annotateView:withEntityForPass:", v13, v11);
    v13->_contentMode = a4;
    -[PKPassView _applyContentMode:](v13, "_applyContentMode:", 0);
    -[PKPassView sizeToFit](v13, "sizeToFit");
    objc_msgSend(MEMORY[0x1E0D66FC8], "sharedManager");
    v22 = objc_claimAutoreleasedReturnValue();
    passcodeLockManager = v13->_passcodeLockManager;
    v13->_passcodeLockManager = (PKPasscodeLockManager *)v22;

    -[PKPasscodeLockManager addObserver:](v13->_passcodeLockManager, "addObserver:", v13);
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("PKPassView.%@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", v26);
    -[PKPassView setAccessibilityIgnoresInvertColors:](v13, "setAccessibilityIgnoresInvertColors:", 1);

    objc_autoreleasePoolPop(context);
  }

  return v13;
}

- (void)_updateFrontFaceSuppressedContent
{
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t suppressedContent;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  PKPassFrontFaceView *frontFace;
  PKPassFaceViewRendererState *rendererState;
  void *v16;
  uint64_t v17;

  v3 = -[PKPass isExpired](self->_pass, "isExpired");
  v4 = -[PKPass isVoided](self->_pass, "isVoided");
  v5 = -[PKPass hasValidNFCPayload](self->_pass, "hasValidNFCPayload");
  v6 = 1;
  if ((self->_suppressedContent & 0x40) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = 1;
    if (v5 && PKValueAddedServicesEnabled())
    {
      v6 = 0;
      v7 = -[PKPass isValid](self->_pass, "isValid") ^ 1;
    }
  }
  suppressedContent = self->_suppressedContent;
  if ((suppressedContent & 0x80) != 0)
  {
    v10 = 0;
    if ((suppressedContent & 0x200) != 0)
    {
LABEL_11:
      v11 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    -[PKPass barcode](self->_pass, "barcode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v7;
    else
      v10 = 0;

    suppressedContent = self->_suppressedContent;
    if ((suppressedContent & 0x200) != 0)
      goto LABEL_11;
  }
  if (-[PKPass liveRenderingRequiresEnablement](self->_pass, "liveRenderingRequiresEnablement"))
  {
    -[PKPassDynamicState liveRender](self->_passState, "liveRender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "enabled");

  }
  else
  {
    v11 = 1;
  }
LABEL_16:
  if ((v6 | v10) == 1 || ((v3 | v4) & 1) == 0)
  {
    if ((self->_suppressedContent & 0x800) != 0)
      v13 = 0;
    else
      v13 = v7 ^ 1;
  }
  else
  {
    v13 = 2;
  }
  -[PKPassFrontFaceView setBottomRightItem:](self->_frontFace, "setBottomRightItem:", v13);
  -[PKPassFrontFaceView setShowsBarcodeView:](self->_frontFace, "setShowsBarcodeView:", v10);
  -[PKPassFrontFaceView setShowsLinkedApp:](self->_frontFace, "setShowsLinkedApp:", (suppressedContent & 0x20) == 0);
  frontFace = self->_frontFace;
  if (v11)
  {
    -[PKPassFaceView setShowsLiveRendering:rendererState:](frontFace, "setShowsLiveRendering:rendererState:", 1, self->_rendererState);
    rendererState = self->_rendererState;
    self->_rendererState = 0;

  }
  else
  {
    -[PKPassFaceView setShowsLiveRendering:rendererState:](frontFace, "setShowsLiveRendering:rendererState:", 0, 0);
  }
  -[PKPassFrontFaceView setShowsLiveBalance:](self->_frontFace, "setShowsLiveBalance:", (self->_suppressedContent & 0x400) == 0);
  -[PKPassDynamicState relevancyModel](self->_passState, "relevancyModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "relevancyActive");

  -[PKPassFrontFaceView setRelevancyActive:](self->_frontFace, "setRelevancyActive:", v17);
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5
{
  return -[PKPassView initWithPass:content:suppressedContent:rendererState:](self, "initWithPass:content:suppressedContent:rendererState:", a3, a4, a5, 0);
}

- (CGSize)sizeOfFrontFace
{
  double v2;
  double v3;
  CGSize result;

  -[PKPass style](self->_pass, "style");
  PKPassFrontFaceContentSize();
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPassView)initWithPass:(id)a3
{
  return -[PKPassView initWithPass:content:](self, "initWithPass:content:", a3, 1);
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4
{
  return -[PKPassView initWithPass:content:suppressedContent:](self, "initWithPass:content:suppressedContent:", a3, a4, 0);
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  NSObject *contentModeUpdateTimer;
  objc_super v6;
  _QWORD v7[4];
  NSString *v8;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[PKPasscodeLockManager removeObserver:](self->_passcodeLockManager, "removeObserver:", self);
  v3 = self->_suppressingIdentifier;
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__PKPassView_dealloc__block_invoke;
    v7[3] = &unk_1E3E66B70;
    v8 = v3;
    _AccessSuppressionSetForMutation(v7);

  }
  contentModeUpdateTimer = self->_contentModeUpdateTimer;
  if (contentModeUpdateTimer)
    dispatch_source_cancel(contentModeUpdateTimer);

  v6.receiver = self;
  v6.super_class = (Class)PKPassView;
  -[PKPassView dealloc](&v6, sel_dealloc);
}

uint64_t __21__PKPassView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKPassFaceView invalidate](self->_frontFace, "invalidate");
  }
}

- (id)observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_observersLock);
  return v5;
}

- (void)addPassViewObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_observersLock);

}

- (void)removePassViewObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PKPassView *v5;
  PKPassView *v6;
  PKPassView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassView;
  -[PKPassView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PKPassView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  PKPassFrontFaceView *frontFace;

  frontFace = self->_frontFace;
  objc_msgSend(a4, "locationInView:", frontFace);
  return -[WLEasyToHitCustomView pointInside:withEvent:](frontFace, "pointInside:withEvent:", 0);
}

- (void)tapRecognized:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passViewTapped:", self);

}

- (void)setPaymentBarcodeData:(id)a3
{
  -[PKPassFaceView setDynamicBarcodeData:](self->_frontFace, "setDynamicBarcodeData:", a3);
}

- (id)snapshotOfFrontFace
{
  double v3;
  double v4;

  -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPassView frameOfVisibleFace](self, "frameOfVisibleFace");
  return -[PKPassView snapshotOfFrontFaceWithRequestedSize:](self, "snapshotOfFrontFaceWithRequestedSize:", v3, v4);
}

- (id)snapshotOfFrontFaceWithRequestedSize:(CGSize)a3
{
  double v3;
  double v4;
  double height;
  double width;
  unint64_t suppressedContent;
  BOOL modallyPresented;
  uint64_t v11;
  void (**v12)(_QWORD);
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  _QWORD v41[6];
  BOOL v42;
  _QWORD aBlock[6];
  BOOL v44;
  BOOL v45;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == a3.width && v4 == a3.height)
  {
    v24 = 0;
  }
  else
  {
    height = a3.height;
    width = a3.width;
    suppressedContent = self->_suppressedContent;
    modallyPresented = self->_modallyPresented;
    if (suppressedContent != (suppressedContent | 0x377))
      -[PKPassView setSuppressedContent:](self, "setSuppressedContent:");
    -[PKPassView setModallyPresented:](self, "setModallyPresented:", 1);
    -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke;
    aBlock[3] = &unk_1E3E66B98;
    v44 = modallyPresented;
    v45 = suppressedContent != (suppressedContent | 0x377);
    aBlock[4] = self;
    aBlock[5] = suppressedContent;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKPassFrontFaceView frame](self->_frontFace, "frame");
    if (v3 == v13 && v4 == v14)
    {
      v12[2](v12);
      v24 = 0;
    }
    else
    {
      v16 = v13;
      v17 = v14;
      -[PKPassFrontFaceView alignmentRectForFrame:](self->_frontFace, "alignmentRectForFrame:");
      v20 = v18;
      v21 = v19 != height || v18 != width;
      if (v21)
      {
        v22 = height * (v18 / v19);
        if (v22 > width)
          v22 = width;
        v23 = v22 / v18;
        v16 = round(v16 * (v22 / v18));
        v17 = round(v17 * (v22 / v18));
        v20 = round(v18 * (v22 / v18));
        v19 = round(v19 * (v22 / v18));
      }
      else
      {
        v23 = 1.0;
      }
      v40 = v19;
      v25 = objc_alloc(MEMORY[0x1E0DC3828]);
      objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithSize:format:", v26, v16, v17);

      v41[0] = v11;
      v41[1] = 3221225472;
      v41[2] = __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke_2;
      v41[3] = &unk_1E3E66BC0;
      v42 = v21;
      *(double *)&v41[5] = v23;
      v41[4] = self;
      objc_msgSend(v27, "imageWithActions:", v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassFaceView alignmentRectInsets](self->_frontFace, "alignmentRectInsets");
      v32 = v31;
      v34 = v33;
      if (v21)
      {
        PKFloatRoundToPixel();
        v34 = v35;
        PKFloatRoundToPixel();
        v32 = v36;
        v37 = v16 - v34 - v20;
        v38 = v17 - v36 - v40;
      }
      else
      {
        v38 = v29;
        v37 = v30;
      }
      v12[2](v12);
      objc_msgSend(v28, "imageWithAlignmentRectInsets:", v32, v34, v38, v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v24;
}

uint64_t __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setModallyPresented:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(a1 + 32), "setSuppressedContent:", *(_QWORD *)(a1 + 40));
  return result;
}

void __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  if (*(_BYTE *)(a1 + 48))
    CGContextScaleCTM(v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderInContext:", v3);

  CGContextRestoreGState(v3);
}

- (id)snapshotOfPassView
{
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  unint64_t suppressedContent;
  BOOL modallyPresented;
  uint64_t v11;
  void (**v12)(_QWORD);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD aBlock[6];
  BOOL v20;
  BOOL v21;

  -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPassView bounds](self, "bounds");
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == v3 && v5 == v4)
  {
    v16 = 0;
  }
  else
  {
    v7 = v3;
    v8 = v4;
    suppressedContent = self->_suppressedContent;
    modallyPresented = self->_modallyPresented;
    if (suppressedContent != (suppressedContent | 0x377))
      -[PKPassView setSuppressedContent:](self, "setSuppressedContent:", *MEMORY[0x1E0C9D820], v5);
    -[PKPassView setModallyPresented:](self, "setModallyPresented:", 1);
    -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PKPassView_snapshotOfPassView__block_invoke;
    aBlock[3] = &unk_1E3E66B98;
    v20 = modallyPresented;
    v21 = suppressedContent != (suppressedContent | 0x377);
    aBlock[4] = self;
    aBlock[5] = suppressedContent;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    v13 = objc_alloc(MEMORY[0x1E0DC3828]);
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithSize:format:", v14, v7, v8);

    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __32__PKPassView_snapshotOfPassView__block_invoke_2;
    v18[3] = &unk_1E3E64BE8;
    v18[4] = self;
    objc_msgSend(v15, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12);

  }
  return v16;
}

uint64_t __32__PKPassView_snapshotOfPassView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setModallyPresented:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(a1 + 32), "setSuppressedContent:", *(_QWORD *)(a1 + 40));
  return result;
}

void __32__PKPassView_snapshotOfPassView__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderInContext:", v3);

  CGContextRestoreGState(v3);
}

- (id)snapshotViewOfVisibleFaceAfterScreenUpdates:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[19];

  -[PKPassFrontFaceView snapshotViewAfterScreenUpdates:](self->_frontFace, "snapshotViewAfterScreenUpdates:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFrontFaceView layer](self->_frontFace, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v45 = v9;
  v46 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "bounds");
  v43 = v15;
  v44 = v14;
  v41 = v17;
  v42 = v16;
  objc_msgSend(v7, "anchorPoint");
  v39 = v19;
  v40 = v18;
  objc_msgSend(v5, "position");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v5, "anchorPoint");
  v25 = v21 - v24 * v11;
  v27 = v23 - v26 * v13;
  objc_msgSend(v6, "position");
  v29 = v28;
  v31 = v30;
  objc_msgSend(v6, "bounds");
  v33 = v32;
  v35 = v34;
  objc_msgSend(v6, "anchorPoint");
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __58__PKPassView_snapshotViewOfVisibleFaceAfterScreenUpdates___block_invoke;
  v47[3] = &unk_1E3E66BE8;
  v47[4] = v7;
  *(double *)&v47[5] = v25;
  *(double *)&v47[6] = v27;
  *(double *)&v47[7] = v29 - v36 * v33;
  *(double *)&v47[8] = v31 - v37 * v35;
  v47[9] = v46;
  v47[10] = v45;
  *(double *)&v47[11] = v11;
  *(double *)&v47[12] = v13;
  v47[13] = v40;
  v47[14] = v39;
  v47[15] = v44;
  v47[16] = v43;
  v47[17] = v42;
  v47[18] = v41;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v47);

  return v4;
}

uint64_t __58__PKPassView_snapshotViewOfVisibleFaceAfterScreenUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:", vmlaq_f64(vaddq_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)(a1 + 72))), *(float64x2_t *)(a1 + 136), *(float64x2_t *)(a1 + 104)));
}

- (void)drawFrontFaceAtSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t suppressedContent;
  BOOL modallyPresented;
  void (**v8)(_QWORD);
  CGContext *CurrentContext;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v15;
  _QWORD aBlock[6];
  BOOL v17;
  BOOL v18;

  height = a3.height;
  width = a3.width;
  suppressedContent = self->_suppressedContent;
  modallyPresented = self->_modallyPresented;
  if (suppressedContent != (suppressedContent | 0x377))
    -[PKPassView setSuppressedContent:](self, "setSuppressedContent:");
  -[PKPassView setModallyPresented:](self, "setModallyPresented:", 1);
  -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PKPassView_drawFrontFaceAtSize___block_invoke;
  aBlock[3] = &unk_1E3E66B98;
  v17 = modallyPresented;
  v18 = suppressedContent != (suppressedContent | 0x377);
  aBlock[4] = self;
  aBlock[5] = suppressedContent;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[PKPassView bounds](self, "bounds");
  if (v10 != width || v11 != height)
    CGContextScaleCTM(CurrentContext, width / v10, height / v11);
  -[PKPassFrontFaceView frame](self->_frontFace, "frame");
  if (v12 != *MEMORY[0x1E0C9D538] || v13 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    CGContextTranslateCTM(CurrentContext, v12, v13);
  -[PKPassFrontFaceView layer](self->_frontFace, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "renderInContext:", CurrentContext);

  CGContextRestoreGState(CurrentContext);
  v8[2](v8);

}

uint64_t __34__PKPassView_drawFrontFaceAtSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setModallyPresented:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(a1 + 32), "setSuppressedContent:", *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)canShowBarcode
{
  return PKValueAddedServicesEnabledForPass() != 0;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  self->_suppressedContent = a3;
  -[PKPassView _updateFrontFaceSuppressedContent](self, "_updateFrontFaceSuppressedContent");
}

- (PKPassFaceViewRendererState)rendererState
{
  return -[PKPassFaceView rendererState](self->_frontFace, "rendererState");
}

- (BOOL)frontFaceBodyContentCreated
{
  return -[PKPassFaceView bodyContentCreated](self->_frontFace, "bodyContentCreated");
}

- (BOOL)isPaused
{
  return -[PKPassFaceView isPaused](self->_frontFace, "isPaused");
}

- (void)setModallyPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSString *v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSString *v17;
  id v18;

  if (self->_modallyPresented != a3)
  {
    v3 = a3;
    self->_modallyPresented = a3;
    -[PKPassFaceView setModallyPresented:](self->_frontFace, "setModallyPresented:");
    if ((PKRunningInRemoteContext() & 1) == 0)
    {
      if (self->_modallyPresented)
      {
        -[PKPass uniqueID](self->_pass, "uniqueID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v5, "copy");

      }
      else
      {
        v6 = 0;
      }
      v7 = self->_suppressingIdentifier;
      objc_storeStrong((id *)&self->_suppressingIdentifier, v6);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __34__PKPassView_setModallyPresented___block_invoke;
      v16 = &unk_1E3E66C10;
      v17 = v7;
      v18 = v6;
      v8 = v6;
      v9 = v7;
      _AccessSuppressionSetForMutation(&v13);

    }
    +[PKPassViewUserActivityManager sharedInstance](PKPassViewUserActivityManager, "sharedInstance", v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
    {
      -[PKPassView pass](self, "pass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startedViewingPass:", v12);

    }
    else
    {
      objc_msgSend(v10, "endedViewingPass");
    }

  }
}

void __34__PKPassView_setModallyPresented___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "removeObject:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "addObject:");
    v3 = v4;
  }

}

- (void)setModalShadowVisibility:(double)a3
{
  -[PKPassView setModalShadowVisibility:animated:](self, "setModalShadowVisibility:animated:", 0, a3);
}

- (void)setContentMode:(int64_t)a3
{
  -[PKPassView setContentMode:animated:](self, "setContentMode:animated:", a3, 0);
}

- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPassView setContentMode:animated:withDelay:](self, "setContentMode:animated:withDelay:", a3, a4, 0.0);
}

void __48__PKPassView_setContentMode_animated_withDelay___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v3;
  dispatch_source_t *v4;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    dispatch_source_cancel(WeakRetained[60]);
    v3 = v4[60];
    v4[60] = 0;

    -[dispatch_source_t _applyContentMode:](v4, "_applyContentMode:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v4;
  }

}

- (void)didAuthenticate
{
  -[PKPassFaceView didAuthenticate](self->_frontFace, "didAuthenticate");
}

- (void)didTransact
{
  -[PKPassFaceView didTransact](self->_frontFace, "didTransact");
}

- (void)setFrontFaceExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id WeakRetained;
  _QWORD aBlock[5];

  v4 = a3;
  -[PKPass barcodeSettings](self->_pass, "barcodeSettings", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKPassView layoutIfNeeded](self, "layoutIfNeeded");
    -[PKPassView setNeedsLayout](self, "setNeedsLayout");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPassView_setFrontFaceExpanded_animated___block_invoke;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    -[PKPassFaceView setViewExpanded:](self->_frontFace, "setViewExpanded:", v4);
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 2, v7, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "passViewDidResize:animated:", self, 1);

  }
}

uint64_t __44__PKPassView_setFrontFaceExpanded_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layoutIfNeeded");
}

- (BOOL)isFrontFaceExpanded
{
  return -[PKPassFaceView viewExpanded](self->_frontFace, "viewExpanded");
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  -[PKPassFaceView presentDiff:completion:](self->_frontFace, "presentDiff:completion:", a3, a4);
}

- (void)updateValidityDisplay
{
  -[PKPassFrontFaceView updateValidity](self->_frontFace, "updateValidity");
}

- (void)_updateLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (PKIsLowEndDevice())
    -[PKPassView _updateLowEndLayerShadowAnimated:withDelay:](self, "_updateLowEndLayerShadowAnimated:withDelay:", v5, a4);
  else
    -[PKPassView _updateHighEndLayerShadowAnimated:withDelay:](self, "_updateHighEndLayerShadowAnimated:withDelay:", v5, a4);
}

- (void)_updateLowEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
  -[PKPassFaceView updateShadow:animated:withDelay:](self->_frontFace, "updateShadow:animated:withDelay:", a3, self->_modalShadowVisibility, a4);
}

- (void)_updateHighEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
  _BOOL4 v5;
  void *v7;
  double modalShadowVisibility;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  PKRemoveableAnimationTrackerStore *delayedAnimations;
  PKRemoveableAnimationTrackerStore *v32;
  PKRemoveableAnimationTrackerStore *v33;
  double v34;
  _QWORD v35[6];

  v5 = a3;
  -[PKRemoveableAnimationTrackerStore preempt](self->_delayedAnimations, "preempt");
  -[PKPassView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  modalShadowVisibility = self->_modalShadowVisibility;
  objc_msgSend(v7, "shadowRadius");
  v10 = v9;
  v11 = self->_modalShadowVisibility;
  objc_msgSend(v7, "shadowOpacity");
  v13 = v12;
  if (self->_modallyPresented)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.09803922, 1.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(v7, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  v15 = modalShadowVisibility * 10.0;
  v16 = v11 * 0.27;
  if (v5)
  {
    v17 = v13;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0;
    v20 = 0.0;
    v21 = 0;
    if (v15 != v10)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("shadowRadius"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, v15);
      objc_msgSend(v18, "addObject:", v22);
      objc_msgSend(v22, "fromValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v21 = v24;

      objc_msgSend(v22, "duration");
      v20 = fmax(v25, 0.0);

    }
    if (v16 != v17)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("shadowOpacity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v17, v16);
      objc_msgSend(v18, "addObject:", v26);
      objc_msgSend(v26, "fromValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v19 = v28;

      objc_msgSend(v26, "duration");
      v20 = fmax(v29, v20);

    }
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v30, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
      objc_msgSend(v30, "setBeginTime:", a4);
      objc_msgSend(v30, "setDuration:", v20 + a4);
      objc_msgSend(v30, "setAnimations:", v18);
      delayedAnimations = self->_delayedAnimations;
      if (!delayedAnimations)
      {
        v32 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E0D675A8]);
        v33 = self->_delayedAnimations;
        self->_delayedAnimations = v32;

        delayedAnimations = self->_delayedAnimations;
      }
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__PKPassView__updateHighEndLayerShadowAnimated_withDelay___block_invoke;
      v35[3] = &__block_descriptor_48_e38_v24__0__CALayer_8__CAAnimationGroup_16l;
      v35[4] = v21;
      v35[5] = v19;

    }
  }
  objc_msgSend(v7, "setShadowRadius:", v15);
  *(float *)&v34 = v16;
  objc_msgSend(v7, "setShadowOpacity:", v34);

}

void __58__PKPassView__updateHighEndLayerShadowAnimated_withDelay___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  float v4;
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "shadowRadius");
  objc_msgSend(v6, "setShadowRadius:", v3 + *(double *)(a1 + 32));
  objc_msgSend(v6, "shadowOpacity");
  v5 = *(double *)(a1 + 40) + v4;
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setShadowOpacity:", v5);

}

- (void)passcodeLockManager:(id)a3 didReceivePasscodeSet:(BOOL)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKPassView_passcodeLockManager_didReceivePasscodeSet___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__PKPassView_passcodeLockManager_didReceivePasscodeSet___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFrontFaceSuppressedContent");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)passFaceViewExpandButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passViewExpandButtonTapped:", self);

}

void __32__PKPassView__applyContentMode___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PKPassView__applyContentMode___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __32__PKPassView__applyContentMode___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 472) = 0;
    if (!*((_BYTE *)WeakRetained + 473))
    {
      v4 = WeakRetained;
      v3 = objc_msgSend(WeakRetained[65], "isContentLoaded");
      v2 = v4;
      if (v3)
      {
        *((_BYTE *)v4 + 473) = 1;
        objc_msgSend(v4[52], "createContentViewsWithFade:", 1);
        v2 = v4;
      }
    }
  }

}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (PKPassDynamicState)passState
{
  return self->_passState;
}

- (BOOL)isModallyPresented
{
  return self->_modallyPresented;
}

- (double)modalShadowVisibility
{
  return self->_modalShadowVisibility;
}

- (PKAccount)associatedAccount
{
  return self->_associatedAccount;
}

- (void)setAssociatedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passState, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);
  objc_storeStrong((id *)&self->_contentModeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_suppressingIdentifier, 0);
  objc_storeStrong((id *)&self->_passcodeLockManager, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_frontFace, 0);
}

@end
