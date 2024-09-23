@implementation NUNIAstronomyVistaView

- (NUNIAstronomyVistaView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NUNIAstronomyVistaView *v11;
  NUNIAstronomyVistaView *v12;
  uint64_t v13;
  CLKDevice *device;
  uint64_t v15;
  CLKUIQuadView *quadView0;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NUNIRenderer *renderer;
  double v23;
  NUNIQuad *v24;
  NUNIQuad *quad;
  CALayer *v26;
  CALayer *contentMaskLayer;
  CALayer *maskLayer;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CLKUIQuadView **v33;
  uint64_t v34;
  NSArray *quadViews;
  uint64_t v36;
  NSMutableSet *activeContentsAnimations;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  objc_super v41;
  CLKUIQuadView *v42;
  CLKUIQuadView *v43;
  const __CFString *v44;
  _QWORD v45[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v45[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  NSLog(CFSTR("NUNIAstronomyVistaView.init"));
  v41.receiver = self;
  v41.super_class = (Class)NUNIAstronomyVistaView;
  v11 = -[NUNIAstronomyVistaView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    *((_BYTE *)v11 + 504) |= 0x10u;
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_msgSend(v10, "device");
    v13 = objc_claimAutoreleasedReturnValue();
    device = v12->_device;
    v12->_device = (CLKDevice *)v13;

    +[CLKUIQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIQuadView, "quadViewWithFrame:identifier:options:colorSpace:", CFSTR("NUV0"), objc_msgSend(v10, "quadViewOptions"), objc_msgSend(v10, "colorSpace"), x, y, width, height);
    v15 = objc_claimAutoreleasedReturnValue();
    quadView0 = v12->_quadView0;
    v12->_quadView0 = (CLKUIQuadView *)v15;

    -[NUNIAstronomyVistaView _mtlQuadView](v12, "_mtlQuadView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxAPL");
    objc_msgSend(v17, "setMaxAPL:");
    -[NUNIAstronomyVistaView addSubview:](v12, "addSubview:", v12->_quadView0);
    v18 = objc_msgSend(v10, "rendererStyle");
    v19 = objc_msgSend(v17, "colorPixelFormat");
    objc_msgSend(v10, "textureSuffix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUNIRenderer sharedInstanceWithPixelFormat:textureSuffix:rendererStyle:](NUNIRenderer, "sharedInstanceWithPixelFormat:textureSuffix:rendererStyle:", v19, v20, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    renderer = v12->_renderer;
    v12->_renderer = (NUNIRenderer *)v21;

    objc_msgSend(v10, "screenScale");
    v24 = -[NUNIQuad initWithScreenScale:renderer:]([NUNIQuad alloc], "initWithScreenScale:renderer:", v12->_renderer, v23);
    quad = v12->_quad;
    v12->_quad = v24;

    -[CLKUIQuadView addQuad:](v12->_quadView0, "addQuad:", v12->_quad);
    -[CLKUIQuadView setPaused:](v12->_quadView0, "setPaused:", 1);
    -[CLKUIQuadView setDelegate:](v12->_quadView0, "setDelegate:", v12);
    if (v18 == 2)
    {
      -[CLKUIQuadView setOpaque:](v12->_quadView0, "setOpaque:", 0);
      -[CLKUIQuad setOpaque:](v12->_quad, "setOpaque:", 0);
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v26 = (CALayer *)objc_claimAutoreleasedReturnValue();
      contentMaskLayer = v12->_contentMaskLayer;
      v12->_contentMaskLayer = v26;

      objc_storeStrong((id *)&v12->maskLayer, v26);
      -[CALayer setFrame:](v12->maskLayer, "setFrame:", x, y, width, height);
      -[CALayer setCompositingFilter:](v12->maskLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
      -[CALayer setOpaque:](v12->maskLayer, "setOpaque:", 0);
      maskLayer = v12->maskLayer;
      v44 = CFSTR("contents");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](maskLayer, "setActions:", v30);

      -[NUNIRenderer setContentMaskLayer:](v12->_renderer, "setContentMaskLayer:", v12->maskLayer);
      objc_msgSend(v17, "metalLayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSublayer:", v12->maskLayer);

      v43 = v12->_quadView0;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = &v43;
    }
    else
    {
      v42 = v12->_quadView0;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = &v42;
    }
    objc_msgSend(v32, "arrayWithObjects:count:", v33, 1);
    v34 = objc_claimAutoreleasedReturnValue();
    quadViews = v12->_quadViews;
    v12->_quadViews = (NSArray *)v34;

    v12->_vista = -1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    activeContentsAnimations = v12->_activeContentsAnimations;
    v12->_activeContentsAnimations = (NSMutableSet *)v36;

    *((_BYTE *)v12 + 504) |= 2u;
    objc_msgSend(v10, "initialSetupOperation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v10, "initialSetupOperation");
      v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NUNIAstronomyVistaView *))v39)[2](v39, v12);

    }
  }

  return v12;
}

- (void)discardContents
{
  void *v2;
  id v3;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discardContents");

}

- (void)removeBackBuffers
{
  void *v2;
  id v3;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBackBuffers");

}

- (void)setTritiumBrightness:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_quadViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setTritiumBrightness:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  NUNIQuad *quad;
  CLKUIQuadView *quadView0;
  void *v5;
  objc_super v6;

  -[NUNIAstronomyVistaView _stopAnimation](self, "_stopAnimation");
  quad = self->_quad;
  self->_quad = 0;

  -[CLKUIQuadView removeAllQuads](self->_quadView0, "removeAllQuads");
  quadView0 = self->_quadView0;
  self->_quadView0 = 0;

  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAllUnused");

  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyVistaView;
  -[NUNIAstronomyVistaView dealloc](&v6, sel_dealloc);
}

- (void)purgeUnused
{
  -[NUNIRenderer purgeUnusedWithScene:](self->_renderer, "purgeUnusedWithScene:", self->_scene);
}

