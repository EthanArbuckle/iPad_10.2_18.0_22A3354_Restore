@implementation UIImage(PosterUIFoundation)

+ (id)pui_imageWithIOSurface:()PosterUIFoundation scale:orientation:
{
  id v8;
  id v9;
  id v10;
  const void *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  id v16;
  CGDataProvider *v17;
  CFTypeRef v18;
  const void *v19;
  CGColorSpace *v20;
  CGImage *v21;
  void *v22;

  v8 = a4;
  if (objc_msgSend(v8, "pixelFormat") == 1380411457)
  {
    v9 = v8;
    objc_msgSend(v9, "lockWithOptions:seed:", 1, 0);
    v10 = objc_retainAutorelease(v9);
    v11 = (const void *)objc_msgSend(v10, "baseAddress");
    v12 = objc_msgSend(v10, "bytesPerRow");
    v13 = objc_msgSend(v10, "width");
    v14 = objc_msgSend(v10, "height");
    v15 = objc_msgSend(v10, "allocationSize");
    v16 = v10;
    v17 = CGDataProviderCreateWithData(v16, v11, v15, (CGDataProviderReleaseDataCallback)releaseIOSurface);
    objc_msgSend(v16, "incrementUseCount");
    v18 = IOSurfaceCopyValue((IOSurfaceRef)v16, (CFStringRef)*MEMORY[0x24BDD8E88]);
    if (!v18 || (v19 = v18, v20 = CGColorSpaceCreateWithPropertyList(v18), CFRelease(v19), !v20))
      v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    v21 = CGImageCreate(v13, v14, 0x10uLL, 0x40uLL, v12, v20, 0x1101u, v17, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v20);
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v21, a5, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    CGImageRelease(v21);

  }
  else
  {
    v22 = (void *)objc_msgSend([a1 alloc], "_initWithIOSurface:scale:orientation:", v8, a5, a2);
  }

  return v22;
}

