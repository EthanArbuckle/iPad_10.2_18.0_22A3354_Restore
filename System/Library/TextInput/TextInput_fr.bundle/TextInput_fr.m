void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

uint64_t TIInputManager::set_input_manager_specialization(TIInputManager *a1, uint64_t *a2)
{
  uint64_t result;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int *v23;

  std::shared_ptr<KB::InputManagerSpecialization>::operator=[abi:nn180100]((_QWORD *)a1 + 68, a2);
  result = *((_QWORD *)a1 + 23);
  if (result)
  {
    (*(void (**)(unsigned int **__return_ptr))(*(_QWORD *)result + 168))(&v23);
    result = (uint64_t)v23;
    if (v23)
    {
      v4 = v23 + 2;
      v5 = atomic_load(v23 + 2);
      if (v5 == 1)
      {
        (*(void (**)(void))(*(_QWORD *)v23 + 40))();
      }
      else
      {
        do
          v6 = __ldaxr(v4);
        while (__stlxr(v6 - 1, v4));
      }
      v7 = *((_QWORD *)a1 + 68);
      v8 = *(unsigned int **)TIInputManager::favonius_layout(a1);
      v22 = v8;
      if (v8)
      {
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 + 1, v8));
      }
      (*(void (**)(unsigned int **__return_ptr, uint64_t, unsigned int **))(*(_QWORD *)v7 + 16))(&v23, v7, &v22);
      if (v22)
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v22);
      (*(void (**)(unsigned int **__return_ptr))(**((_QWORD **)a1 + 23) + 168))(&v21);
      v10 = v23;
      v23 = 0;
      v20 = v10;
      (*(void (**)(unsigned int *, unsigned int **))(*(_QWORD *)v21 + 24))(v21, &v20);
      if (v20)
      {
        v11 = v20 + 2;
        v12 = atomic_load(v20 + 2);
        if (v12 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v20 + 8))();
        }
        else
        {
          do
            v13 = __ldaxr(v11);
          while (__stlxr(v13 - 1, v11));
        }
      }
      if (v21)
      {
        v14 = v21 + 2;
        v15 = atomic_load(v21 + 2);
        if (v15 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v21 + 40))();
        }
        else
        {
          do
            v16 = __ldaxr(v14);
          while (__stlxr(v16 - 1, v14));
        }
      }
      result = (uint64_t)v23;
      if (v23)
      {
        v17 = v23 + 2;
        v18 = atomic_load(v23 + 2);
        if (v18 == 1)
        {
          return (*(uint64_t (**)(void))(*(_QWORD *)v23 + 8))();
        }
        else
        {
          do
            v19 = __ldaxr(v17);
          while (__stlxr(v19 - 1, v17));
        }
      }
    }
  }
  return result;
}

_QWORD *std::shared_ptr<KB::InputManagerSpecialization>::operator=[abi:nn180100](_QWORD *a1, uint64_t *a2)
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

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  void **v4;

  v1 = result;
  v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy((uint64_t)(v1 + 44), *((_QWORD **)v1 + 23));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy((uint64_t)(v1 + 38), *((_QWORD **)v1 + 20));
    std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table((uint64_t)(v1 + 18));
    std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table((uint64_t)(v1 + 8));
    v4 = (void **)(v1 + 2);
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](&v4);
    return (unsigned int *)MEMORY[0x234901FD4](v1, 0x10B0C409EA53459);
  }
  else
  {
    do
      v3 = __ldaxr(result);
    while (__stlxr(v3 - 1, result));
  }
  return result;
}

