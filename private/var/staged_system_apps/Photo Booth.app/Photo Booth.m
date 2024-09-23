uint64_t start(int a1, char **a2)
{
  id v4;
  uint64_t v5;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = UIApplicationMain(a1, a2, 0, 0);

  return v5;
}

id sub_1000024F0(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_applyCorrectionTransformToEffectsView");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = objc_msgSend(UIApp, "statusBarOrientation");
  objc_msgSend(a2, "transitionDuration");
  return objc_msgSend(v4, "setOrientation:duration:", v5);
}

id sub_1000027D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

id sub_1000027E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void sub_100002BD8(uint64_t a1)
{
  id v2;
  id v3;
  __CVBuffer *v4;
  IOSurfaceRef IOSurface;
  id v6;
  id v7;
  int v8;
  id v9;
  NSNumber *v10;
  NSDictionary *v11;
  id v12;
  id v13;
  CGImage *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  IOSurfaceRef buffer;
  _QWORD block[5];
  _QWORD v25[5];
  CVBufferRef sourceBuffer;
  uint64_t v27;
  void *v28;

  v2 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "capturePhoto"), "fileDataRepresentation");
  sourceBuffer = 0;
  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", &off_100036468, kCMPhotoDecompressionOption_OutputPixelFormat);
  PFFigCreateCVPixelBufferFromImageData(v2, v3, &sourceBuffer);
  if (sourceBuffer)
  {
    v4 = (__CVBuffer *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "createRenderedCVPixelBufferWithBuffer:");
    CVBufferPropagateAttachments(sourceBuffer, v4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000030D0;
    block[3] = &unk_100034A48;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    buffer = 0;
    v22 = 0;
    IOSurface = CVPixelBufferGetIOSurface(v4);
    v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "metadata"), "mutableCopy");
    +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:](CAMCaptureMetadataUtilities, "removeUnwantedKeysForPersistenceFromMetadata:", v6);
    v7 = objc_msgSend(v6, "copy");

    v27 = kFigJPEGAppleQuality;
    v28 = &__kCFBooleanTrue;
    v8 = FigAspenCreateJPEGFromIOSurface(IOSurface, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1), &buffer, &v22);
    if (v8 || !buffer || v22 < 1)
    {
      v19 = os_log_create("com.apple.camera", "PhotoBooth");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10001D22C(v8, v19, v20);
    }
    else
    {
      v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v9, "setObject:forKey:", buffer, kPLCameraPhotoSurfaceKey);
      objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", IOSurfaceGetAllocSize(buffer)), kPLCameraPhotoSurfaceSizeKey);
      v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)+[DCIMImageWriter savedAssetTypeForPhotoBoothAsset](DCIMImageWriter, "savedAssetTypeForPhotoBoothAsset"));
      v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, kPLImageWriterSavedAssetType, 0);
      v12 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 48), "captureDevice"), objc_msgSend(*(id *)(a1 + 48), "captureOrientation"));
      v13 = objc_alloc_init((Class)CAMThumbnailGenerator);
      v14 = (CGImage *)objc_msgSend(v13, "newBGRAImageOfFormat:inOrientation:usingSurface:", +[DCIMAssetFormats masterThumbnailFormat](DCIMAssetFormats, "masterThumbnailFormat"), v12, IOSurface);
      v15 = objc_msgSend(v13, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:", +[DCIMAssetFormats masterThumbnailFormat](DCIMAssetFormats, "masterThumbnailFormat"), v12, IOSurface, 0);

      if (v14)
      {
        v16 = objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:imageOrientation:", v14, v12);
        CGImageRelease(v14);
        if (v16)
        {
          objc_msgSend(v9, "setObject:forKey:", v16, kPLCameraPhotoPreviewImageKey);

        }
      }
      if (v15)
      {
        objc_msgSend(v9, "setObject:forKey:", v15, kPLCameraPhotoPreviewJPEGDataKey);

      }
      v17 = os_log_create("com.apple.camera", "PhotoBooth");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Saving photo to PLAssetsSaver with PhotoBooth saved asset type", buf, 2u);
      }
      objc_msgSend(+[PLAssetsSaver sharedAssetsSaver](PLAssetsSaver, "sharedAssetsSaver"), "saveCameraImage:metadata:additionalProperties:diagnostics:previouslyPendingAsset:requestEnqueuedBlock:", v9, v7, v11, 0, 0, 0);
    }
    if (buffer)
      CFRelease(buffer);
    if (v4)
      CVPixelBufferRelease(v4);
    if (sourceBuffer)
      CVPixelBufferRelease(sourceBuffer);
  }
  else
  {
    v18 = os_log_create("com.apple.camera", "PhotoBooth");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10001D1EC(v18);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100003088;
    v25[3] = &unk_100034A48;
    v25[4] = *(_QWORD *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);
  }
}

id sub_100003088(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentImagesInflight:imageWriterQueueAvailable:", (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) - 1), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isCaptureAvailable"));
}

id sub_1000030D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentImagesInflight:imageWriterQueueAvailable:", (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) - 1), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isCaptureAvailable"));
}

void sub_1000036A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  if (objc_msgSend(UIApp, "applicationState") == (id)2)
    goto LABEL_9;
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v2 + 36) & 2) != 0)
    goto LABEL_5;
  if (objc_msgSend(*(id *)(v2 + 8), "mode") == (id)1)
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_5:
    objc_msgSend(*(id *)(v2 + 8), "renderViewWithInputBuffer:", *(_QWORD *)(a1 + 40));
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_WORD *)(v3 + 36);
  if ((v4 & 1) == 0)
  {
    *(_WORD *)(v3 + 36) = v4 | 1;
    v5 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v5 + 36) & 0x80) != 0)
      objc_msgSend(*(id *)(v5 + 24), "effectsControllerDidStartPreview:");
  }
LABEL_9:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

id sub_100003B50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSystemPreferredCameraChanged:", *(_QWORD *)(a1 + 40));
}

void sub_100003BD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000048C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

CMVideoDimensions sub_1000048E8(uint64_t a1, void *a2)
{
  CMVideoDimensions result;
  const opaqueCMFormatDescription *v5;
  uint64_t v6;

  result = (CMVideoDimensions)objc_msgSend(objc_msgSend(a2, "mediaType"), "isEqualToString:", AVMediaTypeVideo);
  if (result.width)
  {
    v5 = (const opaqueCMFormatDescription *)objc_msgSend(a2, "formatDescription");
    result = (CMVideoDimensions)CMFormatDescriptionGetMediaSubType(v5);
    if (result.width == 875704422)
    {
      result = CMVideoFormatDescriptionGetDimensions(v5);
      if ((double)result.width / (double)result.height < 1.38)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (*(_DWORD *)(v6 + 24) < result.width)
        {
          *(_DWORD *)(v6 + 24) = result.width;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result.height;
        }
      }
    }
  }
  return result;
}

id sub_100005538(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
}

CATransform3D *sub_100005CD4@<X0>(uint64_t a1@<X0>, CATransform3D *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  double x;
  double y;
  BOOL v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double width;
  double height;
  CGFloat v27;
  double Center;
  double v29;
  CGAffineTransform v31;
  CGAffineTransform m;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v34.origin.x = a7;
  v34.origin.y = a8;
  v34.size.width = a9;
  v34.size.height = a10;
  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  v41.size.height = a6;
  v20 = CGRectIntersectsRect(v34, v41);
  v21 = a10 != 0.0 && v20;
  if (v21 && a9 != 0.0)
    v22 = 52.0;
  else
    v22 = 22.0;
  v35.origin.x = CGPointZero.x;
  v35.origin.y = y;
  v35.size.width = a5;
  v35.size.height = a6;
  v36 = CGRectInset(v35, v22, v22);
  v23 = v36.origin.x;
  v24 = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  switch(a1)
  {
    case 0:
    case 1:
      x = CGRectGetMidX(v36);
      v37.origin.x = v23;
      v37.origin.y = v24;
      v37.size.width = width;
      v37.size.height = height;
      y = CGRectGetMaxY(v37);
      goto LABEL_9;
    case 2:
      x = CGRectGetMidX(v36);
      v38.origin.x = v23;
      v38.origin.y = v24;
      v38.size.width = width;
      v38.size.height = height;
      y = CGRectGetMinY(v38);
      v27 = 3.14159265;
      break;
    case 3:
      x = CGRectGetMinX(v36);
      v39.origin.x = v23;
      v39.origin.y = v24;
      v39.size.width = width;
      v39.size.height = height;
      y = CGRectGetMidY(v39);
      v27 = 1.57079633;
      break;
    case 4:
      x = CGRectGetMaxX(v36);
      v40.origin.x = v23;
      v40.origin.y = v24;
      v40.size.width = width;
      v40.size.height = height;
      y = CGRectGetMidY(v40);
      v27 = -1.57079633;
      break;
    default:
LABEL_9:
      v27 = 0.0;
      break;
  }
  Center = UIRectGetCenter(v23, v24, width, height);
  CGAffineTransformMakeTranslation(&v33, x - Center, y - v29);
  v31 = v33;
  CGAffineTransformRotate(&m, &v31, v27);
  v33 = m;
  return CATransform3DMakeAffineTransform(a2, &m);
}

