id getSOSUtilitiesClass()
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
  v0 = (void *)getSOSUtilitiesClass_softClass;
  v7 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSOSUtilitiesClass_block_invoke;
    v3[3] = &unk_1E200E038;
    v3[4] = &v4;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AB6BE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBFBoolEquals(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL SBFIsChamoisWindowingUIAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ChamoisWindowingUIStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBChamoisWindowingUI"), 0, __ChamoisWindowingUIStorage, ChamoisWindowingUIDefaultValueFunction) == 0;
  return !v1;
}

double SBFFloatFloorForScale(double a1, double a2)
{
  double v2;
  void *v4;
  double v5;

  v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v2 = v5;

  }
  return floor(v2 * a1) / v2;
}

__CFString *_SBFZStackParticipantIdentifierDescription(unint64_t a1)
{
  if (a1 > 0x1F)
    return 0;
  else
    return off_1E200F190[a1];
}

id SBLogReusableViewCache()
{
  if (SBLogReusableViewCache_onceToken != -1)
    dispatch_once(&SBLogReusableViewCache_onceToken, &__block_literal_global_11);
  return (id)SBLogReusableViewCache___logObj;
}

id SBFAudioCategoriesDisablingVolumeHUDUnion(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "count"))
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v3, "setByAddingObjectsFromSet:", v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = v5;
      }
    }
    else
    {
      v6 = v3;
    }
  }
  else
  {
    if (v3)
      v7 = v3;
    else
      v7 = v4;
    v6 = v7;
  }
  v8 = v6;

  return v8;
}

id _SBModifyFrameRateForAnimationBlockFromSettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  float v19;
  float v20;
  float v21;
  int v22;
  CAFrameRateRange v23;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x18D774178](v3);
  objc_msgSend(v4, "frameRateRange");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "preferredFrameRateRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "highFrameRateReason");
  v23.minimum = v7;
  v23.maximum = v9;
  v23.preferred = v11;
  if (!CAFrameRateRangeIsEqualToRange(v23, *MEMORY[0x1E0CD23C0]))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___SBModifyFrameRateForAnimationBlockFromSettings_block_invoke;
    v17[3] = &unk_1E200F698;
    v19 = v7;
    v20 = v9;
    v21 = v11;
    v22 = v13;
    v18 = v3;
    v14 = MEMORY[0x18D774178](v17);

    v5 = (void *)v14;
  }
  v15 = (void *)MEMORY[0x18D774178](v5);

  return v15;
}

BOOL SBFInterfaceOrientationMaskContainsInterfaceOrientation(char a1, char a2)
{
  return ((1 << a2) & 0x1E & (unint64_t)a1) != 0;
}

void sub_18AB70164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBFEffectiveHomeButtonType()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "homeButtonType");

  return v1;
}

uint64_t SBFEffectiveDeviceClass()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceClass");

  return v1;
}

BOOL SBFIsMoreForegroundAppsAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__MoreForegroundAppsStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBMoreForegroundApps"), 0, __MoreForegroundAppsStorage, MoreForegroundAppsDefaultValueFunction) == 0;
  return !v1;
}

BOOL SBFIsChamoisStripDisabledWhenHiddenAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ChamoisStripDisabledWhenHiddenStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBChamoisStripDisabledWhenHidden"), 0, __ChamoisStripDisabledWhenHiddenStorage, ChamoisStripDisabledWhenHiddenDefaultValueFunction) == 0;
  return !v1;
}

uint64_t SBFEffectiveArtworkSubtype()
{
  if (SBFEffectiveArtworkSubtype_onceToken != -1)
    dispatch_once(&SBFEffectiveArtworkSubtype_onceToken, &__block_literal_global_19);
  return SBFEffectiveArtworkSubtype_deviceSubtype;
}

void SBFPreheatImageData(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  if (SBFPreheatImageData_onceToken != -1)
    dispatch_once(&SBFPreheatImageData_onceToken, &__block_literal_global_24);
  v2 = SBFPreheatImageData_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SBFPreheatImageData_block_invoke_2;
  block[3] = &unk_1E200E188;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

double convertDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

uint64_t SBFEdgeInsetsRotateToInterfaceOrientation(uint64_t result)
{
  if (result == 2 || result == 3 || result == 4)
    return UIEdgeInsetsRotate();
  return result;
}

const __CFString *NSStringFromSBFIdleTimerMode(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("<unknown>");
  else
    return off_1E200E948[a1];
}

const __CFString *NSStringFromIdleWarnMode(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(none)");
  else
    return off_1E200E9E0[a1];
}

const __CFString *NSStringFromIdleTimerDuration(unint64_t a1)
{
  if (a1 > 0xE)
    return CFSTR("(none)");
  else
    return off_1E200E968[a1];
}

uint64_t _SBFCGBitmapImageCreate(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15;
  void (**v16)(_QWORD);
  id v17;
  void *v18;
  size_t v19;
  size_t v20;
  int v21;
  unint64_t v22;
  void *Data;
  uint32_t v24;
  CGContext *v25;
  void (**v26)(_QWORD);
  void *v27;
  size_t v28;
  void *v29;
  const __CFData *v30;
  CGDataProvider *v31;
  CGImageRef v32;
  CGImage *Image;
  uint64_t v34;
  uint64_t v35;
  unint64_t v37;
  void *v38;
  size_t v39;
  void *v40;
  void (**v41)(_QWORD);
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  size_t v52;
  uint64_t v53;
  unint64_t v54;
  size_t v55;
  void (**v56)(_QWORD, _QWORD, _QWORD, double);
  uint64_t bytesPerRow;
  CGColorSpace *space;
  CGAffineTransform v59;
  CGFloat decode[2];
  uint64_t v61;
  CGSize v62;
  CGRect v63;

  v61 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (void *)MEMORY[0x18D773FD4]();
  v19 = vcvtpd_u64_f64(a6 * a8);
  v20 = vcvtpd_u64_f64(a7 * a8);
  v53 = _SBFGraphicsContextComponentsCountForType(a1);
  v56 = (void (**)(_QWORD, _QWORD, _QWORD, double))v17;
  bytesPerRow = CGBitmapGetAlignedBytesPerRow();
  switch(a1)
  {
    case 0uLL:
      if (!a2)
      {
        LODWORD(a2) = 0x2000;
        v21 = 2;
        goto LABEL_20;
      }
      space = CGColorSpaceRetain((CGColorSpaceRef)a2);
      LODWORD(a2) = 0x2000;
      v21 = 2;
      goto LABEL_21;
    case 1uLL:
      if (a2)
      {
        space = CGColorSpaceRetain((CGColorSpaceRef)a2);
        LODWORD(a2) = 0x2000;
        v21 = 6;
      }
      else
      {
        LODWORD(a2) = 0x2000;
        v21 = 6;
LABEL_20:
        space = CGColorSpaceCreateDeviceRGB();
      }
      goto LABEL_21;
    case 2uLL:
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("SBFImageUtilities.m"), 683, CFSTR("cannot provide a colorSpace if context type is gray"));

      }
      v21 = 1;
      space = CGColorSpaceCreateDeviceGray();
      goto LABEL_14;
    case 3uLL:
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("SBFImageUtilities.m"), 689, CFSTR("cannot provide a colorSpace if context type is gray"));

      }
      space = CGColorSpaceCreateDeviceGray();
      goto LABEL_13;
    case 4uLL:
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        a2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a2, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("SBFImageUtilities.m"), 695, CFSTR("cannot provide a colorSpace if context type is alphaOnly"));

        space = 0;
        LODWORD(a2) = 0;
      }
      else
      {
        space = 0;
      }
      v21 = 7;
      goto LABEL_21;
    default:
      space = 0;
LABEL_13:
      v21 = 0;
LABEL_14:
      LODWORD(a2) = 0;
LABEL_21:
      v54 = a1;
      v55 = bytesPerRow * v20;
      if (v15)
      {
        v22 = objc_msgSend(v15, "slotLength");
        if (bytesPerRow * v20 > v22)
        {
          v37 = v22;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          SBFGraphicsContextTypeDescription(a1);
          v52 = v20;
          v39 = v19;
          v40 = v18;
          v41 = v16;
          v42 = v15;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v62.width = a6;
          v62.height = a7;
          NSStringFromCGSize(v62);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("SBFImageUtilities.m"), 704, CFSTR("requested slot length (%zd) larger than maximum slotLength (%zd), not large enough for %@ context with dimensions %@ @%fx"), v55, v37, v43, v44, *(_QWORD *)&a8);

          v15 = v42;
          v16 = v41;
          v18 = v40;
          v19 = v39;
          v20 = v52;

        }
        Data = (void *)CGBitmapAllocateData();
      }
      else
      {
        Data = 0;
      }
      v24 = a2 | v21;
      v25 = CGBitmapContextCreate(Data, v19, v20, 8uLL, bytesPerRow, space, v24);
      v63.size.width = (double)v19;
      v63.origin.x = 0.0;
      v63.origin.y = 0.0;
      v63.size.height = (double)v20;
      CGContextClearRect(v25, v63);
      if (v16)
      {
        CGContextTranslateCTM(v25, 0.0, (double)v20);
        CGContextScaleCTM(v25, a8, -a8);
        CGContextGetCTM(&v59, v25);
        CGContextSetBaseCTM();
        UIGraphicsPushContext(v25);
        v16[2](v16);
        UIGraphicsPopContext();
      }
      if (Data)
      {
        v51 = v18;
        v26 = v16;
        v27 = v15;
        v28 = 8 * v53;
        v29 = v27;
        objc_msgSend(v27, "nextSlotWithBytes:length:", Data, v55);
        v30 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v31 = CGDataProviderCreateWithCFData(v30);
        if (v54 == 4)
        {
          *(_OWORD *)decode = xmmword_18AC15DE0;
          v32 = CGImageMaskCreate(v19, v20, 8uLL, v28, bytesPerRow, v31, decode, 0);
        }
        else
        {
          v32 = CGImageCreate(v19, v20, 8uLL, v28, bytesPerRow, space, v24, v31, 0, 0, kCGRenderingIntentDefault);
        }
        Image = v32;
        CGDataProviderRelease(v31);
        CGBitmapFreeData();

        v15 = v29;
        v16 = v26;
        v18 = v51;
      }
      else
      {
        Image = CGBitmapContextCreateImage(v25);
      }
      if (v56)
      {
        ((void (**)(_QWORD, CGImage *, _QWORD, double))v56)[2](v56, Image, 0, a8);
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, a8);
      }
      v35 = v34;
      CGImageRelease(Image);
      CGColorSpaceRelease(space);
      CGContextRelease(v25);
      objc_autoreleasePoolPop(v18);

      return v35;
  }
}

uint64_t _SBFGraphicsContextComponentsCountForType(unint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;

  if (a1 < 5)
    return qword_18AC15DB8[a1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t _SBFGraphicsContextComponentsCountForType(SBFGraphicsContextType)");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBFGraphicsContextTypeDescription(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBFImageUtilities.m"), 652, CFSTR("unrecognized type=%@"), v5);

  return 0;
}

id SBLogKeyWindow()
{
  if (SBLogKeyWindow_onceToken != -1)
    dispatch_once(&SBLogKeyWindow_onceToken, &__block_literal_global_7);
  return (id)SBLogKeyWindow___logObj;
}

uint64_t (*_get_MKBGetDeviceLockStateInfo())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBGetDeviceLockStateInfoSymbolLoc())
      return __LAMKBGetDeviceLockStateInfo;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBGetDeviceLockStateInfo_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E4D8];
}

void SBFApplyParallaxSettingsToView(void *a1, void *a2)
{
  SBFApplyParallaxSettingsToViewWithFactor(a1, a2, 1.0);
}

uint64_t SBFBSInterfaceOrientationMaskForBSInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

BOOL SBFPointEqualToPointAtScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  void *v10;
  double v11;

  v5 = a5;
  if (fabs(a5) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v5 = v11;

  }
  return vabdd_f64(a1 * v5, a3 * v5) < 2.22044605e-16 && vabdd_f64(a2 * v5, a4 * v5) < 2.22044605e-16;
}

double SBFRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9;

  v9 = SBFFloatRoundForScale(a1, a5);
  SBFFloatRoundForScale(a2, a5);
  SBFFloatRoundForScale(a3, a5);
  SBFFloatRoundForScale(a4, a5);
  return v9;
}

double SBFFloatRoundForScale(double a1, double a2)
{
  double v2;
  void *v4;
  double v5;

  v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v2 = v5;

  }
  return round(v2 * a1) / v2;
}

double SBFFloatCeilForScale(double a1, double a2)
{
  double v2;
  void *v4;
  double v5;

  v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v2 = v5;

  }
  return ceil(v2 * a1) / v2;
}

id SBFSafeProtocolCast(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", a1))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

const __CFString *SBStringFromAnimationUpdateMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unspecified");
  else
    return off_1E200F730[a1 - 1];
}

id SBFSafeCast(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

const __CFString *SBFDescriptionForSensorType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("invalid");
  else
    return off_1E200FA58[a1];
}

BOOL SBFIsSAEHungryHomeAffordanceAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load((unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBSAEHungryHomeAffordance"), 0, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage, SAEHungryHomeAffordanceDefaultValueFunction) == 0;
  return !v1;
}

void sub_18AB73D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation();
  return _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection();
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDIncludesCategory(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "count"))
      v6 = objc_msgSend(v3, "containsObject:", v5);
    else
      v6 = 1;
  }

  return v6;
}

uint64_t SBFEqualStrings(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqualToString:", a2);
  else
    return a1 == a2;
}

void SBFApplyParallaxSettingsToViewWithFactor(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  id v14;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v6)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "_motionEffects", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "_removeMotionEffect:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v10);
    }

    v13 = objc_msgSend(v5, "slideEnabled");
    if (fabs(a3) >= 2.22044605e-16 && v13)
    {
      if (objc_msgSend(v5, "tiltEnabled"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CEAE30]);
        objc_msgSend(v5, "slidePixelsX");
        v16 = v15 * (double)objc_msgSend(v5, "slideDirectionX") * 0.5 * a3;
        objc_msgSend(v5, "slidePixelsY");
        v18 = v17 * (double)objc_msgSend(v5, "slideDirectionY") * 0.5 * a3;
        objc_msgSend(v14, "setSlideMagnitude:", v16, v18);
        if (objc_msgSend(v5, "increaseEnabled"))
        {
          objc_msgSend(v5, "slideIncreaseX");
          objc_msgSend(v14, "setHorizontalSlideAccelerationBoostFactor:", fabs(v19 * a3 * 0.5 / v16));
          objc_msgSend(v5, "slideIncreaseY");
          objc_msgSend(v14, "setVerticalSlideAccelerationBoostFactor:", fabs(v20 * a3 * 0.5 / v18));
        }
        objc_msgSend(v14, "setRotatingSphereRadius:", (double)-objc_msgSend(v5, "distanceFromScreen") * a3);
        objc_msgSend(v5, "tiltDegreesX");
        objc_msgSend(v14, "setMaximumHorizontalTiltAngle:", -(v21 * (double)objc_msgSend(v5, "tiltDirectionX")) * a3 * 0.0174532925);
        objc_msgSend(v5, "tiltDegreesY");
        objc_msgSend(v14, "setMaximumVerticalTiltAngle:", -(v22 * (double)objc_msgSend(v5, "tiltDirectionY")) * a3 * 0.0174532925);
        objc_msgSend(v7, "_addMotionEffect:", v14);

      }
      else
      {
        objc_msgSend(v5, "slidePixelsX");
        objc_msgSend(v7, "_setVisualAltitude:");
        objc_msgSend(v5, "slidePixelsY");
        v24 = v23;
        objc_msgSend(v5, "slidePixelsX");
        objc_msgSend(v7, "_setVisualAltitudeBias:", 1.0, v24 / v25);
      }
    }
    objc_msgSend(v7, "bounds");
    if (v27 <= v26)
    {
      v30 = v26;
      objc_msgSend(v5, "tiltDegreesX");
      v28 = v30;
    }
    else
    {
      v28 = v27;
      objc_msgSend(v5, "tiltDegreesY");
    }
    v31 = v28 * -0.5;
    v32 = tan(v29 * 0.0174532925);
    objc_msgSend(v7, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setZPosition:", v31 * v32);

  }
}

double SBFTransformFromOrientationToOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  CGFloat v7;
  __int128 v8;
  CGAffineTransform v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *a3 = *MEMORY[0x1E0C9BAA8];
  a3[1] = v5;
  v6 = *(_OWORD *)(v4 + 32);
  a3[2] = v6;
  if (a1 != a2)
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v10, v7);
    UIIntegralTransform();
    v8 = v12;
    *a3 = v11;
    a3[1] = v8;
    *(_QWORD *)&v6 = v13;
    a3[2] = v13;
  }
  return *(double *)&v6;
}

id _SBFLoggingMethodProem(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a1;
  _NSFullMethodName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v6 = objc_msgSend(v4, "rangeOfString:", CFSTR(" "));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "substringToIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", v7 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%p) %@"), v9, v3, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }

  return v5;
}

uint64_t SBCopyCharacterUSetWithPattern(void *a1)
{
  uint64_t v1;

  if (!a1)
    return 0;
  objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 10);
  v1 = uset_openPattern();
  MEMORY[0x18D77437C](v1);
  return v1;
}

void sub_18AB763B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB7806C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB781EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB78370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB78700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18AB78FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreTelephonyLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E200E058;
    v3 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    CoreTelephonyLibrary_cold_1(&v1);
  return CoreTelephonyLibraryCore_frameworkLibrary;
}

void *__getIDSHardDeregisterSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E088;
    v5 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IDSLibraryCore_frameworkLibrary)
    __getIDSHardDeregisterSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)IDSLibraryCore_frameworkLibrary, "IDSHardDeregister");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIDSHardDeregisterSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAKUnregisterAllAppleIDsSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E0A0;
    v5 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AuthKitLibraryCore_frameworkLibrary)
    __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AuthKitLibraryCore_frameworkLibrary, "AKUnregisterAllAppleIDs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAKUnregisterAllAppleIDsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_18AB79C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBFHandleRemoteBasebandLoggingStatusChanged()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_36);
}

Class __getCellularLoggingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CellularLoggingLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E0C0;
    v5 = 0;
    CellularLoggingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CellularLoggingLibraryCore_frameworkLibrary)
    __getCellularLoggingClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CellularLogging");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCellularLoggingClass_block_invoke_cold_2();
  getCellularLoggingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t (*_get_MKBLockDevice())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBLockDeviceSymbolLoc())
      return __LAMKBLockDevice;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBLockDevice_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E548];
}

uint64_t __LAMKBLockDevice(uint64_t a1)
{
  uint64_t (*LAMKBLockDeviceSymbolLoc)(uint64_t);

  LAMKBLockDeviceSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBLockDeviceSymbolLoc();
  if (!LAMKBLockDeviceSymbolLoc)
    __LAMKBLockDevice_cold_1();
  return LAMKBLockDeviceSymbolLoc(a1);
}