void std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(a1, *(unsigned __int16 **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(uint64_t a1, unsigned __int16 *a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = *(unsigned __int16 **)v2;
      std::__destroy_at[abi:nn180100]<std::pair<KB::ByteString const,WTF::RefPtr<TI::Favonius::LayoutKey>>,0>(v2 + 8);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__destroy_at[abi:nn180100]<std::pair<KB::ByteString const,WTF::RefPtr<TI::Favonius::LayoutKey>>,0>(unsigned __int16 *a1)
{
  uint64_t result;

  result = *((_QWORD *)a1 + 2);
  if (result)
    result = WTF::RefCounted<TI::Favonius::Key>::deref(result);
  if (*a1 >= 0xFu)
  {
    result = *((_QWORD *)a1 + 1);
    if (result)
      JUMPOUT(0x234901FBCLL);
  }
  return result;
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
        MEMORY[0x234901FBC](v3, 0x1000C8077774924);
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x234901FD4);
  }
  do
    v4 = __ldaxr((unsigned int *)result);
  while (__stlxr(v4 - 1, (unsigned int *)result));
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = v2[3];
      if (v4)
        WTF::RefCounted<TI::Favonius::Key>::deref(v4);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__clear[abi:nn180100](v2);
    operator delete(**a1);
  }
}

_QWORD *std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__clear[abi:nn180100](_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t i;
  _QWORD *v4;

  v1 = result;
  v2 = *result;
  for (i = result[1]; i != v2; i -= 8)
  {
    v4 = *(_QWORD **)(i - 8);
    result = v4;
    if (v4)
      result = (_QWORD *)WTF::RefCounted<TI::Favonius::Key>::deref((uint64_t)result);
  }
  v1[1] = v2;
  return result;
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120CE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120CE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234901FD4);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void _GLOBAL__sub_I_TIKeyboardFeatureSpecialization_fr_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x23490204C]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_2322F9000);
  objc_autoreleasePoolPop(v0);
}

KB::InputManagerSpecialization_fr *KB::InputManagerSpecialization_fr::InputManagerSpecialization_fr(KB::InputManagerSpecialization_fr *this, const __CFLocale *a2, const KB::String *a3)
{
  _QWORD *v5;

  v5 = (_QWORD *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  *v5 = &off_250120D18;
  MEMORY[0x234901F20](v5 + 2, a3);
  return this;
}

{
  _QWORD *v5;

  v5 = (_QWORD *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  *v5 = &off_250120D18;
  MEMORY[0x234901F20](v5 + 2, a3);
  return this;
}

unsigned int *KB::InputManagerSpecialization_fr::create_input_segment_filter@<X0>(uint64_t a1@<X0>, TI::Favonius::KeyboardLayout **a2@<X1>, uint64_t *a3@<X8>)
{
  int v5;
  unsigned __int16 *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  TI::Favonius::KeyboardLayout *v11;
  unsigned int *result;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v6 = (unsigned __int16 *)(a1 + 16);
  v5 = *(unsigned __int16 *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = a1 + 32;
  if (!v7)
    v7 = a1 + 32;
  v19 = v7;
  v20 = 0;
  v21 = v5;
  v22 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v19);
  v9 = *v6;
  v10 = *((_QWORD *)v6 + 1);
  if (!v10)
    v10 = v8;
  v15 = v10;
  v16 = v9;
  v17 = v9;
  v18 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v15);
  while (v20 != v16)
  {
    TI::Favonius::KeyboardLayout::key_for_char(*a2);
    if (v23)
    {
      WTF::RefCounted<TI::Favonius::Key>::deref(v23);
      v13 = operator new();
      *(_DWORD *)(v13 + 8) = 1;
      *(_QWORD *)v13 = MEMORY[0x24BEB5A70] + 16;
      result = (unsigned int *)MEMORY[0x234901F20](v13 + 16, v6);
      *a3 = v13;
      return result;
    }
    KB::String::iterator::operator++();
  }
  v11 = *a2;
  *a2 = 0;
  v14 = (unsigned int *)v11;
  KB::InputManagerSpecialization::create_input_segment_filter(a3);
  result = v14;
  if (v14)
    return WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v14);
  return result;
}