double sub_1000064AC(uint64_t a1)
{
  double v2;

  -[UIScreen _referenceBounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_referenceBounds");
  return (double)(a1 % 3) * (ceil((v2 + -4.0) / 3.0) + 2.0) + 0.0;
}

id sub_100006898(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "animationDidStop");
  objc_msgSend(*(id *)(a1 + 40), "_setCurrentMode:", 0);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 40), "_fullScreenEffectLayer");
  objc_msgSend(v2, "setZPosition:", 200.0);
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "layer"), "addSublayer:", v2);
  +[CATransaction commit](CATransaction, "commit");
  return -[UIApplication endIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "endIgnoringInteractionEvents");
}

id sub_1000069A0(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double Center;
  double v15;
  _QWORD v17[7];

  objc_msgSend(*(id *)(a1 + 32), "_setCurrentMode:", 1);
  -[UIApplication beginIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "beginIgnoringInteractionEvents");
  v2 = objc_msgSend(*(id *)(a1 + 32), "_labelForEffectLayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.25);
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v3 = +[PhotoBoothApplication testingAnimationDelegate](PhotoBoothApplication, "testingAnimationDelegate");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006BA4;
  v17[3] = &unk_100034A98;
  v4 = *(_QWORD *)(a1 + 32);
  v17[4] = v3;
  v17[5] = v4;
  v17[6] = v2;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v17);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeFromSuperlayer");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  +[CATransaction commit](CATransaction, "commit");
  objc_msgSend(v2, "setBeginTime:", 0.166666667);
  LODWORD(v5) = 1.0;
  objc_msgSend(v2, "setOpacity:", v5);
  LODWORD(v6) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setOpacity:", v6);
  v7 = sub_1000064AC((uint64_t)objc_msgSend(*(id *)(a1 + 32), "_indexOfEffectLayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)));
  v9 = v8;
  v11 = v10;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  Center = UIRectGetCenter(v7, v13, v8, v10);
  objc_msgSend(v12, "convertPoint:toLayer:", objc_msgSend(*(id *)(a1 + 32), "layer"), Center, v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPosition:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setBounds:", 0.0, 0.0, v9, v11);
  +[CATransaction commit](CATransaction, "commit");
  return objc_msgSend(v3, "animationDidStart");
}

id sub_100006BA4(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "animationDidStop");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setZPosition:", 10.0);
  objc_msgSend(*(id *)(a1 + 48), "setZPosition:", 20.0);
  CAImageQueueFlush(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), v2);
  +[CATransaction commit](CATransaction, "commit");
  return -[UIApplication endIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "endIgnoringInteractionEvents");
}

id sub_100007540(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableUpdate");
}

id sub_100007B4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
}

id sub_100008664(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("inputOrientation"));
  return objc_msgSend(*(id *)(a1 + 48), "setAnimating:", 0);
}

void sub_1000092DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000092FC(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  _QWORD v11[5];

  v4 = PLPhysicalScreenScale();
  v5 = PUSizeScale(40.0, 40.0, v4);
  v7 = v6;
  v8 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v8, "setDeliveryMode:", 1);
  objc_msgSend(v8, "setResizeMode:", 1);
  v9 = objc_msgSend(*(id *)(a1 + 32), "asset");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000093F0;
  v11[3] = &unk_100034B58;
  v11[4] = a2;
  -[PHImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](+[PHImageManager defaultManager](PHImageManager, "defaultManager"), "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 1, v8, v11, v5, v7);
  return 0;
}

uint64_t sub_1000093F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", PHImageErrorKey);
  v6 = os_log_create("com.apple.photos", "Generic");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10001D2DC((uint64_t)v5, v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000094AC(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1000094BC(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class sub_1000094C8(uint64_t a1)
{
  Class result;

  sub_10000951C();
  result = objc_getClass("LPApplePhotosStatusMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001D364();
  qword_1000434E0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_10000951C()
{
  void *v0;
  __int128 v1;
  uint64_t v2;

  v0 = 0;
  if (!qword_1000434E8)
  {
    v1 = off_100034BC8;
    v2 = 0;
    qword_1000434E8 = _sl_dlopen(&v1, &v0);
  }
  if (!qword_1000434E8)
    sub_10001D3C8(&v0);
  if (v0)
    free(v0);
}

Class sub_1000095C0(uint64_t a1)
{
  Class result;

  sub_10000951C();
  result = objc_getClass("LPLinkMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001D42C();
  qword_1000434F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class sub_100009614(uint64_t a1)
{
  Class result;

  sub_10000951C();
  result = objc_getClass("LPImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001D490();
  qword_1000434F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

id sub_10000A60C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPortraitLayout:", (char *)objc_msgSend(UIApp, "statusBarOrientation") - 1 < (char *)2);
}

id sub_10000A648(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationDidStart");
}

id sub_10000A650(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationDidStop");
}

id sub_10000A78C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setToolbarItemsEnabled:", 0);
}

id sub_10000A798(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeFromSuperview");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setToolbarItemsEnabled:", 1);
  return objc_msgSend(UIApp, "finishedTest:extraResults:", objc_msgSend(UIApp, "_launchTestName"), 0);
}

id sub_10000AB50(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 0.0);
}

id sub_10000AC1C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 1.0);
}

void sub_10000AEDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000AF04(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10000AF14(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

_QWORD *sub_10000AF20(_QWORD *result, void *a2)
{
  _QWORD *v3;

  if (*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40))
  {
    v3 = result;
    result = objc_msgSend(objc_msgSend(a2, "uuid"), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40));
    if ((_DWORD)result)
    {
      *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 40) = a2;
      *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 40) = 0;
    }
  }
  return result;
}

id sub_10000AF84(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

double *sub_10000B050(double *result, unint64_t a2)
{
  double *v3;
  id v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (*((_QWORD *)result + 5) > a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(*((_QWORD *)result + 4) + 128), "objectAtIndex:", a2);
    result = (double *)objc_msgSend(*(id *)(*((_QWORD *)v3 + 4) + 16), "objectAtIndex:", a2);
    if (result)
    {
      v5 = result;
      v6 = v3[6];
      -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
      v8 = v6 * v7;
      v9 = v3[7];
      -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
      return (double *)objc_msgSend(v4, "setIconFromAsset:maxIconSizeInPixels:", v5, v8, v9 * v10);
    }
  }
  return result;
}

id sub_10000B614(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id sub_10000B620(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "animatePrinting:", 0);
}

id sub_10000B650(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePhotoShelfContentLayout");
  return objc_msgSend(*(id *)(a1 + 32), "scrollTileToVisible:animated:", *(_QWORD *)(a1 + 40), 0);
}

id sub_10000B67C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "animatePrinting:", 0);
}

void sub_10000B86C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000B898(_QWORD *result, unint64_t a2)
{
  _QWORD *v3;
  NSObject *v4;
  int v5;
  unint64_t v6;

  if (result[6] > a2)
  {
    v3 = result;
    v4 = os_log_create("com.apple.camera", "PhotoBooth");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing tile at index: %lu", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend((id)v3[4], "addObject:", objc_msgSend(*(id *)(v3[5] + 128), "objectAtIndex:", a2));
  }
  return result;
}

