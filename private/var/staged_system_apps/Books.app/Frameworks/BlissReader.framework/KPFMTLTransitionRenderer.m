@implementation KPFMTLTransitionRenderer

- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7
{
  id v13;
  id v14;
  KPFMTLTransitionRenderer *v15;
  KPFMTLTransitionRenderer *v16;
  KNAnimationContext *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  KNAnimationContext *v24;
  KNAnimationContext *mAnimationContext;
  NSArray *mTextures;
  uint64_t v27;
  TSDMetalLayer *metalLayer;
  dispatch_semaphore_t v29;
  OS_dispatch_semaphore *mInFlightSemaphore;
  objc_super v32;

  v13 = a6;
  v14 = a7;
  v32.receiver = self;
  v32.super_class = (Class)KPFMTLTransitionRenderer;
  v15 = -[KPFMTLTransitionRenderer init](&v32, "init");
  v16 = v15;
  if (v15)
  {
    v15->mEffectClass = a3;
    objc_storeStrong((id *)&v15->mEffect, a6);
    objc_storeStrong((id *)&v16->mSession, a7);
    v16->mDirection = a4;
    v16->mDuration = a5;
    v17 = [KNAnimationContext alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KPFSession showLayer](v16->mSession, "showLayer"));
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KPFSession showLayer](v16->mSession, "showLayer"));
    v24 = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v17, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", v23, 1, v20, v22, 1.0);
    mAnimationContext = v16->mAnimationContext;
    v16->mAnimationContext = v24;

    mTextures = v16->mTextures;
    v16->mTextures = 0;

    v27 = objc_claimAutoreleasedReturnValue(-[KPFSession sharedMetalLayer](v16->mSession, "sharedMetalLayer"));
    metalLayer = v16->metalLayer;
    v16->metalLayer = (TSDMetalLayer *)v27;

    v29 = dispatch_semaphore_create(3);
    mInFlightSemaphore = v16->mInFlightSemaphore;
    v16->mInFlightSemaphore = (OS_dispatch_semaphore *)v29;

  }
  return v16;
}

- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 session:(id)a6
{
  id v11;
  KPFMTLTransitionRenderer *v12;
  KPFMTLTransitionRenderer *v13;
  KNAnimationContext *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  KNAnimationContext *v21;
  KNAnimationContext *mAnimationContext;
  NSArray *mTextures;
  uint64_t v24;
  TSDMetalLayer *metalLayer;
  dispatch_semaphore_t v26;
  OS_dispatch_semaphore *mInFlightSemaphore;
  objc_super v29;

  v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)KPFMTLTransitionRenderer;
  v12 = -[KPFMTLTransitionRenderer init](&v29, "init");
  v13 = v12;
  if (v12)
  {
    v12->mEffectClass = a3;
    objc_storeStrong((id *)&v12->mCAKPFSession, a6);
    v13->mDirection = a4;
    v13->mDuration = a5;
    v14 = [KNAnimationContext alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "showLayer"));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "showLayer"));
    v21 = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v14, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", v20, 1, v17, v19, 1.0);
    mAnimationContext = v13->mAnimationContext;
    v13->mAnimationContext = v21;

    mTextures = v13->mTextures;
    v13->mTextures = 0;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharedMetalLayer"));
    metalLayer = v13->metalLayer;
    v13->metalLayer = (TSDMetalLayer *)v24;

    v26 = dispatch_semaphore_create(3);
    mInFlightSemaphore = v13->mInFlightSemaphore;
    v13->mInFlightSemaphore = (OS_dispatch_semaphore *)v26;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[KPFMTLTransitionRenderer teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)KPFMTLTransitionRenderer;
  -[KPFMTLTransitionRenderer dealloc](&v3, "dealloc");
}