uint64_t (*_get_MKBUnlockDevice())(uint64_t a1, uint64_t a2)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBUnlockDeviceSymbolLoc())
      return __LAMKBUnlockDevice;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBUnlockDevice_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D4E568];
}

uint64_t __LAMKBUnlockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t (*LAMKBUnlockDeviceSymbolLoc)(uint64_t, uint64_t);

  LAMKBUnlockDeviceSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBUnlockDeviceSymbolLoc();
  if (!LAMKBUnlockDeviceSymbolLoc)
    __LAMKBUnlockDevice_cold_1();
  return LAMKBUnlockDeviceSymbolLoc(a1, a2);
}

uint64_t (*_get_MKBGetDeviceConfigurations())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBGetDeviceConfigurationsSymbolLoc())
      return __LAMKBGetDeviceConfigurations;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBGetDeviceConfigurations_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E4C0];
}

uint64_t __LAMKBGetDeviceConfigurations(uint64_t a1)
{
  uint64_t (*LAMKBGetDeviceConfigurationsSymbolLoc)(uint64_t);

  LAMKBGetDeviceConfigurationsSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceConfigurationsSymbolLoc();
  if (!LAMKBGetDeviceConfigurationsSymbolLoc)
    __LAMKBGetDeviceConfigurations_cold_1();
  return LAMKBGetDeviceConfigurationsSymbolLoc(a1);
}

uint64_t (*_get_MKBGetDeviceLockState())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBGetDeviceLockStateSymbolLoc())
      return __LAMKBGetDeviceLockState;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBGetDeviceLockState_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E4D0];
}

uint64_t __LAMKBGetDeviceLockState(uint64_t a1)
{
  uint64_t (*LAMKBGetDeviceLockStateSymbolLoc)(uint64_t);

  LAMKBGetDeviceLockStateSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceLockStateSymbolLoc();
  if (!LAMKBGetDeviceLockStateSymbolLoc)
    __LAMKBGetDeviceLockState_cold_1();
  return LAMKBGetDeviceLockStateSymbolLoc(a1);
}

uint64_t __LAMKBGetDeviceLockStateInfo(uint64_t a1)
{
  uint64_t (*LAMKBGetDeviceLockStateInfoSymbolLoc)(uint64_t);

  LAMKBGetDeviceLockStateInfoSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceLockStateInfoSymbolLoc();
  if (!LAMKBGetDeviceLockStateInfoSymbolLoc)
    __LAMKBGetDeviceLockStateInfo_cold_1();
  return LAMKBGetDeviceLockStateInfoSymbolLoc(a1);
}

uint64_t (*_get_MKBDeviceUnlockedSinceBoot())()
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBDeviceUnlockedSinceBootSymbolLoc())
      return __LAMKBDeviceUnlockedSinceBoot;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBDeviceUnlockedSinceBoot_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)())MEMORY[0x1E0D4E4A0];
}

uint64_t __LAMKBDeviceUnlockedSinceBoot()
{
  uint64_t (*LAMKBDeviceUnlockedSinceBootSymbolLoc)(void);

  LAMKBDeviceUnlockedSinceBootSymbolLoc = (uint64_t (*)(void))get_LAMKBDeviceUnlockedSinceBootSymbolLoc();
  if (!LAMKBDeviceUnlockedSinceBootSymbolLoc)
    __LAMKBDeviceUnlockedSinceBoot_cold_1();
  return LAMKBDeviceUnlockedSinceBootSymbolLoc();
}

uint64_t (*_get_MKBDeviceLockAssertion())(uint64_t a1, uint64_t a2)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBDeviceLockAssertionSymbolLoc())
      return __LAMKBDeviceLockAssertion;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBDeviceLockAssertion_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D4E488];
}

uint64_t __LAMKBDeviceLockAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t (*LAMKBDeviceLockAssertionSymbolLoc)(uint64_t, uint64_t);

  LAMKBDeviceLockAssertionSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBDeviceLockAssertionSymbolLoc();
  if (!LAMKBDeviceLockAssertionSymbolLoc)
    __LAMKBDeviceLockAssertion_cold_1();
  return LAMKBDeviceLockAssertionSymbolLoc(a1, a2);
}

uint64_t (*_get_MKBKeyBagKeyStashCreateWithOpts())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc())
      return __LAMKBKeyBagKeyStashCreateWithOpts;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBKeyBagKeyStashCreateWithOpts_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0D4E520];
}

uint64_t __LAMKBKeyBagKeyStashCreateWithOpts(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc();
  if (!v8)
    __LAMKBKeyBagKeyStashCreateWithOpts_cold_1();
  return v8(a1, a2, a3, a4);
}

uint64_t (*_get_MKBKeyBagKeyStashCommit())()
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBKeyBagKeyStashCommitSymbolLoc())
      return __LAMKBKeyBagKeyStashCommit;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBKeyBagKeyStashCommit_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)())MEMORY[0x1E0D4E508];
}

uint64_t __LAMKBKeyBagKeyStashCommit()
{
  uint64_t (*LAMKBKeyBagKeyStashCommitSymbolLoc)(void);

  LAMKBKeyBagKeyStashCommitSymbolLoc = (uint64_t (*)(void))get_LAMKBKeyBagKeyStashCommitSymbolLoc();
  if (!LAMKBKeyBagKeyStashCommitSymbolLoc)
    __LAMKBKeyBagKeyStashCommit_cold_1();
  return LAMKBKeyBagKeyStashCommitSymbolLoc();
}

uint64_t (*_get_MKBKeyBagKeyStashVerify())()
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBKeyBagKeyStashVerifySymbolLoc())
      return __LAMKBKeyBagKeyStashVerify;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBKeyBagKeyStashVerify_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)())MEMORY[0x1E0D4E530];
}

uint64_t __LAMKBKeyBagKeyStashVerify()
{
  uint64_t (*LAMKBKeyBagKeyStashVerifySymbolLoc)(void);

  LAMKBKeyBagKeyStashVerifySymbolLoc = (uint64_t (*)(void))get_LAMKBKeyBagKeyStashVerifySymbolLoc();
  if (!LAMKBKeyBagKeyStashVerifySymbolLoc)
    __LAMKBKeyBagKeyStashVerify_cold_1();
  return LAMKBKeyBagKeyStashVerifySymbolLoc();
}

uint64_t (*_get_MKBEventsRegister())(void *a1, void *a2)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBEventsRegisterSymbolLoc())
      return __LAMKBEventsRegister;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBEventsRegister_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(void *, void *))MEMORY[0x1E0D4E4A8];
}

uint64_t __LAMKBEventsRegister(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t (*LAMKBEventsRegisterSymbolLoc)(id, id);
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  LAMKBEventsRegisterSymbolLoc = (uint64_t (*)(id, id))get_LAMKBEventsRegisterSymbolLoc();
  if (!LAMKBEventsRegisterSymbolLoc)
    __LAMKBEventsRegister_cold_1();
  v6 = LAMKBEventsRegisterSymbolLoc(v3, v4);

  return v6;
}

uint64_t (*_get_MKBEventsUnregister())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBEventsUnregisterSymbolLoc())
      return __LAMKBEventsUnregister;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBEventsUnregister_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E4B0];
}

uint64_t __LAMKBEventsUnregister(uint64_t a1)
{
  uint64_t (*LAMKBEventsUnregisterSymbolLoc)(uint64_t);

  LAMKBEventsUnregisterSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBEventsUnregisterSymbolLoc();
  if (!LAMKBEventsUnregisterSymbolLoc)
    __LAMKBEventsUnregister_cold_1();
  return LAMKBEventsUnregisterSymbolLoc(a1);
}

uint64_t (*_get_MKBKeyBagPerformRecovery())(uint64_t a1, uint64_t a2)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBKeyBagPerformRecoverySymbolLoc())
      return __LAMKBKeyBagPerformRecovery;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBKeyBagPerformRecovery_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D4E538];
}

uint64_t __LAMKBKeyBagPerformRecovery(uint64_t a1, uint64_t a2)
{
  uint64_t (*LAMKBKeyBagPerformRecoverySymbolLoc)(uint64_t, uint64_t);

  LAMKBKeyBagPerformRecoverySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBKeyBagPerformRecoverySymbolLoc();
  if (!LAMKBKeyBagPerformRecoverySymbolLoc)
    __LAMKBKeyBagPerformRecovery_cold_1();
  return LAMKBKeyBagPerformRecoverySymbolLoc(a1, a2);
}

uint64_t (*_get_MKBPrewarmSPS())(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_os_feature_enabled_impl())
  {
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
      LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (LocalAuthenticationLibraryCore_frameworkLibrary && get_LAMKBPrewarmSPSSymbolLoc())
      return __LAMKBPrewarmSPS;
    SBLogAuthenticationKeybag();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      _get_MKBPrewarmSPS_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (uint64_t (*)(uint64_t))MEMORY[0x1E0D4E558];
}

uint64_t __LAMKBPrewarmSPS(uint64_t a1)
{
  uint64_t (*LAMKBPrewarmSPSSymbolLoc)(uint64_t);

  LAMKBPrewarmSPSSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBPrewarmSPSSymbolLoc();
  if (!LAMKBPrewarmSPSSymbolLoc)
    __LAMKBPrewarmSPS_cold_1();
  return LAMKBPrewarmSPSSymbolLoc(a1);
}

void sub_18AB7D3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
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

void *get_LAMKBLockDeviceSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBLockDeviceSymbolLoc_ptr;
  v6 = get_LAMKBLockDeviceSymbolLoc_ptr;
  if (!get_LAMKBLockDeviceSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBLockDevice");
    v4[3] = (uint64_t)v0;
    get_LAMKBLockDeviceSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t LocalAuthenticationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E200E338;
    v3 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    LocalAuthenticationLibrary_cold_1(&v1);
  return LocalAuthenticationLibraryCore_frameworkLibrary;
}

void *get_LAMKBUnlockDeviceSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBUnlockDeviceSymbolLoc_ptr;
  v6 = get_LAMKBUnlockDeviceSymbolLoc_ptr;
  if (!get_LAMKBUnlockDeviceSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBUnlockDevice");
    v4[3] = (uint64_t)v0;
    get_LAMKBUnlockDeviceSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBGetDeviceConfigurationsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr;
  v6 = get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBGetDeviceConfigurations");
    v4[3] = (uint64_t)v0;
    get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBGetDeviceLockStateSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBGetDeviceLockStateSymbolLoc_ptr;
  v6 = get_LAMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBGetDeviceLockState");
    v4[3] = (uint64_t)v0;
    get_LAMKBGetDeviceLockStateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBGetDeviceLockStateInfoSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  v6 = get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBGetDeviceLockStateInfo");
    v4[3] = (uint64_t)v0;
    get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBDeviceUnlockedSinceBootSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v6 = get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBDeviceUnlockedSinceBoot");
    v4[3] = (uint64_t)v0;
    get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7F984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBDeviceLockAssertionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBDeviceLockAssertionSymbolLoc_ptr;
  v6 = get_LAMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!get_LAMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBDeviceLockAssertion");
    v4[3] = (uint64_t)v0;
    get_LAMKBDeviceLockAssertionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  v6 = get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBKeyBagKeyStashCreateWithOpts");
    v4[3] = (uint64_t)v0;
    get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBKeyBagKeyStashCommitSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  v6 = get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBKeyBagKeyStashCommit");
    v4[3] = (uint64_t)v0;
    get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBKeyBagKeyStashVerifySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  v6 = get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBKeyBagKeyStashVerify");
    v4[3] = (uint64_t)v0;
    get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBEventsRegisterSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBEventsRegisterSymbolLoc_ptr;
  v6 = get_LAMKBEventsRegisterSymbolLoc_ptr;
  if (!get_LAMKBEventsRegisterSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBEventsRegister");
    v4[3] = (uint64_t)v0;
    get_LAMKBEventsRegisterSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBEventsUnregisterSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBEventsUnregisterSymbolLoc_ptr;
  v6 = get_LAMKBEventsUnregisterSymbolLoc_ptr;
  if (!get_LAMKBEventsUnregisterSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBEventsUnregister");
    v4[3] = (uint64_t)v0;
    get_LAMKBEventsUnregisterSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBKeyBagPerformRecoverySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr;
  v6 = get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr;
  if (!get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBKeyBagPerformRecovery");
    v4[3] = (uint64_t)v0;
    get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *get_LAMKBPrewarmSPSSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)get_LAMKBPrewarmSPSSymbolLoc_ptr;
  v6 = get_LAMKBPrewarmSPSSymbolLoc_ptr;
  if (!get_LAMKBPrewarmSPSSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "_LAMKBPrewarmSPS");
    v4[3] = (uint64_t)v0;
    get_LAMKBPrewarmSPSSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18AB7FE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id SBFWindowForViewControllerTransition(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "containerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "window");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

const __CFString *SBFStringForAppearState(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("[Invalid]");
  else
    return off_1E200E350[a1];
}

BOOL SBFIsSymbolicLinkAtPath(void *a1)
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  return !lstat((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v3)
      && (v3.st_mode & 0xF000) == 40960;
}

double SBFModificationDateForPath(void *a1)
{
  int v1;
  double result;
  stat v3;

  memset(&v3, 0, sizeof(v3));
  v1 = stat((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v3);
  result = 0.0;
  if (!v1)
    return (double)v3.st_mtimespec.tv_nsec / 1000000000.0 + (double)v3.st_mtimespec.tv_sec + -978307200.0;
  return result;
}

uint64_t SBFEnsureDirectoryExistsAtPath(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  void *v4;

  v1 = objc_retainAutorelease(a1);
  v2 = mkdir((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, 0);

  }
  return v3;
}

id SBFCachedNSHomeDirectory()
{
  if (SBFCachedNSHomeDirectory_sbf_once_token_0 != -1)
    dispatch_once(&SBFCachedNSHomeDirectory_sbf_once_token_0, &__block_literal_global_2);
  return (id)SBFCachedNSHomeDirectory_sbf_once_object_0;
}

id SBFCachesPathForSandboxPath(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1)
  {
    SBFCachedNSHomeDirectory();
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _SBFScreenTimeRegisterForExternalChangeNotification()
{
  if (_SBFScreenTimeRegisterForExternalChangeNotification___once != -1)
    dispatch_once(&_SBFScreenTimeRegisterForExternalChangeNotification___once, &__block_literal_global_3);
}

uint64_t _SBFScreenTimePostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1;

  v1 = state64;
  LODWORD(state64) = _SBFScreenTimePostExternalChangeNotification_token;
  if (_SBFScreenTimePostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.screenchanged", &_SBFScreenTimePostExternalChangeNotification_token), state64 = _SBFScreenTimePostExternalChangeNotification_token, _SBFScreenTimePostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.screenchanged");
  }
  return state64;
}

__CFString *_SBFScreenTimeNameForCategory(unsigned int a1)
{
  if (a1 > 0x13)
    return 0;
  else
    return off_1E200E3E8[a1];
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

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t _SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent()
{
  if ((BSFloatEqualToFloat() & 1) != 0 || (BSFloatEqualToFloat() & 1) != 0)
    return 1;
  else
    return BSFloatEqualToFloat();
}

void sub_18AB84DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB888C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E618;
    v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
    __getSBUILegibilityLabelClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SBUILegibilityLabel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBUILegibilityLabelClass_block_invoke_cold_2();
  getSBUILegibilityLabelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSProminentLayoutControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E630;
    v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
    __getCSProminentLayoutControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CSProminentLayoutController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSProminentLayoutControllerClass_block_invoke_cold_2();
  getCSProminentLayoutControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AB8CDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromSBFAuthenticationState(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E200E8B0[a1];
}

void sub_18AB8E2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB8EEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB90384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
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

void sub_18AB90784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAAUIDeviceLocatorServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E898;
    v5 = 0;
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountUILibraryCore_frameworkLibrary)
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AAUIDeviceLocatorService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_2();
  getAAUIDeviceLocatorServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_18AB9123C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AB91BB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AB91C20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AB924C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SBFFeatureAvailabilityComputeBool(void *a1, int a2, unsigned __int8 *a3, uint64_t (*a4)(void))
{
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  NSObject *v14;
  const char *v15;
  unsigned __int8 v16;
  int v18;
  id v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = atomic_load(a3);
  if (v8)
  {
    LOBYTE(v9) = v8 - 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v10, "BOOLForKey:", v7);
      v9 = v12;
      if (v12)
        v13 = 3;
      else
        v13 = 2;
      atomic_store(v13, a3);
      if (v12 != a2)
      {
        SBLogFeatureFlags();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = "NO";
          if (v9)
            v15 = "YES";
          v18 = 138412546;
          v19 = v7;
          v20 = 2080;
          v21 = v15;
          _os_log_impl(&dword_18AB69000, v14, OS_LOG_TYPE_DEFAULT, "%@=%s", (uint8_t *)&v18, 0x16u);
        }

      }
    }
    else
    {
      if (a4)
        v9 = a4();
      else
        v9 = a2;
      if (v9)
        v16 = 3;
      else
        v16 = 2;
      atomic_store(v16, a3);
    }

  }
  return (char)v9;
}

BOOL SBFIsChamoisExternalDisplayControllerAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ChamoisExternalDisplayControllerStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBChamoisExternalDisplayController"), 0, __ChamoisExternalDisplayControllerStorage, ChamoisExternalDisplayControllerDefaultValueFunction) == 0;
  return !v1;
}

uint64_t ChamoisExternalDisplayControllerDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1)
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 2) == 0)
    return 0;
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisExternalDisplayController(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ChamoisExternalDisplayControllerStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ChamoisExternalDisplayControllerStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisExternalDisplayControllerStorage);
  return result;
}

uint64_t ChamoisWindowingUIDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1)
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 1) == 0)
    return 0;
  if ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0)
    return 1;
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisWindowingUI(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ChamoisWindowingUIStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ChamoisWindowingUIStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisWindowingUIStorage);
  return result;
}

BOOL SBFIsChamoisOverflowGestureAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load((unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBChamoisOverflowGesture"), 0, (unsigned __int8 *)&__ChamoisOverflowGestureStorage, 0) == 0;
  return !v1;
}

uint64_t SBFTestWithChamoisOverflowGesture(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load((unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, (unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  return result;
}

BOOL SBFIsChamoisFullScreenToStripGroupOpacityAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ChamoisFullScreenToStripGroupOpacityStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBChamoisFullScreenToStripGroupOpacity"), 0, __ChamoisFullScreenToStripGroupOpacityStorage, (uint64_t (*)(void))ChamoisFullScreenToStripGroupOpacityDefaultValueFunction) == 0;
  return !v1;
}

BOOL ChamoisFullScreenToStripGroupOpacityDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1)
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  return SBSupportedChamoisFeatures_sFeaturesMask == -1;
}

uint64_t SBFTestWithChamoisFullScreenToStripGroupOpacity(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ChamoisFullScreenToStripGroupOpacityStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ChamoisFullScreenToStripGroupOpacityStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisFullScreenToStripGroupOpacityStorage);
  return result;
}

