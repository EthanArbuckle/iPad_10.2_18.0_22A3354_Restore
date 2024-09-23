@implementation KPFMTLBuildRenderer

- (KPFMTLBuildRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7
{
  KPFMTLBuildRenderer *v11;
  KPFMTLBuildRenderer *v12;
  KNAnimationContext *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)KPFMTLBuildRenderer;
  v11 = -[KPFMTLBuildRenderer init](&v22, "init", a5);
  v12 = v11;
  if (v11)
  {
    v11->mEffectClass = a3;
    v11->mDirection = a4;
    v11->mEffect = (KPFGingerEffect *)a6;
    v11->mSession = (KPFSession *)a7;
    v13 = [KNAnimationContext alloc];
    -[CALayer bounds](-[KPFSession showLayer](v12->mSession, "showLayer"), "bounds");
    v12->mAnimationContext = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v13, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", -[KPFSession showLayer](v12->mSession, "showLayer"), 1, v14, v15, 1.0);
    v12->mTextures = 0;
    v16 = objc_alloc((Class)TSDMetalLayer);
    -[CALayer bounds](-[KPFSession showLayer](v12->mSession, "showLayer"), "bounds");
    v12->mMetalLayer = (TSDMetalLayer *)objc_msgSend(v16, "initWithFrame:isOpaque:isWideGamut:delegate:metalDevice:", objc_msgSend(objc_msgSend(a6, "baseLayer"), "isOpaque"), 0, v12, objc_msgSend(a7, "metalDevice"), v17, v18, v19, v20);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KPFMTLBuildRenderer;
  -[KPFMTLBuildRenderer dealloc](&v3, "dealloc");
}

- (void)setupPluginContext
{
  KNAnimationPluginContext *mPluginContext;

  mPluginContext = self->mPluginContext;
  if (!mPluginContext)
  {
    mPluginContext = objc_alloc_init(KNAnimationPluginContext);
    self->mPluginContext = mPluginContext;
  }
  -[KNAnimationPluginContext setRendererType:](mPluginContext, "setRendererType:", 10);
  -[KNAnimatedBuild duration](-[KPFMTLBuildRenderer animatedBuild](self, "animatedBuild"), "duration");
  -[KNAnimationPluginContext setDuration:](mPluginContext, "setDuration:");
  -[KNAnimationPluginContext setDirection:](mPluginContext, "setDirection:", self->mDirection);
  -[KNAnimationPluginContext setAnimatedBuild:](mPluginContext, "setAnimatedBuild:", -[KPFMTLBuildRenderer animatedBuild](self, "animatedBuild"));
  -[KNAnimationPluginContext setTextures:](mPluginContext, "setTextures:", self->mTextures);
}

- (void)p_setupMetalContext
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;

  v3 = objc_opt_class(KNAnimationPluginContext);
  v4 = (void *)TSUCheckedDynamicCast(v3, -[KPFMTLBuildRenderer pluginContext](self, "pluginContext"));
  if (!objc_msgSend(v4, "metalContext"))
    objc_msgSend(v4, "setMetalContext:", objc_opt_new(TSDMetalContext, v5));
  v6 = objc_msgSend(v4, "metalContext");
  objc_msgSend(v6, "setDevice:", -[TSDMetalLayer device](self->mMetalLayer, "device"));
  objc_msgSend(v6, "setPixelFormat:", -[TSDMetalLayer pixelFormat](self->mMetalLayer, "pixelFormat"));
  -[KPFMTLBuildRenderer p_frameForTextures](self, "p_frameForTextures");
  objc_msgSend(v4, "setDrawableFrame:");
  -[TSDMetalLayer frame](self->mMetalLayer, "frame");
  objc_msgSend(v4, "setAnimationFrame:");
  -[TSDMetalLayer frame](self->mMetalLayer, "frame");
  objc_msgSend(v6, "setLayerSize:", v7, v8);
  objc_msgSend(v6, "setCommandQueue:", -[TSDMetalLayer commandQueue](self->mMetalLayer, "commandQueue"));
  -[TSDMetalLayer setDelegate:](self->mMetalLayer, "setDelegate:", self);
}