+ (id)pui_imageWithIOSurface:()PosterUIFoundation
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v4 = kPaperboardIOSurfaceInterfaceOrientationPropertiesKey;
  v5 = a3;
  objc_msgSend(v5, "attachmentForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v5, "attachmentForKey:", kPaperboardIOSurfaceDeviceOrientationPropertiesKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v5, "attachmentForKey:", kPaperboardIOSurfaceDeviceScalePropertiesKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v9 == 0.0)
    v10 = 1.0;
  else
    v10 = v9;

  objc_msgSend(a1, "pui_imageWithIOSurface:scale:orientation:", v5, PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pui_wrappedIOSurface
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(a1, "ioSurface");
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    PUIIOSurfaceFromCGImage((id)objc_msgSend(objc_retainAutorelease(a1), "CGImage"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)pui_imageSnapshotFromLayer:()PosterUIFoundation buffer:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextId");
  objc_msgSend(v5, "bounds");
  v8 = v7;

  CARenderServerRenderLayer();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "_initWithIOSurface:scale:orientation:", a4, 0, (double)IOSurfaceGetWidth(a4) / v8);

  return v9;
}

+ (id)pui_imageFromSceneSnapshot:()PosterUIFoundation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;

  v3 = a3;
  if (objc_msgSend(v3, "capture"))
  {
    objc_msgSend(v3, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "interfaceOrientation");
    objc_msgSend(v5, "pui_deviceOrientation");
    v6 = PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation();
    objc_msgSend(v3, "IOSurface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      if (v9 == 0.0)
        v10 = 1.0;
      else
        v10 = v9;

      objc_msgSend(MEMORY[0x24BDF6AC8], "pui_imageWithIOSurface:scale:orientation:", v7, v6, v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_retainAutorelease(v3);
      v14 = objc_msgSend(v13, "CGImage");
      if (!v14)
      {
        v12 = 0;
        goto LABEL_14;
      }
      v15 = v14;
      objc_msgSend(v13, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      if (v17 == 0.0)
        v18 = 1.0;
      else
        v18 = v17;

      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v15, v6, v18);
    }
    v12 = (void *)v11;
LABEL_14:

    goto LABEL_15;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (uint64_t)pui_CGImageBackedImage
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:", -1);
}

- (uint64_t)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (id)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation skipCIF10FitsInSRGBCheck:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGImage *v14;
  id v15;
  double v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(a1);
  if (objc_msgSend(v6, "CGImage"))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "ioSurface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "pixelFormat");
      if (a3 <= 8 && v10 == 1999843442)
      {
        v11 = *MEMORY[0x24BDD9260];
        v18[0] = *MEMORY[0x24BDD91F8];
        v18[1] = v11;
        v19[0] = &unk_25156AD50;
        v19[1] = &unk_25156AD68;
        v18[2] = *MEMORY[0x24BDD9768];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (CGImage *)CGImageCreateFromIOSurface();
      }
      else
      {
        v14 = (CGImage *)UICreateCGImageFromIOSurface();
      }
      v15 = objc_alloc(MEMORY[0x24BDF6AC8]);
      objc_msgSend(v6, "scale");
      v7 = (id)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v14, objc_msgSend(v6, "imageOrientation"), v16);
      CGImageRelease(v14);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)pui_CGImageBackedImageUsingDataProvider
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  id v9;
  const void *v10;
  size_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  id v15;
  CGDataProvider *v16;
  CFTypeRef v17;
  const void *v18;
  CGColorSpace *v19;
  CGImage *v20;
  CGImage *v21;
  id v22;
  double v23;

  v1 = objc_retainAutorelease(a1);
  if (objc_msgSend(v1, "CGImage"))
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "ioSurface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      if (objc_msgSend(v3, "pixelFormat") == 1999843442)
      {
        objc_msgSend(v1, "scale");
        v6 = v5;
        v7 = objc_msgSend(v1, "imageOrientation");
        v8 = v4;
        objc_msgSend(v8, "lockWithOptions:seed:", 1, 0);
        v9 = objc_retainAutorelease(v8);
        v10 = (const void *)objc_msgSend(v9, "baseAddress");
        v11 = objc_msgSend(v9, "bytesPerRow");
        v12 = objc_msgSend(v9, "width");
        v13 = objc_msgSend(v9, "height");
        v14 = objc_msgSend(v9, "allocationSize");
        v15 = v9;
        v16 = CGDataProviderCreateWithData(v15, v10, v14, (CGDataProviderReleaseDataCallback)releaseIOSurface);
        objc_msgSend(v15, "incrementUseCount");
        v17 = IOSurfaceCopyValue((IOSurfaceRef)v15, (CFStringRef)*MEMORY[0x24BDD8E88]);
        if (!v17 || (v18 = v17, v19 = CGColorSpaceCreateWithPropertyList(v17), CFRelease(v18), !v19))
          v19 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
        v20 = CGImageCreate(v12, v13, 0xAuLL, 0x20uLL, v11, v19, 0x42000u, v16, 0, 0, kCGRenderingIntentDefault);
        CGImageSetProperty();
        CGDataProviderRelease(v16);
        CGColorSpaceRelease(v19);
        if (v20)
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v20, v7, v6);
          v2 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v2 = 0;
        }
        CGImageRelease(v20);

      }
      else
      {
        v21 = (CGImage *)UICreateCGImageFromIOSurface();
        v22 = objc_alloc(MEMORY[0x24BDF6AC8]);
        objc_msgSend(v1, "scale");
        v2 = (id)objc_msgSend(v22, "initWithCGImage:scale:orientation:", v21, objc_msgSend(v1, "imageOrientation"), v23);
        CGImageRelease(v21);
      }
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", a3, 1);
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:canUseIOSurface:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", 1, a3);
}

