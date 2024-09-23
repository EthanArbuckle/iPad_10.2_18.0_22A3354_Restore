@implementation TSDMovieRep

- (TSDMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDMovieRep *v4;
  TSDMovieRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMovieRep;
  v4 = -[TSDRep initWithLayout:canvas:](&v7, sel_initWithLayout_canvas_, a3, a4);
  v5 = v4;
  if (v4 && !-[TSDMovieRep movieInfo](v4, "movieInfo"))
  {

    return 0;
  }
  return v5;
}

- (TSDMovieInfo)movieInfo
{
  objc_opt_class();
  -[TSDRep info](self, "info");
  return (TSDMovieInfo *)TSUDynamicCast();
}

- (id)movieLayout
{
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  return (id)TSUDynamicCast();
}

- (void)dealloc
{
  objc_super v3;

  -[TSDMovieRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
  -[TSDMovieRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
  -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
  -[TSDMovieRep disposeReflectionLayer](self, "disposeReflectionLayer");
  -[AVPlayerLayer setDelegate:](self->mPlayerLayer, "setDelegate:", 0);
  objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setDelegate:", 0);

  CGImageRelease(*(CGImageRef *)&self->mPlayButtonKnobVisible);
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep dealloc](&v3, sel_dealloc);
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)p_createMaskLayerForLayer:(id)a3
{
  CALayer *v5;

  if (!self->super.mTapToReplaceLayer)
  {
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    self->super.mTapToReplaceLayer = v5;
    -[CALayer setDelegate:](v5, "setDelegate:", self);
    -[CALayer setAnchorPoint:](self->super.mTapToReplaceLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(a3, "setMask:", self->super.mTapToReplaceLayer);
  }
}

- (void)p_createReflectionPlayerStrokeMaskLayer
{
  AVPlayerLayer *v3;
  void *v4;
  uint64_t v5;

  if (self->mMovieReflectionMaskLayer
    || self->mReflectionPlayerLayer
    && (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_createReflectionPlayerStrokeMaskLayer]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 293, CFSTR("layer lifetime messup")), self->mMovieReflectionMaskLayer))
  {
    if (!self->mReflectionPlayerLayer)
    {
      v3 = (AVPlayerLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
      self->mReflectionPlayerLayer = v3;
      -[AVPlayerLayer setDelegate:](v3, "setDelegate:", self);
      -[AVPlayerLayer setAnchorPoint:](self->mReflectionPlayerLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[CALayer setMask:](self->mMovieReflectionMaskLayer, "setMask:", self->mReflectionPlayerLayer);
    }
  }
}

- (void)p_disposeStrokeLayer
{
  void *v3;
  __int128 v4;

  v3 = *(void **)&self->mPreventDisposeOfPlayerLayer;
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:", 0);

    *(_QWORD *)&self->mPreventDisposeOfPlayerLayer = 0;
    v4 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x24BDBF090];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v4;
  }
}

- (void)p_disposeMaskLayer
{
  CALayer *mTapToReplaceLayer;

  mTapToReplaceLayer = self->super.mTapToReplaceLayer;
  if (mTapToReplaceLayer)
  {
    -[CALayer removeFromSuperlayer](mTapToReplaceLayer, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->super.mTapToReplaceLayer, "setDelegate:", 0);

    self->super.mTapToReplaceLayer = 0;
    self->super.mStrokeLayer = 0;
  }
}

- (void)p_disposeReflectionStrokeLayers
{
  CALayer *mPlayerStrokeLayer;
  AVPlayerLayer *mReflectionPlayerLayer;
  CALayer *mReflectionPlayerStrokeLayer;

  mPlayerStrokeLayer = self->mPlayerStrokeLayer;
  if (mPlayerStrokeLayer)
  {
    -[CALayer removeFromSuperlayer](mPlayerStrokeLayer, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mPlayerStrokeLayer, "setDelegate:", 0);

    self->mPlayerStrokeLayer = 0;
  }
  mReflectionPlayerLayer = self->mReflectionPlayerLayer;
  if (mReflectionPlayerLayer)
  {
    -[AVPlayerLayer removeFromSuperlayer](mReflectionPlayerLayer, "removeFromSuperlayer");
    -[AVPlayerLayer setDelegate:](self->mReflectionPlayerLayer, "setDelegate:", 0);

    self->mReflectionPlayerLayer = 0;
  }
  if (self->mReflectionFrameRep)
    self->mReflectionFrameRep = 0;
  mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
  if (mReflectionPlayerStrokeLayer)
  {

    self->mReflectionPlayerStrokeLayer = 0;
  }
}

- (void)p_hideReflectionLayer
{
  CALayer *mReflectionLayer;
  void *v4;
  uint64_t v5;
  CALayer *mMovieReflectionMaskLayer;
  void *v7;
  uint64_t v8;
  CALayer *mLayerToStroke;
  void *v10;
  uint64_t v11;

  mReflectionLayer = self->super.super.mReflectionLayer;
  if (mReflectionLayer && !BYTE1(self->mPlayerController))
  {
    if (-[CALayer isHidden](mReflectionLayer, "isHidden"))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_hideReflectionLayer]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 355, CFSTR("Hiding layer that is already hidden!"));
    }
    -[CALayer setHidden:](self->super.super.mReflectionLayer, "setHidden:", 1);
  }
  mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
  if (mMovieReflectionMaskLayer)
  {
    if (-[CALayer isHidden](mMovieReflectionMaskLayer, "isHidden"))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_hideReflectionLayer]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 359, CFSTR("Hiding layer that is already hidden!"));
    }
    -[CALayer setHidden:](self->mMovieReflectionMaskLayer, "setHidden:", 1);
  }
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke && BYTE1(self->mPlayerController))
  {
    if (-[CALayer isHidden](mLayerToStroke, "isHidden"))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_hideReflectionLayer]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 363, CFSTR("Hiding layer that is already hidden!"));
    }
    -[CALayer setHidden:](self->mLayerToStroke, "setHidden:", 1);
  }
}

- (void)p_showReflectionLayer
{
  CALayer *mReflectionLayer;
  CALayer *mMovieReflectionMaskLayer;
  CALayer *mLayerToStroke;

  mReflectionLayer = self->super.super.mReflectionLayer;
  if (mReflectionLayer && !BYTE1(self->mPlayerController))
    -[CALayer setHidden:](mReflectionLayer, "setHidden:", 0);
  mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
  if (mMovieReflectionMaskLayer)
    -[CALayer setHidden:](mMovieReflectionMaskLayer, "setHidden:", 0);
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke)
  {
    if (BYTE1(self->mPlayerController))
      -[CALayer setHidden:](mLayerToStroke, "setHidden:", 0);
  }
}

- (void)disposeReflectionLayer
{
  TSDMovieRep **v3;
  CALayer *mMovieReflectionMaskLayer;
  CALayer *mLayerToStroke;
  CALayer *mMovieReflectionLayer;
  TSDMovieRep *v7;
  TSDMovieRep *v8;

  if (LOBYTE(self->mReflectionPlayerStrokeMaskLayer))
  {
    v8 = self;
    v3 = &v8;
  }
  else
  {
    mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
    if (mMovieReflectionMaskLayer)
    {
      -[CALayer removeFromSuperlayer](mMovieReflectionMaskLayer, "removeFromSuperlayer");
      -[CALayer setDelegate:](self->mMovieReflectionMaskLayer, "setDelegate:", 0);

      self->mMovieReflectionMaskLayer = 0;
    }
    mLayerToStroke = self->mLayerToStroke;
    if (mLayerToStroke)
    {
      -[CALayer setDelegate:](mLayerToStroke, "setDelegate:", 0);
      -[CALayer setMask:](self->mLayerToStroke, "setMask:", 0);

      self->mLayerToStroke = 0;
    }
    mMovieReflectionLayer = self->mMovieReflectionLayer;
    if (mMovieReflectionLayer)
    {
      -[CALayer removeFromSuperlayer](mMovieReflectionLayer, "removeFromSuperlayer");
      -[CALayer setDelegate:](self->mMovieReflectionLayer, "setDelegate:", 0);

      self->mMovieReflectionLayer = 0;
    }
    -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
    v7 = self;
    v3 = &v7;
  }
  v3[1] = (TSDMovieRep *)TSDMovieRep;
  objc_msgSendSuper2((objc_super *)v3, sel_disposeReflectionLayer, v7);
}

