@implementation BKDisplayBootUIRenderOverlay

- (BKDisplayBootUIRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  BKDisplayBootUIRenderOverlay *v12;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  BKDisplayBootUIRenderOverlay *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;

  v7 = a3;
  if (!v7)
  {
    v14 = (objc_class *)objc_opt_class(BKSDisplayRenderOverlayDescriptor, v8);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("descriptor"), v16));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v21 = (objc_class *)objc_opt_class(self, v20);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138544642;
      v41 = v19;
      v42 = 2114;
      v43 = v23;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKDisplayBootUIRenderOverlay.m");
      v48 = 1024;
      v49 = 35;
      v50 = 2114;
      v51 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002BC14);
  }
  v9 = v7;
  v10 = objc_opt_class(BKSDisplayRenderOverlayDescriptor, v8);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v24 = (objc_class *)objc_msgSend(v9, "classForCoder");
    if (!v24)
      v24 = (objc_class *)objc_opt_class(v9, v25);
    v26 = NSStringFromClass(v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v29 = (objc_class *)objc_opt_class(BKSDisplayRenderOverlayDescriptor, v28);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("descriptor"), v27, v31));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v36 = (objc_class *)objc_opt_class(self, v35);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138544642;
      v41 = v34;
      v42 = 2114;
      v43 = v38;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKDisplayBootUIRenderOverlay.m");
      v48 = 1024;
      v49 = 35;
      v50 = 2114;
      v51 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002BD50);
  }

  v39.receiver = self;
  v39.super_class = (Class)BKDisplayBootUIRenderOverlay;
  *(float *)&v11 = a4;
  v12 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v39, "initWithOverlayDescriptor:level:", v9, v11);
  if (v12)
    v12->_lightBackground = MGGetSInt32Answer(CFSTR("DeviceColorMapPolicy"), 0) == 1;

  return v12;
}

- (BOOL)_useLightBackground
{
  return self->_lightBackground;
}

- (CGRect)_bounds
{
  void *v2;
  void *v3;
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
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "display"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  LODWORD(v3) = objc_msgSend(v12, "deviceClass");

  if ((_DWORD)v3 == 3 && (v9 < 1920.0 || v11 < 1080.0))
  {
    v5 = 0.0;
    v11 = 1080.0;
    v9 = 1920.0;
    v7 = 0.0;
  }
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a3.size.width * 0.5;
  v9 = a3.size.height * 0.5;
  v10 = sub_1000597D0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218240;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "midBounds:%g,%g", (uint8_t *)&v14, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  objc_msgSend(v12, "setBounds:", x, y, width, height);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  objc_msgSend(v13, "setPosition:", v8, v9);

  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:", x, y, width, height);
  -[CALayer setPosition:](self->_backgroundLayer, "setPosition:", v8, v9);
  -[CALayer setPosition:](self->_contentLayer, "setPosition:", v8, v9);
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CALayer *v10;
  CALayer *contentLayer;
  void *v12;
  CAContext *v13;
  CAContext *context;
  CAContext *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CALayer *v27;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v29;
  const CGFloat *v30;
  CGColorRef v31;
  CGColorRef v32;
  CALayer *backgroundLayer;
  CALayer *v34;
  void *v36;
  NSString *v37;
  BKDisplayBootUIRenderOverlay *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  NSString *v44;
  BKDisplayBootUIRenderOverlay *v45;
  uint64_t v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  NSString *v51;
  BKDisplayBootUIRenderOverlay *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  int v57;
  BKDisplayBootUIRenderOverlay *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  BKDisplayBootUIRenderOverlay *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;

  v5 = a3;
  v6 = sub_1000597D0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v57 = 134217984;
    v58 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%p present", (uint8_t *)&v57, 0xCu);
  }

  if (self->_context)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Already have a context")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      v38 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v37);
      v40 = (objc_class *)objc_opt_class(self, v39);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v57 = 138544642;
      v58 = v38;
      v59 = 2114;
      v60 = v42;
      v61 = 2048;
      v62 = self;
      v63 = 2114;
      v64 = CFSTR("BKDisplayBootUIRenderOverlay.m");
      v65 = 1024;
      v66 = 89;
      v67 = 2114;
      v68 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v57, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002C3B8);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "display"));
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, 0);

  v10 = (CALayer *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay _prepareContentLayerForPresentation:](self, "_prepareContentLayerForPresentation:", v5));
  contentLayer = self->_contentLayer;
  self->_contentLayer = v10;

  if (!self->_contentLayer)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Content layer not set")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v44 = NSStringFromSelector(a2);
      v45 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v44);
      v47 = (objc_class *)objc_opt_class(self, v46);
      v48 = NSStringFromClass(v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      v57 = 138544642;
      v58 = v45;
      v59 = 2114;
      v60 = v49;
      v61 = 2048;
      v62 = self;
      v63 = 2114;
      v64 = CFSTR("BKDisplayBootUIRenderOverlay.m");
      v65 = 1024;
      v66 = 94;
      v67 = 2114;
      v68 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v57, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v43), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002C4A4);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v12, "setObject:forKey:", kCFBooleanTrue, kCAContextDisplayable);
  objc_msgSend(v12, "setObject:forKey:", kCFBooleanTrue, kCAContextSecure);
  v13 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v12));
  context = self->_context;
  self->_context = v13;

  v15 = self->_context;
  if (!v15)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't create remote context")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      v52 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue(v51);
      v54 = (objc_class *)objc_opt_class(self, v53);
      v55 = NSStringFromClass(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      v57 = 138544642;
      v58 = v52;
      v59 = 2114;
      v60 = v56;
      v61 = 2048;
      v62 = self;
      v63 = 2114;
      v64 = CFSTR("BKDisplayBootUIRenderOverlay.m");
      v65 = 1024;
      v66 = 101;
      v67 = 2114;
      v68 = v50;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v57, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v50), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002C590);
  }
  -[BKDisplayRenderOverlay level](self, "level");
  -[CAContext setLevel:](v15, "setLevel:");
  -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v20 * 0.5;
  v25 = v22 * 0.5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v26, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v26, "setPosition:", v24, v25);
  -[CAContext setLayer:](self->_context, "setLayer:", v26);
  v27 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[CALayer setBounds:](v27, "setBounds:", v17, v19, v21, v23);
  -[CALayer setPosition:](v27, "setPosition:", v24, v25);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v29 = DeviceRGB;
    if (-[BKDisplayBootUIRenderOverlay _useLightBackground](self, "_useLightBackground"))
      v30 = (const CGFloat *)&unk_100115850;
    else
      v30 = (const CGFloat *)&unk_100115870;
    v31 = CGColorCreate(v29, v30);
    if (v31)
    {
      v32 = v31;
      -[CALayer setBackgroundColor:](v27, "setBackgroundColor:", v31);
      CFRelease(v32);
    }
    CFRelease(v29);
  }
  objc_msgSend(v26, "addSublayer:", v27);
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = v27;
  v34 = v27;

  objc_msgSend(v26, "addSublayer:", self->_contentLayer);
  return 1;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  CALayer *contentLayer;
  void *v10;
  void *v11;
  double v12;
  CALayer *backgroundLayer;
  void *v14;
  int v15;
  BKDisplayBootUIRenderOverlay *v16;

  v4 = a3;
  v5 = sub_1000597D0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134217984;
    v16 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%p dismiss", (uint8_t *)&v15, 0xCu);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay _animationForContentLayerCrossfading:](self, "_animationForContentLayerCrossfading:", v4));
    LODWORD(v8) = 0;
    -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v8);
    contentLayer = self->_contentLayer;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyPath"));
    -[CALayer addAnimation:forKey:](contentLayer, "addAnimation:forKey:", v7, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay _animationForBackgroundLayerCrossfading:](self, "_animationForBackgroundLayerCrossfading:", v4));
    LODWORD(v12) = 0;
    -[CALayer setOpacity:](self->_backgroundLayer, "setOpacity:", v12);
    backgroundLayer = self->_backgroundLayer;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keyPath"));
    -[CALayer addAnimation:forKey:](backgroundLayer, "addAnimation:forKey:", v11, v14);

    self->_outstandingAnimationsCount += 2;
  }
  else
  {
    -[BKDisplayBootUIRenderOverlay _cleanup](self, "_cleanup");
  }

}