- (id)snapshotImage
{
  CLKUIQuadView *quadView0;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  quadView0 = self->_quadView0;
  -[NUNIAstronomyVistaView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NUNIAstronomyVistaView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screenScale");
  -[CLKUIQuadView snapshotInRect:scale:time:](quadView0, "snapshotInRect:scale:time:", v5, v7, v9, v11, v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (float)computeDimming
{
  void *v2;
  float v3;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CLKUIComputeDimmingRequiredToObtainQuadAPL(v2, 0.021, 1.0);

  return v3;
}

- (id)_mtlQuadView
{
  return self->_quadView0;
}

- (void)setAPLFilterAmount:(double)a3
{
  double v4;
  id v5;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setAplFilterAmount:", v4);

}

- (NUNIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  NUNIScene *v5;

  v5 = (NUNIScene *)a3;
  if (self->_scene != v5)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    -[NUNIQuad setScene:](self->_quad, "setScene:", v5);
  }

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUNIAstronomyVistaView;
  if (-[NUNIAstronomyVistaView isOpaque](&v8, sel_isOpaque) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)NUNIAstronomyVistaView;
    -[NUNIAstronomyVistaView setOpaque:](&v7, sel_setOpaque_, v3);
    if (v3)
      v5 = 2;
    else
      v5 = 1;
    -[NUNIScene setBackgroundType:](self->_scene, "setBackgroundType:", v5);
    -[NSArray lastObject](self->_quadViews, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOpaque:", v3);

  }
}

- (void)setFrameInterval:(int64_t)a3
{
  uint64_t v4;

  if (self->_frameInterval != a3)
  {
    self->_frameInterval = a3;
    v4 = _NUNIFrameIntervalToFramesPerSecond_framePerSeconds[a3];
    if (-[CLKUIQuadView preferredFramesPerSecond](self->_quadView0, "preferredFramesPerSecond") != v4)
      -[CLKUIQuadView setPreferredFramesPerSecond:](self->_quadView0, "setPreferredFramesPerSecond:", v4);
  }
}

- (void)updateSunLocationAnimated:(BOOL)a3
{
  -[NUNIScene updateSunLocationAnimated:](self->_scene, "updateSunLocationAnimated:", a3);
}

- (void)updateSunLocationForDate:(id)a3
{
  -[NUNIScene updateSunLocationForDate:animated:](self->_scene, "updateSunLocationForDate:animated:", a3, 0);
  if (self->_pauseAnimationWhenNoUpdate)
    -[NUNIAstronomyVistaView debouncedEventHandler](self, "debouncedEventHandler");
}

- (void)debouncedEventHandler
{
  NSTimer *v3;
  NSTimer *debounceTimer;

  -[NUNIAstronomyVistaView startAnimation](self, "startAnimation");
  -[NSTimer invalidate](self->_debounceTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_performDebouncedAction, 0, 0, 1.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  debounceTimer = self->_debounceTimer;
  self->_debounceTimer = v3;

}

- (void)_startAnimation
{
  if (-[CLKUIQuadView isPaused](self->_quadView0, "isPaused"))
    -[CLKUIQuadView setPaused:](self->_quadView0, "setPaused:", 0);
}

- (void)_stopAnimation
{
  if (!-[CLKUIQuadView isPaused](self->_quadView0, "isPaused"))
    -[CLKUIQuadView setPaused:](self->_quadView0, "setPaused:", 1);
}

- (void)startAnimation
{
  NUNIRenderer *renderer;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if ((*((_BYTE *)self + 504) & 8) == 0 && (*((_BYTE *)self + 504) & 4) == 0)
  {
    NSLog(CFSTR("NUNIAstronomyVistaView:startAnimation"), a2);
    *((_BYTE *)self + 504) |= 8u;
    objc_initWeak(&location, self);
    renderer = self->_renderer;
    -[NUNIScene spheroids](self->_scene, "spheroids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__NUNIAstronomyVistaView_startAnimation__block_invoke;
    v5[3] = &unk_1E6076580;
    objc_copyWeak(&v6, &location);
    -[NUNIRenderer prepareForRenderingSpheroids:completionHandler:](renderer, "prepareForRenderingSpheroids:completionHandler:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__NUNIAstronomyVistaView_startAnimation__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[504] &= ~8u;
    WeakRetained[504] |= 4u;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAnimation");
    WeakRetained = v2;
  }

}

- (void)stopAnimation
{
  if ((*((_BYTE *)self + 504) & 4) != 0)
  {
    NSLog(CFSTR("NUNIAstronomyVistaView:stopAnimation"), a2);
    *((_BYTE *)self + 504) &= ~4u;
    *((_BYTE *)self + 504) &= ~8u;
    -[NUNIAstronomyVistaView _updateAnimation](self, "_updateAnimation");
  }
}

- (void)_updateAnimation
{
  if ((*((_BYTE *)self + 504) & 4) != 0 && (*((_BYTE *)self + 504) & 2) != 0)
    -[NUNIAstronomyVistaView _startAnimation](self, "_startAnimation");
  else
    -[NUNIAstronomyVistaView _stopAnimation](self, "_stopAnimation");
}

- (void)renderOnce
{
  if ((*((_BYTE *)self + 504) & 4) == 0)
    -[NUNIAstronomyVistaView startAnimation](self, "startAnimation");
  *((_BYTE *)self + 504) &= ~0x10u;
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView0, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NUNIAstronomyVistaView;
  -[NUNIAstronomyVistaView layoutSubviews](&v12, sel_layoutSubviews);
  -[NUNIAstronomyVistaView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  if (*MEMORY[0x1E0C9D820] != v5 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v6)
  {
    v10 = v5;
    v11 = v6;
    -[CALayer setFrame:](self->maskLayer, "setFrame:", v3, v4);
    -[CLKUIQuadView setFrame:](self->_quadView0, "setFrame:", v7, v8, v10, v11);
  }
}

- (id)rotatable:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 <= 9 && ((0x3FBu >> a3) & 1) != 0)
  {
    -[NUNIScene spheroidOfType:](self->_scene, "spheroidOfType:", qword_1B0024800[a3], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  char v7;
  NUNIScene *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NUNIAnimation *v16;
  float v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  double v22;
  float v23;
  float v24;
  BOOL v25;
  double v26;
  NUNIAnimation *v27;
  double v28;
  unint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  float v33;
  double v34;
  float v35;
  float v36;
  double v37;
  int32x2_t v38;
  float v39;
  float v40;
  float v41;
  double v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  float64x2_t v55;
  float32x2_t v56;
  int v57;
  double v58;
  float v59;
  float v60;
  BOOL v61;
  float v62;
  NUNIAnimation *v63;
  double v64;
  double v65;
  float v66;
  NUNIAnimation *v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  int v75;
  double v76;
  char v77;
  double v78;
  NUNIAnimation *v79;
  double v80;
  float v81;
  NUNIAnimation *v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  float32x2_t v87;
  NUNIScene *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v4 = a4;
  v5 = a3;
  v104 = *MEMORY[0x1E0C80C00];
  v7 = *((_BYTE *)self + 504);
  v8 = self->_scene;
  if (v8 && self->_vista == 2 && ((((v7 & 1) == 0) ^ v5) & 1) == 0)
  {
    while (-[NSMutableSet count](self->_activeContentsAnimations, "count"))
    {
      -[NSMutableSet anyObject](self->_activeContentsAnimations, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUNIScene removeAnimation:](v8, "removeAnimation:", v9);

    }
    *((_BYTE *)self + 504) = *((_BYTE *)self + 504) & 0xFE | v5;
    v88 = v8;
    if (v5)
    {
      -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
      v11 = v10;
      -[CLKDevice screenBounds](self->_device, "screenBounds");
      v13 = v12;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      -[NUNIScene spheroids](v8, "spheroids");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = v11 / v13;
        v85 = *(_QWORD *)v99;
        *((float *)&v84 + 1) = v17;
        *(float *)&v84 = v17 * 0.5;
        while (1)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v99 != v85)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v18);
            v20 = objc_msgSend(v19, "type", v84);
            v21 = 1 << v20;
            LODWORD(v22) = 897988541;
            if ((_DWORD)v20 != 4)
            {
              v23 = *((float *)&v84 + 1);
              if ((v21 & 0x3000) != 0 || (v23 = *(float *)&v84, ((1 << v20) & 0xFBFBFE) != 0))
              {
                objc_msgSend(v19, "radius", v22);
                *(float *)&v22 = v23 / *(float *)&v22;
              }
              else
              {
                LODWORD(v22) = 1.0;
              }
            }
            v89 = v22;
            objc_msgSend(v19, "radiusScale");
            v25 = v24 == *(float *)&v89;
            v26 = v89;
            if (!v25)
            {
              if (v4)
              {
                v27 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v19, 6, *(double *)vdupq_lane_s32(*(int32x2_t *)&v89, 0).i64);

                LODWORD(v28) = 1062557008;
                -[NUNIAnimation setDuration:](v27, "setDuration:", v28);
                -[NUNIAnimation setObserver:](v27, "setObserver:", self);
                -[NUNIScene addAnimation:](v88, "addAnimation:", v27);
                -[NSMutableSet addObject:](self->_activeContentsAnimations, "addObject:", v27);
                v16 = v27;
                v8 = v88;
              }
              else
              {
                objc_msgSend(v19, "setRadiusScale:", v89);
              }
            }
            if (((1 << v20) & 0xFFF000) == 0)
            {
              objc_msgSend(v19, "opacity", v26);
              if (*(float *)&v37 == 0.0)
                goto LABEL_43;
              v38.i32[0] = 0;
              if (v4)
                goto LABEL_40;
LABEL_42:
              LODWORD(v37) = v38.i32[0];
              objc_msgSend(v19, "setOpacity:", v37);
              goto LABEL_43;
            }
            if ((v21 & 0x3000) != 0)
              v29 = 7;
            else
              v29 = v20 - 14;
            if (v29 <= 3)
              v30 = 0;
            else
              v30 = -1;
            if (-[NUNIAstronomyVistaConfiguration isRTLLayout](self->_configuration, "isRTLLayout", v26))
            {
              -[CLKDevice screenBounds](self->_device, "screenBounds");
              v32 = v31;
              -[NUNIAstronomyVistaView supplementalHorizontalInset](self, "supplementalHorizontalInset");
              v34 = v32 - v33;
              -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
              v36 = v34 + (float)(v35 * -0.5);
            }
            else
            {
              -[NUNIAstronomyVistaView supplementalHorizontalInset](self, "supplementalHorizontalInset");
              v40 = v39;
              -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
              v36 = v40 + (float)(v41 * 0.5);
            }
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v43 = v42;
            -[NUNIAstronomyVistaView supplementalTopInset](self, "supplementalTopInset");
            v45 = v43 - v44;
            -[NUNIAstronomyVistaView supplementalBottomInset](self, "supplementalBottomInset");
            v47 = (v45 - v46) / 7.0;
            -[NUNIAstronomyVistaView supplementalTopInset](self, "supplementalTopInset");
            v49 = v48 + v47 * (double)(v29 + v30 - 1);
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v51 = v50;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            *(float *)&v51 = v51 / v52;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v90 = v36 / v53;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v55.f64[0] = v90;
            v55.f64[1] = (v49 / v54 + -0.5) * (float)-*(float *)&v51 + 0.5;
            v56 = vadd_f32(vcvt_f32_f64(v55), (float32x2_t)0xBF000000BF000000);
            *(float32x2_t *)&v55.f64[0] = vmul_f32(v56, v56);
            *(float *)v55.f64 = sqrtf(vmlas_n_f32(*((float *)v55.f64 + 1), v56.f32[0], v56.f32[0]));
            v91 = v55.f64[0];
            v87 = vdiv_f32(v56, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v55.f64[0], 0));
            objc_msgSend(v19, "angle");
            LODWORD(v51) = v57;
            *(float *)&v58 = atan2f(v87.f32[1], v87.f32[0]);
            *(float *)&v58 = *(float *)&v58 + (float)(floorf(*(float *)&v58 / 6.2832) * -6.2832);
            v59 = vabds_f32(*(float *)&v58, *(float *)&v51);
            if (*(float *)&v51 >= *(float *)&v58)
              v60 = 6.2832;
            else
              v60 = -6.2832;
            v61 = v59 <= 3.1416;
            v62 = -0.0;
            if (!v61)
              v62 = v60;
            *(float *)&v58 = *(float *)&v58 + v62;
            if (v4)
            {
              v63 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v19, 7, *(double *)vdupq_lane_s32(*(int32x2_t *)&v58, 0).i64);

              LODWORD(v64) = 1062557008;
              -[NUNIAnimation setDuration:](v63, "setDuration:", v64);
              -[NUNIScene addAnimation:](v8, "addAnimation:", v63);
              v16 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v19, 4, *(double *)vdupq_lane_s32(*(int32x2_t *)&v91, 0).i64);

              LODWORD(v65) = 1062557008;
              -[NUNIAnimation setDuration:](v16, "setDuration:", v65);
              -[NUNIAnimation setObserver:](v16, "setObserver:", self);
              -[NUNIScene addAnimation:](v8, "addAnimation:", v16);
              -[NSMutableSet addObject:](self->_activeContentsAnimations, "addObject:", v16);
              objc_msgSend(v19, "opacity");
              v38.i32[0] = 1.0;
              if (v66 == 1.0)
                goto LABEL_43;
LABEL_40:
              v67 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v19, 8, *(double *)vdupq_lane_s32(v38, 0).i64);

              LODWORD(v68) = 1062557008;
              -[NUNIAnimation setDuration:](v67, "setDuration:", v68);
              -[NUNIAnimation setObserver:](v67, "setObserver:", self);
              -[NUNIScene addAnimation:](v8, "addAnimation:", v67);
              -[NSMutableSet addObject:](self->_activeContentsAnimations, "addObject:", v67);
              v16 = v67;
              goto LABEL_43;
            }
            objc_msgSend(v19, "setAngle:", v58);
            objc_msgSend(v19, "setDistance:", v91);
            objc_msgSend(v19, "opacity");
            v38.i32[0] = 1.0;
            if (*(float *)&v37 != 1.0)
              goto LABEL_42;
LABEL_43:
            ++v18;
          }
          while (v15 != v18);
          v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
          v15 = v69;
          if (!v69)
            goto LABEL_71;
        }
      }
