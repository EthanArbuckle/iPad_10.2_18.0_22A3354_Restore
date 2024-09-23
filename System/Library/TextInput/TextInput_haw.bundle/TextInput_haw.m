void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_haw_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2349021A0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_2322FD000);
  objc_autoreleasePoolPop(v0);
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
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
  off_250121298(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2501212A0(__sz);
}

uint64_t operator new()
{
  return off_2501212A8();
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

