uint64_t PUIDynamicRotationIsActive()
{
  if (PUIDynamicRotationIsActive_onceToken != -1)
    dispatch_once(&PUIDynamicRotationIsActive_onceToken, &__block_literal_global_12);
  return PUIDynamicRotationIsActive_dynamicRotationIsActive;
}

BOOL PUIPosterSignificantEventOptionsContainsEvent(uint64_t a1, char a2)
{
  return ((1 << (a2 - 1)) & (unint64_t)~a1) == 0;
}

void sub_244651A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PUIRenderingContentIsPreview(uint64_t a1)
{
  return a1 == 1;
}

void sub_2446525C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PosterKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PRIncomingCallTextViewAdapterWrapper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1();
    free(v3);
  }
  getPRIncomingCallTextViewAdapterWrapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_244654F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_244655C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSStringFromPUIStyleType(uint64_t a1)
{
  if (NSStringFromPUIStyleType_onceToken != -1)
    dispatch_once(&NSStringFromPUIStyleType_onceToken, &__block_literal_global_0);
  return objc_msgSend((id)NSStringFromPUIStyleType_typeToStringMap, "objectForKey:", a1);
}

const __CFString *NSStringFromPUIStyleGradientType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("A");
  if (a1 == 1)
    v1 = CFSTR("R");
  if (a1 == 2)
    return CFSTR("C");
  else
    return v1;
}

