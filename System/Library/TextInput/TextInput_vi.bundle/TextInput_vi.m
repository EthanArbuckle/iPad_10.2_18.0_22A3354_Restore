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

TIInputManager *TIInputManager_vi::TIInputManager_vi(TIInputManager *a1, int a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;

  TIInputManager::TIInputManager(a1);
  *(_QWORD *)v6 = &off_25012DC68;
  *(_DWORD *)(v6 + 708) = a2;
  std::__function::__value_func<KB::String ()(KB::String const&)>::__value_func[abi:nn180100](v6 + 712, a3);
  v7 = operator new(0x20uLL);
  v7[2] = 0;
  *v7 = &unk_25012DA60;
  v7[1] = 0;
  *((_QWORD *)a1 + 94) = v7;
  v7[3] = &unk_25012DC38;
  *((_QWORD *)a1 + 93) = v7 + 3;
  return a1;
}

uint64_t std::__function::__value_func<KB::String ()(KB::String const&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__shared_ptr_emplace<KB::CandidateFilter_vi>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DA60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_vi>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DA60;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234903C20);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_vi>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DA98;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DA98;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234903C20);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void KB::InputManagerSpecialization_vi::~InputManagerSpecialization_vi(KB::InputManagerSpecialization_vi *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
  JUMPOUT(0x234903C20);
}

void KB::InputManagerSpecialization_vi::create_input_segment_filter(_QWORD *a1@<X8>)
{
  unsigned __int8 v2;
  char *v3;
  unsigned int *v4;
  unsigned int v5;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr, &KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter, &dword_232353000);
  }
  if (KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once != -1)
    dispatch_once(&KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once, &__block_literal_global_0);
  v3 = (char *)KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter;
  *a1 = KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter;
  if (v3)
  {
    v4 = (unsigned int *)(v3 + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
  }
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

_QWORD *KB::InputManagerSpecialization_vi::do_create_custom_candidate_filter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &unk_25012DA60;
  a1[1] = v2;
  v2[3] = &unk_25012DC38;
  result = v2 + 3;
  *a1 = result;
  return result;
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

void KB::NullInputSegmentFilter::~NullInputSegmentFilter(KB::NullInputSegmentFilter *this)
{
  JUMPOUT(0x234903C20);
}

uint64_t KB::NullInputSegmentFilter::word_is_acceptable_for_input()
{
  return 1;
}

uint64_t KB::NullInputSegmentFilter::letter_combines_with_selective_modifier(KB::NullInputSegmentFilter *this)
{
  return 1;
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
    return (unsigned int *)MEMORY[0x234903C20](v1, 0x10B0C409EA53459);
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
      JUMPOUT(0x234903C08);
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
        MEMORY[0x234903C08](v3, 0x1000C8077774924);
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x234903C20);
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

void _GLOBAL__sub_I_TIKeyboardInputManager_vi_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234903CC8]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232353000);
  objc_autoreleasePoolPop(v0);
}

void **std::vector<KB::String>::~vector[abi:nn180100](void **a1)
{
  void **v3;

  v3 = a1;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v3);
  return a1;
}

const char *KB::CandidateFilter_vi::filter_description(KB::CandidateFilter_vi *this)
{
  return "CandidateFilter_vi:";
}

