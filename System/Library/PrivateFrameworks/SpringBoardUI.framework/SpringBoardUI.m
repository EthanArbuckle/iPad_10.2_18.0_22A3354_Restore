void sub_215F91514(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromLockSource(int a1)
{
  if ((a1 - 1) > 0x19)
    return CFSTR("None");
  else
    return off_24D4CFBB8[a1 - 1];
}

unint64_t SBUIUnlockSourceIsUserAction(unsigned int a1)
{
  return (a1 > 0x29) | (0x1A61A0280A2uLL >> a1) & 1;
}

const __CFString *NSStringFromUnlockSource(int a1)
{
  if ((a1 - 1) > 0x28)
    return CFSTR("None");
  else
    return off_24D4CFC88[a1 - 1];
}

const __CFString *NSStringFromUnlockIntent(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("None");
  else
    return off_24D4CFDD0[a1 - 1];
}

uint64_t SBUIConvertLockSourceToBacklightChangeSource(int a1)
{
  if ((a1 - 1) > 0x19)
    return 0;
  else
    return qword_215FA4BD0[a1 - 1];
}

uint64_t SBUIConvertUnlockSourceToBacklightChangeSource(int a1)
{
  if ((a1 - 1) > 0x28)
    return 0;
  else
    return qword_215FA4CA0[a1 - 1];
}

__CFString *NSStringFromSBUIBackgroundStyle(unint64_t a1)
{
  if (a1 > 9)
    return 0;
  else
    return off_24D4CFE28[a1];
}

id SBUIGetBackdropSettingsForBackgroundStyle(uint64_t a1)
{
  int IsReduceTransparencyEnabled;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (SBUIGetBackdropSettingsForBackgroundStyle___once != -1)
    dispatch_once(&SBUIGetBackdropSettingsForBackgroundStyle___once, &__block_literal_global);
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (SBUIGetBackdropSettingsForBackgroundStyle_wasReducedTransparencyEnabledLastTime != IsReduceTransparencyEnabled)
  {
    v3 = IsReduceTransparencyEnabled;
    objc_msgSend((id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings, "removeAllObjects");
    SBUIGetBackdropSettingsForBackgroundStyle_wasReducedTransparencyEnabledLastTime = v3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    switch(a1)
    {
      case 3:
        objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2030);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setGrayscaleTintAlpha:", 0.0);
        objc_msgSend(v5, "setGrayscaleTintLevel:", 0.0);
        objc_msgSend(v5, "setColorTintAlpha:", 0.0);
        goto LABEL_13;
      case 4:
      case 5:
        v6 = (void *)MEMORY[0x24BDF7020];
        v7 = 2020;
        goto LABEL_12;
      case 6:
        v6 = (void *)MEMORY[0x24BDF7020];
        v7 = 2030;
        goto LABEL_12;
      case 7:
        v6 = (void *)MEMORY[0x24BDF7020];
        v7 = 2050;
        goto LABEL_12;
      case 8:
        objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2030);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setGrayscaleTintAlpha:", 0.15);
        objc_msgSend(v5, "setGrayscaleTintLevel:", 0.0);
        objc_msgSend(v5, "setColorTintAlpha:", 0.0);
        objc_msgSend(v5, "setSaturationDeltaFactor:", 1.0);
        goto LABEL_13;
      case 9:
        objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2030);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setGrayscaleTintAlpha:", 0.0);
        objc_msgSend(v5, "setGrayscaleTintLevel:", 0.0);
        objc_msgSend(v5, "setColorTintAlpha:", 0.0);
        objc_msgSend(v5, "setSaturationDeltaFactor:", 1.9);
        objc_msgSend(v5, "setBlurRadius:", 30.0);
        goto LABEL_13;
      default:
        v6 = (void *)MEMORY[0x24BDF7020];
        v7 = -2;
LABEL_12:
        objc_msgSend(v6, "settingsForPrivateStyle:", v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        if (v5)
          objc_msgSend((id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings, "setObject:forKeyedSubscript:", v5, v4);
        break;
    }
  }

  return v5;
}

BOOL SBUIHasBlurForBackgroundStyle(uint64_t a1)
{
  return a1 > 2;
}

const __CFString *NSStringFromSBSceneViewDisplayMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("None");
  else
    return off_24D4D0018[a1 - 1];
}

