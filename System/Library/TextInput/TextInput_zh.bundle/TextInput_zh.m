void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_SegmentAdjust_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Base_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Toneless_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerCangjie_zh_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Pinyin_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_zh_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_RetroCorrection_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_hant_Zhuyin_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubixing_zh_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
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

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_SegmentPicker_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubi_zh_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

BOOL TIStringContainsCharacterFromSet(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", a2) != 0x7FFFFFFFFFFFFFFFLL;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Candidates_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234904010]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23235B000);
  objc_autoreleasePoolPop(v0);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

uint64_t MecabraCandidateCopySyllableLengthArrayForWordAtIndex()
{
  return MEMORY[0x24BEDC630]();
}

uint64_t MecabraCandidateCopySyllableLengthArrayInAnalysisString()
{
  return MEMORY[0x24BEDC638]();
}

uint64_t MecabraCandidateGetDictionaryReading()
{
  return MEMORY[0x24BEDC650]();
}

uint64_t MecabraCandidateGetWordCount()
{
  return MEMORY[0x24BEDC668]();
}

uint64_t MecabraCandidateGetWordLengthAtIndex()
{
  return MEMORY[0x24BEDC670]();
}

uint64_t MecabraCandidateGetWordReadingLengthAtIndex()
{
  return MEMORY[0x24BEDC678]();
}

uint64_t MecabraCandidateWordAtIndexIsFromSystemDictionary()
{
  return MEMORY[0x24BEDC6B0]();
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x24BEB54A0]();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BEB4F90]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x24BEB54E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::sync_with_input_from_UI(TIInputManager *this)
{
  return MEMORY[0x24BEB5640](this);
}

void operator delete(void *__p)
{
  off_25012EAB0(__p);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x24BEDC270]();
}