uint64_t ChamoisStripDisabledWhenHiddenDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisStripDisabledWhenHidden(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ChamoisStripDisabledWhenHiddenStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ChamoisStripDisabledWhenHiddenStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisStripDisabledWhenHiddenStorage);
  return result;
}

BOOL SBFIsShellSceneKitAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ShellSceneKitStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBShellSceneKit"), 0, __ShellSceneKitStorage, ShellSceneKitDefaultValueFunction) == 0;
  return !v1;
}

uint64_t ShellSceneKitDefaultValueFunction()
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

uint64_t SBFTestWithShellSceneKit(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ShellSceneKitStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ShellSceneKitStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ShellSceneKitStorage);
  return result;
}

BOOL SBFIsOnenessAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__OnenessStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBOneness"), 0, __OnenessStorage, OnenessDefaultValueFunction) == 0;
  return !v1;
}

uint64_t OnenessDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOneness(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__OnenessStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __OnenessStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessStorage);
  return result;
}

BOOL SBFIsOnenessHomeScreenEditingAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__OnenessHomeScreenEditingStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBOnenessHomeScreenEditing"), 0, __OnenessHomeScreenEditingStorage, OnenessHomeScreenEditingDefaultValueFunction) == 0;
  return !v1;
}

uint64_t OnenessHomeScreenEditingDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOnenessHomeScreenEditing(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__OnenessHomeScreenEditingStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __OnenessHomeScreenEditingStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessHomeScreenEditingStorage);
  return result;
}

BOOL SBFIsOnenessHomeScreenOnEmbeddedAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__OnenessHomeScreenOnEmbeddedStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBOnenessHomeScreenOnEmbedded"), 0, __OnenessHomeScreenOnEmbeddedStorage, OnenessHomeScreenOnEmbeddedDefaultValueFunction) == 0;
  return !v1;
}

uint64_t OnenessHomeScreenOnEmbeddedDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOnenessHomeScreenOnEmbedded(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__OnenessHomeScreenOnEmbeddedStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __OnenessHomeScreenOnEmbeddedStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessHomeScreenOnEmbeddedStorage);
  return result;
}

BOOL SBFIsScreenLongevityAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__ScreenLongevityStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBScreenLongevity"), 0, __ScreenLongevityStorage, ScreenLongevityDefaultValueFunction) == 0;
  return !v1;
}

uint64_t ScreenLongevityDefaultValueFunction()
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return MGGetBoolAnswer();
}

uint64_t SBFTestWithScreenLongevity(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__ScreenLongevityStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __ScreenLongevityStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ScreenLongevityStorage);
  return result;
}

BOOL SBFIsSAEPersistentSiriAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__SAEPersistentSiriStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBSAEPersistentSiri"), 0, __SAEPersistentSiriStorage, SAEPersistentSiriDefaultValueFunction) == 0;
  return !v1;
}

uint64_t SAEPersistentSiriDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEPersistentSiri(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__SAEPersistentSiriStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __SAEPersistentSiriStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAEPersistentSiriStorage);
  return result;
}

uint64_t MoreForegroundAppsDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1)
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 1) != 0)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t SBFTestWithMoreForegroundApps(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__MoreForegroundAppsStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __MoreForegroundAppsStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __MoreForegroundAppsStorage);
  return result;
}

uint64_t SAEHungryHomeAffordanceDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEHungryHomeAffordance(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load((unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  return result;
}

BOOL SBFIsSAETappyHomeAffordanceAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__SAETappyHomeAffordanceStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBSAETappyHomeAffordance"), 0, __SAETappyHomeAffordanceStorage, SAETappyHomeAffordanceDefaultValueFunction) == 0;
  return !v1;
}

uint64_t SAETappyHomeAffordanceDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAETappyHomeAffordance(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__SAETappyHomeAffordanceStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __SAETappyHomeAffordanceStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAETappyHomeAffordanceStorage);
  return result;
}

BOOL SBFIsSAEIncreasedInsetAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load(__SAEIncreasedInsetStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBSAEIncreasedInset"), 0, __SAEIncreasedInsetStorage, SAEIncreasedInsetDefaultValueFunction) == 0;
  return !v1;
}

uint64_t SAEIncreasedInsetDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEIncreasedInset(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load(__SAEIncreasedInsetStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, __SAEIncreasedInsetStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAEIncreasedInsetStorage);
  return result;
}

BOOL SBFIsIRDCResetAvailable()
{
  int v0;
  BOOL v1;

  v0 = atomic_load((unsigned __int8 *)&__IRDCResetStorage);
  if (v0)
    v1 = v0 == 2;
  else
    v1 = _SBFFeatureAvailabilityComputeBool(CFSTR("SBIRDCReset"), 0, (unsigned __int8 *)&__IRDCResetStorage, IRDCResetDefaultValueFunction) == 0;
  return !v1;
}

uint64_t IRDCResetDefaultValueFunction()
{
  return MGIsDeviceOneOfType();
}

uint64_t SBFTestWithIRDCReset(int a1, uint64_t a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  uint64_t result;

  v2 = atomic_load((unsigned __int8 *)&__IRDCResetStorage);
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, (unsigned __int8 *)&__IRDCResetStorage);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__IRDCResetStorage);
  return result;
}

const __CFString *NSStringFromSBFAuthenticationAssertionType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E200E930[a1];
}

void sub_18AB957BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_18AB96788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB96A54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t _SBF_Private_IsN84OrSimilarDevice()
{
  if (_SBF_Private_IsN84OrSimilarDevice_onceToken != -1)
    dispatch_once(&_SBF_Private_IsN84OrSimilarDevice_onceToken, &__block_literal_global_15);
  return _SBF_Private_IsN84OrSimilarDevice_isN84OrSimilarDevice;
}

uint64_t _SBF_Private_IsN84ZoomedOrSimilarDevice()
{
  if (_SBF_Private_IsN84ZoomedOrSimilarDevice_onceToken != -1)
    dispatch_once(&_SBF_Private_IsN84ZoomedOrSimilarDevice_onceToken, &__block_literal_global_1);
  return _SBF_Private_IsN84ZoomedOrSimilarDevice_isN84Zoomed4OrSimilarDevice;
}

uint64_t _SBF_Private_IsD33OrSimilarDevice()
{
  if (_SBF_Private_IsD33OrSimilarDevice_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD33OrSimilarDevice_onceToken, &__block_literal_global_2);
  return _SBF_Private_IsD33OrSimilarDevice_isD33OrSimilarDevice;
}

uint64_t _SBF_Private_IsD52OrSimilarDevice()
{
  if (_SBF_Private_IsD52OrSimilarDevice_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD52OrSimilarDevice_onceToken, &__block_literal_global_4);
  return _SBF_Private_IsD52OrSimilarDevice_isD52OrSimilarDevice;
}

uint64_t _SBF_Private_IsD52ZoomedOrSimilarDevice()
{
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD52ZoomedOrSimilarDevice_onceToken, &__block_literal_global_5_0);
  return _SBF_Private_IsD52ZoomedOrSimilarDevice_isD52ZoomedOrSimilarDevice;
}

uint64_t _SBF_Private_IsD54()
{
  if (_SBF_Private_IsD54_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD54_onceToken, &__block_literal_global_6_0);
  return _SBF_Private_IsD54_isD54;
}

uint64_t _SBF_Private_IsD53()
{
  if (_SBF_Private_IsD53_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD53_onceToken, &__block_literal_global_10);
  return _SBF_Private_IsD53_isD53;
}

uint64_t _SBF_Private_IsD16()
{
  if (_SBF_Private_IsD16_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD16_onceToken, &__block_literal_global_13);
  return _SBF_Private_IsD16_isD16;
}

uint64_t _SBF_Private_IsD17()
{
  if (_SBF_Private_IsD17_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD17_onceToken, &__block_literal_global_16_0);
  return _SBF_Private_IsD17_isD17;
}

uint64_t _SBF_Private_IsD63()
{
  if (_SBF_Private_IsD63_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD63_onceToken, &__block_literal_global_19);
  return _SBF_Private_IsD63_isD63;
}

uint64_t _SBF_Private_IsD64()
{
  if (_SBF_Private_IsD64_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD64_onceToken, &__block_literal_global_22_0);
  return _SBF_Private_IsD64_isD64;
}

uint64_t _SBF_Private_IsD63Like()
{
  if (_SBF_Private_IsD63Like_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD63Like_onceToken, &__block_literal_global_25);
  return _SBF_Private_IsD63Like_isD63Like;
}

uint64_t _SBF_Private_IsD64Like()
{
  if (_SBF_Private_IsD64Like_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD64Like_onceToken, &__block_literal_global_36_0);
  return _SBF_Private_IsD64Like_isD64Like;
}

uint64_t _SBF_Private_IsD93Like()
{
  if (_SBF_Private_IsD93Like_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD93Like_onceToken, &__block_literal_global_47);
  return _SBF_Private_IsD93Like_isD93Like;
}

uint64_t _SBF_Private_IsD94Like()
{
  if (_SBF_Private_IsD94Like_onceToken != -1)
    dispatch_once(&_SBF_Private_IsD94Like_onceToken, &__block_literal_global_50);
  return _SBF_Private_IsD94Like_isD94Like;
}

__CFString *SBExternalDisplayEducationReasonMaskDescription(uint64_t a1)
{
  void *v3;
  id v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  char v16;

  if (!a1)
    return CFSTR(".None");
  if (a1 == 3)
    return CFSTR(".All");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __SBExternalDisplayEducationReasonMaskDescription_block_invoke;
  v11 = &unk_1E200EDA8;
  v13 = v14;
  v4 = v3;
  v12 = v4;
  v5 = v9;
  v16 = 0;
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.i32[0];
  if (v6.i32[0])
  {
    v8 = 0;
    do
    {
      if (((1 << v8) & a1) != 0)
      {
        ((void (*)(_QWORD *))v10)(v5);
        if (v16)
          break;
        --v7;
      }
      if (v8 > 0x3E)
        break;
      ++v8;
    }
    while (v7 > 0);
  }

  _Block_object_dispose(v14, 8);
  return (__CFString *)v4;
}

void sub_18AB98B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB99F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB9A134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
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

void sub_18AB9A3CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AB9A45C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SBLogAnimation()
{
  if (SBLogAnimation_onceToken != -1)
    dispatch_once(&SBLogAnimation_onceToken, &__block_literal_global_16);
  return (id)SBLogAnimation___logObj;
}

id SBLogWallpaper()
{
  if (SBLogWallpaper_onceToken != -1)
    dispatch_once(&SBLogWallpaper_onceToken, &__block_literal_global_5_1);
  return (id)SBLogWallpaper___logObj;
}

id SBLogTailspinSignposts()
{
  if (SBLogTailspinSignposts_onceToken != -1)
    dispatch_once(&SBLogTailspinSignposts_onceToken, &__block_literal_global_9);
  return (id)SBLogTailspinSignposts___logObj;
}

id SBLogWebClip()
{
  if (SBLogWebClip_onceToken != -1)
    dispatch_once(&SBLogWebClip_onceToken, &__block_literal_global_13_0);
  return (id)SBLogWebClip___logObj;
}

id SBLogCellularLogCollection()
{
  if (SBLogCellularLogCollection_onceToken != -1)
    dispatch_once(&SBLogCellularLogCollection_onceToken, &__block_literal_global_15);
  return (id)SBLogCellularLogCollection___logObj;
}

id SBLogFeatureFlags()
{
  if (SBLogFeatureFlags_onceToken != -1)
    dispatch_once(&SBLogFeatureFlags_onceToken, &__block_literal_global_17);
  return (id)SBLogFeatureFlags___logObj;
}

id SBLogLiveRendering()
{
  if (SBLogLiveRendering_onceToken != -1)
    dispatch_once(&SBLogLiveRendering_onceToken, &__block_literal_global_19_0);
  return (id)SBLogLiveRendering___logObj;
}

void sub_18AB9B7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTMaterialLayerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreMaterialLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200F038;
    v5 = 0;
    CoreMaterialLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreMaterialLibraryCore_frameworkLibrary)
    __getMTMaterialLayerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("MTMaterialLayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTMaterialLayerClass_block_invoke_cold_2();
  getMTMaterialLayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double SBFEffectiveDisplayCornerRadius()
{
  if (SBFEffectiveDisplayCornerRadius_onceToken != -1)
    dispatch_once(&SBFEffectiveDisplayCornerRadius_onceToken, &__block_literal_global_4_0);
  return *(double *)&SBFEffectiveDisplayCornerRadius_displayCornerRadius;
}

void sub_18AB9C310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBFIsReducedQualityDevice()
{
  if (SBFIsReducedQualityDevice_onceToken != -1)
    dispatch_once(&SBFIsReducedQualityDevice_onceToken, &__block_literal_global_21);
  return SBFIsReducedQualityDevice_isReducedQualityDevice;
}

void sub_18AB9EC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double convertTensionAndFrictionToDampingRatioAndResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double convertDampingMassAndStiffnessToDampingRatioAndResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  v5 = sqrt(a5 / a4);
  if (a1)
  {
    result = result / a4 / (v5 + v5);
    *a1 = result;
  }
  if (a2)
  {
    result = 6.28318531 / v5;
    *a2 = 6.28318531 / v5;
  }
  return result;
}

void sub_18ABA2528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18ABA2BD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_18ABA314C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_18ABA34E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

__CFString *SBFImageNameModifierSuffix(int a1, double a2, double a3)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v7 = a3;
    v5 = a2;
  }
  if (__sb__runningInSpringBoard())
  {
    v8 = SBFEffectiveDeviceClass();
    v9 = 320.0;
    v10 = 480.0;
    if (v8 != 2 || v5 == 320.0)
      goto LABEL_14;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") != 1)
  {

    v9 = 320.0;
    goto LABEL_12;
  }

  v9 = 320.0;
  if (v5 == 320.0)
  {
LABEL_12:
    *(double *)&v12 = 480.0;
    goto LABEL_13;
  }
LABEL_10:
  v9 = 768.0;
  *(double *)&v12 = 1024.0;
LABEL_13:
  v10 = *(double *)&v12;
LABEL_14:
  if (v5 == v9)
  {
    v13 = &stru_1E2010FC0;
  }
  else
  {
    objc_msgSend(&stru_1E2010FC0, "stringByAppendingFormat:", CFSTR("-%.0fw"), *(_QWORD *)&v5);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 != v10)
  {
    -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("-%.0fh"), *(_QWORD *)&v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
  }
  return v13;
}

id SBFModifiedImageNameForName(void *a1, int a2, double a3, double a4)
{
  void *v4;
  void *v5;
  void *v6;
  id v10;
  int v11;
  char v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v17;
  int v18;
  char v19;
  int v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  double v26;
  void *v27;
  int v28;
  void *v29;

  v10 = a1;
  v11 = __sb__runningInSpringBoard();
  v12 = v11;
  if (v11)
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      goto LABEL_31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "userInterfaceIdiom"))
    {

      goto LABEL_31;
    }
  }
  v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "userInterfaceIdiom") != 1)
    {
      v14 = 0;
      v15 = 1;
      goto LABEL_17;
    }
  }
  v15 = v13 ^ 1;
  v16 = __sb__runningInSpringBoard();
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v17 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v20 = 1;
    if ((v16 & 1) == 0)
      goto LABEL_34;
    goto LABEL_25;
  }
  v14 = v16 ^ 1;
LABEL_17:
  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v20 = a2 ^ 1;
      if ((v14 & 1) != 0)
        goto LABEL_34;