id _PUIStyleIdentifierForStyle(void *a1, int a2)
{
  id v3;
  int v4;
  char v5;
  uint64_t v6;
  void *v7;

  v3 = a1;
  v4 = objc_msgSend(v3, "allowsVariation");
  v5 = objc_opt_respondsToSelector();
  if (a2 && (v5 & 1) != 0 && v4)
  {
    objc_msgSend(v3, "nonVariatedIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

uint64_t _PUIStyleCompareUsingIdentifiers(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  _PUIStyleIdentifierForStyle(a1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PUIStyleIdentifierForStyle(v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  return v8;
}

id LocalizedNSStringFromPUIHomeScreenStyle(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;

  switch(a1)
  {
    case 0:
      PUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("AUTOMATIC");
      goto LABEL_6;
    case 1:
      PUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DARK");
      goto LABEL_6;
    case 2:
      PUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("LIGHT");
      goto LABEL_6;
    case 3:
      PUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("TINT");
LABEL_6:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_25154D128, 0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v1;
  }
  return v1;
}

_PUIStylePickerHomeScreenCAAsset *_PUIStylePickerHomeScreenCAAssetFromPUIHomeScreenStyleType(unint64_t a1)
{
  if (a1 <= 3)
    a1 = -[_PUIStylePickerHomeScreenCAAsset initWithAssetName:bundle:]([_PUIStylePickerHomeScreenCAAsset alloc], "initWithAssetName:bundle:", off_25154BC40[a1], 0);
  return (_PUIStylePickerHomeScreenCAAsset *)(id)a1;
}

void sub_24465BB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PUILogCommon()
{
  if (PUILogCommon_onceToken != -1)
    dispatch_once(&PUILogCommon_onceToken, &__block_literal_global_4);
  return (id)PUILogCommon___logObj;
}

id PUILogRendering()
{
  if (PUILogRendering_onceToken != -1)
    dispatch_once(&PUILogRendering_onceToken, &__block_literal_global_3);
  return (id)PUILogRendering___logObj;
}

id PUILogCaching()
{
  if (PUILogCaching_onceToken != -1)
    dispatch_once(&PUILogCaching_onceToken, &__block_literal_global_5);
  return (id)PUILogCaching___logObj;
}

id PUILogSnapshotter()
{
  if (PUILogSnapshotter_onceToken != -1)
    dispatch_once(&PUILogSnapshotter_onceToken, &__block_literal_global_7);
  return (id)PUILogSnapshotter___logObj;
}

id PUILogSnapshotting()
{
  if (PUILogSnapshotting_onceToken != -1)
    dispatch_once(&PUILogSnapshotting_onceToken, &__block_literal_global_9);
  return (id)PUILogSnapshotting___logObj;
}

id PUILogSnapshotCache()
{
  if (PUILogSnapshotCache_onceToken != -1)
    dispatch_once(&PUILogSnapshotCache_onceToken, &__block_literal_global_11);
  return (id)PUILogSnapshotCache___logObj;
}

void sub_24465D35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__IOSurface *PUICreateIOSurfaceForImage(void *a1, uint64_t *a2, int a3)
{
  id v5;
  uint64_t v6;
  __IOSurface *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  CGImage *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ColorSpace;
  CGColorSpace *v30;
  CGColorSpace *DeviceRGB;
  CFPropertyListRef v32;
  const void *v33;
  __IOSurface *v34;
  void *v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(v5, "pui_wrappedIOSurface");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (__IOSurface *)v6;
    if (a2)
      *a2 = 0;
  }
  else
  {
    objc_msgSend(v5, "scale");
    v9 = v8;
    objc_msgSend(v5, "size");
    v11 = v10;
    if (MEMORY[0x249514CA4](*MEMORY[0x24BDD8FD0]) >= vcvtpd_u64_f64(v9 * v12)
      && MEMORY[0x249514CA4](*MEMORY[0x24BDD8EB0]) >= vcvtpd_u64_f64(v9 * v11))
    {
      v13 = objc_retainAutorelease(v5);
      PUIIOSurfaceFromCGImage((id)objc_msgSend(v13, "CGImage"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v7 = v14;
      }
      else
      {
        v16 = objc_retainAutorelease(v13);
        v17 = (CGImage *)objc_msgSend(v16, "CGImage");
        if (CGImageGetBitsPerComponent(v17) > 8)
          goto LABEL_24;
        CGImageGetWidth(v17);
        CGImageGetHeight(v17);
        if (!CGImageGetImageProvider())
          goto LABEL_24;
        v18 = *MEMORY[0x24BDBD270];
        v19 = *MEMORY[0x24BDBF380];
        if (a3)
        {
          v40[0] = *MEMORY[0x24BDBF390];
          v40[1] = v19;
          v20 = *MEMORY[0x24BDBF378];
          v41[0] = v18;
          v41[1] = v20;
          v40[2] = *MEMORY[0x24BDBF388];
          v41[2] = v18;
          v21 = (void *)MEMORY[0x24BDBCE70];
          v22 = v41;
          v23 = v40;
          v24 = 3;
        }
        else
        {
          v38[0] = *MEMORY[0x24BDBF390];
          v38[1] = v19;
          v25 = *MEMORY[0x24BDBF378];
          v39[0] = v18;
          v39[1] = v25;
          v21 = (void *)MEMORY[0x24BDBCE70];
          v22 = v39;
          v23 = v38;
          v24 = 2;
        }
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CGImageProviderCopyImageBlockSetWithOptions();
        if (v27)
        {
          v28 = v27;
          v36 = v26;
          CGImageBlockSetGetImageBlock();
          CGImageBlockGetBytesPerRow();
          CGImageBlockGetData();
          v7 = (__IOSurface *)IOSurfaceWrapClientImage();
          *a2 = v28;
          ColorSpace = CGImageProviderGetColorSpace();
          if (ColorSpace)
          {
            v30 = (CGColorSpace *)ColorSpace;
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
            {
              v32 = CGColorSpaceCopyPropertyList(v30);
              if (v32)
              {
                v33 = v32;
                IOSurfaceSetValue(v7, (CFStringRef)*MEMORY[0x24BDD8E88], v32);
                CFRelease(v33);
              }
            }
            CGColorSpaceRelease(DeviceRGB);
          }
        }
        else
        {
          v7 = 0;
        }

        if (v7)
        {
          -[__IOSurface setAttachment:forKey:](v7, "setAttachment:forKey:", CFSTR("PUI-WrapsClientImage"), *MEMORY[0x24BDD8EE0]);
        }
        else
        {
LABEL_24:
          MGGetBoolAnswer();
          objc_msgSend(v16, "size", v36);
          objc_msgSend(v16, "scale");
          objc_msgSend(v16, "pui_colorSpace");
          v37 = v16;
          BSUISurfaceWithColorSpaceAndDrawBlock();
          v34 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
          v7 = v34;
          if (v34)
            -[__IOSurface setAttachment:forKey:](v34, "setAttachment:forKey:", CFSTR("PosterUIFoundation"), *MEMORY[0x24BDD8EE0]);

        }
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id __PUICreateCroppedIOSurface(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  __IOSurface *v9;
  id v10;
  const __CFAllocator *v12;
  CVReturn v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  CFDictionaryRef DictionaryRepresentation;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef texture;
  CVPixelBufferRef pixelBufferOut;
  CGRect v22;
  CGRect v23;

  v9 = a1;
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  if (CGRectIsEmpty(v22) || (BSFloatLessThanOrEqualToFloat() & 1) != 0 || (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    v10 = 0;
    goto LABEL_5;
  }
  texture = 0;
  pixelBufferOut = 0;
  pixelTransferSessionOut = 0;
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0, &pixelBufferOut);
  if (v13)
    v14 = 1;
  else
    v14 = pixelBufferOut == 0;
  if (v14
    || ((v13 = VTPixelTransferSessionCreate(v12, &pixelTransferSessionOut)) == 0
      ? (v15 = pixelTransferSessionOut == 0)
      : (v15 = 1),
        v15))
  {
    IOSurfaceBackedCVPixelBufferWithAttributes = v13;
  }
  else
  {
    v23.origin.x = a2;
    v23.origin.y = a3;
    v23.size.width = a4;
    v23.size.height = a5;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v23);
    IOSurfaceBackedCVPixelBufferWithAttributes = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x24BDF9688], DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
    if (!IOSurfaceBackedCVPixelBufferWithAttributes)
    {
      IOSurfaceGetPixelFormat(v9);
      IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
      v16 = 0;
      if (IOSurfaceBackedCVPixelBufferWithAttributes || !texture)
        goto LABEL_17;
      IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, texture);
      if (!IOSurfaceBackedCVPixelBufferWithAttributes)
      {
        CVPixelBufferGetIOSurface(texture);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
  }
  v16 = 0;
LABEL_17:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(texture);
  if (pixelTransferSessionOut)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
  }
  if (IOSurfaceBackedCVPixelBufferWithAttributes)
    v10 = 0;
  else
    v10 = v16;

LABEL_5:
  return v10;
}

id __PUIImageByApplyingColorSpace(void *a1, CGColorSpace *a2)
{
  id v3;
  CGImage *v4;
  CGImage *v5;
  CGColorSpaceRef ColorSpace;
  CGColorSpace *v7;
  CGColorSpace *v8;
  CGColorSpaceRef DeviceCMYK;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CGColorSpaceModel Model;
  NSObject *v25;
  CGImageRef CopyWithColorSpace;
  CGImageRef v27;
  id v28;
  double v29;
  NSObject *v30;
  int v32;
  CGColorSpace *v33;
  __int16 v34;
  CGImage *v35;
  __int16 v36;
  CGColorSpace *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a1);
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");
  if (!v4)
  {
    PUILogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __PUIImageByApplyingColorSpace_cold_1((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  v5 = v4;
  ColorSpace = CGImageGetColorSpace(v4);
  if (!ColorSpace)
  {
    PUILogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __PUIImageByApplyingColorSpace_cold_2((uint64_t)v3, v10, v17, v18, v19, v20, v21, v22);
LABEL_10:

    v23 = v3;
    goto LABEL_32;
  }
  v7 = ColorSpace;
  v8 = CGColorSpaceRetain(a2);
  if (!v8)
  {
    switch(CGColorSpaceGetType())
    {
      case 0u:
      case 3u:
        goto LABEL_5;
      case 1u:
      case 4u:
        goto LABEL_17;
      case 2u:
        goto LABEL_18;
      default:
        if (!CGColorSpaceIsICCCompatible())
        {
          PUILogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __PUIImageByApplyingColorSpace_cold_4();
          goto LABEL_23;
        }
        Model = CGColorSpaceGetModel(v7);
        if (Model == kCGColorSpaceModelCMYK)
        {
LABEL_18:
          DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
        }
        else if (Model == kCGColorSpaceModelRGB)
        {
LABEL_17:
          DeviceCMYK = CGColorSpaceCreateDeviceRGB();
        }
        else
        {
          if (Model)
          {
            PUILogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              __PUIImageByApplyingColorSpace_cold_3(v7);
LABEL_23:

            goto LABEL_24;
          }
LABEL_5:
          DeviceCMYK = CGColorSpaceCreateDeviceGray();
        }
        v8 = DeviceCMYK;
        if (DeviceCMYK)
          break;
LABEL_24:
        v8 = CGColorSpaceRetain(v7);
        break;
    }
  }
  v23 = v3;
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v5, v8);
    if (CopyWithColorSpace)
    {
      v27 = CopyWithColorSpace;
      v28 = objc_alloc(MEMORY[0x24BDF6AC8]);
      objc_msgSend(v3, "scale");
      v23 = (void *)objc_msgSend(v28, "initWithCGImage:scale:orientation:", v27, objc_msgSend(v3, "imageOrientation"), v29);

      CFRelease(v27);
    }
    else
    {
      PUILogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = 138412802;
        v33 = v8;
        v34 = 2112;
        v35 = v5;
        v36 = 2114;
        v37 = v7;
        _os_log_error_impl(&dword_24464E000, v30, OS_LOG_TYPE_ERROR, "Failed to create copy with colorSpace=%@ of original CGImage=%@ with colorSpace=%{public}@", (uint8_t *)&v32, 0x20u);
      }

      v23 = v3;
    }
  }
  CGColorSpaceRelease(v8);
LABEL_32:

  return v23;
}

BOOL PUIIOSurfaceIsVolatile(__IOSurface *a1)
{
  BOOL v1;
  uint32_t oldState;

  oldState = 0;
  if (IOSurfaceSetPurgeable(a1, 3u, &oldState))
    v1 = 1;
  else
    v1 = oldState == 0;
  return !v1;
}

void sub_244660FE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_244661254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2446618E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

BOOL PUIIOSurfaceIsVolatileNonEmpty(__IOSurface *a1)
{
  uint32_t oldState;

  oldState = 0;
  return !IOSurfaceSetPurgeable(a1, 3u, &oldState) && oldState == 1;
}

BOOL PUIIOSurfaceIsEmpty(__IOSurface *a1)
{
  uint32_t oldState;

  oldState = 0;
  return !IOSurfaceSetPurgeable(a1, 3u, &oldState) && oldState == 2;
}

BOOL PUIIOSurfaceUpdatePurgable(__IOSurface *a1, uint32_t a2)
{
  uint32_t oldState;

  oldState = 0;
  return IOSurfaceSetPurgeable(a1, a2, &oldState) == 0;
}

void releaseIOSurface(void *a1)
{
  objc_msgSend(a1, "unlockWithOptions:seed:", 1, 0);
  objc_msgSend(a1, "decrementUseCount");

}

void __getNURenderContextClass_block_invoke(uint64_t a1)
{
  NeutrinoCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("NURenderContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNURenderContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNURenderContextClass_block_invoke_cold_1();
    NeutrinoCoreLibrary();
  }
}

void NeutrinoCoreLibrary()
{
  void *v0;

  if (!NeutrinoCoreLibraryCore_frameworkLibrary)
    NeutrinoCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NeutrinoCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getPISchemaClass_block_invoke(uint64_t a1)
{
  PhotoImagingLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PISchema");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPISchemaClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPISchemaClass_block_invoke_cold_1();
    PhotoImagingLibrary();
  }
}

void PhotoImagingLibrary()
{
  void *v0;

  if (!PhotoImagingLibraryCore_frameworkLibrary)
    PhotoImagingLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotoImagingLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getNUCIImageSourceDefinitionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  NeutrinoCoreLibrary();
  result = objc_getClass("NUCIImageSourceDefinition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNUCIImageSourceDefinitionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getNUCIImageSourceDefinitionClass_block_invoke_cold_1();
    return (Class)__getNUGenericCompositionClass_block_invoke(v3);
  }
  return result;
}

Class __getNUGenericCompositionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  NeutrinoCoreLibrary();
  result = objc_getClass("NUGenericComposition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNUGenericCompositionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getNUGenericCompositionClass_block_invoke_cold_1();
    return (Class)__getNUSourceClass_block_invoke(v3);
  }
  return result;
}

Class __getNUSourceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  NeutrinoCoreLibrary();
  result = objc_getClass("NUSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNUSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getNUSourceClass_block_invoke_cold_1();
    return (Class)__getPIParallaxColorAnalysisRequestClass_block_invoke(v3);
  }
  return result;
}

void __getPIParallaxColorAnalysisRequestClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  PhotoImagingLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PIParallaxColorAnalysisRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPIParallaxColorAnalysisRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getPIParallaxColorAnalysisRequestClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_244662324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2446624A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromPUIPosterLegibilityStyle(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == 1)
    v1 = CFSTR("LightContentWithDarkShadow");
  if (a1 == 2)
    return CFSTR("DarkContentWithLightShadow");
  else
    return v1;
}

BOOL _UILegibilityStyleForPUIPosterLegibilityStyle(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

BOOL PUIPosterLegibilityStyleForUILegibilityStyle(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

const __CFString *UIFontNameForPUIFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRail")) & 1) != 0)
  {
    v2 = CFSTR(".SFRailNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")) & 1) != 0)
  {
    v2 = CFSTR(".NewYorkNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFArabic")) & 1) != 0)
  {
    v2 = CFSTR(".SFArabic-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFArabicRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFArabicRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFHebrew")) & 1) != 0)
  {
    v2 = CFSTR(".SFHebrew-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFHebrewRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFHebrewRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFPro")) & 1) != 0)
  {
    v2 = CFSTR(".SFUI-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFUIRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYorkAlpha")) & 1) != 0)
  {
    v2 = CFSTR(".NewYork-Medium");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFCondensed")))
  {
    v2 = CFSTR(".SFUI-CondensedMedium");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *PUIFontIdentifierForFontName(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFRoundedNumeric-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFSoftNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSoft");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".ADTSlabNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSlab");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFStencilNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierStencil");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFRailNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierRail");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".NewYorkNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierNewYork");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFArabic-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFArabic");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFArabicRounded-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFArabicRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFHebrew-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFHebrew");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFHebrewRounded-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFHebrewRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFUI-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFPro");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("..SFCompactRounded-Regular")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFCompact-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFCondensed");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR(".NewYork-Medium")))
  {
    v2 = CFSTR("PRTimeFontIdentifierNewYorkAlpha");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id PUILocalizedDisplayNameForTimeFontIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")))
  {
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_ROUNDED");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")))
  {
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_SOFT");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")))
  {
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_SLAB");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")))
  {
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_STENCIL");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRail")))
  {
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_RAIL");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
    {
      v5 = 0;
      goto LABEL_14;
    }
    PUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_NEWYORK");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_25154D128, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v5;
}

