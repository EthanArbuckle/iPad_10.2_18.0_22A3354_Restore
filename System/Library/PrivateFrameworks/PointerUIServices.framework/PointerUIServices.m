void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __encodePathElementIntoData(void *a1, int *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t i;
  float v8;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  int v13;

  v3 = a1;
  v13 = *a2;
  objc_msgSend(v3, "appendBytes:length:", &v13, 4);
  v4 = *a2;
  if (v4 > 3)
    v5 = 0;
  else
    v5 = dword_18EB08DA0[v4];
  v12 = v5;
  objc_msgSend(v3, "appendBytes:length:", &v12, 4);
  if (v12)
  {
    v6 = 0;
    for (i = 0; i < v12; ++i)
    {
      v8 = *(double *)(*((_QWORD *)a2 + 1) + v6);
      v11 = v8;
      objc_msgSend(v3, "appendBytes:length:", &v11, 4);
      v9 = *(double *)(*((_QWORD *)a2 + 1) + v6 + 8);
      v10 = v9;
      objc_msgSend(v3, "appendBytes:length:", &v10, 4);
      v6 += 16;
    }
  }

}

id PSLogCommon()
{
  if (PSLogCommon_onceToken != -1)
    dispatch_once(&PSLogCommon_onceToken, &__block_literal_global);
  return (id)PSLogCommon___logObj;
}

id PSLogAutohide()
{
  if (PSLogAutohide_onceToken != -1)
    dispatch_once(&PSLogAutohide_onceToken, &__block_literal_global_3);
  return (id)PSLogAutohide___logObj;
}

id PSLogMaterial()
{
  if (PSLogMaterial_onceToken != -1)
    dispatch_once(&PSLogMaterial_onceToken, &__block_literal_global_5);
  return (id)PSLogMaterial___logObj;
}

id PSLogTransform()
{
  if (PSLogTransform_onceToken != -1)
    dispatch_once(&PSLogTransform_onceToken, &__block_literal_global_7);
  return (id)PSLogTransform___logObj;
}

id PSLogClipping()
{
  if (PSLogClipping_onceToken != -1)
    dispatch_once(&PSLogClipping_onceToken, &__block_literal_global_9);
  return (id)PSLogClipping___logObj;
}

void sub_18EB01A74(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
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

void sub_18EB01FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18EB02314(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18EB0274C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18EB02C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB030FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18EB03560(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18EB04F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v28 - 128));
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18EB054E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v28 - 128));
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18EB05850(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18EB05CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EB061C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB0646C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18EB069D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5(void *a1, const char *a2)
{
  return objc_msgSend(a1, "code");
}

id PSPointerVibrantColorMatrixForLuminance(uint64_t a1)
{
  int v2;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[5];

  v2 = _AXSPointerIncreasedContrastEnabled();
  if (a1 == 2)
  {
    if (v2)
      v3 = &xmmword_18EB08DF4;
    else
      v3 = &xmmword_18EB08E44;
  }
  else if (v2)
  {
    v3 = &xmmword_18EB08E94;
  }
  else
  {
    v3 = &xmmword_18EB08EE4;
  }
  v4 = v3[3];
  v7[2] = v3[2];
  v7[3] = v4;
  v7[4] = v3[4];
  v5 = v3[1];
  v7[0] = *v3;
  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void PSIntensityForLuminanceAndUsage(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  int v6;
  void *v7;

  v4 = _AXSPointerIncreasedContrastEnabled();
  switch(a2)
  {
    case 1:
      _PSPointerSettingsInstance();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "materialAlphaDot");
      goto LABEL_9;
    case 2:
      _PSPointerSettingsInstance();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "materialAlphaIBeam");
      goto LABEL_9;
    case 3:
      v6 = v4;
      _PSPointerSettingsInstance();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      if (a1 == 1)
      {
        if (v6)
          objc_msgSend(v7, "materialAlphaSmallItemDarkHighContrast");
        else
          objc_msgSend(v7, "materialAlphaSmallItemDark");
      }
      else
      {
        objc_msgSend(v7, "materialAlphaSmallItemLight");
      }
LABEL_9:

      break;
    default:
      return;
  }
}

id _PSPointerSettingsInstance()
{
  if (_PSPointerSettingsInstance___onceToken != -1)
    dispatch_once(&_PSPointerSettingsInstance___onceToken, &__block_literal_global_1);
  return (id)_PSPointerSettingsInstance___psPointerSettings;
}

id PSContentOverlayVibrantColorMatrixForLuminance(uint64_t a1)
{
  __int128 *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  if (a1 == 2)
    v1 = &xmmword_18EB08F34;
  else
    v1 = &xmmword_18EB08F84;
  v2 = v1[3];
  v5[2] = v1[2];
  v5[3] = v2;
  v5[4] = v1[4];
  v3 = v1[1];
  v5[0] = *v1;
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

double PSContentOverlayIntensityForLuminanceAndUsage(uint64_t a1, uint64_t a2)
{
  double result;

  result = 0.9;
  if (a2 != 1)
    return 0.5;
  return result;
}

const __CFString *PSPointerAutohideReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("PSPointerAutohideReasonUnknown");
  else
    return *(&off_1E287BD28 + a1 - 1);
}

const __CFString *PSPointerForceVisibleReasonToString(uint64_t a1)
{
  if (a1)
    return CFSTR("PSPointerForceVisibleReasonSystemComponentRequest");
  else
    return CFSTR("PSPointerForceVisibleReasonUnknown");
}

const __CFString *PSPointerClientInteractionStateToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("PSPointerClientInteractionStateHighVelocity");
  if (!a1)
    v1 = CFSTR("PSPointerClientInteractionStateDisabled");
  if (a1 == 1)
    return CFSTR("PSPointerClientInteractionStateEnabled");
  else
    return v1;
}

const __CFString *PSPointerVisibilityStateToString(uint64_t a1)
{
  if (a1)
    return CFSTR("PSPointerVisibilityStateVisible");
  else
    return CFSTR("PSPointerVisibilityStateHidden");
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
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

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1E0D014E0]();
}

uint64_t BSStringFromCGPoint()
{
  return MEMORY[0x1E0D01600]();
}

uint64_t BSStringFromCGRect()
{
  return MEMORY[0x1E0D01608]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1E0C9D3E8](path1, path2);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x1E0C9D408]();
}

uint64_t CGPathIsEllipse()
{
  return MEMORY[0x1E0C9D438]();
}

uint64_t CGPathIsRoundedRect()
{
  return MEMORY[0x1E0C9D478]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  return MEMORY[0x1E0DDDAC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

