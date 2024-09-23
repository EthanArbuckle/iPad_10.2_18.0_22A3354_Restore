@implementation BKDisplayRenderOverlayImage

- (BKDisplayRenderOverlayImage)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  BKDisplayRenderOverlayImage *v4;
  BKDisplayRenderOverlayImage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayImage;
  v4 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4)
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 1);
  return v5;
}

- (id)_initWithPersistenceData:(id)a3
{
  id v4;
  _QWORD *v5;
  CGImage *v6;
  BKDisplayRenderOverlayImage *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BKDisplayRenderOverlayImage;
    v5 = -[BKDisplayRenderOverlay _initWithPersistenceData:](&v9, "_initWithPersistenceData:", v4);
    if (v5)
    {
      v6 = (CGImage *)objc_msgSend(v4, "image");
      if (v6)
      {
        v5[7] = CGImageRetain(v6);
        *((_BYTE *)v5 + 64) = objc_msgSend(v4, "isFrozen");
      }
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDisplayRenderOverlayImage *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self->_context)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_context == nil")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKDisplayRenderOverlayImage.m");
      v20 = 1024;
      v21 = 59;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x100036478);
  }
  CGImageRelease(self->_imageRef);
  v11.receiver = self;
  v11.super_class = (Class)BKDisplayRenderOverlayImage;
  -[BKDisplayRenderOverlay dealloc](&v11, "dealloc");
}

- (CGImage)image
{
  return self->_imageRef;
}

- (BOOL)disablesDisplayUpdates
{
  BOOL v2;
  void *v3;

  if (self->_frozen)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay progressIndicatorProperties](self, "progressIndicatorProperties"));
  v2 = v3 != 0;

  return v2;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CAContext *v22;
  CAContext *context;
  CAContext *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CGFloat v33;
  double height;
  unint64_t width;
  uint64_t AlignedBytesPerRow;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFDictionary *v41;
  __IOSurface *v42;
  __IOSurface *v43;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t v46;
  size_t v47;
  size_t AllocSize;
  CGDataProvider *v49;
  CGColorSpace *DeviceRGB;
  CGImage *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  const __CFDictionary *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  const char *v63;
  NSObject *v64;
  uint32_t v65;
  void *v66;
  NSString *v67;
  void *v68;
  uint64_t v69;
  objc_class *v70;
  NSString *v71;
  void *v72;
  objc_class *v73;
  uint64_t v74;
  NSString *v75;
  void *v76;
  uint64_t v77;
  objc_class *v78;
  NSString *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  uint64_t v88;
  double v89;
  double v90;
  CGAffineTransform v91;
  unsigned __int8 v92;
  CGFloat sx;
  double v94;
  double v95;
  CGAffineTransform v96;
  __int16 v97;
  void *v98;
  CGAffineTransform v99;
  CGRect v100;
  CGRect v101;

  v5 = a3;
  if (self->_context)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Already have a context")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v67 = NSStringFromSelector(a2);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v70 = (objc_class *)objc_opt_class(self, v69);
      v71 = NSStringFromClass(v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      LODWORD(v96.a) = 138544642;
      *(_QWORD *)((char *)&v96.a + 4) = v68;
      WORD2(v96.b) = 2114;
      *(_QWORD *)((char *)&v96.b + 6) = v72;
      HIWORD(v96.c) = 2048;
      *(_QWORD *)&v96.d = self;
      LOWORD(v96.tx) = 2114;
      *(_QWORD *)((char *)&v96.tx + 2) = CFSTR("BKDisplayRenderOverlayImage.m");
      WORD1(v96.ty) = 1024;
      HIDWORD(v96.ty) = 78;
      v97 = 2114;
      v98 = v66;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v96, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v66), "UTF8String"));
    __break(0);
    JUMPOUT(0x100036E48);
  }
  v6 = v5;
  v89 = 0.0;
  v90 = 0.0;
  v88 = 0x3FF0000000000000;
  v87 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayUUID"));

  sub_10000F834(v8, &v90, &v89, (double *)&v88, &v87, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "display"));

  if (!v10)
  {
    v27 = BKLogDisplay(v11);
    v13 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v96.a) = 138543362;
      *(_QWORD *)((char *)&v96.a + 4) = v8;
      v63 = "[BKDisplayRenderOverlay] No CADisplay found for UUID: %{public}@";
      v64 = v13;
      v65 = 12;
      goto LABEL_34;
    }
