void ___ZL18pairedPunctuationsv_block_invoke()
{
  void *v0;

  v0 = (void *)pairedPunctuations(void)::__pairedPunctuations;
  pairedPunctuations(void)::__pairedPunctuations = (uint64_t)&unk_2501284C0;

}

BOOL KeyEqual(const void *a1, const void *a2)
{
  return a1 == a2;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

id GetMultitapSequenceTable(void)
{
  if (GetMultitapSequenceTable(void)::__onceToken != -1)
    dispatch_once(&GetMultitapSequenceTable(void)::__onceToken, &__block_literal_global_115);
  return (id)GetMultitapSequenceTable(void)::__multitapMap;
}

void ___ZL24GetMultitapSequenceTablev_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v1 = objc_msgSend(&unk_2501284D8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v14;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(&unk_2501284D8);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v4);
        v12 = 0;
        v12 = objc_msgSend(v5, "characterAtIndex:", 0);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v12, 1);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if ((unint64_t)objc_msgSend(v5, "length") >= 2)
        {
          v8 = v6;
          v9 = 1;
          do
          {
            v12 = objc_msgSend(v5, "characterAtIndex:", v9);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v12, 1);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v0, "setObject:forKey:", v7, v8);

            ++v9;
            v8 = v7;
          }
          while (v9 < objc_msgSend(v5, "length"));
        }
        objc_msgSend(v0, "setObject:forKey:", v6, v7);

        ++v4;
      }
      while (v4 != v2);
      v2 = objc_msgSend(&unk_2501284D8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v2);
  }
  v10 = objc_msgSend(v0, "copy");
  v11 = (void *)GetMultitapSequenceTable(void)::__multitapMap;
  GetMultitapSequenceTable(void)::__multitapMap = v10;

}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_Kana_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

_QWORD *std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_Romaji_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

