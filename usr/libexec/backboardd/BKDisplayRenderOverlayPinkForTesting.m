@implementation BKDisplayRenderOverlayPinkForTesting

- (BKDisplayRenderOverlayPinkForTesting)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  BKDisplayRenderOverlayPinkForTesting *v4;
  BKDisplayRenderOverlayPinkForTesting *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
  v4 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4)
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 4);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CAContext invalidate](self->_context, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
  -[BKDisplayRenderOverlay dealloc](&v3, "dealloc");
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5;
  void *v6;
  CAContext *v7;
  CAContext *context;
  CAContext *v9;
  CALayer *v10;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v12;
  CGColorRef v13;
  CGColorRef v14;
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
  CALayer *layer;
  CALayer *v26;
  void *v28;
  void *v29;
  double v30;
  _QWORD v31[10];

  v5 = a3;
  if (self->_context)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKDisplayRenderOverlayPinkForTesting.m"), 57, CFSTR("Already have a _context"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v6, "setObject:forKey:", kCFBooleanTrue, kCAContextDisplayable);
  objc_msgSend(v6, "setObject:forKey:", kCFBooleanTrue, kCAContextSecure);
  v30 = 1.0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000FBA8;
  v31[3] = &unk_1000EA5A0;
  v31[4] = 0;
  v31[5] = 0;
  v31[6] = &v30;
  memset(&v31[7], 0, 24);
  sub_10000FA60(v31);
  v7 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v6));
  context = self->_context;
  self->_context = v7;

  v9 = self->_context;
  if (!v9)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKDisplayRenderOverlayPinkForTesting.m"), 67, CFSTR("Couldn't create remote context"));

    v9 = self->_context;
  }
  -[BKDisplayRenderOverlay level](self, "level");
  -[CAContext setLevel:](v9, "setLevel:");
  v10 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v12 = DeviceRGB;
    v13 = CGColorCreate(DeviceRGB, dbl_100116448);
    if (v13)
    {
      v14 = v13;
      -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", v13);
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "display"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[CALayer setBounds:](v10, "setBounds:", v18, v20, v22, v24);
  -[CALayer setContentsScale:](v10, "setContentsScale:", v30);
  -[CALayer setHidden:](v10, "setHidden:", 0);
  -[CALayer setPosition:](v10, "setPosition:", v22 * 0.5, v24 * 0.5);
  layer = self->_layer;
  self->_layer = v10;
  v26 = v10;

  -[CAContext setLayer:](self->_context, "setLayer:", self->_layer);
  return 1;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  CAContext *context;
  CALayer *layer;

  -[CAContext setLayer:](self->_context, "setLayer:", 0);
  -[CAContext invalidate](self->_context, "invalidate");
  context = self->_context;
  self->_context = 0;

  layer = self->_layer;
  self->_layer = 0;

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
  v10.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
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

- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  BOOL v15;
  double v16;
  double v17;
  unsigned int v18;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  int v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  unsigned int v31;
  double v32;
  double v33;
  double v34;
  _DWORD v35[2];
  __int128 v36;
  __int128 v37;
  int v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progressIndicatorProperties"));

  if (v4)
  {
    v38 = 0;
    v37 = 0u;
    v36 = 0u;
    if (objc_msgSend(v4, "style") == (id)2)
      v5 = 22;
    else
      v5 = 14;
    v35[0] = v5;
    v33 = 0.0;
    v34 = 0.0;
    v32 = 1.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
    sub_10000F834(v7, &v34, &v33, &v32, 0, 0);

    v8 = v34 / v32;
    v9 = v33 / v32;
    objc_msgSend(v4, "position");
    v11 = v10;
    v13 = v12;
    if ((BSFloatEqualToFloat(v10, v8) & 1) != 0)
    {
      v14 = -1;
    }
    else
    {
      v16 = fmax(v11 / v8, 0.0);
      if (v16 >= 1.0)
        v17 = 4294967300.0;
      else
        v17 = v16 * 4294967300.0;
      v14 = fmin(fmax(v17, 0.0), 4294967300.0);
    }
    v35[1] = v14;
    if ((BSFloatEqualToFloat(v13, v9) & 1) != 0)
    {
      v18 = -1;
    }
    else
    {
      v19 = fmax(v13 / v9, 0.0);
      if (v19 >= 1.0)
        v20 = 4294967300.0;
      else
        v20 = v19 * 4294967300.0;
      v18 = fmin(fmax(v20, 0.0), 4294967300.0);
    }
    LODWORD(v36) = v18;
    v21 = sub_100059A88();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(v4, "style");
      *(_DWORD *)buf = 67109632;
      v40 = v31;
      v41 = 1024;
      v42 = v14;
      v43 = 1024;
      v44 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Setting progress indicator (style = %d) for overlay at position (%u, %u).", buf, 0x14u);
    }

    v23 = sysctlbyname("kern.progressoptions", 0, 0, v35, 0x2CuLL);
    v15 = v23 >= 0;
    v24 = sub_100059A88();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v23 < 0)
    {
      if (v26)
      {
        *(_DWORD *)buf = 67109120;
        v40 = v23;
        v27 = "Unable to apply kernel progress indicator - error %d.";
        v28 = v25;
        v29 = 8;
        goto LABEL_27;
      }
    }
    else if (v26)
    {
      *(_WORD *)buf = 0;
      v27 = "Successfully applied kernel progress indicator.";
      v28 = v25;
      v29 = 2;
LABEL_27:
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
    }

    goto LABEL_25;
  }
  v15 = 0;