uint64_t *KB::CandidateFilter_vi::filter_candidates(uint64_t a1, uint64_t a2)
{
  uint64_t *result;
  uint64_t *v4;
  uint64_t *v5;

  result = *(uint64_t **)a2;
  v4 = *(uint64_t **)(a2 + 8);
  if (result != v4)
  {
    v5 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(result, v4, (uint64_t)&__block_literal_global_1);
    return std::vector<KB::Candidate>::erase(a2, v5, *(uint64_t **)(a2 + 8));
  }
  return result;
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

uint64_t ___ZNK2KB18CandidateFilter_vi17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _BYTE v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = WORDS_TO_FILTER;
  v3 = qword_255FB6410;
  if (WORDS_TO_FILTER == qword_255FB6410)
    return 0;
  do
  {
    MEMORY[0x234903B54](v7, v2);
    v5 = KB::String::equal(*(KB::String **)(a2 + 8), (const KB::String *)v7);
    KB::String::~String((KB::String *)v7);
    if ((v5 & 1) != 0)
      break;
    v2 += 32;
  }
  while (v2 != v3);
  return v5;
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
        v7 = MEMORY[0x234903B78](v7 - 1000);
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

void KB::CandidateFilter_vi::~CandidateFilter_vi(KB::CandidateFilter_vi *this)
{
  JUMPOUT(0x234903C20);
}

void std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        KB::String::~String((KB::String *)(v4 - 32));
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
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

uint64_t _GLOBAL__sub_I_TICandidateFilter_vi_cpp()
{
  uint64_t v0;
  _BYTE v2[32];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232353000);
  MEMORY[0x234903B48](v2, "ddi");
  WORDS_TO_FILTER = (uint64_t)operator new(0x20uLL);
  qword_255FB6410 = WORDS_TO_FILTER;
  v0 = WORDS_TO_FILTER + 32;
  qword_255FB6418 = WORDS_TO_FILTER + 32;
  MEMORY[0x234903B54]();
  qword_255FB6410 = v0;
  KB::String::~String((KB::String *)v2);
  return __cxa_atexit((void (*)(void *))std::vector<KB::String>::~vector[abi:nn180100], &WORDS_TO_FILTER, &dword_232353000);
}

void TIInputManager_vi::create_quality_filter(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  __int128 v13;
  int64x2_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  int64x2_t v21;
  _QWORD v22[2];
  void *__p[4];
  std::__shared_weak_count *v24;
  int64x2_t *v25;
  int64x2_t v26;
  uint64_t v27;
  _QWORD *v28;

  std::vector<KB::FilterFlag>::vector(__p, a2);
  TIInputManager::create_quality_filter();
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v21 = 0uLL;
  v22[0] = 0;
  v28 = v22;
  v5 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>((uint64_t)v22, 1uLL);
  *v5 = __p[3];
  v7 = v24;
  v5[1] = v24;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = (_QWORD *)v21.i64[1];
  v11 = (_QWORD *)v21.i64[0];
  if (v21.i64[1] == v21.i64[0])
  {
    v14 = vdupq_n_s64(v21.u64[1]);
    v12 = v5;
  }
  else
  {
    v12 = v5;
    do
    {
      v13 = *((_OWORD *)v10 - 1);
      v10 -= 2;
      *((_OWORD *)v12 - 1) = v13;
      v12 -= 2;
      *v10 = 0;
      v10[1] = 0;
    }
    while (v10 != v11);
    v14 = v21;
  }
  v15 = (char *)(v5 + 2);
  v21.i64[0] = (uint64_t)v12;
  v26 = v14;
  v16 = v22[0];
  v22[0] = &v5[2 * v6];
  v27 = v16;
  v25 = (int64x2_t *)v14.i64[0];
  std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer((uint64_t)&v25);
  v21.i64[1] = (uint64_t)v15;
  std::vector<std::shared_ptr<KB::CandidateFilter>>::push_back[abi:nn180100]((char **)&v21, (__int128 *)(a1 + 744));
  v17 = operator new(0x38uLL);
  v17[2] = 0;
  *v17 = &unk_25012DCD8;
  v17[1] = 0;
  *a3 = KB::CompositeCandidateFilter::CompositeCandidateFilter();
  a3[1] = (uint64_t)v17;
  v25 = &v21;
  std::vector<std::shared_ptr<KB::CandidateFilter>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v25);
  v18 = v24;
  if (v24)
  {
    v19 = (unint64_t *)&v24->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

uint64_t std::vector<std::shared_ptr<KB::CandidateFilter>>::push_back[abi:nn180100](char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v12 = (v7 - *a1) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      abort();
    v14 = v5 - (_QWORD)*a1;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v31 = result;
    v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>(result, v15);
    v18 = &v16[16 * v12];
    v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }
    else
    {
      v24 = &v16[16 * v12];
      do
      {
        v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
      }
      while (v22 != v23);
      v26 = *(int64x2_t *)a1;
    }
    v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    v28 = v26.i64[0];
    result = std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer((uint64_t)&v28);
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)a2;
    v8 = *((_QWORD *)a2 + 1);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = v7 + 16;
  }
  a1[1] = v11;
  return result;
}