LABEL_70:
      v16 = 0;
      goto LABEL_71;
    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[NUNIScene spheroids](v8, "spheroids");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    if (!v70)
      goto LABEL_70;
    v71 = v70;
    v16 = 0;
    v72 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v95 != v72)
          objc_enumerationMutation(obj);
        v74 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        v75 = objc_msgSend(v74, "type");
        v77 = v75;
        if (v75 == 4)
          *(float *)&v76 = 0.000001;
        else
          *(float *)&v76 = 1.0;
        v92 = v76;
        objc_msgSend(v74, "radiusScale");
        if (*(float *)&v78 != *(float *)&v92)
        {
          if (v4)
          {
            v79 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v74, 6, *(double *)vdupq_lane_s32(*(int32x2_t *)&v92, 0).i64);

            LODWORD(v80) = 1054168400;
            -[NUNIAnimation setDuration:](v79, "setDuration:", v80);
            -[NUNIAnimation setObserver:](v79, "setObserver:", self);
            -[NUNIScene addAnimation:](v88, "addAnimation:", v79);
            -[NSMutableSet addObject:](self->_activeContentsAnimations, "addObject:", v79);
            v16 = v79;
            v8 = v88;
          }
          else
          {
            objc_msgSend(v74, "setRadiusScale:", v92);
          }
        }
        if (((1 << v77) & 0xFFF400) != 0)
          *(float *)&v78 = 1.0;
        else
          *(float *)&v78 = 0.0;
        v93 = v78;
        objc_msgSend(v74, "opacity");
        if (v81 != *(float *)&v93)
        {
          if (v4)
          {
            v82 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v74, 8, *(double *)vdupq_lane_s32(*(int32x2_t *)&v93, 0).i64);

            LODWORD(v83) = 1062557008;
            -[NUNIAnimation setDuration:](v82, "setDuration:", v83);
            -[NUNIAnimation setObserver:](v82, "setObserver:", self);
            -[NUNIScene addAnimation:](v8, "addAnimation:", v82);
            -[NSMutableSet addObject:](self->_activeContentsAnimations, "addObject:", v82);
            v16 = v82;
          }
          else
          {
            objc_msgSend(v74, "setOpacity:", v93);
          }
        }
      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v71);
LABEL_71:

  }
}