const __CFString *PUIMinimumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Thin");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Thin");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Thin");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
  {
    v2 = CFSTR(".NewYorkNumeric-Medium");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *PUIMaximumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Heavy");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
  {
    v2 = CFSTR(".NewYorkNumeric-Heavy");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id PUIFontIdentifiers(char a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = v2;
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("PRTimeFontIdentifierSoft"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierRounded"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierStencil"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierNewYork"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierSlab"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierRail"));
  }
  return v3;
}

id PUIPosterSnapshotBundleSharedDateFormatter()
{
  if (PUIPosterSnapshotBundleSharedDateFormatter_onceToken != -1)
    dispatch_once(&PUIPosterSnapshotBundleSharedDateFormatter_onceToken, &__block_literal_global_9);
  return (id)PUIPosterSnapshotBundleSharedDateFormatter_dateFormatter;
}

id PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier()
{
  if (PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_onceToken != -1)
    dispatch_once(&PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_onceToken, &__block_literal_global_1);
  return (id)PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_currentSnapshotBundleEpochAndVersion;
}

id _posterLevelSetForComponent(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  switch(a1)
  {
    case 5:
      v3 = -1000;
      goto LABEL_7;
    case 6:
      v3 = -2000;
      goto LABEL_7;
    case 7:
      v3 = 1000;
LABEL_7:
      +[PUIPosterLevelSet levelSetForLevel:](PUIPosterLevelSet, "levelSetForLevel:", v3, v1, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet", v1, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

uint64_t _componentForLevelSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "numberOfLevels") != 1)
  {
    if ((objc_msgSend(v1, "isCompositeLevelSet") & 1) != 0)
    {
      v2 = 8;
      goto LABEL_11;
    }
LABEL_10:
    v2 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v1, "containsLevel:", -2000) & 1) == 0)
  {
    if ((objc_msgSend(v1, "containsLevel:", -1000) & 1) != 0)
    {
      v2 = 5;
      goto LABEL_11;
    }
    if ((objc_msgSend(v1, "containsLevel:", 1000) & 1) != 0)
    {
      v2 = 7;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v2 = 6;
LABEL_11:

  return v2;
}

id PUIPosterSnapshotBundleURLForComponent(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v11;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleURL != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      PUIPosterSnapshotBundleURLForComponent_cold_1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244669148);
  }
  v4 = v3;
  switch(a2)
  {
    case 1:
      v5 = CFSTR("Contents");
      goto LABEL_6;
    case 2:
      v5 = CFSTR("Resources");
LABEL_6:
      objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      PUIPosterSnapshotBundleURLForComponent(v3, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Info.plist");
      goto LABEL_13;
    case 4:
      PUIPosterSnapshotBundleURLForComponent(v3, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ColorStatistics.plist");
      goto LABEL_13;
    case 5:
      PUIPosterSnapshotBundleURLForComponent(v3, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Foreground.atx");
      goto LABEL_13;
    case 6:
      PUIPosterSnapshotBundleURLForComponent(v3, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Background.atx");
      goto LABEL_13;
    case 7:
      PUIPosterSnapshotBundleURLForComponent(v3, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Floating.atx");
      goto LABEL_13;
    case 8:
      PUIPosterSnapshotBundleURLForComponent(v3, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Composite.atx");
LABEL_13:
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

id PUIPosterSnapshotBundleURLForPosterLevelSet(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id result;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = v4;
    v6 = _componentForLevelSet(v4);
    if (v6)
    {
      PUIPosterSnapshotBundleURLForComponent(v3, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PUIPosterSnapshotBundleURLForComponent(v3, 8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_opt_new();
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __PUIPosterSnapshotBundleURLForPosterLevelSet_block_invoke;
      v20 = &unk_25154C040;
      v21 = v10;
      v11 = v10;
      objc_msgSend(v5, "enumerateLevels:", &v17);
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("-"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Snapshot-[%@].atx"), v13, v17, v18, v19, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleURL != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      PUIPosterSnapshotBundleURLForPosterLevelSet_cold_1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

BOOL _PUIPosterSnapshotBundleComponentIsDirectory(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL _PUIPosterSnapshotBundleComponentIsSnapshot(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 5;
}

void PUIPosterSnapshotBundleComponentEnumerate(void *a1)
{
  void (**v1)(id, unint64_t, _BYTE *);
  unint64_t v2;
  BOOL v3;
  char v4;

  v1 = a1;
  v2 = 0;
  do
  {
    do
      ++v2;
    while (!v2);
    v4 = 0;
    v1[2](v1, v2, &v4);
    if (v4)
      v3 = 1;
    else
      v3 = v2 >= 9;
  }
  while (!v3);

}

void PUIPosterSnapshotBundleComponentEnumerateDirectories(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __PUIPosterSnapshotBundleComponentEnumerateDirectories_block_invoke;
  v3[3] = &unk_25154C068;
  v4 = v1;
  v2 = v1;
  PUIPosterSnapshotBundleComponentEnumerate(v3);

}

void sub_244669A94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244669C68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24466A844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t PUISceneRoleIsEditing(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("PosterKit.editing"));
}

uint64_t PUIPosterBoundingShapeIsValid(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(&unk_25156AFF0, "containsObject:", v1);

  return v2;
}

uint64_t PUIPosterBoundingShapeFromInt(uint64_t a1)
{
  if (PUIPosterBoundingShapeIsValid(a1))
    return a1;
  else
    return -1;
}

double PUIPosterParallaxRequiredOverhangForDeviceClass(int a1)
{
  double result;

  result = 78.0;
  if (a1 != 2)
    return 26.0;
  return result;
}

double PUIPosterParallaxDesiredOverhangForDeviceClass(int a1)
{
  double result;

  result = 34.0;
  if (a1 == 2)
    return 118.0;
  return result;
}

double PUIPosterParallaxRequiredOverhangForCurrentDeviceClass()
{
  void *v0;
  double v1;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "deviceClass") == 2)
    v1 = 78.0;
  else
    v1 = 26.0;

  return v1;
}

double PUIPosterParallaxDesiredOverhangForCurrentDeviceClass()
{
  void *v0;
  double v1;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "deviceClass") == 2)
    v1 = 118.0;
  else
    v1 = 34.0;

  return v1;
}

void sub_24466AC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PUIFeatureEnabled(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return _os_feature_enabled_impl();
}

void sub_24466D670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_24466D7F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL PUIMaterialsIsLowQualityDevice()
{
  if (PUIMaterialsIsLowQualityDevice_onceToken != -1)
    dispatch_once(&PUIMaterialsIsLowQualityDevice_onceToken, &__block_literal_global_13);
  return PUIMaterialsIsLowQualityDevice_supportsHighQualityBlurs == 0;
}

id PUIHomeScreenLegibilityMaterialRecipeBundle()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDD1488];
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleForClass:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting()
{
  return 1;
}

void PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_block_invoke()
{
  if (PUIMaterialsIsLowQualityDevice_onceToken != -1)
    dispatch_once(&PUIMaterialsIsLowQualityDevice_onceToken, &__block_literal_global_13);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

__CFString *NSStringFromPUIRenderingMode(unint64_t a1)
{
  if (a1 < 4)
    return *(&off_25154C220 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromPUIRenderingContent(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("default");
  if (a1 == 1)
  {
    v1 = CFSTR("preview");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromPUIPosterPreviewContent(unint64_t a1)
{
  if (a1 < 3)
    return *(&off_25154C240 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t PosterKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PosterKitLibraryCore_frameworkLibrary_0;
  v6 = PosterKitLibraryCore_frameworkLibrary_0;
  if (!PosterKitLibraryCore_frameworkLibrary_0)
  {
    v7 = xmmword_25154C258;
    v8 = *(_OWORD *)&off_25154C268;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PosterKitLibraryCore_frameworkLibrary_0 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24467360C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = PosterKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPRIncomingCallFontsProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPRIncomingCallFontsProviderClass_softClass;
  v7 = getPRIncomingCallFontsProviderClass_softClass;
  if (!getPRIncomingCallFontsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallFontsProviderClass_block_invoke;
    v3[3] = &unk_25154B958;
    v3[4] = &v4;
    __getPRIncomingCallFontsProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24467371C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallFontsProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterKitLibrary();
  result = objc_getClass("PRIncomingCallFontsProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRIncomingCallFontsProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRIncomingCallFontsProviderClass_block_invoke_cold_1();
    return (Class)getPRIncomingCallMetricsProviderClass();
  }
  return result;
}

id getPRIncomingCallMetricsProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPRIncomingCallMetricsProviderClass_softClass;
  v7 = getPRIncomingCallMetricsProviderClass_softClass;
  if (!getPRIncomingCallMetricsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallMetricsProviderClass_block_invoke;
    v3[3] = &unk_25154B958;
    v3[4] = &v4;
    __getPRIncomingCallMetricsProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_244673828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallMetricsProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  PosterKitLibrary();
  result = objc_getClass("PRIncomingCallMetricsProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRIncomingCallMetricsProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
    return +[PUIShapeView layerClass](v3, v4);
  }
  return result;
}

uint64_t contrast(unint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  unint64_t v14;

  v7 = fmax(a5 / (double)a1 - a2 / (double)a1 * (a2 / (double)a1), 0.0);
  v8 = fmax(a6 / (double)a1 - a3 / (double)a1 * (a3 / (double)a1), 0.0);
  v9 = fmax(a7 / (double)a1 - a4 / (double)a1 * (a4 / (double)a1), 0.0);
  v10 = objc_msgSend(MEMORY[0x24BDF6950], "_luminanceWithRed:green:blue:", sqrtf(v7) / 255.0, sqrtf(v8) / 255.0, sqrtf(v9) / 255.0);
  v14 = llround(v13 * 255.0);
  if (v14 >= 0x100)
    +[PUIColorBoxes colorBoxesForImage:].cold.3(v10, v11, v12);
  return v14;
}

double PUICalculateContrastFromColorBoxes(void *a1, double *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _QWORD *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  float v25;
  unint64_t v26;
  unint64_t v27;
  float v28;
  unint64_t v29;
  unint64_t v30;
  float v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  double v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  uint64_t v49;
  unsigned __int8 *v50;
  uint64_t v51;
  double v52;
  double v53;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v13 = a1;
  v14 = -1.0;
  if (v13)
  {
    v55.origin.x = a4;
    v55.origin.y = a5;
    v55.size.width = a6;
    v55.size.height = a7;
    if (CGRectEqualToRect(v55, *MEMORY[0x24BDBF028]))
    {
      BSRectWithSize();
      a4 = v15;
      a5 = v16;
      a6 = v17;
      a7 = v18;
    }
    v19 = a6 == *MEMORY[0x24BDBF148] && a7 == *(double *)(MEMORY[0x24BDBF148] + 8);
    if (!v19)
    {
      v20 = v13[9];
      if (v20)
      {
        v21 = v13[10];
        if (v21)
        {
          v22 = v20 - 1;
          v23 = v21 - 1;
          v56.origin.x = a4;
          v56.origin.y = a5;
          v56.size.width = a6;
          v56.size.height = a7;
          v24 = (double)(unint64_t)v13[11];
          v25 = CGRectGetMinY(v56) / v24;
          v26 = vcvtms_u32_f32(v25);
          if (v22 >= v26)
            v27 = v26;
          else
            v27 = v22;
          v57.origin.x = a4;
          v57.origin.y = a5;
          v57.size.width = a6;
          v57.size.height = a7;
          v28 = CGRectGetMaxY(v57) / v24;
          v29 = vcvtms_u32_f32(v28);
          if (v27 > v29)
            v29 = v27;
          if (v22 >= v29)
            v30 = v29;
          else
            v30 = v22;
          v58.origin.x = a4;
          v58.origin.y = a5;
          v58.size.width = a6;
          v58.size.height = a7;
          v31 = CGRectGetMinX(v58) / v24;
          v32 = vcvtms_u32_f32(v31);
          if (v23 >= v32)
            v33 = v32;
          else
            v33 = v23;
          v59.origin.x = a4;
          v59.origin.y = a5;
          v59.size.width = a6;
          v59.size.height = a7;
          v34 = CGRectGetMaxX(v59) / v24;
          v36 = vcvtms_u32_f32(v34);
          if (v33 > v36)
            v36 = v33;
          if (v23 < v36)
            v36 = v23;
          v37 = v13[8];
          if (v37)
          {
            v38 = v30 - v27;
            v39 = v36 - v33 + 1;
            v40 = v30 - v27 + 1;
            v41 = (double)(unint64_t)(v39 * v40);
            if (v30 - v27 == -1)
            {
              v47 = 0;
              v46 = 0;
              v45 = 0;
              v44 = 0;
              v43 = 0;
              v48 = 0.0;
            }
            else
            {
              v42 = 0;
              v40 = 0;
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v47 = 0;
              v48 = 0.0;
              v49 = v37 + 1;
              do
              {
                if (v39)
                {
                  v50 = (unsigned __int8 *)(v49 + 4 * (v33 + v13[10] * v27));
                  v51 = v39;
                  do
                  {
                    v47 += *(v50 - 1);
                    v46 += *v50;
                    v45 += v50[1];
                    v44 += *(v50 - 1) * (unint64_t)*(v50 - 1);
                    v43 += *v50 * (unint64_t)*v50;
                    v40 += v50[1] * (unint64_t)v50[1];
                    LOBYTE(v35) = v50[2];
                    v35 = (double)*(unint64_t *)&v35;
                    v48 = v48 + v35;
                    v50 += 4;
                    --v51;
                  }
                  while (v51);
                }
                ++v27;
                v19 = v42++ == v38;
              }
              while (!v19);
            }
            v52 = v48 / v41;
            if (a2)
              *a2 = v52 / 255.0;
            v53 = (double)contrast((unint64_t)v41, (double)v47, (double)v46, (double)v45, (double)v44, (double)v43, (double)(unint64_t)v40);
            if (a3)
              *a3 = v53 / 255.0;
            if (v52 >= v53)
              v53 = v52;
            v14 = v53 / 255.0;
          }
        }
      }
    }
  }

  return v14;
}

id PUIAverageColorFromColorBoxes(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  CGFloat *v10;
  CGFloat *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MinY;
  double MaxY;
  double MinX;
  uint64_t v19;
  CGFloat MaxX;
  double v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  float v25;
  unint64_t v26;
  unint64_t v27;
  float v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  float v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double *v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  BOOL v55;
  unint64_t v56;
  uint64_t v57;
  double *v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  unint64_t v68;
  double v69;
  double v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double *v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  unint64_t v88;
  uint64_t v89;
  double *v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  _BYTE *v106;
  double *v107;
  unint64_t v108;
  double v109;
  unint64_t v110;
  unint64_t v111;
  void *v113;
  CGFloat v115;
  CGFloat *v116;
  unint64_t v117;
  double *v118;
  unint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;

  v124 = a6;
  v125 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v11 = v10;
  if (!v10 || !*((_QWORD *)v10 + 9) || !*((_QWORD *)v10 + 10))
    goto LABEL_91;
  v12 = *MEMORY[0x24BDBEFB0];
  v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v15 = v10[1];
  v14 = v10[2];
  v126.origin.x = a2;
  v126.origin.y = a3;
  v126.size.width = a4;
  v126.size.height = a5;
  if (!CGRectEqualToRect(v126, *MEMORY[0x24BDBF028]))
  {
    v127.origin.x = a2;
    v127.origin.y = a3;
    v127.size.width = a4;
    v127.size.height = a5;
    v140.origin.x = v12;
    v140.origin.y = v13;
    v140.size.width = v15;
    v140.size.height = v14;
    if (CGRectIntersectsRect(v127, v140))
    {
      v12 = a2;
      v13 = a3;
      v15 = a4;
      v14 = a5;
      goto LABEL_7;
    }
LABEL_91:
    v113 = 0;
    goto LABEL_92;
  }
LABEL_7:
  v128.origin.x = v12;
  v128.origin.y = v13;
  v128.size.width = v15;
  v128.size.height = v14;
  MinY = CGRectGetMinY(v128);
  v129.origin.x = v12;
  v129.origin.y = v13;
  v129.size.width = v15;
  v129.size.height = v14;
  MaxY = CGRectGetMaxY(v129);
  v130.origin.x = v12;
  v130.origin.y = v13;
  v130.size.width = v15;
  v130.size.height = v14;
  MinX = CGRectGetMinX(v130);
  v131.origin.x = v12;
  v131.origin.y = v13;
  v131.size.width = v15;
  v131.size.height = v14;
  MaxX = CGRectGetMaxX(v131);
  v116 = &v115;
  v115 = MaxX;
  v21 = MaxX + v124;
  v22 = *((_QWORD *)v11 + 10);
  v23 = *((_QWORD *)v11 + 9) - 1;
  v24 = (double)*((unint64_t *)v11 + 11);
  v120 = MinY - v124;
  v121 = MaxY + v124;
  v25 = (MinY - v124) / v24;
  v26 = vcvtms_u32_f32(v25);
  if (v23 >= v26)
    v27 = v26;
  else
    v27 = v23;
  v28 = (MaxY + v124) / v24;
  v29 = vcvtms_u32_f32(v28);
  if (v27 > v29)
    v29 = v27;
  if (v23 >= v29)
    v30 = v29;
  else
    v30 = v23;
  v31 = v22 - 1;
  v122 = MinX - v124;
  v123 = v21;
  v32 = (MinX - v124) / v24;
  v33 = vcvtms_u32_f32(v32);
  if (v31 >= v33)
    v34 = v33;
  else
    v34 = v31;
  v35 = v21 / v24;
  v36 = vcvtms_u32_f32(v35);
  if (v34 > v36)
    v36 = v34;
  if (v31 >= v36)
    v31 = v36;
  v117 = v31;
  v37 = v30 - v27;
  v38 = MEMORY[0x24BDAC7A8](v19);
  v118 = (CGFloat *)((char *)&v115 - v40);
  v119 = v39;
  v41 = v39 >> 1;
  if (v39 >= 2)
  {
    if (v41 <= 1)
      v42 = 1;
    else
      v42 = v39 >> 1;
    v43 = -v42;
    v44 = v27;
    v45 = v118;
    do
    {
      v132.origin.x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, v44, 0);
      x = v132.origin.x;
      y = v132.origin.y;
      width = v132.size.width;
      height = v132.size.height;
      v50 = CGRectGetMinY(v132);
      v133.origin.x = x;
      v133.origin.y = y;
      v133.size.width = width;
      v133.size.height = height;
      v51 = CGRectGetMaxY(v133);
      if (MinY > v50)
      {
        v52 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MinY >= v51)
            v53 = v51;
          else
            v53 = MinY;
          v54 = v120;
          if (v120 < v50)
            v54 = v50;
          v52 = (v53 - v54) * ((1.0 - (MinY - v54) / v124 + 1.0 - (MinY - v53) / v124) * 0.5);
        }
        height = fmax(v51 - MinY, 0.0) + v52;
      }
      *v45++ = height / (double)*((unint64_t *)v11 + 11);
      ++v44;
      v55 = __CFADD__(v43++, 1);
    }
    while (!v55);
  }
  if (v41 < v119)
  {
    v56 = v30 + 1;
    v57 = v27 + v41;
    v58 = &v118[v41];
    do
    {
      v134.origin.x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, v57, 0);
      v59 = v134.origin.x;
      v60 = v134.origin.y;
      v61 = v134.size.width;
      v62 = v134.size.height;
      v63 = CGRectGetMinY(v134);
      v135.origin.x = v59;
      v135.origin.y = v60;
      v135.size.width = v61;
      v135.size.height = v62;
      v64 = CGRectGetMaxY(v135);
      if (MaxY < v64)
      {
        if (v64 >= MaxY)
          v65 = MaxY;
        else
          v65 = v64;
        v66 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MaxY >= v63)
            v67 = MaxY;
          else
            v67 = v63;
          if (v121 < v64)
            v64 = v121;
          v66 = (v64 - v67) * ((1.0 - (v67 - MaxY) / v124 + 1.0 - (v64 - MaxY) / v124) * 0.5);
        }
        v62 = fmax(v65 - v63, 0.0) + v66;
      }
      *v58++ = v62 / (double)*((unint64_t *)v11 + 11);
      ++v57;
    }
    while (v56 != v57);
  }
  v68 = v117 - v34 + 1;
  MEMORY[0x24BDAC7A8](v38);
  v72 = (CGFloat *)((char *)&v115 - v71);
  *(_QWORD *)&v121 = v68 >> 1;
  if (v68 >= 2)
  {
    v73 = *(_QWORD *)&v121;
    if (*(_QWORD *)&v121 <= 1uLL)
      v73 = 1;
    v74 = -v73;
    v75 = v34;
    v76 = v72;
    do
    {
      v136.origin.x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, 0, v75);
      v77 = v136.origin.x;
      v78 = v136.origin.y;
      v79 = v136.size.width;
      v80 = v136.size.height;
      v81 = CGRectGetMinX(v136);
      v137.origin.x = v77;
      v137.origin.y = v78;
      v137.size.width = v79;
      v137.size.height = v80;
      v82 = CGRectGetMaxX(v137);
      if (MinX > v81)
      {
        v69 = v124;
        v83 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MinX >= v82)
            v84 = v82;
          else
            v84 = MinX;
          v85 = v122;
          if (v122 < v81)
            v85 = v81;
          v86 = v84 - v85;
          v69 = 1.0 - (MinX - v85) / v124;
          v83 = v86 * ((v69 + 1.0 - (MinX - v84) / v124) * 0.5);
        }
        v79 = fmax(v82 - MinX, 0.0) + v83;
      }
      *v76++ = v79 / (double)*((unint64_t *)v11 + 11);
      ++v75;
      v55 = __CFADD__(v74++, 1);
    }
    while (!v55);
  }
  v87 = v115;
  if (*(_QWORD *)&v121 < v68)
  {
    v88 = v117 + 1;
    v89 = v34 + *(_QWORD *)&v121;
    v90 = &v72[*(_QWORD *)&v121];
    do
    {
      v138.origin.x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, 0, v89);
      v91 = v138.origin.x;
      v92 = v138.origin.y;
      v93 = v138.size.width;
      v94 = v138.size.height;
      v95 = CGRectGetMinX(v138);
      v139.origin.x = v91;
      v139.origin.y = v92;
      v139.size.width = v93;
      v139.size.height = v94;
      v96 = CGRectGetMaxX(v139);
      if (v87 < v96)
      {
        if (v96 >= v87)
          v97 = v87;
        else
          v97 = v96;
        v69 = v124;
        v98 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (v87 >= v95)
            v99 = v87;
          else
            v99 = v95;
          if (v123 < v96)
            v96 = v123;
          v69 = v96 - v99;
          v98 = (v96 - v99) * ((1.0 - (v99 - v87) / v124 + 1.0 - (v96 - v87) / v124) * 0.5);
        }
        v93 = fmax(v97 - v95, 0.0) + v98;
      }
      *v90++ = v93 / (double)*((unint64_t *)v11 + 11);
      ++v89;
    }
    while (v88 != v89);
  }
  if (v119)
  {
    v100 = 0;
    v101 = 0.0;
    v69 = 255.0;
    v102 = 0.0;
    v103 = 0.0;
    v104 = 0.0;
    do
    {
      if (v68)
      {
        v105 = v118[v100];
        v106 = (_BYTE *)(*((_QWORD *)v11 + 8) + 4 * (v34 + *((_QWORD *)v11 + 10) * v27) + 1);
        v107 = v72;
        v108 = v68;
        do
        {
          v109 = *v107++;
          LOBYTE(v70) = *(v106 - 1);
          *(double *)&v110 = v105 * v109 * (double)*(unint64_t *)&v70 / 255.0;
          v104 = v104 + *(double *)&v110;
          LOBYTE(v110) = *v106;
          *(double *)&v111 = v105 * v109 * (double)v110 / 255.0;
          v103 = v103 + *(double *)&v111;
          LOBYTE(v111) = v106[1];
          v70 = v105 * v109 * (double)v111 / 255.0;
          v102 = v102 + v70;
          v101 = v101 + v105 * v109;
          v106 += 4;
          --v108;
        }
        while (v108);
      }
      ++v27;
    }
    while (v100++ != v37);
  }
  else
  {
    v104 = 0.0;
    v103 = 0.0;
    v102 = 0.0;
    v101 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v104 / v101, v103 / v101, v102 / v101, 1.0, v69, *(_QWORD *)&v115, v116);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_92:

  return v113;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 48, a4);
}

void sub_2446777A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void PUITextLayoutSetSharedInit(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  if (!a1[1])
  {
    v2 = a1;
    v3 = objc_opt_new();
    v4 = (id)a1[1];
    a1[1] = v3;

  }
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void sub_244679394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24467C734(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

id PUIBundle()
{
  if (PUIBundle___onceToken != -1)
    dispatch_once(&PUIBundle___onceToken, &__block_literal_global_17);
  return (id)PUIBundle___posterKitBundle;
}

uint64_t PUIIsPlatformSupported()
{
  if (PUIIsPlatformSupported_onceToken != -1)
    dispatch_once(&PUIIsPlatformSupported_onceToken, &__block_literal_global_2);
  return PUIIsPlatformSupported_isPlatformSupported;
}

id PUIPinViewWithinView(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v14);
  return v14;
}

id PUIIOSurfaceFromCGImage(id a1, int a2)
{
  void *Property;
  unsigned int CallbackVersion;
  char v6;
  int v7;

  if (a1)
  {
    Property = (void *)CGImageGetProperty();
    if (!Property
      && CGImageGetImageProvider()
      && ((CallbackVersion = CGImageProviderGetCallbackVersion(),
           v6 = CGImageWasCreatedWithIOSurface(),
           CallbackVersion > 1)
        ? (v7 = a2)
        : (v7 = 0),
          (v6 & 1) != 0 || v7))
    {
      a1 = (id)CGImageProviderCopyIOSurface();
    }
    else
    {
      a1 = Property;
    }
  }
  return a1;
}

void sub_244680100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PUISystemDefaultNumberingSystemType()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BE5C368];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberingSystemForLocaleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PUINumberingSystemTypeSortArray(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_20);
}

uint64_t PUINumberingSystemTypeRequiresLanguageTagging(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("deva")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("arabext"));

  return v2;
}

__CFString *PUINumberingTypeSystemLanguageTag(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("deva")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:", &unk_25156B038);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("arabext")))
  {
    v3 = CFSTR("ur");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

const __CFString *PUIStylePickerComponentToString(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = CFSTR("PUIStylePickerComponentFont");
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("PUIStylePickerComponentNumberingSystem");
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      goto LABEL_5;
    case 3:
      result = CFSTR("PUIStylePickerComponentStyle");
      break;
    case 7:
      result = CFSTR("PUIStylePickerComponentTextLayout");
      break;
    default:
      if (CFSTR("PUIStylePickerComponentFont") == (__CFString *)16)
        result = CFSTR("PUIStylePickerComponentTextAlignment");
      else
LABEL_5:
        result = CFSTR("(unknown PUIStylePickerComponent)");
      break;
  }
  return result;
}

__CFString *PUIStylePickerComponentsToString(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  char v15;

  v2 = (void *)objc_opt_new();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __PUIStylePickerComponentsToString_block_invoke;
  v13 = &unk_25154C798;
  v3 = v2;
  v14 = v3;
  v4 = &v10;
  if (a1)
  {
    v15 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v4);
          if (v15)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }
  }

  if (objc_msgSend(v3, "count", v10, v11))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(null PUIStylePickerComponents)");
  }

  return v8;
}