void KB::InputManagerSpecialization::create_input_segment_filter(_QWORD *a1@<X8>)
{
  unsigned __int8 v2;
  char *v3;
  unsigned int *v4;
  unsigned int v5;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr, &KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter, &dword_2322F9000);
  }
  if (KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once != -1)
    dispatch_once(&KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once, &__block_literal_global_0);
  v3 = (char *)KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  *a1 = KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  if (v3)
  {
    v4 = (unsigned int *)(v3 + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
  }
}

_QWORD *KB::InputManagerSpecialization_fr::do_create_custom_candidate_filter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &unk_250120E18;
  a1[1] = v2;
  v2[3] = &unk_250120E70;
  result = v2 + 3;
  *a1 = result;
  return result;
}

void KB::InputManagerSpecialization_fr::~InputManagerSpecialization_fr(KB::InputManagerSpecialization_fr *this)
{
  *(_QWORD *)this = &off_250120D18;
  KB::String::~String((KB::InputManagerSpecialization_fr *)((char *)this + 16));
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
}

{
  *(_QWORD *)this = &off_250120D18;
  KB::String::~String((KB::InputManagerSpecialization_fr *)((char *)this + 16));
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
  JUMPOUT(0x234901FD4);
}

uint64_t KB::InputManagerSpecialization::get_does_need_spell_check()
{
  return 0;
}

uint64_t KB::InputManagerSpecialization::get_period_ends_sentence_after_word()
{
  return 1;
}

uint64_t KB::InputManagerSpecialization::get_should_correct_explicitly_shifted_word(KB::InputManagerSpecialization *this)
{
  return 1;
}

uint64_t KB::InputManagerSpecialization::get_should_promote_case_variants_of_top_candidate(KB::InputManagerSpecialization *this)
{
  return 0;
}

uint64_t KB::InputManagerSpecialization::do_capitalize_first_letter(KB::InputManagerSpecialization *this, KB::Word *a2)
{
  return KB::Word::capitalize_first_letter(a2);
}

unsigned int **WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr(unsigned int **a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *a1;
  if (v2)
  {
    v3 = v2 + 2;
    v4 = atomic_load(v2 + 2);
    if (v4 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 8))(v2);
    }
    else
    {
      do
        v5 = __ldaxr(v3);
      while (__stlxr(v5 - 1, v3));
    }
  }
  return a1;
}

void KB::DefaultInputSegmentFilter::~DefaultInputSegmentFilter(KB::DefaultInputSegmentFilter *this)
{
  JUMPOUT(0x234901FD4);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_fr>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120E18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_fr>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120E18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234901FD4);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_fr>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t _GLOBAL__sub_I_TIInputManagerSpecialization_fr_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_2322F9000);
}

const char *KB::CandidateFilter_fr::filter_description(KB::CandidateFilter_fr *this)
{
  return "CandidateFilter_fr";
}

void KB::CandidateFilter_fr::filter_candidates(int a1, uint64_t a2, KB::Candidate *this, uint64_t a4)
{
  int v4;
  KB::String *v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  _QWORD v13[5];
  int v14;

  v4 = *((_DWORD *)this + 792);
  if ((v4 - 3) < 4 || v4 == 1)
  {
    v8 = (KB::String *)KB::Candidate::string(this);
    v9 = KB::String::count(v8);
    v11 = *(uint64_t **)a2;
    v10 = *(uint64_t **)(a2 + 8);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = ___ZNK2KB18CandidateFilter_fr17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke;
    v13[3] = &__block_descriptor_tmp_0;
    v14 = v9;
    v13[4] = a4;
    v12 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v11, v10, (uint64_t)v13);
    std::vector<KB::Candidate>::erase(a2, v12, *(uint64_t **)(a2 + 8));
  }
}

uint64_t *std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t *i;

  if (a1 == a2)
    return a2;
  v5 = a1;
  while (((*(uint64_t (**)(uint64_t, uint64_t *))(a3 + 16))(a3, v5) & 1) == 0)
  {
    v5 += 125;
    if (v5 == a2)
      return a2;
  }
  if (v5 == a2)
    return a2;
  for (i = v5 + 125; i != a2; i += 125)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t *))(a3 + 16))(a3, i) & 1) == 0)
    {
      KB::Candidate::operator=(v5, i);
      v5 += 125;
    }
  }
  return v5;
}