void sub_10000B97C(uint64_t a1)
{
  _BOOL4 v2;
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v2 = (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) & 4) == 0;
  v3 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = dbl_100027240[v2];
    v9 = *(_QWORD *)v23;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12))
        {
          v13 = *(_QWORD **)(a1 + 32);
          if (v12 == (void *)v13[17])
          {
            objc_msgSend(v13, "setHighlightedTile:", 0);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          }
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v15 = *(_QWORD *)(v14 + 24);
          if (v7 < v15)
            *(_QWORD *)(v14 + 24) = v15 - 1;
          v10 = v8 + v10;
          objc_msgSend(v12, "setAlpha:", 0.0);
          CGAffineTransformMakeScale(&v21, 0.5, 0.5);
          objc_msgSend(v12, "setTransform:", &v21);
        }
        else
        {
          objc_msgSend(v12, "center");
          objc_msgSend(v12, "setCenter:", v16 - v10);
          -[NSMutableArray addObject:](v3, "addObject:", v12);
          ++v7;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setTiles:", v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_updatePhotoShelfContentLayout");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != -1)
  {
    v17 = (char *)-[NSMutableArray count](v3, "count");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(_QWORD *)(v18 + 24);
    if (v19 >= (uint64_t)v17)
    {
      *(_QWORD *)(v18 + 24) = v17 - 1;
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    if (v19 == -1)
      v20 = 0;
    else
      v20 = -[NSMutableArray objectAtIndex:](v3, "objectAtIndex:");
    objc_msgSend(*(id *)(a1 + 32), "setHighlightedTile:", v20);
  }

}

void sub_10000BC04(uint64_t a1)
{
  NSAutoreleasePool *v2;
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  v2 = objc_opt_new(NSAutoreleasePool);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "tilesWereRemoved:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "makeObjectsPerformSelector:", "removeFromSuperview");
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "tiles"), "count");
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)v4[4];
    if (v5)
    {
      objc_msgSend(v5, "setPageCount:");
      v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visibleIndex");
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v6 == v7)
        objc_msgSend(v8, "reloadViewControllerAtIndex:", v9);
      else
        objc_msgSend(v8, "setVisibleIndex:animated:", v9, 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateSelectionLabel");
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v11 + 8) == 3)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v12 = *(void **)(v11 + 96);
        *(_QWORD *)(v11 + 96) = 0;
        v11 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(*(id *)(v11 + 40), "displayStackedViewsForItems:animated:", objc_msgSend((id)v11, "_selectedStackItems"), 1);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_msgSend(v12, "removeFromSuperview");

      }
    }
  }
  else
  {
    v10 = objc_msgSend(v4, "_photoShelfBackgroundView");
    objc_msgSend(*(id *)(a1 + 32), "setCurrentMode:animated:", 1, 1);
    objc_msgSend(*(id *)(a1 + 32), "_updatePhotoShelfContentLayout");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000BDD4;
    v13[3] = &unk_100034A48;
    v13[4] = v10;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.25);
  }

}

id sub_10000BDD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void sub_10000C218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000C538(uint64_t a1)
{
  PHPhotoLibrary *v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;

  v2 = +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C5C8;
  v5[3] = &unk_100034A48;
  v6 = *(_QWORD *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C604;
  v4[3] = &unk_100034D18;
  v4[4] = v6;
  return -[PHPhotoLibrary performChanges:completionHandler:](v2, "performChanges:completionHandler:", v5, v4);
}

id sub_10000C5C8(uint64_t a1)
{
  return +[PHAssetChangeRequest deleteAssets:](PHAssetChangeRequest, "deleteAssets:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectsAtIndexes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120)));
}

void sub_10000C604(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
}

void sub_10000C780(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
}

id sub_10000CA90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_confirmDeleteItems:showFromObject:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "indexOfObject:", *(_QWORD *)(a1 + 40))), *(_QWORD *)(a1 + 40));
}

void sub_10000CD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000CF70(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "uuid"));
}

id sub_10000D5E0(uint64_t a1)
{
  id result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  if (result)
  {
    v3 = result;

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = objc_msgSend(v3, "fetchResultAfterChanges");
    objc_msgSend(*(id *)(a1 + 40), "_removeTilesAtIndices:animated:", objc_msgSend(v3, "removedIndexes"), 1);
    objc_msgSend(*(id *)(a1 + 40), "_addTilesForPhotos:animated:", objc_msgSend(v3, "insertedObjects"), 1);
    return objc_msgSend(*(id *)(a1 + 40), "_reloadTilesAtIndices:", objc_msgSend(v3, "changedIndexes"));
  }
  return result;
}

void sub_10000E118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000EA14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id sub_10000EC4C(uint64_t a1)
{
  return objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "view"), "setAlpha:", 0.0);
}

id sub_10000EC68(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "viewWillDisappear:", 0);
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "view"), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "viewDidDisappear:", 0);
}

id sub_10000EE30(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  return objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "view"), "setHidden:", 1);
}

void sub_10000EF88(uint64_t a1)
{
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "_stackContainerView"), "removeFromSuperview");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
}

id sub_10000F32C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "popoverControllerDidDismissPopover:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344));
}

id sub_10000FE20(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(objc_msgSend(a2, "uuid"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

void sub_100010398(id a1)
{
  dword_100043500 = MGGetSInt32Answer(CFSTR("FrontCameraRotationForISP"), 0);
}

void sub_100010E40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000123E4(uint64_t a1)
{
  CAKeyframeAnimation *v2;
  double v3;
  NSNumber *v4;
  double v5;
  NSNumber *v6;
  double v7;
  NSNumber *v8;
  double v9;
  double v10;
  NSNumber *v11;
  double v12;
  NSNumber *v13;
  double v14;
  NSNumber *v15;
  double v16;

  v2 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CAKeyframeAnimation setDuration:](v2, "setDuration:", 2.11);
  LODWORD(v3) = 0;
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3);
  LODWORD(v5) = 1.0;
  v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  LODWORD(v7) = 1.0;
  v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7);
  LODWORD(v9) = 0;
  -[CAKeyframeAnimation setValues:](v2, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v6, v8, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), 0));
  LODWORD(v10) = 0;
  v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10);
  LODWORD(v12) = 0.25;
  v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12);
  LODWORD(v14) = 0.75;
  v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14);
  LODWORD(v16) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v2, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, v13, v15, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16), 0));
  -[CAKeyframeAnimation setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CAKeyframeAnimation setValue:forKey:](v2, "setValue:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1), CFSTR("animationID"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addAnimation:forKey:", v2, CFSTR("opacity"));
}

id sub_10001255C(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setOpacity:", a2);
}

id sub_100012574(uint64_t a1)
{
  NSMutableArray *v2;
  NSMutableArray *v3;
  uint64_t i;
  double v5;
  double v6;
  double v7;
  id v8;

  if (!qword_100043558)
  {
    v2 = objc_opt_new(NSMutableArray);
    v3 = objc_opt_new(NSMutableArray);
    for (i = 0; i != 128; i += 16)
    {
      v5 = (*(double *)((char *)&unk_100027338 + i) + -1.0) / 1.57;
      v6 = *(double *)((char *)&unk_100027338 + i + 8) + -114.0;
      *(float *)&v5 = v5;
      -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
      *(float *)&v7 = v6;
      -[NSMutableArray addObject:](v2, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    }
    qword_100043558 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.translation.y"));
    objc_msgSend((id)qword_100043558, "setDuration:", 1.57);
    objc_msgSend((id)qword_100043558, "setValues:", v2);
    objc_msgSend((id)qword_100043558, "setKeyTimes:", v3);

  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "layer");
  return objc_msgSend(v8, "addAnimation:forKey:", qword_100043558, CFSTR("transform.translation.y"));
}

id sub_1000126AC(uint64_t a1)
{
  id v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return objc_msgSend(v1, "setAffineTransform:", v4);
}

id sub_1000126EC(uint64_t a1)
{
  CAKeyframeAnimation *v2;
  double v3;
  NSNumber *v4;
  double v5;
  NSNumber *v6;
  double v7;

  v2 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CAKeyframeAnimation setDuration:](v2, "setDuration:", 1.4);
  LODWORD(v3) = 0;
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3);
  LODWORD(v5) = 1.0;
  v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  LODWORD(v7) = 0;
  -[CAKeyframeAnimation setValues:](v2, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v6, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), 0));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addAnimation:forKey:", v2, CFSTR("opacity"));
}