uint64_t PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation()
{
  uint64_t result;
  void *v1;

  _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation();
  _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection();
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 0;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 1;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 2;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This should be impossible, do you have a precision error?"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation_cold_1((uint64_t)v1);
  objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PUIStyleBackgroundTypeForLuminance(double a1)
{
  if (a1 < 0.0 || a1 > 1.0)
    return 0;
  if (a1 > 0.9)
    return 2;
  if (a1 >= 0.1)
    return 1;
  return 3;
}

uint64_t BSUIVibrancyBackgroundTypeForPUIStyleBackgroundType(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  else
    return a1 == 2;
}

__CFString *NSStringFromPUIPosterSignificantEvent(unint64_t a1)
{
  if (a1 < 5)
    return off_25154C8A0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(invalid - %lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t PUIPosterLevelIsDefined(unint64_t a1)
{
  int64x2_t v1;

  v1 = vdupq_n_s64(a1);
  return vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_2446AD260), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_2446AD270)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_2446AD280), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_2446AD290))))) & 1;
}

__CFString *NSStringFromPUIPosterLevel(uint64_t a1)
{
  __CFString *v1;

  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
        return CFSTR("CO6");
      if (a1 == 3000)
        return CFSTR("M7");
    }
    else
    {
      if (!a1)
        return CFSTR("TIME4");
      if (a1 == 1000)
        return CFSTR("FL5");
    }
    goto LABEL_22;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
      return CFSTR("FG2");
    if (a1 == -500)
      return CFSTR("FU3");
    goto LABEL_22;
  }
  if (a1 == -3000)
    return CFSTR("BD0");
  if (a1 != -2000)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(UNK%lu)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("BG1");
  return v1;
}