- (id)_earthLunaPanAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6;
  void *v7;
  NUNIScene *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  float32x4_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  float32x4_t v27;
  int v28;
  int v29;
  uint64_t v30;
  NUNIAnimation *v31;
  float v32;
  float v33;
  uint64_t v34;
  void *v39;
  uint64_t v40;
  int32x2_t v41;
  int32x2_t v42;
  NUNIAnimation *v43;
  NUNIAnimation *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  NUNIAnimation *v51;
  NUNIAnimation *v52;
  uint64_t v53;
  NUNIAnimation *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  NUNIAnimation *v60;
  uint64_t v61;
  NUNIAnimation *v62;
  NUNIAnimation *v63;
  float v66;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  NUNIScene *v75;
  float v77;
  float32x4_t v78;
  float v79;
  float32x4_t v80;
  float v81;
  float32x4_t v82;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float v89;
  float v90;
  float32x4_t v91;
  float32x4_t v92;
  __float2 v93;
  __float2 v94;
  float32x4_t v95;
  __float2 v96;
  __float2 v97;
  float32x4_t v98;
  void *v99;
  void *v100;
  __float2 v101;
  __float2 v102;
  float32x4_t v103;
  int32x4_t v107;
  float32x4_t v111;
  NUNIAnimation *v112;
  NUNIAnimation *v113;
  NUNIAnimation *v114;
  unint64_t v115;
  void *v116;
  NUNIAnimation *v117;
  NUNIAnimation *v118;
  NUNIAnimation *v119;
  NUNIAnimation *v127;
  NUNIAnimation *v128;
  uint32x2_t v129;
  NUNIAnimation *v130;
  uint32x2_t v131;
  NUNIAnimation *v132;
  float32x4_t v134;
  int32x2_t v135;
  int32x2_t v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  int v141;
  double v142;
  double v143;
  double v144;
  double v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  NUNIAstronomyVistaView *v149;
  NUNIScene *v150;
  id v151;
  float32x4_t v152;
  double v153;
  double v154;
  double v155;
  int32x2_t v156;
  int32x2_t v157;
  int32x2_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float v161;
  int32x2_t v162;
  float32x4_t v163;
  float32x4_t v164;
  float32x4_t v165;
  double v166;
  int32x2_t v167;
  float v168;
  float v169;
  float32x4_t v170;
  double v171;
  int32x2_t v172;
  float v173;
  float v174;
  float32x4_t v175;
  int32x2_t v176;
  float32x4_t v177;
  float32x4_t v178;
  float32x4_t v179;
  _BYTE v180[20];

  v6 = a3;
  v151 = a4;
  v7 = (void *)objc_opt_new();
  v8 = self->_scene;
  -[NUNIScene updateSunLocationAnimated:](v8, "updateSunLocationAnimated:", 0);
  v149 = self;
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", objc_msgSend(v6, "vista"), v8);
  objc_msgSend(v6, "updateBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v9 + 16))(v9, v8);
    -[NUNIScene updateCamera](v8, "updateCamera");
  }
  v139 = v10;
  v11 = -[NUNIScene structure](v8, "structure");
  v152 = *(float32x4_t *)(v11 + 16);
  v12 = *(float32x4_t *)(v11 + 32);
  v147 = *(float32x4_t *)v11;
  v148 = v12;
  v12.i32[0] = *(_DWORD *)(v11 + 52);
  v136 = *(int32x2_t *)v12.f32;
  v144 = *(double *)(v11 + 96);
  v145 = *(double *)(v11 + 104);
  v150 = v8;
  -[NUNIScene spheroids](v8, "spheroids");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v138 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32 * v14));
  v15 = objc_msgSend(v138, "mutableBytes");
  v141 = objc_msgSend(v6, "isEarth");
  v140 = v6;
  v16 = objc_msgSend(v6, "isLuna");
  if (v14)
  {
    v17 = 0;
    if (v16)
      v18 = 1.0;
    else
      v18 = 0.00001;
    if (v141)
      v19 = 1.0;
    else
      v19 = 0.00001;
    v20 = v15;
    do
    {
      objc_msgSend(v13, "objectAtIndex:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "structure");
      v23 = v19;
      if (*(_QWORD *)v22 != 3)
      {
        v23 = *(float *)(v22 + 88);
        if (*(_QWORD *)v22 == 4)
          v23 = v18;
      }
      *(_OWORD *)&v180[4] = *(_OWORD *)(v22 + 32);
      v24 = *(_QWORD *)(v22 + 48);
      *(float *)v20 = v23;
      *(_QWORD *)(v20 + 4) = v24;
      *(_DWORD *)(v20 + 28) = *(_DWORD *)&v180[16];
      *(_OWORD *)(v20 + 12) = *(_OWORD *)v180;

      ++v17;
      v20 += 32;
    }
    while (v14 != v17);
  }
  -[NUNIAstronomyVistaView _setVista:scene:](v149, "_setVista:scene:", objc_msgSend(v151, "vista"), v150);
  objc_msgSend(v151, "updateBlock");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v25 + 16))(v25, v150);
    -[NUNIScene updateCamera](v150, "updateCamera");
  }
  v137 = v26;
  v146 = *(float32x4_t *)v11;
  v27 = *(float32x4_t *)v11;
  v27.i32[0] = *(_DWORD *)(v11 + 52);
  v135 = *(int32x2_t *)v27.f32;
  v142 = *(double *)(v11 + 96);
  v143 = *(double *)(v11 + 104);
  v28 = objc_msgSend(v151, "isEarth", *(_QWORD *)(v11 + 32), *(_QWORD *)(v11 + 40));
  v29 = objc_msgSend(v151, "isLuna");
  if (v14)
  {
    v30 = 0;
    v31 = 0;
    if (v29)
      v32 = 1.0;
    else
      v32 = 0.00001;
    if (v28)
      v33 = 1.0;
    else
      v33 = 0.00001;
    v34 = v15 + 8;
    __asm { FMOV            V0.4S, #1.0 }
    v155 = *(double *)&_Q0;
    while (1)
    {
      objc_msgSend(v13, "objectAtIndex:", v30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "structure");
      *(float *)v41.i32 = v33;
      v176 = v41;
      if (*(_QWORD *)v40 != 3)
      {
        v41.i32[0] = *(_DWORD *)(v40 + 88);
        if (*(_QWORD *)v40 == 4)
          *(float *)v41.i32 = v32;
        v176 = v41;
      }
      v41.i32[0] = *(_DWORD *)(v34 - 8);
      v172 = v41;
      v41.i32[0] = *(_DWORD *)(v34 - 4);
      v167 = v41;
      v41.i32[0] = *(_DWORD *)v34;
      v158 = v41;
      v164 = *(float32x4_t *)(v34 + 8);
      v42.i32[1] = v164.i32[1];
      v42.i32[0] = *(_DWORD *)(v40 + 48);
      v156 = v42;
      v42.i32[0] = *(_DWORD *)(v40 + 52);
      v157 = v42;
      v160 = *(float32x4_t *)(v40 + 32);
      *(_QWORD *)&v153 = vdupq_lane_s32(v176, 0).u64[0];
      *(_QWORD *)&v154 = vdupq_lane_s32(v172, 0).u64[0];
      v43 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v39, 6, v154);

      -[NUNIAnimation setFunction:](v43, "setFunction:", 0);
      if (*(float *)v172.i32 == 1.0 && *(float *)v176.i32 <= 0.00001)
        break;
      v44 = [NUNIAnimation alloc];
      if (*(float *)v172.i32 <= 0.00001 && *(float *)v176.i32 == 1.0)
      {
        v48 = 0.0;
        v49 = 0.0;
        v47 = v39;
        v45 = v155;
        v46 = v155;
        goto LABEL_38;
      }
      v51 = -[NUNIAnimation initWithAnimatable:from:to:key:](v44, "initWithAnimatable:from:to:key:", v39, 6, v154, v153);

      v52 = v51;
      v53 = 0;
LABEL_39:
      -[NUNIAnimation setFunction:](v52, "setFunction:", v53);
      objc_msgSend(v7, "addObject:", v51);
      if (*(float *)v167.i32 == 1.0 && *(float *)v156.i32 == 0.0)
      {
        v54 = [NUNIAnimation alloc];
        v55 = 0.0;
        v56 = 0.0000305175853;
        v57 = v39;
        v58 = v155;
        v59 = v155;
      }
      else
      {
        v54 = [NUNIAnimation alloc];
        if (*(float *)v167.i32 != 0.0 || *(float *)v156.i32 != 1.0)
        {
          v31 = -[NUNIAnimation initWithAnimatable:from:to:key:](v54, "initWithAnimatable:from:to:key:", v39, 8, *(double *)vdupq_lane_s32(v167, 0).i64, *(double *)vdupq_lane_s32(v156, 0).i64);

          v60 = v31;
          v61 = 0;
          goto LABEL_47;
        }
        v58 = 0.0;
        v59 = 0.0000305175853;
        v57 = v39;
        v55 = v155;
        v56 = v155;
      }
      v31 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v54, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v57, 8, v58, v55, v59, v56);

      v60 = v31;
      v61 = 2;
LABEL_47:
      -[NUNIAnimation setFunction:](v60, "setFunction:", v61);
      objc_msgSend(v7, "addObject:", v31);
      if (*(float *)v158.i32 != *(float *)v157.i32)
      {
        v62 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v39, 11, *(double *)vdupq_lane_s32(v158, 0).i64, *(double *)vdupq_lane_s32(v157, 0).i64);

        -[NUNIAnimation setFunction:](v62, "setFunction:", 0);
        objc_msgSend(v7, "addObject:", v62);
        v31 = v62;
      }
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v164, v160)) & 0x80000000) == 0)
      {
        v63 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v39, 2, *(double *)v164.i64, *(double *)v160.i64);

        -[NUNIAnimation setFunction:](v63, "setFunction:", 4);
        objc_msgSend(v7, "addObject:", v63);
        v31 = v63;
      }

      ++v30;
      v34 += 32;
      if (v14 == v30)
        goto LABEL_54;
    }
    v44 = [NUNIAnimation alloc];
    v45 = 0.0;
    v46 = 0.0;
    v47 = v39;
    v48 = v155;
    v49 = v155;
