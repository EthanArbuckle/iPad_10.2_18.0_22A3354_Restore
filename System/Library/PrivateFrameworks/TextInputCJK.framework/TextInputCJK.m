void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void SetLocaleFromInputMode(void *a1)
{
  id v2;
  id v3;

  v2 = a1;
  if ((id)__inputMode != v2)
  {
    v3 = v2;
    objc_storeStrong((id *)&__inputMode, a1);
    v2 = v3;
  }

}

id GetCurrentLocale()
{
  void *v0;
  void *v1;

  if (GetCurrentLocale___onceToken != -1)
    dispatch_once(&GetCurrentLocale___onceToken, &__block_literal_global_116);
  objc_msgSend((id)__inputMode, "languageWithRegion");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)GetCurrentLocale___localeDictionary, "objectForKey:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v0);
    objc_msgSend((id)GetCurrentLocale___localeDictionary, "setObject:forKey:", v1, v0);
  }

  return v1;
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

__n128 __Block_byref_object_copy__502(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  unsigned int *v1;
  unsigned int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;

  v1 = result;
  v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*((_QWORD **)v1 + 23));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*((_QWORD **)v1 + 20));
    v3 = (_QWORD *)*((_QWORD *)v1 + 11);
    while (v3)
    {
      v4 = v3;
      v3 = (_QWORD *)*v3;
      v5 = v4[4];
      if (v5)
        WTF::RefCounted<TI::Favonius::Key>::deref(v5);
      if (*((unsigned __int16 *)v4 + 8) >= 0xFu)
      {
        v6 = v4[3];
        if (v6)
          MEMORY[0x249597530](v6, 0x1000C8077774924);
      }
      operator delete(v4);
    }
    v7 = (void *)*((_QWORD *)v1 + 9);
    *((_QWORD *)v1 + 9) = 0;
    if (v7)
      operator delete(v7);
    v8 = (_QWORD *)*((_QWORD *)v1 + 6);
    if (v8)
    {
      do
      {
        v9 = (_QWORD *)*v8;
        v10 = v8[3];
        if (v10)
          WTF::RefCounted<TI::Favonius::Key>::deref(v10);
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    v11 = (void *)*((_QWORD *)v1 + 4);
    *((_QWORD *)v1 + 4) = 0;
    if (v11)
      operator delete(v11);
    v12 = *((_QWORD *)v1 + 1);
    if (v12)
    {
      v13 = *((_QWORD *)v1 + 2);
      v14 = (void *)*((_QWORD *)v1 + 1);
      if (v13 != v12)
      {
        do
        {
          v16 = *(_QWORD *)(v13 - 8);
          v13 -= 8;
          v15 = v16;
          if (v16)
            WTF::RefCounted<TI::Favonius::Key>::deref(v15);
        }
        while (v13 != v12);
        v14 = (void *)*((_QWORD *)v1 + 1);
      }
      *((_QWORD *)v1 + 2) = v12;
      operator delete(v14);
    }
    JUMPOUT(0x249597548);
  }
  do
    v17 = __ldaxr(result);
  while (__stlxr(v17 - 1, result));
  return result;
}

void std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*a1);
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t WTF::RefCounted<TI::Favonius::Key>::deref(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;

  v1 = result;
  v2 = atomic_load((unsigned int *)result);
  if (v2 == 1)
  {
    if (*(unsigned __int16 *)(result + 40) >= 0xFu)
    {
      v3 = *(_QWORD *)(result + 48);
      if (v3)
        MEMORY[0x249597530](v3, 0x1000C8077774924);
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x249597548);
  }
  do
    v4 = __ldaxr((unsigned int *)result);
  while (__stlxr(v4 - 1, (unsigned int *)result));
  return result;
}

void ___ZL44GetDirectlyCommittedNumbersAndPunctuationSetv_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GetDirectlyCommittedNumbersAndPunctuationSet(void)::__directNumbersAndPunctuationSet;
  GetDirectlyCommittedNumbersAndPunctuationSet(void)::__directNumbersAndPunctuationSet = v0;

}

void ___ZL54GetInputsPreventingAcceptCurrentCandidateIfSelectedSetv_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithCharactersInString:", CFSTR("选"));
  v1 = (void *)GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::__inputsPreventingAcceptCurrentCandidateIfSelectedSet;
  GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::__inputsPreventingAcceptCurrentCandidateIfSelectedSet = v0;

}

void ___ZL56TIGetHandwritingMultipleCharacterRecognitionEnabledValuev_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("HandwritingMultipleCharacterRecognitionEnabled"), CFSTR("com.apple.keyboard"), MEMORY[0x24BDBD1C8]);

}

