void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_si_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234903220]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232342000);
  objc_autoreleasePoolPop(v0);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x24BEB5670]();
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x24BEB5858](this);
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

void operator delete(void *__p)
{
  off_25012BBF8(__p);
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

