void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

_QWORD *TIInputManager_mr::create_custom_candidate_filter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *result;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &unk_250129B90;
  v3 = MEMORY[0x24BEB5A60] + 16;
  a1[1] = v2;
  v2[3] = v3;
  result = v2 + 3;
  *a1 = result;
  return result;
}

void TIInputManager_mr::~TIInputManager_mr(TIInputManager_mr *this)
{
  TIInputManager::~TIInputManager(this);
  JUMPOUT(0x234902C8CLL);
}

void TIInputManager::filter_pre_lookup_input()
{
  JUMPOUT(0x234902C68);
}

void TIInputManager::internal_string_to_external(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

void TIInputManager::external_string_to_internal(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager *this)
{
  return 0;
}

void std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_250129B90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_250129B90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234902C8CLL);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t _GLOBAL__sub_I_TIInputManager_mr_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232338000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_mr_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902CD4]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232338000);
  objc_autoreleasePoolPop(v0);
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5690](this);
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5698](this);
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5850]();
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void operator delete(void *__p)
{
  off_250129AD0(__p);
}

uint64_t operator delete()
{
  return off_250129AD8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250129AE0(__sz);
}

uint64_t operator new()
{
  return off_250129AE8();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