id handwritingResponseKitBackgroundQueue(void)
{
  if (handwritingResponseKitBackgroundQueue(void)::onceToken != -1)
    dispatch_once(&handwritingResponseKitBackgroundQueue(void)::onceToken, &__block_literal_global_777);
  return (id)handwritingResponseKitBackgroundQueue(void)::_instance;
}

void ___Z37handwritingResponseKitBackgroundQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.ResponseKit.handwritingResponseKitBackgroundQueue", v2);
  v1 = (void *)handwritingResponseKitBackgroundQueue(void)::_instance;
  handwritingResponseKitBackgroundQueue(void)::_instance = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy__782(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__783(uint64_t a1)
{

}

id GetCacheKey(NSString *a1, MCKeyboardInput *a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  NSString *v13;
  MCKeyboardInput *v14;
  NSString *v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;

  v13 = a1;
  v14 = a2;
  if (!v14)
  {
    v15 = v13;
    goto LABEL_5;
  }
  if (-[MCKeyboardInput hasKindOf:](v14, "hasKindOf:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lud"), v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (__CFString *)v15;
    goto LABEL_8;
  }
  -[MCKeyboardInput asSearchString](v14, "asSearchString");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v16, "length"))
  {
    -[MCKeyboardInput asInlineText](v14, "asInlineText");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (__CFString *)v17;
  }
LABEL_8:
  if (v16)
    v18 = v16;
  else
    v18 = &stru_251980880;
  v19 = CFSTR("-0");
  if (a3)
    v20 = CFSTR("-1");
  else
    v20 = CFSTR("-0");
  if (a5)
    v21 = CFSTR("-1");
  else
    v21 = CFSTR("-0");
  if (a6)
    v19 = CFSTR("-1");
  -[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR("%@%lud%@%@%lud"), v20, a4, v21, v19, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerChinese_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubi_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerPinyin_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIWordSearchCangjie_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerShapeBased_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerCangjie_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardHandwritingSpecialization_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerChinesePhonetic_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubixing_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIInputManagerHandwriting_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIWordSearchChinesePhonetic_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x249597680]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_248040000);
  objc_autoreleasePoolPop(v0);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC4F0](*(_QWORD *)&encoding);
}

uint64_t MecabraAcceptCandidate()
{
  return MEMORY[0x24BEDC618]();
}

uint64_t MecabraAnalyzeStringWithContext()
{
  return MEMORY[0x24BEDC628]();
}

uint64_t MecabraCandidateCopySyllableLengthArrayInAnalysisString()
{
  return MEMORY[0x24BEDC638]();
}

uint64_t MecabraCandidateGetAttributes()
{
  return MEMORY[0x24BEDC648]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x24BEDC658]();
}

uint64_t MecabraCandidateGetType()
{
  return MEMORY[0x24BEDC660]();
}

uint64_t MecabraCandidateGetWubixingType()
{
  return MEMORY[0x24BEDC680]();
}

uint64_t MecabraCandidateIsBilingualCandidate()
{
  return MEMORY[0x24BEDC688]();
}

uint64_t MecabraCandidateIsFuzzyMatchCandidate()
{
  return MEMORY[0x24BEDC690]();
}

uint64_t MecabraCandidateIsPredictionCandidate()
{
  return MEMORY[0x24BEDC698]();
}

uint64_t MecabraCandidateRelease()
{
  return MEMORY[0x24BEDC6A0]();
}

uint64_t MecabraCandidateSetDisplayString()
{
  return MEMORY[0x24BEDC6A8]();
}

uint64_t MecabraCangjieCodeIsValid()
{
  return MEMORY[0x24BEDC6B8]();
}

uint64_t MecabraContextAddCandidate()
{
  return MEMORY[0x24BEDC6C0]();
}

uint64_t MecabraContextCreateMutable()
{
  return MEMORY[0x24BEDC6D0]();
}

uint64_t MecabraContextRelease()
{
  return MEMORY[0x24BEDC6D8]();
}

uint64_t MecabraCopyEmojiCharacterArrayForString()
{
  return MEMORY[0x24BEDC700]();
}

uint64_t MecabraCreateCandidateFromContextString()
{
  return MEMORY[0x24BEDC708]();
}

uint64_t MecabraCreateHandwritingCandidate()
{
  return MEMORY[0x24BEDC710]();
}

uint64_t MecabraCreatePinyinSyllableArray()
{
  return MEMORY[0x24BEDC718]();
}

uint64_t MecabraCreateSyllableSequences()
{
  return MEMORY[0x24BEDC720]();
}

uint64_t MecabraFlushDynamicData()
{
  return MEMORY[0x24BEDC730]();
}

uint64_t MecabraGetDebuggingLog()
{
  return MEMORY[0x24BEDC738]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x24BEDC740]();
}

uint64_t MecabraInputKeyPropertiesCreateASCIIFromInputKeyString()
{
  return MEMORY[0x24BEDC748]();
}