- (id)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:
{
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  _BOOL4 v28;
  BOOL v29;
  int v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  unint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat x;
  CGFloat y;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  CGImage *v70;
  CGImage *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  double v77;
  int v78;
  double v79;
  double v80;
  uint64_t v81;
  CGFloat height;
  double v83;
  CGFloat width;
  unint64_t v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double v89;
  CGAffineTransform t2;
  CGAffineTransform v91;
  CGAffineTransform v92;
  uint8_t buf[16];
  _BYTE v94[44];
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  unint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  int v104;
  __int16 v105;
  int v106;
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v107 = *MEMORY[0x24BDAC8D0];
  PUILogRendering();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  PUILogRendering();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24464E000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "pui_cropImage", ", buf, 2u);
  }

  v24 = *MEMORY[0x24BDBEFB0];
  v25 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(a1, "size");
  v113.size.width = v26;
  v113.size.height = v27;
  v108.origin.x = a2;
  v108.origin.y = a3;
  v108.size.width = a4;
  v108.size.height = a5;
  v113.origin.x = v24;
  v113.origin.y = v25;
  v28 = CGRectEqualToRect(v108, v113);
  v29 = v28;
  v30 = !v28;
  v31 = a5 != a7 || a4 != a6;
  v109.origin.x = a2;
  v109.origin.y = a3;
  v109.size.width = a4;
  v109.size.height = a5;
  if (CGRectIsEmpty(v109)
    || !(v30 | v31)
    || (BSFloatLessThanOrEqualToFloat() & 1) != 0
    || BSFloatLessThanOrEqualToFloat())
  {
    PUILogRendering();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&buf[4] = v30;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v31;
      *(_WORD *)&buf[14] = 2048;
      *(CGFloat *)v94 = a4;
      *(_WORD *)&v94[8] = 2048;
      *(CGFloat *)&v94[10] = a5;
      *(_WORD *)&v94[18] = 2048;
      *(double *)&v94[20] = a6;
      *(_WORD *)&v94[28] = 2048;
      *(double *)&v94[30] = a7;
      _os_signpost_emit_with_name_impl(&dword_24464E000, v33, OS_SIGNPOST_INTERVAL_END, v20, "pui_cropImage", "No work to do: needsCrop=%u, needsScale=%u, cropRect.size=(%f, %f), outputSize=(%f, %f)", buf, 0x36u);
    }

    v34 = a1;
    return v34;
  }
  v36 = objc_msgSend(a1, "imageOrientation");
  v37 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v38 = *(_QWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v77 = *MEMORY[0x24BDBD8B8];
  v79 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v81 = *(_QWORD *)(MEMORY[0x24BDBD8B8] + 40);
  v83 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v88 = a6;
  v89 = a7;
  v86 = a2;
  v87 = a3;
  if (v36 && (objc_msgSend(a1, "size"), v36 <= 7))
  {
    if (((1 << v36) & 0x22) != 0)
    {
      v44 = 1.0;
      v43 = -1.0;
      v38 = 0;
      v42 = v40;
      v41 = 0.0;
      v37 = 0.0;
    }
    else
    {
      if (((1 << v36) & 0x44) != 0)
      {
        v37 = 1.0;
        v41 = -1.0;
        v42 = 0;
        v38 = v40;
        goto LABEL_25;
      }
      v42 = v81;
      v41 = v83;
      v44 = v77;
      v43 = v79;
      if (((1 << v36) & 0x88) != 0)
      {
        v37 = -1.0;
        v41 = 1.0;
        v38 = 0;
        v42 = v39;
LABEL_25:
        v43 = 0.0;
        v44 = 0.0;
      }
    }
  }
  else
  {
    v42 = v81;
    v41 = v83;
    v44 = v77;
    v43 = v79;
  }
  objc_msgSend(a1, "scale");
  memset(&v92, 0, sizeof(v92));
  v80 = v45;
  CGAffineTransformMakeScale(&v92, v45, v45);
  *(double *)buf = v44;
  *(double *)&buf[8] = v37;
  *(double *)v94 = v41;
  *(double *)&v94[8] = v43;
  *(_QWORD *)&v94[16] = v38;
  *(_QWORD *)&v94[24] = v42;
  t2 = v92;
  memset(&v91, 0, sizeof(v91));
  CGAffineTransformConcat(&v91, (CGAffineTransform *)buf, &t2);
  *(_OWORD *)buf = *(_OWORD *)&v91.a;
  *(_OWORD *)v94 = *(_OWORD *)&v91.c;
  *(_OWORD *)&v94[16] = *(_OWORD *)&v91.tx;
  v110.origin.x = v86;
  v110.origin.y = v87;
  v110.size.width = a4;
  v110.size.height = a5;
  v111 = CGRectApplyAffineTransform(v110, (CGAffineTransform *)buf);
  x = v111.origin.x;
  y = v111.origin.y;
  height = v111.size.height;
  width = v111.size.width;
  v85 = v36;
  if (!a10)
    goto LABEL_39;
  *(_QWORD *)buf = 0;
  PUICreateIOSurfaceForImage(a1, (uint64_t *)buf, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    v78 = a10;
    __PUICreateCroppedIOSurface(v48, x, y, width, height);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "pui_imageWithIOSurface:scale:orientation:", v50, v85, v80);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PUILogCommon();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        -[UIImage(PosterUIFoundation) pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:].cold.2(v51, v52, v53, v54, v55, v56, v57, v58);

      v34 = 0;
    }

    a10 = v78;
  }
  else
  {
    v34 = 0;
  }
  if (*(_QWORD *)buf)
    CGImageBlockSetRelease();

  v36 = v85;
  if (!v34)
  {
LABEL_39:
    PUILogCommon();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[UIImage(PosterUIFoundation) pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:].cold.1(v60, v61, v62, v63, v64, v65, v66, v67);

    objc_msgSend(a1, "pui_CGImageBackedImage");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v29)
    {
      v34 = 0;
      v70 = 0;
      if (!v31)
        goto LABEL_49;
    }
    else
    {
      v71 = (CGImage *)objc_msgSend(objc_retainAutorelease(v68), "CGImage");
      v112.origin.x = x;
      v112.origin.y = y;
      v112.size.height = height;
      v112.size.width = width;
      v70 = CGImageCreateWithImageInRect(v71, v112);
      v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v70, v36, v80);
      if (!v31)
      {
LABEL_49:
        if (v70)
          CGImageRelease(v70);

        v59 = 1;
        goto LABEL_52;
      }
    }
    if (v34)
      v72 = v34;
    else
      v72 = v69;
    objc_msgSend(v72, "pui_resizeImageToSize:preservingAspectRatio:", a9, v88, v89);
    v73 = objc_claimAutoreleasedReturnValue();

    v34 = (id)v73;
    goto LABEL_49;
  }
  v59 = 0;