LABEL_16:
    v26 = 0;
    goto LABEL_17;
  }
  if (!self->_imageRef)
  {
    v85 = v8;
    v86 = v10;
    v29 = v10;
    v31 = objc_opt_class(CADisplay, v30);
    if ((objc_opt_isKindOfClass(v29, v31) & 1) == 0)
    {
      v73 = (objc_class *)objc_msgSend(v29, "classForCoder");
      if (!v73)
        v73 = (objc_class *)objc_opt_class(v29, v74);
      v75 = NSStringFromClass(v73);
      v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
      v78 = (objc_class *)objc_opt_class(CADisplay, v77);
      v79 = NSStringFromClass(v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v76, v80));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CGImageRef BKDisplayCaptureImage(CADisplay *__strong)"));
        LODWORD(v96.a) = 138544130;
        *(_QWORD *)((char *)&v96.a + 4) = v82;
        WORD2(v96.b) = 2114;
        *(_QWORD *)((char *)&v96.b + 6) = CFSTR("BKDisplay.m");
        HIWORD(v96.c) = 1024;
        LODWORD(v96.d) = 886;
        WORD2(v96.d) = 2114;
        *(_QWORD *)((char *)&v96.d + 6) = v81;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v96, 0x26u);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v81), "UTF8String"));
      __break(0);
      JUMPOUT(0x100036F64);
    }

    +[CATransaction flush](CATransaction, "flush");
    +[CATransaction synchronize](CATransaction, "synchronize");
    v95 = 0.0;
    sx = 1.0;
    v94 = 0.0;
    v92 = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueId"));
    sub_10000F834(v32, &v95, &v94, &sx, &v92, 0);

    v84 = v29;
    v83 = objc_msgSend(v29, "name");
    memset(&v96, 0, sizeof(v96));
    CGAffineTransformMakeScale(&v96, sx, sx);
    v33 = BSDegreesToRadians((double)(90 * v92));
    v91 = v96;
    CGAffineTransformRotate(&v99, &v91, v33);
    v96 = v99;
    v100.size.width = v95 / sx;
    v100.size.height = v94 / sx;
    v100.origin.x = 0.0;
    v100.origin.y = 0.0;
    v101 = CGRectApplyAffineTransform(v100, &v99);
    height = v101.size.height;
    width = (unint64_t)v101.size.width;
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(4 * (unint64_t)v101.size.width, (__n128)v101.origin, *(__n128 *)&v101.origin.y);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", width));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)height));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", AlignedBytesPerRow));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", AlignedBytesPerRow * (unint64_t)height));
    v41 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v37, kIOSurfaceWidth, v38, kIOSurfaceHeight, v39, kIOSurfaceBytesPerRow, v40, kIOSurfaceAllocSize, &off_1000F7348, kIOSurfaceBytesPerElement, &off_1000F7360, kIOSurfacePixelFormat, 0));

    v42 = IOSurfaceCreate(v41);
    if (v42)
    {
      v43 = v42;
      IOSurfaceLock(v42, 0, 0);
      CARenderServerRenderDisplay(0, v83, v43, 0, 0);
      IOSurfaceUnlock(v43, 0, 0);
      IOSurfaceLock(v43, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v43);
      BytesPerRow = IOSurfaceGetBytesPerRow(v43);
      v46 = IOSurfaceGetWidth(v43);
      v47 = IOSurfaceGetHeight(v43);
      AllocSize = IOSurfaceGetAllocSize(v43);
      v49 = CGDataProviderCreateWithData(v43, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_10003608C);
      CFRetain(v43);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v51 = CGImageCreate(v46, v47, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2006u, v49, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v49);
      CGColorSpaceRelease(DeviceRGB);
      v8 = v85;
      if (v51)
      {
        CFRelease(v43);

        self->_imageRef = v51;
        v10 = v86;
        goto LABEL_4;
      }
      v56 = v41;
      v57 = BKLogCommon(v52);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      v10 = v86;
      v55 = v84;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v99.a) = 136315138;
        *(_QWORD *)((char *)&v99.a + 4) = "BKDisplayCaptureImage";
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s Unable to create CGImageRef from IOSurface!", (uint8_t *)&v99, 0xCu);
      }

      CFRelease(v43);
    }
    else
    {
      v53 = BKLogCommon(0);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v99.a) = 136315394;
        *(_QWORD *)((char *)&v99.a + 4) = "BKDisplayCaptureImage";
        WORD2(v99.b) = 2114;
        *(_QWORD *)((char *)&v99.b + 6) = v41;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s Unable to create IOSurface with properties: %{public}@", (uint8_t *)&v99, 0x16u);
      }

      v8 = v85;
      v10 = v86;
      v55 = v84;
    }

    self->_imageRef = 0;
    v60 = BKLogDisplay(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v96.a) = 138543362;
      *(_QWORD *)((char *)&v96.a + 4) = v55;
      _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "[BKDisplayRenderOverlay] Unable to capture display image for display! %{public}@", (uint8_t *)&v96, 0xCu);
    }

    if (self->_imageRef)
      goto LABEL_4;
    v62 = sub_100059A88();
    v13 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v96.a) = 0;
      v63 = "No image";
      v64 = v13;
      v65 = 2;
