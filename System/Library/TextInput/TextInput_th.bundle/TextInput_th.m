void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_th_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234903764]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23234A000);
  objc_autoreleasePoolPop(v0);
}

_QWORD *TIInputManager_th::create_custom_candidate_filter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &unk_25012CB30;
  a1[1] = v2;
  v2[3] = &unk_25012CBD0;
  result = v2 + 3;
  *a1 = result;
  return result;
}

void TIInputManager_th::~TIInputManager_th(TIInputManager_th *this)
{
  TIInputManager::~TIInputManager(this);
  JUMPOUT(0x2349036ECLL);
}

void TIInputManager::filter_pre_lookup_input()
{
  JUMPOUT(0x234903644);
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

void std::__shared_ptr_emplace<KB::CandidateFilter_th>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012CB30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_th>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012CB30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2349036ECLL);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_th>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t _GLOBAL__sub_I_TIInputManager_th_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23234A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerFavonius_th_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234903764]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23234A000);
  objc_autoreleasePoolPop(v0);
}

uint64_t KB::CandidateFilter_th::num_words_overlapping_input(KB::CandidateFilter_th *this, const KB::Candidate *a2, const KB::Candidate *a3)
{
  unsigned int v4;
  uint64_t v5;
  char v6;
  _BYTE v8[32];
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  KB::Candidate::capitalized_string(a3);
  KB::String::String((KB::String *)v8);
  v4 = 0;
  do
  {
    v5 = v4;
    if (*(_QWORD *)a2 <= (unint64_t)v4)
      break;
    KB::String::append();
    v6 = KB::String::starts_with();
    v4 = v5 + 1;
  }
  while ((v6 & 1) != 0);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v9);
  return v5;
}

void KB::CandidateFilter_th::remove_duplicate_candidate_with_the_same_surface_form(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *(*v14)(_QWORD *, _QWORD *);
  void (*v15)(uint64_t);
  _QWORD **v16;
  _QWORD *v17;
  uint64_t v18;
  _BYTE v19[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x4002000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v17 = 0;
  v18 = 0;
  v16 = &v17;
  std::__tree<KB::String>::destroy((uint64_t)&v16, 0);
  v17 = 0;
  v18 = 0;
  v16 = &v17;
  if (*(_QWORD *)a2 != *(_QWORD *)(a2 + 8))
  {
    v6 = (uint64_t **)(v12 + 5);
    KB::Candidate::capitalized_string(*(KB::Candidate **)a2);
    std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(v6, (uint64_t)v19);
    KB::String::~String((KB::String *)v19);
    v7 = *(uint64_t **)(a2 + 8);
    v8 = (uint64_t *)(*(_QWORD *)a2 + 1000);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = ___ZNK2KB18CandidateFilter_th53remove_duplicate_candidate_with_the_same_surface_formERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v10[3] = &unk_25012CB60;
    v10[4] = &v11;
    v10[5] = a4;
    v9 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v8, v7, (uint64_t)v10);
    std::vector<KB::Candidate>::erase(a2, v9, *(uint64_t **)(a2 + 8));
  }
  _Block_object_dispose(&v11, 8);
  std::__tree<KB::String>::destroy((uint64_t)&v16, v17);
}