- (CGRect)p_frameForTextures
{
  double y;
  double x;
  double height;
  double width;
  NSArray *mTextures;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  mTextures = self->mTextures;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(mTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "frameOnCanvas");
        v13 = v12;
        v15 = v14;
        -[TSDMetalLayer frame](self->mMetalLayer, "frame");
        v35.origin.x = v16;
        v35.origin.y = v17;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v35.size.width = v13;
        v35.size.height = v15;
        v33 = CGRectUnion(v32, v35);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }
  v18 = -[KPFMTLBuildRenderer loadPluginIfNeeded](self, "loadPluginIfNeeded");
  -[KPFMTLBuildRenderer setupPluginContext](self, "setupPluginContext");
  v19 = objc_opt_class(KNAnimationPluginContext);
  *(_QWORD *)&v20 = TSUDynamicCast(v19, self->mPluginContext).n128_u64[0];
  v22 = v21;
  objc_msgSend(v21, "setAnimatedBuild:", self->mAnimatedBuild, v20);
  objc_msgSend(v18, "frameOfEffectWithFrame:context:", v22, x, y, width, height);
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)setupGraphicsLayerWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TSDMetalLayer *v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->mAnimatedBuild)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer setupGraphicsLayerWithFrame:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 119, CFSTR("invalid nil value for '%s'"), "mAnimatedBuild");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (!self->mMetalLayer)
  {
    v8 = -[KPFMTLBuildRenderer loadPluginIfNeeded](self, "loadPluginIfNeeded");
    -[KPFMTLBuildRenderer setupPluginContext](self, "setupPluginContext");
    v9 = objc_opt_class(KNAnimationPluginContext);
    *(_QWORD *)&v10 = TSUDynamicCast(v9, self->mPluginContext).n128_u64[0];
    v12 = v11;
    objc_msgSend(v11, "setAnimatedBuild:", self->mAnimatedBuild, v10);
    objc_msgSend(v8, "frameOfEffectWithFrame:context:", v12, x, y, width, height);
    v13 = v18.origin.x;
    v14 = v18.origin.y;
    v15 = v18.size.width;
    v16 = v18.size.height;
    if (!CGRectIsEmpty(v18))
    {
      v17 = -[KPFSession sharedMetalLayer](self->mSession, "sharedMetalLayer");
      self->mMetalLayer = v17;
      -[TSDMetalLayer setFrame:](v17, "setFrame:", v13, v14, v15, v16);
    }
    self->mStartTime = 0.0;
    self->mDelayTime = 0.0;
    self->mAnimationDidStart = 0;
    self->mForceRenderOfFirstFrame = 1;
    -[TSDMetalLayer displayAtCurrentLayerTime](self->mMetalLayer, "displayAtCurrentLayerTime");
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_initMetalLayerIfNeeded
{
  TSDMetalLayer *mMetalLayer;
  TSDMetalLayer *v4;
  double v5;

  mMetalLayer = self->mMetalLayer;
  if (!mMetalLayer)
  {
    v4 = -[KPFSession sharedMetalLayer](self->mSession, "sharedMetalLayer");
    self->mMetalLayer = v4;
    -[TSDMetalLayer displayAtCurrentLayerTime](v4, "displayAtCurrentLayerTime");
    -[TSDMetalLayer setDelegate:](self->mMetalLayer, "setDelegate:", self);
    -[CALayer bounds](-[KPFSession showLayer](self->mSession, "showLayer"), "bounds");
    -[TSDMetalLayer setBounds:](self->mMetalLayer, "setBounds:");
    -[CALayer addSublayer:](-[KPFSession showLayer](self->mSession, "showLayer"), "addSublayer:", self->mMetalLayer);
    mMetalLayer = self->mMetalLayer;
  }
  -[TSDMetalLayer setHidden:](mMetalLayer, "setHidden:", 0);
  LODWORD(v5) = 1.0;
  -[TSDMetalLayer setOpacity:](self->mMetalLayer, "setOpacity:", v5);
  if (!self->mMetalLayer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer p_initMetalLayerIfNeeded]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 158, CFSTR("invalid nil value for '%s'"), "mMetalLayer");
}