- (void)createReflectionLayer
{
  CALayer *v3;
  CALayer *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  -[TSDStyledRep createReflectionLayer](&v5, sel_createReflectionLayer);

  v3 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  self->mLayerToStroke = v3;
  -[CALayer setDelegate:](v3, "setDelegate:", self);
  -[CALayer setNeedsDisplay](self->mLayerToStroke, "setNeedsDisplay");
  -[CALayer setHidden:](self->mLayerToStroke, "setHidden:", 1);

  v4 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  self->mMovieReflectionLayer = v4;
  -[CALayer setDelegate:](v4, "setDelegate:", self);
  -[CALayer setAnchorPoint:](self->mMovieReflectionLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CALayer addSublayer:](self->mLayerToStroke, "addSublayer:", self->mMovieReflectionLayer);
  if (objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"))
    -[TSDMovieRep p_setupReflectionPlayerLayerIfNecessary](self, "p_setupReflectionPlayerLayerIfNecessary");
}

- (void)p_setupReflectionPlayerLayerIfNecessary
{
  CALayer *v3;
  _BOOL4 v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  CALayer *mLayerToStroke;

  if (*(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height && !self->mMovieReflectionMaskLayer)
  {
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x24BDB2648]);
    self->mMovieReflectionMaskLayer = v3;
    -[CALayer setDelegate:](v3, "setDelegate:", self);
    v4 = -[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming");
    v5 = (_QWORD *)MEMORY[0x24BDB1C78];
    if (!v4)
      v5 = (_QWORD *)MEMORY[0x24BDB1C70];
    -[CALayer setVideoGravity:](self->mMovieReflectionMaskLayer, "setVideoGravity:", *v5);
    -[CALayer setHidden:](self->mMovieReflectionMaskLayer, "setHidden:", 0);
    if (!objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_setupReflectionPlayerLayerIfNecessary]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 456, CFSTR("invalid nil value for '%s'"), "mPlayerController.player");
    }
    -[CALayer setPlayer:](self->mMovieReflectionMaskLayer, "setPlayer:", objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"));
  }
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke)
    -[CALayer addSublayer:](mLayerToStroke, "addSublayer:", self->mMovieReflectionMaskLayer);
}

- (void)p_setupPlayerLayerIfNecessary
{
  id v3;
  _BOOL4 v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TSDCanvas *mCanvas;
  TSDCanvas *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (!*(_QWORD *)&self->mCurrentlyObservingPlayerLayer)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDB2648]);
    *(_QWORD *)&self->mCurrentlyObservingPlayerLayer = v3;
    objc_msgSend(v3, "setDelegate:", self);
    v4 = -[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming");
    v5 = (_QWORD *)MEMORY[0x24BDB1C78];
    if (!v4)
      v5 = (_QWORD *)MEMORY[0x24BDB1C70];
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setVideoGravity:", *v5);
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setHidden:", 1);
    BYTE1(self->mPlayerController) = 0;
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 5, TSDMovieRepPlayerLayerReadyForDisplayObserverContext);
    LOBYTE(self->mPlayerController) = 1;
    if (!objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep p_setupPlayerLayerIfNecessary]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 482, CFSTR("invalid nil value for '%s'"), "mPlayerController.player");
    }
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setPlayer:", objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"));
    v8 = (void *)objc_msgSend(-[TSDRep info](self, "info"), "geometry");
    if (v8)
    {
      objc_msgSend(v8, "transformBasedOnPoint:centeredAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
    }
    v9 = *(void **)&self->mCurrentlyObservingPlayerLayer;
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    objc_msgSend(v9, "setAffineTransform:", v17);
    mCanvas = self->super.super.super.mCanvas;
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
    -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:", TSDRectWithSize());
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setBounds:");
    v11 = self->super.super.super.mCanvas;
    -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "frame");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v11, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(v12, v13, v14, v15));
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setPosition:");
    -[TSDStyledRep opacity](self, "opacity");
    *(float *)&v16 = v16;
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setOpacity:", v16);
    if (self->super.super.mReflectionLayer)
      -[TSDMovieRep p_setupReflectionPlayerLayerIfNecessary](self, "p_setupReflectionPlayerLayerIfNecessary");
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  objc_super v4;

  if (self->mPlayerStrokeLayer == a3)
  {
    -[TSDMovieRep p_drawReflectionStrokeInContext:](self, "p_drawReflectionStrokeInContext:", a4);
  }
  else if (*(id *)&self->mPreventDisposeOfPlayerLayer == a3)
  {
    -[TSDMovieRep p_drawStrokeInContext:](self, "p_drawStrokeInContext:", a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDMovieRep;
    -[TSDStyledRep drawLayer:inContext:](&v4, sel_drawLayer_inContext_);
  }
}

- (id)p_shapeLayerForPlayerStroke
{
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)p_tilingLayerForPlayerStroke
{
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)playerStrokeLayer
{
  return *(id *)&self->mPreventDisposeOfPlayerLayer;
}

- (void)p_setupTilingPlayerStrokeLayer
{
  TSDTilingLayer *v3;

  if (!*(_QWORD *)&self->mPreventDisposeOfPlayerLayer)
  {
    v3 = objc_alloc_init(TSDTilingLayer);
    *(_QWORD *)&self->mPreventDisposeOfPlayerLayer = v3;
    -[TSDTilingLayer setDelegate:](v3, "setDelegate:", self);
    -[TSDTilingLayer setDrawsInBackground:](v3, "setDrawsInBackground:", 1);
    -[TSDTilingLayer setNeedsDisplay](v3, "setNeedsDisplay");
  }
}

- (void)p_setupShapePlayerStrokeLayer
{
  id v3;

  if (!*(_QWORD *)&self->mPreventDisposeOfPlayerLayer)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDE5758]);
    *(_QWORD *)&self->mPreventDisposeOfPlayerLayer = v3;
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "setFillColor:", 0);
  }
}

- (id)p_shapeLayerForReflectionStroke
{
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)p_tilingLayerForReflectionStroke
{
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)reflectionPlayerStrokeLayer
{
  return self->mPlayerStrokeLayer;
}

- (void)p_setupShapeReflectionPlayerStrokeLayer
{
  CALayer *v3;

  if (!self->mPlayerStrokeLayer)
  {
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    self->mPlayerStrokeLayer = v3;
    -[CALayer setDelegate:](v3, "setDelegate:", self);
    -[CALayer setFillColor:](v3, "setFillColor:", 0);
  }
}

- (void)p_setupTilingReflectionPlayerStrokeLayer
{
  TSDTilingLayer *v3;

  if (!self->mPlayerStrokeLayer)
  {
    v3 = objc_alloc_init(TSDTilingLayer);
    self->mPlayerStrokeLayer = &v3->super;
    -[TSDTilingLayer setDelegate:](v3, "setDelegate:", self);
    -[TSDTilingLayer setDrawsInBackground:](v3, "setDrawsInBackground:", 1);
    -[TSDTilingLayer setNeedsDisplay](v3, "setNeedsDisplay");
  }
}

- (void)setShapeReflectionPlayerStrokeLayer:(id)a3
{
  self->mPlayerStrokeLayer = (CALayer *)a3;
}

- (BOOL)p_needsTilingLayerForStroke:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)p_setupPlayerStrokeLayers:(BOOL)a3
{
  if (a3)
  {
    -[TSDMovieRep p_setupTilingPlayerStrokeLayer](self, "p_setupTilingPlayerStrokeLayer");
    -[TSDMovieRep p_setupTilingReflectionPlayerStrokeLayer](self, "p_setupTilingReflectionPlayerStrokeLayer");
  }
  else
  {
    -[TSDMovieRep p_setupShapePlayerStrokeLayer](self, "p_setupShapePlayerStrokeLayer");
    -[TSDMovieRep p_setupShapeReflectionPlayerStrokeLayer](self, "p_setupShapeReflectionPlayerStrokeLayer");
  }
}

- (void)p_checkAndsyncTilingLayerState:(BOOL)a3
{
  -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (!a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TSDMovieRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
      -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
    }
  }
}