- (void)setupPluginContext
{
  KNAnimationPluginContext *mContext;
  KNAnimationPluginContext *v4;
  KNAnimationPluginContext *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  mContext = self->mContext;
  if (!mContext)
  {
    v4 = objc_alloc_init(KNAnimationPluginContext);
    v5 = self->mContext;
    self->mContext = v4;

    mContext = self->mContext;
  }
  -[KNAnimationPluginContext setRendererType:](mContext, "setRendererType:", 9);
  -[KNAnimationPluginContext setTextures:](self->mContext, "setTextures:", self->mTextures);
  -[KNAnimationPluginContext setPercent:](self->mContext, "setPercent:", self->mPercent);
  -[KNAnimationPluginContext setDuration:](self->mContext, "setDuration:", self->mDuration);
  -[KNAnimationPluginContext setDirection:](self->mContext, "setDirection:", self->mDirection);
  v7 = (void *)objc_opt_new(TSDMetalContext, v6);
  -[KNAnimationPluginContext setMetalContext:](self->mContext, "setMetalContext:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalLayer device](self->metalLayer, "device"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationPluginContext metalContext](self->mContext, "metalContext"));
  objc_msgSend(v9, "setDevice:", v8);

  v10 = -[TSDMetalLayer pixelFormat](self->metalLayer, "pixelFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationPluginContext metalContext](self->mContext, "metalContext"));
  objc_msgSend(v11, "setPixelFormat:", v10);

  -[TSDMetalLayer bounds](self->metalLayer, "bounds");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationPluginContext metalContext](self->mContext, "metalContext"));
  objc_msgSend(v16, "setLayerSize:", v13, v15);

  -[TSDMetalLayer setDelegate:](self->metalLayer, "setDelegate:", self);
}

- (id)plugin
{
  id mPlugin;
  id v4;
  id v5;

  mPlugin = self->mPlugin;
  if (!mPlugin)
  {
    v4 = objc_msgSend(objc_alloc(self->mEffectClass), "initWithAnimationContext:", self->mAnimationContext);
    v5 = self->mPlugin;
    self->mPlugin = v4;

    mPlugin = self->mPlugin;
  }
  return mPlugin;
}

- (void)p_initMetalLayerIfNeeded
{
  void *mCAKPFSession;
  TSDMetalLayer *v4;
  TSDMetalLayer *metalLayer;
  void *mSession;
  void *v7;
  CAKPFSession *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;

  mCAKPFSession = self->mCAKPFSession;
  if (!mCAKPFSession)
    mCAKPFSession = self->mSession;
  v4 = (TSDMetalLayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(mCAKPFSession, "sharedMetalLayer"));
  metalLayer = self->metalLayer;
  self->metalLayer = v4;

  -[TSDMetalLayer displayAtCurrentLayerTime](self->metalLayer, "displayAtCurrentLayerTime");
  -[TSDMetalLayer setDelegate:](self->metalLayer, "setDelegate:", self);
  mSession = self->mCAKPFSession;
  if (!mSession)
    mSession = self->mSession;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(mSession, "showLayer"));
  objc_msgSend(v7, "bounds");
  -[TSDMetalLayer setBounds:](self->metalLayer, "setBounds:");

  -[TSDMetalLayer setPresentsWithTransaction:](self->metalLayer, "setPresentsWithTransaction:", 0);
  v8 = self->mCAKPFSession;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUColor blackColor](TSUColor, "blackColor"));
  v10 = objc_msgSend(v9, "CGColor");
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession showLayer](self->mCAKPFSession, "showLayer"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession showLayer](self->mCAKPFSession, "showLayer"));
    objc_msgSend(v12, "setSublayers:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession showLayer](self->mCAKPFSession, "showLayer"));
    objc_msgSend(v13, "addSublayer:", self->metalLayer);

    if (!self->metalLayer)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer p_initMetalLayerIfNeeded]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 176, CFSTR("invalid nil value for '%s'"), "metalLayer");