_QWORD *__Block_byref_object_copy_(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[5] = a2[5];
  v2 = a2 + 6;
  v3 = a2[6];
  result[6] = v3;
  v4 = result + 6;
  v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    a2[5] = v2;
    *v2 = 0;
    a2[7] = 0;
  }
  else
  {
    result[5] = v4;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  std::__tree<KB::String>::destroy(a1 + 40, *(_QWORD **)(a1 + 48));
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

BOOL ___ZNK2KB18CandidateFilter_th53remove_duplicate_candidate_with_the_same_surface_formERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, KB::Candidate *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t **v7;
  KB *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  __int16 v13;
  const char *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40;
  KB::Candidate::capitalized_string(this);
  v5 = std::__tree<KB::String>::find<KB::String>(v4, (uint64_t)&v13);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  KB::String::~String((KB::String *)&v13);
  v7 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  KB::Candidate::capitalized_string(this);
  std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(v7, (uint64_t)&v13);
  KB::String::~String((KB::String *)&v13);
  if (v6 != v5)
  {
    v8 = *(KB **)(a1 + 40);
    if (v8)
    {
      KB::Candidate::capitalized_string(this);
      v10 = v14;
      if (!v14)
        v10 = (const char *)v15;
      if (v13)
        v11 = v10;
      else
        v11 = "";
      KB::append_format(v8, (__CFString *)"[%s] removed by %s\n", v9, v11, "remove_duplicate_candidate_with_the_same_surface_form");
      KB::String::~String((KB::String *)&v13);
    }
  }
  return v6 != v5;
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
        v7 = MEMORY[0x234903674](v7 - 1000);
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

uint64_t *KB::CandidateFilter_th::remove_low_word_score_candidate(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  _QWORD v9[7];
  int v10;

  v6 = *(_QWORD *)a2;
  v5 = *(uint64_t **)(a2 + 8);
  if ((uint64_t *)v6 != v5)
  {
    v7 = *(_DWORD *)(v6 + 752);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZNK2KB18CandidateFilter_th31remove_low_word_score_candidateERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v9[3] = &__block_descriptor_tmp_4;
    v9[4] = result;
    v9[5] = a3;
    v10 = v7;
    v9[6] = a4;
    v8 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>((uint64_t *)(v6 + 1000), v5, (uint64_t)v9);
    return std::vector<KB::Candidate>::erase(a2, v8, *(uint64_t **)(a2 + 8));
  }
  return result;
}

uint64_t ___ZNK2KB18CandidateFilter_th31remove_low_word_score_candidateERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, float *a2)
{
  int v4;
  KB *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  __int16 v10;
  const char *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)a2;
  if ((int)(v4
           - KB::CandidateFilter_th::num_words_overlapping_input((KB::CandidateFilter_th *)a1, (const KB::Candidate *)a2, *(const KB::Candidate **)(a1 + 40))) <= 2&& (float)(*(float *)(a1 + 56) - a2[188]) <= 8.0)
  {
    return 0;
  }
  v5 = *(KB **)(a1 + 48);
  if (v5)
  {
    KB::Candidate::capitalized_string((KB::Candidate *)a2);
    v7 = v11;
    if (!v11)
      v7 = (const char *)v12;
    if (v10)
      v8 = v7;
    else
      v8 = "";
    KB::append_format(v5, (__CFString *)"[%s] removed by %s\n", v6, v8, "remove_low_word_score_candidate");
    KB::String::~String((KB::String *)&v10);
  }
  return 1;
}

void KB::CandidateFilter_th::remove_candidate_having_more_words(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD v9[5];
  int v10;

  v6 = *(uint64_t **)a2;
  v5 = *(uint64_t **)(a2 + 8);
  if (v6 != v5)
  {
    v7 = *v6;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZNK2KB18CandidateFilter_th34remove_candidate_having_more_wordsERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v9[3] = &__block_descriptor_tmp_6;
    v10 = v7;
    v9[4] = a4;
    v8 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v6 + 125, v5, (uint64_t)v9);
    std::vector<KB::Candidate>::erase(a2, v8, *(uint64_t **)(a2 + 8));
  }
}

BOOL ___ZNK2KB18CandidateFilter_th34remove_candidate_having_more_wordsERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, KB::Candidate *this)
{
  unint64_t v2;
  unint64_t v3;
  KB *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  __int16 v9;
  const char *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(int *)(a1 + 40);
  v3 = *(_QWORD *)this;
  if (*(_QWORD *)this > v2)
  {
    v4 = *(KB **)(a1 + 32);
    if (v4)
    {
      KB::Candidate::capitalized_string(this);
      v6 = v10;
      if (!v10)
        v6 = (const char *)v11;
      if (v9)
        v7 = v6;
      else
        v7 = "";
      KB::append_format(v4, (__CFString *)"[%s] removed by %s\n", v5, v7, "remove_candidate_having_more_words");
      KB::String::~String((KB::String *)&v9);
    }
  }
  return v3 > v2;
}

const char *KB::CandidateFilter_th::filter_description(KB::CandidateFilter_th *this)
{
  return "CandidateFilter_th:";
}

void KB::CandidateFilter_th::filter_candidates(uint64_t *a1, uint64_t a2, uint64_t a3, KB::CandidateFilterResources *this)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = KB::CandidateFilterResources::debug_stream(this);
  KB::CandidateFilter_th::remove_duplicate_candidate_with_the_same_surface_form(v8, a2, v9, v8);
  v10 = KB::CandidateFilterResources::debug_stream(this);
  KB::CandidateFilter_th::remove_low_word_score_candidate(a1, a2, a3, v10);
  v11 = KB::CandidateFilterResources::debug_stream(this);
  KB::CandidateFilter_th::remove_candidate_having_more_words(v11, a2, v12, v11);
}