void TIInputManager_vi::filter_pre_lookup_input(TIInputManager_vi *this@<X0>, const KB::String *a2@<X1>, const KB::String *a3@<X8>)
{
  int v5;
  _BYTE v6[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x234903B54](a3, a2);
  v5 = *((_DWORD *)this + 177);
  if (v5 == 3)
  {
    TIInputManager_vi::viqr_filter_pre_lookup_input(a3, (uint64_t)v6);
  }
  else
  {
    if (v5 != 2)
      return;
    TIInputManager_vi::vni_filter_pre_lookup_input(a3, (uint64_t)v6);
  }
  KB::String::operator=();
  KB::String::~String((KB::String *)v6);
}

void TIInputManager_vi::vni_filter_pre_lookup_input(const KB::String *a1@<X1>, uint64_t a2@<X8>)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void **i;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *__p[2];
  unsigned __int8 v20;

  v4 = (char *)*((_QWORD *)a1 + 1);
  if (!v4)
    v4 = (char *)a1 + 16;
  if (*(_WORD *)a1)
    v5 = v4;
  else
    v5 = (char *)&unk_23235802D;
  std::string::basic_string[abi:nn180100]<0>(__p, v5);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = v20;
  if ((v20 & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  if ((v20 & 0x80) != 0)
    goto LABEL_11;
LABEL_10:
  for (i = (void **)((char *)__p + v10); v11 != i; i = (void **)((char *)__p[0] + (unint64_t)__p[1]))
  {
    v13 = *(char *)v11;
    if (v13 > 84)
    {
      if (v13 > 100)
      {
        switch(v13)
        {
          case 'e':
LABEL_26:
            v6 = 101;
            break;
          case 'o':
LABEL_27:
            v6 = 111;
LABEL_28:
            v7 = 119;
            break;
          case 'u':
            goto LABEL_28;
        }
      }
      else
      {
        switch(v13)
        {
          case 'U':
            goto LABEL_28;
          case 'a':
LABEL_25:
            v6 = 97;
            v8 = 119;
            break;
          case 'd':
LABEL_20:
            v9 = 100;
            break;
        }
      }
    }
    else
    {
      v14 = v13 - 49;
      v15 = 0;
      LOBYTE(v13) = 115;
      v16 = v7;
      v17 = v8;
      v18 = v9;
      switch(v14)
      {
        case 0:
          goto LABEL_36;
        case 1:
          LOBYTE(v13) = 102;
          goto LABEL_36;
        case 2:
          LOBYTE(v13) = 114;
          goto LABEL_36;
        case 3:
          LOBYTE(v13) = 120;
          goto LABEL_36;
        case 4:
          LOBYTE(v13) = 106;
          goto LABEL_36;
        case 5:
          goto LABEL_35;
        case 6:
          v16 = 0;
          v15 = v6;
          v17 = v8;
          v18 = v9;
          LODWORD(v6) = v7;
          goto LABEL_35;
        case 7:
          v17 = 0;
          v15 = v6;
          v16 = v7;
          v18 = v9;
          LODWORD(v6) = v8;
          goto LABEL_35;
        case 8:
          v18 = 0;
          v15 = v6;
          v16 = v7;
          v17 = v8;
          LODWORD(v6) = v9;
LABEL_35:
          v13 = v6;
          v9 = v18;
          v8 = v17;
          v7 = v16;
          v6 = v15;
          if (v13)
          {
LABEL_36:
            *(_BYTE *)v11 = v13;
            v10 = v20;
          }
          break;
        case 16:
          goto LABEL_25;
        case 19:
          goto LABEL_20;
        case 20:
          goto LABEL_26;
        case 30:
          goto LABEL_27;
        default:
          break;
      }
    }
    v11 = (void **)((char *)v11 + 1);
    if ((v10 & 0x80) == 0)
      goto LABEL_10;
LABEL_11:
    ;
  }
  MEMORY[0x234903B48](a2);
  if ((char)v20 < 0)
    operator delete(__p[0]);
}

void TIInputManager_vi::viqr_filter_pre_lookup_input(const KB::String *a1@<X1>, uint64_t a2@<X8>)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void **i;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[2];
  unsigned __int8 v18;

  v4 = (char *)*((_QWORD *)a1 + 1);
  if (!v4)
    v4 = (char *)a1 + 16;
  if (*(_WORD *)a1)
    v5 = v4;
  else
    v5 = (char *)&unk_23235802D;
  std::string::basic_string[abi:nn180100]<0>(__p, v5);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = v18;
  if ((v18 & 0x80u) == 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if ((v18 & 0x80) != 0)
    goto LABEL_11;
LABEL_10:
  for (i = (void **)((char *)__p + v9); v10 != i; i = (void **)((char *)__p[0] + (unint64_t)__p[1]))
  {
    v12 = *(char *)v10;
    if (v12 > 84)
    {
      if (v12 > 110)
      {
        if (v12 == 111)
          goto LABEL_32;
        if (v12 == 117)
          goto LABEL_35;
        if (v12 != 126)
          goto LABEL_40;
        LOBYTE(v12) = 120;
        goto LABEL_39;
      }
      switch(*(_BYTE *)v10)
      {
        case '^':
          v15 = 0;
          v14 = v6;
          v16 = v8;
          LODWORD(v6) = v7;
LABEL_20:
          v12 = v6;
          v8 = v16;
          v7 = v15;
          v6 = v14;
          if (v12)
            goto LABEL_39;
          break;
        case '_':
        case 'b':
        case 'c':
        case 'd':
          break;
          LOBYTE(v12) = 102;
          goto LABEL_39;
        case 'a':
          goto LABEL_25;
        case 'e':
          goto LABEL_33;
        default:
          if (v12 == 85)
            goto LABEL_35;
          break;
      }
    }
    else if (v12 > 62)
    {
      if (v12 > 68)
      {
        if (v12 == 69)
        {
LABEL_33:
          v7 = 101;
          goto LABEL_40;
        }
        if (v12 != 79)
          goto LABEL_40;
LABEL_32:
        v7 = 111;
LABEL_35:
        v8 = 119;
        goto LABEL_40;
      }
      if (v12 == 63)
      {
        LOBYTE(v12) = 114;
LABEL_39:
        *(_BYTE *)v10 = v12;
        v9 = v18;
        goto LABEL_40;
      }
      if (v12 == 65)
      {
LABEL_25:
        v6 = 119;
        v7 = 97;
      }
    }
    else
    {
      v13 = v12 - 39;
      v14 = 0;
      LOBYTE(v12) = 115;
      v15 = v7;
      v16 = v8;
      switch(v13)
      {
        case 0:
          goto LABEL_39;
        case 1:
          goto LABEL_20;
        case 4:
          v16 = 0;
          v14 = v6;
          v15 = v7;
          LODWORD(v6) = v8;
          goto LABEL_20;
        case 7:
          LOBYTE(v12) = 106;
          goto LABEL_39;
        default:
          break;
      }
    }
LABEL_40:
    v10 = (void **)((char *)v10 + 1);
    if ((v9 & 0x80) == 0)
      goto LABEL_10;
LABEL_11:
    ;
  }
  MEMORY[0x234903B48](a2);
  if ((char)v18 < 0)
    operator delete(__p[0]);
}

uint64_t TIInputManager_vi::should_accept_candidate_for_mixed_case_input(uint64_t a1, KB::Candidate *this, const KB::String *a3, const KB::String *a4)
{
  uint64_t v8;
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (KB::Candidate::has_from_supplemental_lexicon(this))
    return KB::CollatorWrapper::sortkey_equal_strings((KB::CollatorWrapper *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 72), a3, a4);
  KB::Word::capitalized_string(a3);
  v8 = KB::String::starts_with();
  KB::String::~String((KB::String *)v9);
  return v8;
}

void TIInputManager_vi::~TIInputManager_vi(TIInputManager_vi *this)
{
  TIInputManager_vi::~TIInputManager_vi(this);
  JUMPOUT(0x234903C20);
}

{
  TIInputManager_vi *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_25012DC68;
  std::shared_ptr<KB::CandidateFilter>::~shared_ptr[abi:nn180100]((uint64_t)this + 744);
  v2 = (TIInputManager_vi *)*((_QWORD *)this + 92);
  if (v2 == (TIInputManager_vi *)((char *)this + 712))
  {
    v3 = 4;
    v2 = (TIInputManager_vi *)((char *)this + 712);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
  }
  TIInputManager::~TIInputManager(this);
}

void TIInputManager_vi::internal_string_to_external(TIInputManager_vi *this@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v4 = *((_QWORD *)this + 92);
  if (v4)
  {
    (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v4 + 48))(v5);
    KB::String::String();
    a2[32] = 1;
    KB::String::~String((KB::String *)v5);
  }
  else
  {
    *a2 = 0;
    a2[32] = 0;
  }
}