LABEL_34:
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v63, (uint8_t *)&v96, v65);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_4:
  +[CATransaction activate](CATransaction, "activate");
  v12 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v13 = v12;
  v14 = v87 & 0xFD;
  if (v14 == 1)
    v15 = v89;
  else
    v15 = v90;
  if (v14 == 1)
    v16 = v90;
  else
    v16 = v89;
  -[NSObject setFrame:](v12, "setFrame:", 0.0, 0.0, v15, v16);
  -[NSObject setContents:](v13, "setContents:", self->_imageRef);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay name](self, "name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKDisplayRenderOverlayImage:%@"), v17));
  -[NSObject setName:](v13, "setName:", v18);

  -[NSObject setHidden:](v13, "setHidden:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BSColor blackColor](BSColor, "blackColor"));
  -[NSObject setBackgroundColor:](v13, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v20, "setObject:forKey:", kCFBooleanTrue, kCAContextDisableGroupOpacity);
  objc_msgSend(v20, "setObject:forKey:", kCFBooleanTrue, kCAContextIgnoresHitTest);
  objc_msgSend(v20, "setObject:forKey:", kCFBooleanTrue, kCAContextDisplayable);
  objc_msgSend(v20, "setObject:forKey:", kCFBooleanTrue, kCAContextSecure);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  if (v21)
    objc_msgSend(v20, "setObject:forKey:", v21, kCAContextDisplayName);
  v22 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v20));
  context = self->_context;
  self->_context = v22;

  v24 = self->_context;
  -[BKDisplayRenderOverlay level](self, "level");
  -[CAContext setLevel:](v24, "setLevel:");
  -[CAContext setLayer:](self->_context, "setLayer:", v13);
  if (v6)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayImage _animationForKeyPath:withSettings:](self, "_animationForKeyPath:withSettings:", CFSTR("opacity"), v6));
    objc_msgSend(v25, "setFromValue:", &off_1000F7620);
    objc_msgSend(v25, "setToValue:", &off_1000F7630);
    -[NSObject addAnimation:forKey:](v13, "addAnimation:forKey:", v25, CFSTR("opacity"));

  }
  v26 = 1;
LABEL_17:

  return v26;
}

