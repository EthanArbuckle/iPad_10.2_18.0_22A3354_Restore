void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void _GLOBAL__sub_I_TIKeyboardFeatureSpecialization_cs_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234901878]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_2322EE000);
  objc_autoreleasePoolPop(v0);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

uint64_t KB::compose_diacritics()
{
  return MEMORY[0x24BEB5750]();
}

uint64_t KB::decompose_diacritics()
{
  return MEMORY[0x24BEB5790]();
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

void operator delete(void *__p)
{
  off_25011F9F8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25011FA00(__sz);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