id sub_1000127C0(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setOpacity:", a2);
}

id sub_1000127D8(_QWORD *a1)
{
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, a1[4], a1[5], 2.11, 0.66);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, a1[6], a1[7], 1.57, 1.0);
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, a1[8], a1[9], 1.4, 1.17);
}

uint64_t sub_100015200(void *a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "stackIndex");
  v4 = v3;
  objc_msgSend(a2, "stackIndex");
  if (v4 < v5)
    return -1;
  else
    return v4 > v5;
}

float sub_1000162A8(float a1, float a2, float a3)
{
  return (float)((float)(1.0 - a3) * a1) + (float)(a3 * a2);
}

float sub_1000162BC(float result, float a2, float a3)
{
  if (a3 <= a2)
    a2 = a3;
  if (a3 >= result)
    return a2;
  return result;
}

uint64_t sub_100019CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CAImageQueueDeleteBuffer(a3);
}

void sub_10001AE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001AEA8(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001AF48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001AFA8(uint64_t result, __IOSurface *a2)
{
  uint64_t v3;
  CVReturn v4;
  CVPixelBufferRef pixelBufferOut;

  if (a2)
  {
    v3 = result;
    pixelBufferOut = 0;
    v4 = CVPixelBufferCreateWithIOSurface(0, a2, 0, &pixelBufferOut);
    CFRelease(a2);
    if (v4)
      NSLog(CFSTR("Failed to create CVPixelBuffer from IOSurface."));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

void sub_10001B7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B814(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10001B824(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_10001B830(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTestName:", 0);
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "rotateIfNeeded:", 1);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_10001BD74(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedAnimationTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "toggleCamera:", *(_QWORD *)(a1 + 32));
}

void sub_10001BDA4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_ensureEffectsView:mode:", *(_QWORD *)(a1 + 40), 1);
  v2 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BE34;
  block[3] = &unk_100034A98;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001BE34(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedAnimationTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "toggleEffectsMode:", *(_QWORD *)(a1 + 32));
}

id sub_10001BE64(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedAnimationTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "toggleEffectsMode:", *(_QWORD *)(a1 + 32));
}

void sub_10001BE94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD block[4];
  __int128 v6;
  uint64_t v7;

  -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
  v3 = v2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isShelfVisible") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "showShelf:", 0);
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BF58;
  block[3] = &unk_100034F80;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001BF58(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "photoShelf");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTestName:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(v2, "_performScrollTest:iterations:delta:scrollAxis:", *(_QWORD *)(a1 + 40), 5, (int)*(double *)(a1 + 48), 1);
}

id sub_10001BFB0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedAnimationTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "rotateIfNeeded:", 3);
}

void sub_10001BFE0(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "selectFirstShelfAsset");
  v2 = dispatch_time(0, 2000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C070;
  v3[3] = &unk_100034AE8;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

id sub_10001C070(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C0E0;
  v5[3] = &unk_100034A48;
  v5[4] = v2;
  objc_msgSend(v2, "startedAnimationTest:cleanupBlock:", v3, v5);
  return objc_msgSend(*(id *)(a1 + 32), "rotateIfNeeded:", 3);
}

id sub_10001C0E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hideShelf:", 0);
}

void sub_10001C13C(id a1)
{
  qword_100043568 = (uint64_t)objc_alloc_init((Class)UIButton);
  objc_msgSend((id)qword_100043568, "setEnabled:", 1);
}

id sub_10001C248(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureMinimumShelfAssetCount:thenRun:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_10001D168(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = objc_msgSend(*a1, "localizedDescription");
  v5 = 138543362;
  v6 = v3;
  sub_100003BD8((void *)&_mh_execute_header, a2, v4, "Error while attempting to capture a still image: %{public}@", (uint8_t *)&v5);
}

void sub_10001D1EC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received nil fullsize pixel buffer!", v1, 2u);
}

void sub_10001D22C(int a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100003BD8((void *)&_mh_execute_header, a2, a3, "Error while encoding JPEG: %ld", (uint8_t *)&v3);
}

void sub_10001D29C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "effectsPreviewSampleBuffer was dropped", v1, 2u);
}

void sub_10001D2DC(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[PBLinkPresentationActivityItemProvider _linkMetadata]_block_invoke_2";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10001D364()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLPApplePhotosStatusMetadataClass(void)_block_invoke"), CFSTR("PBLinkPresentationActivityItemProvider.m"), 28, CFSTR("Unable to find class %s"), "LPApplePhotosStatusMetadata");
  __break(1u);
}

void sub_10001D3C8(_QWORD *a1)
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *LinkPresentationLibrary(void)"), CFSTR("PBLinkPresentationActivityItemProvider.m"), 24, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_10001D42C()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLPLinkMetadataClass(void)_block_invoke"), CFSTR("PBLinkPresentationActivityItemProvider.m"), 26, CFSTR("Unable to find class %s"), "LPLinkMetadata");
  __break(1u);
}

void sub_10001D490()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLPImageClass(void)_block_invoke"), CFSTR("PBLinkPresentationActivityItemProvider.m"), 27, CFSTR("Unable to find class %s"), "LPImage");
  __break(1u);
}

void sub_10001D4F4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Animating multiple added photos is not implemented.", v1, 2u);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend__addEffectGestureRecognizers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEffectGestureRecognizers");
}

id objc_msgSend__addStackElementView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStackElementView:");
}

id objc_msgSend__addTilesForPhotos_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTilesForPhotos:animated:");
}

id objc_msgSend__applyCorrectionTransformToEffectsView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyCorrectionTransformToEffectsView");
}

id objc_msgSend__bottomSafeAreaInsetRectForOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bottomSafeAreaInsetRectForOrientation:");
}

id objc_msgSend__buttonWithSystemImageNamed_touchUpInsideAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buttonWithSystemImageNamed:touchUpInsideAction:");
}

id objc_msgSend__cancelBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelBarButtonItem");
}

id objc_msgSend__captureBarButtonItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_captureBarButtonItems");
}

id objc_msgSend__captureDeviceWithPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_captureDeviceWithPosition:");
}

id objc_msgSend__centerOfTileAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_centerOfTileAtIndex:");
}

id objc_msgSend__commonPBBottomBarInitialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commonPBBottomBarInitialization");
}

id objc_msgSend__copyAssetsToPasteboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAssetsToPasteboard:");
}

id objc_msgSend__correctionTransformForOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_correctionTransformForOrientation:");
}

id objc_msgSend__createPixelBuffer_withSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPixelBuffer:withSize:");
}

id objc_msgSend__createPixelBufferPools(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPixelBufferPools");
}

id objc_msgSend__currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentDevice");
}

id objc_msgSend__currentDevicePosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentDevicePosition");
}

id objc_msgSend__currentGraphConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentGraphConfiguration");
}

id objc_msgSend__dayFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dayFormatter");
}

id objc_msgSend__deleteBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteBarButtonItem");
}

id objc_msgSend__didObserveExternalSystemPreferredCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didObserveExternalSystemPreferredCamera");
}

id objc_msgSend__dismissPopovers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPopovers");
}

id objc_msgSend__displayFullScreenEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_displayFullScreenEffect:");
}

id objc_msgSend__editBarButtonItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_editBarButtonItems");
}

id objc_msgSend__effectLayerAtLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectLayerAtLocation:");
}

id objc_msgSend__effectiveLocationForLocationInView_inAspectFillViewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectiveLocationForLocationInView:inAspectFillViewSize:");
}

id objc_msgSend__effectiveRenderSizeForAspectFillViewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_effectiveRenderSizeForAspectFillViewSize:");
}

id objc_msgSend__ensureEffectsView_mode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ensureEffectsView:mode:");
}

id objc_msgSend__ensureMinimumShelfAssetCount_thenRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ensureMinimumShelfAssetCount:thenRun:");
}

id objc_msgSend__filterBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterBarButtonItem");
}

