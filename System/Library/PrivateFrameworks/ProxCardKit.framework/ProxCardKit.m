uint64_t PRXSupportedInterfaceOrientations(void *a1, int a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 30;
  if (PRXIsPad() || a2)
    return 1 << objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
  return 2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_211626D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PRXCardDefaultSize()
{
  return _PRXDefaultCardWidthForDevice();
}

BOOL _PRXDefaultCardWidthForDevice()
{
  _BOOL8 result;
  void *v1;
  void *v2;

  result = PRXIsPad();
  if (!result)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "nativeBounds");

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nativeScale");

    PRXIsPad();
    return PRXIsPad();
  }
  return result;
}

BOOL PRXCardShortSize()
{
  return _PRXDefaultCardWidthForDevice();
}

BOOL PRXCardCompactSize()
{
  return _PRXDefaultCardWidthForDevice();
}

double PRXCardPreferredSize(uint64_t a1, unint64_t a2)
{
  double v3;
  double v4;

  if (a2 > 1)
  {
    v4 = *MEMORY[0x24BDBF148];
  }
  else
  {
    _PRXDefaultCardWidthForDevice();
    v4 = v3;
  }
  if (a1 == 1)
    _PRXDefaultCardWidthForDevice();
  return v4;
}

uint64_t PRXCardPreferredSizeClassForContainerBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double Width;
  CGFloat Height;
  _BOOL4 v10;
  CGRect v12;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  Height = CGRectGetHeight(v12);
  v10 = Width > Height;
  if (Height >= 375.0)
    v10 = 0;
  return Width < 375.0 || v10;
}

double PRXPreferredPickerRowHeight()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pointSize");
  v2 = v1 + 11.0;

  return v2;
}

BOOL PRXExpectedCardWidthForStyle(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double Width;
  CGFloat Height;
  _BOOL4 v9;
  unint64_t v10;
  CGRect v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v4;
  v12.size.height = v6;
  Width = CGRectGetWidth(v12);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = v4;
  v13.size.height = v6;
  Height = CGRectGetHeight(v13);
  v9 = Width > Height;
  if (Height >= 375.0)
    v9 = 0;
  v10 = Width < 375.0 || v9;
  PRXCardPreferredSize(a1, v10);
  return PRXIsPad();
}

BOOL PRXExpectedCardWidthForStyleInContainerOfSize(uint64_t a1, unint64_t a2)
{
  PRXCardPreferredSize(a1, a2);
  return PRXIsPad();
}

double PRXCardContainerDefaultLayoutMargins()
{
  _BOOL4 v0;
  double result;

  v0 = PRXIsPad();
  result = 80.0;
  if (!v0)
    return 6.0;
  return result;
}

BOOL PRXIsPad()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

BOOL PRXIsEdgeToEdgePhone()
{
  _BOOL8 v0;
  void *v1;
  void *v2;
  double v3;

  if (PRXIsPad())
    return 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayCornerRadius");
  v0 = v3 > 0.0;

  return v0;
}

void sub_21162F9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21162FC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LSApplicationWorkspace");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
    free(v3);
  }
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_211631EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_211632018(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_211632138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PRXDefaultLog()
{
  if (PRXDefaultLog_onceToken != -1)
    dispatch_once(&PRXDefaultLog_onceToken, &__block_literal_global_1);
  return (id)PRXDefaultLog_log;
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PRXCardContainerView setPreferredContentSize:].cold.1(v0);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