- (void)prepareAnimations
{
  NSArray *mTextures;
  id v4;
  id v5;
  uint64_t v6;
  CGFloat height;
  void *i;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double x;
  double v16;
  double width;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double MidX;
  double v26;
  double v27;
  double v28;
  CGFloat r1;
  CGFloat y;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (!self->mAreAnimationsPrepared)
  {
    -[KPFMTLBuildRenderer loadPluginIfNeeded](self, "loadPluginIfNeeded");
    -[KPFMTLBuildRenderer p_generateTextures](self, "p_generateTextures");
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[KPFMTLBuildRenderer p_setupMetalContext](self, "p_setupMetalContext");
    if (-[NSArray count](self->mTextures, "count"))
    {
      self->mAreAnimationsPrepared = 1;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      mTextures = self->mTextures;
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v32;
        y = CGRectNull.origin.y;
        height = CGRectNull.size.height;
        r1 = CGRectNull.size.width;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v6)
              objc_enumerationMutation(mTextures);
            v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            -[CALayer frame](-[KPFGingerEffect layer](self->mEffect, "layer"), "frame");
            v11 = v10;
            v13 = v12;
            v40.origin.x = TSDAddPoints(-[CALayer frame](-[KPFGingerEffect baseLayer](self->mEffect, "baseLayer"), "frame"));
            v40.origin.y = v14;
            v36.origin.y = y;
            v36.origin.x = CGRectNull.origin.x;
            v36.size.width = r1;
            v36.size.height = height;
            v40.size.width = v11;
            v40.size.height = v13;
            v37 = CGRectUnion(v36, v40);
            x = v37.origin.x;
            v16 = v37.origin.y;
            width = v37.size.width;
            v18 = v37.size.height;
            objc_msgSend(v9, "frame");
            v20 = x + v19;
            objc_msgSend(v9, "frame");
            v21 = v16 + CGRectGetMaxY(v38);
            objc_msgSend(v9, "frame");
            v23 = v22;
            objc_msgSend(v9, "frame");
            objc_msgSend(v9, "setFrameOnCanvas:", v20, v21, v23);
            -[KPFMTLBuildRenderer setupGraphicsLayerWithFrame:](self, "setupGraphicsLayerWithFrame:", x, v16, width, v18);
            -[CALayer addSublayer:](-[KPFSession showLayer](self->mSession, "showLayer"), "addSublayer:", self->mMetalLayer);
          }
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v5);
      }
    }
    v24 = -[NSArray objectAtIndex:](self->mTextures, "objectAtIndex:", 0);
    if (-[KNAnimatedBuild isBuildOut](-[KNAnimationPluginContext animatedBuild](self->mPluginContext, "animatedBuild"), "isBuildOut"))
    {
      objc_msgSend(v24, "frameOnCanvas");
      MidX = CGRectGetMidX(v39);
      objc_msgSend(v24, "frameOnCanvas");
      v27 = v26;
      objc_msgSend(v24, "frameOnCanvas");
      objc_msgSend(objc_msgSend(v24, "layer"), "setPosition:", MidX, v27 + v28 * -0.5);
      self->mTextureLayer = (CALayer *)objc_msgSend(v24, "layer");
      objc_msgSend(-[TSDMetalLayer superlayer](self->mMetalLayer, "superlayer"), "insertSublayer:above:", objc_msgSend(v24, "layer"), self->mMetalLayer);
    }
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (id)loadPluginIfNeeded
{
  id result;

  result = self->mPlugin;
  if (!result)
  {
    result = objc_msgSend(objc_alloc(self->mEffectClass), "initWithAnimationContext:", self->mAnimationContext);
    self->mPlugin = result;
  }
  return result;
}

- (void)p_generateTextures
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", -[KPFSession CGImageForTextureName:](self->mSession, "CGImageForTextureName:", -[KPFGingerEffect textureToBeAnimated](self->mEffect, "textureToBeAnimated")));
  self->mTextures = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1);
}