LABEL_38:
    v51 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v44, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v47, 6, v48, v45, v49, v46);

    v52 = v51;
    v53 = 2;
    goto LABEL_39;
  }
  v31 = 0;
LABEL_54:
  _Q1 = vsubq_f32(v147, v152);
  _S9 = _Q1.i32[2];
  v66 = _Q1.f32[1];
  __asm { FMLA            S0, S9, V1.S[2] }
  v173 = sqrtf(_S0);
  v177 = _Q1;
  v168 = acosf(_Q1.f32[2] / v173);
  _Q0.f32[0] = atan2f(v66, v177.f32[0]);
  v161 = _Q0.f32[0];
  _Q1 = _Q0;
  _Q1.f32[1] = v168;
  _Q1.f32[2] = v173;
  v165 = _Q1;
  v159 = vsubq_f32(v146, v152);
  _Q1.i32[0] = v159.i32[2];
  __asm { FMLA            S0, S1, V2.S[2] }
  v169 = sqrtf(_Q0.f32[0]);
  v174 = acosf(v159.f32[2] / v169);
  v70.f32[0] = atan2f(v159.f32[1], v159.f32[0]);
  v73.f32[0] = v161 - v70.f32[0];
  if ((float)(v161 - v70.f32[0]) <= 3.1416)
  {
    v74 = v165;
    v71 = v165;
    v75 = v150;
    if (v73.f32[0] < -3.1416)
    {
      v71.f32[0] = v161 + 6.2832;
      *(uint64_t *)((char *)v71.i64 + 4) = *(uint64_t *)((char *)v165.i64 + 4);
    }
  }
  else
  {
    v71.f32[0] = v161 + -6.2832;
    v74 = v165;
    *(uint64_t *)((char *)v71.i64 + 4) = *(uint64_t *)((char *)v165.i64 + 4);
    v75 = v150;
  }
  _V21.S[2] = v177.i32[2];
  if ((float)(v71.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v71.f32[1] - v174) >= -3.1416)
      goto LABEL_63;
    v77 = 6.2832;
  }
  else
  {
    v77 = -6.2832;
  }
  v78.i64[0] = __PAIR64__(v71.f32[1] + v77, v71.u32[0]);
  v78.i64[1] = v71.i64[1];
  v71 = v78;
LABEL_63:
  v70.f32[1] = v174;
  if (v73.f32[0] <= 3.1416)
  {
    v72 = v74;
    if (v73.f32[0] >= -3.1416)
      goto LABEL_68;
    v79 = 6.2832;
  }
  else
  {
    v79 = -6.2832;
  }
  v72.f32[0] = v161 + v79;
  v72.i32[1] = v74.i32[1];
  v72.i32[2] = v74.i32[2];
LABEL_68:
  v70.f32[2] = v169;
  v80 = (float32x4_t)vdupq_n_s32(0x3EA8F5C3u);
  if ((float)(v72.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v72.f32[1] - v174) >= -3.1416)
      goto LABEL_73;
    v81 = 6.2832;
  }
  else
  {
    v81 = -6.2832;
  }
  v82.i64[0] = __PAIR64__(v72.f32[1] + v81, v72.u32[0]);
  v82.i64[1] = v72.i64[1];
  v72 = v82;
LABEL_73:
  __asm { FMLA            S4, S9, V21.S[2] }
  v84 = (float32x4_t)vdupq_n_s32(0x3F2B851Eu);
  v85 = vmulq_f32(v70, v80);
  v86 = vmulq_f32(v70, (float32x4_t)vdupq_n_s32(0x3F28F5C3u));
  v87 = (float32x4_t)vdupq_n_s32(0x3EAE147Au);
  if (v73.f32[0] <= 3.1416)
  {
    if (v73.f32[0] >= -3.1416)
      goto LABEL_78;
    v73.i32[0] = 1086918619;
  }
  else
  {
    v73.i32[0] = -1060565029;
  }
  v73.f32[0] = v161 + v73.f32[0];
  v73.i32[1] = v74.i32[1];
  v73.i32[2] = v74.i32[2];
  v74 = v73;
LABEL_78:
  v88 = vmlaq_f32(v85, v84, v71);
  v89 = sqrtf(_S4);
  v178 = vmlaq_f32(v86, v87, v72);
  if ((float)(v74.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v74.f32[1] - v174) >= -3.1416)
      goto LABEL_83;
    v90 = 6.2832;
  }
  else
  {
    v90 = -6.2832;
  }
  v91.i32[0] = v74.i32[0];
  v91.f32[1] = v74.f32[1] + v90;
  v91.i64[1] = v74.i64[1];
  v74 = v91;
