void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

uint64_t KB::GurmukhiInputSegmentFilter::allows_composed_substitution(KB::GurmukhiInputSegmentFilter *this, int a2, int a3, int a4)
{
  BOOL v4;
  int v5;

  if (a3 == 2675)
  {
    if ((a2 != 2569 || a4 != 2625) && (a2 != 2570 || a4 != 2626))
    {
      v4 = a2 == 2579;
      v5 = 2635;
      return v4 && a4 == v5;
    }
    return 1;
  }
  if (a3 == 2674)
  {
    if ((a2 != 2567 || a4 != 2623) && (a2 != 2568 || a4 != 2624))
    {
      v4 = a2 == 2575;
      v5 = 2631;
      return v4 && a4 == v5;
    }
    return 1;
  }
  if (a3 != 2565)
    return KB::InputSegmentFilter::allows_composed_substitution(this);
  if (a2 == 2576 && a4 == 2632 || a2 == 2580 && a4 == 2636)
    return 1;
  v4 = a2 == 2566;
  v5 = 2622;
  return v4 && a4 == v5;
}

BOOL KB::GurmukhiInputSegmentFilter::character_is_letter_modifier(KB::GurmukhiInputSegmentFilter *this, UChar32 c)
{
  _BOOL8 result;

  result = 1;
  if (c <= 900)
  {
    if (((c - 168) > 0xC || ((1 << (c + 88)) & 0x1081) == 0) && c != 730 && c != 732)
      return u_charType(c) == 4;
  }
  else if (((c - 2622) > 0xE || ((1 << (c - 62)) & 0x661F) == 0) && c != 901)
  {
    return u_charType(c) == 4;
  }
  return result;
}

uint64_t KB::GurmukhiInputSegmentFilter::character_is_precomposed_diacritic_letter(KB::GurmukhiInputSegmentFilter *this, KB *a2)
{
  if (((_DWORD)a2 - 2566) < 0xF && ((0x661Fu >> ((_BYTE)a2 - 6)) & 1) != 0)
    return 1;
  else
    return KB::character_is_precomposed_diacritic_letter(a2);
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

void KB::GurmukhiInputSegmentFilter::~GurmukhiInputSegmentFilter(KB::GurmukhiInputSegmentFilter *this)
{
  JUMPOUT(0x2349030A0);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012B878;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012B878;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2349030A0);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void KB::InputManagerSpecialization_pa::~InputManagerSpecialization_pa(KB::InputManagerSpecialization_pa *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
  JUMPOUT(0x2349030A0);
}

_QWORD *KB::InputManagerSpecialization_pa::create_input_segment_filter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_25012B820;
  result[1] = 0;
  *((_DWORD *)result + 2) = 1;
  *a1 = result;
  return result;
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

void KB::InputManagerSpecialization::do_create_custom_candidate_filter(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
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
    return (unsigned int *)MEMORY[0x2349030A0](v1, 0x10B0C409EA53459);
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
      JUMPOUT(0x234903088);
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
        MEMORY[0x234903088](v3, 0x1000C8077774924);
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x2349030A0);
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

void _GLOBAL__sub_I_TIKeyboardInputManager_pa_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2349030E8]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23233F000);
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

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x24BEB5650](this);
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

uint64_t KB::lower_character(KB *this, uint64_t a2, const __CFLocale *a3)
{
  return MEMORY[0x24BEB5720](this, a2, a3);
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x24BEB57E8](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
  MEMORY[0x24BEB57F0](this);
}

uint64_t KB::character_is_precomposed_diacritic_letter(KB *this)
{
  return MEMORY[0x24BEB5800](this);
}

uint64_t KB::Word::capitalize_first_letter(KB::Word *this)
{
  return MEMORY[0x24BEB5808](this);
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

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x24BEB5960](this);
}

uint64_t KB::InputSegmentFilter::allows_composed_substitution(KB::InputSegmentFilter *this)
{
  return MEMORY[0x24BEB59B8](this);
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
  return off_25012B750();
}

void operator delete(void *__p)
{
  off_25012B758(__p);
}

uint64_t operator delete()
{
  return off_25012B760();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25012B768(__sz);
}

uint64_t operator new()
{
  return off_25012B770();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x24BEDBF50](*(_QWORD *)&c);
}

