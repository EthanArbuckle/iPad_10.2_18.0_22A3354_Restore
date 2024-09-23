@implementation TKVibrationRecorderRippleView

- (TKVibrationRecorderRippleView)init
{
  return -[TKVibrationRecorderRippleView initWithStyleProvider:](self, "initWithStyleProvider:", 0);
}

- (TKVibrationRecorderRippleView)initWithStyleProvider:(id)a3
{
  id v5;
  TKVibrationRecorderRippleView *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKVibrationRecorderRippleView;
  v6 = -[TKVibrationRecorderRippleView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = v11;
    if (v7 && v8 && v9 && v10 && v11)
    {
      objc_storeStrong((id *)&v6->_reusableTouchContexts, v7);
      objc_storeStrong((id *)&v6->_recentTouchesContextQueue, v8);
      objc_storeStrong((id *)&v6->_ringLayersQueue, v9);
      objc_storeStrong((id *)&v6->_reusableRingLayers, v10);
      objc_storeStrong((id *)&v6->_ringLayersByIdentifiers, v12);
      objc_storeStrong((id *)&v6->_styleProvider, a3);
      objc_msgSend(v5, "vibrationRecorderRippleViewBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationRecorderRippleView setBackgroundColor:](v6, "setBackgroundColor:", v13);

      -[TKVibrationRecorderRippleView setOpaque:](v6, "setOpaque:", 1);
      -[TKVibrationRecorderRippleView setFingerStillSpeed:](v6, "setFingerStillSpeed:", 1.0);
      -[TKVibrationRecorderRippleView setFingerMovingSpeed:](v6, "setFingerMovingSpeed:", 1.0);
      -[TKVibrationRecorderRippleView setFirstRippleInitialRadius:](v6, "setFirstRippleInitialRadius:", 50.0);
      -[TKVibrationRecorderRippleView setFadeOutRadius:](v6, "setFadeOutRadius:", 100.0);
      -[TKVibrationRecorderRippleView setAccessibilityTraits:](v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73A8]);
      -[TKVibrationRecorderRippleView setIsAccessibilityElement:](v6, "setIsAccessibilityElement:", 1);
    }
    else
    {

      v6 = 0;
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TKVibrationRecorderRippleView _stopAnimation](self, "_stopAnimation");
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderRippleView;
  -[TKVibrationRecorderRippleView dealloc](&v3, sel_dealloc);
}

- (void)setFirstRippleInitialRadius:(double)a3
{
  if (self->_firstRippleInitialRadius != a3)
  {
    self->_firstRippleInitialRadius = a3;
    -[TKVibrationRecorderRippleView _updateRingEnlargementAnimation](self, "_updateRingEnlargementAnimation");
  }
}

- (void)setFadeOutRadius:(double)a3
{
  if (self->_fadeOutRadius != a3)
  {
    self->_fadeOutRadius = a3;
    -[TKVibrationRecorderRippleView _updateRingEnlargementAnimation](self, "_updateRingEnlargementAnimation");
    -[NSMutableArray removeAllObjects](self->_reusableRingLayers, "removeAllObjects");
  }
}

- (BOOL)_isTouchDown
{
  return self->_isTrackingTouch;
}

- (void)_refresh:(id)a3
{
  double x;
  double y;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  _BOOL4 isTrackingTouch;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t numberOfRipplesForCurrentTouch;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CGRect v46;
  CGRect v47;

  x = self->_currentTouchLocation.x;
  y = self->_currentTouchLocation.y;
  -[TKVibrationRecorderRippleView bounds](self, "bounds", a3);
  v6 = v46.origin.x;
  v7 = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  v10 = CGRectGetWidth(v46);
  v47.origin.x = v6;
  v47.origin.y = v7;
  v47.size.width = width;
  v47.size.height = height;
  v11 = CGRectGetHeight(v47);
  -[NSMutableArray count](self->_ringLayersQueue, "count");
  isTrackingTouch = self->_isTrackingTouch;
  if (self->_isTrackingTouch)
  {
    v45 = x;
    v13 = x / v10;
    v14 = y;
    v15 = y / v11;
    -[TKVibrationRecorderRippleView _currentSpeed](self, "_currentSpeed");
    v17 = v16;
    numberOfRipplesForCurrentTouch = self->_numberOfRipplesForCurrentTouch;
    if (!numberOfRipplesForCurrentTouch)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      -[TKVibrationRecorderRippleView _enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:](self, "_enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:", v19 - self->_currentTouchStartTime, v13, v15, v17);
      numberOfRipplesForCurrentTouch = 1;
    }
    -[NSMutableArray tk_lastEnqueuedObject](self->_ringLayersQueue, "tk_lastEnqueuedObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "normalizedRingLocation");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v20, "timeIntervalSinceCreation");
    v26 = v25;
    objc_msgSend(v20, "ringSpeed");
    v28 = v27;
    v29 = vcvtmd_u64_f64(v26 * v27);
    if (v29)
    {
      v30 = 0;
      v31 = v22 - v13;
      v32 = v24 - v15;
      v33 = numberOfRipplesForCurrentTouch + v29;
      v34 = 1 - numberOfRipplesForCurrentTouch;
      while (v29 != 1 || v34 != v30)
      {
        ++v30;
        -[TKVibrationRecorderRippleView _enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:](self, "_enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:", v26 - (double)v30 / v28, v13 + v31 * ((v26 - (double)v30 / v28) / v26), v15 + v32 * ((v26 - (double)v30 / v28) / v26), v17);
        if (v29 == v30)
        {
          numberOfRipplesForCurrentTouch = v33;
          goto LABEL_11;
        }
      }
      numberOfRipplesForCurrentTouch = 1;
    }
LABEL_11:
    x = v45;
    y = v14;
    self->_numberOfRipplesForCurrentTouch = numberOfRipplesForCurrentTouch;

  }
  v35 = -[NSMutableArray count](self->_recentTouchesContextQueue, "count");
  v36 = v35;
  if (isTrackingTouch || v35)
  {
    if (isTrackingTouch)
    {
      if (v35)
      {
        -[NSMutableArray tk_lastEnqueuedObject](self->_recentTouchesContextQueue, "tk_lastEnqueuedObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceCreation");
        v39 = v38;

        if (v39 <= 0.0)
        {
          do
          {
LABEL_19:
            if (isTrackingTouch && v36 <= 5)
            {
              -[NSMutableArray tk_nextDequeuedObject](self->_recentTouchesContextQueue, "tk_nextDequeuedObject");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "timeIntervalSinceCreation");
              v43 = v42;

              if (v43 <= 0.0)
                break;
            }
            -[NSMutableArray tk_dequeueObject](self->_recentTouchesContextQueue, "tk_dequeueObject");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
              -[TKVibrationRecorderRippleView _enqueueReusableTouchContextObject:](self, "_enqueueReusableTouchContextObject:", v44);
            --v36;
            self->_needsCurrentSpeedRefresh = 1;

          }
          while (v36);
          return;
        }
      }
      -[TKVibrationRecorderRippleView _reusableTouchContextObject](self, "_reusableTouchContextObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "configureWithTimeIntervalSinceCreation:location:", 0.0, x, y);
      -[NSMutableArray tk_enqueueObject:](self->_recentTouchesContextQueue, "tk_enqueueObject:", v40);
      ++v36;
      self->_needsCurrentSpeedRefresh = 1;

    }
    if (!v36)
      return;
    goto LABEL_19;
  }
}

- (double)_currentSpeed
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = 0x254DE1000;
  if (self->_needsCurrentSpeedRefresh)
  {
    v4 = -[NSMutableArray count](self->_recentTouchesContextQueue, "count");
    v5 = 0.0;
    if (v4 >= 2)
    {
      v6 = v4;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = self->_recentTouchesContextQueue;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = 0;
        v12 = *(_QWORD *)v29;
        v13 = (double)(((v6 - 1) * v6) >> 1);
        do
        {
          v14 = 0;
          v15 = v10;
          do
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v7);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
            if (v15)
            {
              objc_msgSend(v15, "location", (_QWORD)v28);
              v18 = v17;
              v20 = v19;
              objc_msgSend(v16, "location");
              v5 = v5 + TKPointGetDistanceToPoint(v18, v20, v21, v22) * ((double)(unint64_t)(v11 + v14) / v13);
            }
            v10 = v16;

            ++v14;
            v15 = v10;
          }
          while (v9 != v14);
          v11 += v9;
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
      }

      v3 = 0x254DE1000uLL;
    }
    v23 = 1.0;
    if (v5 < 12.8)
      v23 = v5 / 12.8;
    *(double *)((char *)&self->super.super.super.isa + *(int *)(v3 + 3584)) = v23;
    self->_needsCurrentSpeedRefresh = 0;
  }
  -[TKVibrationRecorderRippleView fingerStillSpeed](self, "fingerStillSpeed", (_QWORD)v28);
  v25 = v24;
  -[TKVibrationRecorderRippleView fingerMovingSpeed](self, "fingerMovingSpeed");
  return v25 + (v26 - v25) * *(double *)((char *)&self->super.super.super.isa + *(int *)(v3 + 3584));
}