id TITransliterateKanaToRomaji(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ー"), CFSTR("\uFFFD"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MecabraReverseConvertedRomajiCreateFromKanaString();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFD"), CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id TIJapaneseTransliterate(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a1;
  if (!KanaCharacterSet_kanaSet)
  {
    objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 12353, 182);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD14A8];
    objc_msgSend(v4, "bitmapRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characterSetWithBitmapRepresentation:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)KanaCharacterSet_kanaSet;
    KanaCharacterSet_kanaSet = v7;

  }
  v9 = objc_msgSend(v3, "rangeOfCharacterFromSet:");
  v10 = v3;
  v11 = v10;
  v12 = v10;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  TITransliterateKanaToRomaji(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  if (a2 == 4)
  {
LABEL_12:
    v14 = v16;

    goto LABEL_18;
  }
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    TransliterateStringWithOption(v11, (const __CFString *)*MEMORY[0x24BDBD610], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2 == 2)
    {
      TransliterateStringWithOption(v16, (const __CFString *)*MEMORY[0x24BDBD608], 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    goto LABEL_12;
  }
  TITransliterateKanaToRomaji(v11);
  v18 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v18;
LABEL_4:
  if ((unint64_t)(a2 - 2) > 2)
  {
    if ((a2 | 4) == 5)
    {
      TransliterateStringWithOption(v12, (const __CFString *)*MEMORY[0x24BDBD608], a2 == 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    TransliterateStringWithOption(v12, (const __CFString *)*MEMORY[0x24BDBD640], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      TransliterateStringWithOption(v13, (const __CFString *)*MEMORY[0x24BDBD610], 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a2 == 2)
      {
        TransliterateStringWithOption(v15, (const __CFString *)*MEMORY[0x24BDBD608], 0);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = v15;
      }
    }
  }
LABEL_18:

  return v14;
}

__CFString *TransliterateStringWithOption(void *a1, const __CFString *a2, Boolean a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  CFRange range;

  v5 = a1;
  if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x24BDBD640], 0) || (a3 & 1) != 0)
  {
    v22 = (__CFString *)objc_msgSend(v5, "mutableCopy");
    range.location = 0;
    range.length = objc_msgSend(v5, "length");
    CFStringTransform(v22, &range, a2, a3);
    goto LABEL_24;
  }
  v6 = v5;
  v7 = v6;
  if (TransliterateRomajiToKana__DispatchOnceToken != -1)
  {
    dispatch_once(&TransliterateRomajiToKana__DispatchOnceToken, &__block_literal_global_4);
    if (v7)
      goto LABEL_5;
LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }
  if (!v6)
    goto LABEL_23;
LABEL_5:
  v27 = v5;
  objc_msgSend(v7, "lowercaseStringWithLocale:", TransliterateRomajiToKana_japanese);
  v8 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v8;
  v9 = MecabraConvertedKanaCreateFromRomajiString();
  v10 = (void *)objc_msgSend((id)MecabraConvertedKanaGetKana(), "copy");
  v25 = v9;
  MecabraConvertedKanaGetAlignment();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "length"))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = v12 + 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12 + 1, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_msgSend(v18, "integerValue");
        if ((v14 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15 + v13 - v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          objc_msgSend(v11, "addObject:", &unk_250128218);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19 - (v15 + v13));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

        }
        v14 = 0;
        v13 = 0;
        v15 = v19;
      }
      else if (objc_msgSend(v10, "characterAtIndex:", v12) == 12387)
      {
        objc_msgSend(v11, "addObject:", &unk_250128200);
        ++v13;
      }
      else
      {
        v14 = 1;
      }

      v12 = v16;
    }
    while (v16 < objc_msgSend(v10, "length"));
  }
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("ー"), v25);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v22, "length"))
  {
    v5 = v27;
    if (-[__CFString characterAtIndex:](v22, "characterAtIndex:", -[__CFString length](v22, "length") - 1) == 110)
    {
      -[__CFString substringToIndex:](v22, "substringToIndex:", -[__CFString length](v22, "length") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "stringByAppendingString:", CFSTR("ん"));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = v27;
  }
  MecabraConvertedKanaRelease();

LABEL_24:
  return v22;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_Romaji_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

void __copy_assignment_8_8_s0_s8(id *a1, id *a2)
{
  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
}

void ___ZL17notificationQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.kbd.NotificationQueue", v2);
  v1 = (void *)notificationQueue(void)::notificationQueue;
  notificationQueue(void)::notificationQueue = (uint64_t)v0;

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_Kana_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902648]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232303000);
  objc_autoreleasePoolPop(v0);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC18](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

uint64_t IDXCreateIndexObject()
{
  return MEMORY[0x24BE2CB70]();
}

uint64_t IDXGetFieldDataPtrs()
{
  return MEMORY[0x24BE2CB78]();
}

uint64_t IDXGetMatchDataPtr()
{
  return MEMORY[0x24BE2CB80]();
}

uint64_t IDXSetRequestFields()
{
  return MEMORY[0x24BE2CB88]();
}

uint64_t IDXSetSearchString()
{
  return MEMORY[0x24BE2CB90]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x24BEDC658]();
}

uint64_t MecabraConvertedKanaCreateFromRomajiString()
{
  return MEMORY[0x24BEDC6E0]();
}

uint64_t MecabraConvertedKanaGetAlignment()
{
  return MEMORY[0x24BEDC6E8]();
}

uint64_t MecabraConvertedKanaGetKana()
{
  return MEMORY[0x24BEDC6F0]();
}

uint64_t MecabraConvertedKanaRelease()
{
  return MEMORY[0x24BEDC6F8]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x24BEDC740]();
}

uint64_t MecabraReverseConvertedRomajiCreateFromKanaString()
{
  return MEMORY[0x24BEDC788]();
}

uint64_t MecabraSetAddressBookNamePhoneticPairs()
{
  return MEMORY[0x24BEDC790]();
}

uint64_t TIBundlePathForInputMode()
{
  return MEMORY[0x24BEB4F00]();
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

uint64_t TIOSLogFacility()
{
  return MEMORY[0x24BEB54E0]();
}

uint64_t TIPersonalizationContactOSLogFacility()
{
  return MEMORY[0x24BEB54E8]();
}

uint64_t TI_IS_WILDCAT()
{
  return MEMORY[0x24BEB5520]();
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

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x24BEB5650](this);
}

uint64_t TIInputManager::initialize_search_if_necessary_from_last_touch(TIInputManager *this)
{
  return MEMORY[0x24BEB5660](this);
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x24BEB5828](this);
}

uint64_t TIInputManager::keys_for_input(TIInputManager *this)
{
  return MEMORY[0x24BEB5958](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void operator delete(void *__p)
{
  off_250121FC0(__p);
}

uint64_t operator new()
{
  return off_250121FC8();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
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

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

