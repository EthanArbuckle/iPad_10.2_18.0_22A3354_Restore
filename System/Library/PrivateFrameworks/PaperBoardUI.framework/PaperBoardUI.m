uint64_t _WallpaperStyleForBackgroundStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 1;
  else
    return qword_1B723FDD8[a1 - 1];
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreLandscapeRotation(unint64_t a1)
{
  return (a1 >> 6) & 1;
}

void sub_1B71C2B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71C32E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PBUIWallpaperStyleIsHidden(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_1B71C44C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PBUILogCommon()
{
  if (PBUILogCommon_onceToken != -1)
    dispatch_once(&PBUILogCommon_onceToken, &__block_literal_global_4);
  return (id)PBUILogCommon___logObj;
}

__CFString *PBUIStringForWallpaperVariant(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2)
    return 0;
  else
    return off_1E6B965B0[a1 + 1];
}

uint64_t _PRCollectionsPosterDescriptorNeedsSnapshotReplacement(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("7595")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("7600")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("7605")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("7610")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("7615"));
  }

  return v2;
}

id PBUIRenderingLogFenceReason()
{
  if (PBUIRenderingLogFenceReason_onceToken != -1)
    dispatch_once(&PBUIRenderingLogFenceReason_onceToken, &__block_literal_global_8);
  return (id)PBUIRenderingLogFenceReason___logObj;
}

id NSStringFrom_PBUIPosterViewControllerUpdateReasons(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  char v15;

  v2 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __NSStringFrom_PBUIPosterViewControllerUpdateReasons_block_invoke;
  v13 = &unk_1E6B96BC8;
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

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "), v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1B71C5918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B71C59D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _WallpaperStyleHasBlur(unint64_t a1)
{
  return (a1 < 0x1F) & (0x76C0FFF8u >> a1);
}

void sub_1B71C7434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PBUIWallpaperStyleTransitionStateMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

BOOL PBUIWallpaperVariantIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PBUIWallpaperStylePriorityIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *PBUIWallpaperStyleDescription(unint64_t a1)
{
  if (a1 < 0x1F)
    return off_1E6B96DF0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *PBUIStringForWallpaperStylePriority(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E6B96FE0[a1];
}

BOOL PBUIWallpaperStyleIsValid(uint64_t a1)
{
  return a1 >= 0;
}

BOOL _WallpaperStyleUpdatesWithUserInterfaceStyle(uint64_t a1)
{
  return (unint64_t)(a1 - 28) < 3;
}

void _WallpaperBackdropParametersForStyleAndAverageColor(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;

  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = a2;
  PBUIWallpaperBackdropParametersMake(0, 0, 0, a3);
  v6 = 2030;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      v6 = -2;
      goto LABEL_7;
    case 3uLL:
      v8 = 5;
      goto LABEL_14;
    case 4uLL:
    case 0x10uLL:
      v6 = 2010;
      goto LABEL_7;
    case 5uLL:
    case 0xAuLL:
    case 0x11uLL:
      v6 = 2070;
      goto LABEL_7;
    case 6uLL:
    case 0xBuLL:
    case 0x12uLL:
      v6 = 2071;
      goto LABEL_7;
    case 7uLL:
    case 0xCuLL:
    case 0x13uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      v6 = 2020;
      goto LABEL_7;
    case 8uLL:
    case 0x14uLL:
LABEL_7:
      *(_QWORD *)a3 = v6;
      if (a1 > 0x1E)
        break;
      v7 = (_QWORD *)qword_1E6B96EE8[a1];
      goto LABEL_22;
    case 9uLL:
      *(_QWORD *)(a3 + 24) = 0x4054000000000000;
      v8 = 2010;
      goto LABEL_14;
    case 0xDuLL:
      *(_QWORD *)a3 = 2030;
      *(_OWORD *)(a3 + 40) = xmmword_1B723FD70;
      v9 = xmmword_1B723FD80;
      goto LABEL_16;
    case 0xEuLL:
      *(_QWORD *)a3 = 2020;
      *(_QWORD *)(a3 + 24) = 0x4024000000000000;
      *(_OWORD *)(a3 + 40) = xmmword_1B723FD60;
      goto LABEL_21;
    case 0xFuLL:
      *(_QWORD *)(a3 + 24) = 0x4054000000000000;
      v8 = 2030;
LABEL_14:
      *(_QWORD *)a3 = v8;
      goto LABEL_21;
    case 0x15uLL:
      *(_QWORD *)a3 = 2030;
      *(_OWORD *)(a3 + 40) = xmmword_1B723FD90;
      v9 = xmmword_1B723FDA0;
LABEL_16:
      *(_OWORD *)(a3 + 24) = v9;
      goto LABEL_21;
    case 0x1CuLL:
      v10 = 1;
      goto LABEL_20;
    case 0x1DuLL:
      v10 = 2;
      goto LABEL_20;
    case 0x1EuLL:
      v10 = 3;
LABEL_20:
      *(_QWORD *)(a3 + 56) = v10;
LABEL_21:
      v7 = (_QWORD *)MEMORY[0x1E0CEBF20];
LABEL_22:
      *(_QWORD *)(a3 + 8) = *v7;
      break;
    default:
      break;
  }
  v11 = _BackdropRenderingHintForWallpaperAverageColor(v5);

  *(_QWORD *)(a3 + 16) = v11;
}

void *_BackdropRenderingHintForWallpaperAverageColor(void *result)
{
  double v1;
  double v2;

  if (result)
  {
    v1 = 0.0;
    v2 = 0.0;
    objc_msgSend(result, "getHue:saturation:brightness:alpha:", 0, &v2, &v1, 0);
    if (v1 > 0.95)
      return (void *)(v2 < 0.05);
    else
      return 0;
  }
  return result;
}

int64x2_t PBUIWallpaperBackdropParametersMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int64x2_t result;

  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  result = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(a4 + 24) = result;
  *(int64x2_t *)(a4 + 40) = result;
  *(_QWORD *)(a4 + 56) = 0;
  return result;
}