- (id)_reusableTouchContextObject
{
  TKVibrationRecorderRippleTouchContext *v3;

  if (-[NSMutableArray count](self->_reusableTouchContexts, "count"))
  {
    -[NSMutableArray tk_dequeueObject](self->_reusableTouchContexts, "tk_dequeueObject");
    v3 = (TKVibrationRecorderRippleTouchContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(TKVibrationRecorderRippleTouchContext);
  }
  return v3;
}

- (void)_enqueueReusableTouchContextObject:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "reset");
    -[NSMutableArray tk_enqueueObject:](self->_reusableTouchContexts, "tk_enqueueObject:", v4);

  }
}

- (void)_startAnimation
{
  void *v3;
  NSCopying *v4;
  NSCopying *displayLinkManagerObserverToken;
  _QWORD v6[5];

  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__TKVibrationRecorderRippleView__startAnimation__block_invoke;
    v6[3] = &unk_24D380388;
    v6[4] = self;
    objc_msgSend(v3, "addObserverWithHandler:", v6);
    v4 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = v4;

  }
}

uint64_t __48__TKVibrationRecorderRippleView__startAnimation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refresh:", a2);
}

- (void)_stopAnimation
{
  void *v3;
  NSCopying *displayLinkManagerObserverToken;

  if (self->_isAnimating)
  {
    self->_isAnimating = 0;
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserverWithToken:", self->_displayLinkManagerObserverToken);

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;

  }
}