- (void)renderTextures
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSArray copy](self->mTextures, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setupMetalTextureForDevice:", -[TSDMetalContext device](-[KNAnimationPluginContext metalContext](self->mPluginContext, "metalContext"), "device"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (BOOL)addAnimationsAtLayerTime:(double)a3
{
  if (!self->mAreAnimationsPrepared)
  {
    -[KPFMTLBuildRenderer prepareAnimations](self, "prepareAnimations");
    self->mForceRenderOfFirstFrame = 0;
  }
  if (-[NSArray count](self->mTextures, "count"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer setHidden:](-[KPFGingerEffect layer](self->mEffect, "layer"), "setHidden:", 1);
    self->mStartTime = a3;
    self->mDelayTime = 0.0;
    self->mAnimationDidStart = 1;
    +[CATransaction commit](CATransaction, "commit");
  }
  return -[NSArray count](self->mTextures, "count") != 0;
}

- (BOOL)shouldDrawFrameAtLayerTime:(double)a3
{
  return 1;
}

- (void)drawFrameAtLayerTime:(double)mNonRealtimeLayerTime
{
  id mPlugin;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  MTLCommandQueue *commandQueue;
  id v12;
  KNAnimationPluginContext *mPluginContext;
  double v14;
  double v15;
  double v16;
  TSDMetalContext *v17;
  MTLRenderPassDescriptor *v18;
  id v19;
  void *v20;
  _QWORD block[5];
  _QWORD v22[5];

  -[TSDMetalLayer setBackgroundColor:](self->mMetalLayer, "setBackgroundColor:", 0);
  if (!self->mPlugin)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 261, CFSTR("invalid nil value for '%s'"), "mPlugin");
  if (!self->mAnimatedBuild)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 262, CFSTR("invalid nil value for '%s'"), "mAnimatedBuild");
  if (!self->mAreAnimationsPrepared)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 263, CFSTR("Animations have not been prepared"));
  if (!self->mIsRealtime)
    mNonRealtimeLayerTime = self->mNonRealtimeLayerTime;
  if (!self->mWasPluginNotifiedOfAnimationStart)
  {
    mPlugin = self->mPlugin;
    if ((objc_opt_respondsToSelector(mPlugin, "animationWillBeginWithContext:") & 1) != 0)
    {
      -[KPFMTLBuildRenderer setupPluginContext](self, "setupPluginContext");
      -[KPFMTLBuildRenderer p_setupMetalContext](self, "p_setupMetalContext");
      objc_msgSend(mPlugin, "animationWillBeginWithContext:", self->mPluginContext);
      self->mWasPluginNotifiedOfAnimationStart = 1;
    }
  }
  if (self->mForceRenderOfFirstFrame && !self->mAnimationDidStart)
    mNonRealtimeLayerTime = 0.0;
  v6 = objc_autoreleasePoolPush();
  v7 = -[TSDMetalLayer nextDrawable](self->mMetalLayer, "nextDrawable");
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 287, CFSTR("invalid nil value for '%s'"), "drawable");
    if (objc_msgSend(0, "texture"))
      goto LABEL_37;