void PUIResolveMaxPixelOption(void *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a1;
  objc_msgSend(v17, "objectForKey:", kPUIImageDestinationMaxPixelCGSizeKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v17, "removeObjectForKey:", kPUIImageDestinationMaxPixelCGSizeKey);
  if (v5)
  {
    objc_msgSend(v5, "bs_CGSizeValue");
    v7 = v6;
    v9 = v8;
    CGImageGetSizeAfterOrientation();
    v12 = v7 == *MEMORY[0x24BDBF148] && v9 == *(double *)(MEMORY[0x24BDBF148] + 8);
    if (!v12 && (v10 != v7 || v11 != v9))
    {
      v13 = v11 * (v7 / v10);
      if (v7 >= v9)
        v14 = v7;
      else
        v14 = v9;
      if (v13 >= v9)
        v15 = v9;
      else
        v15 = v14;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v16, *MEMORY[0x24BDD9218]);

    }
  }

}

void sub_24468CF20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24469105C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_244691D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24469418C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *PUIErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("Unknown error.");
  else
    return off_25154CD88[a1 - 1];
}

void sub_244695C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PUITextLayoutIsVertical(uint64_t a1)
{
  return a1 != 0;
}

BOOL PUITextLayoutIsValid(unint64_t a1)
{
  return a1 < 2;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id PUIStyleGradientTypeToCAEditingGradientLayerTypeFrom(id a1)
{
  if ((unint64_t)a1 <= 2)
    a1 = **((id **)&unk_25154CE80 + (_QWORD)a1);
  return a1;
}

void sub_24469DA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24469E9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return +[PUIStyleSerialization dataForStyle:error:].cold.1(v0, v1, v2);
}