- (void)p_setupStrokeLayers:(BOOL)a3 needsMaskLayer:(BOOL)a4 isFrame:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  CAShapeLayer *mStrokeLayer;
  TSDFrameRep *mReflectionFrameRep;
  double v10;
  double v11;
  CALayer *mFrameMaskLayer;
  id v13;
  AVPlayerLayer *mPlayerLayer;
  CALayer *mTapToReplaceLayer;
  double v16;
  CALayer *mReflectionPlayerStrokeLayer;
  id v18;
  CALayer *mMovieReflectionMaskLayer;
  AVPlayerLayer *mReflectionPlayerLayer;
  double v21;
  __int128 v22;

  v5 = a5;
  v6 = a3;
  if (a4)
  {
    -[TSDMovieRep p_createMaskLayerForLayer:](self, "p_createMaskLayerForLayer:", self->mPlayerLayer);
    if (self->super.super.mReflectionLayer)
      -[TSDMovieRep p_createReflectionPlayerStrokeMaskLayer](self, "p_createReflectionPlayerStrokeMaskLayer");
  }
  -[TSDMovieRep p_checkAndsyncTilingLayerState:](self, "p_checkAndsyncTilingLayerState:", v6);
  -[TSDMovieRep p_setupPlayerStrokeLayers:](self, "p_setupPlayerStrokeLayers:", v6);
  if (v5)
  {
    -[TSDMovieRep i_updateFrameRep](self, "i_updateFrameRep");
    mStrokeLayer = self->super.mStrokeLayer;
    if (mStrokeLayer)
    {
      -[CAShapeLayer removeFromSuperlayer](mStrokeLayer, "removeFromSuperlayer");
      self->super.mStrokeLayer = 0;
    }
    mReflectionFrameRep = self->mReflectionFrameRep;
    if (mReflectionFrameRep)
    {
      -[TSDFrameRep removeFromSuperlayer](mReflectionFrameRep, "removeFromSuperlayer");
      self->mReflectionFrameRep = 0;
    }
    -[TSDMovieRep i_updateFrameRep](self, "i_updateFrameRep");
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v11 = v10;
    mFrameMaskLayer = self->super.mFrameMaskLayer;
    v13 = -[TSDMovieRep playerStrokeLayer](self, "playerStrokeLayer");
    mPlayerLayer = self->mPlayerLayer;
    mTapToReplaceLayer = self->super.mTapToReplaceLayer;
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    self->super.mStrokeLayer = (CAShapeLayer *)-[CALayer applyToCALayer:withRepLayer:maskLayer:viewScale:](mFrameMaskLayer, "applyToCALayer:withRepLayer:maskLayer:viewScale:", v13, mPlayerLayer, mTapToReplaceLayer, v11 * v16);
    if (self->mMovieReflectionMaskLayer)
    {
      mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
      v18 = -[TSDMovieRep reflectionPlayerStrokeLayer](self, "reflectionPlayerStrokeLayer");
      mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
      mReflectionPlayerLayer = self->mReflectionPlayerLayer;
      -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
      self->mReflectionFrameRep = (TSDFrameRep *)-[CALayer applyToCALayer:withRepLayer:maskLayer:viewScale:](mReflectionPlayerStrokeLayer, "applyToCALayer:withRepLayer:maskLayer:viewScale:", v18, mMovieReflectionMaskLayer, mReflectionPlayerLayer, v11 * v21);
    }
    v22 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x24BDBF090];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v22;
  }
}