LABEL_10:

    }
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KPFSession showLayer](self->mSession, "showLayer"));
    objc_msgSend(v17, "setBackgroundColor:", v10);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KPFSession showLayer](self->mSession, "showLayer"));
    objc_msgSend(v18, "setSublayers:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KPFSession showLayer](self->mSession, "showLayer"));
    objc_msgSend(v19, "addSublayer:", self->metalLayer);

    if (!self->metalLayer)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer p_initMetalLayerIfNeeded]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 181, CFSTR("invalid nil value for '%s'"), "metalLayer");
      goto LABEL_10;
    }
  }
  -[TSDMetalLayer setHidden:](self->metalLayer, "setHidden:", 0);
  LODWORD(v20) = 1.0;
  -[TSDMetalLayer setOpacity:](self->metalLayer, "setOpacity:", v20);
}

- (void)p_generateTextures
{
  void *v3;
  void *v4;
  CAKPFSession *mCAKPFSession;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGImage *v10;
  id v11;
  void *v12;
  void *v13;
  CAKPFSession *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGImage *v19;
  id v20;
  NSArray *v21;
  NSArray *mTextures;
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KPFGingerEffect textures](self->mEffect, "textures"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  mCAKPFSession = self->mCAKPFSession;
  if (mCAKPFSession)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession KPFDocument](mCAKPFSession, "KPFDocument"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession currentEvent](self->mCAKPFSession, "currentEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textures"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    v10 = (CGImage *)objc_msgSend(v6, "newImageForTextureName:", v9);

  }
  else
  {
    v10 = -[KPFSession CGImageForTextureName:](self->mSession, "CGImageForTextureName:", v4);
  }
  v11 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KPFGingerEffect textures](self->mEffect, "textures"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 1));

  v14 = self->mCAKPFSession;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession KPFDocument](v14, "KPFDocument"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAKPFSession currentEvent](self->mCAKPFSession, "currentEvent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textures"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 1));
    v19 = (CGImage *)objc_msgSend(v15, "newImageForTextureName:", v18);

  }
  else
  {
    v19 = -[KPFSession CGImageForTextureName:](self->mSession, "CGImageForTextureName:", v13);
  }
  v20 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v19);
  v23[0] = v11;
  v23[1] = v20;
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  mTextures = self->mTextures;
  self->mTextures = v21;

}