LABEL_21:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 289, CFSTR("invalid nil value for '%s'"), "texture");
    goto LABEL_37;
  }
  v9 = objc_msgSend(v7, "texture");
  if (!v9)
    goto LABEL_21;
  v10 = v9;
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    commandQueue = (MTLCommandQueue *)objc_msgSend(-[TSDMetalLayer device](self->mMetalLayer, "device"), "newCommandQueue");
    if (commandQueue)
    {
      self->_commandQueue = commandQueue;
    }
    else
    {
      commandQueue = (MTLCommandQueue *)-[TSDMetalLayer commandQueue](self->mMetalLayer, "commandQueue");
      self->_commandQueue = commandQueue;
      if (!commandQueue)
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 295, CFSTR("invalid nil value for '%s'"), "_commandQueue");
        commandQueue = self->_commandQueue;
      }
    }
  }
  v12 = -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  if (!v12)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 297, CFSTR("invalid nil value for '%s'"), "commandBuffer");
  self->mForceRenderOfFirstFrame = 0;
  mPluginContext = self->mPluginContext;
  if (!mPluginContext)
  {
    -[KPFMTLBuildRenderer setupPluginContext](self, "setupPluginContext");
    mPluginContext = self->mPluginContext;
  }
  v14 = mNonRealtimeLayerTime - self->mStartTime - self->mDelayTime;
  -[KNAnimationPluginContext duration](mPluginContext, "duration");
  v16 = TSUClamp(v14 / v15, 0.0, 1.0);
  self->mAnimationRanToCompletion = v16 >= 1.0;
  v17 = -[KNAnimationPluginContext metalContext](self->mPluginContext, "metalContext");
  -[TSDMetalContext setCommandQueue:](v17, "setCommandQueue:", self->_commandQueue);
  -[TSDMetalContext setCommandBuffer:](v17, "setCommandBuffer:", v12);
  -[TSDMetalContext setCurrentBuffer:](v17, "setCurrentBuffer:", self->mCurrentBuffer);
  v18 = +[MTLRenderPassDescriptor renderPassDescriptor](MTLRenderPassDescriptor, "renderPassDescriptor");
  -[MTLRenderPassColorAttachmentDescriptor setTexture:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v18, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v10);
  -[MTLRenderPassColorAttachmentDescriptor setLoadAction:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v18, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
  -[MTLRenderPassColorAttachmentDescriptor setStoreAction:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v18, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 1);
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v18, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  -[TSDMetalContext setPassDescriptor:](v17, "setPassDescriptor:", v18);
  v19 = objc_msgSend(v12, "renderCommandEncoderWithDescriptor:", v18);
  if (-[TSDMetalContext renderEncoder](v17, "renderEncoder"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 322, CFSTR("expected nil value for '%s'"), "metalContext.renderEncoder");
  -[TSDMetalContext setRenderEncoder:](v17, "setRenderEncoder:", v19);
  -[KNAnimationPluginContext setPercent:](self->mPluginContext, "setPercent:", v16);
  objc_msgSend(self->mPlugin, "renderFrameWithContext:", self->mPluginContext);
  objc_msgSend(v19, "endEncoding");
  if (self->mIsRealtime)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_101C00;
    v22[3] = &unk_429A18;
    v22[4] = v8;
    objc_msgSend(v12, "addScheduledHandler:", v22);
  }
  objc_msgSend(v12, "commit");
  if (self->mTextureLayer)
  {
    objc_msgSend(v12, "waitUntilCompleted");
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread](NSThread, "isMainThread") ^ 1);
    -[CALayer removeFromSuperlayer](self->mTextureLayer, "removeFromSuperlayer");
    self->mTextureLayer = 0;
    +[CATransaction commit](CATransaction, "commit");
  }
  if (self->mAnimationRanToCompletion)
  {
    v20 = objc_autoreleasePoolPush();
    -[KPFMTLBuildRenderer removeAnimationsAndFinish:](self, "removeAnimationsAndFinish:", 1);
    objc_autoreleasePoolPop(v20);
    self->mAnimationRanToCompletion = 1;
    if (self->mBuildEndCallbackTarget)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_101C08;
      block[3] = &unk_426DD0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
LABEL_37:
  objc_autoreleasePoolPop(v6);
}