LABEL_25:
      if (!v15)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom") != 1)
    {
      v20 = a2 ^ 1;

      if ((v14 & 1) != 0)
        goto LABEL_34;
      goto LABEL_25;
    }
  }
  v28 = v15;
  v21 = __sb__runningInSpringBoard();
  v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v26 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v20 = 1;
    if ((v22 & 1) != 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  v20 = a2 ^ 1;
  if ((v22 & 1) == 0)
LABEL_41:

LABEL_42:
  if ((v19 & 1) != 0)
  {
    v15 = v28;
    if (!v14)
      goto LABEL_25;
  }
  else
  {

    v15 = v28;
    if ((v14 & 1) == 0)
      goto LABEL_25;
  }
LABEL_34:

  if ((v15 & 1) != 0)
LABEL_26:

LABEL_27:
  if ((v12 & 1) != 0)
  {
    v23 = v10;
    if (!v20)
      goto LABEL_32;
    goto LABEL_31;
  }

  v23 = v10;
  if ((v20 & 1) != 0)
  {
LABEL_31:
    SBFImageNameModifierSuffix(a2, a3, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_32:

  return v23;
}

id SBFModifiedFullscreenImageNameForName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CEA950];
  v2 = a1;
  objc_msgSend(v1, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  SBFModifiedImageNameForName(v2, 1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__IOSurface *SBFCreateIOSurfaceForImage(void *a1, uint64_t *a2, int a3)
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
  CGImage *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ColorSpace;
  CGColorSpace *v27;
  CGColorSpace *DeviceRGB;
  CFPropertyListRef v29;
  const void *v30;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *SBFCreateIOSurfaceForImage(UIImage *__strong, CGImageBlockSetRef *, BOOL)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("SBFImageUtilities.m"), 151, CFSTR("Must have an outBlockSet to release later"));

  }
  objc_msgSend(v5, "ioSurface");
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
    if (MEMORY[0x18D7739D4](*MEMORY[0x1E0CBC1E0]) >= vcvtpd_u64_f64(v9 * v12)
      && MEMORY[0x18D7739D4](*MEMORY[0x1E0CBC008]) >= vcvtpd_u64_f64(v9 * v11))
    {
      v13 = objc_retainAutorelease(v5);
      v14 = (CGImage *)objc_msgSend(v13, "CGImage");
      if (CGImageGetBitsPerComponent(v14) > 8)
        goto LABEL_22;
      CGImageGetWidth(v14);
      CGImageGetHeight(v14);
      if (!CGImageGetImageProvider())
        goto LABEL_22;
      v15 = *MEMORY[0x1E0C9AE50];
      v16 = *MEMORY[0x1E0C9DAB0];
      if (a3)
      {
        v37[0] = *MEMORY[0x1E0C9DAC0];
        v37[1] = v16;
        v17 = *MEMORY[0x1E0C9DAA8];
        v38[0] = v15;
        v38[1] = v17;
        v37[2] = *MEMORY[0x1E0C9DAB8];
        v38[2] = v15;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = v38;
        v20 = v37;
        v21 = 3;
      }
      else
      {
        v35[0] = *MEMORY[0x1E0C9DAC0];
        v35[1] = v16;
        v22 = *MEMORY[0x1E0C9DAA8];
        v36[0] = v15;
        v36[1] = v22;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = v36;
        v20 = v35;
        v21 = 2;
      }
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CGImageProviderCopyImageBlockSetWithOptions();
      if (v24)
      {
        v25 = v24;
        CGImageBlockSetGetImageBlock();
        CGImageBlockGetBytesPerRow();
        CGImageBlockGetData();
        v7 = (__IOSurface *)IOSurfaceWrapClientImage();
        *a2 = v25;
        ColorSpace = CGImageProviderGetColorSpace();
        if (ColorSpace)
        {
          v27 = (CGColorSpace *)ColorSpace;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
          {
            v29 = CGColorSpaceCopyPropertyList(v27);
            if (v29)
            {
              v30 = v29;
              IOSurfaceSetValue(v7, (CFStringRef)*MEMORY[0x1E0CBBF90], v29);
              CFRelease(v30);
            }
          }
          CGColorSpaceRelease(DeviceRGB);
        }
      }
      else
      {
        v7 = 0;
      }

      if (!v7)
      {
LABEL_22:
        MGGetBoolAnswer();
        objc_msgSend(v13, "size");
        objc_msgSend(v13, "scale");
        objc_msgSend(v13, "sbf_colorSpace");
        v34 = v13;
        BSUISurfaceWithColorSpaceAndDrawBlock();
        v7 = (__IOSurface *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id __sbfImageByApplyingColorSpace(void *a1, CGColorSpace *a2)
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

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");
  if (!v4)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __sbfImageByApplyingColorSpace_cold_1((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  v5 = v4;
  ColorSpace = CGImageGetColorSpace(v4);
  if (!ColorSpace)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __sbfImageByApplyingColorSpace_cold_2((uint64_t)v3, v10, v17, v18, v19, v20, v21, v22);
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
          SBLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __sbfImageByApplyingColorSpace_cold_4();
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
            SBLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              __sbfImageByApplyingColorSpace_cold_3(v7);
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
      v28 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v3, "scale");
      v23 = (void *)objc_msgSend(v28, "initWithCGImage:scale:orientation:", v27, objc_msgSend(v3, "imageOrientation"), v29);

      CFRelease(v27);
    }
    else
    {
      SBLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = 138412802;
        v33 = v8;
        v34 = 2112;
        v35 = v5;
        v36 = 2114;
        v37 = v7;
        _os_log_error_impl(&dword_18AB69000, v30, OS_LOG_TYPE_ERROR, " [SBFImageColorSpaceUtilities] failed to create copy with colorSpace=%@ of original CGImage=%@ with colorSpace=%{public}@", (uint8_t *)&v32, 0x20u);
      }

      v23 = v3;
    }
  }
  CGColorSpaceRelease(v8);
LABEL_32:

  return v23;
}

__CFString *SBFGraphicsContextTypeDescription(unint64_t a1)
{
  if (a1 < 5)
    return off_1E200F448[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void releaseIOSurface(void *a1)
{
  objc_msgSend(a1, "unlockWithOptions:seed:", 1, 0);
  objc_msgSend(a1, "decrementUseCount");

}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t SBFInterfaceOrientationMaskForInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

uint64_t SBFFirstInterfaceOrientationInInterfaceOrientationMask(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 4;
  v2 = 3;
  if ((a1 & 8) == 0)
    v2 = (a1 >> 1) & 2;
  if ((a1 & 0x10) == 0)
    v1 = v2;
  if ((a1 & 2) != 0)
    return 1;
  else
    return v1;
}

uint64_t SBFInterfaceOrientationMaskForInterfaceOrientationPair(uint64_t a1)
{
  uint64_t v1;

  v1 = 24;
  if ((unint64_t)(a1 - 3) >= 2)
    v1 = 0;
  if ((unint64_t)(a1 - 1) >= 2)
    return v1;
  else
    return 6;
}

const __CFString *SBFStringForBSDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E200F470[a1 - 1];
}

__CFString *SBFStringForBSInterfaceOrientation(uint64_t a1)
{
  if (!a1)
    return CFSTR("unknown");
  SBFStringForBSInterfaceOrientationMask((1 << a1) & 0x1E);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SBFStringForBSInterfaceOrientationMask(uint64_t a1)
{
  char v1;
  __CFString *v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v2 = CFSTR("none");
    return v2;
  }
  v1 = a1;
  if (a1 != 30)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v1 & 2) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("Pu"));
      if ((v1 & 0x10) == 0)
      {
LABEL_7:
        if ((v1 & 8) == 0)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    else if ((v1 & 0x10) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("Ll"));
    if ((v1 & 8) == 0)
    {
LABEL_8:
      if ((v1 & 4) == 0)
      {
LABEL_10:
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
LABEL_9:
      objc_msgSend(v4, "addObject:", CFSTR("Pd"));
      goto LABEL_10;
    }
LABEL_14:
    objc_msgSend(v4, "addObject:", CFSTR("Lr"));
    if ((v1 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v2 = CFSTR("All");
  return v2;
}

const __CFString *SBFStringForUIDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E200F470[a1 - 1];
}

void sub_18ABA70E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBFDashBoardPadPageInsetsMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, __int128 a10, uint64_t a11, uint64_t a12)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a7;
  *(double *)(a1 + 48) = a8;
  *(double *)(a1 + 56) = a9;
  *(_OWORD *)(a1 + 64) = a10;
  *(_QWORD *)(a1 + 80) = a11;
  *(_QWORD *)(a1 + 88) = a12;
}

const __CFString *SBScreenWakeStateDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("sleep");
  if (a1 == 2)
    return CFSTR("awake");
  else
    return v1;
}

void _SBFGetHSBAValuesForColor(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  id v10;

  v9 = a1;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v10 = objc_retainAutorelease(v9);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v10, "CGColor")) == 2)
    objc_msgSend(v10, "getWhite:alpha:", a4, a5);
  else
    objc_msgSend(v10, "getHue:saturation:brightness:alpha:", a2, a3, a4, a5);

}

void _SBFGetHSBValuesForColor(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _SBFGetHSBAValuesForColor(a1, a2, a3, a4, 0);
}

void _SBFGetRGBAValuesForColor(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  id v10;
  uint64_t v11;

  v9 = a1;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v10 = objc_retainAutorelease(v9);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v10, "CGColor")) == 2)
  {
    v11 = 0;
    objc_msgSend(v10, "getWhite:alpha:", &v11, a5);
    if (a2)
      *a2 = v11;
    if (a3)
      *a3 = v11;
    if (a4)
      *a4 = v11;
  }
  else
  {
    objc_msgSend(v10, "getRed:green:blue:alpha:", a2, a3, a4, a5);
  }

}

void _SBFGetRGBValuesForColor(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _SBFGetRGBAValuesForColor(a1, a2, a3, a4, 0);
}

void sub_18ABB0734(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id SBCompletionBlockC2ToBS(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __SBCompletionBlockC2ToBS_block_invoke;
    v5[3] = &unk_1E200F650;
    v6 = v1;
    v3 = (void *)MEMORY[0x18D774178](v5);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SBCompletionBlockBSToC2(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __SBCompletionBlockBSToC2_block_invoke;
    v5[3] = &unk_1E200F400;
    v6 = v1;
    v3 = (void *)MEMORY[0x18D774178](v5);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

const __CFString *NSStringFromSBFWebClipSanitizationResult(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(Unknown SBFWebClipSanitizationResult)");
  else
    return off_1E200F768[a1];
}

const __CFString *NSStringFromSBFWebClipSanitizationError(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(Unknown SBFWebClipSanitizationError)");
  else
    return off_1E200F780[a1];
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *SBFStringForUIUserInterfaceStyle(unint64_t a1)
{
  if (a1 < 3)
    return off_1E200F798[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id SBFFrameRateReasonString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)SBFFrameRateReasonString___reasons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)SBFFrameRateReasonString___reasons;
    if (!SBFFrameRateReasonString___reasons)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)SBFFrameRateReasonString___reasons;
      SBFFrameRateReasonString___reasons = v6;

      v5 = (void *)SBFFrameRateReasonString___reasons;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard.%lu"), a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, v9);

  }
  v10 = (void *)SBFFrameRateReasonString___reasons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_18ABB24C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id SBFComposedColor(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = a1;
  v6 = a2;
  v20 = 0.0;
  v21 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  if ((objc_msgSend(v5, "getRed:green:blue:alpha:", &v21, &v20, &v19, &v18) & 1) == 0)
  {
    v17 = 0.0;
    objc_msgSend(v5, "getWhite:alpha:", &v17, &v18);
    v19 = v17;
    v20 = v17;
    v21 = v17;
  }
  v16 = 0.0;
  v17 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  if ((objc_msgSend(v6, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14) & 1) == 0)
  {
    v13 = 0.0;
    objc_msgSend(v6, "getWhite:alpha:", &v13, &v14);
    v15 = v13;
    v16 = v13;
    v17 = v13;
  }
  if ((_DWORD)a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBFComposedColor does not support blend mode %d. But you can add it!"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", ((1.0 - v18) * (v14 * v17) + v21 * v18) / (v18 + v14 * (1.0 - v18)), ((1.0 - v18) * (v14 * v16) + v20 * v18) / (v18 + v14 * (1.0 - v18)), ((1.0 - v18) * (v14 * v15) + v19 * v18) / (v18 + v14 * (1.0 - v18)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_18ABB2E68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t SBWakeLoggerSourceFromBacklightChangeSource(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (a1 > 19)
  {
    switch(a1)
    {
      case 47:
        return 5;
      case 34:
        return 6;
      case 20:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    v1 = a1 - 2;
    result = 1;
    switch(v1)
    {
      case 0:
        result = 3;
        break;
      case 1:
        result = 4;
        break;
      case 5:
        return 5;
      case 7:
        return result;
      default:
        return 0;
    }
  }
  return result;
}

const __CFString *SBWakeLoggerSourceDescription(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = CFSTR("TOUCH");
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("LIFT");
      break;
    case 2:
      result = CFSTR("HOME_BUTTON");
      break;
    case 3:
      result = CFSTR("LOCK_BUTTON");
      break;
    case 4:
      result = CFSTR("SMART_COVER");
      break;
    default:
      if (CFSTR("TOUCH") == (__CFString *)34)
        result = CFSTR("MOUSE_BUTTON");
      else
        result = CFSTR("unknown");
      break;
  }
  return result;
}

void sub_18ABB49F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E200F858;
    v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_0)
    __getSBUILegibilityLabelClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("SBUILegibilityLabel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBUILegibilityLabelClass_block_invoke_cold_2_0();
  getSBUILegibilityLabelClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SBFBundle()
{
  if (SBFBundle___onceToken != -1)
    dispatch_once(&SBFBundle___onceToken, &__block_literal_global_33);
  return (id)SBFBundle___springBoardFoundationBundle;
}

id SBFLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SBFBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E2010FC0, CFSTR("SpringBoardFoundation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t SBFCompareIntegers(uint64_t a1, uint64_t a2)
{
  if (a1 < a2)
    return -1;
  else
    return a1 > a2;
}

__CFString *SB_NSStringFromUIPressType(uint64_t a1)
{
  uint64_t v1;
  __CFString *result;

  if (a1 <= 201)
  {
    v1 = a1 + 1;
    a1 = (uint64_t)CFSTR("UIPressTypeUpArrow");
    switch(v1)
    {
      case 0:
        result = CFSTR("UIPressTypeNone");
        break;
      case 1:
        return (__CFString *)(id)a1;
      case 2:
        result = CFSTR("UIPressTypeDownArrow");
        break;
      case 3:
        result = CFSTR("UIPressTypeLeftArrow");
        break;
      case 4:
        result = CFSTR("UIPressTypeRightArrow");
        break;
      case 5:
        result = CFSTR("UIPressTypeSelect");
        break;
      case 6:
        result = CFSTR("UIPressTypeMenu");
        break;
      case 7:
        result = CFSTR("UIPressTypePlayPause");
        break;
      case 8:
        result = CFSTR("UIPressTypeBack");
        break;
      case 9:
        result = CFSTR("UIPressTypePlay");
        break;
      case 10:
        result = CFSTR("UIPressTypePause");
        break;
      case 11:
        result = CFSTR("UIPressTypeStop");
        break;
      case 12:
        result = CFSTR("UIPressTypeRewind");
        break;
      case 13:
        result = CFSTR("UIPressTypeFastForward");
        break;
      case 14:
        result = CFSTR("UIPressTypeNextTrack");
        break;
      case 15:
        result = CFSTR("UIPressTypePreviousTrack");
        break;
      case 16:
        result = CFSTR("UIPressTypeSkipForwards");
        break;
      case 17:
        result = CFSTR("UIPressTypeSkipBackwards");
        break;
      case 18:
        result = CFSTR("UIPressTypeDataOnScreen");
        break;
      case 19:
        result = CFSTR("UIPressTypeMicrophone");
        break;
      default:
        switch((unint64_t)CFSTR("UIPressTypeUpArrow"))
        {
          case 'e':
            result = CFSTR("UIPressTypeHome");
            break;
          case 'f':
            result = CFSTR("UIPressTypeVolumeUp");
            break;
          case 'g':
            result = CFSTR("UIPressTypeVolumeDown");
            break;
          case 'h':
            result = CFSTR("UIPressTypeLock");
            break;
          case 'i':
            result = CFSTR("UIPressTypeHomeTap");
            break;
          default:
            goto LABEL_33;
        }
        break;
    }
  }
  else if (a1 <= 399)
  {
    if (a1 == 202)
    {
      return CFSTR("UIPressTypeDone");
    }
    else if (a1 == 300)
    {
      return CFSTR("UIPressTypeWatchSide");
    }
    else
    {
LABEL_33:
      if (a1 <= 1999)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN UIPressType: %ld"), a1);
        a1 = objc_claimAutoreleasedReturnValue();
        return (__CFString *)(id)a1;
      }
      else
      {
        return CFSTR("UIPressTypeCustomOffset");
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 400:
        return CFSTR("UIPressTypeTelephoneFlash");
      case 401:
      case 402:
        a1 = (uint64_t)CFSTR("UIPressTypeTelephoneHookSwitch");
        return (__CFString *)(id)a1;
      case 403:
        return CFSTR("UIPressTypeTelephoneKey0");
      case 404:
        return CFSTR("UIPressTypeTelephoneKey1");
      case 405:
        return CFSTR("UIPressTypeTelephoneKey2");
      case 406:
        return CFSTR("UIPressTypeTelephoneKey3");
      case 407:
        return CFSTR("UIPressTypeTelephoneKey4");
      case 408:
        return CFSTR("UIPressTypeTelephoneKey5");
      case 409:
        return CFSTR("UIPressTypeTelephoneKey6");
      case 410:
        return CFSTR("UIPressTypeTelephoneKey7");
      case 411:
        return CFSTR("UIPressTypeTelephoneKey8");
      case 412:
        return CFSTR("UIPressTypeTelephoneKey9");
      case 413:
        return CFSTR("UIPressTypeTelephoneKeyStar");
      case 414:
        return CFSTR("UIPressTypeTelephoneKeyPound");
      case 415:
        return CFSTR("UIPressTypeTelephoneMute");
      default:
        if (a1 == 500)
        {
          result = CFSTR("UIPressTypeLaunchPad");
        }
        else
        {
          if (a1 != 501)
            goto LABEL_33;
          result = CFSTR("UIPressTypeExposeAll");
        }
        break;
    }
  }
  return result;
}

uint64_t SBBitmaskUnionIf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if ((*(unsigned int (**)(uint64_t))(a3 + 16))(a3))
    v5 = a2;
  else
    v5 = 0;
  return v5 | a1;
}

double _SBFLockScreenFloatFloorForMainScreenScale(double a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return floor(v4 * a1) / v4;
}

uint64_t SBValueIndexForCurrentContentSizeCategory()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB420]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB400]))
  {
    v2 = 2;
  }
  else
  {
    v2 = 3;
  }

  return v2;
}

Class __getSOSUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200F8B8;
    v5 = 0;
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SOSLibraryCore_frameworkLibrary)
    __getSOSUtilitiesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SOSUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSOSUtilitiesClass_block_invoke_cold_2();
  getSOSUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ABEF2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t SBValidateLogicalScale(void *a1, double a2, CGFloat a3, CGFloat a4)
{
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;
  CGSize v34;
  CGSize v35;
  CGSize v36;
  CGSize v37;
  CGSize v38;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  objc_msgSend(v7, "minimumLogicalScale");
  v9 = v8;
  objc_msgSend(v7, "maximumLogicalScale");
  v11 = v10;
  if ((BSFloatGreaterThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
  {
    SBLogDisplayScaleMapping();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v34.width = v9;
      v34.height = v11;
      NSStringFromCGSize(v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218754;
      v20 = a2;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = v7;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_18AB69000, v12, OS_LOG_TYPE_DEFAULT, "[SBValidateLogicalScale()] [rdar://102453240] [rdar://102453504] we're dropping logicalScale of %g because it's outside of logicalScaleLimits %{public}@; caDisplay: (%p) %{public}@",
        (uint8_t *)&v19,
        0x2Au);
LABEL_5:

    }
  }
  else
  {
    if ((BSFloatGreaterThanFloat() & 1) == 0 && !BSFloatGreaterThanFloat())
    {
      v14 = 1;
      goto LABEL_10;
    }
    SBLogDisplayScaleMapping();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v35.width = a3 * a2;
      v35.height = a4 * a2;
      NSStringFromCGSize(v35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36.width = a3;
      v36.height = a4;
      NSStringFromCGSize(v36);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37.width = 6144.0;
      v37.height = 3456.0;
      NSStringFromCGSize(v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38.width = v9;
      v38.height = v11;
      NSStringFromCGSize(v38);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134219522;
      v20 = a2;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2048;
      v30 = v7;
      v31 = 2114;
      v32 = v7;
      _os_log_error_impl(&dword_18AB69000, v12, OS_LOG_TYPE_ERROR, "[SBValidateLogicalScale()] [rdar://102453240] [rdar://102453504] we're dropping logicalScale of %g because scaledDisplaySize %{public}@ [%{public}@] is over our hard-coded display pipeline limit of %{public}@. logicalScaleLimits: %{public}@; caDisplay: (%p) %{public}@",
        (uint8_t *)&v19,
        0x48u);

      goto LABEL_5;
    }
  }

  v14 = 0;
LABEL_10:

  return v14;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return objc_opt_class();
}

void sub_18ABF08D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E200F998;
    v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_1)
    __getSBUILegibilityLabelClass_block_invoke_cold_1_1(&v3);
  result = objc_getClass("SBUILegibilityLabel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBUILegibilityLabelClass_block_invoke_cold_2_1();
  getSBUILegibilityLabelClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

CGImageRef _SBFCARendererCGImageForImageData(void *a1)
{
  const __CFData *v1;
  const __CFArray *ImagesFromData;
  const __CFArray *v3;
  CGImage *ValueAtIndex;
  CGImageRef ImageAtIndex;
  CGImageSource *v6;
  CGImageSource *v7;

  v1 = a1;
  ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (ImagesFromData)
  {
    v3 = ImagesFromData;
    ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
    if (ValueAtIndex)
    {
      ImageAtIndex = ValueAtIndex;
      CFRetain(ValueAtIndex);
      CFRelease(v3);
LABEL_8:
      objc_opt_class();
      objc_opt_isKindOfClass();
      goto LABEL_11;
    }
    CFRelease(v3);
  }
  v6 = CGImageSourceCreateWithData(v1, 0);
  if (!v6)
  {
LABEL_10:
    ImageAtIndex = 0;
    goto LABEL_11;
  }
  v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v7);
  if (ImageAtIndex)
    goto LABEL_8;
LABEL_11:

  return ImageAtIndex;
}

void sub_18ABF46CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCSProminentDisplayViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E200FA38;
    v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary_0)
    __getCSProminentDisplayViewControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CSProminentDisplayViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSProminentDisplayViewControllerClass_block_invoke_cold_2();
  getCSProminentDisplayViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double SBFMainScreenScale()
{
  if (SBFMainScreenScale___once != -1)
    dispatch_once(&SBFMainScreenScale___once, &__block_literal_global_38);
  return *(double *)&SBFMainScreenScale___mainScreenScale;
}