LABEL_52:
  PUILogRendering();
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
  {
    v76 = objc_msgSend(v34, "imageOrientation");
    *(_DWORD *)buf = 67112192;
    *(_DWORD *)&buf[4] = v34 != 0;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v30;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)v94 = v31;
    *(_WORD *)&v94[4] = 2048;
    *(CGFloat *)&v94[6] = v86;
    *(_WORD *)&v94[14] = 2048;
    *(CGFloat *)&v94[16] = v87;
    *(_WORD *)&v94[24] = 2048;
    *(CGFloat *)&v94[26] = a4;
    *(_WORD *)&v94[34] = 2048;
    *(CGFloat *)&v94[36] = a5;
    v95 = 2048;
    v96 = v88;
    v97 = 2048;
    v98 = v89;
    v99 = 2048;
    v100 = v85;
    v101 = 2048;
    v102 = v76;
    v103 = 1024;
    v104 = a10;
    v105 = 1024;
    v106 = v59;
    _os_signpost_emit_with_name_impl(&dword_24464E000, v75, OS_SIGNPOST_INTERVAL_END, v20, "pui_cropImage", "Complete: success=%u needsCrop=%u, needsScale=%u, cropRect=((%f, %f), (%f, %f)), outputSize=(%f, %f), imageOrientation=%lu, outputImage.imageOrientation=%lu canUseIOSurface=%u, usedCPU=%u", buf, 0x70u);
  }

  return v34;
}

- (uint64_t)pui_scaleImage:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_scaleImage:canUseIOSurface:", 1);
}