- (void)_cleanup
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  CAContext *context;
  CAContext *v8;
  CALayer *backgroundLayer;
  int v10;
  BKDisplayBootUIRenderOverlay *v11;
  __int16 v12;
  CAContext *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "display"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  -[BKDisplayBootUIRenderOverlay _cleanUpContentLayer](self, "_cleanUpContentLayer");
  -[CALayer removeAllAnimations](self->_backgroundLayer, "removeAllAnimations");
  v5 = sub_1000597D0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = context;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up %@ - Destroying context: %@", (uint8_t *)&v10, 0x16u);
  }

  -[CAContext setLayer:](self->_context, "setLayer:", 0);
  -[CAContext invalidate](self->_context, "invalidate");
  v8 = self->_context;
  self->_context = 0;

  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = 0;

}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  return self->_contentLayer;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  unint64_t outstandingAnimationsCount;
  unint64_t v7;
  id v8;

  v5 = a3;
  outstandingAnimationsCount = self->_outstandingAnimationsCount;
  if (outstandingAnimationsCount)
  {
    v7 = outstandingAnimationsCount - 1;
    self->_outstandingAnimationsCount = v7;
    if (!v7)
    {
      v8 = v5;
      -[BKDisplayBootUIRenderOverlay _cleanup](self, "_cleanup");
      v5 = v8;
    }
  }

}

- (id)_animationForContentLayerCrossfading:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "duration");
  v7 = v6;

  objc_msgSend(v5, "setDuration:", v7 * 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v5, "applyToCAAnimation:", v8);
  objc_msgSend(v8, "setFromValue:", &off_1000F7600);
  objc_msgSend(v8, "setToValue:", &off_1000F7610);
  objc_msgSend(v8, "setDelegate:", self);

  return v8;
}

- (id)_animationForBackgroundLayerCrossfading:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay _animationForContentLayerCrossfading:](self, "_animationForContentLayerCrossfading:", a3));
  objc_msgSend(v3, "setBeginTimeMode:", kCAAnimationRelative);
  objc_msgSend(v3, "duration");
  objc_msgSend(v3, "setBeginTime:");
  objc_msgSend(v3, "setFillMode:", kCAFillModeBoth);
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  CAContext *context;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKDisplayBootUIRenderOverlay;
  v4 = -[BKDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:](&v10, "descriptionBuilderWithMultilinePrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  context = self->_context;
  if (context)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%x (%u)"), -[CAContext contextId](context, "contextId"), -[CAContext contextId](self->_context, "contextId")));
    v8 = objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("contextID"));

  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  BKDisplayBootUIRenderOverlay *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bounds"), a4, a5, a6))
  {
    -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
    v8 = v7;
    v10 = v9;
    -[BKDisplayBootUIRenderOverlay _setBounds:](self, "_setBounds:");
    v11 = sub_1000597D0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218496;
      v14 = self;
      v15 = 2048;
      v16 = v10;
      v17 = 2048;
      v18 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "-----------> %p: bounds of display changed: size.width: %f size.height: %f, updating overlay position", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end