BOOL ___ZNK2KB18CandidateFilter_fr17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke(uint64_t a1, KB::Candidate *this)
{
  KB::String *v4;
  unsigned int v5;
  unsigned int v6;
  KB *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  __int16 v12;
  const char *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (KB::String *)KB::Candidate::string(this);
  v5 = KB::String::count(v4);
  v6 = *(_DWORD *)(a1 + 40);
  if (v5 > v6 && KB::CandidateFilterResources::debug_stream(*(KB::CandidateFilterResources **)(a1 + 32)))
  {
    v7 = (KB *)KB::CandidateFilterResources::debug_stream(*(KB::CandidateFilterResources **)(a1 + 32));
    KB::Candidate::capitalized_string(this);
    v9 = v13;
    if (!v13)
      v9 = (const char *)v14;
    if (v12)
      v10 = v9;
    else
      v10 = "";
    KB::append_format(v7, (__CFString *)"[%s] removed by %s\n", v8, v10, "virtual void KB::CandidateFilter_fr::filter_candidates(CandidateCollection &, const CandidateFilterLookupContext &, const CandidateFilterResources &) const_block_invoke");
    KB::String::~String((KB::String *)&v12);
  }
  return v5 > v6;
}

uint64_t *std::vector<KB::Candidate>::erase(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a3, *(uint64_t **)(a1 + 8), a2);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    if (v7 != v5)
    {
      do
        v7 = MEMORY[0x234901F44](v7 - 1000);
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

void KB::CandidateFilter_fr::~CandidateFilter_fr(KB::CandidateFilter_fr *this)
{
  JUMPOUT(0x234901FD4);
}

uint64_t *KB::Candidate::operator=(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  void **v7;
  __int128 v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;

  v4 = *a1;
  *a1 = *a2;
  *a2 = v4;
  WTF::VectorBuffer<KB::Word,3ul>::swap(a1 + 1, a2 + 1);
  v5 = *(_OWORD *)(a2 + 93);
  v6 = *(_OWORD *)(a2 + 95);
  a1[97] = a2[97];
  *(_OWORD *)(a1 + 93) = v5;
  *(_OWORD *)(a1 + 95) = v6;
  KB::LanguageModelContext::operator=((uint64_t)(a1 + 98), (uint64_t)(a2 + 98));
  KB::String::operator=();
  v7 = (void **)(a1 + 115);
  if (*((char *)a1 + 943) < 0)
    operator delete(*v7);
  v8 = *(_OWORD *)(a2 + 115);
  a1[117] = a2[117];
  *(_OWORD *)v7 = v8;
  *((_BYTE *)a2 + 943) = 0;
  *((_BYTE *)a2 + 920) = 0;
  KB::ByteString::operator=();
  *((_OWORD *)a1 + 60) = *((_OWORD *)a2 + 60);
  v9 = (const void *)a1[122];
  if (v9)
    CFRelease(v9);
  a1[122] = 0;
  v10 = a2[122];
  a2[122] = 0;
  a1[122] = v10;
  v11 = (const void *)a1[123];
  if (v11)
    CFRelease(v11);
  a1[123] = 0;
  v12 = a2[123];
  a2[123] = 0;
  a1[123] = v12;
  *((_DWORD *)a1 + 248) = *((_DWORD *)a2 + 248);
  return a1;
}

uint64_t KB::LanguageModelContext::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100](a1, (__int128 *)a2);
  std::vector<TITokenID>::__move_assign(a1 + 16, (__n128 *)(a2 + 16));
  v4 = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  language_modeling::v1::LinguisticContext::operator=();
  language_modeling::v1::LinguisticContext::operator=();
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  return a1;
}