void __PUIImageByApplyingColorSpace_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24464E000, a2, a3, "The original image isn't CGImage based -> image=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __PUIImageByApplyingColorSpace_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24464E000, a2, a3, "The original image doesn't have a colorspace -> image=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __PUIImageByApplyingColorSpace_cold_3(CGColorSpace *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  CGColorSpaceGetModel(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24464E000, v1, v2, "Don't know which device colorspace matches ICC model=%i -> space=%{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

void __PUIImageByApplyingColorSpace_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CGColorSpaceGetType();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_24464E000, v0, v1, "Don't know which device colorspace matches type=%i -> space=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t __getNURenderContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPISchemaClass_block_invoke_cold_1(v0);
}

uint64_t __getPISchemaClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getNUCIImageSourceDefinitionClass_block_invoke_cold_1();
}

uint64_t __getNUCIImageSourceDefinitionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNUGenericCompositionClass_block_invoke_cold_1(v0);
}

uint64_t __getNUGenericCompositionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNUSourceClass_block_invoke_cold_1(v0);
}

uint64_t __getNUSourceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPIParallaxColorAnalysisRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getPIParallaxColorAnalysisRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[PUIPosterLegibilitySettings legibilitySettingsWithUILegibilitySettings:].cold.1(v0);
}

void PUIPosterSnapshotBundleURLForComponent_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSURL * _Nonnull PUIPosterSnapshotBundleURLForComponent(NSURL *__strong _Nonnull, PUIPosterSnapshotBundleComponent)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_24464E000, MEMORY[0x24BDACB70], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_1_1();
}