double SBFBoundPoint(double result, double a2, double a3, double a4, double a5)
{
  if (a3 >= result)
    result = a3;
  if (a5 <= result)
    return a5;
  return result;
}

BOOL SBFPointLessThanEqualToPoint(double a1, double a2, double a3, double a4)
{
  return a2 <= a4 && a1 <= a3;
}

BOOL SBFFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t SBFRectApproximatelyEqualToRect()
{
  if (BSFloatApproximatelyEqualToFloat()
    && BSFloatApproximatelyEqualToFloat()
    && BSFloatApproximatelyEqualToFloat())
  {
    return BSFloatApproximatelyEqualToFloat();
  }
  else
  {
    return 0;
  }
}

double SBFPointRoundForScale(double a1, double a2, double a3)
{
  double v5;

  v5 = SBFFloatRoundForScale(a1, a3);
  SBFFloatRoundForScale(a2, a3);
  return v5;
}

uint64_t SBFRectScaleWithScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  double Width;
  CGFloat v13;
  double Height;
  CGFloat v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  v13 = (Width - CGRectGetWidth(v17) * a5) * 0.5;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  Height = CGRectGetHeight(v18);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  v15 = (Height - CGRectGetHeight(v19) * a6) * 0.5;
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectInset(v20, v13, v15);
  return UIRectIntegralWithScale();
}

CGFloat SBFTransformForScalingAboutPointInSuperview@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>)
{
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGFloat result;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v8 = a4 - a2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v9 = a5 - a3;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a4 - a2, a5 - a3);
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v15.a = *(_OWORD *)a1;
  *(_OWORD *)&v15.c = v10;
  *(_OWORD *)&v15.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v16, &v15, a6, a6);
  v11 = *(_OWORD *)&v16.c;
  *(_OWORD *)a1 = *(_OWORD *)&v16.a;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v16.tx;
  v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v15.a = *(_OWORD *)a1;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v16, &v15, -v8, -v9);
  v13 = *(_OWORD *)&v16.c;
  *(_OWORD *)a1 = *(_OWORD *)&v16.a;
  *(_OWORD *)(a1 + 16) = v13;
  result = v16.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v16.tx;
  return result;
}

uint64_t SBFEdgeInsetsRelativeToRectEdge(uint64_t result)
{
  if (result == 1 || result == 8 || result == 2)
    return UIEdgeInsetsRotate();
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    _allocatedMem_2 += size;
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n)
      v4 = 0;
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    _allocatedMem_3 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n)
      v4 = 0;
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    _allocatedMem_0 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
      v6 = 0;
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, _QWORD *a7)
{
  uint64_t result;
  size_t v12;
  size_t v13;
  unsigned int v14;

  v14 = 0;
  result = 4294967293;
  if (a1 && __s1 && a7)
  {
    v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      v13 = v12;
      result = getLengthOfParameters(a5, a6, &v14);
      if (!(_DWORD)result)
        *a7 = v13 + v14 + 26;
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  if (a3)
  {
    *a3 = 0;
    v6 = 0;
    if (a2)
    {
      v7 = a2;
      while (1)
      {
        v8 = checkParameter(a1);
        if ((_DWORD)v8)
          break;
        v9 = v6 + 8;
        v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9))
          goto LABEL_10;
        a1 += 6;
        if (!--v7)
          goto LABEL_9;
      }
      v11 = v8;
      v12 = 70;
    }
    else
    {
LABEL_9:
      v11 = 0;
      *a3 = v6;
      v12 = 10;
    }
  }
  else
  {
LABEL_10:
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  uint64_t result;
  int v15;
  size_t v17;
  size_t v18;
  char *v19;
  size_t v20;
  unint64_t v21;

  v21 = 0;
  result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            v15 = a4;
            result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!(_DWORD)result)
            {
              if (*a8 < v21)
                return 4294967293;
              *a7 = *a1;
              v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                v20 = v18 + 22;
                result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!(_DWORD)result)
                  *a8 = v20;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  size_t v14;
  void *__src[2];
  size_t __n;

  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  v8 = 70;
  v9 = 4294967293;
  if (a3 && a4)
  {
    v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        __n = *(_QWORD *)(a1 + 16);
        v12 = checkParameter(__src);
        if ((_DWORD)v12)
          break;
        v13 = (_DWORD *)(a3 + v11);
        v14 = __n;
        *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6)
          goto LABEL_11;
      }
      v9 = v12;
      v8 = 70;
    }
    else
    {
LABEL_11:
      v9 = 0;
      *a4 = v11;
      v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, BOOL *a5, _DWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  BOOL *v20;
  BOOL v21;
  _DWORD *v22;
  int v23;
  unint64_t v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned int *v28;
  unint64_t v29;

  v28 = 0;
  v27 = 0;
  v8 = 4294967293;
  v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17)
      return 4294967293;
    v26 = a4;
    v18 = v17 + 1;
    v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19)
      return 4294967292;
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    v29 = v17 + 17;
    if (v17 + 17 == a2 || (v20 = a5, v21 = *(_BYTE *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      v8 = 4294967293;
    }
    else
    {
      v25 = v17 + 1;
      v22 = a8;
      v23 = *(_DWORD *)(a1 + v17 + 18);
      v29 = v17 + 22;
      v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!(_DWORD)v8)
      {
        *v26 = v19;
        *v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *v22 = v27;
        return v8;
      }
      v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28)
      Util_SafeDeallocParameters(v28, v27);
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, _QWORD *a4, _DWORD *a5)
{
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  _DWORD *v25;
  unint64_t *v26;
  int v27;

  v10 = (unsigned __int8 *)&unk_1EDF81000;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  v11 = 70;
  v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5)
    goto LABEL_25;
  v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    v16 = 0;
LABEL_24:
    v12 = 0;
    *a4 = v16;
    *a5 = v14;
    v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    v11 = 70;
    v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!(_DWORD)v14)
    goto LABEL_23;
  v27 = v14;
  v15 = 24 * v14;
  v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    v11 = 70;
    v12 = 4294967292;
    goto LABEL_25;
  }
  v24 = a4;
  v25 = a5;
  v26 = a3;
  v17 = 0;
  while (1)
  {
    v18 = &v16[v17];
    *(_QWORD *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (v19 = &v16[v17],
          v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      v11 = 70;
      v12 = 4294967293;
      goto LABEL_31;
    }
    v21 = checkParameter(&v16[v17]);
    if ((_DWORD)v21)
    {
      v12 = v21;
      v11 = 70;
      goto LABEL_31;
    }
    if ((_DWORD)v20)
      break;
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      v10 = (_BYTE *)&unk_1EDF81000;
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((_QWORD *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  v11 = 70;
  v12 = 4294967292;
LABEL_31:
  v10 = (_BYTE *)&unk_1EDF81000;
LABEL_25:
  if (v11 >= v10[1464])
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        result = getLengthOfParameters(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          v15 = 29;
          if (a1 == 32)
            v15 = 33;
          v16 = v15 + a4;
          if (a1 == 32)
            v17 = a6;
          else
            v17 = 0;
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, _QWORD *a12)
{
  uint64_t result;
  BOOL v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v30;
  unsigned int v31;

  if (!a3)
    return 4294967293;
  result = 4294967293;
  if (a12)
    v14 = a11 == 0;
  else
    v14 = 1;
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    v31 = 0;
    result = getLengthOfParameters(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      v21 = 29;
      if (a1 == 32)
        v21 = 33;
      v22 = v21 + a4;
      if (a1 == 32)
        v23 = a6;
      else
        v23 = 0;
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(_QWORD *)a11 = 0;
          *(_QWORD *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          v24 = v25 + a6;
        }
        v26 = a11 + v24;
        *(_BYTE *)v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        v30 = v24 + 5;
        result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result)
          *a12 = v30;
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, _QWORD *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, _QWORD *a11, _DWORD *a12)
{
  uint64_t v12;
  unint64_t v16;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  int v27;
  int v28;
  unint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  unsigned int *v33;
  unint64_t v34;

  v33 = 0;
  v34 = 0;
  v32 = 0;
  v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    v16 = a3;
    *a4 = *(_OWORD *)a2;
    v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      v12 = 4294967293;
    }
    else
    {
      v20 = *(unsigned int *)(a2 + 16);
      v34 = 20;
      v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20)
          goto LABEL_24;
        memcpy(v21, (const void *)(a2 + 20), v20);
        v22 = v20 + 20;
        v34 = v20 + 20;
        v31 = a5;
        if (a1 != 32)
        {
          v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          v23 = *(unsigned int *)(a2 + v22);
          v24 = v20 + 24;
          v34 = v20 + 24;
          v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            v22 = v24 + v23;
            v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              v26 = *(_BYTE *)(a2 + v22) != 0;
              v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                v30 = v20;
                v27 = v23;
                v23 = (size_t)v25;
                v28 = *(_DWORD *)(a2 + v22 + 1);
                v34 = v22 + 5;
                v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!(_DWORD)v12)
                {
                  *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                v25 = (void *)v23;
                LODWORD(v23) = v27;
                v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        v12 = 4294967293;
        goto LABEL_26;
      }
      v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33)
    Util_SafeDeallocParameters(v33, v32);
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, _QWORD *a9)
{
  uint64_t result;
  unsigned int v12;

  v12 = 0;
  result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    result = getLengthOfParameters(a7, a8, &v12);
    if (!(_DWORD)result)
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  uint64_t result;
  BOOL v15;
  int v17;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v23 = 0;
  result = 4294967293;
  if (a2 && a3)
  {
    v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      v17 = a6;
      result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!(_DWORD)result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(_QWORD *)a9 = 0;
            *(_QWORD *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          v22 = v21 + 4;
          result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!(_DWORD)result)
            *a10 = v22;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, _QWORD *a6, unsigned int *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  _QWORD *v13;
  unsigned int *v14;
  _DWORD *v15;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  size_t v20;
  unint64_t v21;
  _QWORD *v22;
  unsigned int *v23;
  _DWORD *v24;
  size_t v25;
  void *v26;
  void *v27;
  void *v28;
  _DWORD *v29;
  int v30;
  void *v32;
  _DWORD *v33;
  _QWORD *v34;
  unint64_t v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unint64_t v40;

  v39 = 0;
  v40 = 0;
  v38 = 0;
  v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v11 = a4;
      if (a4)
      {
        v12 = a5;
        if (a5)
        {
          v13 = a6;
          if (a6)
          {
            v14 = a7;
            if (a7)
            {
              v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    v10 = 4294967293;
                  }
                  else
                  {
                    v18 = *(unsigned int *)(a1 + 16);
                    v40 = 20;
                    v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        v32 = 0;
                        v37 = 0;
                        v10 = 4294967293;
                      }
                      else
                      {
                        v20 = *(unsigned int *)(a1 + v18 + 20);
                        v21 = v18 + 24;
                        v40 = v18 + 24;
                        v37 = v20;
                        if (!(_DWORD)v20)
                        {
                          v36 = 0;
                          goto LABEL_20;
                        }
                        v33 = v12;
                        v34 = v11;
                        v22 = v13;
                        v23 = v14;
                        v24 = v15;
                        v25 = v20;
                        v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          v27 = v26;
                          v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            v40 = v21;
                            v15 = v24;
                            v14 = v23;
                            v13 = v22;
                            v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              v10 = 4294967293;
                            }
                            else
                            {
                              v35 = v18;
                              v28 = v19;
                              v29 = v15;
                              v30 = *(_DWORD *)(a1 + v21);
                              v40 = v21 + 4;
                              v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!(_DWORD)v10)
                              {
                                *v11 = v28;
                                *v12 = v35;
                                *v13 = v36;
                                *v14 = v37;
                                *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              v19 = v28;
                              v18 = v35;
                            }
                            v32 = v36;
                            goto LABEL_32;
                          }
                          v10 = 4294967293;
                          v32 = v27;
                        }
                        else
                        {
                          v32 = 0;
                          v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39)
    Util_SafeDeallocParameters(v39, v38);
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (!a1)
    return result;
  if (!a2)
    return result;
  v5 = *a1;
  if (*a1 > 0x1Cu)
    return result;
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7)
      return result;
    *a2 = 24;
    v9 = a1[5];
    if ((_DWORD)v9)
    {
      v10 = a1 + 6;
      v11 = 24;
      do
      {
        result = GetSerializedRequirementSize(*v10, &v12);
        if ((_DWORD)result)
          break;
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  v6 = a1[4];
  if (!(_DWORD)v6)
    return 0;
  v7 = a1 + 5;
  v8 = 20;
  while (1)
  {
    result = GetSerializedRequirementSize(*v7, &v12);
    if ((_DWORD)result)
      break;
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6)
      return 0;
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!(_DWORD)result)
        {
          if (v12 > *a3)
            return 4294967293;
          *a2 = *(_OWORD *)a1;
          v7 = *a1;
          result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              v8 = a1[3] + 16;
LABEL_9:
              result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                v8 = 20;
                goto LABEL_9;
              }
              v9 = 0;
              v8 = 20;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4])
                  goto LABEL_9;
              }
            }
            else if (v7 == 7)
            {
              *((_QWORD *)a2 + 2) = *((_QWORD *)a1 + 2);
              if (!a1[5])
              {
                v8 = 24;
                goto LABEL_9;
              }
              v10 = 0;
              v8 = 24;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5])
                  goto LABEL_9;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  uint64_t v4;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              v10 = a1[3] + 16;
              if (v10 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              v13 = a1[4];
              if (8 * v13 + 20 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11)
                goto LABEL_35;
              v14 = __dst;
              if (!__dst)
                return 4294967292;
              if (*((_DWORD *)__dst + 3) == 84)
              {
                v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  v10 = 20;
                  goto LABEL_11;
                }
                v16 = 0;
                v10 = 20;
                while (1)
                {
                  v21 = 0;
                  v22 = 0;
                  v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11)
                    goto LABEL_35;
                  *(_QWORD *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4])
                    goto LABEL_11;
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  v18 = __dst;
                  if (!__dst)
                    return 4294967292;
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    v4 = 4294967291;
                    goto LABEL_36;
                  }
                  v19 = *(_OWORD *)a1;
                  *((_QWORD *)__dst + 2) = *((_QWORD *)a1 + 2);
                  *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    v10 = 24;
                    goto LABEL_11;
                  }
                  v20 = 0;
                  v10 = 24;
                  while (1)
                  {
                    v21 = 0;
                    v22 = 0;
                    v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11)
                      break;
                    *((_QWORD *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5])
                      goto LABEL_11;
                  }
                }
LABEL_35:
                v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst)
    Util_DeallocRequirement((int *)__dst);
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result;
  unsigned int v6;
  size_t v8;

  result = 4294967293;
  if (__src && __dst && a3)
  {
    v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, _QWORD *a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v10;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    v8 = *a1;
    v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if ((_DWORD)v10 == 28)
          goto LABEL_7;
        return v4;
      case 2u:
        if ((_DWORD)v10 == 136)
          goto LABEL_7;
        return v4;
      case 3u:
        if ((_DWORD)v10 == 305)
          goto LABEL_7;
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!(_DWORD)v10)
          goto LABEL_7;
        return v4;
      case 7u:
        if ((_DWORD)v10 == 56)
          goto LABEL_7;
        return v4;
      case 9u:
        if ((_DWORD)v10 == 24)
          goto LABEL_7;
        return v4;
      case 0xAu:
        if ((_DWORD)v10 == 52)
          goto LABEL_7;
        return v4;
      case 0xCu:
      case 0xFu:
        if ((_DWORD)v10 == 8)
          goto LABEL_7;
        return v4;
      case 0xDu:
      case 0x15u:
        if ((_DWORD)v10 == 132)
          goto LABEL_7;
        return v4;
      case 0x11u:
        if ((_DWORD)v10 == 81)
          goto LABEL_7;
        return v4;
      case 0x12u:
        if ((_DWORD)v10 == 20)
          goto LABEL_7;
        return v4;
      case 0x14u:
        if ((_DWORD)v10 != 32)
          return v4;
LABEL_7:
        v4 = Util_AllocCredential(*a1, &__dst);
        if ((_DWORD)v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              v4 = 4294967293;
            }
            else
            {
              v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *__dst;

  __dst = 0;
  v2 = 4294967293;
  if (a1 && a2)
  {
    v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if ((_DWORD)v2)
    {
      if (__dst)
        Util_DeallocCredential(__dst);
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(_QWORD *__s1, _QWORD *__s2, _BYTE *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  size_t v8;
  _BOOL4 isNullOrEqualMem2;
  char *v13;
  char *v14;
  size_t v21;
  uint64_t v22;

  v3 = 4294967293;
  if (__s1)
  {
    v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          v7 = *((unsigned int *)__s1 + 7);
          if ((_DWORD)v7 == *((_DWORD *)__s2 + 7))
          {
            v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 44;
                v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8))
                  break;
                v8 = *((unsigned int *)__s1 + 9);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 9))
                  break;
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 13);
                v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)(v6 + 8);
                v14 = (char *)(v4 + 8);
                v21 = 24;
                v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 5);
                v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)v6 + 52;
                v14 = (char *)v4 + 52;