- (CGRect)p_strokeFrameForLayerFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v10 = v9;
  objc_msgSend(v8, "width");
  v12 = v10 * (v11 * -0.5);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGRectInset(v17, v12, v12);
  v13 = TSDRectWithSize();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)p_arrangeLayerVisibility:(id)a3
{
  AVPlayerLayer *v3;
  uint64_t v5;
  CALayer **p_mReflectionLayer;
  uint64_t v7;
  AVPlayerLayer *v8;

  v3 = (AVPlayerLayer *)a3;
  if (BYTE1(self->mPlayerController) && !BYTE5(self->mIsChangingDynamicVisibleTimeCount))
  {
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setHidden:", 0);
    v7 = 1;
    -[AVPlayerLayer setHidden:](v3, "setHidden:", 1);
    v3 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    p_mReflectionLayer = &self->super.super.mReflectionLayer;
    if (!self->super.super.mReflectionLayer)
      goto LABEL_8;
    v5 = 0;
  }
  else
  {
    objc_msgSend(a3, "setHidden:", 0);
    v5 = 1;
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setHidden:", 1);
    p_mReflectionLayer = &self->super.super.mReflectionLayer;
    if (!self->super.super.mReflectionLayer)
      goto LABEL_8;
    v7 = 0;
  }
  -[CALayer setHidden:](self->mLayerToStroke, "setHidden:", v5);
  -[CALayer setHidden:](*p_mReflectionLayer, "setHidden:", v7);
LABEL_8:
  if (v3 != self->mPlayerLayer)
  {
    -[TSDMovieRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
    -[TSDMovieRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
    -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
    v8 = v3;

    self->mPlayerLayer = v3;
  }
}

- (void)willUpdateLayer:(id)a3
{
  id v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  _BOOL8 v10;
  CAShapeLayer *mStrokeLayer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDMovieRep;
  -[TSDStyledRep willUpdateLayer:](&v12, sel_willUpdateLayer_);
  v5 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  -[TSDMovieRep p_arrangeLayerVisibility:](self, "p_arrangeLayerVisibility:", a3);
  v6 = -[TSDMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v5);
  v7 = v6;
  if (v6)
  {
    v8 = -[TSDMovieRep p_needsTilingLayerForStroke:](self, "p_needsTilingLayerForStroke:", v5);
    v9 = objc_msgSend(v5, "isFrame");
    if ((_DWORD)v9 && objc_msgSend(v5, "hasMask"))
    {
      v10 = -[TSDMediaLayout shouldRenderFrameStroke](-[TSDMediaRep mediaLayout](self, "mediaLayout"), "shouldRenderFrameStroke");
      -[TSDMovieRep p_setupStrokeLayers:needsMaskLayer:isFrame:](self, "p_setupStrokeLayers:needsMaskLayer:isFrame:", v8, v10, 1);
      if (v10)
        return;
    }
    else
    {
      -[TSDMovieRep p_setupStrokeLayers:needsMaskLayer:isFrame:](self, "p_setupStrokeLayers:needsMaskLayer:isFrame:", v8, 0, v9);
    }
  }
  mStrokeLayer = self->super.mStrokeLayer;
  if (mStrokeLayer)
  {
    -[CAShapeLayer removeFromSuperlayer](mStrokeLayer, "removeFromSuperlayer");
    self->super.mStrokeLayer = 0;
  }
  -[TSDMovieRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
  if (!v7)
  {
    -[TSDMovieRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
    -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
  }
}

- (void)didUpdateLayer:(id)a3
{
  CALayer *mReflectionLayer;
  CALayer *mLayerToStroke;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CGImage *v18;
  TSPData *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _QWORD v25[5];

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __30__TSDMovieRep_didUpdateLayer___block_invoke;
  v25[3] = &unk_24D829278;
  v25[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v25);
  v24.receiver = self;
  v24.super_class = (Class)TSDMovieRep;
  -[TSDStyledRep didUpdateLayer:](&v24, sel_didUpdateLayer_, a3);
  if (self->mLayerToStroke && -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
  {
    -[CALayer position](self->super.super.mReflectionLayer, "position");
    -[CALayer setPosition:](self->mLayerToStroke, "setPosition:");
    -[CALayer bounds](self->super.super.mReflectionLayer, "bounds");
    -[CALayer setBounds:](self->mLayerToStroke, "setBounds:");
    -[CALayer opacity](self->super.super.mReflectionLayer, "opacity");
    -[CALayer setOpacity:](self->mLayerToStroke, "setOpacity:");
    mReflectionLayer = self->super.super.mReflectionLayer;
    if (mReflectionLayer)
    {
      -[CALayer affineTransform](mReflectionLayer, "affineTransform");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
    }
    mLayerToStroke = self->mLayerToStroke;
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    -[CALayer setAffineTransform:](mLayerToStroke, "setAffineTransform:", v20);
    -[TSDMovieRep p_updateMovieReflectionMaskLayer](self, "p_updateMovieReflectionMaskLayer");
  }
  -[TSDStyledRep opacity](self, "opacity");
  v8 = v7;
  objc_msgSend(a3, "opacity");
  v10 = v9;
  if (v8 != v10)
  {
    *(float *)&v10 = v8;
    objc_msgSend(a3, "setOpacity:", v10);
  }
  v11 = *(void **)&self->mCurrentlyObservingPlayerLayer;
  if (v11)
  {
    objc_msgSend(v11, "opacity");
    v13 = v12;
    if (v8 != v13)
    {
      *(float *)&v13 = v8;
      objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setOpacity:", v13);
    }
  }
  v14 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (-[TSDMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v14))
  {
    v15 = a3;
    if (BYTE1(self->mPlayerController))
      v15 = *(id *)&self->mCurrentlyObservingPlayerLayer;
    -[TSDMovieRep p_updateStrokeLayerForStroke:repLayer:](self, "p_updateStrokeLayerForStroke:repLayer:", v14, v15);
    if (self->mMovieReflectionMaskLayer)
    {
      v16 = -[TSDMovieRep reflectionPlayerStrokeLayer](self, "reflectionPlayerStrokeLayer");
      if (self->mPlayerStrokeLayer)
      {
        v17 = v16;
        if (!-[NSArray containsObject:](-[CALayer sublayers](self->mLayerToStroke, "sublayers"), "containsObject:", v16))-[CALayer addSublayer:](self->mLayerToStroke, "addSublayer:", v17);
      }
    }
  }
  v18 = -[TSDMovieRep alternatePosterImage](self, "alternatePosterImage");
  if (v18)
    goto LABEL_22;
  v19 = -[TSDMovieInfo posterImageData](-[TSDMovieRep movieInfo](self, "movieInfo"), "posterImageData");
  if (v19)
  {
    v18 = +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v19);
LABEL_22:
    objc_msgSend(a3, "setContents:", v18);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __30__TSDMovieRep_didUpdateLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_teardownPlayerControllerIfNeeded");
}

- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v12;
  double v13;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  objc_msgSend(a3, "position");
  if (v13 != v10 || v12 != v9)
    objc_msgSend(a3, "setPosition:", v10, v9);
  objc_msgSend(a3, "bounds");
  v20.origin.x = v15;
  v20.origin.y = v16;
  v20.size.width = v17;
  v20.size.height = v18;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (!CGRectEqualToRect(v19, v20))
    objc_msgSend(a3, "setBounds:", x, y, width, height);
}

- (void)p_placeReflectionPlayerLayer:(CGRect)a3 transform:(CGAffineTransform *)a4
{
  TSDCanvas *mCanvas;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CALayer *mPlayerStrokeLayer;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  CGAffineTransform v33;

  mCanvas = self->super.super.super.mCanvas;
  objc_msgSend(-[TSDMovieRep movieLayout](self, "movieLayout", a3.origin.x, a3.origin.y), "fullReflectionFrame");
  -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:", TSDRectWithSize());
  v11 = TSDCenterOfRect(v7, v8, v9, v10);
  v13 = v12;
  v14 = TSDRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", self->mMovieReflectionMaskLayer, v11, v13, v14, v15, v17, v19);
  mPlayerStrokeLayer = self->mPlayerStrokeLayer;
  -[TSDMovieRep p_strokeFrameForLayerFrame:](self, "p_strokeFrameForLayerFrame:", v14, v16, v18, v20);
  -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", mPlayerStrokeLayer, v11, v13, v22, v23, v24, v25);
  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v33.c = v26;
  *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v32.a = *(_OWORD *)&v33.a;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tx = *(_OWORD *)&v33.tx;
  CGAffineTransformScale(&v33, &v32, 1.0, -1.0);
  v27 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v27;
  t1.tx = 0.0;
  t1.ty = 0.0;
  t2 = v33;
  CGAffineTransformConcat(&v32, &t1, &t2);
  v33 = v32;
  v29 = v32;
  -[CALayer setAffineTransform:](self->mMovieReflectionMaskLayer, "setAffineTransform:", &v29);
  v28 = v33;
  -[CALayer setAffineTransform:](self->mPlayerStrokeLayer, "setAffineTransform:", &v28);
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v12, &v9, objc_msgSend(-[TSDMovieRep movieLayout](self, "movieLayout"), "pureGeometry"));
  -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v9, v12, v13);
  v6 = v9;
  v7 = v10;
  v8 = v11;
  objc_msgSend(a3, "setIfDifferentFrame:orTransform:", &v6, v12, v13);
  if (*(_QWORD *)&self->mCurrentlyObservingPlayerLayer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v5 = *(void **)&self->mCurrentlyObservingPlayerLayer;
    v6 = v9;
    v7 = v10;
    v8 = v11;
    objc_msgSend(v5, "setIfDifferentFrame:orTransform:", &v6, v12, v13);
    if (self->mMovieReflectionMaskLayer)
    {
      v6 = v9;
      v7 = v10;
      v8 = v11;
      -[TSDMovieRep p_placeReflectionPlayerLayer:transform:](self, "p_placeReflectionPlayerLayer:transform:", &v6, v12, v13);
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDRep updateFromLayout](&v3, sel_updateFromLayout);
  -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
}

- (void)p_updateReflectionFrameRep
{
  id v3;
  CALayer *mReflectionPlayerStrokeLayer;
  uint64_t v5;
  CALayer *v6;
  CALayer *v7;

  v3 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (-[TSDMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v3)
    && objc_msgSend(v3, "isFrame"))
  {
    mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
    if (!mReflectionPlayerStrokeLayer)
    {
LABEL_6:
      self->mReflectionPlayerStrokeLayer = (CALayer *)-[TSDFrameRep initWithTSDFrame:]([TSDFrameRep alloc], "initWithTSDFrame:", v3);
      return;
    }
    v5 = -[CALayer frame](mReflectionPlayerStrokeLayer, "frame");
    v6 = self->mReflectionPlayerStrokeLayer;
    if ((id)v5 != v3)
    {

      self->mReflectionPlayerStrokeLayer = 0;
      goto LABEL_6;
    }
    if (!v6)
      goto LABEL_6;
  }
  else
  {
    v7 = self->mReflectionPlayerStrokeLayer;
    if (v7)
    {

      self->mReflectionPlayerStrokeLayer = 0;
    }
  }
}

- (void)i_updateFrameRep
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep i_updateFrameRep](&v3, sel_i_updateFrameRep);
  if (self->super.super.mReflectionLayer || -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
    -[TSDMovieRep p_updateReflectionFrameRep](self, "p_updateReflectionFrameRep");
}

- (void)p_commonDrawStrokeInContext:(CGContext *)a3
{
  CGFloat v5;

  CGContextSaveGState(a3);
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  CGContextScaleCTM(a3, v5, v5);
  -[TSDMovieRep p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:", a3, 0, 1, 0, 0, 0.0);
  CGContextRestoreGState(a3);
}

- (void)p_applyBasicStrokeToLayer:(id)a3 layer:(id)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  CGPath *Mutable;
  CGRect v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v12 = v11;
  objc_msgSend(a4, "setBounds:", x, y, width, height);
  objc_msgSend(a3, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", a4), v12);
  Mutable = CGPathCreateMutable();
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGPathAddRect(Mutable, 0, v14);
  objc_msgSend(a4, "setHidden:", 0);
  objc_msgSend(a4, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CAShapeLayer *mMaskLayer;
  double v26;
  double v27;
  float v28;
  double v29;
  CALayer *mPlayerStrokeLayer;
  float v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double x;
  CGFloat y;
  double width;
  double height;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CALayer *mFrameMaskLayer;
  CALayer *mTapToReplaceLayer;
  CALayer *mReflectionPlayerStrokeLayer;
  CALayer *mMovieReflectionMaskLayer;
  AVPlayerLayer *mReflectionPlayerLayer;
  double v59;
  double v60;
  double v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  double v66;
  CGFloat v67;
  TSDFrameRep *v68;
  double v69;
  CGFloat v70;
  CGAffineTransform v71;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v74;
  __int128 v75;
  CGAffineTransform v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v7 = -[TSDMovieRep playerStrokeLayer](self, "playerStrokeLayer");
  v8 = -[TSDMovieRep reflectionPlayerStrokeLayer](self, "reflectionPlayerStrokeLayer");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v10 = v9;
  v11 = -[TSDMovieRep p_needsTilingLayerForStroke:](self, "p_needsTilingLayerForStroke:", a3);
  v75 = 0u;
  memset(&v76, 0, sizeof(v76));
  v74 = 0u;
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v74, &v76, -[TSDLayout pureGeometry](-[TSDRep layout](self, "layout"), "pureGeometry"));
  v12 = v75;
  v13 = TSDRectWithSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = TSDCenterOfRect(*(CGFloat *)&v74, *((CGFloat *)&v74 + 1), *(CGFloat *)&v12, *((CGFloat *)&v12 + 1));
  v22 = v21;
  objc_msgSend(v7, "position");
  if (v24 != v20 || v23 != v22)
    objc_msgSend(v7, "setPosition:", v20, v22);
  mMaskLayer = self->super.mMaskLayer;
  if (mMaskLayer)
    -[CAShapeLayer affineTransform](mMaskLayer, "affineTransform");
  else
    memset(&t1, 0, sizeof(t1));
  t2 = v76;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v71 = v76;
    objc_msgSend(v7, "setAffineTransform:", &v71);
  }
  -[TSDStyledRep opacity](self, "opacity");
  v27 = v26;
  objc_msgSend(v7, "opacity");
  v29 = v28;
  if (v27 != v29)
  {
    *(float *)&v29 = v27;
    objc_msgSend(v7, "setOpacity:", v29);
  }
  if (self->super.super.mReflectionLayer)
  {
    mPlayerStrokeLayer = self->mPlayerStrokeLayer;
    if (mPlayerStrokeLayer)
    {
      -[CALayer opacity](mPlayerStrokeLayer, "opacity");
      v32 = v31;
      if (v27 != v32)
      {
        *(float *)&v32 = v27;
        objc_msgSend(v8, "setOpacity:", v32);
      }
    }
  }
  if (objc_msgSend(a3, "isFrame"))
  {
    v33 = TSDMultiplyRectScalar(*(double *)&v74, *((CGFloat *)&v74 + 1), *(CGFloat *)&v75, *((CGFloat *)&v75 + 1), 1.0 / v10);
    v35 = v34;
    v37 = v36;
    v70 = v38;
    objc_msgSend(a3, "coverageRectWithoutAdornment:");
    x = v77.origin.x;
    y = v77.origin.y;
    width = v77.size.width;
    height = v77.size.height;
    if (!CGRectEqualToRect(v77, *(CGRect *)&self->super.mFrameRep))
    {
      v66 = v33;
      v43 = TSDCenterOfRect(v33, v35, v37, v70);
      v67 = y;
      v68 = *(TSDFrameRep **)&x;
      v45 = TSDSubtractPoints(v43, v44, x);
      objc_msgSend(v7, "setAnchorPoint:", v45 / width, v46 / height);
      v69 = v10;
      TSDMultiplySizeScalar(width, height, v10);
      v47 = TSDRectWithSize();
      v49 = v48;
      v51 = v50;
      v53 = v52;
      objc_msgSend(v7, "bounds");
      v80.origin.x = v47;
      v80.origin.y = v49;
      v80.size.width = v51;
      v80.size.height = v53;
      if (!CGRectEqualToRect(v78, v80))
        objc_msgSend(v7, "setBounds:", v47, v49, v51, v53);
      -[TSDMovieRep i_updateFrameRep](self, "i_updateFrameRep");
      mFrameMaskLayer = self->super.mFrameMaskLayer;
      mTapToReplaceLayer = self->super.mTapToReplaceLayer;
      v64 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v65 = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&t2.c = v64;
      v63 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      *(_OWORD *)&t2.tx = v63;
      -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mFrameMaskLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v7, a4, mTapToReplaceLayer, &t2, v66, v35, v37, v70, v69);
      if (self->super.super.mReflectionLayer && self->mMovieReflectionMaskLayer)
      {
        objc_msgSend(v8, "bounds");
        v81.origin.x = v47;
        v81.origin.y = v49;
        v81.size.width = v51;
        v81.size.height = v53;
        if (!CGRectEqualToRect(v79, v81))
          objc_msgSend(v8, "setBounds:", v47, v49, v51, v53);
        mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
        mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
        mReflectionPlayerLayer = self->mReflectionPlayerLayer;
        *(_OWORD *)&t2.a = v65;
        *(_OWORD *)&t2.c = v64;
        *(_OWORD *)&t2.tx = v63;
        -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mReflectionPlayerStrokeLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v8, mMovieReflectionMaskLayer, mReflectionPlayerLayer, &t2, v66, v35, v37, v70, v69);
      }
      self->super.mFrameRep = v68;
      self->super.mLastPictureFrameLayerRect.origin.x = v67;
      self->super.mLastPictureFrameLayerRect.origin.y = width;
      self->super.mLastPictureFrameLayerRect.size.width = height;
    }
  }
  else
  {
    -[TSDMovieRep p_strokeFrameForLayerFrame:](self, "p_strokeFrameForLayerFrame:", v13, v15, v17, v19);
    -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", v7, v20, v22, v59, v60, v61, v62);
    if (!v11)
    {
      -[TSDMovieRep p_applyBasicStrokeToLayer:layer:bounds:](self, "p_applyBasicStrokeToLayer:layer:bounds:", a3, -[TSDMovieRep p_shapeLayerForPlayerStroke](self, "p_shapeLayerForPlayerStroke"), v13, v15, v17, v19);
      if (self->super.super.mReflectionLayer)
      {
        if (self->mMovieReflectionMaskLayer)
          -[TSDMovieRep p_applyBasicStrokeToLayer:layer:bounds:](self, "p_applyBasicStrokeToLayer:layer:bounds:", a3, -[TSDMovieRep p_shapeLayerForReflectionStroke](self, "p_shapeLayerForReflectionStroke"), v13, v15, v17, v19);
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)p_drawReflectionGradientIntoMovieReflectionLayer:(CGContext *)a3 reflectionSize:(CGSize)a4
{
  double height;
  double width;
  CGRect v8;

  height = a4.height;
  width = a4.width;
  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor"), "CGColor"));
  v8.origin.x = TSDRectWithSize();
  CGContextFillRect(a3, v8);
  -[TSDStyledRep drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:](self, "drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:", a3, 0, width, height);
  CGContextRestoreGState(a3);
}

- (void)p_updateMovieReflectionMaskLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGContext *v7;
  CGImage *Image;

  -[CALayer bounds](self->mLayerToStroke, "bounds");
  v4 = v3;
  v6 = v5;
  -[CALayer bounds](self->mLayerToStroke, "bounds");
  -[CALayer setBounds:](self->mMovieReflectionLayer, "setBounds:");
  v7 = TSDBitmapContextCreate(11, v4);
  -[TSDMovieRep p_drawReflectionGradientIntoMovieReflectionLayer:reflectionSize:](self, "p_drawReflectionGradientIntoMovieReflectionLayer:reflectionSize:", v7, v4, v6);
  Image = CGBitmapContextCreateImage(v7);
  -[CALayer setContents:](self->mMovieReflectionLayer, "setContents:", Image);
  -[CALayer setMask:](self->mLayerToStroke, "setMask:", self->mMovieReflectionLayer);
  CGContextRelease(v7);
  CGImageRelease(Image);
}

- (void)p_drawPosterImageInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGImage *v13;
  CGImage *v14;
  double MinY;
  CGFloat MaxY;
  id v17;
  TSPData *v18;
  TSPData *v19;
  void *v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  CGContextSaveGState(a3);
  -[TSDMediaLayout boundsForStandardKnobs](-[TSDMediaRep mediaLayout](self, "mediaLayout"), "boundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[TSDMovieRep alternatePosterImage](self, "alternatePosterImage");
  if (v13)
  {
    v14 = v13;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    MinY = CGRectGetMinY(v21);
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    MaxY = CGRectGetMaxY(v22);
    CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
    CGContextScaleCTM(a3, 1.0, -1.0);
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    CGContextDrawImage(a3, v23, v14);
  }
  else
  {
    v17 = +[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool");
    v18 = -[TSDMovieInfo posterImageData](-[TSDMovieRep movieInfo](self, "movieInfo"), "posterImageData");
    if (v18)
    {
      v19 = v18;
      objc_opt_class();
      objc_msgSend(v17, "providerForData:shouldValidate:", v19, 1);
      v20 = (void *)TSUDynamicCast();
      if (v20)
        objc_msgSend(v20, "drawImageInContext:rect:", a3, v6, v8, v10, v12);
    }
  }
  CGContextRestoreGState(a3);
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forShadowOrHitTest:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  _BOOL4 v16;
  int v17;
  int v18;
  TSDMediaLayout *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CALayer *mFrameMaskLayer;
  CGAffineTransform v29;

  v8 = a7;
  v10 = a5;
  v11 = a4;
  if ((objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout", a3, a4, a5, a7, a8), "isInvisible") & 1) == 0)
  {
    -[TSDMovieRep i_updateFrameRep](self, "i_updateFrameRep");
    v14 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "shouldRender"))
      {
        if (-[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds")
          && (objc_msgSend(v15, "isFrame") & 1) == 0)
        {
          v15 = (id)objc_msgSend(v15, "mutableCopy");
          objc_msgSend(v15, "setColor:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"));
        }
      }
      else
      {
        v15 = 0;
      }
    }
    v16 = a6 < 1.0 && v10;
    v17 = v16 && v11;
    if (v16 && v11 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v15))
    {
      CGContextBeginTransparencyLayer(a3, 0);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    CGContextSaveGState(a3);
    v19 = -[TSDMediaRep mediaLayout](self, "mediaLayout");
    -[TSDMediaLayout boundsForStandardKnobs](v19, "boundsForStandardKnobs");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    if (v11)
    {
      if (v8 && self->super.mFrameMaskLayer && objc_msgSend(v15, "hasMask"))
      {
        objc_msgSend(v15, "coverageRect:", v21, v23, v25, v27);
        -[CALayer applyMaskForRectWithCoverage:toContext:](self->super.mFrameMaskLayer, "applyMaskForRectWithCoverage:toContext:", a3);
      }
      -[TSDMovieRep p_drawPosterImageInContext:](self, "p_drawPosterImageInContext:", a3);
    }
    CGContextRestoreGState(a3);
    if (v10 && v15)
    {
      CGContextSaveGState(a3);
      if (objc_msgSend(v15, "isFrame"))
      {
        if (-[TSDMediaLayout shouldRenderFrameStroke](v19, "shouldRenderFrameStroke"))
        {
          mFrameMaskLayer = self->super.mFrameMaskLayer;
          CGContextGetCTM(&v29, a3);
          -[CALayer frameRect:inContext:withTotalScale:](mFrameMaskLayer, "frameRect:inContext:withTotalScale:", a3, v21, v23, v25, v27, TSDTransformScale(&v29.a));
        }
      }
      else
      {
        objc_msgSend(v15, "paintRect:inContext:", a3, v21, v23, v25, v27);
      }
      CGContextRestoreGState(a3);
    }
    if (v18)
      CGContextEndTransparencyLayer(a3);
    if (v17)
      CGContextRestoreGState(a3);
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double v13;

  v8 = a7;
  v9 = a5;
  v10 = a4;
  v13 = 1.0;
  if (a6)
    -[TSDStyledRep opacity](self, "opacity", a3, a4, a5, a6, a7, a8, 1.0);
  -[TSDMovieRep p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:", a3, v10, v9, 1, v8, a8, v13);
}

- (void)drawInLayerContext:(CGContext *)a3
{
  -[TSDMovieRep p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:", a3, 1, 1, 1, 0, 1.0);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep processChangedProperty:](&v5, sel_processChangedProperty_);
  switch(a3)
  {
    case 517:
      -[TSDMovieRep i_updateFrameRep](self, "i_updateFrameRep");
      -[TSDMovieRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
      -[TSDMovieRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
      -[TSDMovieRep p_disposeReflectionStrokeLayers](self, "p_disposeReflectionStrokeLayers");
      goto LABEL_3;
    case 518:
    case 519:
    case 520:
LABEL_3:
      -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
      break;
    case 532:
      -[TSDMovieRep p_setNeedsTeardownPlayerControllerOnUpdateLayer](self, "p_setNeedsTeardownPlayerControllerOnUpdateLayer");
      -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
      -[TSDMovieRep p_stopUpdatingUIStateForMoviePlayability](self, "p_stopUpdatingUIStateForMoviePlayability");
      -[TSDMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
      break;
    case 533:
      -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
      -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
      break;
    case 534:
      -[TSDMovieRep p_updateStartTime](self, "p_updateStartTime");
      break;
    case 535:
      -[TSDMovieRep p_updateEndTime](self, "p_updateEndTime");
      break;
    case 537:
      -[TSDMovieRep p_updateRepeatMode](self, "p_updateRepeatMode");
      break;
    case 538:
      -[TSDMovieRep p_updateVolume](self, "p_updateVolume");
      break;
    default:
      return;
  }
}

- (void)becameSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDRep becameSelected](&v3, sel_becameSelected);
  if (-[TSDMovieRep p_shouldPlayerControllerExistThroughoutSelection](self, "p_shouldPlayerControllerExistThroughoutSelection"))
  {
    -[TSDMovieRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
  }
  else
  {
    -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  }
}

- (void)becameNotSelected
{
  objc_super v3;

  -[TSDMovieRep p_setNeedsTeardownPlayerControllerOnUpdateLayer](self, "p_setNeedsTeardownPlayerControllerOnUpdateLayer");
  -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDRep becameNotSelected](&v3, sel_becameNotSelected);
}

- (BOOL)shouldSingleTapPlay
{
  return !-[TSDMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame");
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  _BOOL4 v4;
  _BOOL4 v5;

  v4 = -[TSDMovieRep isPlaying](self, "isPlaying", a3.x, a3.y);
  if (v4
    || (v5 = -[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
    && (v5 = -[TSDMovieRep shouldSingleTapPlay](self, "shouldSingleTapPlay"))
    && (v5 = -[TSDMovieRep isPlayable](self, "isPlayable")))
  {
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setPlaying:", !v4);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)p_updateRepeatMode
{
  if (!-[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming"))
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setRepeatMode:", TSKPlayerRepeatModeForMovieLoopOption(-[TSDMovieInfo loopOption](-[TSDMovieRep movieInfo](self, "movieInfo"), "loopOption")));
}

- (void)screenScaleDidChange
{
  objc_super v3;

  *(_QWORD *)&self->mDidCheckPlayability = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDRep screenScaleDidChange](&v3, sel_screenScaleDidChange);
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  objc_msgSend(a3, "addObject:", -[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  -[TSDMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
  -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
}

- (void)addKnobsToArray:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep addKnobsToArray:](&v5, sel_addKnobsToArray_);
  -[TSDMovieRep p_addPlayButtonToKnobs:](self, "p_addPlayButtonToKnobs:", a3);
}

- (unint64_t)enabledKnobMask
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  v3 = -[TSDRep enabledKnobMask](&v5, sel_enabledKnobMask);
  if (-[TSDMediaRep shouldCreateKnobs](self, "shouldCreateKnobs")
    && -[TSDRep isSelected](self, "isSelected")
    && !-[TSDMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame"))
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  objc_super v6;

  if (-[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob") == a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieRep;
  return -[TSDRep directlyManagesVisibilityOfKnob:](&v6, sel_directlyManagesVisibilityOfKnob_, a3);
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
  -[TSDMovieRep p_cancelUpdatingUIStateForMoviePlayability](self, "p_cancelUpdatingUIStateForMoviePlayability");
  -[TSDMovieRep p_teardownPlayerController](self, "p_teardownPlayerController");
}

- (void)willBeginReadMode
{
  BYTE2(self->mPlayButtonKnob) = 1;
  -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  -[TSDMovieRep p_teardownPlayerController](self, "p_teardownPlayerController");
}

- (void)willEndReadMode
{
  BYTE2(self->mPlayButtonKnob) = 0;
  -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (TSDButtonKnob)p_playButtonKnob
{
  TSDButtonKnob *result;

  result = *(TSDButtonKnob **)&self->mDidCheckPlayability;
  if (!result)
  {
    *(_QWORD *)&self->mDidCheckPlayability = -[TSDButtonKnob initWithImage:tag:onRep:]([TSDMovieKnob alloc], "initWithImage:tag:onRep:", objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("TSDMoviePlay"), TSDBundle()), 5, self);
    LOBYTE(self->mPlayButtonKnob) = 1;
    objc_msgSend(*(id *)&self->mDidCheckPlayability, "setWorksWhenRepLocked:", 1);
    objc_msgSend(*(id *)&self->mDidCheckPlayability, "setWorksWhenInVersionBrowsingMode:", 1);
    return *(TSDButtonKnob **)&self->mDidCheckPlayability;
  }
  return result;
}

- (void)p_updateUIStateForMoviePlayability
{
  TSPData *v3;
  id v4;
  _QWORD v5[6];

  if (!LOBYTE(self->mAssetForPlayability) && !self->mReflectionFrameMaskLayer)
  {
    v3 = -[TSDMovieInfo movieData](-[TSDMovieRep movieInfo](self, "movieInfo"), "movieData");
    if (v3)
    {
      v4 = -[TSPData AVAsset](v3, "AVAsset");
      self->mReflectionFrameMaskLayer = (CALayer *)v4;
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke;
      v5[3] = &unk_24D82A5C8;
      v5[4] = v4;
      v5[5] = self;
      objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24D8FA2C0, v5);
    }
    else
    {
      LOBYTE(self->mAssetForPlayability) = 1;
      BYTE1(self->mAssetForPlayability) = 1;
      -[TSDButtonKnob setEnabled:](-[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob"), "setEnabled:", 1);
    }
  }
}

void __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke(uint64_t a1)
{
  __CFRunLoop *Main;
  const void *v3;
  _QWORD v4[4];
  __int128 v5;

  Main = CFRunLoopGetMain();
  v3 = (const void *)*MEMORY[0x24BDBD598];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke_2;
  v4[3] = &unk_24D82A5C8;
  v5 = *(_OWORD *)(a1 + 32);
  CFRunLoopPerformBlock(Main, v3, v4);
  CFRunLoopWakeUp(Main);
}

void __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("playable"), 0);
  if (v2 != 4)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 528) = 1;
    if (v2 == 2)
      v3 = objc_msgSend(*(id *)(a1 + 32), "isPlayable");
    else
      v3 = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 529) = v3;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "p_playButtonKnob"), "setEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 529));
    objc_msgSend(*(id *)(a1 + 40), "p_updatePlayButtonVisibility");
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 520);
  if (v4 == *(void **)(a1 + 32))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 520) = 0;
  }
}

- (void)p_stopUpdatingUIStateForMoviePlayability
{
  -[CALayer cancelLoading](self->mReflectionFrameMaskLayer, "cancelLoading");

  self->mReflectionFrameMaskLayer = 0;
  LOBYTE(self->mAssetForPlayability) = 0;
}

- (void)p_cancelUpdatingUIStateForMoviePlayability
{
  -[TSDMovieRep p_stopUpdatingUIStateForMoviePlayability](self, "p_stopUpdatingUIStateForMoviePlayability");
  BYTE1(self->mPlayButtonKnob) = 1;
}

- (BOOL)p_playButtonFitsInFrame
{
  TSDInteractiveCanvasController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  -[CALayer frame](-[TSDKnob layer](-[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob"), "layer"), "frame");
  v5 = v4;
  v7 = v6;
  -[TSDRep naturalBounds](self, "naturalBounds");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v3, "convertUnscaledToBoundsRect:");
  return v7 <= v9 && v5 <= v8;
}

- (void)p_updatePlayButtonVisibility
{
  NSSet *v3;
  TSDMovieInfo *v4;
  TSDMovieInfo *v5;
  _BOOL4 v6;
  BOOL v7;
  int v8;
  CALayer *v9;
  CALayer *v10;
  double v11;
  char v12;
  void *v13;
  double v14;
  double v15;

  if (!-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
    || BYTE1(self->mPlayButtonKnob))
  {
    return;
  }
  v3 = -[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "canvasSelection"), "infos");
  v4 = -[TSDMovieRep movieInfo](self, "movieInfo");
  if (-[NSSet count](v3, "count") == 1)
    v5 = -[NSSet anyObject](v3, "anyObject");
  else
    v5 = 0;
  v6 = -[TSDMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame");
  if (LOBYTE(self->mAssetForPlayability))
    v7 = v5 == v4;
  else
    v7 = 0;
  if (!v7)
    goto LABEL_14;
  v8 = 0;
  if (!-[TSDMovieRep isPlaying](self, "isPlaying") && v6)
  {
    if (BYTE2(self->mPlayButtonKnob))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    v8 = self->mAlternatePosterImage == 0;
  }
LABEL_15:
  if (LOBYTE(self->mPlayButtonKnob) != v8)
  {
    LOBYTE(self->mPlayButtonKnob) = v8;
    v9 = -[TSDKnob layer](-[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob"), "layer");
    v10 = v9;
    LODWORD(v11) = 0;
    if (v8)
      *(float *)&v11 = 1.0;
    -[CALayer setOpacity:](v9, "setOpacity:", v11);
    if (LOBYTE(self->mPlayButtonKnob))
    {
      -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
    }
    else
    {
      if (v5 == v4)
        v12 = 0;
      else
        v12 = -[objc_class isSubclassOfClass:](-[TSDMovieInfo repClass](v5, "repClass"), "isSubclassOfClass:", objc_opt_class());
      if (!BYTE2(self->mPlayButtonKnob) && v6 && (v12 & 1) == 0 && -[CALayer superlayer](v10, "superlayer"))
      {
        if (LOBYTE(self->mAssetForPlayability))
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
          LODWORD(v14) = 1.0;
          objc_msgSend(v13, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14));
          LODWORD(v15) = 0;
          objc_msgSend(v13, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15));
          objc_msgSend(v13, "setDuration:", 0.4);
          -[CALayer addAnimation:forKey:](v10, "addAnimation:forKey:", v13, CFSTR("opacity"));
        }
      }
    }
  }
}

- (id)playerController
{
  -[TSDMovieRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
  return *(id *)&self->super.mLastPictureFrameLayerRect.size.height;
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  -[TSDInteractiveCanvasController presentError:completionHandler:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController", a3), "presentError:completionHandler:", a4, 0);
}

- (void)playbackDidStopForPlayerController:(id)a3
{
  -[TSDMovieRep p_setNeedsTeardownPlayerControllerOnUpdateLayer](self, "p_setNeedsTeardownPlayerControllerOnUpdateLayer", a3);
  -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
}

- (BOOL)isPlaying
{
  CGFloat height;

  height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0)
    LOBYTE(height) = objc_msgSend(*(id *)&height, "isPlaying");
  return LOBYTE(height);
}

- (void)p_playForKnob
{
  if (-[TSDMovieRep isPlayable](self, "isPlayable"))
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setPlaying:", 1);
}

- (void)p_togglePlaying
{
  if (-[TSDMovieRep isPlayable](self, "isPlayable"))
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setPlaying:", objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "isPlaying") ^ 1);
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setupPlayerControllerIfNecessary
{
  id v3;
  id v4;
  double v5;

  if (!*(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height)
  {
    v3 = objc_alloc(MEMORY[0x24BDB2610]);
    v4 = (id)objc_msgSend(v3, "initWithPlayerItem:", objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", -[TSDMovieInfo makeAVAsset](-[TSDMovieRep movieInfo](self, "movieInfo"), "makeAVAsset")));
    -[TSDMovieRep willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerController"));
    *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height = -[TSKAVPlayerController initWithPlayer:delegate:]([TSKAVPlayerController alloc], "initWithPlayer:delegate:", v4, self);
    -[TSDMovieRep didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerController"));
    -[TSDMovieRep p_updateStartTime](self, "p_updateStartTime");
    -[TSDMovieInfo endTime](-[TSDMovieRep movieInfo](self, "movieInfo"), "endTime");
    if (v5 != 0.0)
      -[TSDMovieRep p_updateEndTime](self, "p_updateEndTime");
    -[TSDMovieRep p_updateRepeatMode](self, "p_updateRepeatMode");
    -[TSDMovieRep p_updateVolume](self, "p_updateVolume");
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "addObserver:forKeyPath:options:context:", self, CFSTR("playing"), 4, TSDMovieRepPlayerControllerPlayingObserverContext);
    -[TSDMovieRep p_setupPlayerLayerIfNecessary](self, "p_setupPlayerLayerIfNecessary");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
}

- (void)p_teardownPlayerController
{
  -[TSDMovieRep p_setNeedsTeardownPlayerControllerOnUpdateLayer](self, "p_setNeedsTeardownPlayerControllerOnUpdateLayer");
  -[TSDMovieRep p_teardownPlayerControllerIfNeeded](self, "p_teardownPlayerControllerIfNeeded");
}

- (void)p_setNeedsTeardownPlayerControllerOnUpdateLayer
{
  BYTE5(self->mIsChangingDynamicVisibleTimeCount) = 1;
}

- (void)p_teardownPlayerControllerIfNeeded
{
  CGFloat height;
  AVPlayerLayer *mPlayerLayer;
  AVPlayerLayer *v5;
  AVPlayerLayer *mReflectionPlayerLayer;
  CALayer *mMovieReflectionMaskLayer;

  height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0 && BYTE5(self->mIsChangingDynamicVisibleTimeCount))
  {
    if (objc_msgSend(*(id *)&height, "isPlaying"))
      objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setPlaying:", 0);
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "removeObserver:forKeyPath:", self, CFSTR("playing"));
    if (LOBYTE(self->mPlayerController))
      objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), TSDMovieRepPlayerLayerReadyForDisplayObserverContext);
    -[TSDMovieRep willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerController"));
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "teardown");

    self->super.mLastPictureFrameLayerRect.size.height = 0.0;
    -[TSDMovieRep didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerController"));
    BYTE1(self->mPlayerController) = 0;
    mPlayerLayer = self->mPlayerLayer;
    v5 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    if (mPlayerLayer == v5)
    {

      self->mPlayerLayer = 0;
      v5 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    }
    -[AVPlayerLayer setDelegate:](v5, "setDelegate:", 0);

    *(_QWORD *)&self->mCurrentlyObservingPlayerLayer = 0;
    mReflectionPlayerLayer = self->mReflectionPlayerLayer;
    if (mReflectionPlayerLayer)
    {
      -[AVPlayerLayer setDelegate:](mReflectionPlayerLayer, "setDelegate:", 0);
      -[AVPlayerLayer removeFromSuperlayer](self->mReflectionPlayerLayer, "removeFromSuperlayer");

      self->mReflectionPlayerLayer = 0;
    }
    mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
    if (mMovieReflectionMaskLayer)
    {
      -[CALayer setDelegate:](mMovieReflectionMaskLayer, "setDelegate:", 0);
      -[CALayer removeFromSuperlayer](self->mMovieReflectionMaskLayer, "removeFromSuperlayer");

      self->mMovieReflectionMaskLayer = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  BYTE5(self->mIsChangingDynamicVisibleTimeCount) = 0;
}

- (void)p_updateVolume
{
  int v3;
  int v4;
  id v5;
  double v6;

  -[TSDMovieRep volume](self, "volume");
  v4 = v3;
  v5 = -[TSDMovieRep playerController](self, "playerController");
  LODWORD(v6) = v4;
  objc_msgSend(v5, "setVolume:", v6);
}

- (void)p_updateStartTime
{
  double v3;

  if (!-[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming"))
  {
    -[TSDMovieInfo startTime](-[TSDMovieRep movieInfo](self, "movieInfo"), "startTime");
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setStartTime:", v3);
  }
}

- (void)p_updateEndTime
{
  double v3;

  if (!-[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming"))
  {
    -[TSDMovieInfo endTime](-[TSDMovieRep movieInfo](self, "movieInfo"), "endTime");
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setEndTime:", v3);
  }
}

- (id)additionalLayersUnderLayer
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDStyledRep additionalLayersUnderLayer](&v5, sel_additionalLayersUnderLayer));
  if (self->mLayerToStroke && -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
    objc_msgSend(v3, "addObject:", self->mLayerToStroke);
  return v3;
}

- (id)additionalLayersOverLayer
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMovieRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDMediaRep additionalLayersOverLayer](&v7, sel_additionalLayersOverLayer));
  v4 = v3;
  if (*(_QWORD *)&self->mCurrentlyObservingPlayerLayer)
    objc_msgSend(v3, "addObject:");
  v5 = -[TSDMovieRep playerStrokeLayer](self, "playerStrokeLayer");
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  return v4;
}

- (BOOL)canResetMediaSize
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  v3 = -[TSDMediaRep canResetMediaSize](&v5, sel_canResetMediaSize);
  if (v3)
  {
    if (-[TSDMovieInfo isAudioOnly](-[TSDMovieRep movieInfo](self, "movieInfo"), "isAudioOnly"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[TSDMovieInfo isStreaming](-[TSDMovieRep movieInfo](self, "movieInfo"), "isStreaming");
  }
  return v3;
}

- (BOOL)isDraggable
{
  return 1;
}

- (void)setAlternatePosterImage:(CGImage *)a3
{
  if (*(CGImage **)&self->mPlayButtonKnobVisible != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(*(CGImageRef *)&self->mPlayButtonKnobVisible);
    *(_QWORD *)&self->mPlayButtonKnobVisible = a3;
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (double)visibleTime
{
  double result;

  if (self->mAlternatePosterImage)
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "absoluteCurrentTime");
  else
    -[TSDMovieInfo posterTime](-[TSDMovieRep movieInfo](self, "movieInfo"), "posterTime");
  return result;
}

- (void)dynamicVisibleTimeChangeDidBegin
{
  void *v3;
  uint64_t v4;
  CGImage *mAlternatePosterImage;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep dynamicVisibleTimeChangeDidBegin]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2125, CFSTR("Dynamic poster time changes can only be made on the main thread"));
  }
  mAlternatePosterImage = self->mAlternatePosterImage;
  self->mAlternatePosterImage = (CGImage *)((char *)mAlternatePosterImage + 1);
  if (!mAlternatePosterImage)
  {
    -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "beginScrubbing");
  }
}

- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2136, CFSTR("Dynamic poster time changes can only be made on the main thread"));
  }
  if (!self->mAlternatePosterImage)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2137, CFSTR("A dynamic poster time change must be in progress"));
  }
  objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "scrubToTime:withTolerance:completionHandler:", a5, a3, a4);
}

- (void)dynamicVisibleTimeChangeDidEnd
{
  void *v3;
  uint64_t v4;
  CGImage *mAlternatePosterImage;
  void *v6;
  uint64_t v7;
  CGImage *v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep dynamicVisibleTimeChangeDidEnd]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2144, CFSTR("Dynamic poster time changes can only be made on the main thread"));
  }
  mAlternatePosterImage = self->mAlternatePosterImage;
  if (!mAlternatePosterImage)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieRep dynamicVisibleTimeChangeDidEnd]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2145, CFSTR("Mismatch between starting and ending dynamic visible poster time changes"));
    mAlternatePosterImage = self->mAlternatePosterImage;
  }
  v8 = (CGImage *)((char *)mAlternatePosterImage - 1);
  self->mAlternatePosterImage = v8;
  if (!v8)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "player"), "currentItem"), "cancelPendingSeeks");
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "endScrubbing");
    -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  }
}