void TIInputManager::external_string_to_internal(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager_vi::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager_vi *this)
{
  return 1;
}

_QWORD *std::vector<KB::FilterFlag>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<KB::FilterFlag>::__vallocate[abi:nn180100](a1, v5 >> 3);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<KB::FilterFlag>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::FilterFlag>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<KB::FilterFlag>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::shared_ptr<KB::CandidateFilter>::~shared_ptr[abi:nn180100](i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DCD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012DCD8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x234903C20);
}

uint64_t std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::vector<std::shared_ptr<KB::CandidateFilter>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::shared_ptr<KB::CandidateFilter>::~shared_ptr[abi:nn180100](v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

uint64_t std::shared_ptr<KB::CandidateFilter>::~shared_ptr[abi:nn180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t _GLOBAL__sub_I_TIInputManager_vi_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232353000);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t TIBundleForInputMode()
{
  return MEMORY[0x24BEB4EF8]();
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x24BEB54C0]();
}

uint64_t UnikeyCleanup()
{
  return MEMORY[0x24BEB5590]();
}

uint64_t UnikeyFilter()
{
  return MEMORY[0x24BEB5598]();
}

uint64_t UnikeyGetOptions()
{
  return MEMORY[0x24BEB55A0]();
}

uint64_t UnikeyResetBuf()
{
  return MEMORY[0x24BEB55A8]();
}