id objc_msgSend__filterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterButton");
}

id objc_msgSend__filterWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterWithName:");
}

id objc_msgSend__filters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filters");
}

id objc_msgSend__flipBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_flipBarButtonItem");
}

id objc_msgSend__flipButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_flipButton");
}

id objc_msgSend__frameOfBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frameOfBarButtonItem:");
}

id objc_msgSend__frontCaptureDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frontCaptureDevice");
}

id objc_msgSend__fullScreenEffectLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fullScreenEffectLayer");
}

id objc_msgSend__graphConfigurationForChangeToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_graphConfigurationForChangeToDevice:");
}

id objc_msgSend__hasActionsForControlEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasActionsForControlEvent:");
}

id objc_msgSend__indexOfEffectLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_indexOfEffectLayer:");
}

id objc_msgSend__initializeImageSizes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeImageSizes");
}

id objc_msgSend__initializeStackRootView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeStackRootView");
}

id objc_msgSend__isFrontCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isFrontCamera");
}

id objc_msgSend__labelForEffectLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_labelForEffectLayer:");
}

id objc_msgSend__launchTestName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchTestName");
}

id objc_msgSend__layerWithEffectName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layerWithEffectName:");
}

id objc_msgSend__motionController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_motionController");
}

id objc_msgSend__newStackTileForPhoto_withFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newStackTileForPhoto:withFrame:");
}

id objc_msgSend__normalizedAspectFillContentsRectForContentsSize_viewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_normalizedAspectFillContentsRectForContentsSize:viewSize:");
}

id objc_msgSend__pauseSelectionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pauseSelectionMode");
}

id objc_msgSend__performDidEndZoomBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performDidEndZoomBlock");
}

id objc_msgSend__photoShelfBackgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photoShelfBackgroundView");
}

id objc_msgSend__photoSizeForCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photoSizeForCaptureDevice:");
}

id objc_msgSend__prepareForPrintAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareForPrintAnimation");
}

id objc_msgSend__reconfigureCameraForDevicePosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reconfigureCameraForDevicePosition:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__reloadPhotos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadPhotos:");
}

id objc_msgSend__reloadTiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadTiles");
}

id objc_msgSend__removeAllNamedBlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAllNamedBlocks");
}

id objc_msgSend__removeEffectGestureRecognizers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeEffectGestureRecognizers");
}

id objc_msgSend__removeStackElementView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeStackElementView:");
}

id objc_msgSend__removeTilesAtIndices_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeTilesAtIndices:animated:");
}

id objc_msgSend__resetFilterDefaultsHonorDeviceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetFilterDefaultsHonorDeviceOrientation:");
}

id objc_msgSend__resumeSelectionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeSelectionMode");
}

id objc_msgSend__rotateFiltersUsingOrientation_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rotateFiltersUsingOrientation:duration:");
}

id objc_msgSend__rotationAngleForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rotationAngleForDeviceOrientation:");
}

id objc_msgSend__sampleBuffersSizeForDevicePosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sampleBuffersSizeForDevicePosition:");
}

id objc_msgSend__selectedPhotos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectedPhotos");
}

id objc_msgSend__selectedStackItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectedStackItems");
}

id objc_msgSend__selectionBarButtonItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectionBarButtonItems");
}

id objc_msgSend__selectionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectionLabel");
}

id objc_msgSend__selectionLabelBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectionLabelBarButtonItem");
}

id objc_msgSend__setCurrentEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentEffect:");
}

id objc_msgSend__setCurrentGraphConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentGraphConfiguration:");
}

id objc_msgSend__setCurrentImagesInflight_imageWriterQueueAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentImagesInflight:imageWriterQueueAvailable:");
}

id objc_msgSend__setCurrentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentMode:");
}

id objc_msgSend__setDidEndScrollingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDidEndScrollingBlock:");
}

id objc_msgSend__setDidObserveExternalSystemPreferredCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDidObserveExternalSystemPreferredCamera:");
}

id objc_msgSend__setDidStopStackingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDidStopStackingBlock:");
}

id objc_msgSend__setHidesShadow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHidesShadow:");
}

id objc_msgSend__setImageQueueDimensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setImageQueueDimensions:");
}

id objc_msgSend__setShouldUseSystemPreferredCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldUseSystemPreferredCamera:");
}

id objc_msgSend__setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setStyle:");
}

id objc_msgSend__setSwitchingCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSwitchingCamera:");
}

id objc_msgSend__setTiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTiles:");
}

id objc_msgSend__setToolbarItemsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setToolbarItemsEnabled:");
}

id objc_msgSend__setUpContextWithFilters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUpContextWithFilters");
}

id objc_msgSend__setUpCurtainAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUpCurtainAnimation:");
}

id objc_msgSend__setUpEffectLayers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUpEffectLayers");
}

id objc_msgSend__setupAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupAssets");
}

id objc_msgSend__shareBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shareBarButtonItem");
}

id objc_msgSend__shouldResetEffects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldResetEffects");
}

id objc_msgSend__shouldUseSystemPreferredCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldUseSystemPreferredCamera");
}

id objc_msgSend__shutterBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shutterBarButtonItem");
}

id objc_msgSend__shutterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shutterButton");
}

id objc_msgSend__stackContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackContainerView");
}

id objc_msgSend__startObservingForPhotoLibraryNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startObservingForPhotoLibraryNotifications");
}

id objc_msgSend__startSelectionModeAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startSelectionModeAnimated:");
}

id objc_msgSend__stillImageCaptureRequestForPhotoBooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stillImageCaptureRequestForPhotoBooth");
}

id objc_msgSend__stopCaptureModeAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopCaptureModeAnimated:");
}

id objc_msgSend__stopEditModeAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopEditModeAnimated:");
}

id objc_msgSend__stopObservingForPhotoLibraryNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopObservingForPhotoLibraryNotifications");
}

id objc_msgSend__stopSelectionModeAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopSelectionModeAnimated:");
}

id objc_msgSend__testZoomScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_testZoomScale:");
}

id objc_msgSend__tileForPhoto_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tileForPhoto:");
}

id objc_msgSend__updateHighlightedTile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHighlightedTile");
}

id objc_msgSend__updateLabelViewLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLabelViewLocation");
}

id objc_msgSend__updateLastActiveDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLastActiveDate");
}

id objc_msgSend__updatePhotoShelfContentLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePhotoShelfContentLayout");
}

id objc_msgSend__updatePositionAndTransformForTextLayer_inFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePositionAndTransformForTextLayer:inFrame:");
}

id objc_msgSend__updatePrintAnimationLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePrintAnimationLayout");
}

id objc_msgSend__updateSelectionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSelectionLabel");
}

id objc_msgSend__updateStackContainerLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStackContainerLayout");
}

id objc_msgSend__updateVisiblePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateVisiblePhoto");
}

id objc_msgSend__visibleTileController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_visibleTileController");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addBlockNamed_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBlockNamed:block:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addStackedItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStackedItem:");
}

id objc_msgSend_addStackedView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStackedView:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_adjustedInputOrientation_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedInputOrientation:mirrored:");
}

id objc_msgSend_adjustedInputPoint_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedInputPoint:mirrored:");
}

id objc_msgSend_adjustedInputRotation_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedInputRotation:mirrored:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allTargets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allTargets");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowAbsoluteGestures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowAbsoluteGestures");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alpha");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateStateTransitions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateStateTransitions");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animateWithStyle_didStartBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithStyle:didStartBlock:completionBlock:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animation");
}

id objc_msgSend_animationDidStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationDidStart");
}

id objc_msgSend_animationDidStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationDidStop");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applyFilter_toSurface_mirrored_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyFilter:toSurface:mirrored:resultHandler:");
}

id objc_msgSend_applyFilter_toSurface_mirrored_surfaceResultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyFilter:toSurface:mirrored:surfaceResultHandler:");
}

id objc_msgSend_applyParametersToCIFilter_extent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyParametersToCIFilter:extent:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areAnimationsEnabled");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asset");
}

id objc_msgSend_backdropViewGroupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backdropViewGroupName");
}

id objc_msgSend_backgroundImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundImage");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "begin");
}