- (float)volume
{
  float result;

  if (BYTE4(self->mIsChangingDynamicVisibleTimeCount))
    return *(float *)&self->mIsChangingDynamicVisibleTimeCount;
  -[TSDMovieInfo volume](-[TSDMovieRep movieInfo](self, "movieInfo"), "volume");
  return result;
}

- (void)dynamicVolumeChangeDidBegin
{
  int v3;

  -[TSDMovieRep volume](self, "volume");
  LODWORD(self->mIsChangingDynamicVisibleTimeCount) = v3;
  BYTE4(self->mIsChangingDynamicVisibleTimeCount) = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  *(float *)&self->mIsChangingDynamicVisibleTimeCount = a3;
  -[TSDMovieRep p_updateVolume](self, "p_updateVolume");
}

- (void)dynamicVolumeChangeDidEnd
{
  BYTE4(self->mIsChangingDynamicVisibleTimeCount) = 0;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  uint64_t v6;
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "mixingTypeWithObject:", objc_msgSend(a4, "movieInfo"));
  result = 0.0;
  if (v6 != 1)
  {
    objc_msgSend((id)objc_msgSend(a3, "movieInfo", 0.0), "startTime");
    v9 = v8;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "startTime");
    if (v9 == v10)
    {
      v14 = 1.0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "endTime");
      v12 = v11;
      objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "startTime");
      if (v12 == v13)
        v14 = 0.9;
      else
        v14 = 0.5;
    }
    objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "endTime");
    v16 = v15;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "endTime");
    if (v16 != v17)
      v14 = v14 * 0.5;
    objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "posterTime");
    v19 = v18;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "posterTime");
    if (v19 == v20)
      return v14;
    else
      return v14 * 0.5;
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)TSDMovieRepPlayerControllerPlayingObserverContext == a6)
  {
    -[TSDMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility", a3, a4, a5);
    -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  }
  else if ((void *)TSDMovieRepPlayerLayerReadyForDisplayObserverContext == a6)
  {
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDD0E70], a4), "BOOLValue"))
    {
      objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), TSDMovieRepPlayerLayerReadyForDisplayObserverContext);
      LOBYTE(self->mPlayerController) = 0;
      BYTE1(self->mPlayerController) = 1;
      -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDMovieRep;
    -[TSDMovieRep observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)isPlayable
{
  return BYTE1(self->mAssetForPlayability);
}

- (CGImage)alternatePosterImage
{
  return *(CGImage **)&self->mPlayButtonKnobVisible;
}

@end