void PUIPosterSnapshotBundleURLForPosterLevelSet_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSURL * _Nonnull PUIPosterSnapshotBundleURLForPosterLevelSet(NSURL *__strong _Nonnull, PUIPosterLevelSet *__strong _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_24464E000, MEMORY[0x24BDACB70], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_1_1();
}

uint64_t __getPRIncomingCallFontsProviderClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
}

uint64_t __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.1(v0);
}

void PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIImageOrientation PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(BSInterfaceOrientation, BSInterfaceOrientation)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("UIImageOrientation+PosterUIFoundation.m");
  v7 = 1024;
  v8 = 42;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_24464E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

uint64_t BSDispatchQueueCreateWithAttributes()
{
  return MEMORY[0x24BE0BB70]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x24BE0BB88]();
}

uint64_t BSEqualDoubles()
{
  return MEMORY[0x24BE0BB98]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x24BE0BBB8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BBE8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x24BE0BBF0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x24BE0BBF8]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BC08]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x24BE0BC18]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x24BE0BC28]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x24BE0BC88]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE0BD30]();
}

uint64_t BSUISurfaceWithColorSpaceAndDrawBlock()
{
  return MEMORY[0x24BE0BF00]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CARenderServerRenderLayer()
{
  return MEMORY[0x24BDE5548]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x24BDBDB68](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB78]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBC0](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x24BDBDC28]();
}