LABEL_74:
                v21 = 16;
                v22 = 16;
                goto LABEL_103;
              case 0xD:
                v8 = *((unsigned int *)__s1 + 8);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 8))
                  break;
                __s2 = (_QWORD *)((char *)__s2 + 36);
                __s1 = (_QWORD *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v14 = (char *)(__s2 + 4);
                v13 = (char *)(__s1 + 4);
                v21 = 32;
                v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 36;
                v14 = (char *)__s2 + 36;
                v21 = 128;
                v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  _BOOL8 result;
  BOOL v6;
  BOOL v7;

  if (__n != a4)
    return 0;
  if (!(__s1 | __s2))
    return 1;
  result = 0;
  v6 = __s1 == 0;
  if (__s2)
  {
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = __s1 == 0;
  }
  if (v7 && !v6)
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, _QWORD *a5)
{
  BOOL v6;
  char v7;
  uint64_t result;
  size_t v12;
  uint64_t v13;

  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(_QWORD *)a4 = 0;
              *(_QWORD *)(a4 + 8) = 0;
            }
            v13 = *a5 - 16;
            result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!(_DWORD)result)
            {
              v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  _DWORD *v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if ((_DWORD)v10)
    {
      v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12)
    Util_DeallocCredential(v12);
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, _QWORD *a4)
{
  size_t v4;
  size_t v5;
  BOOL v6;
  unsigned int **v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t result;
  size_t v16[9];

  if (a2)
    v6 = a1 == 0;
  else
    v6 = 0;
  if (v6 || a3 == 0 || a4 == 0)
    return 4294967293;
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    v11 = a1;
    v12 = a2;
    v13 = 4;
    while (1)
    {
      v14 = *v11;
      if (!*v11)
        return 4294967293;
      v16[0] = *a4 - v13;
      result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if ((_DWORD)result)
        return result;
      v13 += v16[0];
      ++v11;
      if (!--v12)
        goto LABEL_18;
    }
  }
  else
  {
    v13 = 4;
LABEL_18:
    result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if ((_DWORD)v8)
          {
            v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              v11 = 0;
              v12 = 4;
              while (1)
              {
                v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if ((_DWORD)v13)
                  break;
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11)
                  goto LABEL_12;
              }
              v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            v10 = 0;
LABEL_12:
            v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  uint64_t v3;
  _DWORD **v4;
  uint64_t v5;
  unint64_t v6;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1;
      v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (!a3)
    return 4294967293;
  result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, _QWORD *a4)
{
  __n128 result;

  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 4294967293;
  result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3)
      *a3 = *(_OWORD *)a1;
    result = 0;
    if (a4)
      *a4 = *(_DWORD *)(a1 + 16);
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 28;
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result;
  size_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          v18 = 0;
          result = getLengthOfParameters(a5, a6, &v18);
          if (!(_DWORD)result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              v17 = a4 + 24;
              result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!(_DWORD)result)
                *a8 = v17;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14[3];

  v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if ((_DWORD)v11)
    {
      v12 = v11 + 24;
      if (v12 > a2)
        return 4294967293;
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 25;
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  unsigned int v16;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          v16 = 0;
          result = getLengthOfParameters(a4, a5, &v16);
          if (!(_DWORD)result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(_BYTE *)(a6 + 20) = a3;
              v15 = 21;
              result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!(_DWORD)result)
                *a7 = v15;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, _QWORD *a6, _DWORD *a7)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v11[3];

  v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(_BYTE *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 20;
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v11;
  unsigned int v12;

  result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        v12 = 0;
        result = getLengthOfParameters(a2, a3, &v12);
        if (!(_DWORD)result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            v11 = 16;
            result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!(_DWORD)result)
              *a5 = v11;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v9[3];

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, _BYTE *a4, _QWORD *a5)
{
  uint64_t result;
  size_t v9;

  result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(_BYTE *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _BYTE *a5)
{
  uint64_t result;

  result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 24;
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      v18 = 0;
      result = getLengthOfParameters(a2, a3, &v18);
      if (!(_DWORD)result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(_QWORD *)a6 = 0;
            *(_QWORD *)(a6 + 8) = 0;
          }
          v17 = 16;
          result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!(_DWORD)result)
          {
            v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    v12 = 16;
    result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!(_DWORD)result)
    {
      v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = 4294967293;
  if (a3 && a4)
  {
    v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src)
        memcpy(a3 + 1, __src, __n);
      else
        v8 = 4;
      result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  _DWORD *v6;
  unsigned int v7;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    result = 0;
    v7 = *a1;
    v6 = a1 + 1;
    *a4 = v7;
    if (!v7)
      v6 = 0;
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1)
    return 4294967293;
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4])
        return 4294967293;
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4)
        return 4294967293;
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16)
        return 4294967293;
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18)
        return 4294967293;
      break;
    case 8:
    case 9:
      if (a1[4] != 1)
        return 4294967293;
      break;
    case 0xB:
      if (a1[4] > 0x400u)
        return 4294967293;
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  size_t v5;
  const void *v6;
  const void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  uint64_t v17;
  _BYTE v18[8192];
  uint64_t v19;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))v1;
  v19 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  v17 = 0x2000;
  v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17)
      v14 = v18;
    else
      v14 = 0;
    (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v14);
  }
  if ((_DWORD)v13)
    v15 = 70;
  else
    v15 = 10;
  if (v15 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  size_t v20;
  _BYTE v21[1024];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  v20 = 1024;
  v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20)
      v17 = v21;
    else
      v17 = 0;
    (*(void (**)(uint64_t, _BYTE *))(a8 + 16))(a8, v17);
  }
  if ((_DWORD)v16)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *);
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE v16[256];
  uint64_t v17;

  v9 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *))result;
  v17 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  v14 = 256;
  if (v9)
  {
    v13 = 8;
    result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if ((_DWORD)result)
    {
LABEL_7:
      v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    v10 = 4294967291;
  }
  else
  {
    v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14)
      v11 = v16;
    else
      v11 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(a5 + 16))(a5, v10, v11);
  }
  if ((_DWORD)v10)
    v12 = 70;
  else
    v12 = 10;
  if (v12 >= gACMLoggingLevel)
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  int *v14;
  BOOL v16;
  int *v17;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  v17 = 0;
  v16 = 0;
  v12 = 70;
  v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    v14 = v17;
    if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      v14 = v17;
    }
    if (v14)
      Util_DeallocRequirement(v14);
    if ((_DWORD)v13)
      v12 = 70;
    else
      v12 = 10;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  _BOOL8 v17;
  int *v18;
  uint64_t v19;
  int *result;
  BOOL v21;
  int *v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  v17 = 0;
  v18 = 0;
  v22 = 0;
  v21 = 0;
  v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    v18 = v22;
    v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a9 + 16))(a9, v19, v17, v18);
  result = v22;
  if (v22)
    result = (int *)Util_DeallocRequirement(v22);
  if (gACMLoggingLevel <= 0xAu)
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  uint64_t result;
  int v15[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  *(_QWORD *)v15 = 0;
  result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v15, 0, 1);
  if ((_DWORD)result)
  {
    if (a7)
      result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a7 + 16))(a7, result, 0, 0);
  }
  else
  {
    result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(_QWORD *)v15)
    result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v15, 1);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  v14 = 128;
  if (!a4)
  {
    v12 = 70;
    v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      v12 = 70;
      v9 = 4294967292;
      goto LABEL_17;
    }
    v14 = 2048;
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v10 = v8;
      else
        v10 = 0;
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v11 = v15;
      else
        v11 = 0;
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  uint64_t v10;
  _BYTE v11[8192];
  uint64_t v12;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v0;
  v12 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  v10 = 0x2000;
  if (v2)
  {
    v6 = LibCall_ACMTRMLoadState(v5, v4, (uint64_t)v11, (uint64_t)&v10);
    if ((_DWORD)v6)
    {
      v8 = 70;
    }
    else
    {
      if (v10)
        v7 = v11;
      else
        v7 = 0;
      (*(void (**)(uint64_t, _BYTE *))(v2 + 16))(v2, v7);
      v8 = 10;
    }
  }
  else
  {
    v8 = 70;
    v6 = 4294967293;
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v6);
  return v6;
}

uint64_t LibCall_ACMContextUnloadToImage_Block()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  _BYTE v5[4096];
  uint64_t v6;

  MEMORY[0x1E0C80A78]();
  v1 = v0;
  v6 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  if (v1)
  {
    v2 = LibCall_ACMContextUnloadToImage();
    if ((_DWORD)v2)
    {
      v3 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, _BYTE *))(v1 + 16))(v1, v5);
      v3 = 10;
    }
  }
  else
  {
    v3 = 70;
    v2 = 4294967293;
  }
  if (v3 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v2);
  return v2;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128);
  __n128 AclAuthMethod_Serialize;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v13[256];
  uint64_t v14;

  v7 = (void (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128))result;
  v14 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  v11 = 256;
  if (v7 && a3 && a4)
  {
    v10 = 16;
    AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16)
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *);
  uint64_t v21;
  int *v22;
  _BOOL8 v23;
  BOOL v24;
  int *v25;

  v20 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  v25 = 0;
  v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    v22 = v25;
    v23 = v24;
  }
  else
  {
    if (!a13)
      goto LABEL_10;
    v22 = 0;
    v23 = 0;
    v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a13 + 16))(a13, v21, v23, v22);
  result = (uint64_t)v25;
  if (v25)
    result = Util_DeallocRequirement(v25);
LABEL_10:
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1;

  v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1)
    return 1;
  if (*a1)
    return 0;
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  _BOOL8 result;

  if (__n != a4)
    return 0;
  result = 0;
  if (__s1)
  {
    if (__s2)
      return memcmp(__s1, __s2, __n) == 0;
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v5;
  char v6;

  if (!result && a2)
    Util_hexDumpToStrHelper_cold_1();
  if (!a3 && a4)
    Util_hexDumpToStrHelper_cold_2();
  if (a2 >= a4)
    v4 = a4;
  else
    v4 = a2;
  if (v4)
  {
    v5 = (_BYTE *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      v6 = *result++;
      *v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__src, size_t __n)
{
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  if (a3)
  {
    v10 = *a3;
    v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n)
        goto LABEL_12;
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        v12 = 0;
        *a3 = v11;
        v13 = 10;
        goto LABEL_13;
      }
    }
    v12 = 4294967291;
  }
  else
  {
    v12 = 4294967293;
  }
LABEL_19:
  v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__dst, size_t __n)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  v10 = 4294967293;
  v11 = 70;
  if (a1 && a3)
  {
    v12 = *a3;
    v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n)
        goto LABEL_11;
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        v10 = 0;
        *a3 = v13;
        v11 = 10;
        goto LABEL_12;
      }
    }
    v10 = 4294967291;
LABEL_17:
    v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7)
    LOBYTE(v1) = 1;
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1 + 4;
      v5 = a2;
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        if (v6)
        {
          v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  uint64_t v2;
  unsigned int v3;
  const char *v4;
  rsize_t v5;
  const void *v6;
  unint64_t v7;
  int v8;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  if (a1)
  {
    v2 = 4294967293;
    v3 = 70;
    switch(*a1)
    {
      case 1:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        v5 = 60;
        v6 = a1;
        v7 = 60;
        v8 = 144;
        goto LABEL_6;
      case 2:
        v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        v5 = 168;
        v6 = a1;
        v7 = 168;
        v8 = 136;
        goto LABEL_6;
      case 3:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        v5 = 337;
        v6 = a1;
        v7 = 337;
        v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        v4 = "ACMCredential";
        v5 = 32;
        v6 = a1;
        v7 = 32;
        v8 = 189;
        goto LABEL_6;
      case 7:
        v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        v5 = 88;
        v6 = a1;
        v7 = 88;
        v8 = 152;
        goto LABEL_6;
      case 9:
        v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        v5 = 56;
        v6 = a1;
        v7 = 56;
        v8 = 156;
        goto LABEL_6;
      case 0xA:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        v5 = 84;
        v6 = a1;
        v7 = 84;
        v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        v5 = 40;
        v6 = a1;
        v7 = 40;
        v8 = 161;
        goto LABEL_6;
      case 0xD:
        v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 132;
        goto LABEL_6;
      case 0x11:
        v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        v5 = 113;
        v6 = a1;
        v7 = 113;
        v8 = 165;
        goto LABEL_6;
      case 0x12:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        v5 = 52;
        v6 = a1;
        v7 = 52;
        v8 = 169;
        goto LABEL_6;
      case 0x14:
        v4 = "ACMCredential - ACMCredentialDataAP";
        v5 = 64;
        v6 = a1;
        v7 = 64;
        v8 = 173;
        goto LABEL_6;
      case 0x15:
        v4 = "ACMCredential - ACMCredentialDataSignature";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        v2 = 0;
        v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    v2 = 4294967293;
    v3 = 70;
  }
  if (v3 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  return v2;
}

uint64_t Util_AllocCredential(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v5;
  int v6;
  const char *v7;
  const void *v8;
  int v9;

  if (!a2)
    return 4294967293;
  result = 4294967293;
  switch(a1)
  {
    case 1:
      v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      v6 = 28;
      goto LABEL_4;
    case 2:
      v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      v6 = 136;
      goto LABEL_4;
    case 3:
      v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      v6 = 0;
      goto LABEL_4;
    case 7:
      v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      v6 = 56;
      goto LABEL_4;
    case 9:
      v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      v6 = 24;
      goto LABEL_4;
    case 10:
      v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      v6 = 8;
      goto LABEL_4;
    case 13:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      v8 = v5;
      v9 = 211;
      goto LABEL_18;
    case 17:
      v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      v6 = 81;
      goto LABEL_4;
    case 18:
      v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      v6 = 20;
      goto LABEL_4;
    case 20:
      v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      v6 = 32;
      goto LABEL_4;
    case 21:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataSignature";
      v8 = v5;
      v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      v6 = 132;
LABEL_4:
      if (v5)
      {
        result = 0;
        *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  int v9;
  const char *v11;
  const void *v12;
  int v13;
  const char *v14;
  const void *v15;
  int v16;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  if (a3)
  {
    v6 = 4294967293;
    v7 = 70;
    switch(a1)
    {
      case 1:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        v12 = v8;
        v13 = 338;
        goto LABEL_49;
      case 2:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        v12 = v8;
        v13 = 343;
        goto LABEL_49;
      case 3:
        v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        v9 = 156;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataOr";
        v15 = v8;
        v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataAnd";
        v15 = v8;
        v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        v9 = 84;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        v9 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        v9 = 88;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 8:
        v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        v9 = 1024;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 13:
        v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        v9 = 32;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        v12 = v8;
        v13 = 353;
        goto LABEL_49;
      case 21:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        v12 = v8;
        v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        v9 = 4;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 24:
        v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        v9 = 1060;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 25:
        v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        v9 = 43;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 26:
        v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        v9 = 28;
        if (!v8)
        {
LABEL_50:
          v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *v8 = a1;
        *(_QWORD *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        v6 = 0;
        *a3 = v8;
        v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
              goto LABEL_53;
            v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            v9 = 120;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1001:
            v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            v9 = 168;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1002:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            v12 = v8;
            v13 = 424;
            goto LABEL_49;
          case 1003:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            v12 = v8;
            v13 = 429;
            goto LABEL_49;
          case 1004:
            v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            v9 = 16;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    v6 = 4294967293;
LABEL_54:
    v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  rsize_t v10;
  int *v11;
  unint64_t v12;
  int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  if (!a1)
  {
    v7 = 4294967293;
    v8 = 70;
    goto LABEL_28;
  }
  v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        v6 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000)
        goto LABEL_25;
      if (a1[13])
      {
        v4 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      v5 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5)
      goto LABEL_25;
    if (a1[4])
    {
      v3 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  v2 = *a1;
LABEL_25:
  v7 = 4294967293;
  v8 = 70;
  switch(v2)
  {
    case 1:
      v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 542;
      goto LABEL_27;
    case 2:
      v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 546;
      goto LABEL_27;
    case 3:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      v10 = 172;
      v11 = a1;
      v12 = 172;
      v13 = 550;
      goto LABEL_27;
    case 4:
      v9 = "ACMRequirement - ACMRequirementDataOr";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 595;
      goto LABEL_27;
    case 5:
      v9 = "ACMRequirement - ACMRequirementDataAnd";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      v9 = "ACMRequirement";
      v10 = 16;
      v11 = a1;
      v12 = 16;
      v13 = 538;
      goto LABEL_27;
    case 7:
      v9 = "ACMRequirement - ACMRequirementDataKofN";
      v10 = 104;
      v11 = a1;
      v12 = 104;
      v13 = 584;
      goto LABEL_27;
    case 8:
      v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      v10 = 1040;
      v11 = a1;
      v12 = 1040;
      v13 = 574;
      goto LABEL_27;
    case 13:
      v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      v10 = 48;
      v11 = a1;
      v12 = 48;
      v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 554;
      goto LABEL_27;
    case 21:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 558;
      goto LABEL_27;
    case 24:
      v9 = "ACMRequirement - ACMRequirementDataAP";
      v10 = 1076;
      v11 = a1;
      v12 = 1076;
      v13 = 566;
      goto LABEL_27;
    case 25:
      v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      v10 = 59;
      v11 = a1;
      v12 = 59;
      v13 = 570;
      goto LABEL_27;
    case 26:
      v9 = "ACMRequirement - ACMRequirementDataRatchet";
      v10 = 44;
      v11 = a1;
      v12 = 44;
      v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      v7 = 0;
      v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          v10 = 136;
          v11 = a1;
          v12 = 136;
          v13 = 601;
          goto LABEL_27;
        case 1001:
          v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          v10 = 184;
          v11 = a1;
          v12 = 184;
          v13 = 605;
          goto LABEL_27;
        case 1002:
          v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 609;
          goto LABEL_27;
        case 1003:
          v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 613;
          goto LABEL_27;
        case 1004:
          v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          v10 = 32;
          v11 = a1;
          v12 = 32;
          v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 32, "src || !srcLen");
}

void Util_hexDumpToStrHelper_cold_2()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 33, "dst || !dstCapacity");
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if ((_DWORD)v2)
  {
    updateLogLevelFromKext();
    v3 = 70;
  }
  else
  {
    v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v4 = *a1;
        if (*a1)
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        *(_DWORD *)buf = 136315650;
        v8 = "ACMLib";
        v9 = 2080;
        v10 = "ACMContextCreate";
        v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    v11 = 2048;
    v12 = (int)v2;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = init();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _DWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v8 = 0;
  v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      v10 = "ACMLib";
      v11 = 2080;
      v12 = "ACMContextCreateWithExternalForm";
      v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  else
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  unsigned int v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if ((_initialized & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = *MEMORY[0x1E0CBBAB8];
    v2 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      v5 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v4 = MatchingService;
    v0 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v0)
    {
      v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    v11 = 2048;
    v12 = (int)v0;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    v10 = init();
    if ((_DWORD)v10 || (v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), (_DWORD)v10))
    {
      v9 = v10;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  if (a1)
  {
    v2 = ACMContextCreate((uint64_t *)&v6);
    if (!(_DWORD)v2)
      v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    v3 = v2;
    if (v6)
      ACMContextDelete(v6, 1);
    if ((_DWORD)v3)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v4 = 70;
    v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = ACMContextCreate((uint64_t *)&v6);
  if (!(_DWORD)v2)
    v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  v3 = v2;
  if (v6)
    ACMContextDelete(v6, 1);
  if ((_DWORD)v3)
    v4 = 70;
  else
    v4 = 10;
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedReplacePassphraseCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedReplacePassphraseCredentialSize = init();
    if ((_DWORD)SerializedReplacePassphraseCredentialSize
      || (SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          (_DWORD)SerializedReplacePassphraseCredentialSize))
    {
      v9 = SerializedReplacePassphraseCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        v9 = v13;
        bzero(v12, size);
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  _OWORD *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  _OWORD *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v11 = a1;
  v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    v16 = 2048;
    v17 = (int)v8;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  int v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(_QWORD *)v11 = 0;
  v10 = ACMContextCreate((uint64_t *)v11);
  if ((_DWORD)v10)
  {
    if (a5)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, v10, 0, 0);
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(_QWORD *)v11)
    ACMContextDelete(*(_DWORD **)v11, 1);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  _OWORD *v9;

  v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  _OWORD *v11;

  v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SerializedProcessAclSize;
  size_t v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  size_t v16;
  unsigned int v17;
  size_t __n;
  size_t size;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  __n = 4096;
  size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 4294967293;
  if (!a1 || !a2 || !a3)
    goto LABEL_28;
  SerializedProcessAclSize = init();
  if ((_DWORD)SerializedProcessAclSize
    || (SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        (_DWORD)SerializedProcessAclSize))
  {
    v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  v8 = size;
  v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    v6 = 4294967292;
    goto LABEL_28;
  }
  v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if ((_DWORD)v10)
  {
    v6 = v10;
    v12 = 0;
    v14 = 0;
    v11 = 4096;
    goto LABEL_15;
  }
  v11 = 4096;
  v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    v14 = 0;
LABEL_31:
    v6 = 4294967292;
    goto LABEL_15;
  }
  v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  v11 = __n;
  if ((_DWORD)v13)
  {
    v6 = v13;
    v14 = 0;
    goto LABEL_15;
  }
  v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  v11 = __n;
  if (!v14)
    goto LABEL_31;
  memcpy(v14, v12, __n);
  v6 = 0;
  v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if ((_DWORD)v6)
    v17 = 70;
  else
    v17 = 10;
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    v25 = 2048;
    v26 = (int)v6;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        v6 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        v7 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      v5 = 0;
      do
        (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  v4 = 4294967293;
  v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    v4 = 0;
    v6 = *a1;
    v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21)
          break;
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        v4 = 0;
        v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    v12 = 2048;
    v13 = (int)v4;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  __n128 *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    v14 = 2048;
    v15 = (int)v6;
    v16 = 1024;
    v17 = a1;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = 0;
  v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    v20 = 2048;
    v21 = (int)v12;
    v22 = 1024;
    v23 = a1;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v7 = 0;
  v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if ((_DWORD)v4)
    v5 = 70;
  else
    v5 = 10;
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    v12 = 2048;
    v13 = (int)v4;
    v14 = 1024;
    v15 = a1;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v2;
  unsigned int v3;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if ((_DWORD)v2)
    v3 = 70;
  else
    v3 = 10;
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    v9 = 2048;
    v10 = (int)v2;
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7;

  v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v10 = 256;
  if (a4)
  {
    v9 = a1;
    v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  _OWORD *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = a1;
  v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    v20 = 2048;
    v21 = (int)v12;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t Data;
  unsigned int v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if ((_DWORD)Data)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    v13 = 2048;
    v14 = (int)Data;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  rsize_t v15;
  unsigned int v16;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int size;
  int size_4;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315394;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  size = 0;
  v20 = 0;
  v21 = 4;
  v19 = a1;
  v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!(_DWORD)v10)
  {
    v11 = size;
    if (size)
    {
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        v16 = 70;
        v14 = 4294967292;
        goto LABEL_15;
      }
      v20 = size;
      v18 = a1;
      v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      v14 = v13;
      if (a5 && !(_DWORD)v13)
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if ((_DWORD)v14)
        goto LABEL_11;
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, 0, 0);
    }
    v14 = 0;
    v16 = 10;
    goto LABEL_15;
  }
  v14 = v10;
LABEL_11:
  v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315650;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    v27 = 2048;
    v28 = (int)v14;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t Data;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if ((_DWORD)Data)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    v15 = 2048;
    v16 = (int)Data;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(__int128 *a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  __int128 *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1;

  v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *), uint64_t a2, _QWORD *a3, _BYTE *a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v18;
  _BYTE v19[21];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  v10 = 70;
  v11 = 4294967293;
  if (!a1 || !a3)
    goto LABEL_25;
  v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    v10 = 70;
    v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    v18 = 21;
    v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        v11 = 4294967291;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      v10 = 70;
      goto LABEL_25;
    }
  }
  v18 = 17;
  v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17)
    v15 = 0;
  else
    v15 = -5;
  if (v14)
    v11 = v14;
  else
    v11 = v15;
  if (!v14 && v18 == 17)
  {
LABEL_20:
    v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4)
      *a4 = v19[16];
  }
  if ((_DWORD)v11)
    goto LABEL_23;
  v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  _DWORD *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  v12 = 0;
  v13 = 70;
  v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      v20 = 9;
      v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          v14 = 0;
          goto LABEL_19;
        }
        v14 = -5;
        goto LABEL_28;
      }
      v14 = v15;
      if (v15 != -3)
        goto LABEL_28;
    }
    v20 = 5;
    v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5)
      v17 = 0;
    else
      v17 = -5;
    if (v16)
      v14 = v16;
    else
      v14 = v17;
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          v13 = 70;
          v14 = -4;
          goto LABEL_31;
        }
        v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)v12 = *a3;
        v12[4] = v18;
        if (a5)
          *a5 = BYTE4(v21[0]);
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    if (v14)
      goto LABEL_29;