_QWORD *WTF::VectorBuffer<KB::Word,3ul>::swap(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  char v11;
  uint64_t v12;

  v3 = result + 2;
  v2 = (_QWORD *)*result;
  v4 = a2 + 2;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*result == result + 2)
  {
    if (v5 == v4)
    {
      for (i = 0; i != 720; ++i)
      {
        v11 = *((_BYTE *)v2 + i);
        *((_BYTE *)v2 + i) = *((_BYTE *)v4 + i);
        *((_BYTE *)v4 + i) = v11;
      }
    }
    else
    {
      v6 = 0;
      *result = v5;
      *a2 = v4;
      do
      {
        v7 = *((_BYTE *)v2 + v6);
        *((_BYTE *)v2 + v6) = *((_BYTE *)v4 + v6);
        *((_BYTE *)v4 + v6++) = v7;
      }
      while (v6 != 720);
    }
  }
  else if (v5 == v4)
  {
    v8 = 0;
    *a2 = v2;
    *result = v3;
    do
    {
      v9 = *((_BYTE *)v3 + v8);
      *((_BYTE *)v3 + v8) = *((_BYTE *)v5 + v8);
      *((_BYTE *)v5 + v8++) = v9;
    }
    while (v8 != 720);
  }
  else
  {
    *result = v5;
    *a2 = v2;
  }
  v12 = result[1];
  result[1] = a2[1];
  a2[1] = v12;
  return result;
}

uint64_t std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

__n128 std::vector<TITokenID>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

void std::vector<std::string>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

uint64_t *std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      KB::Candidate::operator=(a3, v4);
      v4 += 125;
      a3 += 125;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

uint64_t _GLOBAL__sub_I_TICandidateFilter_fr_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_2322F9000);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x24BEB54C0]();
}

uint64_t TIInputManager::set_word_medial_punctuation_predicate()
{
  return MEMORY[0x24BEB5658]();
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
}

uint64_t language_modeling::v1::LinguisticContext::operator=()
{
  return MEMORY[0x24BE5ED38]();
}

uint64_t KB::ByteString::operator=()
{
  return MEMORY[0x24BEB56D0]();
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

uint64_t KB::append_format(KB *this, __CFString *a2, const char *a3, ...)
{
  return MEMORY[0x24BEB5710](this, a2, a3);
}

uint64_t KB::compose_diacritics()
{
  return MEMORY[0x24BEB5750]();
}

uint64_t KB::decompose_diacritics()
{
  return MEMORY[0x24BEB5790]();
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x24BEB57E8](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
  MEMORY[0x24BEB57F0](this);
}

uint64_t KB::character_is_word_medial_punctuation(KB *this)
{
  return MEMORY[0x24BEB57F8](this);
}

uint64_t KB::Word::capitalize_first_letter(KB::Word *this)
{
  return MEMORY[0x24BEB5808](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x24BEB5828](this);
}

uint64_t KB::String::iterator::operator++()
{
  return MEMORY[0x24BEB5830]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5850]();
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::String::operator=()
{
  return MEMORY[0x24BEB5870]();
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
  MEMORY[0x24BEB5898](this);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x24BEB5960](this);
}

uint64_t KB::CandidateFilterResources::debug_stream(KB::CandidateFilterResources *this)
{
  return MEMORY[0x24BEB59D0](this);
}

uint64_t KB::String::count(KB::String *this)
{
  return MEMORY[0x24BEB5A00](this);
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A28](this);
}

uint64_t KB::Candidate::string(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A40](this);
}

uint64_t TI::Favonius::KeyboardLayout::key_for_char(TI::Favonius::KeyboardLayout *this)
{
  return MEMORY[0x24BEB5A58](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

uint64_t operator delete[]()
{
  return off_250120B20();
}

void operator delete(void *__p)
{
  off_250120B28(__p);
}

uint64_t operator delete()
{
  return off_250120B30();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250120B38(__sz);
}

uint64_t operator new()
{
  return off_250120B40();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