id objc_msgSend_beginAnimationToState_withDuration_beginsFromCurrentState_didStopSelector_context_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:");
}

id objc_msgSend_beginAnimations_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAnimations:context:");
}

id objc_msgSend_beginDisablingInterfaceAutorotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginDisablingInterfaceAutorotation");
}

id objc_msgSend_beginIgnoringInteractionEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginIgnoringInteractionEvents");
}

id objc_msgSend_beginRevealAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginRevealAnimation");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_canTakePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canTakePhoto");
}

id objc_msgSend_cancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilities");
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDevice");
}

id objc_msgSend_captureGraphConfigurationUsingConfiguration_outputToExternalStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:");
}

id objc_msgSend_captureOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureOrientation");
}

id objc_msgSend_capturePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capturePhoto");
}

id objc_msgSend_captureSnapshotOfView_withSnapshotType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureSnapshotOfView:withSnapshotType:");
}

id objc_msgSend_captureStillImageWithRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStillImageWithRequest:error:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_centroid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centroid");
}

id objc_msgSend_changeDetailsForFetchResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeDetailsForFetchResult:");
}

id objc_msgSend_changedIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedIndexes");
}

id objc_msgSend_ciContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ciContext");
}

id objc_msgSend_ciFilterName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ciFilterName");
}

id objc_msgSend_classDescriptionForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classDescriptionForClass:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorWithPatternImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithPatternImage:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_commitAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitAnimation");
}

id objc_msgSend_commitAnimations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitAnimations");
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithScale:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsPoint:");
}

id objc_msgSend_containsStackElement_isTopElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsStackElement:isTopElement:");
}

id objc_msgSend_contextWithEAGLContext_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWithEAGLContext:options:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_toLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPoint:toLayer:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_cornerAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cornerAtPoint:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createOutputImage_mirrored_size_renderForSave_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOutputImage:mirrored:size:renderForSave:");
}

id objc_msgSend_createRenderedCVPixelBufferWithBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRenderedCVPixelBufferWithBuffer:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_currentFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFilter");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentTestName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTestName");
}

id objc_msgSend_currentTestRequestsShelfSuppression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTestRequestsShelfSuppression");
}

id objc_msgSend_curtainImageWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "curtainImageWithStyle:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultFormatChooser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultFormatChooser");
}

id objc_msgSend_defaultHeightForBottomBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultHeightForBottomBar");
}

id objc_msgSend_defaultItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultItem");
}

id objc_msgSend_defaultItemForStackController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultItemForStackController:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultViewForStackController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultViewForStackController:");
}

id objc_msgSend_defaultZoomFactorForMode_device_videoConfiguration_captureOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deselectAllTiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectAllTiles");
}

id objc_msgSend_deselectTile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectTile:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_devicesWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicesWithMediaType:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dimmingColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dimmingColor");
}

id objc_msgSend_disableUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUpdate");
}

id objc_msgSend_dismissPopoverAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPopoverAnimated:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayStackedViewsForItems_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayStackedViewsForItems:animated:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dummyButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dummyButton");
}

id objc_msgSend_effectsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsController");
}

id objc_msgSend_effectsControllerCaptureSessionDidStartRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsControllerCaptureSessionDidStartRunning");
}

id objc_msgSend_effectsControllerCaptureSessionDidStopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsControllerCaptureSessionDidStopRunning");
}

id objc_msgSend_effectsControllerDidStartPreview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsControllerDidStartPreview:");
}

id objc_msgSend_effectsView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsView");
}

id objc_msgSend_effectsView_willChangeMode_toMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectsView:willChangeMode:toMode:");
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTransaction");
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateObjectsAtIndexes_options_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extent");
}

id objc_msgSend_externalApplicationExcludedPhotosActivityTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalApplicationExcludedPhotosActivityTypes");
}

id objc_msgSend_fadeInUnderneathStack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeInUnderneathStack:");
}

id objc_msgSend_fadeOutUnderneathStack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeOutUnderneathStack:");
}

id objc_msgSend_fetchAssetCollectionsContainingAssets_withType_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetCollectionsContainingAssets:withType:options:");
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithOptions:");
}

id objc_msgSend_fetchResultAfterChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchResultAfterChanges");
}

id objc_msgSend_fileDataRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDataRepresentation");
}

id objc_msgSend_filterButtonWithLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterButtonWithLayoutStyle:");
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithName:");
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedSubTest:forTest:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flipAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipAppearance:");
}

id objc_msgSend_flipButtonWithLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipButtonWithLayoutStyle:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_floatValueForKeyIfSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValueForKeyIfSupported:");
}

id objc_msgSend_formatDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatDescription");
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formats");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_fullsizeTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullsizeTransform");
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleGestureAtLocations:count:translation:viewSize:stateBegan:mirror:");
}

id objc_msgSend_handleTapGesture_viewSize_mirror_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTapGesture:viewSize:mirror:");
}

id objc_msgSend_hasShakeMotion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasShakeMotion");
}

id objc_msgSend_hide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hide:");
}

id objc_msgSend_hideShelf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideShelf:");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageByApplyingCGOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingCGOrientation:");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_imageByApplyingTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingTransform:");
}

id objc_msgSend_imageByCroppingToRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByCroppingToRect:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageOrientation");
}

id objc_msgSend_imageOrientationOfResult_withCaptureDevice_captureOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageOrientationOfResult:withCaptureDevice:captureOrientation:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithTexture_size_flipped_colorSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithTexture:size:flipped:colorSpace:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_indexOfViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfViewController:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_inflightImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inflightImage");
}

id objc_msgSend_initForPhotoBoothWithCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForPhotoBoothWithCaptureDevice:");
}

id objc_msgSend_initWithAPI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAPI:");
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsset:");
}

id objc_msgSend_initWithAssetItems_photosApplicationActivities_linkPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetItems:photosApplicationActivities:linkPresentation:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCGImage_imageOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCGImage:imageOrientation:");
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCGImage:scale:orientation:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCaptureConfiguration_zoomFactor_outputToExternalStorage_engineOptions_locationController_motionController_burstController_protectionController_powerController_irisVideoController_remoteShutterController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:");
}

id objc_msgSend_initWithClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClass:");
}

id objc_msgSend_initWithContentRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentRect:");
}

id objc_msgSend_initWithContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentViewController:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_effectNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:effectNamed:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithItem_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItem:state:");
}

id objc_msgSend_initWithItemProvider_properties_placeholderImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemProvider:properties:placeholderImage:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithPhoto_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhoto:");
}

id objc_msgSend_initWithPreset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPreset:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRed:green:blue:alpha:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithStackElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStackElements:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initializeState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeState");
}

id objc_msgSend_innerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "innerView");
}

id objc_msgSend_innerViewCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "innerViewCreateIfNeeded:");
}

id objc_msgSend_inputAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputAmount");
}

id objc_msgSend_inputKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputKeys");
}

id objc_msgSend_inputOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputOrientation");
}

id objc_msgSend_inputPixelBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputPixelBuffer");
}

id objc_msgSend_inputPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputPoint");
}

id objc_msgSend_inputRotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputRotation");
}

id objc_msgSend_inputTexture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputTexture");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_insertedObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertedObjects");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateController");
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnimating");
}

id objc_msgSend_isAnyStackElementBeingStacked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnyStackElementBeingStacked");
}

id objc_msgSend_isCaptureAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCaptureAvailable");
}

id objc_msgSend_isDataAvailableForStackElement_loadIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataAvailableForStackElement:loadIfNeeded:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInFlight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInFlight");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isMenuVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMenuVisible");
}

id objc_msgSend_isRevealing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRevealing");
}

id objc_msgSend_isRunningTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningTest");
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSelected");
}

id objc_msgSend_isShelfVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShelfVisible");
}

id objc_msgSend_isStatusBarHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStatusBarHidden");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isTouchInside(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTouchInside");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVisible");
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isZooming");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "item");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_itemsForAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemsForAssets:");
}

id objc_msgSend_itemsToDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemsToDisplay");
}