- (void)_enqueueRingLayerWithTimeIntervalSinceCreation:(double)a3 normalizedLocation:(CGPoint)a4 speed:(double)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  y = a4.y;
  x = a4.x;
  -[TKVibrationRecorderRippleView firstRippleInitialRadius](self, "firstRippleInitialRadius");
  v11 = v10;
  -[TKVibrationRecorderRippleView fadeOutRadius](self, "fadeOutRadius");
  v13 = (v12 / 0.84 - v11) / (a5 * 12.8);
  -[TKVibrationRecorderRippleView _reusableRingLayer](self, "_reusableRingLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configureWithTimeIntervalSinceCreation:normalizedRingLocation:ringSpeed:", a3, x, y, a5);
  ++self->_lastRingLayerIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_ringLayersByIdentifiers, "setObject:forKey:", v16, v14);
  -[NSMutableArray tk_enqueueObject:](self->_ringLayersQueue, "tk_enqueueObject:", v16);
  -[TKVibrationRecorderRippleView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSublayer:", v16);

  -[TKVibrationRecorderRippleView setNeedsLayout](self, "setNeedsLayout");
  -[CAAnimation setDelegate:](self->_ringEnlargementAnimation, "setDelegate:", self);
  -[CAAnimation setDuration:](self->_ringEnlargementAnimation, "setDuration:", v13);
  -[CAAnimation setBeginTime:](self->_ringEnlargementAnimation, "setBeginTime:", CACurrentMediaTime() - a3);
  -[CAAnimation setValue:forKey:](self->_ringEnlargementAnimation, "setValue:forKey:", v14, CFSTR("ring layer identifier"));
  objc_msgSend(v16, "addAnimation:forKey:", self->_ringEnlargementAnimation, CFSTR("ring enlargement animation"));
  -[CAAnimation setDelegate:](self->_ringEnlargementAnimation, "setDelegate:", 0);

}

- (id)_reusableRingLayer
{
  TKVibrationRecorderRippleRingLayer *v3;

  if (!-[NSMutableArray count](self->_reusableRingLayers, "count"))
  {
    v3 = objc_alloc_init(TKVibrationRecorderRippleRingLayer);
    -[TKVibrationRecorderRippleView _enqueueReusableRingLayer:](self, "_enqueueReusableRingLayer:", v3);

  }
  return -[NSMutableArray tk_dequeueObject](self->_reusableRingLayers, "tk_dequeueObject");
}

- (void)_enqueueReusableRingLayer:(id)a3
{
  double v4;
  id v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "reset");
    -[TKVibrationRecorderRippleView fadeOutRadius](self, "fadeOutRadius");
    objc_msgSend(v6, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), v4 + v4, v4 + v4);
    -[TKVibrationRecorderRippleView tintColor](self, "tintColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

    -[TKVibrationRecorderStyleProvider vibrationRecorderRippleRingLineWidth](self->_styleProvider, "vibrationRecorderRippleRingLineWidth");
    objc_msgSend(v6, "setLineWidth:");
    -[NSMutableArray tk_enqueueObject:](self->_reusableRingLayers, "tk_enqueueObject:", v6);

  }
}