void sub_215F94E28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id SpringBoardUIBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
  if (!SpringBoardUIBundle___SpringBoardUIBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
    SpringBoardUIBundle___SpringBoardUIBundle = v1;

    v0 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
  }
  return v0;
}

const __CFString *NSStringFromSBAlertItemPresentationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_24D4D0090[a1 - 1];
}

const __CFString *SBStringFromAlertItemDeactivateReason(int a1)
{
  if ((a1 - 1) > 5)
    return CFSTR("Lock");
  else
    return off_24D4D0060[a1 - 1];
}

BOOL SBAlertItemIsUserDeactivate(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

__CFString *NSStringFromLockScreenElement(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24D4D0178[a1];
}

uint64_t SBLockScreenCapabilityAllExcept(uint64_t a1)
{
  return ~a1;
}

id NSStringFromLockScreenCapabilities(uint64_t a1)
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
  void *(*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  char v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __NSStringFromLockScreenCapabilities_block_invoke;
  v13 = &unk_24D4D0158;
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

__CFString *NSStringFromLockScreenEvent(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_24D4D0198[a1];
}

__CFString *NSStringFromLockScreenPluginBackgroundStyle(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24D4D01E0[a1];
}

__CFString *NSStringFromLockScreenPluginPresentationStyle(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24D4D0200[a1];
}

__CFString *NSStringFromLockScreenPluginNotificationBehavior(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24D4D0228[a1];
}

uint64_t SBUIHasHIDRingerButton()
{
  return MGGetBoolAnswer();
}

uint64_t SBUIHasHIDRingerSwitch()
{
  return MGGetBoolAnswer();
}

void sub_215F991AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_215F9AD74(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_215F9BB04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
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

void sub_215F9BEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _NewChevronPiece()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x24BDF6F90]);
  BSRectWithSize();
  v1 = (void *)objc_msgSend(v0, "initWithFrame:");
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 2.25);

  objc_msgSend(v1, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsEdgeAntialiasing:", 1);

  return v1;
}

const __CFString *SBUIFrameworkBundleID()
{
  return CFSTR("com.apple.SpringBoardUIFramework");
}

void SBUIPrewarmKeyboard()
{
  if (SBUIPrewarmKeyboard_onceToken != -1)
    dispatch_once(&SBUIPrewarmKeyboard_onceToken, &__block_literal_global_4);
}

id SBUIGetUserAgent()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v0, "pluginUserAgent");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

const __CFString *SBUIPluginStringForActivationEvent(int a1)
{
  if ((a1 - 1) > 0xB)
    return CFSTR("Unknown");
  else
    return off_24D4D0710[a1 - 1];
}

void sub_215FA02F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBLogUIRemoteVC()
{
  if (SBLogUIRemoteVC_onceToken != -1)
    dispatch_once(&SBLogUIRemoteVC_onceToken, &__block_literal_global_5);
  return (id)SBLogUIRemoteVC___logObj;
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1)
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_2);
  return (id)SBLogLegibility___logObj;
}

id SBLogContinuitySessionService()
{
  if (SBLogContinuitySessionService_onceToken != -1)
    dispatch_once(&SBLogContinuitySessionService_onceToken, &__block_literal_global_4);
  return (id)SBLogContinuitySessionService___logObj;
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x24BE0BC28]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x24BE0BC48]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x24BE0BC80]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return MEMORY[0x24BE0BCD0]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x24BE1B268]();
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t FBSProcessPrettyDescription()
{
  return MEMORY[0x24BE38340]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x24BDD11C8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6688](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x24BEB0870]();
}

uint64_t SBLogCFUserNotifications()
{
  return MEMORY[0x24BEB0B90]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x24BEB0B98]();
}

uint64_t SBLogNotifications()
{
  return MEMORY[0x24BEB0BA0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x24BDF7B10]();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return MEMORY[0x24BDF7B18]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