- (void)_freeze
{
  void *v3;

  if (!self->_frozen)
  {
    self->_frozen = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay _persistenceCoordinator](self, "_persistenceCoordinator"));
    objc_msgSend(v3, "saveOverlay:", self);

    -[BKDisplayRenderOverlayImage _applyProgressIndicatorPropertiesToKernelIfNecessary](self, "_applyProgressIndicatorPropertiesToKernelIfNecessary");
  }
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  CGImage *imageRef;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayImage _animationForKeyPath:withSettings:](self, "_animationForKeyPath:withSettings:", CFSTR("opacity"), v4));
    objc_msgSend(v5, "setFromValue:", &off_1000F7630);
    objc_msgSend(v5, "setToValue:", &off_1000F7620);
    objc_msgSend(v5, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
    LODWORD(v7) = 0;
    objc_msgSend(v6, "setOpacity:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
    objc_msgSend(v8, "addAnimation:forKey:", v5, CFSTR("opacity"));

  }
  else
  {
    -[BKDisplayRenderOverlayImage _cleanup](self, "_cleanup");
  }
  imageRef = self->_imageRef;
  if (imageRef)
  {
    CGImageRelease(imageRef);
    self->_imageRef = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay _persistenceCoordinator](self, "_persistenceCoordinator"));
  objc_msgSend(v10, "destroyOverlay:", self);

}

- (id)_persistenceData
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKDisplayRenderOverlayImage;
  v3 = -[BKDisplayRenderOverlay _persistenceData](&v6, "_persistenceData");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setImage:", self->_imageRef);
  objc_msgSend(v4, "setFrozen:", self->_frozen);
  return v4;
}

- (void)_cleanup
{
  void *v3;
  CAContext *context;

  +[CATransaction begin](CATransaction, "begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_context, "layer"));
  objc_msgSend(v3, "removeAllAnimations");

  -[CAContext setLayer:](self->_context, "setLayer:", 0);
  -[CAContext invalidate](self->_context, "invalidate");
  context = self->_context;
  self->_context = 0;

  +[CATransaction commit](CATransaction, "commit");
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
  v10.super_class = (Class)BKDisplayRenderOverlayImage;
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

- (id)_animationForKeyPath:(id)a3 withSettings:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "isSpringAnimation");
  v9 = CASpringAnimation_ptr;
  if (!v7)
    v9 = CABasicAnimation_ptr;
  v10 = objc_msgSend((id)objc_opt_class(*v9, v8), "animationWithKeyPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v5, "applyToCAAnimation:", v11);
  return v11;
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
  unsigned int v23;
  int v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  double v29;
  double v30;
  double v31;
  _DWORD v32[2];
  __int128 v33;
  __int128 v34;
  int v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self, "descriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progressIndicatorProperties"));

  if (v4)
  {
    v35 = 0;
    v34 = 0u;
    v33 = 0u;
    if (objc_msgSend(v4, "style") == (id)2)
      v5 = 22;
    else
      v5 = 14;
    v32[0] = v5;
    v30 = 0.0;
    v31 = 0.0;
    v29 = 1.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
    sub_10000F834(v7, &v31, &v30, &v29, 0, 0);

    v8 = v31 / v29;
    v9 = v30 / v29;
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
    v32[1] = v14;
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
    LODWORD(v33) = v18;
    v21 = sub_100059A88();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v4, "style");
      *(_DWORD *)buf = 67109632;
      v37 = v23;
      v38 = 1024;
      v39 = v14;
      v40 = 1024;
      v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Setting progress indicator (style = %d) for overlay at position (%u, %u).", buf, 0x14u);
    }

    v24 = sysctlbyname("kern.progressoptions", 0, 0, v32, 0x2CuLL);
    v15 = v24 >= 0;
    v25 = sub_100059A88();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = v26;
    if (v24 < 0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v37 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to apply kernel progress indicator - error %d.", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Successfully applied kernel progress indicator.", buf, 2u);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
