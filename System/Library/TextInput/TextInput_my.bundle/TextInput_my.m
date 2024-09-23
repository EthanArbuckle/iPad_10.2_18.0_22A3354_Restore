void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void ___ZL23InternalToExternalRegexv_block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\x{1031})?([\\x{1000}-\\x{102a}\\x{103f}\\x{104e}\\x{1050}-\\x{1055}])((?:\\x{1039}[\\x{1000}-\\x{101c}\\x{101e}\\x{1020}\\x{1021}\\x{1050}\\x{1051}]){0,2})([\\x{1004}\\x{101b}]\\x{103a}\\x{1039})?(?:\\x{103a}(\\x{103b}?))?([\\x{103b}-\\x{103e}]{0,3})([\\x{102d}-\\x{1030}\\x{1032}\\x{1058}\\x{1059}]{0,2})(\\x{102c}?)"), 0, &v2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  if (!v1)
    objc_storeStrong((id *)&InternalToExternalRegex(void)::__regex, v0);

}

void ___ZL23ExternalToInternalRegexv_block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?<!\\x{1039})([\\x{1004}\\x{101b}]\\x{103a}\\x{1039})?[\\x{1000}-\\x{102a}\\x{103f}\\x{104e}\\x{1050}-\\x{1055}](?:\\x{1039}[\\x{1000}-\\x{101c}\\x{101e}\\x{1020}\\x{1021}\\x{1050}\\x{1051}]){0,2}((?:\\x{103b}?\\x{103a})?)[\\x{103b}-\\x{103e}]{0,4}(\\x{1031}?)"), 0, &v2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  if (!v1)
    objc_storeStrong((id *)&ExternalToInternalRegex(void)::__regex, v0);

}

void _GLOBAL__sub_I_TIKeyboardInputManager_my_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902E90]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23233C000);
  objc_autoreleasePoolPop(v0);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::delete_suffix_from_input()
{
  return MEMORY[0x24BEB5648]();
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

uint64_t TIInputManager::input_stem(TIInputManager *this)
{
  return MEMORY[0x24BEB5938](this);
}

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x24BEB5948](this);
}

void operator delete(void *__p)
{
  off_25012B170(__p);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