- (void)animateAfterDelay:(double)a3
{
  _QWORD v5[6];

  if (!self->mTextures)
  {
    -[KPFMTLBuildRenderer p_initMetalLayerIfNeeded](self, "p_initMetalLayerIfNeeded");
    -[KPFMTLBuildRenderer setupPluginContext](self, "setupPluginContext");
    -[KPFMTLBuildRenderer prepareAnimations](self, "prepareAnimations");
    -[TSDMetalLayer setDelegate:](self->mMetalLayer, "setDelegate:", self);
    -[KPFMTLBuildRenderer renderTextures](self, "renderTextures");
  }
  if (-[KPFMTLBuildRenderer addAnimationsAtLayerTime:](self, "addAnimationsAtLayerTime:", CACurrentMediaTime() + a3))
  {
    self->mIsRealtime = 1;
    -[TSDMetalLayer startAnimation](self->mMetalLayer, "startAnimation");
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_101CF0;
    v5[3] = &unk_427240;
    v5[4] = self;
    *(double *)&v5[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)updateAnimationsForLayerTime:(double)a3
{
  self->mNonRealtimeLayerTime = a3;
  -[TSDMetalLayer displayAtCurrentLayerTime](self->mMetalLayer, "displayAtCurrentLayerTime");
}

- (void)replaceMetalLayerWithProxy
{
  id v3;
  double MidX;
  double v5;
  double v6;
  double v7;
  CGRect v8;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = -[NSArray objectAtIndex:](self->mTextures, "objectAtIndex:", 0);
  objc_msgSend(v3, "frameOnCanvas");
  MidX = CGRectGetMidX(v8);
  objc_msgSend(v3, "frameOnCanvas");
  v6 = v5;
  objc_msgSend(v3, "frameOnCanvas");
  objc_msgSend(objc_msgSend(v3, "layer"), "setPosition:", MidX, v6 + v7 * -0.5);
  objc_msgSend(-[TSDMetalLayer superlayer](self->mMetalLayer, "superlayer"), "insertSublayer:above:", objc_msgSend(v3, "layer"), self->mMetalLayer);
  -[TSDMetalLayer removeFromSuperlayer](self->mMetalLayer, "removeFromSuperlayer");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)teardown
{
  -[TSDMetalLayer setDelegate:](self->mMetalLayer, "setDelegate:", 0);
  -[TSDMetalLayer tearDown](self->mMetalLayer, "tearDown");
}

- (void)removeAnimationsAndFinish:(BOOL)a3
{
  TSDMetalLayer *mMetalLayer;
  double v5;
  NSArray *mTextures;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (a3)
    self->mAnimationRanToCompletion = 1;
  mMetalLayer = self->mMetalLayer;
  if (mMetalLayer && -[TSDMetalLayer superlayer](mMetalLayer, "superlayer"))
  {
    if (!self->mPlugin)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer removeAnimationsAndFinish:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 430, CFSTR("invalid nil value for '%s'"), "mPlugin");
    if (!self->mAnimatedBuild)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer removeAnimationsAndFinish:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"), 431, CFSTR("invalid nil value for '%s'"), "mAnimatedBuild");
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[TSDMetalLayer setHidden:](self->mMetalLayer, "setHidden:", 1);
    LODWORD(v5) = 0;
    -[TSDMetalLayer setOpacity:](self->mMetalLayer, "setOpacity:", v5);
    -[TSDMetalLayer stopAnimation](self->mMetalLayer, "stopAnimation");
    self->mIsRealtime = 0;
    self->mNonRealtimeLayerTime = 0.0;
    if (-[KNAnimatedBuild isBuildIn](-[KNAnimationPluginContext animatedBuild](self->mPluginContext, "animatedBuild"), "isBuildIn"))
    {
      -[KPFMTLBuildRenderer replaceMetalLayerWithProxy](self, "replaceMetalLayerWithProxy");
    }
    +[CATransaction commit](CATransaction, "commit");
    if (self->mWasPluginNotifiedOfAnimationStart
      && (objc_opt_respondsToSelector(self->mPlugin, "animationDidEndWithContext:") & 1) != 0)
    {
      objc_msgSend(self->mPlugin, "animationDidEndWithContext:", self->mPluginContext);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    mTextures = self->mTextures;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(mTextures);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "releaseSingleTexture");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    self->mPlugin = 0;
    self->mTextures = 0;
    -[TSDMetalLayer tearDown](self->mMetalLayer, "tearDown");
    -[TSDMetalLayer setDelegate:](self->mMetalLayer, "setDelegate:", 0);
    *(_WORD *)&self->mAreAnimationsPrepared = 0;
    *(_WORD *)&self->mAnimationRanToCompletion = 0;
  }
}

- (void)stopAnimations
{
  -[KPFMTLBuildRenderer removeAnimationsAndFinish:](self, "removeAnimationsAndFinish:", 0);
}

- (void)registerForBuildEndCallback:(SEL)a3 target:(id)a4
{
  self->mBuildEndCallbackTarget = a4;
  self->mBuildEndCallbackSelector = a3;
}

- (void)displayMaskDidChange
{
  id v3;
  void *v4;
  NSArray *mTextures;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[KPFMTLBuildRenderer loadPluginIfNeeded](self, "loadPluginIfNeeded");
  if (self->mWasPluginNotifiedOfAnimationStart)
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector(v3, "animationDidEndWithContext:") & 1) != 0)
    {
      objc_msgSend(v4, "animationDidEndWithContext:", self->mPluginContext);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      mTextures = self->mTextures;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(mTextures);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "releaseSingleTexture");
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }
      self->mWasPluginNotifiedOfAnimationStart = 0;
    }
  }
}

- (KNAnimationPluginContext)pluginContext
{
  return self->mPluginContext;
}

- (KNAnimatedBuild)animatedBuild
{
  return self->mAnimatedBuild;
}

- (void)setAnimatedBuild:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

@end