- (id)pui_scaleImage:()PosterUIFoundation canUseIOSurface:
{
  id v6;
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
  CGAffineTransform v19;

  if (fabs(a2 + -1.0) >= 2.22044605e-16)
  {
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    objc_msgSend(a1, "size");
    v11 = v10;
    v13 = v12;
    objc_msgSend(a1, "size");
    v15 = v14;
    v17 = v16;
    CGAffineTransformMakeScale(&v19, a2, a2);
    objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", a4, v8, v9, v11, v13, v17 * v19.c + v19.a * v15, v17 * v19.d + v19.b * v15);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)pui_resizeImageToSize:()PosterUIFoundation preservingAspectRatio:
{
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  id v15;

  objc_msgSend(a1, "size");
  if (v9 == a2 && v10 == a3)
  {
    v15 = a1;
  }
  else
  {
    if (a5)
    {
      v12 = v9;
      v13 = v10;
      v14 = v9 / v10;
      if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        if (v12 >= v13)
          a3 = floor(a2 * v14);
        else
          a2 = floor(a3 * v14);
      }
    }
    objc_msgSend(a1, "pui_resizeImageToSize:", a2, a3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)pui_resizeImageToSize:()PosterUIFoundation
{
  double v6;
  double v7;
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
  id v19;
  CGImage *v20;
  int v21;
  int v22;
  size_t BitsPerComponent;
  uint32_t v24;
  CGColorSpace *v25;
  CGColorSpace *v26;
  id v27;
  CGColorSpace *ColorSpace;
  CGColorSpace *v29;
  CFStringRef *v30;
  size_t v31;
  size_t v32;
  size_t NumberOfComponents;
  CGContext *v34;
  CGImage *Image;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a1, "size");
  if (v7 != a2 || v6 != a3)
  {
    objc_msgSend(a1, "scale");
    v10 = v9;
    UIRectIntegralWithScale();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = objc_retainAutorelease(a1);
    v20 = (CGImage *)objc_msgSend(v19, "CGImage");
    v21 = MGGetBoolAnswer();
    v22 = v21;
    if (!v20 || (v21 & 1) != 0)
    {
      if (v21)
        BitsPerComponent = 16;
      else
        BitsPerComponent = 8;
      if (v21)
        v24 = 4353;
      else
        v24 = 1;
      if (!v20)
        goto LABEL_22;
      if (((v21 ^ 1) & 1) != 0)
        goto LABEL_22;
      ColorSpace = CGImageGetColorSpace(v20);
      if (!ColorSpace)
        goto LABEL_22;
      v29 = ColorSpace;
      if (!CGColorSpaceIsWideGamutRGB(ColorSpace))
        goto LABEL_22;
      v25 = v29;
    }
    else
    {
      BitsPerComponent = CGImageGetBitsPerComponent(v20);
      v24 = CGImageGetBitmapInfo(v20) & 0xFFFFFFE0 | 1;
      v25 = CGImageGetColorSpace(v20);
    }
    v26 = CGColorSpaceRetain(v25);
    if (v26)
    {
LABEL_25:
      v37.origin.x = v12;
      v37.origin.y = v14;
      v37.size.width = v16;
      v37.size.height = v18;
      v31 = (unint64_t)(v10 * CGRectGetWidth(v37));
      v38.origin.x = v12;
      v38.origin.y = v14;
      v38.size.width = v16;
      v38.size.height = v18;
      v32 = (unint64_t)(v10 * CGRectGetHeight(v38));
      NumberOfComponents = CGColorSpaceGetNumberOfComponents(v26);
      v34 = CGBitmapContextCreate(0, v31, v32, BitsPerComponent, (BitsPerComponent >> 3) * v31 + (BitsPerComponent >> 3) * v31 * NumberOfComponents, v26, v24);
      CGContextTranslateCTM(v34, 0.0, (double)v32);
      CGContextScaleCTM(v34, v10, -v10);
      UIGraphicsPushContext(v34);
      objc_msgSend(v19, "drawInRect:", v12, v14, v16, v18);
      UIGraphicsPopContext();
      Image = CGBitmapContextCreateImage(v34);
      CGColorSpaceRelease(v26);
      CGContextRelease(v34);
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, v10);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
      return v27;
    }
LABEL_22:
    v30 = (CFStringRef *)MEMORY[0x24BDBF278];
    if (!v22)
      v30 = (CFStringRef *)MEMORY[0x24BDBF318];
    v26 = CGColorSpaceCreateWithName(*v30);
    goto LABEL_25;
  }
  v27 = a1;
  return v27;
}

- (CGImage)pui_colorSpace
{
  CGImage *result;

  result = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (result)
    return CGImageGetColorSpace(result);
  return result;
}

- (id)pui_imageByManipulatingInDeviceColorSpaceWithBlock:()PosterUIFoundation
{
  void (**v4)(id, id);
  void *v5;
  CGColorSpace *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x249515064]();
    v6 = CGColorSpaceRetain((CGColorSpaceRef)objc_msgSend(a1, "pui_colorSpace"));
    if (v6)
    {
      __PUIImageByApplyingColorSpace(a1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = a1;
    }
    v9 = v7;
    v4[2](v4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      __PUIImageByApplyingColorSpace(v10, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    CGColorSpaceRelease(v6);

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v8 = a1;
  }

  return v8;
}

- (id)pui_imageHashData
{
  void *Hash;
  void *v3;

  Hash = (void *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (Hash)
  {
    Hash = (void *)CGImageGetHash();
    v3 = Hash;
    if (Hash)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v3, 8);
      Hash = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return Hash;
}

- (uint64_t)pui_EXIFOrientation
{
  objc_msgSend(a1, "imageOrientation");
  return _EXIFOrientationForUIImageOrientation();
}

+ (double)minimumWallpaperSizeForCurrentDevice
{
  void *v0;
  double v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  if (objc_msgSend(MEMORY[0x24BDF6F90], "_motionEffectsEnabled"))
    v3 = PUIPosterParallaxRequiredOverhangForCurrentDeviceClass();
  else
    v3 = *MEMORY[0x24BDBF148];
  return v2 + v3 * 2.0;
}

+ (id)pui_thumbnailImageForImage:()PosterUIFoundation thumbnailWidthInPixels:
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  v6 = a4;
  objc_msgSend(v6, "scale");
  v8 = v7;
  v9 = objc_msgSend(v6, "size");
  v11 = 0;
  if (v12 > 0.0 && v10 > 0.0)
  {
    v13 = (void *)MEMORY[0x249515064](v9);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v16 = v15;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_referenceBounds");
    v19 = v18;
    v21 = v20;

    v22 = v16 * v19;
    v33 = a2;
    v23 = v16 * v21;
    objc_msgSend(a1, "minimumWallpaperSizeForCurrentDevice");
    UIRectCenteredIntegralRect();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    CGAffineTransformMakeScale(&v34, v16, v16);
    CGAffineTransformInvert(&v35, &v34);
    v36.origin.x = v25;
    v36.origin.y = v27;
    v36.size.width = v29;
    v36.size.height = v31;
    v37 = CGRectApplyAffineTransform(v36, &v35);
    objc_msgSend(v6, "pui_cropImageWithRect:outputSize:preservingAspectRatio:", 0, v37.origin.x, v37.origin.y, v37.size.width, v37.size.height, round(v33) * (v16 / v8) / v16, v16 / v8 * round(v23 * (v33 / v22)) / v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
  }

  return v11;
}

- (BOOL)pui_canDetermineProminentColor
{
  double v2;
  double v3;
  __IOSurface *v5;
  uint32_t oldState;

  objc_msgSend(a1, "size");
  if (v3 == *MEMORY[0x24BDBF148] && v2 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 0;
  v5 = (__IOSurface *)objc_msgSend(a1, "pui_wrappedIOSurface");
  if (!v5)
    return objc_msgSend(objc_retainAutorelease(a1), "CGImage") != 0;
  oldState = 0;
  return IOSurfaceSetPurgeable(v5, 3u, &oldState) || oldState == 0;
}

- (uint64_t)pui_averageColor
{
  objc_msgSend(a1, "size");
  BSRectWithSize();
  return objc_msgSend(a1, "pui_averageColorForRect:");
}

- (id)pui_averageColorForRect:()PosterUIFoundation
{
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v30;
  _QWORD v31[2];
  _QWORD v32[3];
  CGRect v33;
  CGRect v34;

  v32[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "size");
  v11 = v10;
  v13 = v12;
  v33.origin.x = a2;
  v33.origin.y = a3;
  v33.size.width = a4;
  v33.size.height = a5;
  if (CGRectGetMaxX(v33) > v11)
    goto LABEL_3;
  v34.origin.x = a2;
  v34.origin.y = a3;
  v34.size.width = a4;
  v34.size.height = a5;
  if (CGRectGetMaxY(v34) > v13)
    goto LABEL_3;
  v15 = objc_alloc(MEMORY[0x24BDBF660]);
  v16 = objc_retainAutorelease(a1);
  v17 = (void *)objc_msgSend(v15, "initWithCGImage:", objc_msgSend(v16, "CGImage"));
  if (v17
    || (v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithIOSurface:", objc_msgSend(v16, "pui_wrappedIOSurface"))) != 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF690]), "initWithCGRect:", a2, a3, a4, a5);
    v19 = (void *)MEMORY[0x24BDBF658];
    v20 = *MEMORY[0x24BDBF958];
    v31[0] = *MEMORY[0x24BDBF960];
    v31[1] = v20;
    v32[0] = v17;
    v32[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filterWithName:withInputParameters:", CFSTR("CIAreaAverage"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "outputImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, &v30, 4, *MEMORY[0x24BDBF8B0], objc_msgSend(v16, "pui_colorSpace"), 0.0, 0.0, 1.0, 1.0);

      LOBYTE(v26) = BYTE1(v30);
      LOBYTE(v25) = v30;
      LOBYTE(v28) = HIBYTE(v30);
      LOBYTE(v27) = BYTE2(v30);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v25 / 255.0, (double)v26 / 255.0, (double)v27 / 255.0, (double)v28 / 255.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
LABEL_3:
    v14 = 0;
  }
  return v14;
}

- (uint64_t)pui_isSolidColor:()PosterUIFoundation
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(a1, "size");
  v7 = v6;
  v8 = v5;
  if (v6 == *MEMORY[0x24BDBF148] && v5 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 0;
  v10 = a1;
  if (v7 > 100.0 || v8 > 100.0)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "pui_thumbnailImageForImage:thumbnailWidthInPixels:", v10, 100.0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (uint64_t)v12;
    if (!v12)
      goto LABEL_23;
  }
  v13 = objc_msgSend((id)v10, "size");
  v15 = v14;
  *(float *)&v14 = v16 / 10.0;
  v17 = vcvtms_u32_f32(*(float *)&v14);
  if (!v17)
  {

    v12 = 0;
    v10 = 0;
    goto LABEL_23;
  }
  v18 = 0;
  v12 = 0;
  while (1)
  {
    v19 = (void *)MEMORY[0x249515064](v13);
    objc_msgSend((id)v10, "pui_averageColorForRect:", 0.0, (double)v18 * 10.0, v15, 10.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v12)
    {
      v12 = v20;
      goto LABEL_16;
    }
    if ((objc_msgSend(v12, "_isSimilarToColor:withinPercentage:", v20, 0.01) & 1) == 0)
      break;
LABEL_16:

    objc_autoreleasePoolPop(v19);
    if (v17 == ++v18)
      goto LABEL_20;
  }

  objc_autoreleasePoolPop(v19);
LABEL_20:

  v10 = v12 != 0;
  if (a3 && v12)
  {
    v12 = objc_retainAutorelease(v12);
    *a3 = v12;
    v10 = 1;
  }
LABEL_23:

  return v10;
}

- (void)pui_determineProminentColorWithCompletion:()PosterUIFoundation
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __IOSurface *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGColorSpace *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint32_t *v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint32_t oldState[2];
  uint32_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy_;
    v50 = __Block_byref_object_dispose_;
    *(_QWORD *)oldState = 0;
    v53 = oldState;
    v54 = 0x2050000000;
    v5 = (void *)getNURenderContextClass_softClass;
    v55 = getNURenderContextClass_softClass;
    v6 = MEMORY[0x24BDAC760];
    if (!getNURenderContextClass_softClass)
    {
      v40 = MEMORY[0x24BDAC760];
      v41 = 3221225472;
      v42 = (uint64_t)__getNURenderContextClass_block_invoke;
      v43 = (uint64_t (*)(uint64_t, uint64_t))&unk_25154B958;
      v44 = oldState;
      __getNURenderContextClass_block_invoke((uint64_t)&v40);
      v5 = (void *)*((_QWORD *)v53 + 3);
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(oldState, 8);
    v51 = (id)objc_msgSend([v7 alloc], "initWithPurpose:", 1);
    v40 = 0;
    v41 = (uint64_t)&v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = (uint32_t *)__Block_byref_object_dispose_;
    v45 = 0;
    v36[0] = v6;
    v36[1] = 3221225472;
    v36[2] = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke;
    v36[3] = &unk_25154BD48;
    v38 = &v40;
    v39 = &v46;
    v37 = v4;
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495151FC](v36);
    if (pui_determineProminentColorWithCompletion__onceToken != -1)
      dispatch_once(&pui_determineProminentColorWithCompletion__onceToken, &__block_literal_global_6);
    if (pui_determineProminentColorWithCompletion__compositionIdentifier && v47[5])
    {
      objc_msgSend(MEMORY[0x24BE74D38], "snapshotWorkloop");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "CIImage");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v10;

      if (!*(_QWORD *)(v41 + 40))
      {
        objc_msgSend(a1, "pui_wrappedIOSurface");
        v12 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          oldState[0] = 0;
          if (!IOSurfaceSetPurgeable(v12, 3u, oldState) && oldState[0])
          {
            v14 = (void *)MEMORY[0x24BDD1540];
            v60 = *MEMORY[0x24BDD0FD8];
            v61 = CFSTR("Image content is volatile. We are not going to do that.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v16);

LABEL_21:
            _Block_object_dispose(&v40, 8);

            _Block_object_dispose(&v46, 8);
            goto LABEL_22;
          }
          v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithIOSurface:", v13);
          v19 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = v18;

        }
        if (!*(_QWORD *)(v41 + 40))
        {
          v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCGImage:", objc_msgSend(objc_retainAutorelease(a1), "CGImage"));
          v21 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = v20;

          if (!*(_QWORD *)(v41 + 40))
          {
            v29 = (void *)MEMORY[0x24BDD1540];
            v58 = *MEMORY[0x24BDD0FD8];
            v59 = CFSTR("source image deallocated before prominent color analysis could be run.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v13);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v30);

            goto LABEL_21;
          }
        }
      }
      objc_msgSend(a1, "size");
      if (v23 == *MEMORY[0x24BDBF148] && v22 == *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        v56 = *MEMORY[0x24BDD0FD8];
        v57 = CFSTR("Image is of 0,0 size; there is no color to determine.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v13);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v25);

      }
      else
      {
        v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
        objc_msgSend(*(id *)(v41 + 40), "imageByColorMatchingWorkingSpaceToColorSpace:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(v41 + 40);
        *(_QWORD *)(v41 + 40) = v27;

        CGColorSpaceRelease(v26);
        v31[0] = v6;
        v31[1] = 3221225472;
        v31[2] = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_3;
        v31[3] = &unk_25154BE60;
        v34 = &v40;
        v33 = v8;
        v9 = v9;
        v32 = v9;
        v35 = &v46;
        dispatch_async(v9, v31);

        v13 = v33;
      }
      goto LABEL_21;
    }
    v17 = (void *)MEMORY[0x24BDD1540];
    v62 = *MEMORY[0x24BDD0FD8];
    v63[0] = CFSTR("PhotosImaging was unable to register schema information.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v13);
    goto LABEL_21;
  }
LABEL_22:

}

- (void)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24464E000, a1, a3, "Falling back to cropping/resizing on CPU", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24464E000, a1, a3, "Failed to create cropped IOSurface", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