uint64_t MecabraInputKeyPropertiesCreateInputKeyFromASCIIString()
{
  return MEMORY[0x24BEDC750]();
}

uint64_t MecabraInputKeyPropertiesGetInputKeys()
{
  return MEMORY[0x24BEDC758]();
}

uint64_t MecabraPredictionAcceptCandidate()
{
  return MEMORY[0x24BEDC760]();
}

uint64_t MecabraPredictionAnalyzeWithContext()
{
  return MEMORY[0x24BEDC768]();
}

uint64_t MecabraPredictionGetNextCandidate()
{
  return MEMORY[0x24BEDC770]();
}

uint64_t MecabraPreheatResources()
{
  return MEMORY[0x24BEDC778]();
}

uint64_t MecabraSetAssetDataItemsForType()
{
  return MEMORY[0x24BEDC798]();
}

uint64_t MecabraSetFuzzyPinyinPairs()
{
  return MEMORY[0x24BEDC7A0]();
}

uint64_t MecabraSetWubixingStandard()
{
  return MEMORY[0x24BEDC7A8]();
}

uint64_t MecabraSyllablesCreateWithString()
{
  return MEMORY[0x24BEDC7B0]();
}

uint64_t MecabraSyllablesGetSyllableAtIndex()
{
  return MEMORY[0x24BEDC7B8]();
}

uint64_t MecabraSyllablesGetSyllableCount()
{
  return MEMORY[0x24BEDC7C0]();
}

uint64_t MecabraSyllablesRelease()
{
  return MEMORY[0x24BEDC7C8]();
}

uint64_t MecabraWordPropertiesCreate()
{
  return MEMORY[0x24BEDC7D0]();
}

uint64_t MecabraWordPropertiesGetProperty()
{
  return MEMORY[0x24BEDC7D8]();
}

uint64_t MecabraWordPropertiesGetSortedRadicalList()
{
  return MEMORY[0x24BEDC7E0]();
}

uint64_t MecabraWordPropertiesRelease()
{
  return MEMORY[0x24BEDC7E8]();
}

uint64_t MecabraWorkingSetAddString()
{
  return MEMORY[0x24BEDC7F0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x24BEB54A0]();
}

uint64_t TICreateNameReadingPairsFromContactCollection()
{
  return MEMORY[0x24BEB54A8]();
}

uint64_t TIDispatchAsync()
{
  return MEMORY[0x24BEB4F38]();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return MEMORY[0x24BEB4F88]();
}

uint64_t TIInputModeGetVariant()
{
  return MEMORY[0x24BEB4FE0]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x24BEB54E0]();
}

uint64_t TIPersonalizationContactOSLogFacility()
{
  return MEMORY[0x24BEB54E8]();
}

uint64_t TIStatisticDistributionPushValue()
{
  return MEMORY[0x24BEB5170]();
}

uint64_t TIStatisticGetKeyForCandidateAccepted()
{
  return MEMORY[0x24BEB5188]();
}

uint64_t TIStatisticScalarDecrement()
{
  return MEMORY[0x24BEB51C0]();
}

uint64_t TIStatisticScalarIncrement()
{
  return MEMORY[0x24BEB51C8]();
}

uint64_t TI_DIALECT_LM_PATH()
{
  return MEMORY[0x24BEB5500]();
}

uint64_t TI_GET_SCALED_POINT()
{
  return MEMORY[0x24BEB5508]();
}

uint64_t TI_IS_INTERNAL_INSTALL()
{
  return MEMORY[0x24BEB5510]();
}

uint64_t TI_IS_USING_CUSTOM_DIALECT_LM()
{
  return MEMORY[0x24BEB5518]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _TIQueueBackground()
{
  return MEMORY[0x24BEB5240]();
}

uint64_t asMCNearbyKeys()
{
  return MEMORY[0x24BEB55D0]();
}

uint64_t TIInputManager::set_input_index(TIInputManager *this)
{
  return MEMORY[0x24BEB55E8](this);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::set_locale_identifier()
{
  return MEMORY[0x24BEB5620]();
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x24BEB5670]();
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

uint64_t KB::utf8_substring(KB *this, NSString *a2, _NSRange a3)
{
  return MEMORY[0x24BEB5718](this, a2, a3.location, a3.length);
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x24BEB5848](this, a2);
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x24BEB5948](this);
}

uint64_t TIInputManager::keys_for_input(TIInputManager *this)
{
  return MEMORY[0x24BEB5958](this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5A08](this, a2);
}

uint64_t operator delete[]()
{
  return off_25197F9E8();
}

void operator delete(void *__p)
{
  off_25197F9F0(__p);
}

uint64_t operator delete()
{
  return off_25197F9F8();
}

uint64_t operator new()
{
  return off_25197FA00();
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

uint64_t kac_get_log()
{
  return MEMORY[0x24BEB5270]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