LABEL_25:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;
  BKDisplayRenderOverlayPinkForTesting *v13;
  double v14;
  BKDisplayRenderOverlayPinkForTesting *v15;

  v6 = a4;
  v7 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  v9 = (objc_class *)objc_opt_class(a1, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v7, "initWithName:display:", v11, v6);

  objc_msgSend(v12, "setLockBacklight:", 0);
  v13 = [BKDisplayRenderOverlayPinkForTesting alloc];
  *(float *)&v14 = a3;
  v15 = -[BKDisplayRenderOverlayPinkForTesting initWithOverlayDescriptor:level:](v13, "initWithOverlayDescriptor:level:", v12, v14);

  return v15;
}

+ (void)doItShowKernel
{
  id v2;
  void *v3;
  void *v4;
  BKDisplayRenderOverlayPinkForTesting *v5;
  double v6;
  BKDisplayRenderOverlayPinkForTesting *v7;
  void *v8;
  id v9;

  +[BKDisplayRenderOverlayPinkForTesting doItHide](BKDisplayRenderOverlayPinkForTesting, "doItHide");
  v2 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  v9 = objc_msgSend(v2, "initWithName:display:", CFSTR("Testing"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDisplayProgressIndicatorProperties progressIndicatorWithStyle:position:](BKSDisplayProgressIndicatorProperties, "progressIndicatorWithStyle:position:", 2, 100.0, 175.0));
  objc_msgSend(v9, "setProgressIndicatorProperties:", v4);
  v5 = [BKDisplayRenderOverlayPinkForTesting alloc];
  LODWORD(v6) = 1176255488;
  v7 = -[BKDisplayRenderOverlayPinkForTesting initWithOverlayDescriptor:level:](v5, "initWithOverlayDescriptor:level:", v9, v6);
  v8 = (void *)qword_1001174E8;
  qword_1001174E8 = (uint64_t)v7;

  objc_msgSend((id)qword_1001174E8, "presentWithAnimationSettings:", 0);
}

+ (void)doItShow
{
  id v2;
  void *v3;
  BKDisplayRenderOverlayPinkForTesting *v4;
  double v5;
  BKDisplayRenderOverlayPinkForTesting *v6;
  void *v7;
  id v8;

  +[BKDisplayRenderOverlayPinkForTesting doItHide](BKDisplayRenderOverlayPinkForTesting, "doItHide");
  v2 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  v8 = objc_msgSend(v2, "initWithName:display:", CFSTR("Testing"), v3);

  v4 = [BKDisplayRenderOverlayPinkForTesting alloc];
  LODWORD(v5) = 1161527296;
  v6 = -[BKDisplayRenderOverlayPinkForTesting initWithOverlayDescriptor:level:](v4, "initWithOverlayDescriptor:level:", v8, v5);
  v7 = (void *)qword_1001174E8;
  qword_1001174E8 = (uint64_t)v6;

  objc_msgSend((id)qword_1001174E8, "presentWithAnimationSettings:", 0);
}

+ (void)doItHide
{
  void *v2;

  if (qword_1001174E8)
  {
    objc_msgSend((id)qword_1001174E8, "dismissWithAnimationSettings:", 0);
    v2 = (void *)qword_1001174E8;
    qword_1001174E8 = 0;

  }
}

@end