LABEL_83:
  v92.i64[0] = 0x3F0000003F000000;
  v92.i64[1] = 0x3F0000003F000000;
  v170 = v88;
  v175 = vmlaq_f32(vmulq_f32(v70, v92), v92, v74);
  v93 = __sincosf_stret(v88.f32[0]);
  v94 = __sincosf_stret(v170.f32[1]);
  *(float32x2_t *)v95.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v93.__sinval), LODWORD(v93.__cosval)), vmuls_lane_f32(v94.__sinval, v170, 2));
  v95.i32[2] = vmuls_lane_f32(v94.__cosval, v170, 2);
  *(_QWORD *)&v171 = vaddq_f32(v152, v95).u64[0];
  v96 = __sincosf_stret(v178.f32[0]);
  v97 = __sincosf_stret(v178.f32[1]);
  *(float32x2_t *)v98.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v96.__sinval), LODWORD(v96.__cosval)), vmuls_lane_f32(v97.__sinval, v178, 2));
  v98.i32[2] = vmuls_lane_f32(v97.__cosval, v178, 2);
  *(_QWORD *)&v166 = vaddq_f32(v152, v98).u64[0];
  -[NUNIScene spheroidOfType:](v75, "spheroidOfType:", 3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIScene spheroidOfType:](v75, "spheroidOfType:", 4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = __sincosf_stret(v175.f32[0]);
  v102 = __sincosf_stret(v175.f32[1]);
  *(float32x2_t *)v103.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v101.__sinval), LODWORD(v101.__cosval)), vmuls_lane_f32(v102.__sinval, v175, 2));
  v103.i32[2] = vmuls_lane_f32(v102.__cosval, v175, 2);
  _Q0 = vsubq_f32(vaddq_f32(v152, v103), v152);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v107 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v107, (int8x16_t)v107, 0xCuLL), (int8x16_t)v107, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v148, (int32x4_t)v148), (int8x16_t)v148, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v107, v107), (int8x16_t)v107, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v148, (int8x16_t)v148, 0xCuLL), (int8x16_t)v148, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v111 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  v179 = v111;
  v111.f32[0] = v89 * 0.75;
  v162 = *(int32x2_t *)v111.f32;
  v112 = [NUNIAnimation alloc];
  v163 = (float32x4_t)vdupq_lane_s32(v162, 0);
  if ((v141 & 1) != 0)
  {
    v113 = -[NUNIAnimation initWithAnimatable:from:to:key:](v112, "initWithAnimatable:from:to:key:", v99, 0);

    -[NUNIAnimation setFunction:](v113, "setFunction:", 0);
    objc_msgSend(v7, "addObject:", v113);
    v114 = [NUNIAnimation alloc];
    v115 = vmlaq_f32(v152, v163, v179).u64[0];
    v116 = v100;
  }
  else
  {
    v113 = -[NUNIAnimation initWithAnimatable:from:to:key:](v112, "initWithAnimatable:from:to:key:", v100, 0);

    -[NUNIAnimation setFunction:](v113, "setFunction:", 0);
    objc_msgSend(v7, "addObject:", v113);
    v114 = [NUNIAnimation alloc];
    v115 = vmlsq_f32(v152, v163, v179).u64[0];
    v116 = v99;
  }
  v117 = -[NUNIAnimation initWithAnimatable:from:to:key:](v114, "initWithAnimatable:from:to:key:", v116, 0, *(double *)&v115, *(double *)v152.i64);

  -[NUNIAnimation setFunction:](v117, "setFunction:", 0);
  objc_msgSend(v7, "addObject:", v117);
  v118 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v75, 0, *(double *)v147.i64, *(double *)v146.i64, v171, v166);

  -[NUNIAnimation setFunction:](v118, "setFunction:", 2);
  objc_msgSend(v7, "addObject:", v118);
  v119 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v134, _Q3), _Q4, v148);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v134, _Q4), _Q3, v148);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v127 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v119, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v75, 2, *(double *)v148.i64, *(double *)v134.i64, *(double *)_Q2.i64, *(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64);

  -[NUNIAnimation setFunction:](v127, "setFunction:", 2);
  objc_msgSend(v7, "addObject:", v127);
  v128 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v75, 3, *(double *)vdupq_lane_s32(v136, 0).i64, *(double *)vdupq_lane_s32(v135, 0).i64);

  -[NUNIAnimation setFunction:](v128, "setFunction:", 0);
  objc_msgSend(v7, "addObject:", v128);
  v129 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v144, *(float32x2_t *)&v142);
  if ((vpmin_u32(v129, v129).u32[0] & 0x80000000) == 0)
  {
    v130 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v75, 6, v144, v142);

    -[NUNIAnimation setFunction:](v130, "setFunction:", 0);
    objc_msgSend(v7, "addObject:", v130);
    v128 = v130;
  }
  v131 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v145, *(float32x2_t *)&v143);
  if ((vpmin_u32(v131, v131).u32[0] & 0x80000000) == 0)
  {
    v132 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v75, 7, v145, v143);

    -[NUNIAnimation setFunction:](v132, "setFunction:", 0);
    objc_msgSend(v7, "addObject:", v132);
    v128 = v132;
  }
  -[NUNIAstronomyVistaView _setVista:scene:](v149, "_setVista:scene:", v149->_vista, v75);

  return v7;
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a3 == a4)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[NUNIAstronomyVistaView generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:](self, "generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:", a3, 0, a4, 0, a5, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 fromSceneBlock:(id)a4 toVista:(unint64_t)a5 toSceneBlock:(id)a6 transitionStyle:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a6;
  +[NUNISceneUpdateDescription descriptionWithVista:updateBlock:](NUNISceneUpdateDescription, "descriptionWithVista:updateBlock:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUNISceneUpdateDescription descriptionWithVista:updateBlock:](NUNISceneUpdateDescription, "descriptionWithVista:updateBlock:", a5, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNIAstronomyVistaView generateAnimationArrayFromSceneDescription:toSceneDescription:transitionStyle:](self, "generateAnimationArrayFromSceneDescription:toSceneDescription:transitionStyle:", v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)generateAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4 transitionStyle:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    -[NUNIAstronomyVistaView _panAnimationArrayFromSceneDescription:toSceneDescription:](self, "_panAnimationArrayFromSceneDescription:toSceneDescription:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    -[NUNIAstronomyVistaView _zoomAnimationArrayFromSceneDescription:toSceneDescription:](self, "_zoomAnimationArrayFromSceneDescription:toSceneDescription:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLuna") && (objc_msgSend(v7, "isEarth") & 1) != 0
    || objc_msgSend(v6, "isEarth") && objc_msgSend(v7, "isLuna"))
  {
    -[NUNIAstronomyVistaView _earthLunaPanAnimationArrayFromSceneDescription:toSceneDescription:](self, "_earthLunaPanAnimationArrayFromSceneDescription:toSceneDescription:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NUNIAstronomyVistaView _zoomAnimationArrayFromSceneDescription:toSceneDescription:](self, "_zoomAnimationArrayFromSceneDescription:toSceneDescription:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6;
  void *v7;
  NUNIScene *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int32x2_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  int32x2_t v24;
  float32x4_t v25;
  uint64_t v26;
  NUNIAnimation *v27;
  void *v32;
  uint64_t v33;
  const float *v34;
  double v35;
  int32x2_t v36;
  const float *v37;
  double v38;
  NUNIAnimation *v39;
  NUNIAnimation *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  NUNIAnimation *v47;
  uint64_t v48;
  NUNIAnimation *v49;
  void *v53;
  void *v54;
  float32x4_t v55;
  float32x4_t v62;
  float v63;
  float v64;
  float32x4_t v65;
  int32x2_t v66;
  BOOL v70;
  float32x4_t v75;
  float32x4_t v82;
  unint64_t v83;
  float32x4_t v86;
  float32x4_t v87;
  unint64_t v88;
  float32x4_t v99;
  unint64_t v100;
  float32x4_t v105;
  unint64_t v106;
  NUNIAnimation *v107;
  NUNIAnimation *v108;
  NUNIAnimation *v109;
  NUNIAnimation *v117;
  NUNIAnimation *v118;
  uint32x2_t v119;
  NUNIAnimation *v120;
  uint32x2_t v121;
  NUNIAnimation *v122;
  float32x4_t v124;
  void *v125;
  int32x4_t v126;
  float32x4_t v127;
  int32x2_t v128;
  float32x4_t v129;
  int32x2_t v130;
  id v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  float32x4_t v138;
  float32x4_t v139;
  id v140;
  float32x4_t v141;
  float32x4_t v142;
  double v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  int32x2_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  int32x2_t v152;
  double v153;
  int32x2_t v154;
  float32x4_t v155;
  double v156;
  _BYTE v157[20];

  v6 = a3;
  v140 = a4;
  v7 = (void *)objc_opt_new();
  v8 = self->_scene;
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", objc_msgSend(v6, "vista"), v8);
  v133 = v6;
  objc_msgSend(v6, "updateBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v9 + 16))(v9, v8);
    -[NUNIScene updateCamera](v8, "updateCamera");
  }
  v132 = v10;
  v11 = -[NUNIScene structure](v8, "structure");
  v142 = *(float32x4_t *)v11;
  v139 = *(float32x4_t *)(v11 + 16);
  v12.i32[1] = v139.i32[1];
  v12.i32[0] = *(_DWORD *)(v11 + 52);
  v129 = *(float32x4_t *)(v11 + 32);
  v130 = v12;
  v136 = *(double *)(v11 + 96);
  v137 = *(double *)(v11 + 104);
  -[NUNIScene spheroids](v8, "spheroids");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v131 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32 * v14));
  v15 = objc_msgSend(v131, "mutableBytes");
  v16 = (float32x4_t *)v15;
  if (v14)
  {
    v17 = 0;
    v18 = v15 + 8;
    do
    {
      objc_msgSend(v13, "objectAtIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "structure");
      v21 = *(_DWORD *)(v20 + 48);
      *(_OWORD *)&v157[4] = *(_OWORD *)(v20 + 32);
      *(_DWORD *)(v18 - 8) = *(_DWORD *)(v20 + 88);
      *(_DWORD *)(v18 - 4) = v21;
      *(_DWORD *)v18 = 0;
      *(_DWORD *)(v18 + 20) = *(_DWORD *)&v157[16];
      *(_OWORD *)(v18 + 4) = *(_OWORD *)v157;

      ++v17;
      v18 += 32;
    }
    while (v14 != v17);
  }
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", objc_msgSend(v140, "vista"), v8);
  objc_msgSend(v140, "updateBlock");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v22 + 16))(v22, v8);
    -[NUNIScene updateCamera](v8, "updateCamera");
  }
  v25 = *(float32x4_t *)v11;
  v138 = *(float32x4_t *)(v11 + 16);
  v24.i32[1] = v138.i32[1];
  v24.i32[0] = *(_DWORD *)(v11 + 52);
  v127 = *(float32x4_t *)(v11 + 32);
  v128 = v24;
  v134 = *(double *)(v11 + 96);
  v135 = *(double *)(v11 + 104);
  v141 = *(float32x4_t *)v11;
  if (v14)
  {
    v125 = v23;
    v26 = 0;
    v27 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v143 = *(double *)&_Q0;
    while (1)
    {
      objc_msgSend(v13, "objectAtIndex:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "structure");
      v34 = (const float *)v16;
      *(_QWORD *)&v35 = vld1q_dup_f32(v34++).u64[0];
      *(float *)v36.i32 = *v34;
      v147 = v36;
      v37 = (const float *)(v33 + 88);
      v36.i32[0] = *(_DWORD *)(v33 + 48);
      v151 = v16[1];
      v154 = v36;
      v149 = *(float32x4_t *)(v33 + 32);
      *(_QWORD *)&v38 = vld1q_dup_f32(v37).u64[0];
      v39 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v32, 6, v35, v38);

      -[NUNIAnimation setFunction:](v39, "setFunction:", 0);
      objc_msgSend(v7, "addObject:", v39);
      if (*(float *)v147.i32 == 1.0 && *(float *)v154.i32 == 0.0)
        break;
      v40 = [NUNIAnimation alloc];
      *(_QWORD *)&v43 = vdupq_lane_s32(v147, 0).u64[0];
      if (*(float *)v147.i32 == 0.0 && *(float *)v154.i32 == 1.0)
      {
        v42 = v32;
        v41 = v143;
        v44 = v43;
        v45 = v43;
        goto LABEL_19;
      }
      v27 = -[NUNIAnimation initWithAnimatable:from:to:key:](v40, "initWithAnimatable:from:to:key:", v32, 8, v43, *(double *)vdupq_lane_s32(v154, 0).i64);

      v47 = v27;
      v48 = 0;
LABEL_20:
      -[NUNIAnimation setFunction:](v47, "setFunction:", v48);
      objc_msgSend(v7, "addObject:", v27);
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v151, v149)) & 0x80000000) == 0)
      {
        v49 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v32, 2, *(double *)v151.i64, *(double *)v149.i64);

        -[NUNIAnimation setFunction:](v49, "setFunction:", 4);
        objc_msgSend(v7, "addObject:", v49);
        v27 = v49;
      }

      ++v26;
      v16 += 2;
      if (v14 == v26)
      {

        v23 = v125;
        v25 = v141;
        goto LABEL_24;
      }
    }
    v40 = [NUNIAnimation alloc];
    *(_QWORD *)&v41 = vdupq_lane_s32(v154, 0).u64[0];
    v42 = v32;
    v43 = v143;
    v44 = v41;
    v45 = v41;