uint64_t UnikeySetCapsState()
{
  return MEMORY[0x24BEB55B0]();
}

uint64_t UnikeySetInputMethod()
{
  return MEMORY[0x24BEB55B8]();
}

uint64_t UnikeySetOptions()
{
  return MEMORY[0x24BEB55C0]();
}

uint64_t UnikeySetup()
{
  return MEMORY[0x24BEB55C8]();
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x24BEB5650](this);
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x24BEB5670]();
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5690](this);
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5698](this);
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

uint64_t KB::CompositeCandidateFilter::CompositeCandidateFilter()
{
  return MEMORY[0x24BEB57D0]();
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x24BEB57E8](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
  MEMORY[0x24BEB57F0](this);
}

uint64_t KB::Word::capitalize_first_letter(KB::Word *this)
{
  return MEMORY[0x24BEB5808](this);
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5840]();
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x24BEB5848](this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5850](this, a2);
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

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x24BEB5948](this);
}

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x24BEB5960](this);
}

uint64_t TIInputManager::create_quality_filter()
{
  return MEMORY[0x24BEB5970]();
}

uint64_t KB::CollatorWrapper::sortkey_equal_strings(KB::CollatorWrapper *this, const KB::String *a2, const KB::String *a3)
{
  return MEMORY[0x24BEB59A8](this, a2, a3);
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return MEMORY[0x24BEB59E0](this);
}

uint64_t KB::String::starts_with()
{
  return MEMORY[0x24BEB59E8]();
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5A08](this, a2);
}

uint64_t KB::Candidate::has_from_supplemental_lexicon(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A38](this);
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
  return off_25012D7E0();
}

void operator delete(void *__p)
{
  off_25012D7E8(__p);
}

uint64_t operator delete()
{
  return off_25012D7F0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25012D7F8(__sz);
}

uint64_t operator new()
{
  return off_25012D800();
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

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x24BEDBF60](*(_QWORD *)&code);
}

uint64_t utrans_close()
{
  return MEMORY[0x24BEDC358]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x24BEDC360]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x24BEDC368]();
}