- (void)_updateRingEnlargementAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  CAAnimation *v13;
  void *v14;
  CAAnimation *ringEnlargementAnimation;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  -[TKVibrationRecorderRippleView firstRippleInitialRadius](self, "firstRippleInitialRadius");
  v4 = v3;
  -[TKVibrationRecorderRippleView fadeOutRadius](self, "fadeOutRadius");
  if (v4 > 0.0)
  {
    v6 = v5;
    if (v5 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v5 - v4, v5 - v4, v4 + v4, v4 + v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), v6 + v6, v6 + v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x24BDE5648]);
      objc_msgSend(v9, "setKeyPath:", CFSTR("path"));
      v10 = objc_retainAutorelease(v7);
      objc_msgSend(v9, "setFromValue:", objc_msgSend(v10, "CGPath"));
      v11 = objc_retainAutorelease(v8);
      objc_msgSend(v9, "setToValue:", objc_msgSend(v11, "CGPath"));
      v12 = objc_alloc_init(MEMORY[0x24BDE5648]);
      objc_msgSend(v12, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v12, "setFromValue:", &unk_24D389868);
      objc_msgSend(v12, "setToValue:", &unk_24D389878);
      v13 = (CAAnimation *)objc_alloc_init(MEMORY[0x24BDE5638]);
      v16[0] = v9;
      v16[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setAnimations:](v13, "setAnimations:", v14);

      ringEnlargementAnimation = self->_ringEnlargementAnimation;
      self->_ringEnlargementAnimation = v13;

    }
  }
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)TKVibrationRecorderRippleView;
  -[TKVibrationRecorderRippleView layoutSubviews](&v21, sel_layoutSubviews);
  -[TKVibrationRecorderRippleView bounds](self, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v7 = CGRectGetHeight(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v8 = CGRectGetWidth(v25);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_ringLayersQueue;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "normalizedRingLocation", (_QWORD)v17);
        objc_msgSend(v14, "setPosition:", v8 * v15, v7 * v16);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "valueForKey:", CFSTR("ring layer identifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[NSMutableDictionary objectForKey:](self->_ringLayersByIdentifiers, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableArray removeObject:](self->_ringLayersQueue, "removeObject:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_ringLayersByIdentifiers, "removeObjectForKey:", v7);
      objc_msgSend(v6, "removeFromSuperlayer");
      -[TKVibrationRecorderRippleView _enqueueReusableRingLayer:](self, "_enqueueReusableRingLayer:", v6);
      if (!self->_isTrackingTouch && !-[NSMutableArray count](self->_ringLayersQueue, "count"))
        -[TKVibrationRecorderRippleView _stopAnimation](self, "_stopAnimation");
    }

    v5 = v7;
  }

}

- (void)_touchBeganAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_currentTouchStartTime = v6;
  self->_numberOfRipplesForCurrentTouch = 0;
  self->_isTrackingTouch = 1;
  self->_currentTouchLocation.x = x;
  self->_currentTouchLocation.y = y;
  -[TKVibrationRecorderRippleView _startAnimation](self, "_startAnimation");
}

- (void)_touchMovedToLocation:(CGPoint)a3
{
  self->_currentTouchLocation = a3;
}

- (void)_touchEndedAtLocation:(CGPoint)a3
{
  self->_isTrackingTouch = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:");

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:");

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:");

}

- (double)fingerStillSpeed
{
  return self->_fingerStillSpeed;
}

- (void)setFingerStillSpeed:(double)a3
{
  self->_fingerStillSpeed = a3;
}

- (double)fingerMovingSpeed
{
  return self->_fingerMovingSpeed;
}

- (void)setFingerMovingSpeed:(double)a3
{
  self->_fingerMovingSpeed = a3;
}

- (double)firstRippleInitialRadius
{
  return self->_firstRippleInitialRadius;
}

- (double)fadeOutRadius
{
  return self->_fadeOutRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringEnlargementAnimation, 0);
  objc_storeStrong((id *)&self->_ringLayersByIdentifiers, 0);
  objc_storeStrong((id *)&self->_reusableRingLayers, 0);
  objc_storeStrong((id *)&self->_ringLayersQueue, 0);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_reusableTouchContexts, 0);
  objc_storeStrong((id *)&self->_recentTouchesContextQueue, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