LABEL_30:
    v14 = 0;
    v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t SerializedAddCredentialSize;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      v13 = SerializedAddCredentialSize;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 5, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  _OWORD *v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  if (a3 || a5 == 2)
  {
    v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *v10 = *a3;
      }
      else
      {
        *(_QWORD *)v10 = 0;
        *((_QWORD *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if ((_DWORD)v11)
        v12 = 70;
      else
        v12 = 10;
    }
    else
    {
      v12 = 70;
      v11 = 4294967292;
    }
  }
  else
  {
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = (_DWORD)a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if ((_DWORD)v14)
    {
      v13 = v14;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 6, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, _QWORD *a10)
{
  unsigned int v18;
  uint64_t v19;
  uint64_t SerializedVerifyPolicySize;
  size_t v21;
  _OWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  size_t v29;
  void *v30;
  unint64_t v31;
  size_t v32;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  v32 = 0;
  size = 0;
  v30 = 0;
  v31 = 4096;
  v18 = 70;
  v19 = 4294967293;
  v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      v18 = 70;
      v19 = 4294967293;
    }
    else
    {
      SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if ((_DWORD)SerializedVerifyPolicySize)
      {
        v19 = SerializedVerifyPolicySize;
        v18 = 70;
      }
      else
      {
        v21 = size;
        v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          v32 = size;
          v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if ((_DWORD)v23)
          {
            v19 = v23;
            v24 = 0;
          }
          else
          {
            v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if ((_DWORD)v25)
              {
                v19 = v25;
              }
              else
              {
                v26 = v31 - 4;
                if (v31 < 4)
                {
                  v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!(_DWORD)v19)
                      *a10 = v30;
                  }
                  else
                  {
                    v19 = 0;
                  }
                }
              }
            }
            else
            {
              v19 = 4294967292;
            }
          }
          v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if ((_DWORD)v19)
            v18 = 70;
          else
            v18 = 10;
        }
        else
        {
          v18 = 70;
          v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  v4 = 70;
  v5 = 4294967293;
  if (a1 && a2)
  {
    v5 = Util_DeallocRequirement(a2);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  BOOL v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD v20[2];

  v13 = a1;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  if (!v13)
    goto LABEL_16;
  v14 = a5 != 0;
  if (a4)
    v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  if (v14)
  {
LABEL_16:
    v18 = 70;
    v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x1E0C80A78](a1);
    v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *v15 = a3;
    v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4))
      LibCall_ACMKernelControl_cold_1();
    v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if ((_DWORD)v17)
      v18 = 70;
    else
      v18 = 10;
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1)
    return (_DWORD *)Util_DeallocCredential(a1);
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  int v4;
  uint64_t result;
  int v7;
  _OWORD *v8;
  BOOL v9;
  _BOOL4 v10;
  __int128 v11;
  _BOOL4 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!a1)
    return 4294967293;
  v4 = __n;
  if ((__src != 0) != (__n != 0))
    return 4294967293;
  result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13)
          return result;
LABEL_79:
        result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17)
          return result;
        result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        v11 = __src[1];
        v16 = __src[2];
        v17 = __src[3];
        *((_BYTE *)a1 + 112) = *((_BYTE *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20)
        return result;
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              result = 0;
              v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            v9 = *a1 == 12 || *a1 == 15;
            v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7)
          return result;
        result = 0;
        v11 = *__src;
        *((_QWORD *)a1 + 10) = *((_QWORD *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7)
        return result;
    }
    result = 0;
    v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3)
          goto LABEL_16;
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          result = 0;
          v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3)
          goto LABEL_102;
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          v19 = __src[1];
          v20 = __src[2];
          v21 = __src[3];
          *((_BYTE *)a1 + 184) = *((_BYTE *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18)
              goto LABEL_64;
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1)
      return result;
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18)
          return result;
        v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3)
        return result;
      v8 = a1 + 26;
      a1[25] = 16;
    }
    result = 0;
    *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result;
  int *v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  int v18;
  _BOOL4 isNullOrZeroMemory;
  BOOL v20;
  int *v21;
  uint64_t v22;
  int *v23;

  result = 4294967293;
  if (!a1 || !a3 || !a4)
    return result;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17)
            return result;
          v11 = a1 + 12;
LABEL_87:
          v12 = 65;
          v13 = v11;
          v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21)
              return result;
            v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((_BYTE *)a1 + 36, 128))
            {
              v15 = 0;
              v10 = 0;
            }
            else
            {
              v10 = a1[8];
            }
            result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20)
            return result;
          v11 = a1 + 8;
          v12 = 32;
          v13 = v11;
          v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13)
            return result;
          result = 0;
          *a3 = a1 + 9;
          v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17)
          return result;
        v11 = a1 + 8;
        v12 = 16;
        v13 = v11;
        v14 = 16;
      }
      isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      result = 0;
      v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory)
        v21 = 0;
      else
        v21 = (int *)v11;
      if (v20)
        v22 = v12;
      else
        v22 = 0;
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10)
          return result;
        v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_77;
        }
        if (*a1 != 10)
          return result;
        v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      result = Util_isNullOrZeroMemory(v9, 16);
      if ((_DWORD)result)
      {
        result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      *a3 = a1 + 16;
      v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10)
      return result;
LABEL_15:
    v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          result = 0;
          v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          result = 0;
          v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          result = 0;
          v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          result = 0;
          v10 = *(unsigned int *)((char *)a1 + 205);
          v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205))
            v23 = 0;
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            result = 0;
            *a3 = a1 + 10;
            v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1)
          return result;
LABEL_61:
        result = 0;
        v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0)
        return result;
LABEL_77:
      result = 0;
      v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      v10 = 4;
      goto LABEL_99;
    }
    v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3)
          return result;
        v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18)
      return result;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      result = 0;
      *a3 = a1 + 4;
      v10 = 8;
      goto LABEL_99;
    case 2:
      result = 0;
      v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      result = 0;
      v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      result = 0;
      v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  _DWORD *v11;
  BOOL v12;
  int v13;

  v4 = 4294967293;
  if (!a1 || !a3 || !a4)
    return v4;
  v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700)
          return v4;
        if (*a1 == 7)
        {
LABEL_28:
          v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26)
        return 4294967293;
      if (a1[3] < 0x1C)
        return 4294967282;
      *a3 = a1 + 4;
      v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600)
          return v4;
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25)
        return 4294967293;
      *a3 = a1 + 4;
      v10 = 43;
    }
LABEL_72:
    v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3)
          return 4294967293;
        v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3)
          return 4294967293;
        v10 = 0;
        v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24)
          return 4294967293;
        *a3 = a1 + 5;
        v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24)
          return 4294967293;
        v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21)
              goto LABEL_28;
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200)
          return v4;
        if (*a1 != 2)
          return 4294967293;
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16))
    {
      v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10)
      v11 = 0;
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      v10 = 4;
      goto LABEL_72;
    case 2:
      v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  v6 = 70;
  if (a1 && ((_DWORD)a3 == 47 || (_DWORD)a3 == 29))
  {
    v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if ((_DWORD)v7)
      v6 = 70;
    else
      v6 = 10;
  }
  else
  {
    v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  v4 = 70;
  if (a1)
  {
    v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __n128 Property_Serialize;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  v14 = 70;
  v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          v19 = 24;
          Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if ((_DWORD)v16)
          {
            v15 = v16;
          }
          else if (v19 == 24)
          {
            v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!(_DWORD)v15)
            {
              v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            v15 = 4294967291;
          }
          v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  uint64_t Property_Serialize;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  v12 = 70;
  v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    v16 = 8;
    Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if ((_DWORD)Property_Serialize)
    {
      v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!(_DWORD)v13)
      {
        v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = 4294967291;
    }
    v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  uint64_t v18;
  uint64_t SerializedVerifyPolicySize;
  size_t v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unsigned int v27;
  size_t v29;
  int *v30;
  unint64_t v31;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  v31 = 4096;
  size = 0;
  v29 = 0;
  v30 = 0;
  v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!(_DWORD)v18)
      goto LABEL_21;
    goto LABEL_19;
  }
  SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!(_DWORD)SerializedVerifyPolicySize)
  {
    v20 = size;
    v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if ((_DWORD)v22)
      {
        v18 = v22;
        v23 = 0;
      }
      else
      {
        v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if ((_DWORD)v24)
          {
            v18 = v24;
          }
          else
          {
            v25 = v31 - 4;
            if (v31 < 4)
            {
              v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!(_DWORD)v18)
                  *a10 = v30;
              }
              else
              {
                v18 = 0;
              }
            }
          }
        }
        else
        {
          v18 = 4294967292;
        }
      }
      v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      v18 = 4294967292;
    }
    goto LABEL_18;
  }
  v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30)
    Util_DeallocRequirement(v30);
LABEL_21:
  if ((_DWORD)v18)
    v27 = 70;
  else
    v27 = 10;
  if (v27 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v20[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  *(_QWORD *)v20 = 0;
  v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v20, 0, 1);
  if (!(_DWORD)v16)
    v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  v17 = v16;
  if (*(_QWORD *)v20)
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v20, 1);
  if ((_DWORD)v17)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t v10;
  int v12;

  v12 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  v9 = 70;
  v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if ((_DWORD)v10)
      v9 = 70;
    else
      v9 = 10;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t (*v15)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD v21[2];

  v15 = a1;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  if (v15 && a6 == 16 * (a5 != 0) && (a7 ? (v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80) : (v16 = a8 != 0), !v16))
  {
    MEMORY[0x1E0C80A78](a1);
    v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4)
      *(_OWORD *)(v17 + 12) = *a4;
    if (a5)
      *(_OWORD *)(v17 + 28) = *a5;
    if (a8)
      memcpy(v17 + 44, a7, a8);
    v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if ((_DWORD)v18)
      v19 = 70;
    else
      v19 = 10;
  }
  else
  {
    v19 = 70;
    v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  v8 = 70;
  v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if ((_DWORD)v9)
      v8 = 70;
    else
      v8 = 10;
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  if (a1)
  {
    v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3)
      v10 = a4 != 0;
    v11 = 70;
    if (!v10)
    {
      if (a5)
        v12 = 43;
      else
        v12 = 39;
      v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if ((_DWORD)v13)
        v11 = 70;
      else
        v11 = 10;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 70;
  }
  v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *);
  unsigned int v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  unint64_t v17;
  _OWORD v18[17];
  uint64_t v19;
  char v20;
  _BYTE v21[3];
  __int16 v22;
  uint64_t v23;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *))v1;
  v23 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      v20 = 1;
      *(_WORD *)&v21[1] = 6;
      v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      v19 = 0;
      v17 = 280;
      v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if ((_DWORD)v14)
      {
        v12 = v14;
      }
      else if (v17 < 0x18)
      {
        v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          v12 = 0;
          v15 = DWORD1(v18[1]);
          *(_OWORD *)v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *v3 = v13;
          v11 = 10;
          goto LABEL_11;
        }
        v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      v11 = 70;
    }
    else
    {
      v11 = 70;
      v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *);
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15[2];
  _BYTE v16[2];
  unsigned __int16 v17;
  size_t __n;
  int v19;
  __int128 v20;
  uint64_t v21;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *))v0;
  v21 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  v10 = 70;
  v11 = 4294967293;
  if (v9 && v4 && v2)
  {
    v20 = 0uLL;
    v19 = 1310721;
    if (v6)
      v20 = *v6;
    else
      v20 = 0uLL;
    bzero(v16, 0x1106uLL);
    *(_QWORD *)v15 = 4358;
    v12 = v9(v8, 49, 0, &v19, 20, v16, v15);
    if ((_DWORD)v12)
    {
      v11 = v12;
LABEL_18:
      v10 = 70;
      goto LABEL_14;
    }
    if (*(_QWORD *)v15 < 6uLL)
    {
      v10 = 70;
      v11 = 4294967291;
    }
    else
    {
      if (v16[0])
      {
        v14 = v17;
        v11 = Util_ReadFromBuffer((uint64_t)v16, *(size_t *)v15, &v14, v4, (unsigned __int16)__n);
        if (!(_DWORD)v11)
        {
          *v2 = v14 - v17;
          v10 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      v10 = 70;
      v11 = 4294967280;
    }
  }
LABEL_14:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  size_t v22;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  size = 0;
  v16 = 70;
  v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      v16 = 70;
      v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      v16 = 70;
      v17 = 4294967276;
    }
    else
    {
      v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if ((_DWORD)v18)
      {
        v17 = v18;
        v16 = 70;
      }
      else
      {
        v19 = size;
        v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!(_DWORD)v21)
            v21 = a1(a2, 40, 0, v20, size, 0, 0);
          v17 = v21;
          v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if ((_DWORD)v17)
            v16 = 70;
          else
            v16 = 10;
        }
        else
        {
          v16 = 70;
          v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t Data_Serialize;
  size_t v24;
  uint64_t v26;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
  {
    v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size = 0;
  v17 = 70;
  v18 = 4294967293;
  if (a1)
  {
    v26 = a2;
    if (a3)
    {
      v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          v19 = a8;
          v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if ((_DWORD)v20)
          {
            v18 = v20;
            v17 = 70;
          }
          else
          {
            v21 = size;
            v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!(_DWORD)Data_Serialize)
                Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              v18 = Data_Serialize;
              v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if ((_DWORD)v18)
                v17 = 70;
              else
                v17 = 10;
            }
            else
            {
              v17 = 70;
              v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD v14[2];

  v7 = a1;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  if (v7)
  {
    if (a3)
      v8 = 1;
    else
      v8 = a4 == 0;
    v9 = !v8;
    v10 = 70;
    v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x1E0C80A78](a1);
      v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *v12 = 1;
      v12[1] = a4;
      if (a4)
        memcpy(v12 + 2, a3, a4);
      v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if ((_DWORD)v11)
        v10 = 70;
      else
        v10 = 10;
    }
  }
  else
  {
    v10 = 70;
    v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, __int128 *a3, int a4, _QWORD *a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  _OWORD v15[9];
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  v10 = 70;
  v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    v16 = 1;
    v18 = a4;
    v17 = *a3;
    memset(v15, 0, 140);
    v14 = 140;
    v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if ((_DWORD)v12)
    {
      v11 = v12;
    }
    else if (v14 < 0xC)
    {
      v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        v11 = 0;
        *a5 = *(_QWORD *)((char *)v15 + 4);
        v10 = 10;
        goto LABEL_10;
      }
      v11 = 4294967281;
    }
    v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  uint64_t v20;
  uint64_t SerializedVerifyAclConstraintSize;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  rsize_t v28;
  unsigned int v29;
  size_t v33;
  int *v34;
  unint64_t v35;
  size_t v36;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  v36 = 0;
  v34 = 0;
  v35 = 4096;
  v33 = 0;
  v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20)
      goto LABEL_22;
    goto LABEL_20;
  }
  SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    v22 = v36;
    v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        v20 = v24;
        v25 = 0;
      }
      else
      {
        v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            v20 = v26;
          }
          else
          {
            v27 = v35 - 4;
            if (v35 < 4)
            {
              v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20)
                  *a14 = v34;
              }
              else
              {
                v20 = 0;
              }
            }
          }
        }
        else
        {
          v20 = 4294967292;
        }
      }
      v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      v20 = 4294967292;
    }
    goto LABEL_19;
  }
  v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34)
    Util_DeallocRequirement(v34);