uint64_t CGColorSpaceIsICCCompatible()
{
  return MEMORY[0x24BDBDC40]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCF0](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

uint64_t CGFontCreateFontsWithURL()
{
  return MEMORY[0x24BDBE2C8]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x24BDBE578]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x24BDBE580]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x24BDBE5C0]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x24BDBE5D8]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x24BDBE5F0](image, space);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x24BDD9030]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x24BDD90A0]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x24BDBE6B8]();
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x24BDBE6D0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x24BDBE708]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x24BDBE710]();
}

uint64_t CGImageProviderGetCallbackVersion()
{
  return MEMORY[0x24BDBE730]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x24BDBE738]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x24BDBE780]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

uint64_t CGImageWasCreatedWithIOSurface()
{
  return MEMORY[0x24BDD91B8]();
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGSize CGSizeFromString(NSString *string)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x24BDF65B8](string);
  result.height = v2;
  result.width = v1;
  return result;
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x24BE04630]();
}

CFArrayRef CTFontCopyDefaultCascadeListForLanguages(CTFontRef font, CFArrayRef languagePrefList)
{
  return (CFArrayRef)MEMORY[0x24BDC46F0](font, languagePrefList);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDC4748](font);
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x24BDC4770](font);
}

uint64_t CTFontCopyVariationAxesInternal()
{
  return MEMORY[0x24BDC4778]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x24BDC4788](font, matrix, attributes, size);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x24BDC47A0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x24BDC47C0](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x24BDC47D0](name, matrix, options, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x24BDC47D8](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateMatchingFontDescriptorsWithOptions()
{
  return MEMORY[0x24BDC4828]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4830](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x24BDC4838]();
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

uint64_t CTStringIsSuitableForArabicJustification()
{
  return MEMORY[0x24BDC4B90]();
}

uint64_t CTStringIsSuitableForVerticalLayout()
{
  return MEMORY[0x24BDC4B98]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

uint64_t FBSDisplayGamutDescription()
{
  return MEMORY[0x24BE38258]();
}

uint64_t FBSDisplayHDRModeDescription()
{
  return MEMORY[0x24BE38260]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x24BDF8FA8]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x24BDD8C98](property);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x24BDD8DB0](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDD8DB8](buffer, key, value);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x24BDD8DE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSDirectionalEdgeInsets NSDirectionalEdgeInsetsFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSDirectionalEdgeInsets result;

  MEMORY[0x24BDF65E0](string);
  result.trailing = v4;
  result.bottom = v3;
  result.leading = v2;
  result.top = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6680](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PFBundleIdentifierRequiresMemoryHogAssertion()
{
  return MEMORY[0x24BE74D40]();
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x24BE74D48]();
}

uint64_t PFPosterPathFileAttributes()
{
  return MEMORY[0x24BE74D50]();
}

uint64_t PFTemporaryDirectory()
{
  return MEMORY[0x24BE74D70]();
}

uint64_t PF_IS_PAD_DEVICE()
{
  return MEMORY[0x24BE74D78]();
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x24BDF76C8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x24BDF7C98]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BDF7CB8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BDF7CF8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x24BED23B8]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x24BE0BEE8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _EXIFOrientationForUIImageOrientation()
{
  return MEMORY[0x24BDF8040]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x24BDD19C8]();
}

uint64_t _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection()
{
  return MEMORY[0x24BDF8088]();
}

uint64_t _UIImageGetCGImageRepresentation()
{
  return MEMORY[0x24BDF8130]();
}

uint64_t _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  return MEMORY[0x24BDF8158]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDCE78](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x24BDAE000]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B8](property);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