void KB::CandidateFilter_th::~CandidateFilter_th(KB::CandidateFilter_th *this)
{
  JUMPOUT(0x2349036ECLL);
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

void std::__tree<KB::String>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<KB::String>::destroy(a1, *a2);
    std::__tree<KB::String>::destroy(a1, a2[1]);
    KB::String::~String((KB::String *)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t *std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(uint64_t **a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;
  uint64_t v7[2];
  char v8;
  uint64_t v9;

  v3 = (uint64_t **)std::__tree<KB::String>::__find_equal<KB::String>((uint64_t)a1, &v9, a2);
  v4 = *v3;
  if (!*v3)
  {
    v5 = v3;
    v4 = (uint64_t *)operator new(0x40uLL);
    v7[1] = (uint64_t)(a1 + 1);
    KB::String::String();
    v8 = 1;
    std::__tree<KB::String>::__insert_node_at(a1, v9, v5, v4);
    v7[0] = 0;
    std::unique_ptr<std::__tree_node<KB::String,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<KB::String,void *>>>>::reset[abi:nn180100](v7, 0);
  }
  return v4;
}

_QWORD *std::__tree<KB::String>::__find_equal<KB::String>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  _QWORD *v8;
  const char *v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    if (*(_QWORD *)(a3 + 8))
      v6 = *(const char **)(a3 + 8);
    else
      v6 = (const char *)(a3 + 16);
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = (_QWORD *)v4[5];
        v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_15;
      }
      if ((strcmp(v9, v6) & 0x80000000) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_15:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<KB::String>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<KB::String,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<KB::String,void *>>>>::reset[abi:nn180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
      KB::String::~String((KB::String *)(v2 + 32));
    operator delete((void *)v2);
  }
}

uint64_t std::__tree<KB::String>::find<KB::String>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;

  v3 = a1 + 8;
  v4 = std::__tree<KB::String>::__lower_bound<KB::String>(a1, a2, *(_QWORD *)(a1 + 8), a1 + 8);
  if (v3 == v4)
    return v3;
  v5 = v4;
  v6 = *(_QWORD *)(a2 + 8) ? *(const char **)(a2 + 8) : (const char *)(a2 + 16);
  v7 = *(_QWORD *)(v5 + 40) ? *(const char **)(v5 + 40) : (const char *)(v5 + 48);
  if (strcmp(v6, v7) < 0)
    return v3;
  return v5;
}

uint64_t std::__tree<KB::String>::__lower_bound<KB::String>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t *v9;

  if (a3)
  {
    v5 = a3;
    if (*(_QWORD *)(a2 + 8))
      v6 = *(const char **)(a2 + 8);
    else
      v6 = (const char *)(a2 + 16);
    do
    {
      if (*(_QWORD *)(v5 + 40))
        v7 = *(const char **)(v5 + 40);
      else
        v7 = (const char *)(v5 + 48);
      v8 = strcmp(v7, v6);
      v9 = (uint64_t *)(v5 + 8);
      if (v8 >= 0)
      {
        v9 = (uint64_t *)v5;
        a4 = v5;
      }
      v5 = *v9;
    }
    while (*v9);
  }
  return a4;
}

uint64_t _GLOBAL__sub_I_TICandidateFilter_th_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23234A000);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MecabraCandidateGetAnalysisString()
{
  return MEMORY[0x24BEDC640]();
}

uint64_t MecabraCandidateGetWordCount()
{
  return MEMORY[0x24BEDC668]();
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x24BEB54A0]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x24BEB54E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t TIInputManager::set_input_index(TIInputManager *this)
{
  return MEMORY[0x24BEB55E8](this);
}

uint64_t TIInputManager::set_search_algorithm()
{
  return MEMORY[0x24BEB5608]();
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

uint64_t KB::append_format(KB *this, __CFString *a2, const char *a3, ...)
{
  return MEMORY[0x24BEB5710](this, a2, a3);
}

uint64_t KB::String::append()
{
  return MEMORY[0x24BEB5818]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5840]();
}

{
  return MEMORY[0x24BEB5850]();
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x24BEB5860](this);
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

uint64_t TIInputManager::LockedInput::locked_length(TIInputManager::LockedInput *this)
{
  return MEMORY[0x24BEB5940](this);
}

uint64_t TIInputManager::input_substring(TIInputManager *this)
{
  return MEMORY[0x24BEB5968](this);
}

uint64_t KB::CandidateFilterResources::debug_stream(KB::CandidateFilterResources *this)
{
  return MEMORY[0x24BEB59D0](this);
}

uint64_t KB::String::starts_with()
{
  return MEMORY[0x24BEB59E8]();
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A28](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void operator delete(void *__p)
{
  off_25012C920(__p);
}

uint64_t operator delete()
{
  return off_25012C928();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25012C930(__sz);
}

uint64_t operator new()
{
  return off_25012C938();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