LABEL_19:
    v27 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v40, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v42, 8, v43, v41, v44, v45);

    v47 = v27;
    v48 = 2;
    goto LABEL_20;
  }
LABEL_24:
  _Q3 = vsubq_f32(v25, v142);
  _Q0 = vmulq_f32(_Q3, _Q3);
  _S1 = _Q3.i32[2];
  __asm { FMLA            S0, S1, V3.S[2] }
  _Q0.f32[0] = sqrtf(_Q0.f32[0]);
  v152 = *(int32x2_t *)_Q0.f32;
  v155 = _Q3;
  -[NUNIScene spheroidOfType:](v8, "spheroidOfType:", 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIScene spheroidOfType:](v8, "spheroidOfType:", 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = vdivq_f32(v155, (float32x4_t)vdupq_lane_s32(v152, 0));
  v126 = (int32x4_t)vmulq_f32(v146, (float32x4_t)xmmword_1B00247C0);
  v55 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v126, (int8x16_t)v126, 4uLL), v126);
  _Q0 = vsubq_f32(v138, v141);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v124 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vsubq_f32(v139, v142);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v148 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  *(_QWORD *)&v156 = vmlaq_n_f32(vmlaq_n_f32(v142, v146, *(float *)v152.i32 * 0.25), v55, *(float *)v152.i32 * 0.05).u64[0];
  v144 = v55;
  *(_QWORD *)&v153 = vmlaq_n_f32(vmlaq_n_f32(v142, v146, *(float *)v152.i32 * 0.75), v55, *(float *)v152.i32 * 0.05).u64[0];
  objc_msgSend(v53, "position");
  v145 = v62;
  objc_msgSend(v53, "radius");
  v64 = v63;
  objc_msgSend(v54, "position");
  v150 = v65;
  objc_msgSend(v54, "radius");
  _Q18 = v148;
  _S3 = vsubq_f32(v142, v145).i32[2];
  __asm { FMLA            S2, S3, V1.S[2] }
  v70 = sqrtf(_S2) > (float)(v64 * 5.7588);
  _S2 = v148.i32[2];
  _S1 = v146.i32[2];
  if (v70)
  {
    _S7 = vsubq_f32(v141, v145).i32[2];
    __asm { FMLA            S6, S7, V5.S[2] }
    v75 = v141;
    if (sqrtf(_S6) <= (float)(v64 * 5.7588))
    {
      _V6.S[2] = v124.i32[2];
      _Q4 = vmulq_f32(v124, v146);
      __asm { FMLA            S4, S1, V6.S[2] }
      if (_Q4.f32[0] < -0.25)
      {
        _Q4.i32[0] = v124.i32[2];
        _S17 = v124.i32[0];
        _Q6 = v126;
        __asm
        {
          FMLA            S5, S17, V6.S[1]
          FMLA            S5, S4, V6.S[2]
        }
        _Q4.f32[0] = (float)(v64 * 5.7588) * 3.0;
        v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q4.f32, 0);
        if (_S5 <= 0.1)
          v83 = vmlaq_f32(v141, v82, v144).u64[0];
        else
          v83 = vmlsq_f32(v141, v82, v144).u64[0];
        v153 = *(double *)&v83;
      }
    }
    goto LABEL_38;
  }
  _Q4 = vmulq_f32(v148, v146);
  __asm { FMLA            S4, S1, V18.S[2] }
  if (_Q4.f32[0] <= 0.25)
  {
    v75 = v141;
LABEL_38:
    v87 = v150;
    goto LABEL_39;
  }
  _Q5 = v126;
  __asm
  {
    FMLA            S4, S18, V5.S[1]
    FMLA            S4, S2, V5.S[2]
  }
  *(double *)_Q5.i64 = _Q4.f32[0];
  _Q4.f32[0] = (float)(v64 * 5.7588) * 3.0;
  v86 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q4.f32, 0);
  v75 = v141;
  v87 = v150;
  if (*(double *)_Q5.i64 <= 0.1)
    v88 = vmlaq_f32(v142, v86, v144).u64[0];
  else
    v88 = vmlsq_f32(v142, v86, v144).u64[0];
  v156 = *(double *)&v88;