- (void)renderTextures
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[NSArray copy](self->mTextures, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationPluginContext metalContext](self->mContext, "metalContext"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
        objc_msgSend(v8, "setupMetalTextureForDevice:", v10);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)animateWithDelay:(double)a3
{
  id mTransitionEndCallbackTarget;
  _QWORD block[5];

  if (!self->mTextures)
  {
    -[KPFMTLTransitionRenderer p_initMetalLayerIfNeeded](self, "p_initMetalLayerIfNeeded");
    -[KPFMTLTransitionRenderer setupPluginContext](self, "setupPluginContext");
    -[KPFMTLTransitionRenderer p_generateTextures](self, "p_generateTextures");
    -[KPFMTLTransitionRenderer renderTextures](self, "renderTextures");
  }
  if (-[KPFMTLTransitionRenderer addAnimationsAtTime:relativeToCurrentMediaTime:](self, "addAnimationsAtTime:relativeToCurrentMediaTime:", 1, a3))
  {
    self->mIsRealtime = 1;
    -[TSDMetalLayer startAnimation](self->metalLayer, "startAnimation");
    self->_isAnimationBeingStopped = 0;
  }
  else
  {
    mTransitionEndCallbackTarget = self->mTransitionEndCallbackTarget;
    if (mTransitionEndCallbackTarget)
    {
      if ((objc_opt_respondsToSelector(mTransitionEndCallbackTarget, self->mTransitionEndCallbackSelector) & 1) != 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_646AC;
        block[3] = &unk_426D30;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (BOOL)addAnimationsAtTime:(double)a3 relativeToCurrentMediaTime:(BOOL)a4
{
  CFTimeInterval v4;

  v4 = a3;
  if (a4)
    v4 = CACurrentMediaTime() + a3;
  self->mStartTime = v4;
  self->mDelayTime = 0.0;
  return 1;
}

- (void)teardown
{
  id mPlugin;

  -[TSDMetalLayer stopAnimation](self->metalLayer, "stopAnimation");
  if (!self->mAnimationRanToCompletion)
    -[KPFMTLTransitionRenderer removeAnimations](self, "removeAnimations");
  mPlugin = self->mPlugin;
  self->mPlugin = 0;

  -[TSDMetalLayer tearDown](self->metalLayer, "tearDown");
}

- (void)removeAnimations
{
  void *v3;
  uint64_t v4;
  void *v5;
  id mPlugin;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSArray *mTextures;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  KPFMTLTransitionRenderer *v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalLayer superlayer](self->metalLayer, "superlayer"));

  if (v3)
  {
    -[TSDMetalLayer stopAnimation](self->metalLayer, "stopAnimation");
    -[TSDMetalLayer setPresentsWithTransaction:](self->metalLayer, "setPresentsWithTransaction:", 0);
    self->mIsRealtime = 0;
    self->_isAnimationBeingStopped = 1;
    v4 = objc_claimAutoreleasedReturnValue(-[KPFMTLTransitionRenderer plugin](self, "plugin"));
    v5 = (void *)v4;
    if (self->mWasPluginNotifiedOfAnimationStart
      && (objc_opt_respondsToSelector(v4, "animationDidEndWithContext:") & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6491C;
      block[3] = &unk_426D80;
      v18 = v5;
      v19 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    self->mWasPluginNotifiedOfAnimationStart = 0;
    mPlugin = self->mPlugin;
    self->mPlugin = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->mTextures;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "releaseSingleTexture", (_QWORD)v13);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      }
      while (v9);
    }

    mTextures = self->mTextures;
    if (mTextures)
    {
      self->mTextures = 0;

      -[TSDMetalLayer setDelegate:](self->metalLayer, "setDelegate:", 0);
      self->mAnimationRanToCompletion = 0;
    }

  }
}

- (void)registerForTransitionEndCallback:(SEL)a3 target:(id)a4
{
  self->mTransitionEndCallbackSelector = a3;
  objc_storeStrong(&self->mTransitionEndCallbackTarget, a4);
}

- (BOOL)shouldDrawFrameAtLayerTime:(double)a3
{
  if (self->mStartTime > a3)
    self->mForceRenderFirstFrame = 1;
  return !self->mAnimationRanToCompletion;
}

- (void)drawFrameAtLayerTime:(double)a3
{
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MTLCommandQueue *commandQueue;
  void *v18;
  MTLCommandQueue *v19;
  MTLCommandQueue *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  KNAnimationPluginContext *mContext;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  KNAnimationPluginContext *v46;
  _QWORD block[4];
  id v48;
  KPFMTLTransitionRenderer *v49;
  _QWORD v50[4];
  id v51;
  id location;
  _QWORD v53[4];
  id v54;

  if (self->mIsRealtime)
    v4 = a3;
  else
    v4 = 0.0;
  v5 = objc_claimAutoreleasedReturnValue(-[KPFMTLTransitionRenderer plugin](self, "plugin", a3));
  v6 = (void *)v5;
  if (!self->mWasPluginNotifiedOfAnimationStart
    && (objc_opt_respondsToSelector(v5, "animationWillBeginWithContext:") & 1) != 0)
  {
    -[KPFMTLTransitionRenderer setupPluginContext](self, "setupPluginContext");
    objc_msgSend(v6, "animationWillBeginWithContext:", self->mContext);
    self->mWasPluginNotifiedOfAnimationStart = 1;
  }
  -[TSDMetalLayer setDelegate:](self->metalLayer, "setDelegate:", self);
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalLayer nextDrawable](self->metalLayer, "nextDrawable"));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 358, CFSTR("invalid nil value for '%s'"), "drawable");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "texture"));
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 360, CFSTR("invalid nil value for '%s'"), "texture");

    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  self->mForceRenderFirstFrame = 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mInFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_isAnimationBeingStopped)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->mInFlightSemaphore);
    goto LABEL_14;
  }
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalLayer device](self->metalLayer, "device"));
    v19 = (MTLCommandQueue *)objc_msgSend(v18, "newCommandQueue");
    v20 = self->_commandQueue;
    self->_commandQueue = v19;

    commandQueue = self->_commandQueue;
    if (!commandQueue)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 374, CFSTR("invalid nil value for '%s'"), "_commandQueue");

      commandQueue = self->_commandQueue;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer"));
  if (!v16)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 377, CFSTR("invalid nil value for '%s'"), "commandBuffer");

  }
  v44 = v7;
  mContext = self->mContext;
  if (!mContext)
  {
    -[KPFMTLTransitionRenderer setupPluginContext](self, "setupPluginContext");
    mContext = self->mContext;
  }
  v46 = mContext;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationPluginContext metalContext](v46, "metalContext"));
  objc_msgSend(v28, "setCommandQueue:", self->_commandQueue);
  objc_msgSend(v28, "setCommandBuffer:", v16);
  objc_msgSend(v28, "setCurrentBuffer:", self->mCurrentBuffer);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTLRenderPassDescriptor renderPassDescriptor](MTLRenderPassDescriptor, "renderPassDescriptor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "colorAttachments"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v31, "setTexture:", v12);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "colorAttachments"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v33, "setLoadAction:", 2);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "colorAttachments"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v35, "setStoreAction:", 1);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "colorAttachments"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v37, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v28, "setPassDescriptor:", v29);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "renderCommandEncoderWithDescriptor:", v29));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "renderEncoder"));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"));
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, v41, 397, CFSTR("expected nil value for '%s'"), "metalContext.renderEncoder");

  }
  objc_msgSend(v28, "setRenderEncoder:", v45);
  v42 = (v4 - self->mStartTime) / self->mDuration;
  self->mPercent = v42;
  self->mPercent = TSUClamp(v42, 0.0, 1.0);
  -[KNAnimationPluginContext setPercent:](v46, "setPercent:");
  self->mAnimationRanToCompletion = self->mPercent >= 1.0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[KPFMTLTransitionRenderer plugin](self, "plugin"));
  objc_msgSend(v43, "renderFrameWithContext:", self->mContext);

  objc_msgSend(v45, "endEncoding");
  if (self->mIsRealtime)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_65074;
    v53[3] = &unk_428030;
    v54 = v8;
    objc_msgSend(v16, "addScheduledHandler:", v53);

  }
  objc_initWeak(&location, self->mInFlightSemaphore);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_6507C;
  v50[3] = &unk_428058;
  objc_copyWeak(&v51, &location);
  objc_msgSend(v16, "addCompletedHandler:", v50);
  v7 = v44;
  objc_msgSend(v16, "commit");
  self->mCurrentBuffer = (self->mCurrentBuffer + 1) % 3;
  self->mForceRenderFirstFrame = 0;
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

LABEL_15:
  if (self->mAnimationRanToCompletion)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_650A8;
    block[3] = &unk_426D80;
    v48 = v16;
    v49 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  objc_autoreleasePoolPop(v7);

}

- (KNAnimationContext)animationContext
{
  return self->mAnimationContext;
}

- (unint64_t)direction
{
  return self->mDirection;
}

- (void)setDirection:(unint64_t)a3
{
  self->mDirection = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCAKPFSession, 0);
  objc_storeStrong((id *)&self->mInFlightSemaphore, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong(&self->mTransitionEndCallbackTarget, 0);
  objc_storeStrong((id *)&self->mContext, 0);
  objc_storeStrong((id *)&self->mTextures, 0);
  objc_storeStrong((id *)&self->mAnimationContext, 0);
  objc_storeStrong((id *)&self->metalLayer, 0);
  objc_storeStrong((id *)&self->mSession, 0);
  objc_storeStrong((id *)&self->mEffect, 0);
  objc_storeStrong(&self->mPlugin, 0);
}

@end