void sub_1B71C8144(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t _WallpaperStyleHasTint(unint64_t a1)
{
  return (a1 < 0x1E) & (0x3DBFDE04u >> a1);
}

void sub_1B71C8960(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void PBUIApplyParallaxSettingsToViewWithFactor(void *a1, void *a2, double a3)
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

void PBUIApplyParallaxSettingsToView(void *a1, void *a2)
{
  PBUIApplyParallaxSettingsToViewWithFactor(a1, a2, 1.0);
}

uint64_t PBUIReplicaDebugModeIsEnabled()
{
  if (PBUIReplicaDebugModeIsEnabled_onceToken != -1)
    dispatch_once(&PBUIReplicaDebugModeIsEnabled_onceToken, &__block_literal_global_5);
  return PBUIReplicaDebugModeIsEnabled___isEnabled;
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreRotation(unint64_t a1)
{
  return (a1 >> 1) & 1;
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreZoom(char a1)
{
  return a1 & 1;
}

Class initISAVPlayer()
{
  Class result;

  if (LoadPhotosPlayer_loadPredicate != -1)
    dispatch_once(&LoadPhotosPlayer_loadPredicate, &__block_literal_global);
  result = objc_getClass("ISAVPlayer");
  classISAVPlayer = (uint64_t)result;
  getISAVPlayerClass = (uint64_t (*)())ISAVPlayerFunction;
  return result;
}

id ISAVPlayerFunction()
{
  return (id)classISAVPlayer;
}

void sub_1B71CBBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

void sub_1B71CCD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B71CD1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B71CD3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B71CD684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getISAssetClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISAssetClass_block_invoke_cold_1();
  getISAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PhotosPlayerLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!PhotosPlayerLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E6B94860;
    v2 = 0;
    PhotosPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosPlayerLibraryCore_frameworkLibrary)
    PhotosPlayerLibrary_cold_1(&v0);
}

Class __getISPlayerItemClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISPlayerItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISPlayerItemClass_block_invoke_cold_1();
  getISPlayerItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLiveWallpaperPlayerClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISLiveWallpaperPlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISLiveWallpaperPlayerClass_block_invoke_cold_1();
  getISLiveWallpaperPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLivePhotoPlayerClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISLivePhotoPlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISLivePhotoPlayerClass_block_invoke_cold_1();
  getISLivePhotoPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLiveWallpaperUIViewClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISLiveWallpaperUIView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISLiveWallpaperUIViewClass_block_invoke_cold_1();
  getISLiveWallpaperUIViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLivePhotoUIViewClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosPlayerLibrary();
  result = objc_getClass("ISLivePhotoUIView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISLivePhotoUIViewClass_block_invoke_cold_1();
  getISLivePhotoUIViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return objc_opt_class();
}

const __CFString *PBUIStringForWallpaperTransformOptions(uint64_t a1)
{
  if (a1 > 1)
  {
    if (a1 != 2)
    {
      if (a1 == 15)
        return CFSTR("ignoring all wallpaper options");
      return CFSTR("unknown wallpaper options");
    }
    return CFSTR("ignore rotation");
  }
  else
  {
    if (a1)
    {
      if (a1 == 1)
        return CFSTR("ignore scale");
      return CFSTR("unknown wallpaper options");
    }
    return CFSTR("default wallpaper options");
  }
}

void sub_1B71CE820(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_1B71CEEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

id getMTMaterialViewClass()
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
  v0 = (void *)getMTMaterialViewClass_softClass;
  v7 = getMTMaterialViewClass_softClass;
  if (!getMTMaterialViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMTMaterialViewClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getMTMaterialViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B71D1774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTMaterialViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6B94B50;
    v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary)
    __getMTMaterialViewClass_block_invoke_cold_1(&v3);
  result = objc_getClass("MTMaterialView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTMaterialViewClass_block_invoke_cold_2();
  getMTMaterialViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B71D259C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1B71D28C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B71D3774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PBUIRegisterForWallpaperExternalChangeNotification()
{
  if (PBUIRegisterForWallpaperExternalChangeNotification___once != -1)
    dispatch_once(&PBUIRegisterForWallpaperExternalChangeNotification___once, &__block_literal_global_3);
}

void sub_1B71D3D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PBUIRegisterForExternalWallpaperChangeNotificationWithHandler(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  int out_token;

  v1 = a1;
  out_token = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PBUIRegisterForExternalWallpaperChangeNotificationWithHandler_block_invoke;
  v5[3] = &unk_1E6B94D60;
  v6 = v1;
  v2 = v1;
  notify_register_dispatch("com.apple.springboard.wallpaperchanged", &out_token, MEMORY[0x1E0C80D38], v5);
  v3 = out_token;

  return v3;
}

void sub_1B71DA158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _WallpaperMinimumZoomScale(double a1, double a2, double a3, double a4)
{
  double result;
  double v5;

  result = a1 / a3;
  v5 = a2 / a4;
  if (result < v5)
    return v5;
  return result;
}

uint64_t _WallpaperMinimumZoomScaleForParallax(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", a1, a4, a5);
}

uint64_t PBUIPostExternalWallpaperChangeNotificationAsSystemShell()
{
  __isSystemShell = 1;
  return notify_post("com.apple.springboard.wallpaperchanged");
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

unint64_t PBUIIrisWallpaperPlaybackStateForISPlaybackState(unint64_t result)
{
  if (result >= 6)
    return -1;
  return result;
}

id PBUIIrisWallpaperPlaybackStateDescription(unint64_t a1)
{
  if (a1 < 6)
    return *((id *)&off_1E6B94E08 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFString *PBUIIrisWallpaperViewModeDescription(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("live");
  if (a1 == 1)
  {
    v1 = CFSTR("still-only");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id PBUIIrisPlayerStateDescription(unint64_t a1)
{
  if (a1 < 3)
    return *((id *)&off_1E6B94E38 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PBUIRenderingLogLocalRenderer()
{
  if (PBUIRenderingLogLocalRenderer_onceToken != -1)
    dispatch_once(&PBUIRenderingLogLocalRenderer_onceToken, &__block_literal_global_4);
  return (id)PBUIRenderingLogLocalRenderer___logObj;
}

id PBUIRenderingLogRendererService()
{
  if (PBUIRenderingLogRendererService_onceToken != -1)
    dispatch_once(&PBUIRenderingLogRendererService_onceToken, &__block_literal_global_6);
  return (id)PBUIRenderingLogRendererService___logObj;
}

id PBUIRenderingLogImageUtilities()
{
  if (PBUIRenderingLogImageUtilities_onceToken != -1)
    dispatch_once(&PBUIRenderingLogImageUtilities_onceToken, &__block_literal_global_10);
  return (id)PBUIRenderingLogImageUtilities___logObj;
}

id PBUILogSnapshot()
{
  if (PBUILogSnapshot_onceToken != -1)
    dispatch_once(&PBUILogSnapshot_onceToken, &__block_literal_global_12);
  return (id)PBUILogSnapshot___logObj;
}

id PBUILogCaching()
{
  if (PBUILogCaching_onceToken != -1)
    dispatch_once(&PBUILogCaching_onceToken, &__block_literal_global_14);
  return (id)PBUILogCaching___logObj;
}

void sub_1B71DE08C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE1B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE580(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE620(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE6B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE740(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DE7D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEA04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEA9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEB24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DECA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DED7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEDF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEEA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DEF30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DF01C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DF184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B71DF248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B71DF2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B71DF370(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DF4F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DF58C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B71DFBFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B71E09AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

PBUIHomeVariantStyleState *PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PBUIHomeVariantStyleState *v12;

  v1 = a1;
  objc_msgSend(v1, "customizationConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDimmed");

  objc_msgSend(v1, "customizationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColorStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "customizationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "customizationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconUserInterfaceSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "customizationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "iconUserInterfaceStyleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PBUIHomeVariantStyleState initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:]([PBUIHomeVariantStyleState alloc], "initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:", v5, v7, v3, v9, v11);
  return v12;
}

id __possibleWallpaperFileNames()
{
  if (__possibleWallpaperFileNames_onceToken != -1)
    dispatch_once(&__possibleWallpaperFileNames_onceToken, &__block_literal_global_27);
  return (id)__possibleWallpaperFileNames_possibleWallpaperFileNames;
}

id __wallpaperImageFilename(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = 0;
      return v4;
    }
    v2 = CFSTR("HomeBackground");
  }
  else
  {
    v2 = CFSTR("LockBackground");
  }
  if (a2 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".cpbitmap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __wallpaperOriginalImageFilename(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = 0;
      return v4;
    }
    v2 = CFSTR("OriginalHomeBackground");
  }
  else
  {
    v2 = CFSTR("OriginalLockBackground");
  }
  if (a2 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".cpbitmap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __wallpaperThumbnailFilename(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = 0;
      return v4;
    }
    v2 = CFSTR("HomeBackgroundThumbnail");
  }
  else
  {
    v2 = CFSTR("LockBackgroundThumbnail");
  }
  if (a2 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".jpg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __hasEnoughFreeSpaceToSetWallpaper()
{
  id v0;
  int v1;
  statfs v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, 512);
  NSHomeDirectory();
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = statfs((const char *)objc_msgSend(v0, "fileSystemRepresentation"), &v4);

  return !v1 && v4.f_bfree * v4.f_bsize > 0x1400000;
}

id __wallpaperVideoFilename(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = 0;
      return v4;
    }
    v2 = CFSTR("HomeVideo");
  }
  else
  {
    v2 = CFSTR("LockVideo");
  }
  if (a2 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __wallpaperOriginalVideoFilename(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    if (a1 != 1)
    {
      v4 = 0;
      return v4;
    }
    v2 = CFSTR("OriginalHomeVideo");
  }
  else
  {
    v2 = CFSTR("OriginalLockVideo");
  }
  if (a2 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1B71E3B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ____possibleWallpaperFileNames_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "addObject:", CFSTR("OriginalLockBackground"));
  objc_msgSend(v2, "addObject:", CFSTR("OriginalHomeBackground"));
  objc_msgSend(v2, "addObject:", CFSTR("OriginalHomeVideo"));
  objc_msgSend(v2, "addObject:", CFSTR("OriginalLockVideo"));
  objc_msgSend(v2, "addObject:", CFSTR("LockBackgroundThumbnail"));
  objc_msgSend(v2, "addObject:", CFSTR("HomeBackgroundThumbnail"));
  objc_msgSend(v2, "addObject:", CFSTR("LockVideo"));
  objc_msgSend(v2, "addObject:", CFSTR("HomeVideo"));
  objc_msgSend(v2, "addObject:", CFSTR("LockBackground"));
  objc_msgSend(v2, "addObject:", CFSTR("HomeBackground"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)__possibleWallpaperFileNames_possibleWallpaperFileNames;
  __possibleWallpaperFileNames_possibleWallpaperFileNames = v0;

}

id PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  soft_PUIFeatureEnabled(4);
  BSSystemSharedResourcesDirectoryForIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Wallpaper"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1
    || (NSTemporaryDirectory(),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SpringBoard")),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v1))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1B71E7E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  id *v31;
  id *v32;
  uint64_t v33;

  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
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

id PBUIStringForWallpaperLocations(char a1)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PBUIStringForWallpaperLocations_block_invoke;
  v6[3] = &unk_1E6B94CB8;
  v7 = v2;
  v3 = v2;
  PBUIWallpaperEnumerateVariantsForLocations(a1, v6);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void PBUIWallpaperEnumerateVariantsForLocations(char a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  char v5;
  char v6;

  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = 0;
  (*((void (**)(id, _QWORD, char *))v3 + 2))(v3, 0, &v6);
  if ((a1 & 2) != 0 && !v6)
  {
LABEL_6:
    v5 = 0;
    ((void (**)(_QWORD, uint64_t, char *))v4)[2](v4, 1, &v5);
  }
LABEL_7:

}

uint64_t PBUIWallpaperLocationForVariant(uint64_t a1)
{
  if (a1)
    return 2 * (a1 == 1);
  else
    return 1;
}

uint64_t PBUIWallpaperLocationsForString(void *a1)
{
  id v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "containsString:", CFSTR("lock"));
  v3 = objc_msgSend(v1, "containsString:", CFSTR("home"));

  v4 = 3;
  if (!v3)
    v4 = 1;
  v5 = 2;
  if (!v3)
    v5 = 0;
  if (v2)
    return v4;
  else
    return v5;
}

void sub_1B71EB61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_UIUserInterfaceStyleDescription(unint64_t a1)
{
  if (a1 < 3)
    return *(&off_1E6B95990 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1B71ECC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71ED384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71EDF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71EFB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a72;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Unwind_Resume(a1);
}

void sub_1B71F1A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71F1D24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B71F292C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71F2DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B71F30F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_1B71F3150()
{
  JUMPOUT(0x1B71F313CLL);
}

void sub_1B71F3DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPIParallaxLegacyPosterStyleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PhotoImagingLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6B959C8;
    v5 = 0;
    PhotoImagingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoImagingLibraryCore_frameworkLibrary)
    __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PIParallaxLegacyPosterStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_2();
  getPIParallaxLegacyPosterStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL PBUICurrentParallaxDeviceType()
{
  return (unint64_t)(PBUICurrentDeviceWallpaperSizeType() - 3) < 2;
}

__CFString *PBUIStringForPosterWallpaperPairingType(unsigned int a1)
{
  if (a1 < 3)
    return off_1E6B959E0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *PBUIStringForPosterWallpaperMigrationProvider(unsigned int a1)
{
  if (a1 < 3)
    return off_1E6B959F8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *PBUIExtensionIdentifierForPosterWallpaperMigrationProvider(uint64_t a1)
{
  const __CFString *result;
  void *v2;

  if ((_DWORD)a1 == 1)
    return CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider");
  if ((_DWORD)a1 == 2)
    return CFSTR("com.apple.WallpaperKit.CollectionsPoster");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid provider %i"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    PBUIExtensionIdentifierForPosterWallpaperMigrationProvider_cold_1((uint64_t)v2);
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (const __CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

const __CFString *_NSStringFromUIUserInterfaceStyle(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unspecified");
  if (a1 == 2)
    v1 = CFSTR("Dark");
  if (a1 == 1)
    return CFSTR("Light");
  else
    return v1;
}

id soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(uint64_t a1)
{
  void (*v2)(uint64_t, uint64_t);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void (*)(uint64_t, uint64_t))get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr;
  v8 = get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr;
  if (!get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke;
    v4[3] = &unk_1E6B94840;
    v4[4] = &v5;
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (void (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1();
  v2(19, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B71F5C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B71F6DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PBUIWallpaperImageWithFlatColor(void *a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColor *v7;
  CGColor *v8;
  CGColorSpace *ColorSpace;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v11;
  CGContext *v12;
  CGImage *Image;
  void *v14;
  CGRect v16;

  v7 = (CGColor *)objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  v8 = v7;
  if (v7 && (ColorSpace = CGColorGetColorSpace(v7)) != 0)
    DeviceRGB = CGColorSpaceRetain(ColorSpace);
  else
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = DeviceRGB;
  if (DeviceRGB && (v12 = PBUICreateWallpaperImageBitmapContext(DeviceRGB, a2, a3, a4), CGColorSpaceRelease(v11), v12))
  {
    CGContextSetFillColorWithColor(v12, v8);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = a2;
    v16.size.height = a3;
    CGContextFillRect(v12, v16);
    Image = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", Image, 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

CGContext *PBUICreateWallpaperImageBitmapContext(CGColorSpace *a1, double a2, double a3, CGFloat a4)
{
  size_t v7;
  size_t NumberOfComponents;
  _BOOL4 v9;
  size_t v10;
  int v11;
  size_t v12;
  size_t v13;
  uint32_t v14;
  CGContext *v15;

  v7 = (unint64_t)(a2 * a4);
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(a1);
  v9 = CGColorSpaceUsesExtendedRange(a1);
  v10 = v7 + v7 * NumberOfComponents;
  if (NumberOfComponents == 1)
  {
    v10 = v7;
    v11 = 0;
  }
  else
  {
    v11 = 2;
  }
  if (v9)
    v12 = 4 * v7 * NumberOfComponents;
  else
    v12 = v10;
  if (v9)
    v13 = 32;
  else
    v13 = 8;
  if (v9)
    v14 = 8448;
  else
    v14 = v11;
  v15 = CGBitmapContextCreate(0, v7, (unint64_t)(a3 * a4), v13, v12, a1, v14);
  CGContextScaleCTM(v15, a4, a4);
  return v15;
}

CGContext *PBUIWallpaperImageWithGradient(void *a1, double a2, double a3, CGFloat a4)
{
  id v7;
  void *v8;
  id v9;
  CGColorSpace *ColorSpace;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  CGGradient *v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGImage *Image;
  CGPoint v24;
  CGPoint v25;

  v7 = a1;
  objc_msgSend(v7, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v9, "CGColor"));
  DeviceRGB = CGColorSpaceRetain(ColorSpace);

  if (DeviceRGB || (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0)
  {
    v12 = PBUICreateWallpaperImageBitmapContext(DeviceRGB, a2, a3, a4);
    CGColorSpaceRelease(DeviceRGB);
    if (v12)
    {
      v13 = (CGGradient *)objc_msgSend(v7, "copyCGGradient");
      objc_msgSend(v7, "startPoint");
      v14 = a2 * a4;
      v16 = a2 * a4 * v15;
      v17 = a3 * a4;
      v19 = a3 * a4 * v18;
      objc_msgSend(v7, "endPoint");
      v25.x = v14 * v20;
      v25.y = v17 * v21;
      v24.x = v16;
      v24.y = v19;
      CGContextDrawLinearGradient(v12, v13, v24, v25, 0);
      CGGradientRelease(v13);
      Image = CGBitmapContextCreateImage(v12);
      CGContextRelease(v12);
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", Image, 0, a4);
      v12 = (CGContext *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id PBUIWallpaperDataForFileURL(void *a1, _QWORD *a2)
{
  uint64_t MappedDataFromPath;
  void *v4;

  if (a1)
  {
    objc_msgSend(a1, "path");
    MappedDataFromPath = CPBitmapCreateMappedDataFromPath();
    v4 = (void *)MappedDataFromPath;
    if (a2 && !MappedDataFromPath)
      *a2 = objc_retainAutorelease(0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

_QWORD *PBUIWallpaperUIImageForImageData(void *a1, _QWORD *a2)
{
  const __CFData *v3;
  const __CFArray *ImagesFromData;
  const __CFArray *v5;
  CGImage *ValueAtIndex;
  CGImageSource *v7;
  CGImageSource *v8;
  size_t PrimaryImageIndex;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (ImagesFromData)
  {
    v5 = ImagesFromData;
    ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
    CGImageRetain(ValueAtIndex);
    CFRelease(v5);
    if (ValueAtIndex)
      goto LABEL_6;
  }
  v7 = CGImageSourceCreateWithData(v3, 0);
  if (v7)
  {
    v8 = v7;
    if (CGImageSourceGetCount(v7))
    {
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v8);
      ValueAtIndex = CGImageSourceCreateImageAtIndex(v8, PrimaryImageIndex, 0);
      CFRelease(v8);
      if (ValueAtIndex)
      {
LABEL_6:
        a2 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", ValueAtIndex, 0);
        CGImageRelease(ValueAtIndex);
        goto LABEL_10;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  if (a2)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D68];
    v14[0] = CFSTR("Failed to create images from CPBitmapCreateImagesFromData / CGImageSourceCreateWithData");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.error"), 256, v11);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    a2 = 0;
  }
LABEL_10:

  return a2;
}

id soft_PUIIOSurfaceFromCGImage(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  v10 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr)
  {
    v5 = (void *)PosterUIFoundationLibrary();
    v4 = dlsym(v5, "PUIIOSurfaceFromCGImage");
    v8[3] = (uint64_t)v4;
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    soft_PUIIOSurfaceFromCGImage_cold_1();
  ((void (*)(uint64_t, uint64_t))v4)(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B71F988C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1B71FABCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderErrorDomain()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  v6 = getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary();
    v0 = (id *)dlsym(v1, "PUIImageEncoderErrorDomain");
    v4[3] = (uint64_t)v0;
    getPUIImageEncoderErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getPUIImageEncoderErrorDomain_cold_1();
  return *v0;
}

void sub_1B71FAC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterUIFoundationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E6B95B18;
    v3 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
    PosterUIFoundationLibrary_cold_1(&v1);
  return PosterUIFoundationLibraryCore_frameworkLibrary;
}

Class __getPUIImageOnDiskFormatClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIImageOnDiskFormat");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1();
  getPUIImageOnDiskFormatClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_0(uint64_t a1)
{
  void (*v2)(uint64_t, uint64_t);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void (*)(uint64_t, uint64_t))get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0;
  v8 = get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0;
  if (!get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0;
    v4[3] = &unk_1E6B94840;
    v4[4] = &v5;
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0((uint64_t)v4);
    v2 = (void (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1_0();
  v2(19, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B71FCCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B71FD644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return objc_opt_class();
}

uint64_t PBUIWallpaperTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("static")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("procedural")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("video")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("color")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *PBUIStringForWallpaperType(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E6B95CA0[a1];
}

void sub_1B71FFAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72015C0(_Unwind_Exception *a1)
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

uint64_t PosterBoardServicesLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PosterBoardServicesLibraryCore_frameworkLibrary;
  v6 = PosterBoardServicesLibraryCore_frameworkLibrary;
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E6B95F08;
    v8 = *(_OWORD *)&off_1E6B95F18;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PosterBoardServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7201D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterBoardServicesLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = PosterBoardServicesLibraryCore();
  if (!result)
    PosterBoardServicesLibrary_cold_1(&v1);
  return result;
}

id getPRSWallpaperObserverClass()
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
  v0 = (void *)getPRSWallpaperObserverClass_softClass;
  v7 = getPRSWallpaperObserverClass_softClass;
  if (!getPRSWallpaperObserverClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperObserverClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSWallpaperObserverClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7201E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperObserverClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSWallpaperObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSWallpaperObserverClass_block_invoke_cold_1();
  getPRSWallpaperObserverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSWallpaperObserverConfigurationClass()
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
  v0 = (void *)getPRSWallpaperObserverConfigurationClass_softClass;
  v7 = getPRSWallpaperObserverConfigurationClass_softClass;
  if (!getPRSWallpaperObserverConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperObserverConfigurationClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSWallpaperObserverConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7201F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperObserverConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSWallpaperObserverConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSWallpaperObserverConfigurationClass_block_invoke_cold_1();
  getPRSWallpaperObserverConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSWallpaperLocationStateObserverClass()
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
  v0 = (void *)getPRSWallpaperLocationStateObserverClass_softClass;
  v7 = getPRSWallpaperLocationStateObserverClass_softClass;
  if (!getPRSWallpaperLocationStateObserverClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperLocationStateObserverClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSWallpaperLocationStateObserverClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperLocationStateObserverClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSWallpaperLocationStateObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSWallpaperLocationStateObserverClass_block_invoke_cold_1();
  getPRSWallpaperLocationStateObserverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterUpdaterClass()
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
  v0 = (void *)getPRSPosterUpdaterClass_softClass;
  v7 = getPRSPosterUpdaterClass_softClass;
  if (!getPRSPosterUpdaterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterUpdaterClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSPosterUpdaterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B720213C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterUpdaterClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSPosterUpdater");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSPosterUpdaterClass_block_invoke_cold_1();
  getPRSPosterUpdaterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterUpdateClass()
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
  v0 = (void *)getPRSPosterUpdateClass_softClass;
  v7 = getPRSPosterUpdateClass_softClass;
  if (!getPRSPosterUpdateClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterUpdateClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSPosterUpdateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterUpdateClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSPosterUpdate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSPosterUpdateClass_block_invoke_cold_1();
  getPRSPosterUpdateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSServiceClass()
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
  v0 = (void *)getPRSServiceClass_softClass;
  v7 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSServiceClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSServiceClass_block_invoke_cold_1();
  getPRSServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterConfigurationClass()
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
  v0 = (void *)getPRSPosterConfigurationClass_softClass;
  v7 = getPRSPosterConfigurationClass_softClass;
  if (!getPRSPosterConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterConfigurationClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPRSPosterConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardServicesLibrary();
  result = objc_getClass("PRSPosterConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRSPosterConfigurationClass_block_invoke_cold_1();
  getPRSPosterConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterFoundationLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PosterFoundationLibraryCore_frameworkLibrary;
  v6 = PosterFoundationLibraryCore_frameworkLibrary;
  if (!PosterFoundationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E6B95F28;
    v8 = *(_OWORD *)&off_1E6B95F38;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PosterFoundationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B720257C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterFoundationLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = PosterFoundationLibraryCore();
  if (!result)
    PosterFoundationLibrary_cold_1(&v1);
  return result;
}

void *getPFFileProtectionNoneAttributesSymbolLoc()
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
  v0 = (void *)getPFFileProtectionNoneAttributesSymbolLoc_ptr;
  v6 = getPFFileProtectionNoneAttributesSymbolLoc_ptr;
  if (!getPFFileProtectionNoneAttributesSymbolLoc_ptr)
  {
    v1 = (void *)PosterFoundationLibrary();
    v0 = dlsym(v1, "PFFileProtectionNoneAttributes");
    v4[3] = (uint64_t)v0;
    getPFFileProtectionNoneAttributesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B720265C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PFFileProtectionNoneAttributes()
{
  uint64_t (*PFFileProtectionNoneAttributesSymbolLoc)(void);

  PFFileProtectionNoneAttributesSymbolLoc = (uint64_t (*)(void))getPFFileProtectionNoneAttributesSymbolLoc();
  if (!PFFileProtectionNoneAttributesSymbolLoc)
    soft_PFFileProtectionNoneAttributes_cold_1();
  return PFFileProtectionNoneAttributesSymbolLoc();
}

void *getPF_IS_PAD_DEVICESymbolLoc()
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
  v0 = (void *)getPF_IS_PAD_DEVICESymbolLoc_ptr;
  v6 = getPF_IS_PAD_DEVICESymbolLoc_ptr;
  if (!getPF_IS_PAD_DEVICESymbolLoc_ptr)
  {
    v1 = (void *)PosterFoundationLibrary();
    v0 = dlsym(v1, "PF_IS_PAD_DEVICE");
    v4[3] = (uint64_t)v0;
    getPF_IS_PAD_DEVICESymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7202708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PF_IS_PAD_DEVICE()
{
  uint64_t (*PF_IS_PAD_DEVICESymbolLoc)(void);

  PF_IS_PAD_DEVICESymbolLoc = (uint64_t (*)(void))getPF_IS_PAD_DEVICESymbolLoc();
  if (!PF_IS_PAD_DEVICESymbolLoc)
    soft_PF_IS_PAD_DEVICE_cold_1();
  return PF_IS_PAD_DEVICESymbolLoc();
}

id getPFPosterExtensionInstanceClass()
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
  v0 = (void *)getPFPosterExtensionInstanceClass_softClass;
  v7 = getPFPosterExtensionInstanceClass_softClass;
  if (!getPFPosterExtensionInstanceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPFPosterExtensionInstanceClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPFPosterExtensionInstanceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B72027DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFPosterExtensionInstanceClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterFoundationLibrary();
  result = objc_getClass("PFPosterExtensionInstance");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPFPosterExtensionInstanceClass_block_invoke_cold_1();
  getPFPosterExtensionInstanceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PosterUIFoundationLibraryCore_frameworkLibrary_0;
  v6 = PosterUIFoundationLibraryCore_frameworkLibrary_0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0)
  {
    v7 = xmmword_1E6B95F48;
    v8 = *(_OWORD *)&off_1E6B95F58;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PosterUIFoundationLibraryCore_frameworkLibrary_0 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B72028F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterUIFoundationLibrary_0()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = PosterUIFoundationLibraryCore();
  if (!result)
    PosterUIFoundationLibrary_cold_1_0(&v1);
  return result;
}

id getPUIColorBoxesClass()
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
  v0 = (void *)getPUIColorBoxesClass_softClass;
  v7 = getPUIColorBoxesClass_softClass;
  if (!getPUIColorBoxesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIColorBoxesClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIColorBoxesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIColorBoxesClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIColorBoxes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIColorBoxesClass_block_invoke_cold_1();
  getPUIColorBoxesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIColorStatisticsClass()
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
  v0 = (void *)getPUIColorStatisticsClass_softClass;
  v7 = getPUIColorStatisticsClass_softClass;
  if (!getPUIColorStatisticsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIColorStatisticsClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIColorStatisticsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIColorStatisticsClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIColorStatistics");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIColorStatisticsClass_block_invoke_cold_1();
  getPUIColorStatisticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIDiscreteGradientVariatedCustomStyleClass()
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
  v0 = (void *)getPUIDiscreteGradientVariatedCustomStyleClass_softClass;
  v7 = getPUIDiscreteGradientVariatedCustomStyleClass_softClass;
  if (!getPUIDiscreteGradientVariatedCustomStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIDiscreteGradientVariatedCustomStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke_cold_1();
  getPUIDiscreteGradientVariatedCustomStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIImageEncoderClass()
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
  v0 = (void *)getPUIImageEncoderClass_softClass;
  v7 = getPUIImageEncoderClass_softClass;
  if (!getPUIImageEncoderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIImageEncoderClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIImageEncoderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIImageEncoderClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIImageEncoder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIImageEncoderClass_block_invoke_cold_1();
  getPUIImageEncoderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIImageOnDiskFormatClass()
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
  v0 = (void *)getPUIImageOnDiskFormatClass_softClass_0;
  v7 = getPUIImageOnDiskFormatClass_softClass_0;
  if (!getPUIImageOnDiskFormatClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIImageOnDiskFormatClass_block_invoke_0;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIImageOnDiskFormatClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIImageOnDiskFormatClass_block_invoke_0(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIImageOnDiskFormat");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1_0();
  getPUIImageOnDiskFormatClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIMappedImageCacheManagerClass()
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
  v0 = (void *)getPUIMappedImageCacheManagerClass_softClass;
  v7 = getPUIMappedImageCacheManagerClass_softClass;
  if (!getPUIMappedImageCacheManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIMappedImageCacheManagerClass_block_invoke;
    v3[3] = &unk_1E6B94840;
    v3[4] = &v4;
    __getPUIMappedImageCacheManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7202F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMappedImageCacheManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary_0();
  result = objc_getClass("PUIMappedImageCacheManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIMappedImageCacheManagerClass_block_invoke_cold_1();
  getPUIMappedImageCacheManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getPUIImageEncoderErrorDomainSymbolLoc()
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
  v0 = (void *)getPUIImageEncoderErrorDomainSymbolLoc_ptr_0;
  v6 = getPUIImageEncoderErrorDomainSymbolLoc_ptr_0;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr_0)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIImageEncoderErrorDomain");
    v4[3] = (uint64_t)v0;
    getPUIImageEncoderErrorDomainSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderErrorDomain_0()
{
  id *PUIImageEncoderErrorDomainSymbolLoc;

  PUIImageEncoderErrorDomainSymbolLoc = (id *)getPUIImageEncoderErrorDomainSymbolLoc();
  if (!PUIImageEncoderErrorDomainSymbolLoc)
    getPUIImageEncoderErrorDomain_cold_1_0();
  return *PUIImageEncoderErrorDomainSymbolLoc;
}

void *getPUISceneRoleRenderingSymbolLoc()
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
  v0 = (void *)getPUISceneRoleRenderingSymbolLoc_ptr;
  v6 = getPUISceneRoleRenderingSymbolLoc_ptr;
  if (!getPUISceneRoleRenderingSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUISceneRoleRendering");
    v4[3] = (uint64_t)v0;
    getPUISceneRoleRenderingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B72030D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getPUISceneRoleRendering()
{
  id *PUISceneRoleRenderingSymbolLoc;

  PUISceneRoleRenderingSymbolLoc = (id *)getPUISceneRoleRenderingSymbolLoc();
  if (!PUISceneRoleRenderingSymbolLoc)
    getPUISceneRoleRendering_cold_1();
  return *PUISceneRoleRenderingSymbolLoc;
}

void *getPUIPosterSignificantEventOptionsContainsEventSymbolLoc()
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
  v0 = (void *)getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr;
  v6 = getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr;
  if (!getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIPosterSignificantEventOptionsContainsEvent");
    v4[3] = (uint64_t)v0;
    getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIPosterSignificantEventOptionsContainsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t (*PUIPosterSignificantEventOptionsContainsEventSymbolLoc)(uint64_t, uint64_t);

  PUIPosterSignificantEventOptionsContainsEventSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIPosterSignificantEventOptionsContainsEventSymbolLoc();
  if (!PUIPosterSignificantEventOptionsContainsEventSymbolLoc)
    soft_PUIPosterSignificantEventOptionsContainsEvent_cold_1();
  return PUIPosterSignificantEventOptionsContainsEventSymbolLoc(a1, a2);
}

void *getPUIIOSurfaceFromCGImageSymbolLoc()
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
  v0 = (void *)getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0;
  v6 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIIOSurfaceFromCGImage");
    v4[3] = (uint64_t)v0;
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIIOSurfaceFromCGImage_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*PUIIOSurfaceFromCGImageSymbolLoc)(uint64_t, uint64_t);

  PUIIOSurfaceFromCGImageSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIIOSurfaceFromCGImageSymbolLoc();
  if (!PUIIOSurfaceFromCGImageSymbolLoc)
    soft_PUIIOSurfaceFromCGImage_cold_1_0();
  return PUIIOSurfaceFromCGImageSymbolLoc(a1, a2);
}

void *getPUIFeatureEnabledSymbolLoc()
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
  v0 = (void *)getPUIFeatureEnabledSymbolLoc_ptr;
  v6 = getPUIFeatureEnabledSymbolLoc_ptr;
  if (!getPUIFeatureEnabledSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIFeatureEnabled");
    v4[3] = (uint64_t)v0;
    getPUIFeatureEnabledSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIFeatureEnabled(uint64_t a1)
{
  uint64_t (*PUIFeatureEnabledSymbolLoc)(uint64_t);

  PUIFeatureEnabledSymbolLoc = (uint64_t (*)(uint64_t))getPUIFeatureEnabledSymbolLoc();
  if (!PUIFeatureEnabledSymbolLoc)
    soft_PUIFeatureEnabled_cold_1();
  return PUIFeatureEnabledSymbolLoc(a1);
}

void *getPUIDynamicRotationIsActiveSymbolLoc()
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
  v0 = (void *)getPUIDynamicRotationIsActiveSymbolLoc_ptr;
  v6 = getPUIDynamicRotationIsActiveSymbolLoc_ptr;
  if (!getPUIDynamicRotationIsActiveSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIDynamicRotationIsActive");
    v4[3] = (uint64_t)v0;
    getPUIDynamicRotationIsActiveSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B72033D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIDynamicRotationIsActive()
{
  uint64_t (*PUIDynamicRotationIsActiveSymbolLoc)(void);

  PUIDynamicRotationIsActiveSymbolLoc = (uint64_t (*)(void))getPUIDynamicRotationIsActiveSymbolLoc();
  if (!PUIDynamicRotationIsActiveSymbolLoc)
    soft_PUIDynamicRotationIsActive_cold_1();
  return PUIDynamicRotationIsActiveSymbolLoc();
}

void *getPUICalculateContrastFromColorBoxesSymbolLoc()
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
  v0 = (void *)getPUICalculateContrastFromColorBoxesSymbolLoc_ptr;
  v6 = getPUICalculateContrastFromColorBoxesSymbolLoc_ptr;
  if (!getPUICalculateContrastFromColorBoxesSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUICalculateContrastFromColorBoxes");
    v4[3] = (uint64_t)v0;
    getPUICalculateContrastFromColorBoxesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B720347C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

double soft_PUICalculateContrastFromColorBoxes(void *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  id v13;
  double (*PUICalculateContrastFromColorBoxesSymbolLoc)(id, uint64_t, uint64_t, double, double, double, double);
  double v15;

  v13 = a1;
  PUICalculateContrastFromColorBoxesSymbolLoc = (double (*)(id, uint64_t, uint64_t, double, double, double, double))getPUICalculateContrastFromColorBoxesSymbolLoc();
  if (!PUICalculateContrastFromColorBoxesSymbolLoc)
    soft_PUICalculateContrastFromColorBoxes_cold_1();
  v15 = PUICalculateContrastFromColorBoxesSymbolLoc(v13, a2, a3, a4, a5, a6, a7);

  return v15;
}

void *getPUIIOSurfaceUpdatePurgableSymbolLoc()
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
  v0 = (void *)getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr;
  v6 = getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr;
  if (!getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIIOSurfaceUpdatePurgable");
    v4[3] = (uint64_t)v0;
    getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIIOSurfaceUpdatePurgable(uint64_t a1, uint64_t a2)
{
  uint64_t (*PUIIOSurfaceUpdatePurgableSymbolLoc)(uint64_t, uint64_t);

  PUIIOSurfaceUpdatePurgableSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIIOSurfaceUpdatePurgableSymbolLoc();
  if (!PUIIOSurfaceUpdatePurgableSymbolLoc)
    soft_PUIIOSurfaceUpdatePurgable_cold_1();
  return PUIIOSurfaceUpdatePurgableSymbolLoc(a1, a2);
}

void *getPUIAverageColorFromColorBoxesSymbolLoc()
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
  v0 = (void *)getPUIAverageColorFromColorBoxesSymbolLoc_ptr;
  v6 = getPUIAverageColorFromColorBoxesSymbolLoc_ptr;
  if (!getPUIAverageColorFromColorBoxesSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIAverageColorFromColorBoxes");
    v4[3] = (uint64_t)v0;
    getPUIAverageColorFromColorBoxesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id soft_PUIAverageColorFromColorBoxes(void *a1, double a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void (*PUIAverageColorFromColorBoxesSymbolLoc)(id, double, double, double, double, double);
  void *v13;

  v11 = a1;
  PUIAverageColorFromColorBoxesSymbolLoc = (void (*)(id, double, double, double, double, double))getPUIAverageColorFromColorBoxesSymbolLoc();
  if (!PUIAverageColorFromColorBoxesSymbolLoc)
    soft_PUIAverageColorFromColorBoxes_cold_1();
  PUIAverageColorFromColorBoxesSymbolLoc(v11, a2, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void *getPUICreateIOSurfaceForImageSymbolLoc()
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
  v0 = (void *)getPUICreateIOSurfaceForImageSymbolLoc_ptr;
  v6 = getPUICreateIOSurfaceForImageSymbolLoc_ptr;
  if (!getPUICreateIOSurfaceForImageSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUICreateIOSurfaceForImage");
    v4[3] = (uint64_t)v0;
    getPUICreateIOSurfaceForImageSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id soft_PUICreateIOSurfaceForImage(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void (*PUICreateIOSurfaceForImageSymbolLoc)(id, uint64_t, uint64_t);
  void *v7;

  v5 = a1;
  PUICreateIOSurfaceForImageSymbolLoc = (void (*)(id, uint64_t, uint64_t))getPUICreateIOSurfaceForImageSymbolLoc();
  if (!PUICreateIOSurfaceForImageSymbolLoc)
    soft_PUICreateIOSurfaceForImage_cold_1();
  PUICreateIOSurfaceForImageSymbolLoc(v5, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void *getPUIMaterialsIsLowQualityDeviceSymbolLoc()
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
  v0 = (void *)getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr;
  v6 = getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr;
  if (!getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIMaterialsIsLowQualityDevice");
    v4[3] = (uint64_t)v0;
    getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIMaterialsIsLowQualityDevice()
{
  uint64_t (*PUIMaterialsIsLowQualityDeviceSymbolLoc)(void);

  PUIMaterialsIsLowQualityDeviceSymbolLoc = (uint64_t (*)(void))getPUIMaterialsIsLowQualityDeviceSymbolLoc();
  if (!PUIMaterialsIsLowQualityDeviceSymbolLoc)
    soft_PUIMaterialsIsLowQualityDevice_cold_1();
  return PUIMaterialsIsLowQualityDeviceSymbolLoc();
}

void *getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc()
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
  v0 = (void *)getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr;
  v6 = getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIHomeScreenLegibilityMaterialRecipeBundle");
    v4[3] = (uint64_t)v0;
    getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIHomeScreenLegibilityMaterialRecipeBundle()
{
  uint64_t (*PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc)(void);

  PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc = (uint64_t (*)(void))getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc();
  if (!PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc)
    soft_PUIHomeScreenLegibilityMaterialRecipeBundle_cold_1();
  return PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc();
}

void *getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc()
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
  v0 = (void *)getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr;
  v6 = getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting");
    v4[3] = (uint64_t)v0;
    getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B72039C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting()
{
  uint64_t (*PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc)(void);

  PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc = (uint64_t (*)(void))getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc();
  if (!PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc)
    soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting_cold_1();
  return PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc();
}

void *getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc()
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
  v0 = (void *)getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr;
  v6 = getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v0 = dlsym(v1, "PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment");
    v4[3] = (uint64_t)v0;
    getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B7203A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment(double a1)
{
  uint64_t (*PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc)(double);

  PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc = (uint64_t (*)(double))getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc();
  if (!PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc)
    soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_cold_1();
  return PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc(a1);
}

char *OUTLINED_FUNCTION_0_5()
{
  return dlerror();
}

void __copy_assignment_8_8_t0w24_s24_s32(uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  objc_storeStrong((id *)(a1 + 24), *((id *)a2 + 3));
  objc_storeStrong((id *)(a1 + 32), *((id *)a2 + 4));
}

void sub_1B7204FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1BCCA5978](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

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
    v4 = xmmword_1E6B95FD8;
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

BOOL PBUIPosterPresentationModeRequiresPosterContent(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t _PRNeedsWallpaperCaptureView()
{
  if (_PRNeedsWallpaperCaptureView_onceToken != -1)
    dispatch_once(&_PRNeedsWallpaperCaptureView_onceToken, &__block_literal_global_15);
  return _PRNeedsWallpaperCaptureView_needsWallpaperCaptureView;
}

void sub_1B7205D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72065A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1B7206794(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B7207E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7207EDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getMTMaterialViewClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_2)
  {
    v4 = xmmword_1E6B96180;
    v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary_2)
    __getMTMaterialViewClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("MTMaterialView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTMaterialViewClass_block_invoke_cold_2_0();
  getMTMaterialViewClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PBUIMagicWallpaperDictionary(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a2;
  v11 = a1;
  objc_msgSend(v9, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("kSBUIMagicWallpaperIdentifierKey"));

  objc_msgSend(v10, "bundlePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("kSBUIMagicWallpaperBundlePathKey"));
  if (v8)
  {
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
    objc_msgSend(v8, "objectForKey:", CFSTR("thumbnailImageName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;

      v7 = v16;
    }

  }
  if (v7)
    objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("kSBUIMagicWallpaperThumbnailNameKey"));

  return v12;
}

id PBUIMagicWallpaperDictionariesForClass(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 && v3)
  {
    objc_msgSend(a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "thumbnailImageName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(a1, "presetWallpaperOptions"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = v7;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            PBUIMagicWallpaperDictionary(v5, v3, v6, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
    }
    else
    {
      PBUIMagicWallpaperDictionary(v5, v3, v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);
    }

  }
  return v4;
}

id PBUIMagicWallpaperOptionsDictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(a1, "objectForKey:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    v7 = v4;
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  if (!v4)
  {
    v7 = v3;
    goto LABEL_6;
  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "addEntriesFromDictionary:", v3);
LABEL_7:

  return v6;
}

id PBUIGetProceduralWallpaper(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = a2;
  v12 = a1;
  objc_msgSend(v12, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)PBUIMagicWallpaperClassForIdentifier(v13)), "initWithFrame:", a3, a4, a5, a6);
  PBUIMagicWallpaperOptionsDictionary(v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setWallpaperOptions:", v15);

  return v14;
}

id PBUIMagicWallpaperClassForIdentifier(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _PBUIMagicWallpaperEnsure___once;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
  objc_msgSend((id)__identifierClassMap, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PBUIMagicWallpaperThumbnail(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PBUIMagicWallpaperClassForIdentifier(v2);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "thumbnailImageForOptions:", v1), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", CFSTR("kSBUIMagicWallpaperBundlePathKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("kSBUIMagicWallpaperThumbnailNameKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = 0;
    if (v8 && v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_deviceSpecificImageNamed:inBundle:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("largeThumbJPEGPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (!v11 && v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    v5 = v11;

  }
  return v5;
}

id PBUIMagicWallpaperRepresentativeThumbnailForClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PBUIMagicWallpaperClassForIdentifier(v2);
  objc_msgSend(v1, "objectForKey:", CFSTR("kSBUIMagicWallpaperBundlePathKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "representativeThumbnailImageName");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
    if (v5 && v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_deviceSpecificImageNamed:inBundle:", v6, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v8;
}

void _PBUIMagicWallpaperEnsure()
{
  if (_PBUIMagicWallpaperEnsure___once != -1)
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
}

id PBUIMagicWallpaperEnumeration()
{
  if (_PBUIMagicWallpaperEnsure___once != -1)
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
  return (id)__wallpaperEnumeration;
}

id BundlePathForWallpaperIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = PBUIMagicWallpaperClassForIdentifier(a1);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundlePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1B720B2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1B720BD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B720FC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose((const void *)(v41 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B7210534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PBUIStringForWallpaperMode(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E6B96418[a1];
}

uint64_t PBUIWallpaperModeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("light")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("dark")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("inactive")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1B7214C80(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s24_s32(uint64_t a1)
{

}

id __copy_helper_block_e8_40n17_8_8_t0w24_s24_s32(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  id result;

  v4 = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 64) = *(id *)(a2 + 64);
  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

void __destroy_helper_block_e8_40n9_8_s24_s32(uint64_t a1)
{

}

void sub_1B7214FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  uint64_t v25;

  __destructor_8_s24_s32(v25);
  _Unwind_Resume(a1);
}

void sub_1B7215224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{

  _Unwind_Resume(a1);
}

void sub_1B721534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{

  _Unwind_Resume(a1);
}

void sub_1B721567C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{

  _Unwind_Resume(a1);
}

void sub_1B7215818(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void sub_1B7215910(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void sub_1B72185D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

__CFString *PBUIWallpaperWindowSceneSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 727229969) > 0x10)
    return 0;
  else
    return off_1E6B964B0[a1 - 727229969];
}

id PBUIWallpaperWindowSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CGRect v8;

  v3 = a2;
  v4 = v3;
  if (a1 == 727229970)
  {
    objc_msgSend(v3, "CGRectValue");
    NSStringFromCGRect(v8);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a1 != 727229969)
    {
      v6 = 0;
      goto LABEL_7;
    }
    PBUIStringForWallpaperVariant(objc_msgSend(v3, "integerValue"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

uint64_t PBUIWallpaperVariantForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("home")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("lock")) - 1;

  return v2;
}

void sub_1B7220A1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B7220B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7221274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7222900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7223BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_12_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "variant");
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;

  return v0;
}

void sub_1B7224B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B722550C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B7225D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

int64x2_t PBUIWallpaperBackdropParametersMakeIdentity@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int64x2_t result;

  v1 = *MEMORY[0x1E0CEBF20];
  *(_QWORD *)a1 = -2;
  *(_QWORD *)(a1 + 8) = v1;
  *(_QWORD *)(a1 + 16) = 0;
  result = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(a1 + 24) = result;
  *(int64x2_t *)(a1 + 40) = result;
  *(_QWORD *)(a1 + 56) = 0;
  return result;
}

id PBUIBackdropInputSettingsForWallpaperBackdropParameters(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(a1 + 56))
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:graphicsQuality:", *(_QWORD *)a1, 100);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setStackingLevel:", *(_QWORD *)(a1 + 8));
    objc_msgSend(v1, "setRenderingHint:", *(_QWORD *)(a1 + 16));
    if (*(double *)(a1 + 24) != 1.79769313e308)
      objc_msgSend(v1, "setBlurRadius:");
    if (*(double *)(a1 + 32) != 1.79769313e308)
      objc_msgSend(v1, "setSaturationDeltaFactor:");
    if (*(double *)(a1 + 40) != 1.79769313e308)
      objc_msgSend(v1, "setGrayscaleTintLevel:");
    if (*(double *)(a1 + 48) != 1.79769313e308)
      objc_msgSend(v1, "setGrayscaleTintAlpha:");
  }
  return v1;
}

id PBUIBackdropOutputSettingsForWallpaperBackdropParameters(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = a1[1];
  v9 = *a1;
  v10 = v2;
  v3 = a1[3];
  v11 = a1[2];
  v12 = v3;
  PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[1];
  v9 = *a1;
  v10 = v5;
  v6 = a1[3];
  v11 = a1[2];
  v12 = v6;
  PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "computeOutputSettingsUsingModel:", v4);

  return v7;
}

const __CFString *PBUIStringForWallpaperMaterialStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("nil");
  else
    return off_1E6B96928[a1 - 1];
}

id PBUIStringForWallpaperBackdropParameters(double *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backdrop style: %li"), *(_QWORD *)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stacking level: %li"), *((_QWORD *)a1 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rendering hint: %li"), *((_QWORD *)a1 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  if (a1[3] != 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blur radius: %f"), *((_QWORD *)a1 + 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  if (a1[4] != 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("saturation delta factor: %f"), *((_QWORD *)a1 + 4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  if (a1[5] != 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("grayscale tint level: %f"), *((_QWORD *)a1 + 5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v8);

  }
  if (a1[6] != 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("grayscale tint alpha: %f"), *((_QWORD *)a1 + 6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v9);

  }
  v10 = *((_QWORD *)a1 + 7) - 1;
  if (v10 <= 2)
    objc_msgSend(v2, "addObject:", off_1E6B96940[v10]);
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id PBUIWallpaperTreatmentBundle()
{
  if (PBUIWallpaperTreatmentBundle___onceToken != -1)
    dispatch_once(&PBUIWallpaperTreatmentBundle___onceToken, &__block_literal_global_21);
  return (id)PBUIWallpaperTreatmentBundle___paperBoardUIBundle;
}

BOOL _PBUIPosterViewControllerUpdateReasonsNecessitateFencedUpdate(char a1)
{
  return (a1 & 0x61) != 0;
}

void sub_1B722773C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t PBUICurrentDeviceWallpaperSizeType()
{
  void *v0;
  void *v1;
  double Height;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
    Height = CGRectGetHeight(v12);

    if (Height > 1194.0)
      return 4;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
    return 3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v8 = CGRectGetHeight(v13);

    if (v8 > 667.0)
      return 2;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom"))
  {

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_referenceBounds");
    v3 = CGRectGetHeight(v14) > 568.0;

  }
  return v3;
}

BOOL _WallpaperStyleHasDarkBlur(uint64_t a1)
{
  return _WallpaperStyleByRemovingTintFromStyle(a1) == 8;
}

uint64_t _WallpaperStyleByRemovingTintFromStyle(uint64_t result)
{
  uint64_t v1;

  v1 = result - 9;
  if ((unint64_t)(result - 9) <= 0x12 && ((0x6DF4Fu >> v1) & 1) != 0)
    return qword_1B723FE08[v1];
  return result;
}

id PBUIStringForStyleTransitionState(unint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  PBUIWallpaperStyleDescription(*a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIWallpaperStyleDescription(a1[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ -> %@ (%.02f)"), v3, v4, a1[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *PBUIWallpaperWindowSceneClientSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1207217227) > 0x11)
    return 0;
  else
    return off_1E6B97010[a1 - 1207217227];
}

id PBUIWallpaperWindowSceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a1 != 1207217244)
    return 0;
  PBUIIrisWallpaperPlaybackStateDescription(objc_msgSend(a2, "integerValue", v2, v3));
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B722F624(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B722F908(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __getISAssetClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISAssetClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 17, CFSTR("Unable to find class %s"), "ISAsset");

  __break(1u);
}

void PhotosPlayerLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosPlayerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUILivePhotoPlayerView.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getISPlayerItemClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISPlayerItemClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 22, CFSTR("Unable to find class %s"), "ISPlayerItem");

  __break(1u);
}

void __getISLiveWallpaperPlayerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISLiveWallpaperPlayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 20, CFSTR("Unable to find class %s"), "ISLiveWallpaperPlayer");

  __break(1u);
}

void __getISLivePhotoPlayerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISLivePhotoPlayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 18, CFSTR("Unable to find class %s"), "ISLivePhotoPlayer");

  __break(1u);
}

void __getISLiveWallpaperUIViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISLiveWallpaperUIViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 21, CFSTR("Unable to find class %s"), "ISLiveWallpaperUIView");

  __break(1u);
}

void __getISLivePhotoUIViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getISLivePhotoUIViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUILivePhotoPlayerView.m"), 19, CFSTR("Unable to find class %s"), "ISLivePhotoUIView");

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MaterialKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIPosterEffectView.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTMaterialViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterEffectView.m"), 20, CFSTR("Unable to find class %s"), "MTMaterialView");

  __break(1u);
}

void __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotoImagingLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIWallpaperInactiveTreatment.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPIParallaxLegacyPosterStyleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIWallpaperInactiveTreatment.m"), 18, CFSTR("Unable to find class %s"), "PIParallaxLegacyPosterStyle");

  __break(1u);
}

void PBUIExtensionIdentifierForPosterWallpaperMigrationProvider_cold_1(uint64_t a1)
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

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull PBUIExtensionIdentifierForPosterWallpaperMigrationProvider(PBUIPosterWallpaperMigrationProvider)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("PBUIPosterWallpaperMigrationInfo.m");
  v7 = 1024;
  v8 = 43;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1B71C0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

void soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(MTMaterialRecipe, UIUserInterfaceStyle)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIWallpaperEffectCompositor.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

void soft_PUIIOSurfaceFromCGImage_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPUIImageEncoderErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 38, CFSTR("%s"), dlerror());

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterUIFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUICodableImage.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIImageOnDiskFormatClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 37, CFSTR("Unable to find class %s"), "PUIImageOnDiskFormat");

  __break(1u);
}

void soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(MTMaterialRecipe, UIUserInterfaceStyle)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIWallpaperView.m"), 46, CFSTR("%s"), dlerror());

  __break(1u);
}

void PosterBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIPosterBridge.m"), 11, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRSWallpaperObserverClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSWallpaperObserverClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 12, CFSTR("Unable to find class %s"), "PRSWallpaperObserver");

  __break(1u);
}

void __getPRSWallpaperObserverConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSWallpaperObserverConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 13, CFSTR("Unable to find class %s"), "PRSWallpaperObserverConfiguration");

  __break(1u);
}

void __getPRSWallpaperLocationStateObserverClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSWallpaperLocationStateObserverClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 14, CFSTR("Unable to find class %s"), "PRSWallpaperLocationStateObserver");

  __break(1u);
}

void __getPRSPosterUpdaterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSPosterUpdaterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 15, CFSTR("Unable to find class %s"), "PRSPosterUpdater");

  __break(1u);
}

void __getPRSPosterUpdateClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSPosterUpdateClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 16, CFSTR("Unable to find class %s"), "PRSPosterUpdate");

  __break(1u);
}

void __getPRSServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 17, CFSTR("Unable to find class %s"), "PRSService");

  __break(1u);
}

void __getPRSPosterConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRSPosterConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 18, CFSTR("Unable to find class %s"), "PRSPosterConfiguration");

  __break(1u);
}

void PosterFoundationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIPosterBridge.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_PFFileProtectionNoneAttributes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *soft_PFFileProtectionNoneAttributes(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PF_IS_PAD_DEVICE_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PF_IS_PAD_DEVICE(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void __getPFPosterExtensionInstanceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPFPosterExtensionInstanceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 23, CFSTR("Unable to find class %s"), "PFPosterExtensionInstance");

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterUIFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIPosterBridge.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPUIColorBoxesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIColorBoxesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 26, CFSTR("Unable to find class %s"), "PUIColorBoxes");

  __break(1u);
}

void __getPUIColorStatisticsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIColorStatisticsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 27, CFSTR("Unable to find class %s"), "PUIColorStatistics");

  __break(1u);
}

void __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIDiscreteGradientVariatedCustomStyleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 28, CFSTR("Unable to find class %s"), "PUIDiscreteGradientVariatedCustomStyle");

  __break(1u);
}

void __getPUIImageEncoderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIImageEncoderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 29, CFSTR("Unable to find class %s"), "PUIImageEncoder");

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIImageOnDiskFormatClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 30, CFSTR("Unable to find class %s"), "PUIImageOnDiskFormat");

  __break(1u);
}

void __getPUIMappedImageCacheManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIMappedImageCacheManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterBridge.m"), 31, CFSTR("Unable to find class %s"), "PUIMappedImageCacheManager");

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (PUIImageEncoderErrorDomain) (*)(void))0)()) getPUIImageEncoderErrorDomain(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void getPUISceneRoleRendering_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (PUISceneRoleRendering) (*)(void))0)()) getPUISceneRoleRendering(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 33, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIPosterSignificantEventOptionsContainsEvent_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PUIPosterSignificantEventOptionsContainsEvent(PUIPosterSignificantEventOptions, PUIPosterSignificantEvent)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIIOSurfaceFromCGImage_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIFeatureEnabled_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PUIFeatureEnabled(PUIFeature)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIDynamicRotationIsActive_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PUIDynamicRotationIsActive(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUICalculateContrastFromColorBoxes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat soft_PUICalculateContrastFromColorBoxes(PUIColorBoxes *__strong, CGRect, CGFloat *, CGFloat *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIIOSurfaceUpdatePurgable_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurfaceRef soft_PUIIOSurfaceUpdatePurgable(IOSurfaceRef, BOOL)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIAverageColorFromColorBoxes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIColor *soft_PUIAverageColorFromColorBoxes(PUIColorBoxes *__strong, CGRect, CGFloat)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUICreateIOSurfaceForImage_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *soft_PUICreateIOSurfaceForImage(UIImage *__strong, CGImageBlockSetRef *, BOOL)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIMaterialsIsLowQualityDevice_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PUIMaterialsIsLowQualityDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialRecipeBundle_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSBundle *soft_PUIHomeScreenLegibilityMaterialRecipeBundle(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment(CGFloat)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("PBUIPosterBridge.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

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
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIMaterialTreatment.m"), 18, CFSTR("%s"), *a1);

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
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIMaterialTreatment.m"), 19, CFSTR("Unable to find class %s"), "MTMaterialLayer");

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MaterialKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIPosterHomeViewController.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTMaterialViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUIPosterHomeViewController.m"), 38, CFSTR("Unable to find class %s"), "MTMaterialView");

  __break(1u);
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011B0]();
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

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D01248]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1E0D01270]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1E0D014E8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01538]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1E0D01598]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return MEMORY[0x1E0D015C8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSStringFromCGRect()
{
  return MEMORY[0x1E0D01608]();
}

uint64_t BSStringFromCGSize()
{
  return MEMORY[0x1E0D01610]();
}

uint64_t BSSystemSharedResourcesDirectoryForIdentifier()
{
  return MEMORY[0x1E0D01630]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
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

uint64_t CAMLEncodeLayerTreeToPathWithOptions()
{
  return MEMORY[0x1E0CD2510]();
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
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

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x1E0C98708](fileSec, mode);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
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

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

uint64_t CGImageBlockSetRetain()
{
  return MEMORY[0x1E0C9CB70]();
}

uint64_t CGImageCopyJPEGData()
{
  return MEMORY[0x1E0CBC288]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1E0CBC290]();
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

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x1E0CBC370]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1E0C9CC68]();
}

uint64_t CGImageGetImageSource()
{
  return MEMORY[0x1E0CBC378]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F8](isrc);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CEA040](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1E0CFA1C8]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1E0CFA1D8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1E0D39FD0]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1E0D3A078]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1E0CEA100](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0CEB718]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0CEBA90]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1E0CEBC08]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _EXIFOrientationForUIImageOrientation()
{
  return MEMORY[0x1E0CEBE60]();
}

uint64_t _UIImageGetCGImageRepresentation()
{
  return MEMORY[0x1E0CEBFF8]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1E0CEC160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