LABEL_39:
  _S6 = vsubq_f32(v142, v87).i32[2];
  __asm { FMLA            S5, S6, V4.S[2] }
  if (sqrtf(_S5) <= (float)(*(float *)v66.i32 * 5.7588))
  {
    __asm { FMLA            S3, S1, V18.S[2] }
    if (_S3 > 0.25)
    {
      _Q3 = v126;
      __asm
      {
        FMLA            S1, S18, V3.S[1]
        FMLA            S1, S2, V3.S[2]
      }
      *(float *)v66.i32 = (float)(*(float *)v66.i32 * 5.7588) * 3.0;
      v105 = (float32x4_t)vdupq_lane_s32(v66, 0);
      if (_S1 <= 0.1)
        v106 = vmlaq_f32(v142, v105, v144).u64[0];
      else
        v106 = vmlsq_f32(v142, v105, v144).u64[0];
      v156 = *(double *)&v106;
    }
  }
  else
  {
    _S5 = vsubq_f32(v75, v87).i32[2];
    __asm { FMLA            S4, S5, V2.S[2] }
    if (sqrtf(_S4) <= (float)(*(float *)v66.i32 * 5.7588))
    {
      _Q4 = v124;
      __asm { FMLA            S2, S1, V4.S[2] }
      if (_S2 < -0.25)
      {
        _S1 = v124.i32[2];
        _Q3 = v126;
        __asm
        {
          FMLA            S2, S4, V3.S[1]
          FMLA            S2, S1, V3.S[2]
        }
        *(float *)v66.i32 = (float)(*(float *)v66.i32 * 5.7588) * 3.0;
        v99 = (float32x4_t)vdupq_lane_s32(v66, 0);
        if (_S2 <= 0.1)
          v100 = vmlaq_f32(v75, v99, v144).u64[0];
        else
          v100 = vmlsq_f32(v75, v99, v144).u64[0];
        v153 = *(double *)&v100;
      }
    }
  }
  v107 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v8, 0, *(double *)v142.i64, *(double *)v141.i64, v156, v153);
  -[NUNIAnimation setFunction:](v107, "setFunction:", 2);
  objc_msgSend(v7, "addObject:", v107);
  v108 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v8, 1, *(double *)v139.i64, *(double *)v138.i64);

  -[NUNIAnimation setFunction:](v108, "setFunction:", 0);
  objc_msgSend(v7, "addObject:", v108);
  v109 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v127, _Q3), _Q4, v129);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v127, _Q4), _Q3, v129);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v117 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v109, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v8, 2, *(double *)v129.i64, *(double *)v127.i64, *(double *)_Q2.i64, *(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64);

  -[NUNIAnimation setFunction:](v117, "setFunction:", 2);
  objc_msgSend(v7, "addObject:", v117);
  v118 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v8, 3, *(double *)vdupq_lane_s32(v130, 0).i64, *(double *)vdupq_lane_s32(v128, 0).i64);

  -[NUNIAnimation setFunction:](v118, "setFunction:", 0);
  objc_msgSend(v7, "addObject:", v118);
  v119 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v136, *(float32x2_t *)&v134);
  if ((vpmin_u32(v119, v119).u32[0] & 0x80000000) == 0)
  {
    v120 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v8, 6, v136, v134);

    -[NUNIAnimation setFunction:](v120, "setFunction:", 2);
    objc_msgSend(v7, "addObject:", v120);
    v118 = v120;
  }
  v121 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v137, *(float32x2_t *)&v135);
  if ((vpmin_u32(v121, v121).u32[0] & 0x80000000) == 0)
  {
    v122 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v8, 7, v137, v135);

    -[NUNIAnimation setFunction:](v122, "setFunction:", 2);
    objc_msgSend(v7, "addObject:", v122);
    v118 = v122;
  }
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", self->_vista, v8);

  return v7;
}

- (void)setVista:(unint64_t)a3
{
  if (self->_scene)
  {
    if (self->_vista != a3)
    {
      self->_vista = a3;
      -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:");
    }
  }
}

- (void)_setVista:(unint64_t)a3 scene:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  int v19;
  float v20;
  int v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  unint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1uLL:
      v7 = 16;
      a3 = 4;
      goto LABEL_30;
    case 2uLL:
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v5, "spheroids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v9)
      {
        v10 = v9;
        v11 = v6;
        v12 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v42 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "structure");
            v18 = v15;
            v19 = *(_DWORD *)v15;
            if (*(_DWORD *)v15 == 4)
              v20 = 0.000001;
            else
              v20 = 1.0;
            if (*(float *)(v15 + 88) != v20)
              objc_msgSend(v14, "setRadiusScale:");
            v21 = 1 << v19;
            if ((v21 & 0x4FFE) != 0)
              v22 = 1.0;
            else
              v22 = 0.0;
            if (*(float *)(v18 + 48) != v22)
              objc_msgSend(v14, "setOpacity:");
            v16.i64[0] = 0;
            v17.i64[0] = v21 & 0x3FE;
            objc_msgSend(v14, "setOrientation:", *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v17, v16).i64[0], 0), (int8x16_t)xmmword_1B000C980, (int8x16_t)xmmword_1B00247D0).i64);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v10);
        v6 = v11;
      }
      a3 = 24;
      goto LABEL_48;
    case 3uLL:
      v7 = 32770;
      a3 = 1;
      goto LABEL_30;
    case 4uLL:
      v7 = 65540;
      a3 = 2;
      goto LABEL_30;
    case 5uLL:
      v7 = 524320;
      goto LABEL_30;
    case 6uLL:
      v7 = 1048640;
      goto LABEL_30;
    case 7uLL:
      v7 = 2097280;
      goto LABEL_30;
    case 8uLL:
      v7 = 4194560;
      goto LABEL_30;
    case 9uLL:
      v7 = 8389120;
      goto LABEL_30;
    default:
      v7 = 131080;
      a3 = 3;
LABEL_30:
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v5, "spheroids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v23)
      {
        v24 = v23;
        v35 = a3;
        v36 = v6;
        v25 = *(_QWORD *)v38;
        v26 = v7 | 0x400;
        v27 = v7 & 0x3FE;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v38 != v25)
              objc_enumerationMutation(v8);
            v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            v30 = objc_msgSend(v29, "structure");
            v31 = v30;
            v32 = (1 << *(_DWORD *)v30);
            if ((v26 & v32) != 0)
              v33 = 1.0;
            else
              v33 = 0.000001;
            if (*(float *)(v30 + 88) != v33)
              objc_msgSend(v29, "setRadiusScale:");
            if ((v27 & v32) != 0)
              v34 = 1.0;
            else
              v34 = 0.0;
            if (*(float *)(v31 + 48) != v34)
              objc_msgSend(v29, "setOpacity:");
            objc_msgSend(v29, "setOrientation:", *(double *)&_PromotedConst);
          }
          v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v24);
        a3 = v35;
        v6 = v36;
      }
LABEL_48:

      objc_msgSend(v6, "setSnap:", a3);
      return;
  }
}

- (void)universeAnimationFinished:(id)a3
{
  id WeakRetained;

  -[NSMutableSet removeObject:](self->_activeContentsAnimations, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_activeContentsAnimations, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(WeakRetained, "astronomyVistaViewContentsAnimationFinished:", self);

  }
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "astronomyVistaViewWillDisplay:forTime:", self, a4);

  if ((*((_BYTE *)self + 504) & 0x10) == 0)
  {
    -[NUNIAstronomyVistaView stopAnimation](self, "stopAnimation");
    *((_BYTE *)self + 504) |= 0x10u;
  }
}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NUNIAstronomyVistaViewObserver)observer
{
  return (NUNIAstronomyVistaViewObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSArray)quadViews
{
  return self->_quadViews;
}

- (float)supplementalSpheroidSize
{
  return self->_supplementalSpheroidSize;
}

- (void)setSupplementalSpheroidSize:(float)a3
{
  self->_supplementalSpheroidSize = a3;
}

- (float)supplementalHorizontalInset
{
  return self->_supplementalHorizontalInset;
}

- (void)setSupplementalHorizontalInset:(float)a3
{
  self->_supplementalHorizontalInset = a3;
}

- (float)supplementalTopInset
{
  return self->_supplementalTopInset;
}

- (void)setSupplementalTopInset:(float)a3
{
  self->_supplementalTopInset = a3;
}

- (float)supplementalBottomInset
{
  return self->_supplementalBottomInset;
}

- (void)setSupplementalBottomInset:(float)a3
{
  self->_supplementalBottomInset = a3;
}

- (int64_t)frameInterval
{
  return self->_frameInterval;
}

- (BOOL)pauseAnimationWhenNoUpdate
{
  return self->_pauseAnimationWhenNoUpdate;
}

- (void)setPauseAnimationWhenNoUpdate:(BOOL)a3
{
  self->_pauseAnimationWhenNoUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadViews, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_activeContentsAnimations, 0);
  objc_storeStrong((id *)&self->maskLayer, 0);
  objc_storeStrong((id *)&self->_portalLayer, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView1, 0);
  objc_storeStrong((id *)&self->_quadView0, 0);
}

@end