id objc_msgSend_keyForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyForItem:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutContentView:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_locationOfTouch_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationOfTouch:inView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainWindow");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_maskForPhotoBoothAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maskForPhotoBoothAsset");
}

id objc_msgSend_masterThumbnailFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "masterThumbnailFormat");
}

id objc_msgSend_maximumZoomScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumZoomScale");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_moveIntoStack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveIntoStack:");
}

id objc_msgSend_moveOutFromStack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveOutFromStack:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsWrapMirror(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsWrapMirror");
}

id objc_msgSend_newBGRAImageOfFormat_inOrientation_usingSurface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBGRAImageOfFormat:inOrientation:usingSurface:");
}

id objc_msgSend_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:");
}

id objc_msgSend_nextState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextState");
}

id objc_msgSend_notifyWhenInteractionEndsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhenInteractionEndsUsingBlock:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfTouches");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_offscreenTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offscreenTransform");
}

id objc_msgSend_onStackTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onStackTransform");
}

id objc_msgSend_openGLContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openGLContext:");
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orderedStackedElementsAboveStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedStackedElementsAboveStackElement:");
}

id objc_msgSend_orderedStackedElementsWithOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedStackedElementsWithOrientation:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientation");
}

id objc_msgSend_outerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outerView");
}

id objc_msgSend_outerViewCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outerViewCreateIfNeeded:");
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputImage");
}

id objc_msgSend_outputPixelBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputPixelBuffer");
}

id objc_msgSend_outputSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputSize");
}

id objc_msgSend_outputTexture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputTexture");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChanges:completionHandler:");
}

id objc_msgSend_photoShelf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoShelf");
}

id objc_msgSend_pl_adjustIndexesForDeletions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pl_adjustIndexesForDeletions:");
}

id objc_msgSend_pl_managedAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pl_managedAsset");
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointInside:withEvent:");
}

id objc_msgSend_pointValueForKeyIfSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointValueForKeyIfSupported:");
}

id objc_msgSend_popoverControllerDidDismissPopover_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popoverControllerDidDismissPopover:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "position");
}

id objc_msgSend_ppt_simulateEffectLayerTap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ppt_simulateEffectLayerTap:");
}

id objc_msgSend_predicateForIncludeMask_useIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForIncludeMask:useIndex:");
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFrameSize");
}

id objc_msgSend_preloadFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preloadFilter:");
}

id objc_msgSend_presentPopoverFromBarButtonItem_permittedArrowDirections_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationLayer");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousState");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_registerCaptureService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCaptureService:");
}

id objc_msgSend_registerEffectsPreviewSampleBufferDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEffectsPreviewSampleBufferDelegate:");
}

id objc_msgSend_registerObjectOfClass_visibility_loadHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObjectOfClass:visibility:loadHandler:");
}

id objc_msgSend_reloadViewControllerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadViewControllerAtIndex:");
}

id objc_msgSend_removeAllGestureRecognizers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllGestureRecognizers");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAnimationForKey:");
}

id objc_msgSend_removeDimmingFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDimmingFilter");
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperlayer");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIndex:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removePersistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersistentDomainForName:");
}

id objc_msgSend_removeStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStackElement:");
}

id objc_msgSend_removeStackedView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStackedView:");
}

id objc_msgSend_removeStackedViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStackedViews:");
}

id objc_msgSend_removeTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTarget:action:");
}

id objc_msgSend_removeUnwantedKeysForPersistenceFromMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUnwantedKeysForPersistenceFromMetadata:");
}

id objc_msgSend_removeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeView");
}

id objc_msgSend_removedIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removedIndexes");
}

id objc_msgSend_render9Up(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "render9Up");
}

id objc_msgSend_render_toTexture_bounds_colorSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "render:toTexture:bounds:colorSpace:");
}

id objc_msgSend_renderFilter_inputPixelBuffer_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderFilter:inputPixelBuffer:mirrored:");
}

id objc_msgSend_renderForSave(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderForSave");
}

id objc_msgSend_renderNineUp_inputPixelBuffer_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderNineUp:inputPixelBuffer:mirrored:");
}

id objc_msgSend_renderViewWithInputBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderViewWithInputBuffer:");
}

id objc_msgSend_renderWithContext_inputSize_outputRect_mirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderWithContext:inputSize:outputRect:mirrored:");
}

id objc_msgSend_requestImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestImageForAsset:targetSize:contentMode:options:resultHandler:");
}

id objc_msgSend_requireGestureRecognizerToFail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireGestureRecognizerToFail:");
}

id objc_msgSend_resetEffects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetEffects:");
}

id objc_msgSend_resetInputImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetInputImage");
}

id objc_msgSend_resetQueueDimensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetQueueDimensions");
}

id objc_msgSend_resume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume:");
}

id objc_msgSend_revealGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revealGroup");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rotateIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotateIfNeeded:");
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotation");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_saveCameraImage_metadata_additionalProperties_diagnostics_previouslyPendingAsset_requestEnqueuedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCameraImage:metadata:additionalProperties:diagnostics:previouslyPendingAsset:requestEnqueuedBlock:");
}

id objc_msgSend_savedAssetTypeForPhotoBoothAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savedAssetTypeForPhotoBoothAsset");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scrollRectToVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollRectToVisible:animated:");
}

id objc_msgSend_scrollTileToVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollTileToVisible:animated:");
}

id objc_msgSend_selectFirstShelfAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectFirstShelfAsset");
}

id objc_msgSend_selectTile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectTile:");
}

id objc_msgSend_selectedTiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedTiles");
}

id objc_msgSend_selectionBadgeImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectionBadgeImage");
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendActionsForControlEvents:");
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnimateStateTransitions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimateStateTransitions:");
}

id objc_msgSend_setAnimating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimating:");
}

id objc_msgSend_setAnimationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationDelay:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationTimingFunction:");
}

id objc_msgSend_setAnimations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimations:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCachesInputImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachesInputImage:");
}

id objc_msgSend_setCalculationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalculationMode:");
}

id objc_msgSend_setCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDevice:");
}

id objc_msgSend_setCaptureMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureMode:");
}

id objc_msgSend_setCaptureOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureOrientation:");
}

id objc_msgSend_setCapturedFromPhotoBooth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapturedFromPhotoBooth:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClearsContextBeforeDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClearsContextBeforeDrawing:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionWithItemsHandler:");
}

id objc_msgSend_setConfigurationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationDelegate:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsGravity:");
}

id objc_msgSend_setContentsRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsRect:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCurrentContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentContext:");
}

id objc_msgSend_setCurrentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentMode:");
}

id objc_msgSend_setCurrentMode_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentMode:animated:");
}

id objc_msgSend_setCurrentTestName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTestName:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultView:");
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaults");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeliveryMode:");
}

id objc_msgSend_setDidEndZoomingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidEndZoomingBlock:");
}

id objc_msgSend_setDimmed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDimmed:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEdgeAntialiasingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEdgeAntialiasingEnabled:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExcludedActivityTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExcludedActivityTypes:");
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExclusiveTouch:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setGeometryFlipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeometryFlipped:");
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupName:");
}

id objc_msgSend_setHdrMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHdrMode:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlightedTile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHighlightedTile:");
}

id objc_msgSend_setIcon_inCorner_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:inCorner:offset:");
}

id objc_msgSend_setIconFromAsset_maxIconSizeInPixels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconFromAsset:maxIconSizeInPixels:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndicatorStyle:");
}

id objc_msgSend_setInputAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputAmount:");
}

id objc_msgSend_setInputOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputOrientation:");
}

id objc_msgSend_setInputPixelBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputPixelBuffer:");
}

id objc_msgSend_setInputPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputPoint:");
}

id objc_msgSend_setInputRotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputRotation:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalPredicate:");
}

id objc_msgSend_setIrisMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIrisMode:");
}

id objc_msgSend_setIsAnimating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAnimating:");
}

id objc_msgSend_setItems_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItems:animated:");
}

id objc_msgSend_setItemsToDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemsToDisplay:");
}

id objc_msgSend_setKeyTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyTimes:");
}

id objc_msgSend_setLargePool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLargePool:");
}

id objc_msgSend_setMaximumZoomScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumZoomScale:");
}