LABEL_22:
  if ((_DWORD)v20)
    v29 = 70;
  else
    v29 = 10;
  if (v29 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, _QWORD *a14, unint64_t *a15)
{
  unsigned int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  uint64_t SerializedProcessAclSize;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  rsize_t v36;
  unsigned int v37;
  int v39;
  unint64_t v44;
  size_t v45;

  v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    v20 = a6;
    v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        v19 = gACMLoggingLevel;
      }
    }
  }
  v39 = a3;
  if (a8)
  {
    v22 = a8;
    v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u)
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5)
      v26 = a6 == 0;
    else
      v26 = 1;
    v27 = v26;
    v24 = 70;
    v25 = 4294967293;
    if (!a7)
      goto LABEL_79;
    if (!a8)
      goto LABEL_79;
    if (v27)
      goto LABEL_79;
    v24 = 70;
    v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12)
      goto LABEL_79;
    v45 = 0;
    v44 = 4096;
    if (gACMLoggingLevel <= 0xAu)
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if ((_DWORD)SerializedProcessAclSize)
    {
      v25 = SerializedProcessAclSize;
      v37 = 70;
      goto LABEL_74;
    }
    v29 = v45;
    v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      v37 = 70;
      v25 = 4294967292;
      goto LABEL_74;
    }
    v44 = 4096;
    v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      v35 = 0;
      v34 = 0;
      v25 = 4294967292;
      goto LABEL_68;
    }
    v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if ((_DWORD)v32 || (v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), (_DWORD)v32))
    {
      v25 = v32;
      v34 = 0;
      v35 = 0;
      goto LABEL_67;
    }
    v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13)
        *a13 = v31[1] != 0;
      v25 = 0;
      v34 = 0;
      if (v39 != 30 || !a14)
      {
        v35 = 0;
        goto LABEL_67;
      }
      v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if ((_DWORD)v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          v37 = 70;
        }
        else if ((_DWORD)v25)
        {
          v37 = 70;
        }
        else
        {
          v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel)
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        v34 = v31[2];
        if ((_DWORD)v34)
        {
          if (v33 >= v34 + 12)
          {
            v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        v34 = 0;
        v35 = 0;
        v25 = 0;
        goto LABEL_67;
      }
    }
    v34 = 0;
LABEL_84:
    v35 = 0;
    v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    v24 = 70;
    v25 = 4294967293;
    goto LABEL_79;
  }
  v24 = 70;
  v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if ((_DWORD)v25)
      v24 = 70;
    else
      v24 = 10;
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, _QWORD *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  unsigned int v21;
  uint64_t v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  v21 = 70;
  v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v21 = 70;
        v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if ((_DWORD)v22)
              v21 = 70;
            else
              v21 = 10;
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD);
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  _QWORD v24[2];

  v16 = a1;
  v24[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3)
    v17 = a4 != 0;
  if (v17)
  {
    v18 = 70;
    v19 = 4294967293;
  }
  else
  {
    v18 = 70;
    v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            v20 = a4 + 36;
            MEMORY[0x1E0C80A78](a1);
            v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3)
              memcpy(v22 + 36, a3, v21);
            v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if ((_DWORD)v19)
              v18 = 70;
            else
              v18 = 10;
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char v9;

  v9 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  v6 = v5;
  if ((_DWORD)v5)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  char v13;
  unint64_t v14;
  char v15;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  v15 = 0;
  v14 = 1;
  v13 = 0;
  v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if ((_DWORD)v8)
  {
    v11 = v8;
    v9 = 70;
  }
  else
  {
    v9 = 70;
    if (v14 > 1)
    {
      v11 = 4294967291;
    }
    else
    {
      v10 = v15 & ~a3;
      if (a4)
        v10 = v15 | a3;
      v13 = v10;
      v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if ((_DWORD)v11)
        v9 = 70;
      else
        v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, _BYTE *a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t UnlockSecret_Serialize;
  size_t v19;
  char v21;
  size_t __n;
  void *__src;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[129];
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  memset(v27, 0, sizeof(v27));
  v25 = 64;
  v24 = 129;
  if (!a3)
    goto LABEL_18;
  v16 = 70;
  v17 = 4294967293;
  if (!a6 || !a7 || !a8)
    goto LABEL_14;
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    v16 = 70;
    v17 = 4294967293;
    goto LABEL_14;
  }
  UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if ((_DWORD)UnlockSecret_Serialize
    || (UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), (_DWORD)UnlockSecret_Serialize)
    || (__n = 0,
        __src = 0,
        v21 = 0,
        UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        (_DWORD)UnlockSecret_Serialize))
  {
    v17 = UnlockSecret_Serialize;
  }
  else
  {
    v19 = __n;
    if (*a7 < __n)
    {
      v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        v17 = 0;
        *a7 = v19;
        *a8 = v21;
        v16 = 10;
        goto LABEL_14;
      }
      v17 = 4294967291;
    }
  }
  v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  BOOL v16;
  uint64_t Size;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  size_t v27;
  uint64_t v29;
  void *v30;
  size_t v31;
  const void *v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35[256];
  uint64_t v36;

  v30 = a8;
  v36 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  v33 = 1024;
  v34 = 0;
  if (!a1)
    goto LABEL_17;
  v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3)
    v16 = a4 != 0;
  if (v16)
  {
LABEL_17:
    v25 = 70;
    v24 = 4294967293;
    goto LABEL_21;
  }
  Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if ((_DWORD)Size)
  {
LABEL_18:
    v24 = Size;
LABEL_25:
    v25 = 70;
    goto LABEL_21;
  }
  v18 = a5;
  v19 = a2;
  v20 = (_OWORD *)MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if ((_DWORD)v23)
  {
    v24 = v23;
    goto LABEL_20;
  }
  v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if ((_DWORD)v24)
  {
LABEL_20:
    v25 = 70;
    goto LABEL_21;
  }
  v25 = 10;
  v26 = v30;
  if (!v30 || !a9)
    goto LABEL_21;
  v31 = 0;
  v32 = 0;
  Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if ((_DWORD)Size)
    goto LABEL_18;
  v27 = v31;
  if (*a9 < v31)
  {
    v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32)
    memcpy(v26, v32, v31);
  v24 = 0;
  *a9 = v27;
  v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, _BYTE *a5)
{
  size_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v18 = 4;
  v10 = a4;
  v11 = a4 + 4;
  MEMORY[0x1E0C80A78](a1);
  v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  v13 = 70;
  v14 = 4294967293;
  if (a3 && a5)
  {
    *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if ((_DWORD)v15)
    {
      v14 = v15;
      v13 = 70;
    }
    else if (v18 == 4)
    {
      v14 = 0;
      *a5 = 1;
      v13 = 10;
    }
    else
    {
      v13 = 70;
      v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

void CoreTelephonyLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFObliterationController.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIDSHardDeregisterSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IDSLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFObliterationController.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AuthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFObliterationController.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCellularLoggingClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CellularLoggingLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFRemoteBasebandLoggingManager.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCellularLoggingClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCellularLoggingClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFRemoteBasebandLoggingManager.m"), 21, CFSTR("Unable to find class %s"), "CellularLogging");

  __break(1u);
}

void _get_MKBLockDevice_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBLockDevice_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBLockDevice(CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 67, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBUnlockDevice_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBUnlockDevice_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBUnlockDevice(CFDataRef, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 68, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBGetDeviceConfigurations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBGetDeviceConfigurations_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef __LAMKBGetDeviceConfigurations(CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 69, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBGetDeviceLockState_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBGetDeviceLockState_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBGetDeviceLockState(CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 70, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBGetDeviceLockStateInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBGetDeviceLockStateInfo_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef __LAMKBGetDeviceLockStateInfo(CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 71, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBDeviceUnlockedSinceBoot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBDeviceUnlockedSinceBoot_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBDeviceUnlockedSinceBoot(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 72, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBDeviceLockAssertion_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBDeviceLockAssertion_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKBAssertionRef __LAMKBDeviceLockAssertion(CFDictionaryRef, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 73, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBKeyBagKeyStashCreateWithOpts_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBKeyBagKeyStashCreateWithOpts_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBKeyBagKeyStashCreateWithOpts(CFDictionaryRef, int, CFDataRef, CFDataRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 74, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBKeyBagKeyStashCommit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBKeyBagKeyStashCommit_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBKeyBagKeyStashCommit(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 75, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBKeyBagKeyStashVerify_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBKeyBagKeyStashVerify_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef __LAMKBKeyBagKeyStashVerify(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 76, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBEventsRegister_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBEventsRegister_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKBEvent *__LAMKBEventsRegister(__strong dispatch_queue_t, void (^__strong)(MKBEventType, CFDictionaryRef))");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 77, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBEventsUnregister_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBEventsUnregister_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __LAMKBEventsUnregister(MKBEvent *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 78, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBKeyBagPerformRecovery_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBKeyBagPerformRecovery_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBKeyBagPerformRecovery(CFDataRef, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 79, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _get_MKBPrewarmSPS_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a1, a3, "%s called but its _LAMKB wrapper does not exist, calling MKB directly", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __LAMKBPrewarmSPS_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int __LAMKBPrewarmSPS(CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFMobileKeyBag.m"), 80, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void LocalAuthenticationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LocalAuthenticationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFMobileKeyBag.m"), 66, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFLockScreenDateView.m"), 32, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBUILegibilityLabelClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFLockScreenDateView.m"), 33, CFSTR("Unable to find class %s"), "SBUILegibilityLabel");

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoverSheetKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFLockScreenDateView.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSProminentLayoutControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFLockScreenDateView.m"), 41, CFSTR("Unable to find class %s"), "CSProminentLayoutController");

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleAccountUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFUserAuthenticationController.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAAUIDeviceLocatorServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFUserAuthenticationController.m"), 37, CFSTR("Unable to find class %s"), "AAUIDeviceLocatorService");

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreMaterialLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFCARendererImpl.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTMaterialLayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFCARendererImpl.m"), 32, CFSTR("Unable to find class %s"), "MTMaterialLayer");

  __break(1u);
}

void __sbfImageByApplyingColorSpace_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a2, a3, " [SBFImageColorSpaceUtilities] the original image isn't CGImage based -> image=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __sbfImageByApplyingColorSpace_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a2, a3, " [SBFImageColorSpaceUtilities] the original image doesn't have a colorspace -> image=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __sbfImageByApplyingColorSpace_cold_3(CGColorSpace *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  CGColorSpaceGetModel(a1);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_18AB69000, v1, v2, " [SBFImageColorSpaceUtilities] don't know which device colorspace matches ICC model=%i -> space=%{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_2();
}

void __sbfImageByApplyingColorSpace_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CGColorSpaceGetType();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_18AB69000, v0, v1, " [SBFImageColorSpaceUtilities] don't know which device colorspace matches type=%i -> space=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFLockScreenDateSubtitleView.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBUILegibilityLabelClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFLockScreenDateSubtitleView.m"), 16, CFSTR("Unable to find class %s"), "SBUILegibilityLabel");

  __break(1u);
}

void __getSOSUtilitiesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SOSLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBSOSDefaults.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSOSUtilitiesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSOSUtilitiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBSOSDefaults.m"), 19, CFSTR("Unable to find class %s"), "SOSUtilities");

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFLockScreenAlternateDateLabel.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBUILegibilityLabelClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFLockScreenAlternateDateLabel.m"), 22, CFSTR("Unable to find class %s"), "SBUILegibilityLabel");

  __break(1u);
}

void __getCSProminentDisplayViewControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoverSheetKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFLockScreenDateViewController.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSProminentDisplayViewControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSProminentDisplayViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBFLockScreenDateViewController.m"), 39, CFSTR("Unable to find class %s"), "CSProminentDisplayViewController");

  __break(1u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0CF63D8]();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x1E0CFD2E0]();
}

uint64_t AKSEventsUnregister()
{
  return MEMORY[0x1E0CFD2E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t AnalyticsSetCallbackForQueriedEventWithQueue()
{
  return MEMORY[0x1E0D15440]();
}

uint64_t BKSDisplaySetSecureMode()
{
  return MEMORY[0x1E0D009F0]();
}

uint64_t BKSHIDEventMatchingPredicate()
{
  return MEMORY[0x1E0D00A60]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1E0D01140]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1E0D01190]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D01210]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1E0D01228]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1E0D01260]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1E0D01270]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0D012B8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D01340]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x1E0D01388]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1E0D01440]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1E0D014E8]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1E0D014F0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSUISurfaceWithColorSpaceAndDrawBlock()
{
  return MEMORY[0x1E0D018F8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x1E0C9BB08]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1E0C9BB90]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

uint64_t CGColorSpaceIsICCCompatible()
{
  return MEMORY[0x1E0C9BF10]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithFilename(const char *filename)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C608](filename);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1E0C9CB08]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1E0C9CB10]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1E0C9CB48]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1E0CBC290]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1E0C9CC70]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1E0C9CD20]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1E0C9CD50]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1E0CFA1C8]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1E0CFA1D8]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1E0CEC8D0]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1E0D39FD0]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1E0D3A020]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1E0D3A048]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1E0D3A078]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1E0CBBC88](property);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1E0CBBE98]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

uint64_t MKBPrewarmSPS()
{
  return MEMORY[0x1E0D4E558]();
}

uint64_t MKBVerifyPasswordWithContext()
{
  return MEMORY[0x1E0D4E590]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t Mobile_Obliterate()
{
  return MEMORY[0x1E0D4E608]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

uint64_t NSStringFromAnalyticsQueryName()
{
  return MEMORY[0x1E0DAACE8]();
}

uint64_t NSStringFromBLSBacklightState()
{
  return MEMORY[0x1E0D00F10]();
}

uint64_t NSStringFromBLSFlipbookState()
{
  return MEMORY[0x1E0D00F18]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBUIMagicWallpaperEnumeration()
{
  return MEMORY[0x1E0D65318]();
}

uint64_t PBUIMagicWallpaperRepresentativeThumbnailForClass()
{
  return MEMORY[0x1E0D65328]();
}

uint64_t PBUIMagicWallpaperThumbnail()
{
  return MEMORY[0x1E0D65330]();
}

uint64_t PBUIRegisterForWallpaperExternalChangeNotification()
{
  return MEMORY[0x1E0D65348]();
}

uint64_t PBUIStringForWallpaperLocations()
{
  return MEMORY[0x1E0D65350]();
}

uint64_t PBUIStringForWallpaperMode()
{
  return MEMORY[0x1E0D65358]();
}

uint64_t PBUIStringForWallpaperType()
{
  return MEMORY[0x1E0D65360]();
}

uint64_t PBUIStringForWallpaperVariant()
{
  return MEMORY[0x1E0D65368]();
}

uint64_t SBLogAuthenticationAssertions()
{
  return MEMORY[0x1E0DAB2D8]();
}

uint64_t SBLogAuthenticationController()
{
  return MEMORY[0x1E0DAB2E0]();
}

uint64_t SBLogAuthenticationKeybag()
{
  return MEMORY[0x1E0DAB2E8]();
}

uint64_t SBLogAuthenticationModel()
{
  return MEMORY[0x1E0DAB2F0]();
}

uint64_t SBLogAuthenticationRequests()
{
  return MEMORY[0x1E0DAB2F8]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1E0DAB330]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1E0DAB350]();
}

uint64_t SBLogDisplayScaleMapping()
{
  return MEMORY[0x1E0DAB390]();
}

uint64_t SBLogMotionAlarm()
{
  return MEMORY[0x1E0DAB468]();
}

uint64_t SBLogMotionGesture()
{
  return MEMORY[0x1E0DAB470]();
}

uint64_t SBLogScreenWake()
{
  return MEMORY[0x1E0DAB4A0]();
}

uint64_t SBLogZStack()
{
  return MEMORY[0x1E0DAB4F0]();
}

uint64_t SBSDisplayScaleDescription()
{
  return MEMORY[0x1E0DAB6C8]();
}

uint64_t SBSDisplayScaleMaskFromScale()
{
  return MEMORY[0x1E0DAB6D0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0CEB448]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x1E0CEB4A8]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0CEB4B8]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0CEB718]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0CEBAA0]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0CEBAB0]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0CEBAE8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1E0C9A0D8]();
}

uint64_t _EXIFOrientationForUIImageOrientation()
{
  return MEMORY[0x1E0CEBE60]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1E0CB3BF8]();
}

uint64_t _NSStringFromUIPhysicalButton()
{
  return MEMORY[0x1E0CEBE68]();
}

uint64_t _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection()
{
  return MEMORY[0x1E0CEBEC0]();
}

uint64_t _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  return MEMORY[0x1E0CEC0A0]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1E0CEC2D8]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1E0CEC2E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1E0DABCE0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1E0DABCF0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1E0CFD3C8]();
}

uint64_t aks_oneness_heartbeat()
{
  return MEMORY[0x1E0CFD430]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

void sync(void)
{
  MEMORY[0x1E0C85758]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

uint64_t uset_freeze()
{
  return MEMORY[0x1E0DE69A8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

uint64_t uset_span()
{
  return MEMORY[0x1E0DE6A18]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

