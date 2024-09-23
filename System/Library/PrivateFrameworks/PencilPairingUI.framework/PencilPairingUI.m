void sub_22ACC4DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22ACC7560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PKLocalizedDrawingBundleForLanguage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
    goto LABEL_8;
  v6 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v4, "localizations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;

    v3 = v11;
  }
  objc_msgSend(v5, "pathForResource:ofType:", v3, CFSTR("lproj"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {

LABEL_8:
    v13 = v5;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_8;
LABEL_9:

  return v13;
}

id PKLocalizedStringForLanguageInBundle(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a1;
  PKLocalizedDrawingBundleForLanguage(a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_22ACCA898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PencilPairingUIBundle()
{
  if (PencilPairingUIBundle_onceToken != -1)
    dispatch_once(&PencilPairingUIBundle_onceToken, &__block_literal_global_3);
  return (id)__PencilPairingUIBundle;
}

void sub_22ACCC598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 160));
  _Unwind_Resume(a1);
}

void sub_22ACCC964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void PNPChargingStatusConfigureAutoDismiss(void *a1, void *a2)
{
  PNPChargingStatusConfigureAutoDismissWithTime(a1, a2, 1.0);
}

void PNPChargingStatusConfigureAutoDismissWithTime(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  dispatch_block_t v12;
  dispatch_time_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id from;
  id location;

  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoDismissBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_4;
  objc_msgSend(v6, "autoDismissDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v7);

  if (v10 != -1)
  {
    objc_msgSend(v6, "autoDismissBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v11);

LABEL_4:
    objc_initWeak(&location, v6);
    objc_initWeak(&from, v5);
    objc_msgSend(v6, "setAutoDismissDate:", v7);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke;
    v20 = &unk_24F4E55C8;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    v12 = dispatch_block_create((dispatch_block_flags_t)0, &v17);
    objc_msgSend(v6, "setAutoDismissBlock:", v12, v17, v18, v19, v20);

    v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v14 = MEMORY[0x24BDAC9B8];
    objc_msgSend(v6, "autoDismissBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_after(v13, MEMORY[0x24BDAC9B8], v15);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void sub_22ACCE3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_22ACCEF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_22ACCF52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PNPSignpostLog()
{
  if (_PNPSignpostLog_onceToken != -1)
    dispatch_once(&_PNPSignpostLog_onceToken, &__block_literal_global_5);
  return (id)_PNPSignpostLog____PNPSignpostLog;
}

void sub_22ACD0E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22ACD5B2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22ACD689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22ACD6DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMUIDiscoveredAccessoryClass_block_invoke(uint64_t a1)
{
  Class result;

  FindMyUICoreLibrary();
  result = objc_getClass("FMUIDiscoveredAccessory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFMUIDiscoveredAccessoryClass_block_invoke_cold_1();
  getFMUIDiscoveredAccessoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void FindMyUICoreLibrary()
{
  void *v0;

  if (!FindMyUICoreLibraryCore_frameworkLibrary)
    FindMyUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke(uint64_t a1)
{
  Class result;

  FindMyUICoreLibrary();
  result = objc_getClass("FMUIAccessoryOnboardingCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1();
  getFMUIAccessoryOnboardingCoordinatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

double PNPWizardScratchpadOpacitySliderAnimationParameters@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_22ACEA2E0;
  result = 1.0;
  *(_OWORD *)(a1 + 24) = xmmword_22ACEA2F0;
  return result;
}

id getOpaqueTouchValue(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  __IOHIDEventSystemClient *v3;
  void *v4;
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = IOHIDEventSystemClientCreateWithType();
  if (v2)
  {
    v3 = (__IOHIDEventSystemClient *)v2;
    v17[0] = CFSTR("PrimaryUsagePage");
    v17[1] = CFSTR("PrimaryUsage");
    v18[0] = &unk_24F4F6250;
    v18[1] = &unk_24F4F6268;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = IOHIDEventSystemClientCopyServices(v3);
    v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v12 + 1) + 8 * v9), v1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;

        if (v7 == ++v9)
        {
          v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v10 = 0;
    }

    CFRelease(v3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_22ACE11A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

float BatteryLevel(float a1)
{
  return BatteryLevelPercentage(a1 * 100.0) / 100.0;
}

float BatteryLevelPercentage(float a1)
{
  if (BatteryLevelPercentage_onceToken != -1)
    dispatch_once(&BatteryLevelPercentage_onceToken, &__block_literal_global_12);
  if (BatteryLevelPercentage___demoBatteryLevelMode == 3)
    return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
  if (BatteryLevelPercentage___demoBatteryLevelMode == 2)
  {
    if (*(float *)&BatteryLevelPercentage___demoBatteryLevel <= a1)
      return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
  }
  else if (BatteryLevelPercentage___demoBatteryLevelMode == 1
         && *(float *)&BatteryLevelPercentage___demoBatteryLevel > a1)
  {
    return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
  }
  return a1;
}

void _PNPPlatterContainerViewMoveToPresented(void *a1, char a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  char v18;

  v7 = a1;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___PNPPlatterContainerViewMoveToPresented_block_invoke;
  v16[3] = &unk_24F4E5160;
  v10 = v7;
  v17 = v10;
  v18 = a2;
  v11 = (void (**)(_QWORD))MEMORY[0x22E2E6AA4](v16);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = ___PNPPlatterContainerViewMoveToPresented_block_invoke_2;
  v14[3] = &unk_24F4E5240;
  v12 = v8;
  v15 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2E6AA4](v14);
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v11, v13);
  }
  else
  {
    v11[2](v11);
    v13[2](v13, 1);
  }

}

void PNPPlatterPresentPlatterContainerView(void *a1, int a2, void *a3)
{
  _PNPPlatterContainerViewMoveToPresented(a1, 1, a2, a3);
}

void PNPPlatterDismissPlatterContainerView(void *a1, int a2, void *a3)
{
  _PNPPlatterContainerViewMoveToPresented(a1, 0, a2, a3);
}

void __getFMUIDiscoveredAccessoryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1(v0);
}

void __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1()
{
  abort_report_np();
  AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BKSHIDServicesGetPersistentServiceProperties()
{
  return MEMORY[0x24BE0B5C8]();
}

uint64_t BKSHIDServicesSetPersistentServiceProperties()
{
  return MEMORY[0x24BE0B628]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x24BE0BC48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x24BDD83D8]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8530](service, key);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x24BE75DF8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
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

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BDF7C78]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BDF7C90]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BDF7CA0]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BDF7CA8]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BDF7CE0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BDF7D98]();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return MEMORY[0x24BED2028]();
}

uint64_t _AXSPencilExtendedSqueezeRangeEnabled()
{
  return MEMORY[0x24BED2380]();
}

uint64_t _AXSSetAllowOpaqueTouchGestures()
{
  return MEMORY[0x24BED2418]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