id objc_msgSend_setMenuVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMenuVisible:animated:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMinimumZoomScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumZoomScale:");
}

id objc_msgSend_setMirrorFilterRendering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMirrorFilterRendering:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsLayoutOnGeometryChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayoutOnGeometryChange:");
}

id objc_msgSend_setNeedsToUpdateDisplayedItems_immediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToUpdateDisplayedItems:immediately:");
}

id objc_msgSend_setNeedsToUpdateStackElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToUpdateStackElements");
}

id objc_msgSend_setNetworkAccessAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkAccessAllowed:");
}

id objc_msgSend_setNextState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextState:animated:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setOrientation_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientation:duration:");
}

id objc_msgSend_setOutputImageQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputImageQueue:");
}

id objc_msgSend_setOutputPixelBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputPixelBuffer:");
}

id objc_msgSend_setOutputPixelBuffer_mapTexture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputPixelBuffer:mapTexture:");
}

id objc_msgSend_setOutputSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputSize:");
}

id objc_msgSend_setPageCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPageCount:");
}

id objc_msgSend_setPageSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPageSpacing:");
}

id objc_msgSend_setPersistenceOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistenceOptions:");
}

id objc_msgSend_setPhotoQualityPrioritization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoQualityPrioritization:");
}

id objc_msgSend_setPointValue_forKeyIfSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPointValue:forKeyIfSupported:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPreservesCenterDuringRotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreservesCenterDuringRotation:");
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRasterizationScale:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRender9Up_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRender9Up:");
}

id objc_msgSend_setRenderForSave_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRenderForSave:");
}

id objc_msgSend_setResizeMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResizeMode:");
}

id objc_msgSend_setRevealGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRevealGroup:");
}

id objc_msgSend_setReviewed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReviewed:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRunningDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningDelegate:");
}

id objc_msgSend_setScrollIndicatorInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollIndicatorInsets:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldRasterize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRasterize:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSmallPool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmallPool:");
}

id objc_msgSend_setSmallSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmallSize:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecialization:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusBarHidden_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:duration:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubtype_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtype:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTargetRect_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetRect:inView:");
}

id objc_msgSend_setTargetState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetState:");
}

id objc_msgSend_setTemporaryPersistenceOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryPersistenceOptions:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionEdge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionEdge:");
}

id objc_msgSend_setTransitionFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionFlags:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUUID:");
}

id objc_msgSend_setUseLocalDates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseLocalDates:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVisibleIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisibleIndex:");
}

id objc_msgSend_setVisibleIndex_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisibleIndex:animated:");
}

id objc_msgSend_setWantsAudioForCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsAudioForCapture:");
}

id objc_msgSend_setWantsAutoDualCameraFusion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsAutoDualCameraFusion:");
}

id objc_msgSend_setWantsDepthData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsDepthData:");
}

id objc_msgSend_setWantsHighResolutionStills_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsHighResolutionStills:");
}

id objc_msgSend_setWantsSemanticSceneFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsSemanticSceneFilter:");
}

id objc_msgSend_setWantsSquareCrop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsSquareCrop:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setZPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZPosition:");
}

id objc_msgSend_setZoomScale_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZoomScale:animated:");
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowColor");
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowOffset");
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowOpacity");
}

id objc_msgSend_shadowPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowPath");
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowRadius");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedAssetsSaver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAssetsSaver");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedMenuController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedMenuController");
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPhotoLibrary");
}

id objc_msgSend_shelfAssetCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shelfAssetCount");
}

id objc_msgSend_showDimmed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDimmed:");
}

id objc_msgSend_showFullsize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFullsize:");
}

id objc_msgSend_showShelf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showShelf:");
}

id objc_msgSend_shutterButtonWithLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonWithLayoutStyle:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sizeToFit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit:");
}

id objc_msgSend_sortUsingFunction_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingFunction:context:");
}

id objc_msgSend_stackBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackBounds");
}

id objc_msgSend_stackContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackContainerView");
}

id objc_msgSend_stackContainerViewForStackController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackContainerViewForStackController:");
}

id objc_msgSend_stackController_dataLoadTimedOutInView_forItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:dataLoadTimedOutInView:forItem:");
}

id objc_msgSend_stackController_isDataLoadedForItem_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:isDataLoadedForItem:inView:");
}

id objc_msgSend_stackController_loadDataForItem_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:loadDataForItem:inView:");
}

id objc_msgSend_stackController_viewForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:viewForItem:");
}

id objc_msgSend_stackController_willDisplayView_forItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:willDisplayView:forItem:");
}

id objc_msgSend_stackController_willRemoveViewForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:willRemoveViewForItem:");
}

id objc_msgSend_stackController_willStackView_forItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController:willStackView:forItem:");
}

id objc_msgSend_stackControllerDidStopStackingViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackControllerDidStopStackingViews:");
}

id objc_msgSend_stackControllerWillStartStackingViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackControllerWillStartStackingViews:");
}

id objc_msgSend_stackElement_delayForAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackElement:delayForAnimation:");
}

id objc_msgSend_stackElement_willRemoveView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackElement:willRemoveView:");
}

id objc_msgSend_stackElementForItem_createIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackElementForItem:createIfNeeded:");
}

id objc_msgSend_stackElementOuterViewClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackElementOuterViewClass");
}

id objc_msgSend_stackElementToReshowUnderneathStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackElementToReshowUnderneathStackElement:");
}

id objc_msgSend_stackIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackIndex");
}

id objc_msgSend_stackIsTerminating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackIsTerminating");
}

id objc_msgSend_stackRevealGroupDidFinish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackRevealGroupDidFinish:");
}

id objc_msgSend_stackRevealGroupDidReveal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackRevealGroupDidReveal:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startRendering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRendering:");
}

id objc_msgSend_startedAnimationTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedAnimationTest:");
}

id objc_msgSend_startedAnimationTest_cleanupBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedAnimationTest:cleanupBlock:");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusBarHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBarHeight");
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBarOrientation");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAutoscrolling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAutoscrolling");
}

id objc_msgSend_stopRendering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRendering:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronousImageForAsset_targetSize_contentMode_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousImageForAsset:targetSize:contentMode:options:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_takePicture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takePicture:");
}

id objc_msgSend_targetState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetState");
}

id objc_msgSend_testingAnimationDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testingAnimationDelegate");
}

id objc_msgSend_tiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tiles");
}

id objc_msgSend_tilesWereRemoved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tilesWereRemoved:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toValue");
}

id objc_msgSend_toggleEffectsMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleEffectsMode:");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transform");
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionDuration");
}

id objc_msgSend_transitionEdge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionEdge");
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unregisterCaptureService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterCaptureService:");
}

id objc_msgSend_unregisterEffectsPreviewSampleBufferDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterEffectsPreviewSampleBufferDelegate:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateEffectsForCameraToggle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEffectsForCameraToggle");
}

id objc_msgSend_updateIsAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIsAnimating");
}

id objc_msgSend_updateOrientationForStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOrientationForStackElement:");
}

id objc_msgSend_updateShadowView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateShadowView");
}

id objc_msgSend_updateStackBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStackBounds");
}

id objc_msgSend_updateStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStackElement:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithCATransform3D_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCATransform3D:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_valueWithPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPoint:");
}

id objc_msgSend_vectorWithX_Y_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vectorWithX:Y:");
}

id objc_msgSend_videoConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoConfiguration");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewForStackElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewForStackElement:");
}

id objc_msgSend_viewWillAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWillAppear:");
}

id objc_msgSend_viewWillDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWillDisappear:");
}

id objc_msgSend_viewWillTransitionToSize_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWillTransitionToSize:withTransitionCoordinator:");
}

id objc_msgSend_visibleIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleIndex");
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleViewController");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomScale");
}

id objc_msgSend_zoomScaleToFitScrollViewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomScaleToFitScrollViewSize:");
}

id objc_msgSend_zoomToFit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomToFit:");
}

id objc_msgSend_zoomToFitScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomToFitScale");
}

id objc_msgSend_zoomToRect_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomToRect:animated:");
}
